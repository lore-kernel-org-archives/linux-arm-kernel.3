Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BACCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+FC88lAOdKXh3VCPeIVeUsYuG4OuiQSHmuwOGzFRZ8=; b=wW0xwP2PKqSEpFWuWf7dnAKijl
	BkxzZE3518lkNYOR3Eb2Ndr2R5nQ5qhrn5J/jupKIZXhjGSYRQ6VuCClWPdGoT/De61w4Ph/LjSCg
	WbjTKxre7wKiXkMBEk7jSSs199VOT46G+vmf4YcELyZXIbppYm6xzJ9fo2PO4ozGqK1eWVvuk4s2Q
	SxaqXzAFqMMwFpoxK7rFLwjQQ1kR3tCJZHhHHmNSbRaXZkxTU4H8UaCQdf/NKAPrqi6krnHql/BP7
	jbrwseTHN7NKvAR8JlNdpPgAp56+5CVCd71dQbcOHj/FKxJF7Z+42XuJgehcIPuH1Q7FnqzyoxQhT
	/sI91iKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhhI-00000003MPz-1KZj;
	Thu, 11 Sep 2025 13:50:49 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhhD-00000003MJ2-0jH0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:50:44 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e9baa0310cbso704131276.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757598642; x=1758203442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+FC88lAOdKXh3VCPeIVeUsYuG4OuiQSHmuwOGzFRZ8=;
        b=z3L3K7qrqeiPf/ZUjg8EGGZFAVf78WGAYHLCWIYMOiDTMbAWrx7l+5z7dJY+baOoGc
         wUAn4ssA8fv06A1zwzzrljlcIuWPezuHX51sfWE7X1C41wKEGwMaFa5uk+2ctUcmHKff
         a5tB1T2y2ViD0OHDI2T1lJtubDsD4BakgXWqccSzvbCDq06aKOcb/gka2sW4CnuSSoL5
         O34GaL9bMe5GoWeVCWah45hijLrg/h7AAFhGWBAUuW3XHrzLOKB5V0aTnvxkucEktgZ5
         6h3lGBeLTZBYoDb1E1iWVlg67YQ4k7hHMXSJSEcQ2nasjsw4GexccSaJaSbpoXPzJaDU
         T3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598642; x=1758203442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+FC88lAOdKXh3VCPeIVeUsYuG4OuiQSHmuwOGzFRZ8=;
        b=cHmDTEFmBMtUWvvHoTcLUdzECCo3XAS/ZFhkPkCHAVcgfbsw397xZQ4r9h4ENwedMa
         sk2kNbPJOXPub8WiZA2rHZXD/f1HKC9yYZew/Avt5KNgOgKy3LtVktZZIdSmTho2k5E2
         7BBkJpJoLZ8EhAE2DUJuYnv7bxOudB2g8lbvAbcnjYNJgXplCWDbsnb7m8BjWFjCN3xm
         I4BctH+zzBZJGlOiysUEQIRX8j67Ifk0ThJN6JqcFn/KdrgkaaxpA2uiwPx0jue/A+P6
         cgeo06tdjE4cDb9MgbzMYuGWgccnultd8CsmJsWtY4meuJghFLi6bNswjOFX2FyZGl0L
         v0+w==
X-Forwarded-Encrypted: i=1; AJvYcCWbvwh7VRZ5Izl1q37SIluIibKrLWgMnG2xJ7vAwAtuR3olTOWbR5uk5yMrVBC+/HDk9io6HsX28kltU9BEcgag@lists.infradead.org
X-Gm-Message-State: AOJu0YyrkgRjalDf40bLxGAVKYT4JiZu/e+rQphHGamyYIExALJY5lhn
	Vj8nunwzzSlb7UZP0737ZE+X6CIijVkFUntpDBYfgrU4qopHKiN20xNpv3z4on76tMs=
X-Gm-Gg: ASbGncsXLQ6m53vQUMSE6lxLddyJ4ozQ8U27m/Cn+3mFJlAiGeQZwqp7SucLYyoICsK
	9iLpGn4gdzwyGjUWxWD7Fy8DVgtPu8bistnoY+BwlkLLmwjqE0NUtcPtlNDEUxjdJAmaJnlCbRB
	7f8S/gxcWUYXsnNDXtWw3PWPa/VHZeZeYgVEre6HJhCiPHHCrHreQef1Nfb8KiyNwbije5VTpsX
	oYvTkOB/uCIthOzNjCYQBfQVga1SeqjCCE18R/XFXuMdaMPBEbKkyd9QYppItz9BdXRFH1OCucf
	dLrFZcFG7MC6dcCDzuf824BNSW7c+KMigarcEiISRRZy86oqGEajS/G2XbWt/fNUIqWIMnyjL+c
	XUfOf+iiOC8RLco5Vf0dVbREXMgD4IEZnkuX89+8AbihmupAPteEK7XxYnfTxD2g8TKv+Dn63Jt
	uwGuAiDIFTYA==
