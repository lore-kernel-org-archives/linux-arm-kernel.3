Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E411E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adk2aH/4GDKjaqv21ityBwrpMTayAeXtNiToa+jV3u8=; b=gsW6dh8jr09gcjPr17tP7K0lYL
	k8ta6icXHeWXlkluRAD5QnnlsSY8t71WRCc40Yge/p8PsB4Gf9MST2Z6gf4hCqTpIiXrPN9I5L5s9
	nNkAhOrY39oyZcN7Erkic9LkAb1+DgPPDumQ+TBvvS3f6lRnvlFgIkb+praQ2uhXl8/AZEIdDyvMg
	wMUKvEK73VdDnRNgHWf0CCA2fxzpCOTgDS1PatAnCZ3/wCN3Hhyf9uZWENEN7wSLGE+584H7IXUH1
	1PX2ijoHLivM8seIp4/AC2XjWgmWvvzB1LdIfOgfMWcM54xH7Efx8r+GZgk1crK14QFdNT9nWI7hr
	LWZJ4lAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDRv-0000000GSbk-2sry;
	Thu, 05 Dec 2024 15:07:27 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDO1-0000000GRiy-2qPP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:03:26 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-434a27c9044so6563045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 07:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733411003; x=1734015803; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=adk2aH/4GDKjaqv21ityBwrpMTayAeXtNiToa+jV3u8=;
        b=IAIBQtKl+IVn6qlqHAR0XeLcRhGHaaLCEoTpqtYaLd9EZv2BAgGCwDq44t1A9kRuye
         R85BUATk/KCAnU0pQXnnE+y6dqE2OXjt8S+JquQLS5ElYuyNnce5r4bgzFY2oBv50GgK
         wI4Qz9c8aQK3nV2mAjO+pEQZICN4XSfwF198Ai0WKrevsNliH8so+K+c+24TEidmdvh3
         ckohaiuFnBgQGzFDJeksvAKc0RypymttvmZ4YDIQDPkCRrluZtAowOY8VFtFo6JuDAhS
         9mL0+3aSMzkzLNz09snSHESVciPcgolzz48snf+BXOD9YEe0L8qRYZwdRSv9VLXf5sFL
         HxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733411003; x=1734015803;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adk2aH/4GDKjaqv21ityBwrpMTayAeXtNiToa+jV3u8=;
        b=FqwPEntlYnFPv3L4gzUj+5iZIvfLOhC2X6ZA2gwEJ1dQOaESpoLJFYS92VIIQoXKfW
         oerxsnqogVyhCaQ1QWQgJKLRT3mQgBDO7Aa1WWX4tZ8PPOpnTA7Xexmep1EOPT3CQ+YO
         mwUrJFuGh1gPMExVo84dmCuX0t8pWjdBg6neQK3uUBsCJcDpzyC8PiAi46t3EyWnHVGN
         dy/nCVbztfxKOW9FxHmGq4/BN89L5KxaICy9Gu6S2JtRM05nGpAp0OokO5ur5WI9qvhT
         JoH57nqkLVbBP3JuVS+4VQ/IfLZl/sE/F9YawznSe9L2rNvJ/9du0awAWnMyVw7FN0RA
         IQFw==
X-Gm-Message-State: AOJu0YyahuoKRW1BKIlmN5oQVV0hhFXEaV25mMqHgnIwSGYN01aSQPFs
	LIh0pC6gZt85vNC0uAYaunKgXatGOOpvfI+05qOnRrfbv0Tru4nv44EuUZDEDSnJJyjn6zsmS/u
	Ktq+1/12rmdBE8Dq2KkFwRG5B2GsjNViILh31vx7r4nnhxaZJYCzuM0qddF9yQy3Tdl1e6c0YIU
	7VaLN0EkFMrUm88BKNWDmHtwBagRTOtm24aqCkFRyh
