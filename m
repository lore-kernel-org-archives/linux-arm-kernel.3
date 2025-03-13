Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D29C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 11:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVJVlv+KRiLMqpaJQOXgQktnx0DyjzlKOnB26dCdeT4=; b=0YbCokw1LvRStzs3TvITJ24Pme
	60kMdfHhKrYxqj6fcEsIbD5NK43iFoVqui6IKQbJ+Am7lNxLu3ocEpXaxrzxWuH/1c3bI1g1P5aA8
	U0Yzhpr77vr9IfwJiicV8WsP8Rlwy2PNckYyGStz5r8bIBiSu1Herv6Y5V0E309xdbCoCh3Upwyci
	fYZqCg77Rg5q6DNyY6MOOXSzw6qkhJuI1L+8teL/2jwKzM/rkIQOuXM32hziXTiPo0LA67dE+PwD3
	jLbo3h059vGGlXQdKkNvb5p3m5KeQlj/6J9RQHIhz6wfXj9C9T5Zh1/ksJ6EtBiM+2nrS+fB/zLJx
	ZKiZnAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgz2-0000000B5AI-2zuO;
	Thu, 13 Mar 2025 11:44:16 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgvj-0000000B4Oy-3koh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:40:52 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so6413425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 04:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741866049; x=1742470849; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dVJVlv+KRiLMqpaJQOXgQktnx0DyjzlKOnB26dCdeT4=;
        b=KL8y90qdtBuLHqjOWP5nLNeqamWVR0M4Wc6bs9C+dmpjrq4SVWCHRy0jSQ6HAzxzdb
         0NmWmS30MgZgfT/PKFk69CIEY/YjPCoSqKRvspGdVvKN0gd1nXx8KSFfAzFxI2e6FiJ1
         FYgU0nKObYVSUY8g+dGj2wkQDhb61E0rqiO30+xTeYZFWqfS+VkPdJyf6QttYlzltSVi
         OsYZ+qyGA8USNOJO3FD+ps71FLbXZ6BsSyMooWkQoxPanAb8yFc3cPuYDkhSRR+4hJ/3
         jQKwKaQw/hjkZ1cQvEr1XjsW4YBA5soBMHHFLZq+murMIeUtpnDF6e93uB1Kcmw/zUu2
         VYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866049; x=1742470849;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVJVlv+KRiLMqpaJQOXgQktnx0DyjzlKOnB26dCdeT4=;
        b=g1Z4ELyIh6ErCkXRaqQCFpc2SQiKp43mvzDQK+PseGTw3jqO5tFCtXwf1sBMFtTf5l
         gYYKxiBIpLJ08EywvknoNz+xwR/3t9X5l6HMNopBZFfx1JqLquk7zMw7LvCjI9QN0bHn
         NoQAu/U7hFylLP/7m4y7O4TyKfLG0clBJELpJliOqIDZlhQkwIPFcKV8O8obT7DQJz43
         TWPMO1DlnxHT8BInWV3PbI46Hjtc+2e548PrH35Z0z+D5R4cyNJlUA1R2LwFVofKr2oo
         /VHlq81GJ9vfdguajFMvFIbJg4gdP4mC3Ml7fiTIbLZqMPsJ6tMMYB0T+3e4UH77xdwg
         gi6g==
X-Forwarded-Encrypted: i=1; AJvYcCVpcBEZuM3rmxilRlNab/MSMud5NDuJccr7VtC8rMhjzy5qFdryeWCT2bv5u0MokTvqnc163AmESNachZXQSkMy@lists.infradead.org
X-Gm-Message-State: AOJu0YzFa2kGGom+H1xBHfPrQVLi7wxHQXAYtdtB0FBNBkdPNRFuFz7S
	qY8ypYtUGL6txK/fYNPYh/iNURUOkugugpjhqgi8CPT0EiDiDKmjlVk2J7oOoKS943hxv/jHRPA
	5ZX4Ua/irDaRSK2Sz8g==
X-Google-Smtp-Source: AGHT+IEzRRTpq9BGThjAtTMnpcfpVggLzq2Mj7jsx/mhuvVJKFcSB7Gz6JGQE1qtaMHhWCec0Q9TXeSZjyRruCGb
X-Received: from wmqb15.prod.google.com ([2002:a05:600c:4e0f:b0:43c:faa1:bb58])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:524c:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-43d0b32419amr49874555e9.3.1741866049761;
 Thu, 13 Mar 2025 04:40:49 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:40:36 +0000
In-Reply-To: <20250313114038.1502357-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250313114038.1502357-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250313114038.1502357-2-vdonnefort@google.com>
Subject: [PATCH v4 1/3] KVM: arm64: Add flags to kvm_hyp_memcache
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044051_930331_29A5465D 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

Add flags to kvm_hyp_memcache and propagate the latter to the allocation
and free callbacks. This will later allow to account for memory, based
on the memcache configuration.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3a7ec98ef123..12691ae23d4c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -86,6 +86,7 @@ struct kvm_hyp_memcache {
 	phys_addr_t head;
 	unsigned long nr_pages;
 	struct pkvm_mapping *mapping; /* only used from EL1 */
+	unsigned long flags;
 };
 
 static inline void push_hyp_memcache(struct kvm_hyp_memcache *mc,
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1f55b0c7b11d..6107a3c8ccf6 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1086,12 +1086,12 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 	}
 }
 
-static void hyp_mc_free_fn(void *addr, void *unused)
+static void hyp_mc_free_fn(void *addr, void *mc)
 {
 	free_page((unsigned long)addr);
 }
 
-static void *hyp_mc_alloc_fn(void *unused)
+static void *hyp_mc_alloc_fn(void *mc)
 {
 	return (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
 }
@@ -1102,7 +1102,7 @@ void free_hyp_memcache(struct kvm_hyp_memcache *mc)
 		return;
 
 	kfree(mc->mapping);
-	__free_hyp_memcache(mc, hyp_mc_free_fn, kvm_host_va, NULL);
+	__free_hyp_memcache(mc, hyp_mc_free_fn, kvm_host_va, mc);
 }
 
 int topup_hyp_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages)
@@ -1117,7 +1117,7 @@ int topup_hyp_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages)
 	}
 
 	return __topup_hyp_memcache(mc, min_pages, hyp_mc_alloc_fn,
-				    kvm_host_pa, NULL);
+				    kvm_host_pa, mc);
 }
 
 /**
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


