Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32054C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 17:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvpcgGVmmfdX80gEFHqTe4ssrSgKgn6kF5ZLPPIiVCg=; b=04WrCIlK/fDn6fYtoTixcz2uKG
	v1ig/noenmcLAR4xPn3qT0dJz07cn5FVWfwfV3elbDHVoMDfWnd8y/yGnjNmKrmCdyA9WV5OvmzUq
	CAufB4Siu/Y3UItE/1V81ITvUlyRwSfXrpjvvDBbXg1VycuD/U9z8YLZjkI6IDr+SZdlU5c/ZSf73
	O6uMDNdcSrM0qB8MUE8YWLM4vUzoHkXLF9LlI+2ykHjIlkPl3UhTXVrWFrv2a2jxjY2vzQGIOIuwt
	p9H1WhHmzk1pr1X2teU3IlJrhQw6lT3oWHrT4RSSRahtl5x03qbIoff8OeqpfLqL9GZRIvh/CxzaP
	EM1of7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvK73-0000000CsKg-2CpF;
	Thu, 20 Mar 2025 17:55:25 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJwX-0000000CqUJ-2U6n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 17:44:34 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZJXtx4jStz6K9Fg;
	Fri, 21 Mar 2025 01:41:29 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1893114050A;
	Fri, 21 Mar 2025 01:44:28 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Mar 2025 18:44:27 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<james.morse@arm.com>, <conor@kernel.org>, Yicong Yang
	<yangyicong@huawei.com>, <linux-acpi@vger.kernel.org>
CC: <linux-arch@vger.kernel.org>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, <linux-mm@kvack.org>,
	<gregkh@linuxfoundation.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Subject: [RFC PATCH 6/6] Hack: Pretend we have PSCI 1.2
Date: Thu, 20 Mar 2025 17:41:18 +0000
Message-ID: <20250320174118.39173-7-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320174118.39173-1-Jonathan.Cameron@huawei.com>
References: <20250320174118.39173-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_104433_780179_FF323124 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

Need to update QEMU to PSCI 1.2. In meantime lie.
This is just here to aid testing, not for review!

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/firmware/psci/psci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index a1ebbe9b73b1..6a7a6e91fcc4 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -646,6 +646,8 @@ static void __init psci_init_smccc(void)
 		}
 	}
 
+	/* Hack until qemu version stuff updated */
+	arm_smccc_version_init(ARM_SMCCC_VERSION_1_2, psci_conduit);
 	/*
 	 * Conveniently, the SMCCC and PSCI versions are encoded the
 	 * same way. No, this isn't accidental.
-- 
2.43.0


