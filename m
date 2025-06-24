Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE24C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 09:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UC6vq5jBb1v1bd72k3pkcapbf6E4MjOjFHfh0Y/a140=; b=BkrF4UDUhH/rUu2vuIaOMGCgId
	enguCkoAFhBFmlxbSytlYgIS5oUq7ZWRM4w2Tr7L2hcU9QJ2v7FycnKdLpIdS1Sb6WeZRS7L+F2cT
	8o8svorvEW9OkJGoMxoeBgjpYbjspq1pG2XtlY6lOCwXTHGpp8qMIhlQwECZgoOA9o43+Y4gfof3R
	CktZUBLZt7fhRJwfRqaAzSiOudsCz6qfw6M+9DPPkGSifGJMUOa5LF8jQ3LOsiDiQNN2hUAW4hHns
	YOjNwt+fZ5/LahNM1ILYHmISYgn2yxlaXwZzQsaIoYXh5x71Q6IApUOyOsFsnFLY4iVq+rdQjlw7b
	94QIL+XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzzF-00000005Bek-0D35;
	Tue, 24 Jun 2025 09:30:41 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzrz-00000005Aov-2HhI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 09:23:12 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a4f6ba526eso3200912f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750756990; x=1751361790; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UC6vq5jBb1v1bd72k3pkcapbf6E4MjOjFHfh0Y/a140=;
        b=O41qQdkJR3q1dn/yqnJRg2ZzO90p1G7FQcuu9qoTcJujLRZgiZ8xYn+LXx4+kS61WM
         E2RKFKF3E7j/Dz1qcYEA+fitD2hwYehzzUUYtpjuJvdj0CcyncreJ0q+uIySuXtU0jnh
         tOucaeORV3wn48rjaJU5JyI2o8aDiVasSvaDeQ+XRiBWUWVG3LGAE3E93ec9oHxiJNqe
         CjTbGAhbLzuFjOiViEsjov9nNFq2I7JYnt7iP0w4EZn5+i9pFHKrh0RDFDvbjgmDzot9
         lFIqBPGUKSSflvVtmZTWUxY3+8Pe77GTHmjnUhcCU3OC1Ofegau7z0HjVxGQe52ryPX4
         np1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750756990; x=1751361790;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UC6vq5jBb1v1bd72k3pkcapbf6E4MjOjFHfh0Y/a140=;
        b=DRS8oeldw/xST8sq8D7I9DF5R3fE9RqUfuOf7VXY0nCn5m0HKdkIDVYRWFXqbq4EQe
         Yq4EDxop3lNA9v/5iNYbjxgDKCjbJ9CNrjoRoxFnUfd8YNXflgJi4qQ+eUOcoqsVFv2R
         EZm2DQ050nSXUp6l5BdvMvNNaBdSU5a+hUlUmr3FSHX2HAnUWdZN02ypk4p2YYH7DqxO
         dF5lDAYq477cr6VtiDbwYmA6oPb1oGMF3yQ/5Jm/oXVRx2QCAr37hKnlibRLWI51Hz6t
         LvZX7wABVkXFHrfj0S1gVA8ENSgsgmolzPSD+JduO5LZ0BsD6xIAE9iDlfpYap+VF5n8
         yVwA==
X-Gm-Message-State: AOJu0Yy6hGIeq0V3rlzf5wGfyLEkKfogwflijf126NFALK3AWVTiGKlb
	yGzhtkX+geT5fYfc3VKEBcQFGd+htuRShhhOaQq9pCr9x+lZlOTPydxjb0cEsQdcLg+cCAiQ3H0
	Za5+bV4eE+XfNmj6kcTpDM+zPzJyqLmBtm20WTGx0RXy/WdcpXn8AYEJUUh94YzfemmEbW2tztH
	rrZiOIVA3EtX6LmxhyhZMh8k6zdL4GKJZCR+cElUMDbGCdnZOtdQ==
X-Google-Smtp-Source: AGHT+IEr7r98giCBtL0yinhHNgdvxQNlG3HKjSDL95dDG4D8sHcl523PslIHgko1ki0lJc9tb1d51y0i9A==
X-Received: from wmbdt3.prod.google.com ([2002:a05:600c:6303:b0:451:deba:e06f])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2582:b0:3a4:dc42:a0ac
 with SMTP id ffacd0b85a97d-3a6d1324294mr13113188f8f.49.1750756989691; Tue, 24
 Jun 2025 02:23:09 -0700 (PDT)
Date: Tue, 24 Jun 2025 09:22:54 +0000
In-Reply-To: <20250624092256.1105524-1-keirf@google.com>
Mime-Version: 1.0
References: <20250624092256.1105524-1-keirf@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250624092256.1105524-3-keirf@google.com>
Subject: [PATCH 2/3] KVM: arm64: vgic: Explicitly implement vgic_dist::ready ordering
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Eric Auger <eric.auger@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_022311_591997_98D22FAA 
X-CRM114-Status: GOOD (  11.01  )
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
index 502b65049703..bc83672e461b 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -567,7 +567,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
 	gpa_t dist_base;
 	int ret = 0;
 
-	if (likely(dist->ready))
+	if (likely(smp_load_acquire(&dist->ready)))
 		return 0;
 
 	mutex_lock(&kvm->slots_lock);
@@ -598,14 +598,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
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
2.50.0.rc2.761.g2dc52ea45b-goog


