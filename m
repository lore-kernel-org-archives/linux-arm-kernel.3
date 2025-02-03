Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B31C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 10:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjrjF09VQnxDeNYh4e1Ha75V6UufRCaFP71EexFz7fY=; b=KqtbKC4JcNQY+dH0QQ0cFOEyQq
	ibI+cn4HhXYRzN/Wb9XqcXpaoBH4cpcwITaTt0D8EG/RIusnGAKRdp0O1Akx1+ZpUQsPdN7Fxw4qU
	keRPABoAgwzFaUr57voG5lT3mndHdbaDSNVoMDrDlZYu6S0XRwLtpdxZ3/3vQe3wHMZRj4HcslvZE
	D3ZQbme/5di/DtJ27xVA132pGCilJ8AN6xhf65qPrTZvA2fafFiyqld/T0UHqvhhhWlpUu8twxkug
	BHUqFUkfDau1CCjzFPaHifIF01eMCFk+SPtcm4U+t+s/8hnNTKieHx8FQ+XYjFMR6OivPkzrU/9of
	548orzVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teu7V-0000000FAbk-1JSJ;
	Mon, 03 Feb 2025 10:56:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tethI-0000000F7Ts-11KZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:28:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 480031BC0;
	Mon,  3 Feb 2025 02:29:20 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 196943F63F;
	Mon,  3 Feb 2025 02:28:51 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Howells <dhowells@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH 7/8] fs: Protect creds installed by override_creds()
Date: Mon,  3 Feb 2025 10:28:08 +0000
Message-ID: <20250203102809.1223255-8-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250203102809.1223255-1-kevin.brodsky@arm.com>
References: <20250203102809.1223255-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_022856_368952_519639DC 
X-CRM114-Status: GOOD (  18.59  )
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

The kpkeys_hardened_cred feature, when enabled, automatically
protects credentials installed by commit_creds(). However, because
override_creds() does not consume its argument, it is up to its
callers to protect the credentials before calling override_creds().
This is done by calling protect_creds(), moving the credentials to a
protected memory location.

In some cases, the credentials returned by prepare_creds() are
passed to override_creds() as-is. In such situation where write
access to the credentials is not needed, prepare_protected_creds()
is used to avoid the copy incurred by a separate call to
protect_creds().

This patch covers the main users of override_creds(), but it is not
comprehensive.

This patch is a no-op if kpkeys_hardened_cred isn't enabled.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 fs/aio.c              | 2 +-
 fs/fuse/passthrough.c | 2 +-
 fs/nfs/nfs4idmap.c    | 2 +-
 fs/nfsd/auth.c        | 2 +-
 fs/nfsd/nfs4recover.c | 2 +-
 fs/nfsd/nfsfh.c       | 2 +-
 fs/open.c             | 2 +-
 fs/overlayfs/dir.c    | 2 +-
 fs/overlayfs/super.c  | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/aio.c b/fs/aio.c
