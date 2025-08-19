Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D90CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 09:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7GQRkJjLj0j3dNMqeMnq8zCLevsX26SkayOg/7wVlQ=; b=HzuCekA85sazRBRDUOncsljlWZ
	rOx+MdW8nI2zZNN+v/Bo6tnfr5CQstNY/NggJiudXSTHt8jlixzgog4pvOTo0T421cr5+YVoXuLXC
	4Hwl0A1KOCPyU3Ui3jgrvfm+S6POwueHOEMPqCeTHa0vvNxE+TRuSLbOvlHU2bk6xtlplDrjcgaTs
	XYC18ZdBgapGTpLGCTJgVW+BImFPNRApi8hXb4D97/Fp/Xa/3ZE0zT0Q/ON8bPORKkUgdhj31mxoE
	6FOrHBv2oZcVGNUcTwIKyRL3Q32Qw2dphi6tnlMwUW6zxTsf6mt8hZxKIBJci63ioFagOS7xR6XZy
	H6PQELBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIwU-0000000A1HL-18cV;
	Tue, 19 Aug 2025 09:47:46 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIKz-00000009tkm-2fHu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 09:09:02 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1b0b2b5cso32442455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 02:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755594539; x=1756199339; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b7GQRkJjLj0j3dNMqeMnq8zCLevsX26SkayOg/7wVlQ=;
        b=E71rzYwpc1LUTqivAuMFzZlnThcqqiTtKgmqsXJ27EzsLLwQ6hjTkfTIJb7RblTUxR
         eyC5EtK5aDCcIaeauvdA9H6G9GWr2RutPEUj46xDrnLbJLNUpdqw4a6dbEco6G4LsVEC
         sFai20OqVcYnGtZy+iExQkLG0Izm6JZwYr5WphZvMQ17Xoj4lQQH3+biE+3CKixWa1Yr
         lNZKaxOf58ik3jlB5Edm4lwlaWouATciUuAd5x57wtugxq78vNyI0bnWfBJFAZOPrhKX
         A3evsaMF/tMOySZTUm54M+gQ9KZzlk0mAaMhfTqYtKaNzdeNV1SZ4uMqMcrwUx5ylWgu
         cqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755594539; x=1756199339;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b7GQRkJjLj0j3dNMqeMnq8zCLevsX26SkayOg/7wVlQ=;
        b=OK8AVJ8nNl1i6I5CwbZMDsp+toLlVoGTTxz0t5q1Kp+ZZlW1WlitwCJIXAoI1gELR/
         Jqs1VLSu/88mQOv0x4tvPkrOE1x1/8Zc7KJbq68OeABSteFw60ABPMSTabT9QvaCLLHl
         is0AY/4c18UodrzurP7DtN0Z+Gu4qd0bxAqLVdZV8aEFals1HMfysMjQPP/ZuuXL7wJR
         +c68mznBBNWz3o7dsilpMMrlvGZCStFrSy20bd6SVYpTR8LaRR1DzveAvEk7l3oZjxGI
         zIFbniARg4muZdEHQlKQxhXSx+OSFRoFRoF1c8Ei0tdJzV7eGwGBls4lcdbJF1Eap2Fo
         bNRg==
X-Gm-Message-State: AOJu0Ywk30iCBkmuGA7VO5DEz0sqbBnZ60l44QofzKhD50y8A13VhMQX
	AcGGxzYtKHjfMtRbHZC++/SEXBhaHfMcfdynNwzsCc9fOIhFkdudiArfL7RzX9kGwqwxTgP/T6W
	1+fNNVEIshArTdmbN9Ijhp9U6ObrH7g2MszIyNhIH+QoM/WrmwcAf8HT8XJja/19szPRKpnHioY
	Ew7taIvcXIjzNGI+0euG2g3EdYO8wfvQiN8MO+l0hpSWdGfnAs+w==
X-Google-Smtp-Source: AGHT+IEl+5DEbXQSzekfCwJnh9tAA1jzlM78/0IsLI3MJWSPRp03wLItZPI7GL4eVRBnoTBswnyDHI1oMA==
X-Received: from wmbeq12.prod.google.com ([2002:a05:600c:848c:b0:459:db29:1efa])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f12:b0:459:e3a1:a0c4
 with SMTP id 5b1f17b1804b1-45b46190a32mr1402635e9.30.1755594539541; Tue, 19
 Aug 2025 02:08:59 -0700 (PDT)
Date: Tue, 19 Aug 2025 09:08:51 +0000
In-Reply-To: <20250819090853.3988626-1-keirf@google.com>
Mime-Version: 1.0
References: <20250819090853.3988626-1-keirf@google.com>
X-Mailer: git-send-email 2.51.0.rc1.193.gad69d77794-goog
Message-ID: <20250819090853.3988626-3-keirf@google.com>
Subject: [PATCH v3 2/4] KVM: arm64: vgic: Explicitly implement
 vgic_dist::ready ordering
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_020901_674072_905C27DF 
X-CRM114-Status: GOOD (  11.63  )
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

In preparation to remove synchronize_srcu() from MMIO registration,
remove the distributor's dependency on this implicit barrier by
direct acquire-release synchronization on the flag write and its
lock-free check.

Signed-off-by: Keir Fraser <keirf@google.com>
---
 arch/arm64/kvm/vgic/vgic-init.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 3f207b5f80a5..ccccb5c04ac1 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -562,7 +562,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
 	gpa_t dist_base;
 	int ret = 0;
 
-	if (likely(dist->ready))
+	if (likely(smp_load_acquire(&dist->ready)))
 		return 0;
 
 	mutex_lock(&kvm->slots_lock);
@@ -593,14 +593,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
 		goto out_slots;
 	}
 
-	/*
-	 * kvm_io_bus_register_dev() guarantees all readers see the new MMIO
-	 * registration before returning through synchronize_srcu(), which also
-	 * implies a full memory barrier. As such, marking the distributor as
-	 * 'ready' here is guaranteed to be ordered after all vCPUs having seen
-	 * a completely configured distributor.
-	 */
-	dist->ready = true;
+	smp_store_release(&dist->ready, true);
 	goto out_slots;
 out:
 	mutex_unlock(&kvm->arch.config_lock);
-- 
2.51.0.rc1.193.gad69d77794-goog


