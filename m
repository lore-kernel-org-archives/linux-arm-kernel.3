Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25488CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbYlBne+CRt0rANt7gz2XsCKAdtbMUR7nWNO2HYDU48=; b=S3MouLQGOaQYCcoIuIxw64QX81
	MvAEVMB8Ec5lTh4sWr89HX1lBGJ8MWsndab3bpSBkgBoWCmUYXbwSM0OF8KeiGlaFxUDWHY+wc7xl
	KfAB71Jap+mmDEmbdcySrOr/uMqsEFzTbT6eJjduRd+Y5jrTJv1+mSd63i5d6Y/n0rsFxuVkuqvA4
	kzWany18oPT3mV8rW9Nlo76r7dqsJ9L3a5ShSpc67q73QA44+qHmKRfE9ZE/4UBnlDxF6+nMJUF2A
	XElC6FguyqaSFXTvqRiRTozxgqUrGFJf0n8NfeVyIjEzPq2/4m1IzVIg6bGoFmzbfBvE5Si0ij8dv
	th0gSVSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoItv-0000000A0tN-1DFT;
	Tue, 19 Aug 2025 09:45:07 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIKy-00000009tkV-37Cm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 09:09:01 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45a1b0cfbafso31431015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 02:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755594538; x=1756199338; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RbYlBne+CRt0rANt7gz2XsCKAdtbMUR7nWNO2HYDU48=;
        b=SXWSf5KWmjUSqSa+q3ckK4yyg3iy2iqzJ2hv71lRLflOtbSm6kSCxaIjpLxghwWsg1
         peDQ94mLGRPgN2vzzcdpbXwtI7p7yoD6XlfhOiTyVkbIkOj6Pn+kMbqIONZGtJLkmLcI
         Y6KfAShzdxH9SeKPVxv80MX3049ELTgZFIBMVXBj2avolcL8CUKLAQl4fSbQ1WiAlRsQ
         zS0gjMCB6VYSAJ8164AhVeO0mkIqUUaOHKfFJ3Fy9G8Ka4jcP6mrBRdaImio6gLbBn+5
         CiBU2u/hQzLoKugsM9JG7xF6c1X92SJchiRaV9Epsz5uDUbhOpNnWwbPvaH6OdgqwPfa
         NY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755594538; x=1756199338;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbYlBne+CRt0rANt7gz2XsCKAdtbMUR7nWNO2HYDU48=;
        b=Nixl+pBVDmOxdEB7NwmirYp9Gp3/OJcM4nk3ELrZl1bAd5yyGlh6W6PwG8rHNho8qV
         i7BBKh09x9jCXAUNJDSjF81UT1H0cZgPME/kHxS1VrhAKek7zcsX8VAUe7vhjQchbUYj
         YXrdFo7WaaNyOZyX2RPI2uO41jCqM4d6UF7ASAm9xnsapoDmsimvGkktPTMnj7XQe9Ot
         hGBAfaBsl6+lyKmaM0bNSB68wEJM2/LctAq06HXFYNyH0YvwdKbjOSEQ5yQjmChXI9bu
         UtmB5uryTobuOoesvsZf2d/dwzPe6UEZyvDu2eCLtTq13wwQF1NFzMqlmZogkxEdLCoz
         mkNg==
X-Gm-Message-State: AOJu0Yy2kSgvwh3kF+aKRNBgNLzWt2MBkesxZVshtA92txaRqWp/lnHX
	N64p/lRp44kXrwFB0hWbbgfgEZtvHEldxZYThSD46WVyTIuNl9leWzzQnNZ6bbDsNZylktbXjU1
	+uIzKDNIb9iPQx4VGoo5TvEzhC8kH+AQxxBdGomaBfB0ogN0HD+gw0BtNYqjFwsuQwzVQil7twU
	QsfjKvIsECad88BluHZXarK8Ww25m2pHzJhbRX3B4AAQQ27ArmLA==
X-Google-Smtp-Source: AGHT+IFTda9OEOY5S6WXkDS//BLctKGWXODfwGT2L71EAeMG+xw30IhSWH1WfqqbuVudUz36x/Bwh88Big==
X-Received: from wmte11.prod.google.com ([2002:a05:600c:8b2b:b0:459:dac7:4ea6])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4750:b0:459:df48:3b19
 with SMTP id 5b1f17b1804b1-45b43e07202mr14121285e9.18.1755594538057; Tue, 19
 Aug 2025 02:08:58 -0700 (PDT)
Date: Tue, 19 Aug 2025 09:08:50 +0000
In-Reply-To: <20250819090853.3988626-1-keirf@google.com>
Mime-Version: 1.0
References: <20250819090853.3988626-1-keirf@google.com>
X-Mailer: git-send-email 2.51.0.rc1.193.gad69d77794-goog
Message-ID: <20250819090853.3988626-2-keirf@google.com>
Subject: [PATCH v3 1/4] KVM: arm64: vgic-init: Remove vgic_ready() macro
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_020900_779874_553C64C1 
X-CRM114-Status: GOOD (  15.58  )
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

It is now used only within kvm_vgic_map_resources(). vgic_dist::ready
is already written directly by this function, so it is clearer to
bypass the macro for reads as well.

Signed-off-by: Keir Fraser <keirf@google.com>
---
 arch/arm64/kvm/vgic/vgic-init.c | 5 ++---
 include/kvm/arm_vgic.h          | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 1e680ad6e863..3f207b5f80a5 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -554,7 +554,6 @@ int vgic_lazy_init(struct kvm *kvm)
  * Also map the virtual CPU interface into the VM.
  * v2 calls vgic_init() if not already done.
  * v3 and derivatives return an error if the VGIC is not initialized.
- * vgic_ready() returns true if this function has succeeded.
  */
 int kvm_vgic_map_resources(struct kvm *kvm)
 {
@@ -563,12 +562,12 @@ int kvm_vgic_map_resources(struct kvm *kvm)
 	gpa_t dist_base;
 	int ret = 0;
 
-	if (likely(vgic_ready(kvm)))
+	if (likely(dist->ready))
 		return 0;
 
 	mutex_lock(&kvm->slots_lock);
 	mutex_lock(&kvm->arch.config_lock);
-	if (vgic_ready(kvm))
+	if (dist->ready)
 		goto out;
 
 	if (!irqchip_in_kernel(kvm))
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 404883c7af6e..e7ffaf4bf2e7 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -406,7 +406,6 @@ u64 vgic_v3_get_misr(struct kvm_vcpu *vcpu);
 
 #define irqchip_in_kernel(k)	(!!((k)->arch.vgic.in_kernel))
 #define vgic_initialized(k)	((k)->arch.vgic.initialized)
-#define vgic_ready(k)		((k)->arch.vgic.ready)
 #define vgic_valid_spi(k, i)	(((i) >= VGIC_NR_PRIVATE_IRQS) && \
 			((i) < (k)->arch.vgic.nr_spis + VGIC_NR_PRIVATE_IRQS))
 
-- 
2.51.0.rc1.193.gad69d77794-goog


