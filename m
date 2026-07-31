Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41391C55175
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUrCEvTbKAGmr6hHuL01zVzxyA5gPy2dUcoI8nsTLg4=; b=CcT2sjhwtZY5Pmr9jrL1sWXywe
	K2muDLy7jJAPOEsKSDQJTxiBWKlOl/Y7vIvxX66niS+1qomKDuHoZUKr+Osxpwh3jCzwUUVk4kNxU
	WQ7lXzRkIO4MlJPG4hZtx4RbbwK06DtlWBL3Abufg19fVQS9dEa0OnbHeN9OFcKhH/PA8plPwJkFo
	k5Rq2Vivk6BGfgS5YKb+bsleyYMgi4bNTuFyV7igfUcdPxyaDXuvS7stg+CCJJjQRVIt6d3tJP52S
	KmXKtU3DEmMirpKj0o2svSsLZX7qBSZcEOKW1QJ48HOdLVHdZsLylUhLYRYI1O2CVxpR1S5SLDDG1
	YlD78iRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLa-0000000Cjj0-0G4C;
	Fri, 31 Jul 2026 14:36:26 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLP-0000000CjYH-0KwI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:36:20 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-697d51ced1cso1239554a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785508568; x=1786113368; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUrCEvTbKAGmr6hHuL01zVzxyA5gPy2dUcoI8nsTLg4=;
        b=TeRd+Ehj/afARn8DggCISAWzd4/zCwBgWhW872KT3CDKdUv9BdmKTfoxd84g66c15+
         bInGrHvOz/4n7W2O+Jua+G5NZtt+0IN7VaVvNmLIb5hIuvtplXsUe2FochNl9nKLQJxc
         /9Tskq00MvXmjnlE0U8dyAYdIJmKrcm6CxmoTUPbsmK6USs5HojfuRxwUKXUnzj6rRwa
         FnzRcXrS55jrkQFI5chmP3i7eF9hyj4DFAZIVIli5Fj4p/3GejmC4oMn0REz8rj7xNc+
         a3YY4IiVmvzmFIuizgnivKJPXq2VQ49N5bfYLxqvCh83e2J81Gx8a0FoD88BW7FtnKyR
         leqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508568; x=1786113368;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUrCEvTbKAGmr6hHuL01zVzxyA5gPy2dUcoI8nsTLg4=;
        b=RimZGFVh99aiwsBos4Z4NE1/s+VZPVwndGd851au2Si5/ONEe1HhClbvK12K9KHS0m
         EBi7ZeMZIVUkTgfnWVMtsHdfABKUvZ4B9pMLEkWgUzRQrPWT+axawWXZ++n8R/dmTqH4
         3ef23ptglA6FzFYz5yAamX9xhi9dQEwjLm/9HY2X/Bs/ujlr03CT1g55HUCrs4V1leYw
         UD7OSXPDT4ELCqUT/jirVAc20S1syfo/9Fc20Ot+Hj5+i7h9eetbrz1imKIF+JqSPqdx
         C7xp1Tgqsp1JnMqm0GFmXOWLoX8kbEIPliY9JAtlmgNp8AgiDEM7wh3qhN2AikatjMrO
         QzqA==
X-Forwarded-Encrypted: i=1; AHgh+RoucQccfZJtyXlkPHJL6JyF9lUoJ4fLo6qN4oUzhVRO+MLr6hEk5z+/teMYfgndhwg1zglmSbs0WL0f36lzPssn@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt3EQ8Q/YOMLAJB4RBYpvCSaCgUeXfdP0NWj/l6Mkz1laf/HZW
	OHdbLFhWsytqYBhzRvgyfJh3VB51p8x3kpFqeunYabrRSi0cPTNAiw8AUaIkkR+zTqneayV1Sx0
	4mkg5BnxaqAe0vUzPDEioDg==
