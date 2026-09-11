Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9B8C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIQRpDFpvkA6v5lh/5UPtLNtecnKXIQ2k9kxGqhZIEM=; b=wjY/dU1hs835XtvOAx4R5UKVO1
	SZrmBSBons+nectZBbwp1Z9a5S9IgwT2cAaKR9accaFVTBKmsqKu+nryXK8bHVhmCSMwF3xZyR55e
	cxiR1hEnSiTWB6PChydfAo1jyvxxmaSl0DDNyCtLIsnFXuhuIJH0i7nz7Zw4auZ4GlAeqVnqeCS0c
	LJ5sGdFp2RzJqfpUjdN46mZoGyc47L2EAAA1oVFwYC6X6UobjP9QXCwzJ7QX91m8oG22GMIUo9992
	krC58DpSxk8IMGRIBxt7aDnnqW71bpiGWaBQ9UqOw9RIMQ1lraLIn8gnDo9+sbQRPY/sxSdOHvePp
	0NOnyuKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OY-0000000H6L3-2hDk;
	Fri, 11 Sep 2026 15:42:30 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53O9-0000000H60s-311G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:42:06 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 006d021491bc7-6b1ae6c9b72so252009eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141325; x=1789746125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rIQRpDFpvkA6v5lh/5UPtLNtecnKXIQ2k9kxGqhZIEM=;
        b=AfEvzrXj3QH1aP6VKSyctK6EEXEO1Pi98+ukkxYNdRJCbrspnphkDpywvrKI62Yvrd
         cP2C7a+nwqH0xbF0lwHijToTIyFLhR1kIlzj7bgcpnLtL6yH3jiOL/TXP3hosZ86U2Wy
         s7S6XRnKLO/MyO3wkN2avs03FQSCLwJz4tPl7AvPDUTgbfcNHPNFAtMr1ZBrNlD3MCbg
         Fo4RcXSmrpN4ZZb67oPShodr/ym05YxQJpggKo27d/6yPIrjOk8IJuOBLFT81AXTwW9U
         gpacz7Iobi/3SYYiK5pV36GnEAQvu9ftkjcsHc/SbOHMEYUZbwGGNSFg3NODzowgSp7i
         74OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141325; x=1789746125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rIQRpDFpvkA6v5lh/5UPtLNtecnKXIQ2k9kxGqhZIEM=;
        b=jb0R1Fy7gqcmaiUAtzakPpXvdi43/1QRDFn0NbWLbwRAqITAUb5MIl1t9+liIMS8Pi
         9hDL3RTlWFwBePkQaVBW+bGdY0xtJTbmcwBPLa4rgRHgqEOWOZVZ1Tg/xd+8+6QCw9ae
         EEdcbMwD6UAmreqSl8HFBscLEjJJgh4dqvNGdQ1uSgkW10ma6DvQlep+yDi5M6IquCrm
         acgMMeSdisCFqM9GmaQoYt8PN083U2Fk5MILI5SB06GYnvukGC5feo2CgqhPgnucMdhm
         HDa5Ad7RUDbQxH+bTfgVXjG/IrrFvkn/UTF+K1sOVa6tnEDq+E64OGWkU+DeJE/EpATx
         2gYw==
X-Gm-Message-State: AFuF++kvyd/Dw0uXkmlBuzDy9U3xaHF9TlBptsgXDd2i5xf00lDyfkri
	f3pjL3/wlKSdiE1gB4vJmfG3QTAnkvarw8jYoiszTLgIWxw6sZsze9cHuFJRF5fogEqvrQ+7pLi
	ilzu0NxU=
X-Gm-Gg: AYBFou1bruNc4YgqR/m/DIqy+Qx1naTwBbRROJjcfsnlZ4+YpooF9MpQoU+RljSCwV4
	GgU30kLRR6GLoS4dQKsik9JqyrC5En9otsPVNIg0Fv7iVnAXT9vjibwBY5YGbXWv4yTyV5KUtJS
	OYsOi6iomuekkw9RkSJrCvJNPxBO8gl1vkcia//Z2OJYO4Bz7ZtJyxPdilt980kgiNqK7R3Kyli
	mOta7iLu+tzoySAmnsvKJWUpVwFrYGVCKrolG8pDuQGaMH6yivX/xYx3mPYKIEGOVxswVPZgIPt
	oSwNhqP6erNeZuEsfIRBvumpNbSCKV4M0C0OGHVgIhOR+S9eC/YVGCrnT+NchYnZhl6eDtwJBAn
	4xTpo02QX5xtYEC3FEn08dato/Og1/jmrRhvRZvO/pbfOvK8ZhPtGVf30XAwAjmZXAbSpFRvLX1
	erZkTMJ/Ek0hkVrB4NsLWFKzD+coMTlbtNcn8R6a4KuFBcyg9z4TxtgA6Pq4GM+wsiApu8xwhHK
	/kOh/BHHZR/QaQtK1ufMvXBv71EM6BUxfqPpkLNmjQ=
