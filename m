Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6523CD2E9C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 08:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4O6vPXncAdT+5klHHB6JLQEFGlmp/qVLkbHu/JVbLo=; b=I0u16n0k7cv8125RBx73gtaJXV
	ek24wa4zZfZnTHK2wylqBu47iizFPFHVU0yjiNnZ16nWiC2IQzvO9BbEwYzYypY9qZs5bipdpVawz
	rRFvDsKBXxMgHEo6RzLl99TrSIBGoeA6NEthM251uV6qz4zsoWnaYP5mCHtPAnJIgVa6Oopx8kPE8
	lBg5HafP7fNWAeBNPca1SBhhaeGwK4FmWTv3lJ3RHb6KAXmnmyDErTkS/DM7nSvIVwpklkqcHpQVj
	awuyIosu+C96GTGdCfV8Wjt4rZmYMt4x6CSTeofXdE07pgG47UcqL3DjeSnf5le1i7HQEUwhFoDIP
	tA3B7wsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPzL-0000000GqJu-1PjT;
	Mon, 11 Nov 2024 08:41:35 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPtx-0000000GpNL-3UVu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 08:36:03 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e38fabff35so23652247b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 00:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731314159; x=1731918959; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+4O6vPXncAdT+5klHHB6JLQEFGlmp/qVLkbHu/JVbLo=;
        b=3zgyhNikS2IpDzSoRmKhov8TW7oLN2nyXvGNqO3sq9FHdQsiTMW2TaH6kPwmZ8bgXh
         CFYtbBicAsQOA6ht7y2/nRkQIY6pDM7hXYfvbkYytVe1nabQEjQzRasAv0WfsAeDUphi
         ZhuKGx8EuoPmhv67veY2cIPWtZ6YaQjHh9OuWrIm5nDRVm1L+24tmtMf6r1p4ZqgEf9i
         HzXyp0vBStm6OUZY7bT3rnV2Limbkn2wE99MGxOvIcXQeM4i9k26TG7ouGkw0oSbnTj0
         OmWaYB4K1Pvh+ICzteqLaPcTueFQ6easwZd13O9MBZwS1diVC8kNOvcE9ihUZ/sy5hET
         4WMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731314159; x=1731918959;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+4O6vPXncAdT+5klHHB6JLQEFGlmp/qVLkbHu/JVbLo=;
        b=jltmh/VFSLOuOoyqUi8JQ7Om/2CSdzOdWLfoGbJt1tdVgnSrxbEa7SCDD4AwcSFvRV
         KHLcdp1l67Lw0t2NYxyCUoFT1RcpBQlE/+xibgyf8oP8HpGd+n2REsIw2SX28SscObMZ
         0d/XT/gYrSdaFV6G3X70d/rh0cgmbZWrbEDIEDhsBZ6zfnzhIyd1QPFQzvN4jAJlov2Q
         nRJHfRl6Ow45jfdnRlxc5YItqbz/FP1+E/xF/zPJKXFFlfcfwo+wFclm4AnWFS4xFkYY
         qBuIz1CWZe+zQDdTgY3Cm8Jz0eNlwVaivLxL5uPkFANgHhfNaUelji7vcxBbgoEekSzB
         oQBQ==
X-Gm-Message-State: AOJu0YwlxUTjYjps6Sirf9uqN3WfW4aTxCUGynskCPjC9FmpIDsYRSGT
	8405VKscHIUT6kxjxTXwQ8Daz6I2jFqOrzE9HLmqi3YgiB9RvgcQ9pC1Dwo6S6E1w8YvHg7ZFTa
	LVKnCanJyxYvEICiwBbx60+NINNz/t5kofpQ0GvQAUbiEtoJKlvhiYt0DPHEGbOJEihD/2NgJQl
	VD7M606Vaysutm29pcBqbIqlQ+oQPHH95UybwmpZzM
X-Google-Smtp-Source: AGHT+IFHExbV/UaCmb9SO/GvwiePUkfieauhVEdjQbeeo7rkNuDf0FnYJMGSUhAwD4yKRoCmYO6xtYGR
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a0d:fd01:0:b0:6e3:6414:80c5 with SMTP id
 00721157ae682-6eadda22e76mr762687b3.0.1731314159320; Mon, 11 Nov 2024
 00:35:59 -0800 (PST)
Date: Mon, 11 Nov 2024 09:35:46 +0100
In-Reply-To: <20241111083544.1845845-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241111083544.1845845-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4298; i=ardb@kernel.org;
 h=from:subject; bh=v82eHrgTptnYI3SkH3DFWlg65i0BvRLyLZmKr5z7P/o=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JId3w4CP/at7Cu+4F321Y7dhUrNetClomFBRmzcf5YvKOq
 fIXZq/uKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABMRCGNk+PMnf9quWKN9P7eX
 p4kJl9w36Dxn7+fDWl1QO1X+6IQbBxkZni2erlXhv50vlmOeGceUp3Zhxf1vdmnusX8sH+e0oaK QCwA=
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241111083544.1845845-10-ardb+git@google.com>
Subject: [PATCH 2/6] arm64/mm: Override PARange for !LPA2 and use it consistently
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kees Cook <keescook@chromium.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003601_903763_9CFB1FEA 
X-CRM114-Status: GOOD (  16.29  )
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

