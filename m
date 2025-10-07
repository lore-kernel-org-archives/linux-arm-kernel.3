Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1E4CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 22:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taWA6Z3KD+nH98ISDpDB0Js/qA9hrmRliA7l8Dl3Bbs=; b=fSbc+QZ1GslIxBkv4XsBtb8Zws
	09LwOfrgqoDJwYVy0L15pdYJFsHbjyKlrO/mvzO5XgfkNmI9N7wBhI11UFhkPv8QLzVSLoCXmJbmt
	vDiECr7/Gmg/dh/QJdaLICtW+1HNnlAUdRuvEE05OzCuYVl2rDoU0Q4hXhD5wkg1C2oPAaD1kSbAj
	WUNbJv9bJlxyQoaGF9bo2XkTVKnkz/xciDBEixufmD4ajITvtChvBrKcufMXLP/o/Vtq74Kw50jBM
	SuV7L9JR3RtXdnL89JR8VXBqrl3iZoZbd/1IjfPqJXBL3lpvGHJmUCqduBt60z+Ef+/dpx55W1GeU
	wPaguSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxH-00000002qWM-3Mfd;
	Tue, 07 Oct 2025 22:14:47 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxF-00000002qTs-2ZQN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 22:14:46 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-28e8112143fso31353325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 15:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759875284; x=1760480084; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=taWA6Z3KD+nH98ISDpDB0Js/qA9hrmRliA7l8Dl3Bbs=;
        b=OBWWiULe/9xaN+ZaCGlyznbwdkSo1RtTfzwBz8K/Apf+I/ITAyO3V34laH/S6/3hFi
         401bGtgqvQtl3Y09Oe06S/YGP/jhmETSW3oxqZy4LaTFM/fJ6aASWwlOd48ESwkM/3Iq
         awXwhRoxDSxN7dsBwJfyWkGFDCcQaSCdyLfDR7uRDEh6q93URjtNR/9bsJZOxDKgA3qa
         ZGVNHSahwxTHsNv76uBcvPcbvlaNrkcVorR0q9hnMI8liOGYq6h+KMw/vgQI3KWw5HnY
         ddWVnWKnN4pA01mP0yUuB18KL2xUF5jmNkxh9dlMcUiDpvirCDYevVFsiihed9pAtwWv
         J3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875284; x=1760480084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=taWA6Z3KD+nH98ISDpDB0Js/qA9hrmRliA7l8Dl3Bbs=;
        b=ry0MtVJAt3u8ayWBju5/KIsxGgPZDGmf34pXcwhMDLKOnmdL01xuXyYeMvDX5FM7vi
         yq7ifKM0cvssfcV1LUmR6CUI6kHxaGEY2MVZMmKuM/4yEPGvTvVyy5xTZz/zlGb4qyc0
         +MUOiG4XdUOrtkbJ5BWJD6cLFVWZSaVHhX+CKuQT8Ym5/osygfpmY8klEH2OLdM5AY8J
         GC51e238w0tC2cM5lxJITy3lW80qJn1Fl3+XuhJgNUpNs+oDg1B/GfEhd/iOj9WMAcTR
         MeCroU4dsUhlJikNPKB9QpRYfBRnd0yAunDZiJd+g/uiADiq4bdbcUY2W4s7SqSNhhAk
         B4uw==
X-Gm-Message-State: AOJu0YxWa9hP1N8o3/nzCdnrSzlynsGG5gc1WlPV3AiNc5FefUUxsu4H
	PxIv95hUUK7Bunp4X0NhLoV8J7aYe1oTtGaPr8qQMU7UFgZUZxbaU/QI4ePnOtJR9GYB7j9ty7d
	y3IJn5g==
X-Google-Smtp-Source: AGHT+IG9oleyJb8iura9cqY09UwB/z7uMhOzD+raOSeu/vbFWL+mfa3tRg9JWsWtb4qRWng07qdUpuou8jY=
X-Received: from pjbsx11.prod.google.com ([2002:a17:90b:2ccb:b0:32e:d644:b829])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38cc:b0:32e:f1c:e778
 with SMTP id 98e67ed59e1d1-33b51105f5dmr1325599a91.3.1759875284309; Tue, 07
 Oct 2025 15:14:44 -0700 (PDT)
Date: Tue,  7 Oct 2025 15:14:12 -0700
In-Reply-To: <20251007221420.344669-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251007221420.344669-5-seanjc@google.com>
Subject: [PATCH v12 04/12] KVM: guest_memfd: Add slab-allocated inode cache
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
X-CRM114-CacheID: sfid-20251007_151445_657357_653CA6BE 
X-CRM114-Status: GOOD (  16.93  )
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

Add a dedicated gmem_inode structure and a slab-allocateda inode cache for
guest memory backing, similar to how shmem handles inodes.

This adds the necessary allocation/destruction functions and prepares
for upcoming guest_memfd NUMA policy support changes.  Using a dedicated
structure will also allow for additional cleanups, e.g. to track flags in
gmem_inode instead of i_private.

Signed-off-by: Shivank Garg <shivankg@amd.com>
Tested-by: Ashish Kalra <ashish.kalra@amd.com>
[sean: s/kvm_gmem_inode_info/gmem_inode, name init_once()]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 77 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 2a580b2bdc9d..cc3b25155726 100644
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
 
@@ -833,13 +842,61 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
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
@@ -863,13 +920,31 @@ static int kvm_gmem_init_mount(void)
 
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
2.51.0.710.ga91ca5db03-goog


