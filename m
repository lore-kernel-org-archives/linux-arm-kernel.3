Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60A7C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7nBgl70e5xfSJ2oqkVr0tglewdp5qWUVF45E6u5ip4=; b=qPonSewHN5KhiUlTtBm4Z2S/l+
	C+A/5gVJ4P7O8XDHwzSRyRaL80hiPQDldE4mvRobmQlbfwddPVvLGG+PDhzWou9lYqnNLbOrO57Pl
	ceOSTmPem1LbKwWRd5ZuD2ECGRpPaf7AS5JBCkZiIzEiT3gEL91S/3XIYfbrnUEhgVx2Odp0QabMn
	dM/Y1OpVbnKJ0/2WUJSjmYuSqSR7LnQsElGX4CW9T1SDbh6qrdgXaueD1E0xTldqtE0SEO9vql6di
	7KuEuZ9pQOao1j8KA7nvze4naXPiMQB8DEsY/u50E1oTNSAnj47yh9DzUi88LZTNYyyXI2MIooiCO
	Fg4g+KyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZ6-0000000BCju-0dg7;
	Tue, 01 Sep 2026 08:09:56 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZ3-0000000BChj-2Fx1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:09:54 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49991beee7aso41259715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788250191; x=1788854991; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C7nBgl70e5xfSJ2oqkVr0tglewdp5qWUVF45E6u5ip4=;
        b=uS6Tyhrmtlban1GtTn4EsKlW5sSsZLK9Fa6f1pprspHlqUF6LvNq5iKYCG3Mx8NWWc
         csBrLpkKrHF/ZN6YwZC0BAUdV/hWAWLabpwd/p96vSYy/o1YIgAIsh+hmmrj5A2Svuem
         CuJx1DdPHXGml9Luqvd1jheE78ZEnYjydFIMhHDbaVjjkrqnI5+qx9uCqXC4NO/bmsEp
         OBU/SeyLGl0iiToe9K7GmjcX7cmgldCJ1OoLitXjhbRQlUJ48K9ynFLhF4kHa+Cc1zRR
         302SzyBbHQ4/Tt60auBmpeEJvb6yDSScQ1lTjrgi+WaSjcDwRwsMIfhFDJX1xPXrnlvC
         jWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250191; x=1788854991;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7nBgl70e5xfSJ2oqkVr0tglewdp5qWUVF45E6u5ip4=;
        b=n0GoJYEGUtWco2SA2o3N0v51IanbhWLxdtGdndXGI+dUGA3RBusE9Nui9jkIOwUrf3
         P9Fo+Azf6OcC5/btjG4STwSnmsLY4OpNVLBQFQo4I2lLeV1qAYCTf1kOdGgjr9Hyi7y8
         laMinMGPLr9EVB5DseYOTN+td2X0krnpQs6LQf/YHIWgWNUP5qh+71vJh7uWDJZe5eMm
         uj/OyfABr+WRxRZp+ypaEJnKYj/bBk9aAFxzchB6q9KQLI4e41rlODqzZ8saf2J+h1yC
         dsGAu2WC8l72kg8bymUQ4wmi8BPiyWmj0RivJ599es2dp73gjl1MLFKH2IydRPP+kSBd
         GkuA==
X-Forwarded-Encrypted: i=1; AHgh+RqJjB8x3FVpFvgSHM8swDigorVO3k/+ruqFbXOOnaoPTGFPFYLNOOMJ/ki0+/U7gplNBTjM/4YInjapIXYXxa9m@lists.infradead.org
X-Gm-Message-State: AFuF++ma5/A3YGsQislJwZhNpXMprQdz7R9UxncCJhstXfQwWkRkIlug
	w3u+1jeJmZIZbPWScllagaaZhXUr1LGgZhpZBhuNWRKRo8aA1ccKGahDkWxul0emKxEAvhJcvLg
	lrilE7ngHGJnf6dHs2KHlOg==
X-Received: from wmpx23.prod.google.com ([2002:a05:600c:1897:b0:499:b2be:d4b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b88:b0:49b:4d64:bbc4 with SMTP id 5b1f17b1804b1-49cdc4403e4mr121681065e9.8.1788250190134;
 Tue, 01 Sep 2026 01:09:50 -0700 (PDT)
Date: Tue,  1 Sep 2026 09:09:24 +0100
In-Reply-To: <20260901080941.997769-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901080941.997769-2-vdonnefort@google.com>
Subject: [PATCH v5 01/18] KVM: arm64: Add pkvm_private_va_range_pa
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_010953_611057_7F80B37A 
X-CRM114-Status: GOOD (  10.64  )
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

Mappings in the pKVM private range are not identity mapped, making the
standard __hyp_pa() unsuitable for translating these addresses.

Introduce pkvm_private_va_range_pa() to resolve physical addresses for
this range by walking the hypervisor page-table. This will be useful for
the upcoming pKVM heap allocator.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 6e83ce35c2f2..85f1e3c711d9 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -30,5 +30,6 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  unsigned long *haddr);
 int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr);
 int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr);
+phys_addr_t pkvm_private_va_range_pa(void *va);
 
 #endif /* __KVM_HYP_MM_H */
diff --git a/arch/arm64/kvm/hyp/include/nvhe/spinlock.h b/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
index 7c7ea8c55405..260e14d6d200 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
@@ -17,6 +17,8 @@
 #include <asm/lse.h>
 #include <asm/rwonce.h>
 
+#include <linux/cleanup.h>
+
 typedef union hyp_spinlock {
 	u32	__val;
 	struct {
@@ -122,4 +124,6 @@ static inline void hyp_assert_lock_held(hyp_spinlock_t *lock)
 static inline void hyp_assert_lock_held(hyp_spinlock_t *lock) { }
 #endif
 
+DEFINE_LOCK_GUARD_1(hyp_spinlock, hyp_spinlock_t, hyp_spin_lock(_T->lock),
+		    hyp_spin_unlock(_T->lock))
 #endif /* __ARM64_KVM_NVHE_SPINLOCK_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 3b0bee496bff..755630c0d15e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -90,6 +90,24 @@ int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr)
 	return ret;
 }
 
+/**
+ * pkvm_private_va_range_pa - Translate a private VA to a physical address.
+ * @va:		The private virtual address to translate.
+ *
+ * Return: The physical address corresponding to @va.
+ */
+phys_addr_t pkvm_private_va_range_pa(void *va)
+{
+	kvm_pte_t pte;
+	s8 level;
+
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
+	WARN_ON(kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)va, &pte, &level));
+	WARN_ON(!kvm_pte_valid(pte));
+
+	return kvm_pte_to_phys(pte) + ((u64)va & (kvm_granule_size(level) - 1));
+}
+
 int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  enum kvm_pgtable_prot prot,
 				  unsigned long *haddr)
-- 
2.55.0.897.gb25b4bd76c-goog


