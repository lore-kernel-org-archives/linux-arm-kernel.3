Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B2CCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTGJgj5iiOhAO7S5Tta2IQsGxNpf9yY+7OEbh2Vbabs=; b=uCO9sOP0VjaV3Q8mxPb1N+eYxI
	VHtA5ena9WUExn113JBys8H/uzrzpELtNGuUSArJqScbzWSBny0wlK8o7ftCeoZNU4j1Pl3tbT9wA
	YgoLNuW7Qw3Z5IQ0cbUuCutKzOzCAfSMkl0VDzNaGBSV3i2wJIQPLEqY1H2JiGcBgt9zkUs7XbRUg
	EDfADA4kwqY/QFyNt4coe7U+21HzKkPQI5SLfSMlxmfPtPiKYu0OLdBWpbkHNWMbJgmLGuDpLJB3p
	hh/VmRGVo4oPrXnow/YjUY+SehbxAecQjUFX94/Wjrgyp7iKd2mBLOPjAgIliW1a98DE+JB/dO9YX
	OfqUy7cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ro0-00000005Zfz-1Obc;
	Thu, 16 Oct 2025 17:30:28 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rns-00000005ZaQ-3IH7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:30:17 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-334b0876195so1187886a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 10:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760635816; x=1761240616; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hTGJgj5iiOhAO7S5Tta2IQsGxNpf9yY+7OEbh2Vbabs=;
        b=TiwOAxCLmRp5WgGLXwa8wC+/HRcmnZqXoW56sEvibVqsI4F6mJuw7FcSVKvOXE4Dsy
         cZr+fzEmTNykgm7rrnhcDht6j0cv22p2FJrs5bjbARAIIxzPp1EAsJbIMxoNOM3LLXcD
         3axakTjzcpc+6sRAa1Dclz1XJS1DX9GL8J+JDUwjY/1rau3+WP5WMwZv5Dbp16WHrdcN
         bc70wBJbM/WWqgcDHAsjF55M6YkA+7L7+fo+iDIsOeUclX8aVBQDpoRdS2Vot2f/lb1V
         WcYdHwRAOvprG1EIHLjTNTyUzN8jbCqfXls6BO+HjT4mtUurayARE64JOyrZJv8kgevE
         isTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760635816; x=1761240616;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTGJgj5iiOhAO7S5Tta2IQsGxNpf9yY+7OEbh2Vbabs=;
        b=G2NhcPo7Z6ziCJFPS0AJGmAHOpmHXgNzHUyUv/s9xpvga2yNWzBxDVvDVI5l4TeHgz
         YnCf1VOGP+tSJPb/svyivx0aZ9Im5fWRKG1BOOSl7YY7Pgm5ODrTacwJ9YiGG4OQ9Boe
         VwFO0FI4C3BcRMnCXiJHRNJDj8qog2JjXuDpnMTGKDe1xi0MpFnIOU5UPHz7nBxpNKk+
         58edNIUg9cczK1MTR2cotyi7KeU6OUUifsB40YGBts0huhAfaukQT8UDouTCTSrDOuAe
         KSWPokXKQmJ9kKF1mVgq2ay5b0NJh3Sjuu+lOGaDHZDYbnrP2uGfCmDNVgSBrTZT4iI2
         m0Gg==
X-Gm-Message-State: AOJu0YxG49e/MPJ1GW3GRO7KQtdeIjnq6p0tO8lbK4KepnajQWeHaH5r
	GkKctw0SYGRgjHJsC0M963cyAFInf2DeRa6DEGJo+NZoJypnknEFgSbc/yD074n8a+g1OQNJR2B
	zV141Cw==
X-Google-Smtp-Source: AGHT+IFjMzWsmgpoKD47UCjvnfFv794+YDxXLQNcCuCgExxBvy0QxtFrFU6ExIRDVZTLIlyFyypR9AR8QDM=
X-Received: from pjbmd14.prod.google.com ([2002:a17:90b:23ce:b0:330:793a:2e77])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4cce:b0:32e:dd8c:dd18
 with SMTP id 98e67ed59e1d1-33bcf8f7617mr777557a91.17.1760635815980; Thu, 16
 Oct 2025 10:30:15 -0700 (PDT)
Date: Thu, 16 Oct 2025 10:28:45 -0700
In-Reply-To: <20251016172853.52451-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016172853.52451-5-seanjc@google.com>
Subject: [PATCH v13 04/12] KVM: guest_memfd: Add slab-allocated inode cache
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
X-CRM114-CacheID: sfid-20251016_103016_834570_9BA85CF1 
X-CRM114-Status: GOOD (  16.38  )
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

