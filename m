Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8728E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 08:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMOjAKt7SYh21CnU2/gurhD18i4qBMjjU7YQtDJALn4=; b=uDYX5NRZPXs7Tvw/ScaNIoMr0H
	S5+or7SllgJY7RoNF77TnBnUjNMBUqq3VqjgIeaDu6Rt0fO0KFQCe8WoM9bhVLT4AziIwHU0LpZio
	QqBod12egUvaZhQH/7hon34ywOl5z7e7lVTW0dyDgryWZiGfZ6PbaZW+ggDxKorp0Vae6cRDAyZHn
	b0G7J+3ippb1eH15MhBPSORWwIZxxhbRqNuMzVuLBS1Bm20cSilleyxK2559m1XnnBbqzzH7Q2m/J
	kBzURrZRYA2eC3LapQGKcZiRiLiH5+RJN9DsNYJLCIvIIXUnNLuW17WFlAvRA8V0YNMBuhN0Jh3ng
	vzY81iqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeUL-0000000HHwI-0p66;
	Thu, 12 Dec 2024 08:24:01 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLePZ-0000000HGkI-0jGQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 08:19:06 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4361ecebc5bso1817705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 00:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733991543; x=1734596343; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JMOjAKt7SYh21CnU2/gurhD18i4qBMjjU7YQtDJALn4=;
        b=Dztpa1DmS/FqF6CroiaWhoH4m3qDdv4iZ/k7SWx4JdhtOAnjoywPBtRQfKE0vS19VA
         jHEEVxhp6IdJpYrADJOY2/c46Mw6K7UXjz8wpziOfMeHkHOSmamJxKQuY5sGegUCeAdN
         1tSjL0WnguCymFjF1QB+AT0DgnPA/0V1bv3CLgMVl3h7e/PBLYX2ZiOlYR2Rn8eNxuc2
         pqMym0fqa7LpxCgLUnfsf3Z2jdaO6i6mKSXsO6PDK8qSAhmvlh6Ooq+EHBprl0rx7uh4
         XxPFextgi5v1jHy02za0usS6G9+/Mbg8w/ad8oWQNAVJfE5sRyM9ZMTfeL2KX/5NA9Bn
         sXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733991543; x=1734596343;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JMOjAKt7SYh21CnU2/gurhD18i4qBMjjU7YQtDJALn4=;
        b=XXk9F1iFlbqvtjr5y4YLT+gcva0KfoCEHRAGYd+GaaIpdUSS0ZpCchovLJPHMb2JEi
         HF045apwy1nzqfcufHxv/kw37fLuS20UgaqHt5SIB2CkKzdrZwgOmFGG8ppRt8NDy58d
         TrpGLMj/FsRgTUbmU7+y6xf43X9HaGURPcpNdv55Ksjo6vxkdctG+IZZ2AuP3Mr6/65S
         F9igjF4sgNibQ70Sk/nkTjzVDcRuVz0p/aSAzgouKYk00JIh5E82eagb6NKEIjzcX3O6
         iQoRzq6hx0gwcq4aaPs27RMAjFsQjqFP/lmQkI8AxzzT+Rk7nSWuojnU2jCfW+JI8B0P
         DEKw==
X-Gm-Message-State: AOJu0Ywpjq6itvDYLC/EIzd//2iWg9hIx0oPp44r4/+x0og6aLtMHxvd
	amVtmNtivD06m74YAqO4CYhzlKF9EeFqI6cnfIKMdm1Ul/ZnsbfGr+N+8PDRvn1dvnuVSOE0oVI
	7yXfFLg4qZLXxGxZzNOStVXpmk8ZtLbui1pXApKkRge6G2HSaw5Cp7QnceFGzfYuWGnG7yjTBAq
	5oAMDylTQwL6UuKgHWcwaIwwzG93Lwn9DEAzGmicYF
X-Google-Smtp-Source: AGHT+IGEPZXeZNx8gT7l0K6n8hjylpD9slamcamh+DZ/t1Et8nSF8q/2TqsFY0uo9/d5Ix+2xT283bTa
X-Received: from wmee4.prod.google.com ([2002:a05:600c:2184:b0:434:f2eb:aa72])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3109:b0:434:fafe:edb
 with SMTP id 5b1f17b1804b1-4361c3e22e7mr42421225e9.24.1733991543459; Thu, 12
 Dec 2024 00:19:03 -0800 (PST)
Date: Thu, 12 Dec 2024 09:18:45 +0100
In-Reply-To: <20241212081841.2168124-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241212081841.2168124-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=ardb@kernel.org;
 h=from:subject; bh=rw9Vhm4jDehzLkAS6zRdIPR2y59w9k4f1UOcpcAZYnI=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIT1qTlrdArlJHb3+TBsqGsoKNB8W9Z027b7oFacqcWXDr
 YrT6/52lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIlUzmX4zX4/6nDo9FP3mzZI
 uV3zzz+6pfK36PIlc2r+ntb2zQqVPsDwv3pBaqX9/pkC57imvot+L9+VGLnZ8Mu2ZI60JsUWb20 5ZgA=
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212081841.2168124-11-ardb+git@google.com>
Subject: [PATCH v3 3/6] arm64/kvm: Configure HYP TCR.PS/DS based on host stage1
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>, 
	Quentin Perret <qperret@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_001905_213902_46396C7E 
X-CRM114-Status: GOOD (  17.19  )
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
2.47.1.613.gc27f4b7a9f-goog