X-Received: by 2002:a05:6820:190a:b0:6b5:ec3f:4985 with SMTP id 006d021491bc7-6c0a99f860cmr2369093eaf.32.1789141324900;
        Fri, 11 Sep 2026 08:42:04 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:42:04 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 07/15] io_uring: add uring_lock section depth tracking and blockable opdef flag
Date: Fri, 11 Sep 2026 09:40:57 -0600
Message-ID: <20260911154148.644489-8-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084205_784390_89F436D9 
X-CRM114-Status: GOOD (  17.90  )
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

Prep patch for issuing requests inline in blocking mode and catching the
sleep when it happens, rather than punting to io-wq upfront because an
operation may block.

If a request blocks inline, uring_lock must be dropped on behalf of the
sleeping task, which is only safe outside the sections that rely on the
lock being held. Track those with a depth counter in
io_ring_submit_lock() and io_ring_submit_unlock().

Add a "blockable" flag to io_issue_def for opcodes whose issue path can
cope with blocking inline: read/write, the forced async fs ops, open,
close and splice/tee. uring_cmd is excluded for now, drivers may bind
state to the submitting task.

No functional changes in this patch.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring_types.h |  5 +++++
 io_uring/io_uring.h            |  3 +++
 io_uring/opdef.c               | 29 +++++++++++++++++++++++++++++
 io_uring/opdef.h               |  2 ++
 4 files changed, 39 insertions(+)

