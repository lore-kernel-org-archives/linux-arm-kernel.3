Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B794BCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 22:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fMZ7OhM8JOlJvnfA26tbvkth+uO96Z3bmtnJ/qhoYI=; b=r9TUsODIkGxmi1vCGWFn1ZXBgZ
	w/Nm0w89YUPp6oWzJg8SBeWN8nDABIWT6oRFowdMHxblUIj1eUaY3G2zbzPFRoJCToGStF2lXNQoO
	2VDwvcwsiMADXPwJ+IlWBKN2aDOIW+NR7QEcS+eNYt3DYa+lOw/5OXRd0Ga/+KbLj/ivLeJ/CT6p6
	7JGOKPXNjd0gVgJ64y2jFz38vQYmPhe2MvinxYPFv8skdmwWTg0hc90HrrQ3BGyH/LAKRIrDTSgGy
	ONTpc8Cl/8hGUzgyNgyztlsFt4UMh3zapOVduv6s2XB4kxC8HJOeqM0QqhJcImKmWogwkf9RYVcwi
	6kSgTxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxY-00000002qnh-091n;
	Tue, 07 Oct 2025 22:15:04 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxV-00000002qje-3crh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 22:15:03 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-269af520712so74212135ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 15:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759875300; x=1760480100; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7fMZ7OhM8JOlJvnfA26tbvkth+uO96Z3bmtnJ/qhoYI=;
        b=L8Qzi38KTnZSvrmIIkwV9hEI+Dex2bM2ZJCmTXw0mbeIo5dLnCCA2E4OUBwYhxpI5U
         Ka04BQAqY+fQf3kHeQ4t5+/5OvNPuaNHjdOOH7A6KdJPpRmyomwAYVMFXHUb9W1+iF0o
         tTmbRGVBxLzXmq3IJtAHVXKe9doagSoathiSzi9CWHFHD+uZu5qyWFguMplNLUdlLsDC
         LMqUePMUbD31Zo0UI1ZtJWG6zC7Pp5F9Hcy7dSyTLPYPv6IHzjwxfNWGrN66HtC+TaRj
         mFJDlEXfztMuTDJDeaFsOiaQ6PtVlSJmwws73RWY45dYwx0OjDZ2AcEWAH5K18/lhka5
         TOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875300; x=1760480100;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fMZ7OhM8JOlJvnfA26tbvkth+uO96Z3bmtnJ/qhoYI=;
        b=cXdCSZS0tKRCan7Dvvz8qU006B28m1/yUHj6GoKYLjCSDmJ12eoHniPcB3cIyHSyFe
         fHEUUe8gqDyEu+9DM4csFjlmUVsL2TItqBCTyCeEiTP7MLls9NrFaLlk7iernREf2CMM
         cY2dMNxsJ5MAnQU4V3+qwTOHYys+LnsSrJBuB/NIPeaSMKJ+baaVyMomQJmTJohZNXIZ
         MTWKtiirsoFMxMV5KFuW8gGhfJUxGKs3Pi7aZ1gdg6aS8srdbkNIiid9TqANBetbxX6i
         2VdA4jceyGEggeAomFHNdoc+msHhcZs1jh2sAA4O8UtoLkoAXBtU1zdTZTrzUvW2LQaP
         q3zg==
X-Gm-Message-State: AOJu0YwALuJGSbHwrn2DrHiDqO39/2ccWPugwqe3abDGMohLtB4drbR5
	r0JM9y4fLdhP7CZLcOo4jAgBe47YwY7FIaC+AkycRYOQMd9gkqRVLVKfFerz1Yb65TdIud7ZvJj
	0QuW17A==
X-Google-Smtp-Source: AGHT+IECKNXtIHUW5N14ZiXdwr22UXg6a0qRVDT9HGhdqQLa/WqCTYC09KfmHy6MwiN8aQHU+fr/YvGCioI=
X-Received: from plblb3.prod.google.com ([2002:a17:902:fa43:b0:269:a2bc:79bc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2c5:b0:27f:1c1a:ee57
 with SMTP id d9443c01a7336-290273736d4mr15592295ad.16.1759875300207; Tue, 07
 Oct 2025 15:15:00 -0700 (PDT)
Date: Tue,  7 Oct 2025 15:14:20 -0700
In-Reply-To: <20251007221420.344669-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251007221420.344669-13-seanjc@google.com>
Subject: [PATCH v12 12/12] KVM: guest_memfd: Add gmem_inode.flags field
 instead of using i_private
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
X-CRM114-CacheID: sfid-20251007_151501_969657_D8C31C6B 
X-CRM114-Status: GOOD (  13.12  )
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
index 95267c92983b..10df35a9ffd4 100644
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
@@ -162,7 +164,7 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
 
 static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(struct inode *inode)
 {
-	if ((u64)inode->i_private & GUEST_MEMFD_FLAG_INIT_SHARED)
+	if (GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED)
 		return KVM_FILTER_SHARED;
 
 	return KVM_FILTER_PRIVATE;
@@ -398,9 +400,7 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
 
 static bool kvm_gmem_supports_mmap(struct inode *inode)
 {
-	const u64 flags = (u64)inode->i_private;
-
-	return flags & GUEST_MEMFD_FLAG_MMAP;
+	return GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_MMAP;
 }
 
 static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
@@ -412,7 +412,7 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
 	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
 		return VM_FAULT_SIGBUS;
 
-	if (!((u64)inode->i_private & GUEST_MEMFD_FLAG_INIT_SHARED))
+	if (!(GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED))
 		return VM_FAULT_SIGBUS;
 
 	folio = kvm_gmem_get_folio(inode, vmf->pgoff);
@@ -601,7 +601,6 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 		goto err_fops;
 	}
 
-	inode->i_private = (void *)(unsigned long)flags;
 	inode->i_op = &kvm_gmem_iops;
 	inode->i_mapping->a_ops = &kvm_gmem_aops;
 	inode->i_mode |= S_IFREG;
@@ -611,6 +610,8 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 	/* Unmovable mappings are supposed to be marked unevictable as well. */
 	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
 
+	GMEM_I(inode)->flags = flags;
+
 	file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR, &kvm_gmem_fops);
 	if (IS_ERR(file)) {
 		err = PTR_ERR(file);
@@ -931,6 +932,8 @@ static struct inode *kvm_gmem_alloc_inode(struct super_block *sb)
 		return NULL;
 
 	mpol_shared_policy_init(&gi->policy, NULL);
+
+	gi->flags = 0;
 	return &gi->vfs_inode;
 }
 
-- 
2.51.0.710.ga91ca5db03-goog


