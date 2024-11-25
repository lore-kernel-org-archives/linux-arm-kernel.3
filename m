Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E80FD58D5A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnhSSqL8zGEfDJPc8lkG7YTe0QJDcswkvUICNkWf/Pc=; b=Un3C3JuM6ESEvrVMbkiP0k1Usf
	2w46Vc/j4OPG51KGcsYxkpH15LqPumM25GuNHt2nuOD4VpW3yUGiEpK+ataepGEPRjqucEbdAxo2V
	RS5Nrd9KGc4JkqAx8sc57d3s6BFrCb7m1yqs/ty/HSuDmZGeKSf+uDBTBmiaGNJglpvV0rZTLXMC0
	qcHuYnAvFMZPL+z+enPIi42X3J0pJdxMIRBsNzG1vWbhijIiNORtANdhpQDetnRtp73GrtQOL8R9a
	LVjE8H4rXCsMd725J6FvRqRru7LUuki8COlISzamLEFfAywMzu2mgLG9OqIv4em/Y34NLeeKemSpM
	tqnWD7eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFaa5-00000008NGZ-1OkG;
	Mon, 25 Nov 2024 15:00:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFaYC-00000008MpL-0RzY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 14:58:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A56EE1756;
	Mon, 25 Nov 2024 06:59:25 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 532813F66E;
	Mon, 25 Nov 2024 06:58:53 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	sudeep.holla@arm.com,
	guohanjun@huawei.com,
	gshan@redhat.com,
	prarit@redhat.com,
	Jonathan.Cameron@huawei.com,
	dwmw@amazon.co.uk,
	ardb@kernel.org,
	hagarhem@amazon.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 1/2] arm64/acpi: panic when failed to init acpi table with acpi=force option
Date: Mon, 25 Nov 2024 14:58:47 +0000
Message-Id: <20241125145848.506347-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125145848.506347-1-yeoreum.yun@arm.com>
References: <20241125145848.506347-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_065856_186928_509F103B 
X-CRM114-Status: GOOD (  10.45  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

when the acpi=force option is used,
the system does not fall back to the device tree (DT).
If it fails to initialize the ACPI table, it cannot proceed further.
In such cases, the system should invoke panic() to avoid contradicting
the user's explicit intent, as failing or
proceeding with unintended behavior would violate their wishes.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kernel/acpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index e6f66491fbe9..efdf24ed5c3e 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -225,6 +225,8 @@ void __init acpi_boot_table_init(void)
 		pr_err("Failed to init ACPI tables\n");
 		if (!param_acpi_force)
 			disable_acpi();
+		else
+			panic("Failed to boot with ACPI tables\n");
 	}

 done:
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


