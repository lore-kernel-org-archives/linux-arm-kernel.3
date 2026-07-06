Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCCAC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yu4+3TruU2ZdgZgDqYZqtnMk3zkmalS4vgdcsnIH7N8=; b=hGGw9+i2UQ3Tg9CzhwUlYcWueT
	ccTflAfkGwubLPmdm+3criQAT42/cxFYxm+JsOk0PR5VL+FHHftNPLPNU1VZ7RblS2GVHjVbkePRH
	SUtUg/ivHUqEvYUrW6u6J6zB6Xk9XQWMGmN81GmpWLhxFoJC9MlealgdKEKP0ZouH64lWdjiwpG4a
	XUyI/p7T5MojWI9eB7F3Vb6A2gRXUdbsMS20JLgQms8B0/TspW5Wa7MLNQNDQz7Cy/VqSAaj5yIHI
	3KRz4hBQA1c3PRQBDPCguJ3vIYCONvXSk1ADocjfV+aBspEFPpfgdCcltlEzPPiFkek8Qq5pbpM6W
	heHBrG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnX0-0000000DG7i-3iQT;
	Mon, 06 Jul 2026 17:54:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWj-0000000DFi1-29SF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Jul 2026 17:54:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yu4+3TruU2ZdgZgDqYZqtnMk3zkmalS4vgdcsnIH7N8=; b=b42jZe1xz3CcCSwjfY2rrEMVwG
	njk9wRkeVs4CLt9lwMMkvliWuzWhBEREepoX9aD/rJsoq2FznpfUESIamAcRGOx7T5NksUgI5co61
	JbctC5fyWB+e+XiX11TOLvqKzcffUP+jDy6E5gscgwfunBFt5+KohQPf73hFx7bHUVOua+7yW1hpn
	+vIy+o6n12jv7iSehVooxGr7evw1P8umKdezf57d7lzMEx33bNaXbqNBBJGviZs99/tVRIwclt62W
	gESdW8BBU56UIRsLBSOPrdgArei55pDEiHM1VdIn8LMIkGvA6BagJo7ypFDFU1lBvIbTUnKnxSNcG
	DjnAg00w==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgnWg-00000006p5y-3NNi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:54:40 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-493ce4b7777so22643735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360476; x=1783965276; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yu4+3TruU2ZdgZgDqYZqtnMk3zkmalS4vgdcsnIH7N8=;
        b=ayshtfA9THF1XucbbZ6aoCaGIB76Y/OwTcRWucvU6sNLy2OPwEJlX1JSRBv1skCpBl
         ohI2guHa3F4FcfYDucgKzNQTSSzA0ACalFprEJ1FQ1Q/L/l2PIm3fvuVZZC+RyA79csS
         0JOoL311eLb6KxUn+cOlNpqW3nTMd/zyJaKS2Fnwz0ezXqXFxejAeizhpErom9S2e2Ni
         8br5aAQ0GYP4wEbQgdMI8oFH5YRMXZzRTKXbhfCzp+OOY9aucaRa6UrQR6Qdxjs7WyC7
         zy8EzREVV1X6bPWOoCuuGi5Xdy+CY9r9Di8vwCT4cPNIYiz8cg4pIOIsB1BFFROG87kZ
         fhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360476; x=1783965276;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yu4+3TruU2ZdgZgDqYZqtnMk3zkmalS4vgdcsnIH7N8=;
        b=cMsWOMGduqWL41ykPf1GIrhH09tKKqRjl9WJg8zQKduOcf3E+9tp1KUtqYzLFqV9Jn
         iYd6VRWVZmis+1Eh51TTYcCa8xDuNRX1iMTlQ8PwjjTE9dotJXyfIje27f2Qwco54GaN
         vwi8NJgBOLuJHcocCRm+If8nXLeKOxnW6/DKhW7ngxJN/EzzvAmIwGxLFE/MEtPfu6d1
         5yMS2Uc8XigywcrUkT5CZ6IXa5/2IN8sXzADScrOCvZ0KYACLU5FzqUde9PkKyoF2Wjp
         laXyVeLTLrtswufp4EpKUm2MpaxAKYp7Szz3Zgrgeg5AKTG1r7ucpcctduotq82MccX9
         b3lw==
X-Gm-Message-State: AOJu0Yx4gA80PmUhLAj308bQIlqe1dYUFxlmHXczTs8V5EGx3vABHQSP
	0V06OrwIumEeVWkUzC++27/AIbCTEy0Npui/BLd2zhKeLkf12XoO7snlRzBxe1WVxLrSDN6iYjF
	6VkPIip67KuZfdYV1L1Qk3A==
X-Received: from wmbil23.prod.google.com ([2002:a05:600c:a597:b0:490:b258:4672])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5303:b0:492:4e1c:120 with SMTP id 5b1f17b1804b1-493df0988e6mr17102515e9.32.1783360476518;
 Mon, 06 Jul 2026 10:54:36 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:54:10 +0100
In-Reply-To: <20260706175415.2604046-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175415.2604046-14-vdonnefort@google.com>
Subject: [PATCH v2 13/18] KVM: arm64: Move hyp_vm refcount into the structure
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_185439_012067_F3275331 
X-CRM114-Status: GOOD (  10.27  )
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
index 3b2c4fbc34d8..d9ab58226889 100644
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
2.55.0.rc2.803.g1fd1e6609c-goog


