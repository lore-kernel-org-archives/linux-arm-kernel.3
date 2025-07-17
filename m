Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3C9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 01:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i36b1JU3bh8bkcjM27fcG1Vv3a5VEOWwHxSUo3VGonw=; b=2eFBWkeXb5rDncbSFnZECDgZYl
	UlyIQBCENBMo+DK4YLdtEsArBcuxPOg7LhhzimM0kushV7LjYEpG0n5bVDMnQSzGopbfAn65Kz+lU
	wSjLraeZbxPFgI2b1+RxZTjxhUZ06/Fd4B0M7pWycY5e19yaR6ITOnYhMUjaWGT1tKwI6DBd88vsV
	d3TSMsuvPpzOMHAyz06to9sDNPwuook8S/s6bI9LsR0Q5QlfXHCTE4jvyzu+/VvS5V6eGYZ1h2dPR
	qbVbRKGkffv1m2ZIIqY/u2DtFVZM6U57cdi7+VAfh6itof6K+5Zzw2VZS4DNqJadYlYU9PeF4K5mp
	U/Tmdn7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucZZ5-0000000BRNV-0uLp;
	Fri, 18 Jul 2025 01:07:07 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucYKU-0000000BMbM-2kEh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 23:47:59 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a4f3796779so751868f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 16:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752796077; x=1753400877; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i36b1JU3bh8bkcjM27fcG1Vv3a5VEOWwHxSUo3VGonw=;
        b=DYURBjD885sMLLwzGq140002XP5rajg7iy/RDgEAXcPN3lhMW11PqNb2Aus/GUAB0s
         RS8BdAnX5cRNTHCax3WatBWnGe89evaTr2dnxAYx8E5nd+2Zcrmwl8831NKuFcIobQsA
         k13dH5umiO1vSGGVDzuAc+/8KFGPjSIcZmC2No6c3RgnBxUAcHAjik/gA7tv0gYwym7X
         PgXpZHB4tzHJ6UBiFmEqwlQZZLTy7YHjXDuTibPL9ESGDHp/tMMcr2KlcWnWKJntPHZm
         p90egeUMUTWXp8zI+kyV5OrLfBmCKSXwcJfAtKcrH5U9bbWle6Hcw5Y/b3RiiH9JyuL2
         gwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752796077; x=1753400877;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i36b1JU3bh8bkcjM27fcG1Vv3a5VEOWwHxSUo3VGonw=;
        b=mCYOTAvcLSMyO7K1UNIHnoZ31yRzCbQwgMKmb2nr3+PORO4MDIwaQ4+t5sVFLQDmdt
         aqY3J5nvXzZ1LDrRxa8iOD6Pc8ZJB3x2QGSzXZjqkR36XdIaeHTXKr0ePC/RtXBfUK2o
         HPeFkBpj2ELa8Ut7UPvalOhDLwCE1gBrdDB9WZJZJeOpmEHXdq3M1EieT46ailHTifvc
         AyBEpx0uCaS5DZiiq7b4Lu/UZshvDBbp2cmoXKdlPjJoxGe+xG9nSox3fbdHhJ8CNqHj
         eszHABoCNxb2J+0iyZPvPM4dHijDslg1FdhY6tL6DVE04ZV+o5/gW/TQvK4FtxYDEWqW
         fYgA==
X-Gm-Message-State: AOJu0YwRCf+oKNYLaXL8Rw6DThsFl7IrJM3bCzYhIgWcwoQFskCiSR+T
	4f/ODJTRvo+ru6/ZibYvyIRims/k8+f/vtGnGuCNyfOYYD3OYguaVjmkKWBdCRaX+MX4hH6wVe2
	4ltt6wzWtUrnBjz9Rup6Z1YYeXanDzPvwQMJfIi8q+JMK//eYGRfXL8S33ZAQ+L1o0MMkcTrliN
	UJBeZ8SPkUvcVBrUOKPC1iN2QINMP2lNNnHsE+5sIKnvS17IvL51LFflBOrAe2AkHiJA==
X-Google-Smtp-Source: AGHT+IHKyMuHhag8ZOByJFmk1Ifp+SWFFmJZZLFql4fjdBJ3bTCSJXcxMK4YsTuE1B/9R5Fp15TBOEDcXOc6wQ==
X-Received: from wmbdz10.prod.google.com ([2002:a05:600c:670a:b0:450:cf3f:2a89])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d10:0:b0:3a5:5270:c38f with SMTP id ffacd0b85a97d-3b60dd0db62mr8326635f8f.0.1752796076663;
 Thu, 17 Jul 2025 16:47:56 -0700 (PDT)
Date: Thu, 17 Jul 2025 23:47:44 +0000
In-Reply-To: <20250717234744.2254371-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250717234744.2254371-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250717234744.2254371-3-smostafa@google.com>
Subject: [PATCH 2/2] KVM: arm64: Map hyp text as RO and dump instr on panic
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, qperret@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_164758_692467_4729262D 
X-CRM114-Status: GOOD (  15.10  )
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

Map the hyp text section as RO, there are no secrets there
and that allows the kernel extract info for debugging.

As in case of panic we can now dump the faulting instructions
similar to the kernel.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/handle_exit.c    |  4 +---
 arch/arm64/kvm/hyp/nvhe/setup.c | 12 ++++++++++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index de12b4d4bccd..d59f33c40767 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -566,9 +566,7 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr,
 	kvm_nvhe_dump_backtrace(hyp_offset);
 
 	/* Dump the faulting instruction */
-	if (!is_protected_kvm_enabled() ||
-	    IS_ENABLED(CONFIG_NVHE_EL2_DEBUG))
-		dump_instr(panic_addr + kaslr_offset());
+	dump_instr(panic_addr + kaslr_offset());
 
 	/*
 	 * Hyp has panicked and we're going to handle that by panicking the
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index a48d3f5a5afb..90bd014e952f 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -192,6 +192,7 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	enum pkvm_page_state state;
 	struct hyp_page *page;
 	phys_addr_t phys;
+	enum kvm_pgtable_prot prot;
 
 	if (!kvm_pte_valid(ctx->old))
 		return 0;
@@ -210,11 +211,18 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	 * configured in the hypervisor stage-1, and make sure to propagate them
 	 * to the hyp_vmemmap state.
 	 */
-	state = pkvm_getstate(kvm_pgtable_hyp_pte_prot(ctx->old));
+	prot = kvm_pgtable_hyp_pte_prot(ctx->old);
+	state = pkvm_getstate(prot);
 	switch (state) {
 	case PKVM_PAGE_OWNED:
 		set_hyp_state(page, PKVM_PAGE_OWNED);
-		return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
+		/* hyp text is RO in the host stage-2 to be inspected on panic. */
+		if (prot == PAGE_HYP_EXEC) {
+			set_host_state(page, PKVM_NOPAGE);
+			return host_stage2_idmap_locked(phys, PAGE_SIZE, KVM_PGTABLE_PROT_R);
+		} else {
+			return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
+		}
 	case PKVM_PAGE_SHARED_OWNED:
 		set_hyp_state(page, PKVM_PAGE_SHARED_OWNED);
 		set_host_state(page, PKVM_PAGE_SHARED_BORROWED);
-- 
2.50.0.727.gbf7dc18ff4-goog


