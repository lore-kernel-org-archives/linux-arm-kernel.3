Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EF0CD5BAE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVU+OuRx6v9DMwAm4TiBqZJIR2LHub0kz+4lAAqlRiM=; b=bI4dIZi62tMSgvzq0JgauZwdbJ
	tD9+OJKQOiWm5J52ZAHf6cko9JV71mrmYtYhM1Yv+32xQb4dXXx4s+Z1KfGDAsSJuP3K+BBz2iuv7
	vy4nnMa3nLXNcMeuIImuSZr+LbIB4C6HMzZYKUyJrja/pgPtz6pGj7M3kDTH8qhY1NGX+0Kk/eWNw
	pJqyzsZGuYz8IV3/KnvrL2Px2DKojOn9Dg1/6RpCtziAOOENDgJdwIyACmkkvMCpIWc19bfqKgR2E
	rtEqrHX7RyBnBQlqA3HKhJuBMVZWt3YMu9TiK2RiQRxTxz/d2W+oB2q3vEV6KlylTEKmTyyaG7HC4
	NYK6mBjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipj-00000004zJv-2Rh0;
	Wed, 20 May 2026 15:27:43 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipX-00000004z8D-0LOY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:27:32 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-45e73a4f1dfso3455634f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779290848; x=1779895648; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JVU+OuRx6v9DMwAm4TiBqZJIR2LHub0kz+4lAAqlRiM=;
        b=gTkroT/q/ZCc9eunFWCB3kS88idhgWzQcCt+E02OQ6T3z5lR5DmXW/Kw1HSVGJ0aKO
         T4/PAqQE5Fx66oyHEyEmHStxIAVbOgxb0FVmbTkAQpiAhfk1mMliy94rUcUAu4uJ6gpO
         TqWx9aujbID4oXlnAPU54YIvjLTVJtejg08phwkfZTRtXmkOqA5BVq3Ge6ZDFnpCFmRF
         n5Uht26YyxxgDo+sqy1FcSSHaODsyKXYmvd03R4qIgXhffJgOX52dDQ9PBhhyNwOKiQH
         ZOyDyyeb8KnzLy0KXheWIPuz2N9cNGJQxDrcajQ+uDRQDYtO9INWuHz9ndREN8MXH2jU
         a28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290848; x=1779895648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVU+OuRx6v9DMwAm4TiBqZJIR2LHub0kz+4lAAqlRiM=;
        b=Yxpob5Vw+G5AEKGamLWlUvE/JuYuMBPCI3eo63B+Y8AiRg2wntmPoxyeEcfoX72gJz
         J3fmaBxO/8szK/aQv1qW4ZHyoQcnccEMxSbGkQQ8Zm/3i8AldW8/Ir5CCH2WNht8Nmvy
         vt0mgC+6OuvAM6/i3JQc7GvgiNDM93ewvDBWvN9mlQ4fMnvWpj607Fw3JsHoouJphJbo
         TP0lRYZ8qKRlI4tpodntwbhUCcIDZc9oWpNMZzGy7fE5Ye+a+KZlvw5KvCFwO6qtZHDI
         Jli0OzL4TqTOowLMFrxmtK8niyDpeUT7PA3D83SLQIZP6n+yS3Np6oNVC7Gawo3Ak5rA
         DBrA==
X-Gm-Message-State: AOJu0YxqeSjwdRvX1ufprgpViITbuDR811zotySrqLN2g74CmVpE9sR8
	qy26Rl8ZO/NuwZVlGU8P/75xN3lWDqSi9ZD0GXnLVSxSGXwUBVaim7HFLPiEX9F2zgXjQtd6bgN
	aeerWxuQAyWMo/VovWVv7Cg==
X-Received: from wrnl3.prod.google.com ([2002:adf:e9c3:0:b0:44c:ef36:a65c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1086:b0:45e:653a:40df with SMTP id ffacd0b85a97d-45e653a413bmr26964465f8f.41.1779290848166;
 Wed, 20 May 2026 08:27:28 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:46 +0100
In-Reply-To: <20260520152650.4107895-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260520152650.4107895-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260520152650.4107895-14-vdonnefort@google.com>
Subject: [PATCH 13/17] KVM: arm64: Move hyp_vm refcount into the structure
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082731_135006_356331E1 
X-CRM114-Status: GOOD (  10.33  )
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
index e7496eb85628..ebdbe9c92689 100644
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
 
@@ -950,7 +950,7 @@ static struct pkvm_hyp_vm *get_pkvm_unref_hyp_vm_locked(pkvm_handle_t handle)
 	hyp_assert_lock_held(&vm_table_lock);
 
 	hyp_vm = get_vm_by_handle(handle);
-	if (!hyp_vm || hyp_page_count(hyp_vm))
+	if (!hyp_vm || hyp_vm->refcount)
 		return NULL;
 
 	return hyp_vm;
-- 
2.54.0.631.ge1b05301d1-goog


