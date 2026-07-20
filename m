Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572C2C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9KxvNMIvUtQq3xLQOoAWnVxOnpsU0qAP80ryNPLHJM=; b=Ui1qSra3RO6a3RZhlamcc1VEWz
	u0QyuO+/01Erh5Om1rZ22FyDyzeFR2sQZb0tlZ8ej7cuN05BbOHqq90gGe3ApqUJXlRtxzrV+TDPJ
	owcM4w6/i+dEB0XaGk9Ed2dLeWdRZuP8AxlUvjmTY2Rgv3LwFFgK2cS+Rzli5hainwlAfPXmN+Lb1
	cMtNf9csBA9ST1bIzNgQFmtu17l3xmt+8+WJ6vYNka4fBfj9anNC2KxxW4nrWVnwSnvFwt17C8dpd
	UEvWTmZDiBNNifX9vpuoofho9Yh52UUKy7i+gP2gURbzuvci7uhXLA1LzqBA4FMcf9BLeditNq+BK
	ngnbZ8SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlraS-00000007Ulb-3sLU;
	Mon, 20 Jul 2026 17:15:28 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlraL-00000007UhU-3557
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:15:26 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-495593376bdso10934385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 10:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784567719; x=1785172519; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9KxvNMIvUtQq3xLQOoAWnVxOnpsU0qAP80ryNPLHJM=;
        b=Cupu1Rxm1vOKBtE0nCcgEqcgB2xcKYknQ5G3Yid0i8eVSl+Waf7aXmBuu+K/c3keRh
         434bB0NNKjdog2AopJOnlhubUrV4IgX28jHmdgbE0+tfyygrLNAtCIOWMr6H3ioGpntH
         0xvfdDo9ZaG1YD0jN5IYKi5e5+J74Awcj8t6WQfGWkRkE5B20bolh26nIUaQemmQN4cL
         ZkDJdJMB/AtsHnDJ7IQE/cyaN7q9n+5sCSo2evuBWSMYh5zSLYtLi7Mv00EST/YCDkax
         TvN0V8BNOlAzeyBzE8ZVn/b+rktSbH6lrKBlzpQHbWWSOAYqoQRC/geIjdxTi9BQuLJf
         QGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567719; x=1785172519;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9KxvNMIvUtQq3xLQOoAWnVxOnpsU0qAP80ryNPLHJM=;
        b=Tw8IprJ0gSjaFbAXIvTOK0fJJQcNVJvle0zM3YPkbABiseiJLmWTBjo5F3WMZ2YIYJ
         2LeTEQofppFoIpTcmJ0kmjTxXE0Gap1Vl0DDZ4MeQjOLnQIVMl3/ruixKW4sALAZA+jR
         oieH24oyTIsDwzjyCbBQb7Gr1lEWVv2E4qXGkiD+kutKkFZ9CcxN6f8cuUyCBly1/Fpq
         nuki8xJwEaKTR3MKWKn6X0yO08Q7/itEBZdZamS8NocCP4AS6Ie2h60fdILuXeNmmnYP
         gm2Mx6BeAoCiJNy4H1XG7bVmyPU1JSiZF0LHT0HLw0fhd366+jyOviG7DxfQU+X9t7UW
         Rk5A==
X-Forwarded-Encrypted: i=1; AHgh+RqX8sB5CzdSTCjE3KuSJPvoPtfi618wXxHrJrg+cVBcLLLp4VD15q5RQ6hds6mcKoAr0RUhhQyK3qknPSroi3RH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm8OLSx+N8b50XBI1Hb80LJ6xqpE6foSKvT/YtYNwj+KUWeRVA
	V9U7BbOLBbHBXKMykFmgNpEp58Y7IUPm18iSHG4PD7FmUyLxjAX1rqIhy82y4+QdtYDCfju8XVy
	DfmamPr7QDt1Lf75mU0w/yg==
X-Received: from wmbjl1.prod.google.com ([2002:a05:600c:6a81:b0:495:571e:e5e2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1554:b0:493:c10c:22f0 with SMTP id 5b1f17b1804b1-4954a50d963mr194510095e9.20.1784567719153;
 Mon, 20 Jul 2026 10:15:19 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:14:57 +0100
In-Reply-To: <20260720171513.1415357-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720171513.1415357-2-vdonnefort@google.com>
Subject: [PATCH v3 01/17] KVM: arm64: Add pkvm_private_va_range_pa
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_101521_809560_C5638C99 
X-CRM114-Status: UNSURE (   9.63  )
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

Mappings in the pKVM private range are not identity mapped, making the
standard __hyp_pa() unsuitable for translating these addresses.

Introduce pkvm_private_va_range_pa() to resolve physical addresses for
this range by walking the hypervisor page-table. This will be useful for
the upcoming pKVM heap allocator.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

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
index 3b0bee496bff..8b8c9d3dc82a 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -90,6 +90,17 @@ int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr)
 	return ret;
 }
 
+phys_addr_t pkvm_private_va_range_pa(void *va)
+{
+	kvm_pte_t pte = 0;
+
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
+	WARN_ON(kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)va, &pte, NULL));
+	WARN_ON(!kvm_pte_valid(pte));
+
+	return kvm_pte_to_phys(pte) + offset_in_page(va);
+}
+
 int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  enum kvm_pgtable_prot prot,
 				  unsigned long *haddr)
-- 
2.55.0.229.g6434b31f56-goog