X-Google-Smtp-Source: AGHT+IF7IsUABirUCx7wBc5wUFCsq52tfHeM1YIL+ogUEqr6eMKV7g8gEl6JNjmzrrCvHvRLkXGvgw==
X-Received: by 2002:a05:690e:1587:20b0:5f3:316d:1cea with SMTP id 956f58d0204a3-610232fb2d5mr13516020d50.9.1757598641533;
        Thu, 11 Sep 2025 06:50:41 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f7623434csm3526257b3.11.2025.09.11.06.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:50:40 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	robin.murphy@arm.com,
	Etienne Carriere <etienne.carriere@foss.st.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v12 5/9] tee: new ioctl to a register tee_shm from a dmabuf file descriptor
Date: Thu, 11 Sep 2025 15:49:46 +0200
Message-ID: <20250911135007.1275833-6-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911135007.1275833-1-jens.wiklander@linaro.org>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_065043_266280_2DB94133 
X-CRM114-Status: GOOD (  37.49  )
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

From: Etienne Carriere <etienne.carriere@foss.st.com>

Add a userspace API to create a tee_shm object that refers to a dmabuf
reference.

Userspace registers the dmabuf file descriptor as in a tee_shm object.
The registration is completed with a tee_shm returned file descriptor.

Userspace is free to close the dmabuf file descriptor after it has been
registered since all the resources are now held via the new tee_shm
object.

Closing the tee_shm file descriptor will eventually release all
resources used by the tee_shm object when all references are released.

The new IOCTL, TEE_IOC_SHM_REGISTER_FD, supports dmabuf references to
physically contiguous memory buffers. Dmabuf references acquired from
the TEE DMA-heap can be used as protected memory for Secure Video Path
and such use cases. It depends on the TEE and the TEE driver if dmabuf
references acquired by other means can be used.

A new tee_shm flag is added to identify tee_shm objects built from a
registered dmabuf, TEE_SHM_DMA_BUF.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c    | 62 +++++++++++++++++++++++++++++++-
 drivers/tee/tee_private.h |  8 +++++
 drivers/tee/tee_shm.c     | 74 +++++++++++++++++++++++++++++++++++++--
 include/linux/tee_core.h  |  1 +
 include/linux/tee_drv.h   | 10 ++++++
 include/uapi/linux/tee.h  | 31 ++++++++++++++++
 6 files changed, 182 insertions(+), 4 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 4996f194cd9e..cea4da3ea46f 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -354,11 +354,49 @@ tee_ioctl_shm_register(struct tee_context *ctx,
 	return ret;
 }
 