diff --git a/include/linux/io_uring_types.h b/include/linux/io_uring_types.h
index 4af3d579ead6..50a4a0ad222f 100644
--- a/include/linux/io_uring_types.h
+++ b/include/linux/io_uring_types.h
@@ -352,6 +352,11 @@ struct io_ring_ctx {
 	/* submission data */
 	struct {
 		struct mutex		uring_lock;
+		/*
+		 * io_ring_submit_lock() nesting depth, non-zero means the
+		 * issue path relies on the lock being held.
+		 */
+		unsigned int		submit_lock_depth;
 
 		/*
 		 * Ring buffer of indices into array of io_uring_sqe, which is
diff --git a/io_uring/io_uring.h b/io_uring/io_uring.h
index 896aab1ed026..870bb4dcc415 100644
--- a/io_uring/io_uring.h
+++ b/io_uring/io_uring.h
@@ -393,6 +393,8 @@ static inline void io_ring_submit_unlock(struct io_ring_ctx *ctx,
 					 unsigned issue_flags)
 {
 	lockdep_assert_held(&ctx->uring_lock);
+	lockdep_assert(ctx->submit_lock_depth > 0);
+	ctx->submit_lock_depth--;
 	if (unlikely(issue_flags & IO_URING_F_UNLOCKED))
 		mutex_unlock(&ctx->uring_lock);
 }
@@ -409,6 +411,7 @@ static inline void io_ring_submit_lock(struct io_ring_ctx *ctx,
 	if (unlikely(issue_flags & IO_URING_F_UNLOCKED))
 		mutex_lock(&ctx->uring_lock);
 	lockdep_assert_held(&ctx->uring_lock);
+	ctx->submit_lock_depth++;
 }
 
 static inline void io_commit_cqring(struct io_ring_ctx *ctx)
diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index cf3aa2242cd7..fa07a2b94536 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -69,6 +69,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.iopoll			= 1,
 		.vectored		= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_readv,
 		.issue			= io_read,
 	},
@@ -83,12 +84,14 @@ const struct io_issue_def io_issue_defs[] = {
 		.iopoll			= 1,
 		.vectored		= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_writev,
 		.issue			= io_write,
 	},
 	[IORING_OP_FSYNC] = {
 		.needs_file		= 1,
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_fsync_prep,
 		.issue			= io_fsync,
 	},
@@ -101,6 +104,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.ioprio			= 1,
 		.iopoll			= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_read_fixed,
 		.issue			= io_read_fixed,
 	},
@@ -114,6 +118,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.ioprio			= 1,
 		.iopoll			= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_write_fixed,
 		.issue			= io_write_fixed,
 	},
@@ -132,6 +137,7 @@ const struct io_issue_def io_issue_defs[] = {
 	[IORING_OP_SYNC_FILE_RANGE] = {
 		.needs_file		= 1,
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_sfr_prep,
 		.issue			= io_sync_file_range,
 	},
@@ -215,16 +221,19 @@ const struct io_issue_def io_issue_defs[] = {
 	[IORING_OP_FALLOCATE] = {
 		.needs_file		= 1,
 		.hash_reg_file          = 1,
+		.blockable		= 1,
 		.prep			= io_fallocate_prep,
 		.issue			= io_fallocate,
 	},
 	[IORING_OP_OPENAT] = {
 		.filter_pdu_size	= sizeof_field(struct io_uring_bpf_ctx, open),
+		.blockable		= 1,
 		.prep			= io_openat_prep,
 		.issue			= io_openat,
 		.filter_populate	= io_openat_bpf_populate,
 	},
 	[IORING_OP_CLOSE] = {
+		.blockable		= 1,
 		.prep			= io_close_prep,
 		.issue			= io_close,
 	},
@@ -236,6 +245,7 @@ const struct io_issue_def io_issue_defs[] = {
 	},
 	[IORING_OP_STATX] = {
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_statx_prep,
 		.issue			= io_statx,
 	},
@@ -249,6 +259,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.ioprio			= 1,
 		.iopoll			= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_read,
 		.issue			= io_read,
 	},
@@ -262,17 +273,20 @@ const struct io_issue_def io_issue_defs[] = {
 		.ioprio			= 1,
 		.iopoll			= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_write,
 		.issue			= io_write,
 	},
 	[IORING_OP_FADVISE] = {
 		.needs_file		= 1,
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_fadvise_prep,
 		.issue			= io_fadvise,
 	},
 	[IORING_OP_MADVISE] = {
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_madvise_prep,
 		.issue			= io_madvise,
 	},
@@ -308,6 +322,7 @@ const struct io_issue_def io_issue_defs[] = {
 	},
 	[IORING_OP_OPENAT2] = {
 		.filter_pdu_size	= sizeof_field(struct io_uring_bpf_ctx, open),
+		.blockable		= 1,
 		.prep			= io_openat2_prep,
 		.issue			= io_openat2,
 		.filter_populate	= io_openat_bpf_populate,
@@ -327,6 +342,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.hash_reg_file		= 1,
 		.unbound_nonreg_file	= 1,
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_splice_prep,
 		.issue			= io_splice,
 	},
@@ -347,6 +363,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.hash_reg_file		= 1,
 		.unbound_nonreg_file	= 1,
 		.audit_skip		= 1,
+		.blockable		= 1,
 		.prep			= io_tee_prep,
 		.issue			= io_tee,
 	},
@@ -360,22 +377,27 @@ const struct io_issue_def io_issue_defs[] = {
 #endif
 	},
 	[IORING_OP_RENAMEAT] = {
+		.blockable		= 1,
 		.prep			= io_renameat_prep,
 		.issue			= io_renameat,
 	},
 	[IORING_OP_UNLINKAT] = {
+		.blockable		= 1,
 		.prep			= io_unlinkat_prep,
 		.issue			= io_unlinkat,
 	},
 	[IORING_OP_MKDIRAT] = {
+		.blockable		= 1,
 		.prep			= io_mkdirat_prep,
 		.issue			= io_mkdirat,
 	},
 	[IORING_OP_SYMLINKAT] = {
+		.blockable		= 1,
 		.prep			= io_symlinkat_prep,
 		.issue			= io_symlinkat,
 	},
 	[IORING_OP_LINKAT] = {
+		.blockable		= 1,
 		.prep			= io_linkat_prep,
 		.issue			= io_linkat,
 	},
@@ -387,19 +409,23 @@ const struct io_issue_def io_issue_defs[] = {
 	},
 	[IORING_OP_FSETXATTR] = {
 		.needs_file = 1,
+		.blockable		= 1,
 		.prep			= io_fsetxattr_prep,
 		.issue			= io_fsetxattr,
 	},
 	[IORING_OP_SETXATTR] = {
+		.blockable		= 1,
 		.prep			= io_setxattr_prep,
 		.issue			= io_setxattr,
 	},
 	[IORING_OP_FGETXATTR] = {
 		.needs_file = 1,
+		.blockable		= 1,
 		.prep			= io_fgetxattr_prep,
 		.issue			= io_fgetxattr,
 	},
 	[IORING_OP_GETXATTR] = {
+		.blockable		= 1,
 		.prep			= io_getxattr_prep,
 		.issue			= io_getxattr,
 	},
@@ -497,6 +523,7 @@ const struct io_issue_def io_issue_defs[] = {
 	[IORING_OP_FTRUNCATE] = {
 		.needs_file		= 1,
 		.hash_reg_file		= 1,
+		.blockable		= 1,
 		.prep			= io_ftruncate_prep,
 		.issue			= io_ftruncate,
 	},
@@ -553,6 +580,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.iopoll			= 1,
 		.vectored		= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_readv_fixed,
 		.issue			= io_read,
 	},
@@ -567,6 +595,7 @@ const struct io_issue_def io_issue_defs[] = {
 		.iopoll			= 1,
 		.vectored		= 1,
 		.async_size		= sizeof(struct io_async_rw),
+		.blockable		= 1,
 		.prep			= io_prep_writev_fixed,
 		.issue			= io_write,
 	},
diff --git a/io_uring/opdef.h b/io_uring/opdef.h
index 667f981e63b0..45c2f77cf782 100644
--- a/io_uring/opdef.h
+++ b/io_uring/opdef.h
@@ -29,6 +29,8 @@ struct io_issue_def {
 	unsigned		vectored : 1;
 	/* set to 1 if this opcode uses 128b sqes in a mixed sq */
 	unsigned		is_128 : 1;
+	/* issue path is safe to run inline in blocking mode */
+	unsigned		blockable : 1;
 
 	/* size of async data needed, if any */
 	unsigned short		async_size;
-- 
2.55.0


