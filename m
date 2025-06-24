Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A21C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 09:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnkSB92ftCEMF+gRpwfaLkPqS/gljqC5XzxNgYk33lQ=; b=2d7gghkl3Zva/P6XO5GLhiHuBI
	YFtGPde1emItSeovT/FMporhO+O94rI7jTXqwT1awd7/r7OIPH1tX0flNtOHgDvDKU14jBcNmABIV
	byj/6si0ghp1RqH9wiCtnR629H0MmTFbog3uKE6gBm73kAkxp2sRTKFxBFq2d7XarhRWn4HI0VXVO
	s9dS7y5pmsr09EbHoE/HH/oDmpSI6pp5LggbjaGzqNQi/qx31sgVePixq91EkWflDSzuIrf22lPMC
	saxx/bVnqT7sOmeGD2G5fiiebYYNyVia0H7joAAa5aLGP6Y7eOuXPeiua6q5KF7BZwLFifqpDPV9p
	D60Xx4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzwr-00000005BWW-18kM;
	Tue, 24 Jun 2025 09:28:13 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzrx-00000005Aog-3w6v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 09:23:11 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4530c186394so22716095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 02:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750756987; x=1751361787; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gnkSB92ftCEMF+gRpwfaLkPqS/gljqC5XzxNgYk33lQ=;
        b=tgZqE2g6ducCMJczrUEVa6lBUO9eeOt5E+kaQXoBXx1hYoVrIHWRyq7Gv3gYS3BuY1
         mI6A/yJFKG5gl+W9ddm8bwxUNOVyx3e5M7hb9Lal/4bTQhB/Ol1DiZkN1WCwGqV5DRf3
         NYsTblIXotlDrOnjCcfi5BVS3fEn8aG48kdN3q6Yqsg3mbjuvASh9srdRs0iFa4lNoyC
         xBwipv3gt3T4IkEhjmVjn5qoKvxY9pAnnmU2iSPRIjmO2WsiG0xsBc+gVNSXwLUSPE21
         l1fmOnyp6CK993RMxcu+LbjM/V7VctIHNQwEsVZXWyI84LvQjkyWwvtibH5FevItCmau
         EYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750756987; x=1751361787;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnkSB92ftCEMF+gRpwfaLkPqS/gljqC5XzxNgYk33lQ=;
        b=gn+ZYsB2belpDBsxrFu2HEBzIBVe78b75qWJ10tczZ7SMHISl+GhVQnwrYPd3trTEg
         BOqZUvOFDMlIzs6419wzqM9Hekr+z+cTlDKyLf3uqKftqj7J50LZZ4mEYAvaaLZqM8Ap
         OftZxiZwYTFlHzAp/Lv8DUEPAIfZ1Hwh/wWfTEt6zY/VN50sRcp53tcS0t1eCUYME+zz
         e0wVitSiy58VpmLRy4sxJLEe1f/6djOhViYwpOHldqYO3USnvVhKrCBWJIfbNgXS3EMR
         wERRCcToSRL1fEg3+I5exnYWTMOXVUws9iQ5u6FgNN00jYyygPfzb3hAXDnxXE08bP1J
         580w==
X-Gm-Message-State: AOJu0Yxt1su9EwOoRIZVNZc056TgzIU0xolr8naRYJnsYKCrB3nF/q1b
	ZpQmh4uxDIh0qEN+Y0UOauJHcGSKRbbQO1PTX2KayA6cE4QhoqVLu+wVNqF707KDaKUwzEqu0lb
	1RjjVug4KlnV0+n43oEzRrz2Lf7iR+AYUi+viCHlgOeAXigqS3IntKGNGlwvy0VGqEMcMkXsXCl
	0ZFqc+x4K3PjjpkVI6kPpaYvlY8mVNOAdCzEaRlxiiq3IhSJPdWg==
X-Google-Smtp-Source: AGHT+IENBGL6rEhAk+NNskr4lOMge+pijt5IJ1Z408FeHTt6NB0j+98GwBkWX+DuFsdVnafeh8q4qfdzww==
X-Received: from wmbel22.prod.google.com ([2002:a05:600c:3e16:b0:450:dcfd:1870])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c99:b0:440:54ef:dfdc
 with SMTP id 5b1f17b1804b1-453659c9c2amr140402165e9.8.1750756987581; Tue, 24
 Jun 2025 02:23:07 -0700 (PDT)
Date: Tue, 24 Jun 2025 09:22:53 +0000
In-Reply-To: <20250624092256.1105524-1-keirf@google.com>
Mime-Version: 1.0
References: <20250624092256.1105524-1-keirf@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250624092256.1105524-2-keirf@google.com>
Subject: [PATCH 1/3] KVM: arm64: vgic-init: Remove vgic_ready() macro
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Eric Auger <eric.auger@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_022309_982949_082DC6F2 
X-CRM114-Status: GOOD (  14.96  )
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
index eb1205654ac8..502b65049703 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -559,7 +559,6 @@ int vgic_lazy_init(struct kvm *kvm)
  * Also map the virtual CPU interface into the VM.
  * v2 calls vgic_init() if not already done.
  * v3 and derivatives return an error if the VGIC is not initialized.
- * vgic_ready() returns true if this function has succeeded.
  */
 int kvm_vgic_map_resources(struct kvm *kvm)
 {
@@ -568,12 +567,12 @@ int kvm_vgic_map_resources(struct kvm *kvm)
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
index 4a34f7f0a864..233eaa6d1267 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -399,7 +399,6 @@ u64 vgic_v3_get_misr(struct kvm_vcpu *vcpu);
 
 #define irqchip_in_kernel(k)	(!!((k)->arch.vgic.in_kernel))
 #define vgic_initialized(k)	((k)->arch.vgic.initialized)
-#define vgic_ready(k)		((k)->arch.vgic.ready)
 #define vgic_valid_spi(k, i)	(((i) >= VGIC_NR_PRIVATE_IRQS) && \
 			((i) < (k)->arch.vgic.nr_spis + VGIC_NR_PRIVATE_IRQS))
 
-- 
2.50.0.rc2.761.g2dc52ea45b-goog


