Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1560C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 11:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hxqszaeuljrqlm0t8DgnPuG7w9pgNEhhBTVGlWt0Bfs=; b=vxKLTCrpPxG1OmO9AdqJqiWRLl
	gm3qRQbuCO5IWFvcf+ae4LGMUCOUGCpzJBGDD9i3wfOZs/AsLEha6qAzNjLUdqv1wT0gYEyKz2aY3
	R4b712nt1wYbRq8wPBd+0Zw/kgsG3xvGTvyBrug1Wl0Sh0nAwxVi+E//qog1J1G56a/8kYIMFXiZY
	f/OzJwegbdO4tmfCgoZW3JEQAxs4bumPAtTn0R5BKMUpo4OpFinm/7LskLuDzAcfjeIImFcIYvB0t
	kFPBauoDWq3vyzInZJeHwgB5ea3/qj7qqqk3SbnKPoqvTttmQceTiD1D6xitisUW7GJPhcn2DaveP
	973SgQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0BI-00000007XZt-1QXj;
	Wed, 16 Jul 2025 11:20:12 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzzI-00000007VFm-1AZX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 11:07:49 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-454dee17a91so50627465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752664066; x=1753268866; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hxqszaeuljrqlm0t8DgnPuG7w9pgNEhhBTVGlWt0Bfs=;
        b=no78VQkgK2XMYI35j/9P7/6rGALlU45nS7lwr+vy7cHBWnfhnPls2cgyAW603jXDEd
         ICxo21LWDO6ZjJryStNC5sYpTlRA2MnNg1A7v7n7qoFd6nhjRsduwPvxzxMQwqGeRQDc
         NZFSH5JzZ2qu4xszV0l5LJp23ogJlKRG2D5gWNKXSNpeqw/tR0K3c6YWbmt4zFqXvdPn
         pPntrMvrss6z0IfZi8WczUkJmTZ3l9zak2ISumWQfkYDFDf8xHUE1WqLnV75FvZUOO8/
         gYRRk9469HYEJW/qvy+qW/MYJrWmcyApRhvaxopIW5ZFznSlj+vhL5cHcYfpgDkX6UpD
         hOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752664066; x=1753268866;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hxqszaeuljrqlm0t8DgnPuG7w9pgNEhhBTVGlWt0Bfs=;
        b=XkB6/3x+91QzCUok2e02q8mf1Y5xksOvNRHi6C43G7Y5LRjsH5DQmYSk6IGqkwx2lC
         DfNweIt72O04s4FJVUL9i2D/a2g55upbckMaH53eBvWK/8rndD9N8VaMqIaVSjMMS/ru
         DaLvof/E5P/u3xUCLF4lLNm2RJ2Pi8zGEGu03g3Vh8XtOcUgxBtQCJIQbTWc9XXZ8MuH
         UUGS15UPOIyefcU7POUYJfgvcN1/RkNjgL2OgHSh3NOVgSLrnC35Sg/Odv7Uuwa/QknU
         dyWdJC0E97ZqALaYRZ9N1LFmHDGRvz3+xZYI6oDu9uTS8LL1bFOgsQXCIQJeX0rGAwPC
         Lthg==
X-Gm-Message-State: AOJu0YzBI6FG/tZjWTiwnbGBCcYVzVzyMyvY+FwCksS7fI7NlyhuwtrN
	2Iikutu1fudpIwHbYKpjcW9QmRTLjzWukrELuqlRFo/au86e+4s3bTjZDhv5EIKXzFNRnw3lKU0
	nm5w6UyXWRT5cZmi+a1+Vuppv3CifZY6qRofMef8CbvGqh+ZDpfeifTEf2UOwq4GgaDPj27sSFj
	mgmip+OL9kkkoRBE1WACt6GRjU5wVZmoZp0inRybk40YUlHTEkcA==
X-Google-Smtp-Source: AGHT+IEc90RI4GCOsQRZO8PqFs/HKd6dYrEM+oA0RTzrbntMXuFw8OS9F/kKOUPw5mrVP3l/ZU5GEG7EJA==
X-Received: from wmqa10.prod.google.com ([2002:a05:600c:348a:b0:455:76a8:b3a])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5299:b0:456:1c4a:82ca
 with SMTP id 5b1f17b1804b1-4562e3c227cmr18678235e9.32.1752664065812; Wed, 16
 Jul 2025 04:07:45 -0700 (PDT)
Date: Wed, 16 Jul 2025 11:07:35 +0000
In-Reply-To: <20250716110737.2513665-1-keirf@google.com>
Mime-Version: 1.0
References: <20250716110737.2513665-1-keirf@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250716110737.2513665-3-keirf@google.com>
Subject: [PATCH v2 2/4] KVM: arm64: vgic: Explicitly implement
 vgic_dist::ready ordering
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_040748_336838_1931B997 
X-CRM114-Status: GOOD (  11.03  )
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
2.50.0.727.gbf7dc18ff4-goog


