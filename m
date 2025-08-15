Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2302ECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 11:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwixIVgggwhQLCQw4oWGwiHErSAAejOEdd8GmzOgHbA=; b=1fxvvxdpA9vwdkPbZpImZB9eRH
	/l8FyUFmMLo6tqkexKjTl1s134EnOSpAT/ma0lYZW1u8h9069cyXqrkHlQcYa0oHv7qZ63XP/g/Z2
	CRMHPoy6+zKlKCfb8hIiK2h2kCESQa9ZaC/wJHPgtqHUo6pxDQZU5+MgLB2tHY0M1IrYQpvU1JP+F
	BWt3D0DR+YWHLQVpGvPa/SU81T2iYJEpxdA0gO4uC3LSJ9rvwWRT5tS64T8UFxrcpN8Lw5nV3ikF7
	pAEM8QYaa61GrLbeGeQwk18r2H3d3yEhpG3GdMWSeg4tFqTYMEtXQxtJV9h5A4Uyf267sqty6TlE8
	A19X/rhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsXN-00000002KMI-2IYx;
	Fri, 15 Aug 2025 11:23:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqIj-00000001xwI-0MS0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:00:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8898D2C46;
	Fri, 15 Aug 2025 02:00:32 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FCD33F63F;
	Fri, 15 Aug 2025 02:00:36 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Howells <dhowells@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH v2 7/8] fs: Protect creds installed by override_creds()
Date: Fri, 15 Aug 2025 09:59:59 +0100
Message-ID: <20250815090000.2182450-8-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250815090000.2182450-1-kevin.brodsky@arm.com>
References: <20250815090000.2182450-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020041_218764_FDA283BF 
X-CRM114-Status: GOOD (  19.99  )
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
 fs/overlayfs/dir.c    | 1 +
 fs/overlayfs/super.c  | 2 +-
 9 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/aio.c b/fs/aio.c
index 7fc7b6221312..7529399bb71d 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -1658,7 +1658,7 @@ static int aio_fsync(struct fsync_iocb *req, const struct iocb *iocb,
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
index 00932500fce4..6eef34b02513 100644
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
index 2231192ec33f..63ffa7936246 100644
--- a/fs/nfsd/nfs4recover.c
+++ b/fs/nfsd/nfs4recover.c
@@ -82,7 +82,7 @@ nfs4_save_creds(const struct cred **original_creds)
 
 	new->fsuid = GLOBAL_ROOT_UID;
 	new->fsgid = GLOBAL_ROOT_GID;
-	*original_creds = override_creds(new);
+	*original_creds = override_creds(protect_creds(new));
 	return 0;
 }
 
diff --git a/fs/nfsd/nfsfh.c b/fs/nfsd/nfsfh.c
index 74cf1f4de174..887ee5adb2dc 100644
--- a/fs/nfsd/nfsfh.c
+++ b/fs/nfsd/nfsfh.c
@@ -223,7 +223,7 @@ static __be32 nfsd_set_fh_dentry(struct svc_rqst *rqstp, struct net *net,
 		new->cap_effective =
 			cap_raise_nfsd_set(new->cap_effective,
 					   new->cap_permitted);
-		put_cred(override_creds(new));
+		put_cred(override_creds(protect_creds(new)));
 	} else {
 		error = nfsd_setuser_and_check_port(rqstp, cred, exp);
 		if (error)
diff --git a/fs/open.c b/fs/open.c
index 9655158c3885..351ac9e86a15 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -461,7 +461,7 @@ static const struct cred *access_override_creds(void)
 	 * freeing.
 	 */
 	override_cred->non_rcu = 1;
-	return override_creds(override_cred);
+	return override_creds(protect_creds(override_cred));
 }
 
 static int do_faccessat(int dfd, const char __user *filename, int mode, int flags)
diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
index 70b8687dc45e..7e7d4f26198d 100644
--- a/fs/overlayfs/dir.c
+++ b/fs/overlayfs/dir.c
@@ -575,6 +575,7 @@ static const struct cred *ovl_setup_cred_for_create(struct dentry *dentry,
 	 * We must be called with creator creds already, otherwise we risk
 	 * leaking creds.
 	 */
+	override_cred = protect_creds(override_cred);
 	old_cred = override_creds(override_cred);
 	WARN_ON_ONCE(old_cred != ovl_creds(dentry->d_sb));
 
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index df85a76597e9..0a45760ff7ae 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -1326,7 +1326,7 @@ int ovl_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	err = -ENOMEM;
 	if (!ofs->creator_cred)
-		ofs->creator_cred = cred = prepare_creds();
+		ofs->creator_cred = cred = prepare_protected_creds();
 	else
 		cred = (struct cred *)ofs->creator_cred;
 	if (!cred)
-- 
2.47.0


