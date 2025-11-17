Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A750BCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdiIv9AzHH9LJUmk1x5XNuh2D17ItySFVQ+lpR2xjRw=; b=1Ten84xsW1sD6eVE8Y0KoEAtT2
	FY6QB9G/jMM1IwFHbTWBr8ae9tFhu3lz1oDLD1fuTlUAMvCNZHnTqqGUhDtgLmK087KdgxzSx3ZtO
	mCXEa4xIBPs8Ziu1ro17PWQ4McmhxWIkwFGngkzpNFEEIOKnrMKz8WieeCtZNXgmO4D7Y4mKaVHA8
	mkQpEW54dpn1YZKCGM5ffx46adLDJLbKTITQdtul2Jxab5qW7NnkNSV7Y8WePuqdA4lS2lc8y5JyF
	JP+q+jdDVHsfcMagPqPIAehOeGazC9FlHyYC1Z57dOZc577tgL/bogoJwGRInHl3zY57jUqsgtBVO
	eSWY6ZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HF-0000000GdSr-3LUt;
	Mon, 17 Nov 2025 18:48:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HB-0000000GdQC-1qKo
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 18:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mdiIv9AzHH9LJUmk1x5XNuh2D17ItySFVQ+lpR2xjRw=; b=U8whofCvSl7jN8ScwWJGN6DcAr
	TtO1/R80itqEbkhPRJI2H2ddhZNn8xx/Z0HxrZNQy4w3GVAyJ86P478VL8g0HpRlw/jmOT+rcqwSw
	uEDuIWvHUH/QHs/+ZZts/kuWj2wGPUw0vnVoSKjBpSThblx8Bcb3QLaR5djHVS/rAXu8e65SF1NiQ
	35iVbXJalRmnUkkgHs2u/L6JJuHz1hoCaZFp9ICvDh0jZCDUa8nXVeRp7/FcDL8NlXFtXQ04cdKkd
	pJJqDFgngFZYaZpEDHw8CEhZujDaCgpdmytv6l2uBrXDbhTp7+d+R55I/2EZ7E4MRt5wTU7Uw20jd
	CC97m9cQ==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3PU-00000007wY1-45BM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:53:06 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so40128525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405309; x=1764010109; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mdiIv9AzHH9LJUmk1x5XNuh2D17ItySFVQ+lpR2xjRw=;
        b=H0bYtG+fFLPO+VL4QZtgszMICXa6jHLjbNUZgD0YnWuUQ15o+5ud2QeAXuTCwJYpfO
         j+PKmmsGF/v6TyVKFoazGjzJqjgf8OzeKi4TyF6YevJ1T7HkoqgRpFsGAvi+NO3fXzXX
         MX/bW6fUm8TbeY2HegKs9COZbv9d1V9m0TjWPd/VqvYAteFlWjmDz8qwFTDVFLv1HLR3
         YJAjcuUb4w8LxLHe9+fjqwyeQHZgZOd5gNprEk9IHtmJgXsSj/QMZUk4UJCP+dgSO0yq
         yFtBMdT9AM+igaM3B4EmuxPhFMZyEwKnLTABTLV2B1jFqKYtLogM6vxBsxwxuxQ3oYvi
         HX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405309; x=1764010109;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mdiIv9AzHH9LJUmk1x5XNuh2D17ItySFVQ+lpR2xjRw=;
        b=nDoRgntmcutRaEy4N3GnuAHwgXh9s4dBeMLF5tnwL9tLiQEOgMknWTHEEWKSOpBeh2
         Tdyc+6RmNRwxNSPMz7UcfdZbwD4ZjkBw71PqOQg0IhCxIx/Tq9HE+8MKyNXpXK08rJ+a
         XZznzlALwUx4A3f49B+2Dbn1bZ/umfV60WJ8jGE8gr2OSw5xYlyDUjGzVbVzUZRSbFv4
         FuDjS6h6D3Hvrv7+a46EudyjMpEOIjYnGKBjlgVI3UwzMCnArEkLdPOx7LkSfIuX++YN
         I6q8PbOE9IeI7l28zjpJAB8j9qH8j4luOI0iKVkxmoMF2PF2CdylwzIa1WpxlTxker9u
         kQRw==