Add a dedicated gmem_inode structure and a slab-allocated inode cache for
guest memory backing, similar to how shmem handles inodes.

This adds the necessary allocation/destruction functions and prepares
for upcoming guest_memfd NUMA policy support changes.  Using a dedicated
structure will also allow for additional cleanups, e.g. to track flags in
gmem_inode instead of i_private.

Signed-off-by: Shivank Garg <shivankg@amd.com>
Tested-by: Ashish Kalra <ashish.kalra@amd.com>
[sean: s/kvm_gmem_inode_info/gmem_inode, name init_once()]
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Tested-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 77 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index ce04fc85e631..88fd812f0f31 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -26,6 +26,15 @@ struct gmem_file {
 	struct list_head entry;
 };
 
+struct gmem_inode {
+	struct inode vfs_inode;
+};
+
+static __always_inline struct gmem_inode *GMEM_I(struct inode *inode)
+{
+	return container_of(inode, struct gmem_inode, vfs_inode);
+}
+
 #define kvm_gmem_for_each_file(f, mapping) \
 	list_for_each_entry(f, &(mapping)->i_private_list, entry)
 
@@ -830,13 +839,61 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_populate);
 #endif
 
+static struct kmem_cache *kvm_gmem_inode_cachep;
+
+static void kvm_gmem_init_inode_once(void *__gi)
+{
+	struct gmem_inode *gi = __gi;
+
+	/*
+	 * Note!  Don't initialize the inode with anything specific to the
+	 * guest_memfd instance, or that might be specific to how the inode is
+	 * used (from the VFS-layer's perspective).  This hook is called only
+	 * during the initial slab allocation, i.e. only fields/state that are
+	 * idempotent across _all_ use of the inode _object_ can be initialized
+	 * at this time!
+	 */
+	inode_init_once(&gi->vfs_inode);
+}
+
+static struct inode *kvm_gmem_alloc_inode(struct super_block *sb)
+{
+	struct gmem_inode *gi;
+
+	gi = alloc_inode_sb(sb, kvm_gmem_inode_cachep, GFP_KERNEL);
+	if (!gi)
+		return NULL;
+
+	return &gi->vfs_inode;
+}
+
+static void kvm_gmem_destroy_inode(struct inode *inode)
+{
+}
+
+static void kvm_gmem_free_inode(struct inode *inode)
+{
+	kmem_cache_free(kvm_gmem_inode_cachep, GMEM_I(inode));
+}
+
+static const struct super_operations kvm_gmem_super_operations = {
+	.statfs		= simple_statfs,
+	.alloc_inode	= kvm_gmem_alloc_inode,
+	.destroy_inode	= kvm_gmem_destroy_inode,
+	.free_inode	= kvm_gmem_free_inode,
+};
+
 static int kvm_gmem_init_fs_context(struct fs_context *fc)
 {
+	struct pseudo_fs_context *ctx;
+
 	if (!init_pseudo(fc, GUEST_MEMFD_MAGIC))
 		return -ENOMEM;
 
 	fc->s_iflags |= SB_I_NOEXEC;
 	fc->s_iflags |= SB_I_NODEV;
+	ctx = fc->fs_private;
+	ctx->ops = &kvm_gmem_super_operations;
 
 	return 0;
 }
@@ -860,13 +917,31 @@ static int kvm_gmem_init_mount(void)
 
 int kvm_gmem_init(struct module *module)
 {
+	struct kmem_cache_args args = {
+		.align = 0,
+		.ctor = kvm_gmem_init_inode_once,
+	};
+	int ret;
+
 	kvm_gmem_fops.owner = module;
+	kvm_gmem_inode_cachep = kmem_cache_create("kvm_gmem_inode_cache",
+						  sizeof(struct gmem_inode),
+						  &args, SLAB_ACCOUNT);
+	if (!kvm_gmem_inode_cachep)
+		return -ENOMEM;
 
-	return kvm_gmem_init_mount();
+	ret = kvm_gmem_init_mount();
+	if (ret) {
+		kmem_cache_destroy(kvm_gmem_inode_cachep);
+		return ret;
+	}
+	return 0;
 }
 
 void kvm_gmem_exit(void)
 {
 	kern_unmount(kvm_gmem_mnt);
 	kvm_gmem_mnt = NULL;
+	rcu_barrier();
+	kmem_cache_destroy(kvm_gmem_inode_cachep);
 }
-- 
2.51.0.858.gf9c4a03a3a-goog


