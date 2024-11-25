Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C873D58D6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 17:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nCZKl1+at3bfhf7tcYFIBr856K5RcOMPy0ZPf9fo90=; b=GhXGpsMYbkBw0mAzvOl+3TMCDK
	yHkedM73p8l68a52SHGxStf1SWdVYXPJDjj25z/Qd4AlWki0RZyNVEqSY9zXDB72zKrN/RGMWbVm8
	4Cv4vWWvN58gzo4BZD0YIqDXnT0bgPkBCMkd6ksCH7QqauZ1MCHrN4FViMAbIaAlZ+e55XjT8y2pC
	pam+16k3aRJWJgnSh9ndvOW4FGIkb87nwKdGoZnwqrqWfiI9VPjlOXUhjKJMTlJHYF5uj0IX0NsOl
	vwlZDARTBT6e6JgsPY3PsNSCgJk9nlqrQ2UAXEvtqxgar//y4DA2jgck3pSUXgYYtx794SibAr3Oe
	7qHYWrvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcb3-00000008iYQ-3uXY;
	Mon, 25 Nov 2024 17:10:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcZC-00000008iBF-0qyi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 17:08:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 868701756;
	Mon, 25 Nov 2024 09:08:35 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 73E8E3F58B;
	Mon, 25 Nov 2024 09:08:03 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: ardb@kernel.org,
	broonie@kernel.org,
	sami.mujawar@arm.com,
	sudeep.holla@arm.com,
	pierre.gondois@arm.com,
	hagarhem@amazon.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	guohanjun@huawei.com,
	Jonathan.Cameron@huawei.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 1/2] arm64/acpi: panic when failed to init acpi table with acpi=force option
Date: Mon, 25 Nov 2024 17:07:57 +0000
Message-Id: <20241125170758.518943-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125170758.518943-1-yeoreum.yun@arm.com>
References: <20241125170758.518943-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_090806_284909_891B91E3 
X-CRM114-Status: GOOD (  10.69  )
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
Reviewed-by: Mark Brown <broonie@kernel.org>
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