+static int
+tee_ioctl_shm_register_fd(struct tee_context *ctx,
+			  struct tee_ioctl_shm_register_fd_data __user *udata)
+{
+	struct tee_ioctl_shm_register_fd_data data;
+	struct tee_shm *shm;
+	long ret;
+
+	if (copy_from_user(&data, udata, sizeof(data)))
+		return -EFAULT;
+
+	/* Currently no input flags are supported */
+	if (data.flags)
+		return -EINVAL;
+
+	shm = tee_shm_register_fd(ctx, data.fd);
+	if (IS_ERR(shm))
+		return -EINVAL;
+
+	data.id = shm->id;
+	data.flags = shm->flags;
+	data.size = shm->size;
+
+	if (copy_to_user(udata, &data, sizeof(data)))
+		ret = -EFAULT;
+	else
+		ret = tee_shm_get_fd(shm);
+
+	/*
+	 * When user space closes the file descriptor the shared memory
+	 * should be freed or if tee_shm_get_fd() failed then it will
+	 * be freed immediately.
+	 */
+	tee_shm_put(shm);
+	return ret;
+}
+
 static int param_from_user_memref(struct tee_context *ctx,
 				  struct tee_param_memref *memref,
 				  struct tee_ioctl_param *ip)
 {
 	struct tee_shm *shm;
+	size_t offs = 0;
 
 	/*
 	 * If a NULL pointer is passed to a TA in the TEE,
@@ -389,6 +427,26 @@ static int param_from_user_memref(struct tee_context *ctx,
 			tee_shm_put(shm);
 			return -EINVAL;
 		}
+
+		if (shm->flags & TEE_SHM_DMA_BUF) {
+			struct tee_shm_dmabuf_ref *ref;
+
+			ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
+			if (ref->parent_shm) {
+				/*
+				 * The shm already has one reference to
+				 * ref->parent_shm so we are clear of 0.
+				 * We're getting another reference since
+				 * this shm will be used in the parameter
+				 * list instead of the shm we got with
+				 * tee_shm_get_from_id() above.
+				 */
+				refcount_inc(&ref->parent_shm->refcount);
+				tee_shm_put(shm);
+				shm = ref->parent_shm;
+				offs = ref->offset;
+			}
+		}
 	} else if (ctx->cap_memref_null) {
 		/* Pass NULL pointer to OP-TEE */
 		shm = NULL;
@@ -396,7 +454,7 @@ static int param_from_user_memref(struct tee_context *ctx,
 		return -EINVAL;
 	}
 
-	memref->shm_offs = ip->a;
+	memref->shm_offs = ip->a + offs;
 	memref->size = ip->b;
 	memref->shm = shm;
 
@@ -842,6 +900,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return tee_ioctl_shm_alloc(ctx, uarg);
 	case TEE_IOC_SHM_REGISTER:
 		return tee_ioctl_shm_register(ctx, uarg);
+	case TEE_IOC_SHM_REGISTER_FD:
+		return tee_ioctl_shm_register_fd(ctx, uarg);
 	case TEE_IOC_OPEN_SESSION:
 		return tee_ioctl_open_session(ctx, uarg);
 	case TEE_IOC_INVOKE:
diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
index 6c6ff5d5eed2..a9b5e4a6a8f7 100644
--- a/drivers/tee/tee_private.h
+++ b/drivers/tee/tee_private.h
@@ -13,6 +13,14 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
+/* extra references appended to shm object for registered shared memory */
+struct tee_shm_dmabuf_ref {
+	struct tee_shm shm;
+	size_t offset;
+	struct dma_buf *dmabuf;
+	struct tee_shm *parent_shm;
+};
+
 int tee_shm_get_fd(struct tee_shm *shm);
 
 bool tee_device_get(struct tee_device *teedev);
diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index daf6e5cfd59a..76195a398c89 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -4,6 +4,7 @@
  */
 #include <linux/anon_inodes.h>
 #include <linux/device.h>
+#include <linux/dma-buf.h>
 #include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/mm.h>
@@ -45,7 +46,15 @@ static void release_registered_pages(struct tee_shm *shm)
 
 static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 {
-	if (shm->flags & TEE_SHM_POOL) {
+	void *p = shm;
+
+	if (shm->flags & TEE_SHM_DMA_BUF) {
+		struct tee_shm_dmabuf_ref *ref;
+
+		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
+		p = ref;
+		dma_buf_put(ref->dmabuf);
+	} else if (shm->flags & TEE_SHM_POOL) {
 		teedev->pool->ops->free(teedev->pool, shm);
 	} else if (shm->flags & TEE_SHM_DYNAMIC) {
 		int rc = teedev->desc->ops->shm_unregister(shm->ctx, shm);
@@ -59,7 +68,7 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 
 	teedev_ctx_put(shm->ctx);
 
-	kfree(shm);
+	kfree(p);
 
 	tee_device_put(teedev);
 }
@@ -169,7 +178,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size)
  * tee_client_invoke_func(). The memory allocated is later freed with a
  * call to tee_shm_free().
  *
- * @returns a pointer to 'struct tee_shm'
+ * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
  */
 struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size)
 {
@@ -179,6 +188,62 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size)
 }
 EXPORT_SYMBOL_GPL(tee_shm_alloc_kernel_buf);
 
+struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
+{
+	struct tee_shm_dmabuf_ref *ref;
+	int rc;
+
+	if (!tee_device_get(ctx->teedev))
+		return ERR_PTR(-EINVAL);
+
+	teedev_ctx_get(ctx);
+
+	ref = kzalloc(sizeof(*ref), GFP_KERNEL);
+	if (!ref) {
+		rc = -ENOMEM;
+		goto err_put_tee;
+	}
+
+	refcount_set(&ref->shm.refcount, 1);
+	ref->shm.ctx = ctx;
+	ref->shm.id = -1;
+	ref->shm.flags = TEE_SHM_DMA_BUF;
+
+	ref->dmabuf = dma_buf_get(fd);
+	if (IS_ERR(ref->dmabuf)) {
+		rc = PTR_ERR(ref->dmabuf);
+		goto err_kfree_ref;
+	}
+
+	rc = tee_heap_update_from_dma_buf(ctx->teedev, ref->dmabuf,
+					  &ref->offset, &ref->shm,
+					  &ref->parent_shm);
+	if (rc)
+		goto err_put_dmabuf;
+
+	mutex_lock(&ref->shm.ctx->teedev->mutex);
+	ref->shm.id = idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
+				1, 0, GFP_KERNEL);
+	mutex_unlock(&ref->shm.ctx->teedev->mutex);
+	if (ref->shm.id < 0) {
+		rc = ref->shm.id;
+		goto err_put_dmabuf;
+	}
+
+	return &ref->shm;
+
+err_put_dmabuf:
+	dma_buf_put(ref->dmabuf);
+err_kfree_ref:
+	kfree(ref);
+err_put_tee:
+	teedev_ctx_put(ctx);
+	tee_device_put(ctx->teedev);
+
+	return ERR_PTR(rc);
+}
+EXPORT_SYMBOL_GPL(tee_shm_register_fd);
+
 /**
  * tee_shm_alloc_priv_buf() - Allocate shared memory for a privately shared
  *			      kernel buffer
@@ -442,6 +507,9 @@ static int tee_shm_fop_mmap(struct file *filp, struct vm_area_struct *vma)
 	/* Refuse sharing shared memory provided by application */
 	if (shm->flags & TEE_SHM_USER_MAPPED)
 		return -EINVAL;
+	/* Refuse sharing registered DMA_bufs with the application */
+	if (shm->flags & TEE_SHM_DMA_BUF)
+		return -EINVAL;
 
 	/* check for overflowing the buffer's size */
 	if (vma->vm_pgoff + vma_pages(vma) > shm->size >> PAGE_SHIFT)
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index 28b65010b9ed..b6c54b34a8b5 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -28,6 +28,7 @@
 #define TEE_SHM_USER_MAPPED	BIT(1)  /* Memory mapped in user space */
 #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
 #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
+#define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
 
 #define TEE_DEVICE_FLAG_REGISTERED	0x1
 #define TEE_MAX_DEV_NAME_LEN		32
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index a54c203000ed..824f1251de60 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -116,6 +116,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size);
 struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
 					    void *addr, size_t length);
 
+/**
+ * tee_shm_register_fd() - Register shared memory from file descriptor
+ *
+ * @ctx:	Context that allocates the shared memory
+ * @fd:		Shared memory file descriptor reference
+ *
+ * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
+ */
+struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd);
+
 /**
  * tee_shm_free() - Free shared memory
  * @shm:	Handle to shared memory to free
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index d0430bee8292..d843cf980d98 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -378,6 +378,37 @@ struct tee_ioctl_shm_register_data {
 	__s32 id;
 };
 
+/**
+ * struct tee_ioctl_shm_register_fd_data - Shared memory registering argument
+ * @fd:		[in] File descriptor identifying dmabuf reference
+ * @size:	[out] Size of referenced memory
+ * @flags:	[in] Flags to/from allocation.
+ * @id:		[out] Identifier of the shared memory
+ *
+ * The flags field should currently be zero as input. Updated by the call
+ * with actual flags as defined by TEE_IOCTL_SHM_* above.
+ * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD below.
+ */
+struct tee_ioctl_shm_register_fd_data {
+	__s64 fd;
+	__u64 size;
+	__u32 flags;
+	__s32 id;
+};
+
+/**
+ * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file descriptor
+ *
+ * Returns a file descriptor on success or < 0 on failure
+ *
+ * The returned file descriptor refers to the shared memory object in the
+ * kernel. The supplied file deccriptor can be closed if it's not needed
+ * for other purposes. The shared memory is freed when the descriptor is
+ * closed.
+ */
+#define TEE_IOC_SHM_REGISTER_FD	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 8, \
+				     struct tee_ioctl_shm_register_fd_data)
+
 /**
  * TEE_IOC_SHM_REGISTER - Register shared memory argument
  *
-- 
2.43.0


