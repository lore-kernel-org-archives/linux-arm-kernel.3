Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8408BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 07:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cuV51rqUV9w/JyA1OfilSFlFtRKWoGrP8B/0hTcnw0=; b=VsGXSl30fKUmeo5mn7mlH6APPa
	dPf2b2UxKRAYQs1O6pgTfGAXzcE7MByfcFn+/95DR3vPhL/ApHygxFwCKl/pawChrTrwLfsgT7QlS
	cXI56VZnuLVLOnyJuEBWZ7PaHJNFy6X9mvS0VgwQVJU3aaySYO24itA9CQgFT7ex2QhYoIgzRvumo
	KpC889CcLvcGW0cnDcbFgU2qkTmi191sVJ1XOMcAqDDA01NVDQbpYLVNz99Rwf86KKsdXAvnpwtFY
	6BM1oP0pFjM9h3HHYKFs1qWKBBanTUEh9SYrzwpdhHGwY5rOkg2TzPtyD98Iicbq3LyZJxVjDUk3k
	XcTNqpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOXSI-00000004Aot-3Vmv;
	Fri, 20 Dec 2024 07:29:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOXM1-000000049mc-2jtK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 07:23:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96F031E7D;
	Thu, 19 Dec 2024 23:23:48 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.51.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E28133F58B;
	Thu, 19 Dec 2024 23:23:15 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <robh@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Auger <eric.auger@redhat.com>,
	kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/7] arm64/sysreg: Add register fields for HFGRTR2_EL2
Date: Fri, 20 Dec 2024 12:52:38 +0530
Message-Id: <20241220072240.1003352-6-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220072240.1003352-1-anshuman.khandual@arm.com>
References: <20241220072240.1003352-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_232321_734631_12E822CA 
X-CRM114-Status: UNSURE (   6.60  )
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

This adds register fields for HFGRTR2_EL2 as per the definitions based
on DDI0601 2024-09.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/tools/sysreg | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 088e3be8f884..0875e0057706 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2603,6 +2603,25 @@ Field	1	nPMIAR_EL1
 Field	0	nPMECR_EL1
 EndSysreg
 
+Sysreg	HFGRTR2_EL2	3	4	3	1	2
+Res0	63:15
+Field	14	nACTLRALIAS_EL1
+Field	13	nACTLRMASK_EL1
+Field	12	nTCR2ALIAS_EL1
+Field	11	nTCRALIAS_EL1
+Field	10	nSCTLRALIAS2_EL1
+Field	9	nSCTLRALIAS_EL1
+Field	8	nCPACRALIAS_EL1
+Field	7	nTCR2MASK_EL1
+Field	6	nTCRMASK_EL1
+Field	5	nSCTLR2MASK_EL1
+Field	4	nSCTLRMASK_EL1
+Field	3	nCPACRMASK_EL1
+Field	2	nRCWSMASK_EL1
+Field	1	nERXGSR_EL1
+Field	0	nPFAR_EL1
+EndSysreg
+
 Sysreg HDFGRTR_EL2	3	4	3	1	4
 Field	63	PMBIDR_EL1
 Field	62	nPMSNEVFR_EL1
-- 
2.25.1


