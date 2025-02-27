Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF30C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fv4f4paK6utMxGVLBPvw8fcn9CW6EObNKlJ/GybX54A=; b=4kPFxbxbGOyiSccBag7tnwX0nW
	YLOKZkJEsN1aqzwZOGxAIwc8pZ2I+6a4HmmgFwLOTPTuiHe9SO6qeJ/kM2AHop17HFgohVUrA6AMV
	00ES38SBjyeULXbTmmCzAHvLoF+jU/k+bbW5ckngn00Pck+GBojgEaFQT1QbPy/YD4ilnA/T9sp3F
	fsvaj9UmVsm2GkVvKfIb8h/m2DdRTlOdeI+BcXhPYTEV4oHatRQAwJTejm2NY+snRJjZrUObteITe
	zN1LrUbe/qBKLeJUMFepviK6WStKW8XwtROx0DfLDyRqFMnsNeerLq4T94nDNzmoSBehBXAQN5Rgc
	X8PLHHOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjlz-00000008cha-1wkJ;
	Thu, 27 Feb 2025 19:42:19 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tniSN-00000008JCB-0fdA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:18:00 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43947a0919aso11592015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 10:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740680276; x=1741285076; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv4f4paK6utMxGVLBPvw8fcn9CW6EObNKlJ/GybX54A=;
        b=P199Z5EPIgYzuYAz1j7MRX+QHRgSI8PR6CL3uDULzMqKi7cNcE3dODeipsOB8tox/2
         kOAM+biwKK5NshBhVM6t/dODQbiU8tTD1yf4fompoFsKNZMTXKAq1UCiRislgYeoLupV
         6ZOxWSbCGa/TOv6tAfIvEAnaJJFvley+qWcrQALcnduZ4ym3BdXysanlbg9uRgvD+dwp
         WNFIv8fpM/o1Wi4GYZt6pgAR7gktXamiQc56zEhnH8srBiBPKo+ID1zyzIY2mdI2DDfM
         Ks8LRLZHe8qLHcGBMeyvbF4fGA/Zmn5XCXW/asbZ1QUUJUpKw+qtb/oSp37ihul50QbO
         qIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740680276; x=1741285076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv4f4paK6utMxGVLBPvw8fcn9CW6EObNKlJ/GybX54A=;
        b=ZdSzdn+w9Eev8P1aDvr6NiyJ9GWcqrzT5u864IB8XjLWREiEXMotQUS/mnt74iPLbq
         PHwQLpk3wk9y/fA3aKauFwYS0Maz9qG2vsZJ+zqxTSRgT6z/460f+jIQgRW5RzxHcq9g
         IzyX2HyFoOmPtxL9CVcO90VxdVtcGKEA6H2axvwR9xW6WzTXAE1mLYjNQ0B+dzCGPI2A
         DzWWwaTgmrl+UjxHYCCksvEUYjXPz8ceWIdSLFK+kYoZ6P3UsQMWXdVThigZmgBUIC50
         SJ/NrLyYWfOcvoo/Km65AzAmdxTlXQYiXB9gGEGMKeNhEwvhyy8bn7CKS9MKZMXHbNyc
         Kdxw==
X-Forwarded-Encrypted: i=1; AJvYcCXC92EQOc3Tyy6SXkiQ/0pSemNdnTcU1GGIHsP9I+licNJ95IB7jJONM1kHUrI5Qb93qLIGtkMwxE+qfoEoCDTj@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk/DYd97ma2rEJIdequQJLaFwJvjlid2GaaG3JHy7gEMNkYU5G
	/gKXo7RTcRTcuPsO24AEz26C3G56iiRU3Zp9h49ft8URW2vBHKbb3eurgyKAAP2VZxcgTA+8HFT
	8nb3xGxvAh2GW45CLKGp0bbffiw==
X-Google-Smtp-Source: AGHT+IGeSgG4Yj46KVsKJq4Od+bRmoB4CwRl78JJio8Udz/pRZxQUsr/HNXRQbwORqLTtPX98pEazY6JQMdxAAlRg0U=
X-Received: from wmsp32.prod.google.com ([2002:a05:600c:1da0:b0:439:89d1:bf88])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d8e:b0:439:b565:f457 with SMTP id 5b1f17b1804b1-43ba675c3afmr2084445e9.27.1740680276746;
 Thu, 27 Feb 2025 10:17:56 -0800 (PST)
Date: Thu, 27 Feb 2025 18:17:46 +0000
In-Reply-To: <20250227181750.3606372-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20250227181750.3606372-1-sebastianene@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227181750.3606372-2-sebastianene@google.com>
Subject: [PATCH v2 1/4] KVM: arm64: Use the static initializer for the vesion lock
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_101759_195942_F668C605 
X-CRM114-Status: GOOD (  11.71  )
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

Replace the definition of the hypervisor version lock
with a static initializer.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index e433dfab882a..6df6131f1107 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -69,7 +69,7 @@ static struct kvm_ffa_buffers hyp_buffers;
 static struct kvm_ffa_buffers host_buffers;
 static u32 hyp_ffa_version;
 static bool has_version_negotiated;
-static hyp_spinlock_t version_lock;
+static DEFINE_HYP_SPINLOCK(version_lock);
 
 static void ffa_to_smccc_error(struct arm_smccc_res *res, u64 ffa_errno)
 {
@@ -911,6 +911,5 @@ int hyp_ffa_init(void *pages)
 		.lock	= __HYP_SPIN_LOCK_UNLOCKED,
 	};
 
-	version_lock = __HYP_SPIN_LOCK_UNLOCKED;
 	return 0;
 }
-- 
2.48.1.711.g2feabab25a-goog