From: Ard Biesheuvel <ardb@kernel.org>

When FEAT_LPA{,2} are not implemented, the ID_AA64MMFR0_EL1.PARange and
TCR.IPS values corresponding with 52-bit physical addressing are
reserved.

Setting the TCR.IPS field to 0b110 (52-bit physical addressing) has side
effects, such as how the TTBRn_ELx.BADDR fields are interpreted, and so
it is important that disabling FEAT_LPA2 (by overriding the
ID_AA64MMFR0.TGran fields) also presents a PARange field consistent with
that.

So limit the field to 48 bits unless LPA2 is enabled, and update
existing references to use the override consistently.

Fixes: 352b0395b505 ("arm64: Enable 52-bit virtual addressing for 4k and 16k granule configs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/assembler.h    | 5 +++++
 arch/arm64/kernel/cpufeature.c        | 2 +-
 arch/arm64/kernel/pi/idreg-override.c | 9 +++++++++
 arch/arm64/kernel/pi/map_kernel.c     | 6 ++++++
 arch/arm64/mm/init.c                  | 2 +-
 5 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 3d8d534a7a77..ad63457a05c5 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -343,6 +343,11 @@ alternative_cb_end
 	// Narrow PARange to fit the PS field in TCR_ELx
 	ubfx	\tmp0, \tmp0, #ID_AA64MMFR0_EL1_PARANGE_SHIFT, #3
 	mov	\tmp1, #ID_AA64MMFR0_EL1_PARANGE_MAX
+#ifdef CONFIG_ARM64_LPA2
+alternative_if_not ARM64_HAS_VA52
+	mov	\tmp1, #ID_AA64MMFR0_EL1_PARANGE_48
+alternative_else_nop_endif
+#endif
 	cmp	\tmp0, \tmp1
 	csel	\tmp0, \tmp1, \tmp0, hi
 	bfi	\tcr, \tmp0, \pos, #3
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 37e4c02e0272..6f5137040ff6 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3399,7 +3399,7 @@ static void verify_hyp_capabilities(void)
 		return;
 
 	safe_mmfr1 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR1_EL1);
-	mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
+	mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
 	mmfr1 = read_cpuid(ID_AA64MMFR1_EL1);
 
 	/* Verify VMID bits */
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index 22159251eb3a..c6b185b885f7 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -83,6 +83,15 @@ static bool __init mmfr2_varange_filter(u64 val)
 		id_aa64mmfr0_override.val |=
 			(ID_AA64MMFR0_EL1_TGRAN_LPA2 - 1) << ID_AA64MMFR0_EL1_TGRAN_SHIFT;
 		id_aa64mmfr0_override.mask |= 0xfU << ID_AA64MMFR0_EL1_TGRAN_SHIFT;
+
+		/*
+		 * Override PARange to 48 bits - the override will just be
+		 * ignored if the actual PARange is smaller, but this is
+		 * unlikely to be the case for LPA2 capable silicon.
+		 */
+		id_aa64mmfr0_override.val |=
+			ID_AA64MMFR0_EL1_PARANGE_48 << ID_AA64MMFR0_EL1_PARANGE_SHIFT;
+		id_aa64mmfr0_override.mask |= 0xfU << ID_AA64MMFR0_EL1_PARANGE_SHIFT;
 	}
 #endif
 	return true;
diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
index f374a3e5a5fe..e57b043f324b 100644
--- a/arch/arm64/kernel/pi/map_kernel.c
+++ b/arch/arm64/kernel/pi/map_kernel.c
@@ -136,6 +136,12 @@ static void noinline __section(".idmap.text") set_ttbr0_for_lpa2(u64 ttbr)
 {
 	u64 sctlr = read_sysreg(sctlr_el1);
 	u64 tcr = read_sysreg(tcr_el1) | TCR_DS;
+	u64 mmfr0 = read_sysreg(id_aa64mmfr0_el1);
+	u64 parange = cpuid_feature_extract_unsigned_field(mmfr0,
+							   ID_AA64MMFR0_EL1_PARANGE_SHIFT);
+
+	tcr &= ~TCR_IPS_MASK;
+	tcr |= parange << TCR_IPS_SHIFT;
 
 	asm("	msr	sctlr_el1, %0		;"
 	    "	isb				;"
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index d21f67d67cf5..4db9887b2aef 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -280,7 +280,7 @@ void __init arm64_memblock_init(void)
 
 	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
 		extern u16 memstart_offset_seed;
-		u64 mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
+		u64 mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
 		int parange = cpuid_feature_extract_unsigned_field(
 					mmfr0, ID_AA64MMFR0_EL1_PARANGE_SHIFT);
 		s64 range = linear_region_size -
-- 
2.47.0.277.g8800431eea-goog


