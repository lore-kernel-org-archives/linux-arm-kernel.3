Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05B5C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdFVyI+iwmCLzmueY5nTTG6ZH9FRTD6xXO0pAOzqdmo=; b=5G2NH5x/+ovwv0FGPieKmNAVns
	4NfxDvgW10ih52kcjZ7K5cNgtU7677rggSmVhe0CkpPKPN1RwgePVS2RKgsryF7e9hATW/uLEDI0m
	EJHt/OJgOGqT1alBh3mISjXRZYZcLiQluw5nv+F/yEo6W2b0EwqcM+fnNq1GSzh5P1It2dC9clphz
	zoqVx77Bz6aJcgAMnpoHUHVWWMLo55aHKkfTQ7iw+16WMn6HqleTmyNRAzxrwR9CdNRGDViiWSI6u
	dHxDbdZwu5CpZcXrJf8fRuv3nigbZxaOWuaE99YWaXuhj/wjSICgtYe+qDUkATUtQXqeOXbMBGQ3l
	CaI7tIBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZJ-0000000BD1R-0anf;
	Tue, 01 Sep 2026 08:10:09 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZF-0000000BCst-3kIy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:10:07 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-4843afbecdbso210280f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788250203; x=1788855003; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdFVyI+iwmCLzmueY5nTTG6ZH9FRTD6xXO0pAOzqdmo=;
        b=fFf0ciWjmtvoG/Bqa0tHtU5ssGjezyk5VQAJEJN+UPGHeMVHTQC/wGZ08VY2ZYEoct
         omkqvLYAqE/7KxTZ9FccazYx9sunjvHfT8C2SdrA0XgX6QsAv5zW7y8moOCJXAcqf92O
         nx+RFZ6XRxt/TtoQ8Db9wh4lLsVdo9W1Yv8Icx9l4d7rJ6LqBBVwBvSF9QXIp+mepnFx
         1eJWRvsdu3zeFGzvMPLFekorrTokYLTmg4iZXe6hUpG0ZAHIDM7i8U7YVVC3D6wlOgxV
         QdsJC05OCXSgzqb/TlNifBvE/bOyTarv+3YmA6CZQkFkywmxH1LlKYR+wEZRCK7X/G2V
         axRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250203; x=1788855003;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdFVyI+iwmCLzmueY5nTTG6ZH9FRTD6xXO0pAOzqdmo=;
        b=swBZSiAFC1G41cNasmEDsorcJASn3JT7ZEaf5OSbW+FYVLGCUV/stXjXAYMfUXZitp
         MovNkJtuh4jVIqXGACN6wgAFycCmQJg6EeIbF5PYzLyx8TdYLCKoNRYMSFMnKwFT1/PX
         sEAV5FB75zQ6Vn6UPzx23cbQoJlt4MFI15r9DaI8n16wYDX0OgMwsKdhtlJ3i68Z5dUb
         fwu6V/e1n9lhBGqC2WFQFOVSJlj6Jx5EPHQ73gqevLr8FycEQUpKEmglIob6wFoC//53
         +UhNaFDby7hYo/1rL6KMnqZirXP9r3qa5tJuuATKv7WIn9J0BiEYhaHQKa3UyaC4zXWu
         YnKg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7oMMo1jEXVUKDa/LoJhJ3Dewb9TIpS2y+jG1yeIW2SKZp5wmHuEy6l/lM0QJ7agPa29ecFaIvsMyOWAiBUfN9@lists.infradead.org
X-Gm-Message-State: AFuF++kYWc4vYeMbmTswxywm9LGVv7uxCGBHb5izIrkwu9NLxkvfrMa4
	n9ejpFDmdv7awOGT+cfnp8x4jThTqbV+CqS5XxYJfc2IvnfQcEujP1P+gWgFlwJ3CO62ZbPoe5+
	0gZpriaTOTYCiufnQPiSLBg==
X-Received: from wmol4.prod.google.com ([2002:a05:600c:47c4:b0:49c:da85:4930])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:8449:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49b96a05caemr444293575e9.13.1788250202692;
 Tue, 01 Sep 2026 01:10:02 -0700 (PDT)
Date: Tue,  1 Sep 2026 09:09:35 +0100
In-Reply-To: <20260901080941.997769-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901080941.997769-13-vdonnefort@google.com>
Subject: [PATCH v5 12/18] KVM: arm64: Move hyp_vm refcount into the structure
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_011006_119671_769EEC1A 
X-CRM114-Status: GOOD (  11.20  )
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
index 459bd9eb7e4b..0a041d41b9ea 100644
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
 
@@ -979,7 +979,7 @@ static struct pkvm_hyp_vm *get_pkvm_unref_hyp_vm_locked(pkvm_handle_t handle)
 	hyp_assert_lock_held(&vm_table_lock);
 
 	hyp_vm = get_vm_by_handle(handle);
-	if (!hyp_vm || hyp_page_count(hyp_vm))
+	if (!hyp_vm || hyp_vm->refcount)
 		return NULL;
 
 	return hyp_vm;
-- 
2.55.0.897.gb25b4bd76c-goog


