Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D20CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFGyIirEHGyzSRN9Dl9BJHUoTpO6G9a9v4fmkABnlqI=; b=hGcuzun/47GP9iH0RnSCM/uF3z
	UGtOh4RFNc1GkpWm3863r64t4g0owGJapHVqDtkU1IKv1qIVbAo1N/Nt3Ox1+JrJl/mb1H/EpVjM1
	+o/eNAUVBcoPHk8ET2gZtDTpu3/oYRHF8QOvglBKqE22/fSSQWEQOEZSFatb2Tk1a/SGhiwRVPFrn
	wLkdsYnskgh140LqBjTtasqVpiJkNtD40YvhTl0vt/g5tc3bzEKzoCGmjaUzIZBg/uUHwlFx1RUAR
	QpjVzcdO+uOqNY3OwkdFDZC/zNguTbQYPTkM+f8Kx0ZLJlFhsnRxiKSKV7uh/Y0uXaO8GfmaUyZ76
	b3YnV4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBW2G-00000002U2P-00ON;
	Wed, 22 Oct 2025 10:25:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBW23-00000002TxP-1Z9c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:25:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21FAD169C;
	Wed, 22 Oct 2025 03:25:18 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.33.8.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39F573F63F;
	Wed, 22 Oct 2025 03:25:25 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Dave Martin <dave.martin@arm.com>
Subject: [boot-wrapper PATCH 2/4] aarch64: enable access to FEAT_AIE and FEAT_PFAR features
Date: Wed, 22 Oct 2025 11:25:01 +0100
Message-Id: <20251022102503.2878048-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251022102503.2878048-1-andre.przywara@arm.com>
References: <20251022102503.2878048-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_032527_474697_491F9200 
X-CRM114-Status: UNSURE (   8.14  )
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

ARMv8.9 introduced FEAT_AIE and FEAT_PFAR, both of which introduce
system registers accessible from EL1 and EL2. Access to them is guarded
by SCR_EL3 control bits AIEn and PFAREn.

Since boot-wrapper has no business in limiting those features or trapping
access to those register, set the no-trap bits in SCR_EL3, if we detect
the respective CPU feature bits.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/aarch64/include/asm/cpu.h | 4 ++++
 arch/aarch64/init.c            | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
index 0f6e2ce..1d86c23 100644
--- a/arch/aarch64/include/asm/cpu.h
+++ b/arch/aarch64/include/asm/cpu.h
@@ -78,8 +78,10 @@
 #define SCR_EL3_TCR2EN			BIT(43)
 #define SCR_EL3_SCTLR2En		BIT(44)
 #define SCR_EL3_PIEN			BIT(45)
+#define SCR_EL3_AIEn			BIT(46)
 #define SCR_EL3_D128En			BIT(47)
 #define SCR_EL3_EnFPM			BIT(50)
+#define SCR_EL3_PFAREn			BIT(53)
 #define SCR_EL3_FGTEN2			BIT(59)
 
 #define VTCR_EL2_MSA			BIT(31)
@@ -119,6 +121,7 @@
 #define ID_AA64MMFR3_EL1_S2PIE		BITS(15, 12)
 #define ID_AA64MMFR3_EL1_S1POE		BITS(19, 16)
 #define ID_AA64MMFR3_EL1_S2POE		BITS(23, 20)
+#define ID_AA64MMFR3_EL1_AIE		BITS(27, 24)
 #define ID_AA64MMFR3_EL1_D128		BITS(35, 32)
 
 #define ID_AA64PFR0_EL1_RAS		BITS(31, 28)
@@ -130,6 +133,7 @@
 #define ID_AA64PFR1_EL1_SME		BITS(27, 24)
 #define ID_AA64PFR1_EL1_CSV2_frac	BITS(35, 32)
 #define ID_AA64PFR1_EL1_THE		BITS(51, 48)
+#define ID_AA64PFR1_EL1_PFAR		BITS(63, 60)
 
 #define ID_AA64PFR2_EL1			s3_0_c0_c4_2
 #define ID_AA64PFR2_EL1_FPMR		BITS(35, 32)
diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
index 99e43cf..004149f 100644
--- a/arch/aarch64/init.c
+++ b/arch/aarch64/init.c
@@ -136,6 +136,12 @@ static void cpu_init_el3(void)
 	if (mrs_field(ID_AA64PFR2_EL1, FPMR))
 		scr |= SCR_EL3_EnFPM;
 
+	if (mrs_field(ID_AA64MMFR3_EL1, AIE))
+		scr |= SCR_EL3_AIEn;
+
+	if (mrs_field(ID_AA64PFR1_EL1, PFAR))
+		scr |= SCR_EL3_PFAREn;
+
 	msr(SCR_EL3, scr);
 
 	msr(CPTR_EL3, cptr);
-- 
2.25.1


