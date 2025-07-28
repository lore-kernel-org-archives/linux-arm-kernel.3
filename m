Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D503C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBRRf2ok05qV4V10RyprFxOV/7isNWPsP0/960vxN5o=; b=Z4lT7dyRfCsMKbl75bGc1aPtZo
	wngdfprBcySHK27AYwFJgN5Eo0h7UmOmX50BTzQQIIRzJ20AA0RR0GIrsrFhIS0RQzFM4N5xofJ9G
	YcA4plN9le7yODY3s/hc2HJcTFZRYTQ7Q/ljBTgfpo4yDIHYim170ysnHwMkaqKF47U/U71Or0c7g
	s8RYZ4eYThpe72fSVXLGs+KLmcKutcvPsRw2cN+RAWOjky9TM9vEq9YKSJZWkL0lhBXLiK5O/IC0A
	WKtWmQ6HS/SfcECmf2iyrjP2eZrMIt0GHf8GnCfAtgUby0lslZLlgUMGpM79Dtl1GQ0iHEV9fgRM8
	FN0cIqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTic-0000000FHmp-3f9y;
	Mon, 28 Jul 2025 19:41:06 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2Z-0000000F8qi-2QJs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:36 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3b785aee904so902988f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725213; x=1754330013; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UBRRf2ok05qV4V10RyprFxOV/7isNWPsP0/960vxN5o=;
        b=KyAY7ankYLj1kGY7W42kiIp1EFNIJxnubVgnxTbP0vSQuaC86wQ4KQ7c2/xxId/n1S
         B9mH1jGhe6YB5QCWcytsYFg9REQRuC+l65dZpkU2et0cqCY5SY4BSHRWwyM3of6gjauu
         ztEagfVzxLw0edDVwnkFJQkEsfS/6u7Gdge2cWtqSVTYpkmjNwaANfsu3MU6WpygBs44
         fDdMemRMZv3yuEJd8iEySyUM9SS1GzxyGdyagJ4374aTIbCOAHq5clGzyM/HA3HgNHYZ
         q1ssAbckoWrMUjPHQJgod+a643wD+CRrnKtr/nYQbU+PjGRN5sT2VeKqtq14jSxc3Klw
         +3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725213; x=1754330013;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UBRRf2ok05qV4V10RyprFxOV/7isNWPsP0/960vxN5o=;
        b=pP824drTdIPrqgCb7KPmz26nYzk8K5sIvWN5U7j6ZeDLTIbaPbji4Qyx7eY01qwjrz
         2klmjzX92lZZ50Z3KPRBG/BzeMvAnEtMaBQSreA8QsaXa1IptQ7647WejoYfgzvQCOgj
         mMy2tpQbeN6KgfCGCEnMU5RAfphC+v4qJTJBtl7H9rjGnDtF1jb27iHeIixvTCTdnf1z
         e4RF19TPIJU6xWWggYZJEw8EEiGVtTDmjycvmGgHMsMd+rxeGT9f3Cc/uwdxlHqZcX8l
         FIQjMlA/L2+qrxXn3gkd12SbKX7PBZuEEsPhjPt2Y+YtdKSiMtoPAs8RNrjmPFh9KX97
         doqg==
X-Forwarded-Encrypted: i=1; AJvYcCWsN+U8sK3bXjzWuRUIp7Yv3qhoLVXLR3Umc+VYretPa8cXYYyuj0zJmCEnDkhq8Oh1t+u1v0ajr6yyd6E7/gAv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5wmqBsgS2Jug75GTO3Hd4OHGImToHmKYus7t6QeMwgs/bJn8g
	gKEuY/W7WqdfK2LorSc1szxWoPaGzocwsMyx6MJGvHHSvazeC9sCf1E7glx3Qkgc81EMJN1jb+E
	X1kU+0HNcjsGXJw==
X-Google-Smtp-Source: AGHT+IEdo5UmQraGXTZJ9gCaHcWtxJIv/tFc5vNP8HwnzGiRANkg0buplE/XnYHC6sojxb0f1IZVCz/ntN1JZg==
X-Received: from wmbji2.prod.google.com ([2002:a05:600c:a342:b0:456:214c:845d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:290d:b0:3b5:f93a:bcc with SMTP id ffacd0b85a97d-3b77675be5amr9578336f8f.35.1753725213520;
 Mon, 28 Jul 2025 10:53:33 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:52:50 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-4-smostafa@google.com>
Subject: [PATCH v3 03/29] KVM: arm64: pkvm: Add pkvm_time_get()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_105335_619113_6193B8F1 
X-CRM114-Status: GOOD (  15.15  )
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
 arch/arm64/kvm/hyp/nvhe/timer-sr.c     | 33 ++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index ce31d3b73603..6c19691720cd 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -87,4 +87,6 @@ bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
 void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
 int kvm_check_pvm_sysreg_table(void);
 
+int pkvm_timer_init(void);
+u64 pkvm_time_get(void);
 #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index a48d3f5a5afb..ee6435473204 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -304,6 +304,10 @@ void __noreturn __pkvm_init_finalise(void)
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
index ff176f4ce7de..e166cd5a56b8 100644
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
@@ -68,3 +72,32 @@ void __timer_enable_traps(struct kvm_vcpu *vcpu)
 
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
+	/*
+	 * TODO: The highest privileged level is supposed to initialize this
+	 * register. But on some systems (which?), this information is only
+	 * contained in the device-tree, so we'll need to find it out some other
+	 * way.
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
2.50.1.552.g942d659e1b-goog


