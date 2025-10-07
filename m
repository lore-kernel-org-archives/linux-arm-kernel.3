Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EACCCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 22:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNU+HQsGvlmXwK42mozGB/w8m3B2kCFg6kDxESGSNsw=; b=kS9JG5lWFMuoEUDw+KorUI/AVv
	olh1zb7pETbwHAMieagqG8X25OYYUjZKXWQtC3mNCUjt6iJlqL/HsfhvyoR01cfUcnoM7SfrY/lRb
	HtunWtGTVOLGeZlhdNJjnwlnUERX/m2S8HDk1O4z9ueWkXCaAytly7wDD/AOTAdcvksW+JJSEv9TI
	u5rAkkUhBPcztsqM3ImZjX6aiAHUO/Chqo4lQrbIeNSCVjBWrhUqPCYaWkJqg1NOUdF7TBVJcHIu4
	SgqTfvezqbue5s5bkmYlCyJyXC8d7VxobR7Wbg4V1sRWt8WNA+kt5AKbybOoy6j/cUda6LV3qesdE
	NlkN/+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxK-00000002qXx-0f4W;
	Tue, 07 Oct 2025 22:14:50 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxH-00000002qVM-1mEt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 22:14:48 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-78117b8e49fso11314126b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 15:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759875286; x=1760480086; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gNU+HQsGvlmXwK42mozGB/w8m3B2kCFg6kDxESGSNsw=;
        b=2cY0g/5bTzAXePWU0f783zfM6JPn3f5FIFJRx+AdOai9uFU1AXmlw061qv1iLpHA7Q
         oQsZIXcH82G2GuikjcLJhACfhPPVFg855sMqqkpREUrbDIcmBgYmnGCaDDmz/jhWmGQN
         LFFNqoR25flfXxhdPyTLSdhwmcgcvAukNVUYmgBwj+Eu4QUyzzIl/eZ8AOsNuVB8AJCh
         Q6VI+Xab4AIk0QOTu8PUs70ExZ+zYEqWrCG0iHWzsnM35xy/MXN3lRW0ZOHVs4cfd8t+
         dfe5gAiYBVasbUVc3W5LD6bN/TcJcVc7DaIiFYv1tVRQf5Wztr1qdS54dtFdnjZ96R/g
         nwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875286; x=1760480086;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNU+HQsGvlmXwK42mozGB/w8m3B2kCFg6kDxESGSNsw=;
        b=QgRLjPrZLBX0IoYEGPcj+RvJIJgQUMUFlJm8oyL8eRdF20NSaDzM8ffzaN5rC8iCFO
         di6CNRzRem7IkBMILwUFReVb062Rcl4+NbJOPT7q9kZpmE48GL9vs2wDMdBecITrI57L
         MphXUOt/H2HT7wqxVov5FC4sOYOyAj8sA8z3Pcq6lWA4Wt8XeQh4vPcKBIfDkjdkVbDI
         i4OxMal2TqUncZFS3jZwMXiHNvKw22VnwvpyP3tAlPi4eWTm3QfN7Nw4MUVUM2GL4q2B
         H0SEqKZjvbDGhPxCi8GynMpxT9mUijQzhIxO9XmVufgPQypAvrs0yU5d+1qyMA28aTHh
         RiBg==
X-Gm-Message-State: AOJu0Yxogjs22qlXpAaasAoaSaxMpEm0vk7TB+6C8W9u6ef5cEZxq3DK
	tmnAwyvZM405R8l09vPahTkTgOgnV5R2q2MgwLqo6Gwl1HaCEiO6ZnmPloDV4TpXfxVORtW2B4/
	pKph9yw==
