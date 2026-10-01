Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241DDCA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 18:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuL/trC6ai3Kh0aIJd/3xh1DmywKzy5BGHO8nv2ShpM=; b=BWA8A4zGTIt4mHw0ucffiCc3r6
	u9BWmuAojls3M+D6Ll7T7MBxujp3AWHEqurn6DjNq+9nyE5qDBEO2xgKcRDjPH7ftURtVTUM4vD2T
	N8ns/O8iW813TdmY3QmJ6kPp2In4+thZyzVE7atw45yzqLaR8n+qarT6ho2lorfkV4FE14b7RRPz4
	qsWfqi2uskRgha7C+yNzKxb1Y+rLKlUzFlWdvRz8fA+5yjyhDP7SjsRNfSmCC37LZ8cXQ+hnKtOgn
	puY1k0HVxTiy7eV7Afxsado7IN6lPNQH3jDHp8DVMDWwPiirA11j7Q79qdrZY/gI/zjhkqVlDcET5
	ReaSpmBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmj-00000009NTn-0kmM;
	Thu, 01 Oct 2026 14:29:21 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmc-00000009NIG-1d4L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:29:16 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-48b028d93c5so1112483f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864952; x=1791469752; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuL/trC6ai3Kh0aIJd/3xh1DmywKzy5BGHO8nv2ShpM=;
        b=AXHaEZLoWVyZ4B82iyKBJ0OZFPs2smbpIE3ncP4xP7VRXnCuLGrU617Nw8yCHcQOst
         HJ9NiWIow9pCDjfD88dQ8tt9w6xeEDttxT71s5iyCVp9WHHja+kTJBdJ+r5GYodWvVIR
         w0UFXAn0xMbcFT9ULYYQMS9Ab2wMddLZsGcPvFbDogBt2ODSvA1qTAzmebS7DIOhkBcY
         FRPv6Tshy9Gkryugx/nn/7LKEVA999kyiBXwPqzitVOKjE993JD0yI0vGyA4D0wfS4tC
         +1oKFgGEQmRkgAhqCFjUYQfvWVby3N5wQTCIgo8l+MAfcF5atw+fFo//peb9u3Pj5yYr
         pxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864952; x=1791469752;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TuL/trC6ai3Kh0aIJd/3xh1DmywKzy5BGHO8nv2ShpM=;
        b=Y4CuhDanPntrMNgM/z3o9lqtA19ANI66oq+C0pvao4fMNCN1CUC5vUnb07bnoopBOb
         ya7+BYrGqqVoIw5OITYFZ8gIhIDACE8bhyDW5jwXAEpwvf7VcP47J7NDmyziffs1PPf0
         j5zTA5ZISq8LytxPxxhnu1AR0yZ/KFGKQa5ggd0NxhWDPxLNSSRbBotdXlfQnJHzl/Sa
         VF6r6mY1UROmG9c9NLRDpqwcprmQbkIJ7h/BbDo9u48vN+kiJ+9sI16l0PmhCZKEIXXy
         jyI72/DDtEFnSAAouIB8N8qGoBnGtENRkSN20XRuRlpz1Iu8AxzLZWm4CeqA4UA3ax+N
         K4cQ==
X-Forwarded-Encrypted: i=1; AKwUvBydnOBOmYywHDV2uj7PC2eZDykNhfwrSEWRrFcrMi6viVmgIh5xoKbvIrQJABkslJi4YZ1kNuXDyvWd53UdCReQ@lists.infradead.org
X-Gm-Message-State: AFq9FYLQZ4ZdMV7LHatH6KhQ0DuCc/Rxp8sxJKfQN/Vg1bZWF0EB+mva
	bEvKXzsPldj1cqv8l9LDMrAyDdWW+hIMCqyKMtqcmOLf/D9u68biSljyh6P4rsf+Gz4aYJz8I6l
	8yk9necmuxvvxw5bXrA96dQ==
X-Received: from wrbhe34.prod.google.com ([2002:a05:6000:15e2:b0:47f:74c9:84ee])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4914:b0:487:1646:8740 with SMTP id ffacd0b85a97d-48b02525c39mr9358682f8f.29.1790864951846;
 Thu, 01 Oct 2026 07:29:11 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:43 +0100
In-Reply-To: <20261001142849.3367614-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001142849.3367614-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-13-vdonnefort@google.com>
Subject: [PATCH v6 12/18] KVM: arm64: Move hyp_vm refcount into the structure
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072914_446553_7770EAA5 
X-CRM114-Status: GOOD (  13.78  )
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
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h | 13 +++++++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 10 +++++-----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index c1171451e1be..b208544141c0 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -42,6 +42,7 @@ struct pkvm_hyp_vm {
 	struct kvm_pgtable pgt;
 	struct kvm_pgtable_mm_ops mm_ops;
 	struct hyp_pool pool;
+	unsigned short refcount;
 	hyp_spinlock_t lock;
 
 	/* Array of the hyp vCPU structures for this VM. */
@@ -66,6 +67,18 @@ static inline bool pkvm_hyp_vm_is_protected(struct pkvm_hyp_vm *hyp_vm)
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
index 5cdb0318fa7b..98db5bd28dde 100644
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
2.56.0.rc1.315.gc6ed9934b7-goog


