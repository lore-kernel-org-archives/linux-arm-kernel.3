Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF7DCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xja7oOYe1wLd0F17wIDvUHEjaF9yTyywp22WM8XtFA8=; b=K0tl7sI9jFVP4eoHOzd8yQUBYa
	AlPOmTW17IuZQwZHFI3mFl3EC0SuuSu5dMzVTORJKnZBq56hLif3maajUDK1PBEHUFpLxqpQH44dd
	vB+NStA11pbhT2QoRgUbhwn5YdTzt9nZL208+dQDqZiOW/zhpSAtqoVO3j8IWu+jnLUhDcEcMn/vE
	UQrdLwZGG+t27XZkYb93+IODqk+bWtW1yUmU2XyL8dVgLovRfLJ7kgTka6sNb++H9JVmBq2SeEj2d
	i0Y4ge9ueO2OU1prknKGgOZlGe65sEeOcGcX6DBYELaxFLBpfgMlSboEhlJOIfhctiznHB67tf/MK
	icNHwuUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmQ-00000009N7I-0II9;
	Thu, 01 Oct 2026 14:29:02 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmN-00000009N5T-1p6Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:29:00 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-49fff093efcso63576575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864937; x=1791469737; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xja7oOYe1wLd0F17wIDvUHEjaF9yTyywp22WM8XtFA8=;
        b=DAhegiqRUWw96h+vgNA/FQDUb62uOAvF/LsFH1bNQgSvkRUmpPk6Iw242gVUJLpPiF
         ecH7KJ5Vj9W1wyumWRudAeN0PJv0fqHE+O5Pc2+d7V5I+jVmQFWt4zSRwMtk/V2B3/QI
         XMPQjbxp4xMrK6zq6zqZY5U3Kq79AbwEkoKNGhXq+xcL1AETUfccakyUuVgxLDd5OpNa
         KCDHqfdpRtTKkss3JJzNDXgh8/4FG4s8FWm+Qu5xDm1yI8MMIiixXLo7SPuCmUfLADqS
         6HUSi1JqnjL0oZqT4w2eZDn0wL6ERycATVSEOvLf89qhHMd9rJKoxe1HQ/OmYYBbgARa
         KG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864937; x=1791469737;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xja7oOYe1wLd0F17wIDvUHEjaF9yTyywp22WM8XtFA8=;
        b=ySwhWcitkA29fUUf/d6dtG9hg9CADKZVJDx5xtY+M2tdPs5H9KKBWu1b4NkLGDu7gJ
         +Lh2hLj8x6Uljd1fTahoqpVgLojlDXv10Sq2ysiuenQtodoSAHvPYipwlzvBzJ5b1NZu
         R3T6SulJdq6bHzAZurY2JuMDdIFeq9jOqgG2JFmK2rBnvs+yQad7FvRfuKBxvp4PffcT
         ClYOnOJUjmre5gAL+2yVGN8Qi8N8rwObQ6wtevqJHAo2ioA027+2sUs0qabj7DwBSJa2
         D94LTOmuUtLsV8wA6unjCTOkeMgsFR9TBv0rpVixXi7A4c5z5nE6rFpqr1IamW38kkmN
         8/vQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/NBMlKC19/GRbTWM7XN5hYPKROK2lFTHoejqs46f2wMKyt49l+EI91+xTOrPyKFN7SPqF8A5ugDbLs9+r4rGo@lists.infradead.org
X-Gm-Message-State: AFuF++mN5Nhos0zy9pclybahopxpXyW4mldrkywqdy0NKRaPv65nFuY3
	p6AcU91RF7qUe980O6+6PZ0g/A6du8f5jWCtsR1EQUyBCAuf8RWJd34fQrmSI3XUR6arCopFbJA
	14aKvPb/LOSSomhUZlorOQw==
X-Received: from wmoj8.prod.google.com ([2002:a05:600c:4848:b0:4a0:dbd:50a7])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4505:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-4a01b006b82mr77675755e9.31.1790864936388;
 Thu, 01 Oct 2026 07:28:56 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:32 +0100
In-Reply-To: <20261001142849.3367614-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001142849.3367614-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-2-vdonnefort@google.com>
Subject: [PATCH v6 01/18] KVM: arm64: Add pkvm_private_va_range_pa
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072859_496676_AC57273C 
X-CRM114-Status: GOOD (  11.86  )
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

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/include/nvhe/mm.h       |  1 +
 arch/arm64/kvm/hyp/include/nvhe/spinlock.h |  4 ++++
 arch/arm64/kvm/hyp/nvhe/mm.c               | 18 ++++++++++++++++++
 3 files changed, 23 insertions(+)

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
2.56.0.rc1.315.gc6ed9934b7-goog


