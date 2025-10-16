Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C4ECCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVBqs1fBWLjUqhKekNBXs2j0fRJmcNGrbmsvLjXeKrQ=; b=tHmo80+znOSVygWoTmC2Ybsdkc
	FdlAF8/TkMn2+3WS9cU0mm2tDaalSVQn+Auko/V5uejZrqUTFqMUxRhCukJPRD/Ju5iUtXOg+KLUY
	Xicgy7yp1NNKkqVrAHis36R6ildIdYLHKVcY/TujXep8sP9/xd07fnIS7/q0HW43HgtLW0NwIUHdU
	5Sbms3CvVOE8rRHVLS7y4CjfNgRYb5dPrqRtGHwS2u8GDmXnvNhXAQqNhSgk/MuN4TEmnxRj3kMaS
	nwDCPEZIUUCIhf4bvCtd+r9RkepFo8AOamnepL7a+nN9spN0o2ip+Cz45O6tW1fi4p7u/DHlRbKyG
	zYE5R6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RoL-00000005Zy9-0xsK;
	Thu, 16 Oct 2025 17:30:45 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ro6-00000005ZjB-28OM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:30:34 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b6097ca315bso1569182a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 10:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760635829; x=1761240629; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hVBqs1fBWLjUqhKekNBXs2j0fRJmcNGrbmsvLjXeKrQ=;
        b=3jSDu++I/Jky2GTc1L4avOh1Ldply0O2WCA2SKGLJGYootMgq6WSz4vEPpqFfqkedZ
         xQc7V1Cffo8XBQQDM9kOXa4ROju34uJgv5A62K2OrGQirHrpX7uLDcY+NxPJTzoLUG5d
         14B5iyFMBzBNthTkXSt8hvzpbU8KMJSkyHTY13fSE3BurOKzgyS1ciEXzcGlgw6TJxjc
         d9MQ3ToBhutsZai4u93LjU9Fu/7KLXwil2x8UTnn3gKaVNV3KVLWCvaHBo+ZreNzZKPG
         uHAl169OVpHbTXPPzApCBCh35s1ee5fhT1cTILhD5JhzLOluhSxDRF1/gbud7Iyf+NeQ
         ICBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760635829; x=1761240629;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVBqs1fBWLjUqhKekNBXs2j0fRJmcNGrbmsvLjXeKrQ=;
        b=kYyQSiavTkjpj9O2eMDnCQKv83lj9ZjLR26g0R7CW6AQXyKH9fhmwceY/HykfyMyWg
         bYrZpves3AIf49/4iU4mQ9JiCUNmRenAqQ5TbP5sNx9XzvaPzVPwrHZSDF5BU3TsMtbe
         54qvz239rWh8T077bfZvKAVgigAcJrsYaNfExtoAmQTeBkmh5muTRMwfamJRFZ2uaNLJ
         4Gr56uT0pnDBzwhABXhjpRemAcxCn3I/yZDWgNpLXYHoLP+polU+kr20/y2APLIKMS54
         wRRxEbgUYxjFhIgSAKFjDWnustFguDkFLBwFMAlcvnmO+bhly7i1sO5tEVMVRn+NUIK3
         HKFA==
X-Gm-Message-State: AOJu0YyyVTs2PZilepdTcl50wDjTTcYfoMfcMUqwzEypqbKj8Zu1iL7n
	YkxXtAM7iZR7bq9rtVu7BoEWRD7c2e9b0gokxYGytGO8sUq4h7H3+huLlirooL+ZlkjAsSLogPC
	NqIzEWQ==
X-Google-Smtp-Source: AGHT+IGe2t05unDim4uDryBf0T+QferPUXjPaV2LK4Nd4NgexnAWeTiux+wqiz6ZgBu9e+7IBbrnySiYCWM=
X-Received: from pja6.prod.google.com ([2002:a17:90b:5486:b0:33b:51fe:1a79])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2590:b0:2e0:9b1a:640a
 with SMTP id adf61e73a8af0-334a8485506mr977560637.3.1760635829602; Thu, 16
 Oct 2025 10:30:29 -0700 (PDT)
Date: Thu, 16 Oct 2025 10:28:53 -0700
In-Reply-To: <20251016172853.52451-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016172853.52451-13-seanjc@google.com>
Subject: [PATCH v13 12/12] KVM: guest_memfd: Add gmem_inode.flags field
 instead of using i_private
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
X-CRM114-CacheID: sfid-20251016_103030_591841_04D4285E 
X-CRM114-Status: GOOD (  12.48  )
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

Track a guest_memfd instance's flags in gmem_inode instead of burying them
in i_private.  Burning an extra 8 bytes per inode is well worth the added
clarity provided by explicit tracking.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 4463643bd0a2..20f6e7fab58d 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -30,6 +30,8 @@ struct gmem_file {
 struct gmem_inode {
 	struct shared_policy policy;
 	struct inode vfs_inode;
+
+	u64 flags;
 };
 
 static __always_inline struct gmem_inode *GMEM_I(struct inode *inode)
@@ -154,7 +156,7 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
 
 static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(struct inode *inode)
 {
-	if ((u64)inode->i_private & GUEST_MEMFD_FLAG_INIT_SHARED)
+	if (GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED)
 		return KVM_FILTER_SHARED;
 
 	return KVM_FILTER_PRIVATE;
@@ -385,9 +387,7 @@ static inline struct file *kvm_gmem_get_file(struct kvm_memory_slot *slot)
 
 static bool kvm_gmem_supports_mmap(struct inode *inode)
 {
-	const u64 flags = (u64)inode->i_private;
-
-	return flags & GUEST_MEMFD_FLAG_MMAP;
+	return GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_MMAP;
 }
 
 static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
@@ -399,7 +399,7 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
 	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
 		return VM_FAULT_SIGBUS;
 
-	if (!((u64)inode->i_private & GUEST_MEMFD_FLAG_INIT_SHARED))
+	if (!(GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED))
 		return VM_FAULT_SIGBUS;
 
 	folio = kvm_gmem_get_folio(inode, vmf->pgoff);
@@ -588,7 +588,6 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 		goto err_fops;
 	}
 
-	inode->i_private = (void *)(unsigned long)flags;
 	inode->i_op = &kvm_gmem_iops;
 	inode->i_mapping->a_ops = &kvm_gmem_aops;
 	inode->i_mode |= S_IFREG;
@@ -598,6 +597,8 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 	/* Unmovable mappings are supposed to be marked unevictable as well. */
 	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
 
+	GMEM_I(inode)->flags = flags;
+
 	file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR, &kvm_gmem_fops);
 	if (IS_ERR(file)) {
 		err = PTR_ERR(file);
@@ -917,6 +918,8 @@ static struct inode *kvm_gmem_alloc_inode(struct super_block *sb)
 		return NULL;
 
 	mpol_shared_policy_init(&gi->policy, NULL);
+
+	gi->flags = 0;
 	return &gi->vfs_inode;
 }
 
-- 
2.51.0.858.gf9c4a03a3a-goog


