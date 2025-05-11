Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458F8C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 10:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaFU32pm0wRd+dJqw9n1Ym9pxZZerbroRGizl735exI=; b=peEX5xSIdvnI2Gp+R813zryOQ9
	mUNDD+7J9jo1lbCU0tf9ElsTcW38G+cKgIlGf32e5ZJBtwCy8vuBiGNJz9nqx0rjliKXs5GCKem4W
	0Os/coNnQpJVa1lQ9DAf00MqMW5hUMaAYtEOkH3BUtCczt8LXskzLE8FYBWyfmbNt2cXoM64JXdvT
	fY0k1TkJkI+hIs2XqsyC6d9LMlBuFQgDiPv6o5ofHIHMh4aX7V7R5oBgxaE9gxQLQ//t00RoIrC7+
	wUiPibxli57aguCUIKi4dkqvD+b9QMHOH9Grv2lDrNRH/97aH49nWpF9RT0q95F6yO5bBV0h6ae+8
	zlZJLcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3U3-000000073b5-1GFE;
	Sun, 11 May 2025 10:00:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3M8-000000072gu-1D5o
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 09:52:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAE7B1516;
	Sun, 11 May 2025 02:52:12 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B09A3F5A1;
	Sun, 11 May 2025 02:52:22 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	mark.rutland@arm.com
Subject: [BOOT-WRAPPER PATCH 3/3] aarch64: Enable use of ZT0
Date: Sun, 11 May 2025 10:52:11 +0100
Message-Id: <20250511095211.1638852-4-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250511095211.1638852-1-mark.rutland@arm.com>
References: <20250511095211.1638852-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_025224_367146_997E43E7 
X-CRM114-Status: GOOD (  11.80  )
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

FEAT_SME2 adds the ZT0 register. Accesses to ZT0 trap to EL3 unless
SMCR_EL3.EZT0 is set, and so boot-wrapper support is necessary.

Support for FEAT_SME2 was added to Linux in v6.3 without any
boot-wrapper support. Consequently when SME2 is enabled in a model, any
attempt to access ZT0 (whether in userspace, kernel, or hypervisor) will
result in a hang. Linux will (only) access ZT0 during a context switch
when PSTATE.ZA==1, and so this hang is seen long after boot, when
applications first set PSTATE.ZA.

Add boot-wrapper support for ZT0, as described in the latest ARM ARM
(ARM DDI 0487 L.a), which can be found at:

  https://developer.arm.com/documentation/ddi0487/la/?lang=en

All we need to do at EL3 is set SMCR_EL3.EZT0; it's up to lower ELs to
configure their SMCR_ELx register appropriately.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Mark Brown <broonie@kernel.org>
---
 arch/aarch64/include/asm/cpu.h | 1 +
 arch/aarch64/init.c            | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
index aab7657..2b3a659 100644
--- a/arch/aarch64/include/asm/cpu.h
+++ b/arch/aarch64/include/asm/cpu.h
@@ -175,6 +175,7 @@
 #define ZCR_EL3_LEN_MAX		0xf
 
 #define SMCR_EL3		s3_6_c1_c2_6
+#define SMCR_EL3_EZT0		BIT(30)
 #define SMCR_EL3_FA64		BIT(31)
 #define SMCR_EL3_LEN_MAX	0xf
 
diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
index bb19848..e1640a9 100644
--- a/arch/aarch64/init.c
+++ b/arch/aarch64/init.c
@@ -189,6 +189,9 @@ static void cpu_init_el3(void)
 		if (mrs_field(ID_AA64SMFR0_EL1, FA64))
 			smcr |= SMCR_EL3_FA64;
 
+		if (mrs_field(ID_AA64PFR1_EL1, SME) >= 2)
+			smcr |= SMCR_EL3_EZT0;
+
 		msr(SMCR_EL3, smcr);
 	}
 }
-- 
2.30.2