index 7b976b564cfc..ab9f4c8d778a 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -1657,7 +1657,7 @@ static int aio_fsync(struct fsync_iocb *req, const struct iocb *iocb,
 	if (unlikely(!req->file->f_op->fsync))
 		return -EINVAL;
 
-	req->creds = prepare_creds();
+	req->creds = prepare_protected_creds();
 	if (!req->creds)
 		return -ENOMEM;
 
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index 607ef735ad4a..4451651b1e51 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -248,7 +248,7 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
 		goto out_fput;
 
 	fb->file = file;
-	fb->cred = prepare_creds();
+	fb->cred = prepare_protected_creds();
 	refcount_set(&fb->count, 1);
 
 	res = fuse_backing_id_alloc(fc, fb);
diff --git a/fs/nfs/nfs4idmap.c b/fs/nfs/nfs4idmap.c
index 25a7c771cfd8..6ff25dd5c2fb 100644
--- a/fs/nfs/nfs4idmap.c
+++ b/fs/nfs/nfs4idmap.c
@@ -228,7 +228,7 @@ int nfs_idmap_init(void)
 	set_bit(KEY_FLAG_ROOT_CAN_CLEAR, &keyring->flags);
 	cred->thread_keyring = keyring;
 	cred->jit_keyring = KEY_REQKEY_DEFL_THREAD_KEYRING;
-	id_resolver_cache = cred;
+	id_resolver_cache = protect_creds(cred);
 	return 0;
 
 failed_reg_legacy:
diff --git a/fs/nfsd/auth.c b/fs/nfsd/auth.c
index 4dc327e02456..09b377a97147 100644
--- a/fs/nfsd/auth.c
+++ b/fs/nfsd/auth.c
@@ -79,7 +79,7 @@ int nfsd_setuser(struct svc_cred *cred, struct svc_export *exp)
 	else
 		new->cap_effective = cap_raise_nfsd_set(new->cap_effective,
 							new->cap_permitted);
-	put_cred(override_creds(new));
+	put_cred(override_creds(protect_creds(new)));
 	return 0;
 
 oom:
diff --git a/fs/nfsd/nfs4recover.c b/fs/nfsd/nfs4recover.c
index 28f4d5311c40..095664648103 100644
--- a/fs/nfsd/nfs4recover.c
+++ b/fs/nfsd/nfs4recover.c
@@ -81,7 +81,7 @@ nfs4_save_creds(const struct cred **original_creds)
 
 	new->fsuid = GLOBAL_ROOT_UID;
 	new->fsgid = GLOBAL_ROOT_GID;
-	*original_creds = override_creds(new);
+	*original_creds = override_creds(protect_creds(new));
 	return 0;
 }
 
diff --git a/fs/nfsd/nfsfh.c b/fs/nfsd/nfsfh.c
index 32019751a41e..d64d23e9357e 100644
--- a/fs/nfsd/nfsfh.c
+++ b/fs/nfsd/nfsfh.c
@@ -221,7 +221,7 @@ static __be32 nfsd_set_fh_dentry(struct svc_rqst *rqstp, struct net *net,
 		new->cap_effective =
 			cap_raise_nfsd_set(new->cap_effective,
 					   new->cap_permitted);
-		put_cred(override_creds(new));
+		put_cred(override_creds(protect_creds(new)));
 	} else {
 		error = nfsd_setuser_and_check_port(rqstp, cred, exp);
 		if (error)
diff --git a/fs/open.c b/fs/open.c
index 932e5a6de63b..3b5331b7c0f0 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -457,7 +457,7 @@ static const struct cred *access_override_creds(void)
 	 * freeing.
 	 */
 	override_cred->non_rcu = 1;
-	return override_creds(override_cred);
+	return override_creds(protect_creds(override_cred));
 }
 
 static long do_faccessat(int dfd, const char __user *filename, int mode, int flags)
diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
index c9993ff66fc2..943ec4300ddb 100644
--- a/fs/overlayfs/dir.c
+++ b/fs/overlayfs/dir.c
@@ -580,7 +580,7 @@ static const struct cred *ovl_setup_cred_for_create(struct dentry *dentry,
 	 * We must be called with creator creds already, otherwise we risk
 	 * leaking creds.
 	 */
-	old_cred = override_creds(override_cred);
+	old_cred = override_creds(protect_creds(override_cred));
 	WARN_ON_ONCE(old_cred != ovl_creds(dentry->d_sb));
 
 	return override_cred;
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 86ae6f6da36b..3489a62c5d8a 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -1318,7 +1318,7 @@ int ovl_fill_super(struct super_block *sb, struct fs_context *fc)
 	sb->s_d_op = &ovl_dentry_operations;
 
 	err = -ENOMEM;
-	ofs->creator_cred = cred = prepare_creds();
+	ofs->creator_cred = cred = prepare_protected_creds();
 	if (!cred)
 		goto out_err;
 
-- 
2.47.0


