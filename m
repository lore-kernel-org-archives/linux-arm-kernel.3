Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78008C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 07:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WYAFaRto57agdQ4ZfB+Bb2Mn1MXlGcSZhC+vAXJPFTU=; b=lo3WNEnoXNBB/lTXjZ96S6ywTl
	jOtbGfYEJ5aFPWL+PMkNHgrzqmRtBH7XaHEH0LPsZkgfsdGAl/iHLp8RseOClqc4mtcdCTKKVk3r/
	Y1Zv+yLb1WutvXVqosXbun5z6TFVePpbpPsg2f/az1SeWYva6ZIp1vg0lnWIODaathvJWnv6LBeez
	Zo4zM6z3tM9tdU1bRto2ENK2SSZgHbCAlwG8BrvlueOxukV5OOHwh2fOU2J7eO/zoB5a4NFqi23xX
	GHKA0XII4cmKZ0YPW7o5HpQQ0L44L6PjjKJ+7d5zfvHRYq65rYxYqr+Ckv8Jpez1BHAJ/jWYhnv01
	YjsBjK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8Bn-0000000DyVl-2Fkn;
	Fri, 11 Jul 2025 07:28:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua81h-0000000Dw4o-0e83
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:18:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 186D516F2;
	Fri, 11 Jul 2025 00:18:19 -0700 (PDT)
Received: from e134433.budapest.arm.com (e134433.arm.com [10.45.25.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 10FDD3F6A8;
	Fri, 11 Jul 2025 00:18:28 -0700 (PDT)
From: Tamas Kaman <tamas.kaman@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Tamas Kaman <tamas.kaman@arm.com>
Subject: [boot-wrapper-aarch64 PATCH v2] Enable GCS if it is present in the HW
Date: Fri, 11 Jul 2025 09:18:13 +0200
Message-Id: <20250711071813.25935-1-tamas.kaman@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_001833_231226_835C8279 
X-CRM114-Status: UNSURE (   9.46  )
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

Allow lower level ELs to use GCS when the underlying HW has implmented
the feature. This requires setting SCR_EL3_GCSEn bit in the SCR_EL3
register.

More details of the GCS feature can be found in ARM ARM, chapter 11
https://developer.arm.com/documentation/ddi0487/la/?lang=en

Signed-off-by: Tamas Kaman <tamas.kaman@arm.com>
---
 arch/aarch64/include/asm/cpu.h | 2 ++
 arch/aarch64/init.c            | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
index ac50474..91801b0 100644
--- a/arch/aarch64/include/asm/cpu.h
+++ b/arch/aarch64/include/asm/cpu.h
@@ -70,6 +70,7 @@
 #define SCR_EL3_ECVEN			BIT(28)
 #define SCR_EL3_TME			BIT(34)
 #define SCR_EL3_HXEn			BIT(38)
+#define SCR_EL3_GCSEn			BIT(39)
 #define SCR_EL3_EnTP2			BIT(41)
 #define SCR_EL3_RCWMASKEn		BIT(42)
 #define SCR_EL3_TCR2EN			BIT(43)
@@ -125,6 +126,7 @@
 #define ID_AA64PFR1_EL1_MTE		BITS(11, 8)
 #define ID_AA64PFR1_EL1_SME		BITS(27, 24)
 #define ID_AA64PFR1_EL1_CSV2_frac	BITS(35, 32)
+#define ID_AA64PFR1_EL1_GCS		BITS(47, 44)
 #define ID_AA64PFR1_EL1_THE		BITS(51, 48)
 
 #define ID_AA64PFR2_EL1			s3_0_c0_c4_2
diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
index cb24f4e..bb3e835 100644
--- a/arch/aarch64/init.c
+++ b/arch/aarch64/init.c
@@ -118,6 +118,10 @@ static void cpu_init_el3(void)
 	if (mrs_field(ID_AA64PFR1_EL1, MTE) >= 2)
 		scr |= SCR_EL3_ATA;
 
+	if (mrs_field(ID_AA64PFR1_EL1, GCS)) {
+		scr |= SCR_EL3_GCSEn;
+	}
+
 	if (!kernel_is_32bit())
 		scr |= SCR_EL3_RW;
 
-- 
2.34.1


