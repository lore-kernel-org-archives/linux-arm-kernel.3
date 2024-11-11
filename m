Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE25AD2E9C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 08:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0N4/8trK7fv9irXSAqJ3zFfA8vt6Qj0oJ/C7156uK8I=; b=36B5i3SR03f0zUYjDbLh0XzShs
	FtQ0LTkQhvm8iX54yErN3U4ZEfQ6KwTQMxuyYZibIyL43J5YK2YYGkyyQPCMNT5mJ2dZQrwDvWDzJ
	yh+7US4QUck+lafopeemJtT34K+i8ac3W4kce7tQ0TkkVTr6VzYqJVrnpoBa6VkUjMqMWT2im+qET
	rQsCDcYo849UB1Fevox3ASm5Z78CCjBicctpkiqPnUrn7vcoumEOQnN5legN4juqNFAJnD2xvu0Uw
	Xm7bXFrQS+L3T5Cv9Obh5XZ/gTCdbAqhFY7DVOb5M5TiAHevmWVyBm2n5PcbKCnU2hlb6Bo/7VTyj
	nZvFlmBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQ15-0000000GqhB-4A9w;
	Mon, 11 Nov 2024 08:43:23 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPu0-0000000GpO6-1yV1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 08:36:05 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea7cfb6e0fso81492617b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 00:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731314162; x=1731918962; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0N4/8trK7fv9irXSAqJ3zFfA8vt6Qj0oJ/C7156uK8I=;
        b=VCu6zN16luP+TryJfj82zwG3h6egyjyfe6TOu8VIftFrMaO+VquvywMJnt3nmzZXar
         /CWAxNzbwgQWfuEhzgyYOzTZMt3vohKqBldG9Px2S8AIFacFiCZhrQcpcBhSRWU9Cqhx
         y02NrtHzfw58DX1BPYSxC06xSO8lSpsPO05c2SkcG7IEkEXYCFxDX/nI+3GxaInQJB3k
         7NQpUfmdIRi4oEOy6zEE5kdPm/PVw9DYY2xMYNxh79cpJK0/frekrOlH/tqQxKQ89EAy
         Yhrtj3bxGAzIIhVruoscXszzPuiuZoma7yfw318b4VA1W0o2IBxBVj12yNoSoKm1ZW9M
         IvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731314162; x=1731918962;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0N4/8trK7fv9irXSAqJ3zFfA8vt6Qj0oJ/C7156uK8I=;
        b=SOSgQOQ03e7GOh5EMOrlip98Q1cbX/VO51Agqyk84TZh9/rRwuUb0NfZlM2voR/SSB
         2S8u/Svqc5ETkdngbWcp4MVuDIrb1u7OAUMVkbk5K+PYm3qbNcg10i8n6++qY5xLpCNB
         diSa38DeyMJBN6ibZZ10neEzlJuhPjKcP3fuGPk8kbd8Y80aVamRYoc0iZKHnA63BkTQ
         GIc5dHxQD/9HbM7tvfcLBdN+K40pw4PfqKbQ2meJOVL07a2MN01Q3Nnie3BWwq2y9n+B
         /dGsFdcwjTHnxpTspT0JpNCjtzlmcUvMH6y7enmD2+r/lcO/8Mv8jpB7uubug+mgEP36
         tbjQ==
X-Gm-Message-State: AOJu0YzruDlqy7BORBXASwYep9iT7ZVCqPeveagzLF+wOfmestpWpS+N
	4ITQ2k02AqVahIsqNfxv10AJK5a7Xj8EGeKCLcKnQrhWoPES+WYkdVIMW/q7CSvsYt9W/J7IZAf
	Y9B130WWI1leunLvR7h8PrW1t7Kl5WdhFRox7KqhyouXMeUpuR40qQXCXr7MwLs/hBNx0jWKOe0
	lcVIxcV2nUW0Tvh5SJlfB5AwR6qb3/Qq+Yy1NzjgK9
X-Google-Smtp-Source: AGHT+IEaVcyWaEFOsAGEmUmx521XJZzIe6O0nRTJpeaLf4pyHpMVyj2xe5eAr/hgU4liSlwSx1Soq/gO
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a81:be05:0:b0:6e2:6f2:efc with SMTP id
 00721157ae682-6eb028d6c59mr467177b3.5.1731314161525; Mon, 11 Nov 2024
 00:36:01 -0800 (PST)
Date: Mon, 11 Nov 2024 09:35:47 +0100
In-Reply-To: <20241111083544.1845845-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241111083544.1845845-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=ardb@kernel.org;
 h=from:subject; bh=Rsge2hKhZ3IgLduep4Ol+NMdQ1OnlqaAQBu4vFWrM8I=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JId3w4OOI3t6JM3he6wj/fvl1/iRNb5+KfI0rxVsSN3fVB
 d7tbdrbUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbiE8jwTzsjSViaR1mnNmoX
 60UTV7//fRcMNrQk7GviOF0zeSnDXob/DosF7weG9whVPg2PLs25au19KFFvwdm4D6GXDs7quXC dFQA=
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241111083544.1845845-11-ardb+git@google.com>
Subject: [PATCH 3/6] arm64/kvm: Configure HYP TCR.PS/DS based on host stage1
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kees Cook <keescook@chromium.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003604_542671_37D16C99 
X-CRM114-Status: GOOD (  17.79  )
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
index a0d01c46e408..1d20d86bb9f5 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2005,8 +2005,7 @@ static int kvm_init_vector_slots(void)
 static void __init cpu_prepare_hyp_mode(int cpu, u32 hyp_va_bits)
 {
 	struct kvm_nvhe_init_params *params = per_cpu_ptr_nvhe_sym(kvm_init_params, cpu);
-	u64 mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
-	unsigned long tcr;
+	unsigned long tcr, ips;
 
 	/*
 	 * Calculate the raw per-cpu offset without a translation from the
@@ -2020,6 +2019,7 @@ static void __init cpu_prepare_hyp_mode(int cpu, u32 hyp_va_bits)
 	params->mair_el2 = read_sysreg(mair_el1);
 
 	tcr = read_sysreg(tcr_el1);
+	ips = FIELD_GET(TCR_IPS_MASK, tcr);
 	if (cpus_have_final_cap(ARM64_KVM_HVHE)) {
 		tcr |= TCR_EPD1_MASK;
 	} else {
@@ -2029,8 +2029,8 @@ static void __init cpu_prepare_hyp_mode(int cpu, u32 hyp_va_bits)
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
2.47.0.277.g8800431eea-goog