X-Received: from edor14.prod.google.com ([2002:aa7:d14e:0:b0:698:c0bc:3a7f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:52d5:b0:6a0:1e6:df05 with SMTP id 4fb4d7f45d1cf-6a098d05b57mr1376170a12.32.1785508568193;
 Fri, 31 Jul 2026 07:36:08 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:35:36 +0100
In-Reply-To: <20260731143541.956291-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731143541.956291-13-vdonnefort@google.com>
Subject: [PATCH v4 12/17] KVM: arm64: Move hyp_vm refcount into the structure
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073615_772791_98FBBFE2 
X-CRM114-Status: GOOD (  10.28  )
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

In preparation for allocating hyp_vm using the pKVM heap allocator
(hyp_alloc()), move its reference count out of the page metadata
(vmemmap) and place it into the structure itself. This transition is
necessary because hyp_alloc() allows multiple small objects to share the
same physical page.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index c904647d2f76..624367d0ef5b 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -41,6 +41,7 @@ struct pkvm_hyp_vm {
 	struct kvm_pgtable pgt;
 	struct kvm_pgtable_mm_ops mm_ops;
 	struct hyp_pool pool;
+	unsigned short refcount;
 	hyp_spinlock_t lock;
 
 	/* Array of the hyp vCPU structures for this VM. */
@@ -65,6 +66,18 @@ static inline bool pkvm_hyp_vm_is_protected(struct pkvm_hyp_vm *hyp_vm)
 	return kvm_vm_is_protected(&hyp_vm->kvm);
 }
 
+static inline void pkvm_hyp_vm_ref_inc(struct pkvm_hyp_vm *hyp_vm)
+{
+	BUG_ON(hyp_vm->refcount == USHRT_MAX);
+	hyp_vm->refcount++;
+}
+
+static inline void pkvm_hyp_vm_ref_dec(struct pkvm_hyp_vm *hyp_vm)
+{
+	BUG_ON(!hyp_vm->refcount);
+	hyp_vm->refcount--;
+}
+
 void pkvm_hyp_vm_table_init(void *tbl);
 
 int __pkvm_reserve_vm(void);
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 24d6f164129a..079d6f397893 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -278,7 +278,7 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 	}
 
 	hyp_vcpu->loaded_hyp_vcpu = this_cpu_ptr(&loaded_hyp_vcpu);
-	hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
+	pkvm_hyp_vm_ref_inc(hyp_vm);
 unlock:
 	hyp_spin_unlock(&vm_table_lock);
 
@@ -294,7 +294,7 @@ void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	hyp_spin_lock(&vm_table_lock);
 	hyp_vcpu->loaded_hyp_vcpu = NULL;
 	__this_cpu_write(loaded_hyp_vcpu, NULL);
-	hyp_page_ref_dec(hyp_virt_to_page(hyp_vm));
+	pkvm_hyp_vm_ref_dec(hyp_vm);
 	hyp_spin_unlock(&vm_table_lock);
 }
 
@@ -311,7 +311,7 @@ struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
 	hyp_spin_lock(&vm_table_lock);
 	hyp_vm = get_vm_by_handle(handle);
 	if (hyp_vm)
-		hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
+		pkvm_hyp_vm_ref_inc(hyp_vm);
 	hyp_spin_unlock(&vm_table_lock);
 
 	return hyp_vm;
@@ -320,7 +320,7 @@ struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
 void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm)
 {
 	hyp_spin_lock(&vm_table_lock);
-	hyp_page_ref_dec(hyp_virt_to_page(hyp_vm));
+	pkvm_hyp_vm_ref_dec(hyp_vm);
 	hyp_spin_unlock(&vm_table_lock);
 }
 
@@ -966,7 +966,7 @@ static struct pkvm_hyp_vm *get_pkvm_unref_hyp_vm_locked(pkvm_handle_t handle)
 	hyp_assert_lock_held(&vm_table_lock);
 
 	hyp_vm = get_vm_by_handle(handle);
-	if (!hyp_vm || hyp_page_count(hyp_vm))
+	if (!hyp_vm || hyp_vm->refcount)
 		return NULL;
 
 	return hyp_vm;
-- 
2.55.0.508.g3f0d502094-goog