X-Google-Smtp-Source: AGHT+IF7/7yWatbx9m9EKm+cZ06mzA7cFMWteGbOArm8KBWUGs6ZGHFU/BgFWuC7Z2P10SoaWhuvRscf
X-Received: from wmql16.prod.google.com ([2002:a05:600c:4f10:b0:434:a346:77e5])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:19ce:b0:431:5871:6c5d
 with SMTP id 5b1f17b1804b1-434d3f8e454mr83608715e9.3.1733411003473; Thu, 05
 Dec 2024 07:03:23 -0800 (PST)
Date: Thu,  5 Dec 2024 16:02:33 +0100
In-Reply-To: <20241205150229.3510177-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241205150229.3510177-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=ardb@kernel.org;
 h=from:subject; bh=k2Mzp/wMZGFRYdDSzEySynVgHnYysUYKKCSLnjGJFrc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIT3wQBcD07YY/8JkFrHzO87lqd8rFWx/6/Ni8pHKSFe+E
 zmsocwdpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMYEO4OAVgIofeMzIsro/PTHeecONt0M87
 8/ayrVOX+HL/XP75ZUbHFnvqWThXMTKca5NMzX3+x+PBosBvlytrP655xf77i8p7/7u7TA9UaH/ gBgA=
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241205150229.3510177-11-ardb+git@google.com>
Subject: [PATCH v2 3/6] arm64/kvm: Configure HYP TCR.PS/DS based on host stage1
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>, 
	Quentin Perret <qperret@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_070325_715015_05E1F78E 
X-CRM114-Status: GOOD (  17.13  )
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

When the host stage1 is configured for LPA2, the value currently being
programmed into TCR_EL2.T0SZ may be invalid unless LPA2 is configured
at HYP as well.  This means kvm_lpa2_is_enabled() is not the right
condition to test when setting TCR_EL2.DS, as it will return false if
LPA2 is only available for stage 1 but not for stage 2.

Similary, programming TCR_EL2.PS based on a limited IPA range due to
lack of stage2 LPA2 support could potentially result in problems.

So use lpa2_is_enabled() instead, and set the PS field according to the
host's IPS, which is capped at 48 bits if LPA2 support is absent or
disabled. Whether or not we can make meaningful use of such a
configuration is a different question.

Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kvm/arm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a102c3aebdbc..7b2735ad32e9 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1990,8 +1990,7 @@ static int kvm_init_vector_slots(void)
 static void __init cpu_prepare_hyp_mode(int cpu, u32 hyp_va_bits)
 {
 	struct kvm_nvhe_init_params *params = per_cpu_ptr_nvhe_sym(kvm_init_params, cpu);
-	u64 mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
-	unsigned long tcr;
+	unsigned long tcr, ips;
 
 	/*
 	 * Calculate the raw per-cpu offset without a translation from the
@@ -2005,6 +2004,7 @@ static void __init cpu_prepare_hyp_mode(int cpu, u32 hyp_va_bits)
 	params->mair_el2 = read_sysreg(mair_el1);
 
 	tcr = read_sysreg(tcr_el1);
+	ips = FIELD_GET(TCR_IPS_MASK, tcr);
 	if (cpus_have_final_cap(ARM64_KVM_HVHE)) {
 		tcr |= TCR_EPD1_MASK;
 	} else {
@@ -2014,8 +2014,8 @@ static void __init cpu_prepare_hyp_mode(int cpu, u32 hyp_va_bits)
 	tcr &= ~TCR_T0SZ_MASK;
 	tcr |= TCR_T0SZ(hyp_va_bits);
 	tcr &= ~TCR_EL2_PS_MASK;
-	tcr |= FIELD_PREP(TCR_EL2_PS_MASK, kvm_get_parange(mmfr0));
-	if (kvm_lpa2_is_enabled())
+	tcr |= FIELD_PREP(TCR_EL2_PS_MASK, ips);
+	if (lpa2_is_enabled())
 		tcr |= TCR_EL2_DS;
 	params->tcr_el2 = tcr;
 
-- 
2.47.0.338.g60cca15819-goog


