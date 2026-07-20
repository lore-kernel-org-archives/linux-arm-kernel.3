Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FF7C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kG24nThS7TFwTpAIqI2B3tJQSHw8Yio3iFIh6/HIGgg=; b=fEWqGTc1mMfyHEWlR2WYGXf/U9
	yQQMEeDhdMFKucIxJDLEwYEfmRTN47k9BmhMHmIVvBpcOdYm1OPjBIQ2EP5PjQfhx0F61lSSfcg9Y
	ADXUOS3IU1MVfHd7mD7RT5A2mBjWpTYEShlercktE4L6fy/tgbFsu73EbNjV9xjoqjdC4ZoshGyQb
	9mJaGQ2l7wvoKTUhZMRPfaLcL4Ukctfk5vqg2Z5UbU4m+bmXn4I5MUnJpCDE7tPz937Rmwh8JJmWR
	rYzDe2Pkb7xtFreIuTdjIUJeO7MWyFUOnPsuHsR1uoQ/OytQtStCy76XaLh1K7qQXno5SGh7fI4q3
	drQiBO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrbN-00000007VeR-47zN;
	Mon, 20 Jul 2026 17:16:25 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlraZ-00000007UqY-3MN7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:15:37 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4955843c6cdso16789465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 10:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784567734; x=1785172534; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kG24nThS7TFwTpAIqI2B3tJQSHw8Yio3iFIh6/HIGgg=;
        b=fju+iGqUvkf9nYVXgD8v629iWSW9AeGsxnv0hBDKzSN6A2T0H8ZeRaZA67trBeHCg9
         XSBo17zvMXyJnF0qNdh3xNqE/zk90bzb6+q/1r9O1/rbp+3L/oiSXCR6JIWXDl+cHU6P
         ubp6ekQDmWZvrBvmjPWMQd6a+N9a2g5xVOyE00VmmwRm2lKBIP98d3yxrt5w4Amk4ulM
         10hGQur6D6IlJ8TXQpHEHdOl5AKyQ7zCWC58KwfGDom+v58YONsFv0XX7x12uX8onPL3
         Fm4uHAO01/HK2p6MdeJTd5YXKC+A8vXG6OLzh0aNj6dmsVTD4LkODFXHVYYBEH9G3EmK
         9leA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567734; x=1785172534;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kG24nThS7TFwTpAIqI2B3tJQSHw8Yio3iFIh6/HIGgg=;
        b=roCnJDJunCkUWSaQ44b0BYjPI88ShyWDiCCoXE4gfunmXCgSEK0m/Ba3vYglNfzGMd
         Jq5UN8FsmNZY3qwPELT9YTXN93COV9pTHlfeTcAG7p6K5EHvxItw1HUVr+fpQsGQ7fJq
         VYgwQ1fS692tDHiD566aFuGILN5s20G7agfAR3LJ+4/kiA2GfVZwOw0FSWYZE7w0fMEv
         jiWhLq3jsLQKL7m2nshA8eT7vl29qlsHZGgR/LZTvAOtGqZ9m3L3xFM6QtCbzoYZOWYh
         moLx2uf/K48dThR+fI3DiCxnj4vyO2WbphTFOc0WHpNZXxc+NrfiV7iGA+Kr8H4UoHrJ
         Ydaw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8g/Mk0RG9zcXwjQTWaV2yr8NfIH9aOAqK3ruyDIMLxOB9X9R9CNU8blAFo30ZTufhZbvDVEd6oL6WsYHJ9aDB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx2vthA9s9Kvx6OL2XGRtp1esb6iha/dx0HinUMqRk9HRgJXVV
	qww+U23KhwGlUHMSRl0LBeno9kDkLJEmgumTox9fBvQ5miX61VbX4awXRp91zDq7w27frxsd5FY
	3qnI5jm5eG+ZfvA54JJYnZQ==
X-Received: from wmpj5.prod.google.com ([2002:a05:600c:4885:b0:493:b328:830b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45d5:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-4954a40843dmr163830585e9.25.1784567733458;
 Mon, 20 Jul 2026 10:15:33 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:15:08 +0100
In-Reply-To: <20260720171513.1415357-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720171513.1415357-13-vdonnefort@google.com>
Subject: [PATCH v3 12/17] KVM: arm64: Move hyp_vm refcount into the structure
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_101535_862354_7B6EA966 
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
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

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
2.55.0.229.g6434b31f56-goog


