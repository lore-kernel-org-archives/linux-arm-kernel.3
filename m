Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0BACAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hVlCzjahaiEGhplG9Zdx1nbP2OLi1/QyI4a7DScZAA=; b=m3H4pQTeHV8WqyLycyEn3s70Bv
	xC07g+crSKtt7jpU4d+uVwN0Pq5ZYqGpTpn6h0zAHfXqKIvYq4R2CXk12wb5mtPaVqxat1AzWtKRV
	Q7rJCWIJl0qGCjBHoSvtYupKTZuB4OSTZqQu5zRi8w3aRTwCAKjeNnzrDqI/0HaJXeBMH2LIMOtbc
	QkGExY0mtHIqfHlDYy2Rc1hdSisYTnotYZjWe9Vb+k7sxRRL05Vg1BPtoYVk1kV+8ielXecLPcNBM
	lZq5FIsDxH5NXGxKTv/YcW3VK7979G5t5WbXHuUAk3GSMTgqhVLjaUaoGcV+xiWBxHC0fXsaGJ6Ij
	lb4F/15A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1OW-00000008Zrr-2fub;
	Tue, 09 Sep 2025 16:40:36 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv97-00000006Cli-1DAf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:00:18 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3e753e78902so137815f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757412015; x=1758016815; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9hVlCzjahaiEGhplG9Zdx1nbP2OLi1/QyI4a7DScZAA=;
        b=1BejnhCTp7c91dMUAFraeCVbpvksVzqexwdTDp2pQBKroFMlccPfHp1PCPY5v0mY/H
         EquJbjMTh05HLPQbqcmcbZ5M0h+g8FuD5m7mtxaV8JLhRA0GqKlYE2d7nmT7D2pE2Wbc
         HSXScxsnCG1HbvS3MzkzV9+Q6IF4+7nqw7l0TFY+IZe/W9wFbBFEf64hzLDp4D6krcUR
         ljbkScBg2eP2OO5WfKSgl0LDNwlnzvgHmBsxij72SohLHeg1lbli1bhMAoxGF2QCKhM1
         ruC7Ja+kKCDMo9yu48mhsF5dOSd6IfcdSsw0s4uSgzcxZqqqqrJO2p6MymykouVJwyxu
         RUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412015; x=1758016815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hVlCzjahaiEGhplG9Zdx1nbP2OLi1/QyI4a7DScZAA=;
        b=r6l8eGnHl2E8b03ILLVgbernQSeoUtB7bc6WiAC7lXSb8Lh5Qph3JhGLrgDp44stLh
         MqnKv2aQcSKteSBssTIm5pFonMCXri2bChKMAco2epu4uawkc0Tb8kxcUJJHwQy7xUgq
         33hVNecvqiMn4antEfIN83jc1dhRnaDWV9IDaKkHNa0rqPQvf3u063PPZNHkL0lRUsoU
         UgyfFnOAcJYoFaS7zUi6snosSxZU2hygNp915lebyF6B7fJ4ruuOi0GdcdB0UcUeGLSq
         +avYJhy5lUFivb4ELsuij/evWXMzdp2PZppOsSA+mbSi+fK6QfhmUp6RyehR9cI1/xQ8
         TXZw==
X-Gm-Message-State: AOJu0YzN0YKD3s5j6OCfM3DRkUUu1Ds6sHc/zV/F3fl5TuS1PPD+iQf3
	U8vocylWxRgkXoxUWUKIA6Ycja4kkNvmiKJymbNZIVC5K/LbAYCSaZ6Vm0B9qLs7fKHMmNEQP8L
	5Y4n/9cHGDSATu33LjxtnRdrEl9gKl6kzKB96BNb+Zp8m9yPPOeqxIutRuDFtMwpsylfKXqJ1GQ
	/lMhvfKtyZM3TIZQN/zJbzvo6cluSRCMgcmazRP6mY+JBW1sUDAw==
X-Google-Smtp-Source: AGHT+IGeA46JHPn4PsdMlz1aRauFfewChlBh5UIalpMRgks3j6VnU3FPD/svB6rNtJIzDBHZErkOZlargQ==
X-Received: from wrtr3.prod.google.com ([2002:a5d:4e43:0:b0:3d4:dcf3:824d])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:25fc:b0:3e7:42ba:7e66
 with SMTP id ffacd0b85a97d-3e742ba8bfcmr6891763f8f.3.1757412014690; Tue, 09
 Sep 2025 03:00:14 -0700 (PDT)
Date: Tue,  9 Sep 2025 10:00:04 +0000
In-Reply-To: <20250909100007.3136249-1-keirf@google.com>
Mime-Version: 1.0
References: <20250909100007.3136249-1-keirf@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909100007.3136249-2-keirf@google.com>
Subject: [PATCH v4 1/4] KVM: arm64: vgic-init: Remove vgic_ready() macro
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_030017_334190_746C8D13 
X-CRM114-Status: GOOD (  15.59  )
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
2.51.0.384.g4c02a37b29-goog