X-Gm-Message-State: AOJu0Yx6F1rkM4A6ZN7ZMMK2T7Z7gB8SttX0b9Ldwrh/0W0AW3poWV8Q
	V55qktmY3P7ucrW1Mf0t01zkI/t7VrfA9mVjJdoFGI1ippRlRZItUcw+MW2obwc4OOw1oOVx3sT
	CwCVgyzJIzqvRhEz90AGhogWkOYztzDeNopYoe/4sOiEPG7HCVnv7b8Cy5AXxsQy3bXsLUZ2PLc
	0yJELekI543mjmcaSMS8w7ghipFoGhQ6at+Lx095DOPc0Eo7peRJQALfikkaNSkebCjA==
X-Google-Smtp-Source: AGHT+IEIO6NZXXPWg9+hR4+SPtTpCKpBv3Ky3OdW45sXPemfU0CwllktSYR7niEb66Ks+RCqsCJfiR5agNLU5w==
X-Received: from wmbgx23.prod.google.com ([2002:a05:600c:8597:b0:477:a0a1:eae8])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b4b:b0:477:639d:bca2 with SMTP id 5b1f17b1804b1-4778fe51eb3mr117363365e9.4.1763405308662;
 Mon, 17 Nov 2025 10:48:28 -0800 (PST)
Date: Mon, 17 Nov 2025 18:47:50 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-4-smostafa@google.com>
Subject: [PATCH v5 03/27] KVM: arm64: pkvm: Add pkvm_time_get()
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_175305_142283_78DBEC2F 
X-CRM114-Status: GOOD (  14.27  )
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

Add a function to return time in us.

This can be used from IOMMU drivers while waiting for conditions as
for SMMUv3 TLB invalidation waiting for sync.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  2 ++
 arch/arm64/kvm/hyp/nvhe/setup.c        |  4 ++++
 arch/arm64/kvm/hyp/nvhe/timer-sr.c     | 32 ++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index 184ad7a39950..2b065e048a35 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -89,4 +89,6 @@ bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
 void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
 int kvm_check_pvm_sysreg_table(void);
 
+int pkvm_timer_init(void);
+u64 pkvm_time_get(void);
 #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 90bd014e952f..eff76be89329 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -312,6 +312,10 @@ void __noreturn __pkvm_init_finalise(void)
 	};
 	pkvm_pgtable.mm_ops = &pkvm_pgtable_mm_ops;
 
+	ret = pkvm_timer_init();
+	if (ret)
+		goto out;
+
 	ret = fix_host_ownership();
 	if (ret)
 		goto out;
diff --git a/arch/arm64/kvm/hyp/nvhe/timer-sr.c b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
index ff176f4ce7de..ce91719c876d 100644
--- a/arch/arm64/kvm/hyp/nvhe/timer-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
@@ -11,6 +11,10 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
+#include <nvhe/pkvm.h>
+
+static u32 timer_freq;
+
 void __kvm_timer_set_cntvoff(u64 cntvoff)
 {
 	write_sysreg(cntvoff, cntvoff_el2);
@@ -68,3 +72,31 @@ void __timer_enable_traps(struct kvm_vcpu *vcpu)
 
 	sysreg_clear_set(cnthctl_el2, clr, set);
 }
+
+static u64 pkvm_ticks_get(void)
+{
+	return __arch_counter_get_cntvct();
+}
+
+#define SEC_TO_US 1000000
+
+int pkvm_timer_init(void)
+{
+	timer_freq = read_sysreg(cntfrq_el0);
+
+	/*
+	 * KVM will not initialize if FW didn't set cntfrq_el0, that is already
+	 * part of the boot protocol.
+	 */
+	if (!timer_freq || timer_freq < SEC_TO_US)
+		return -ENODEV;
+	return 0;
+}
+
+#define pkvm_time_ticks_to_us(ticks) ((u64)(ticks) * SEC_TO_US / timer_freq)
+
+/* Return time in us. */
+u64 pkvm_time_get(void)
+{
+	return pkvm_time_ticks_to_us(pkvm_ticks_get());
+}
-- 
2.52.0.rc1.455.g30608eb744-goog