X-Google-Smtp-Source: AGHT+IGsPoJFOynSay0ELmZDfFhnfNRyjkBL7llPocXzISl5rOG0O7IaOg1XPUo94bJb1i3k0OW8/UjXMo0=
X-Received: from pgam19.prod.google.com ([2002:a05:6a02:2b53:b0:b63:2a6b:80b4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7187:b0:2fb:add5:5574
 with SMTP id adf61e73a8af0-32da845e5d8mr1080588637.47.1759875286183; Tue, 07
 Oct 2025 15:14:46 -0700 (PDT)
Date: Tue,  7 Oct 2025 15:14:13 -0700
In-Reply-To: <20251007221420.344669-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251007221420.344669-6-seanjc@google.com>
Subject: [PATCH v12 05/12] KVM: guest_memfd: Enforce NUMA mempolicy using
 shared policy
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_151447_468650_24B33152 
X-CRM114-Status: GOOD (  22.25  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Shivank Garg <shivankg@amd.com>

Previously, guest-memfd allocations followed local NUMA node id in absence
of process mempolicy, resulting in arbitrary memory allocation.
Moreover, mbind() couldn't be used  by the VMM as guest memory wasn't
mapped into userspace when allocation occurred.

Enable NUMA policy support by implementing vm_ops for guest-memfd mmap
operation. This allows the VMM to map the memory and use mbind() to set the
desired NUMA policy. The policy is stored in the inode structure via
kvm_gmem_inode_info, as memory policy is a property of the memory (struct
inode) itself. The policy is then retrieved via mpol_shared_policy_lookup()
and passed to filemap_grab_folio_mpol() to ensure that allocations follow
the specified memory policy.

This enables the VMM to control guest memory NUMA placement by calling
mbind() on the mapped memory regions, providing fine-grained control over
guest memory allocation across NUMA nodes.

The policy change only affect future allocations and does not migrate
existing memory. This matches mbind(2)'s default behavior which affects
only new allocations unless overridden with MPOL_MF_MOVE/MPOL_MF_MOVE_ALL
flags, which are not supported for guest_memfd as it is unmovable.

Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Shivank Garg <shivankg@amd.com>
Tested-by: Ashish Kalra <ashish.kalra@amd.com>
[sean: document the ABI impact of the ->get_policy() hook]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 69 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index cc3b25155726..95267c92983b 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -4,6 +4,7 @@
 #include <linux/falloc.h>
 #include <linux/fs.h>
 #include <linux/kvm_host.h>
+#include <linux/mempolicy.h>
 #include <linux/pseudo_fs.h>
 #include <linux/pagemap.h>
 
@@ -27,6 +28,7 @@ struct gmem_file {
 };
 
 struct gmem_inode {
+	struct shared_policy policy;
 	struct inode vfs_inode;
 };
 
@@ -112,6 +114,19 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
 	return r;
 }
 
+static struct mempolicy *kvm_gmem_get_folio_policy(struct gmem_inode *gi,
+						   pgoff_t index)
+{
+#ifdef CONFIG_NUMA
+	struct mempolicy *mpol;
+
+	mpol = mpol_shared_policy_lookup(&gi->policy, index);
+	return mpol ? mpol : get_task_policy(current);
+#else
+	return NULL;
+#endif
+}
+
 /*
  * Returns a locked folio on success.  The caller is responsible for
  * setting the up-to-date flag before the memory is mapped into the guest.
@@ -124,7 +139,25 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
 static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
 {
 	/* TODO: Support huge pages. */
-	return filemap_grab_folio(inode->i_mapping, index);
+	struct mempolicy *policy;
+	struct folio *folio;
+
+	/*
+	 * Fast-path: See if folio is already present in mapping to avoid
+	 * policy_lookup.
+	 */
+	folio = __filemap_get_folio(inode->i_mapping, index,
+				    FGP_LOCK | FGP_ACCESSED, 0);
+	if (!IS_ERR(folio))
+		return folio;
+
+	policy = kvm_gmem_get_folio_policy(GMEM_I(inode), index);
+	folio = __filemap_get_folio_mpol(inode->i_mapping, index,
+					 FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
+					 mapping_gfp_mask(inode->i_mapping), policy);
+	mpol_cond_put(policy);
+
+	return folio;
 }
 
 static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(struct inode *inode)
@@ -413,8 +446,38 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
 	return ret;
 }
 
+#ifdef CONFIG_NUMA
+static int kvm_gmem_set_policy(struct vm_area_struct *vma, struct mempolicy *mpol)
+{
+	struct inode *inode = file_inode(vma->vm_file);
+
+	return mpol_set_shared_policy(&GMEM_I(inode)->policy, vma, mpol);
+}
+
+static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
+					     unsigned long addr, pgoff_t *pgoff)
+{
+	struct inode *inode = file_inode(vma->vm_file);
+
+	*pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
+
+	/*
+	 * Note!  Directly return whatever the lookup returns, do NOT return
+	 * the current task's policy as is done when looking up the policy for
+	 * a specific folio.  Kernel ABI for get_mempolicy() is to return
+	 * MPOL_DEFAULT when there is no defined policy, not whatever the
+	 * default policy resolves to.
+	 */
+	return mpol_shared_policy_lookup(&GMEM_I(inode)->policy, *pgoff);
+}
+#endif /* CONFIG_NUMA */
+
 static const struct vm_operations_struct kvm_gmem_vm_ops = {
-	.fault = kvm_gmem_fault_user_mapping,
+	.fault		= kvm_gmem_fault_user_mapping,
+#ifdef CONFIG_NUMA
+	.get_policy	= kvm_gmem_get_policy,
+	.set_policy	= kvm_gmem_set_policy,
+#endif
 };
 
 static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
@@ -867,11 +930,13 @@ static struct inode *kvm_gmem_alloc_inode(struct super_block *sb)
 	if (!gi)
 		return NULL;
 
+	mpol_shared_policy_init(&gi->policy, NULL);
 	return &gi->vfs_inode;
 }
 
 static void kvm_gmem_destroy_inode(struct inode *inode)
 {
+	mpol_free_shared_policy(&GMEM_I(inode)->policy);
 }
 
 static void kvm_gmem_free_inode(struct inode *inode)
-- 
2.51.0.710.ga91ca5db03-goog


