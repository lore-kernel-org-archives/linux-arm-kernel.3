Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D121CCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60UJyOOlPd6wRLEbpnoi5TtuF+cO4J6qbu8FcQfj4DA=; b=H6pQXRTrJoCnBNPACDcCraGjJw
	qvGTTSUH+qHya5fxSHnPOMzDMndfk4C9m3o2bVPF0npPcAgYQ9GpgOHcM4nniQ+shsG8vH9EbjziK
	p8/SYZAQMkET8Ii4ek45uUOT5QYea4TcWxsZviv7DP1iXDTDWBjh/wnyOM3TMCH1E7rAbMtID79Rb
	8A+0YHAswzK4MeoL7xgozeC5vxTN5Olp6Y96YFq8t1oKJCgXe2Bypdkb2tMvJ+047+wp9o9LThFnn
	kHSq3IMoWafZxUDolRbjxJt+pf90ZY+UrzvyE5PIuQxj5Gyrm9rNO3BgZcGBmvF7PAO3BMT6mKDIU
	whzhYfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ro6-00000005ZjH-1227;
	Thu, 16 Oct 2025 17:30:30 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rnu-00000005Zc0-3WYF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:30:22 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32eddb7e714so940489a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 10:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760635817; x=1761240617; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=60UJyOOlPd6wRLEbpnoi5TtuF+cO4J6qbu8FcQfj4DA=;
        b=y83hHNOqJm2E0YJ988t2dcO3S7opREy437m+KiFhfxDTtXzpfZAH22m26bFjSrgfdR
         4PDVBHYolHYPrsZkWaE3W0lUuW0rsmIKzDucHGwUjAuiXTWmUdanuu3UkN7wCRp2IxBd
         nr3dDf2DJdkIyiuxuid2u/qNagavrwf1RAhkip5oe7jzh0EGKfzcD+e77KSmLrrDmU+3
         D2SqusUA1NYAuSzdCLq6xgqx7mLcGWsecDA3d3VK/Wfabav8E9M3vUoDEwZcvI2yxGia
         GusH239Ra3wHTrhfc7N2qTR6bkfYfwfXqmJ6dxclDycY+Pyuy7JPibxKc+aiovCThD1g
         ez3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760635817; x=1761240617;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60UJyOOlPd6wRLEbpnoi5TtuF+cO4J6qbu8FcQfj4DA=;
        b=pxPwfvydFns1CQhJw8n3mgGWfVrgXupNZR9IYIOR2GO/baE/P1rviYdPEzvBEXLMY5
         hzw2gkx0Tg3uh1aCm0eiA/vDHFsGIeV4xd/Z8gv0iF6auDiSxjbRAW9R5bFB+XJcRQSf
         nlC7kcmWNSlWWjUiyhBfsCrJMcIGUePl0g6kg3L2fRTwyJSmf2duer/6gAHCk4iXAOrw
         RhSf+Orjd3dhhhOPASVGnkpbyLgohLZp1EyH9ZfSOHP5NGA5eCFrIo1qyGOxrVtm/jcV
         H8OuEbw4+VKN+O5X0azw6+eUVsD4sWAVOja/B073EObhG0BKlI0cyLFr2hReAQ9U8k89
         sHFA==
X-Gm-Message-State: AOJu0YxORsiNc6+wJSNc2eGem+egirVar2sNK4emZU9Ymfi8I6kRRQg/
	TTyIe1GV/wPbb0nSPOX/DFLxmO+tN0pYeL5OCcy7rdxu0lweF9mxAxoVwGaUQ0Zkaa3ZbZM/NfG
	PHouQoA==
X-Google-Smtp-Source: AGHT+IFcs9B/qCYOsWmtZzq14oPESjBkFJ9nBCJwMUyetaJnGRYqGcMBfINCMOMd2YxxJXmxDfq4dgLvfo8=
X-Received: from pjha21.prod.google.com ([2002:a17:90a:4815:b0:330:9af8:3e1d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c10:b0:32e:a10b:ce33
 with SMTP id 98e67ed59e1d1-33bcf8facf2mr645651a91.21.1760635817441; Thu, 16
 Oct 2025 10:30:17 -0700 (PDT)
Date: Thu, 16 Oct 2025 10:28:46 -0700
In-Reply-To: <20251016172853.52451-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016172853.52451-6-seanjc@google.com>
Subject: [PATCH v13 05/12] KVM: guest_memfd: Enforce NUMA mempolicy using
 shared policy
From: Sean Christopherson <seanjc@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_103018_885231_F2E68FC3 
X-CRM114-Status: GOOD (  24.35  )
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
operation.  This allows the VMM to use mmap()+mbind() to set the desired
NUMA policy for a range of memory, and provides fine-grained control over
guest memory allocation across NUMA nodes.

Note, using mmap()+mbind() works even for PRIVATE memory, as mbind()
doesn't require the memory to be faulted in.  However, get_mempolicy()
and other paths that require the userspace page tables to be populated
may return incorrect information for PRIVATE memory (though under the hood,
KVM+guest_memfd will still behave correctly).

Store the policy in the inode structure, gmem_inode, as a shared memory
policy, so that the policy is a property of the physical memory itself,
i.e. not bound to the VMA.  In guest_memfd, KVM is the primary MMU and any
VMAs are secondary, i.e. using mbind() on a VMA to set policy is a means
to an end, e.g. to avoid having to add a file-based equivalent to mbind().

Similarly, retrieve the policy via mpol_shared_policy_lookup(), not
get_vma_policy(), even when allocating to fault in memory for userspace
mappings, so that the policy stored in gmem_inode is always the source of
true.

Apply policy changes only to future allocations, i.e. do not migrate
existing memory in the guest_memfd instance.  This matches mbind(2)'s
default behavior, which affects only new allocations unless overridden
with MPOL_MF_MOVE/MPOL_MF_MOVE_ALL flags (which are not supported by
guest_memfd as guest_memfd memory is unmovable).

Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Shivank Garg <shivankg@amd.com>
Tested-by: Ashish Kalra <ashish.kalra@amd.com>
Link: https://lore.kernel.org/all/e9d43abc-bcdb-4f9f-9ad7-5644f714de19@amd.com
[sean: fold in fixup (see Link above), massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 58 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 88fd812f0f31..4463643bd0a2 100644
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
 
@@ -129,7 +131,25 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
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
+	policy = mpol_shared_policy_lookup(&GMEM_I(inode)->policy, index);
+	folio = __filemap_get_folio_mpol(inode->i_mapping, index,
+					 FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
+					 mapping_gfp_mask(inode->i_mapping), policy);
+	mpol_cond_put(policy);
+
+	return folio;
 }
 
 static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(struct inode *inode)
@@ -411,8 +431,40 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
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
+	 * Return the memory policy for this index, or NULL if none is set.
+	 *
+	 * Returning NULL, e.g. instead of the current task's memory policy, is
+	 * important for the .get_policy kernel ABI: it indicates that no
+	 * explicit policy has been set via mbind() for this memory. The caller
+	 * can then replace NULL with the default memory policy instead of the
+	 * current task's memory policy.
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
@@ -864,11 +916,13 @@ static struct inode *kvm_gmem_alloc_inode(struct super_block *sb)
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
2.51.0.858.gf9c4a03a3a-goog


