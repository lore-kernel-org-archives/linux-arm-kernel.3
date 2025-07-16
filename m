Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20085C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 11:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lw9Wdz3TAUoCooOMv3X14CEUxWY0AuV/hf0NzcKNFE8=; b=UMl0ceHRkNFBgU/C5JH26geM5z
	vmZgjB6vz320fuOaypqDg03H80tEL2m7ef+LUBM6UgTvELcQXn1XRvc4ituQMWQ7TUAjWc2Q4KrT8
	CUr/8WLE0/hBkUWREOo0JRYds7QQ5odrWwfcxgls6yYWUFJk2NCFHV8D1By0NaVZZp9956qT6F/c+
	pnQ/auO+wZONLzf/zt07XscmF6i4zD5NptqapRd5BNE0BE0PwGhE1Vf+WViJknb/4YfIOZXOUEb4D
	oedegUmtQ5uxo/iVN9SmJFm/6cn+kOe4pbqH7v49ivDZDBr50JhkHGu6k3KmgIpYdx9HJt7zQC7fK
	xrDUnHfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc08t-00000007XMZ-2lF4;
	Wed, 16 Jul 2025 11:17:43 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzzG-00000007VEb-2Qza
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 11:07:47 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3b604541741so2070489f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 04:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752664064; x=1753268864; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lw9Wdz3TAUoCooOMv3X14CEUxWY0AuV/hf0NzcKNFE8=;
        b=NODz9GGFEyIj6Y2CgMViXJ+ijudWyNo23uMX+glNaVy7nemjcWCDzb7J/HU+t1ZjEq
         XVc7UuCp+r8gbuYN54e4AKpB8AGwbOMKwcYX4QIpwTwYYM9MDZhKUHAMtybqyZHVeLrl
         gEW4ohnKnv18FfaikyaAXLc+DvXPBpGHmDWBKGbEkRWTqcBzBSrJKY/znBiYyqgmCi7m
         5PmjKvOo2N3aodOC0csiFxhri3o9znlG3TgZTCsCwNQO8Ph6MCzsJXlRnjT+QJLC0kZO
         EsyTz1ZAVz2Za5bdXgMXCxGrpMfud6+MKs4M+fgLfbZApbtBzWKLqmAXTpciHs/kBjxV
         hXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752664064; x=1753268864;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lw9Wdz3TAUoCooOMv3X14CEUxWY0AuV/hf0NzcKNFE8=;
        b=KVVZdTu6v6MAFTFCmNCfyhiZiCLXMwjmumShD6Jjk9lg78h8cNb9p9ceZV5WKLDVUI
         +g4Sd9pBtStKH8tDz0xOdwN4QIYa+mVaHkx7j7P7J9BYNIDKLVcTUdLhE0YG/XR8rlaG
         /GqsB1kLbha2kbA2IyKhXc1a5PI/kt6eXVYMIBxDN2aAptRChUHgoIdaFQr0CmirxAuB
         XmvYSzNxHPZ6D+gyAKNOg0lQvBikCqgyHBjvxQmRJ5WXVOyhTpJXYFAC9CVbPaPRE0Vu
         UDpwHQ8STQBYcKQw5DHPFY4sPHknJsxs78te2VhH/stRwck85VZWb7ZzGuD+zdMdV44+
         NV4w==
X-Gm-Message-State: AOJu0YxOul5cExjac8TcHCd2xIKq8eY4uS2vOeRSqfb42RVu5zGbluYa
	SMJWb7HIdcuag0qg8fh2+TaoxYww2QXUFsVJKE3tiybyZPWkOelmzl+akcn4yYtIBDeRfwColXY
	NSIOul96LkGapk4Y2UFVPvSY9ugLbU6xseyUXEjsaFCRru0lWxACoddycnC0v872XaRJFsXR0e6
	7YQkl0KEa0lVkvdf8VLfVWm/gxRYPE0jzac2qrmoN4fhF3iEi08A==
X-Google-Smtp-Source: AGHT+IHuNxCrx7B1F7XbHUaYm3AAwwPyLKTJsfFZ+D2KSuL1269JyI8e442f/hH+yv6mKmRQSSBPsJCPSA==
X-Received: from wmbek10.prod.google.com ([2002:a05:600c:3eca:b0:451:4d6b:5b7e])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3481:b0:43c:fcbc:9680
 with SMTP id 5b1f17b1804b1-4562e3c4b8bmr18712195e9.25.1752664064367; Wed, 16
 Jul 2025 04:07:44 -0700 (PDT)
Date: Wed, 16 Jul 2025 11:07:34 +0000
In-Reply-To: <20250716110737.2513665-1-keirf@google.com>
Mime-Version: 1.0
References: <20250716110737.2513665-1-keirf@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250716110737.2513665-2-keirf@google.com>
Subject: [PATCH v2 1/4] KVM: arm64: vgic-init: Remove vgic_ready() macro
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_040746_663152_8CE59E08 
X-CRM114-Status: GOOD (  15.00  )
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
2.50.0.727.gbf7dc18ff4-goog


