Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B06AC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 14:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5crKMExrr5c3Q5dXwzY6LzWcqdtMg4U+Mqhx5XRVtIk=; b=PDmVza8hAutGUc67nT7hZ3OO3z
	BZzGFVk3W2RJrDV6llVZV9C+OFZAgwHTvebC+BWYzSZGsS4W6bF7dyyrCXfkwHjFZuh17PvQ5tctt
	Xy6Wdl5AI3vOiWIsz8l/k3g2PUIQ/rMt5PqA/5T6vI2ZkWOIpG5DiGfKedZRl3QZ111xmILtmIS0H
	jVyRpcIXilMepm0SlRtwntv97F/lhAxF8DT7WCwP2eHvWx5KJwOEvjFIhu4TZQZLz2ZQwDXzRvFl2
	YG+qQjaSPp4g3cSHaZN91iVDCjrLv7nPV5mcZ/aIYESOYtgYSRpM4DswuQcsAsXerhQW5fN0+bBl8
	Xk/d7Vdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOle-00000008ael-3cfU;
	Tue, 18 Feb 2025 14:40:10 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOhJ-00000008ZKm-2nnp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 14:35:42 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54298ec925bso7537764e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 06:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739889340; x=1740494140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5crKMExrr5c3Q5dXwzY6LzWcqdtMg4U+Mqhx5XRVtIk=;
        b=U3hux1eCNYVYlnriveYWDDkNLczFkd9a/DABj5iat2UXYPag4Ht7lNeE+MsGEekgrS
         8lnpEN4/FBwAvlUC0xcYJjRR+rFQ8TfDrj/cQcNw6ryz7y5V69fmU8mX5zzh9H7pFUIR
         BSfRjSviYdeKaE7EJ60+uJHRS1mle7UP96eW+iVDqQmtPhRCGWXL5zj0bNMa8NMcd3iL
         vDih6aIwF/QTCe/Cviw/w5NE+VfsXUGCk1aQRJ2gXSTRl+WLooxN/QAXWIvbwHo6SUp6
         XLOajQU3SAyln03of5H314vwyv12APfYAypy71vWSwE1FNzJ80t5uehxOlVBhIyITw8o
         bVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739889340; x=1740494140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5crKMExrr5c3Q5dXwzY6LzWcqdtMg4U+Mqhx5XRVtIk=;
        b=i1NHomc5dhuyHF1hO01lk5Rq9DNz1E6XQ/ywiak1y1XXTg3lJoyKN6kMLhDmKPPBHE
         yOxypagLmmeqyOGQQsdmZ3pBr7Grp79XYfjOMWNSEzaqYuseulaoMiv9dQKxGWK6HApS
         /x8jJDngAXRC7FLTD0wIZG688wPsVB5hlLAE/nurVc/TUQQ8JYfFnfWoki3NMMvSb8Sg
         LngJgCY1VpC28GS8c971GgZn90uY0YaERPT9wdEwhe4AlKnunJTVp42b2CeBgax+0pyr
         sZ7u5Zv6Kdd64OMpR4q4u4s90nuUwrhMUlkxf/CmJAdQt3K7//nozEQsgUT88EVwNshn
         KPug==
X-Forwarded-Encrypted: i=1; AJvYcCXZsa+8cGiKHSjcgEc7I/dkkSxKod3nmRBpXoNBLfyvKbXt5vwaEKHoaLhrDvSJtsAS+gne5Sn+xKh/gOa2sQbE@lists.infradead.org
X-Gm-Message-State: AOJu0YxiD1TZITsTiPHd1ReVACKacs8egMDWKIbEkfn4hvQQIiMzHs6I
	+kRGk/jf0vWFT15M72ZImlKsrMzY3TTrj+3XM96GJ7nnC08kHXrTgl68ppj4L3E=
X-Gm-Gg: ASbGncucF1rytWbybCVIlzaMwW1h1/qs0SxrBJ+420F+qIqkhcxXCZIwe92A21zD7xr
	xfzVxY4Di3Yly87UtlKn+TpocR/wbqkBPZ+tSK4sweVIOCk7eEPzX5XKgP/BaeGFVMWk1xuBCqT
	jkWzfV7ppW0dv6JUEjd7xAZmK0S1QEPHCy1WiyAIorqKlbnAYISluio04ZGbUIRSgx9dp2s9WSZ
	paAMZzndI9tKxFw+GXZo5Ss4ILH1DvB0cfPI5U9oFgweW4P//XLTPTLKlELQd7uOnJABkl959RS
	MWGYxwAzQQDJeaYKQmradUhygaBmhSJ5Y215MxFAL/l5QemrSZiB8lQv5t9OCQofvhEk
X-Google-Smtp-Source: AGHT+IGHuwCuQFYm4XQIVFkYY86WrwdSnRz+8agLRLCIecYLWINXh1qm1vFaOFrES19B9Zbg/l5wSA==
X-Received: by 2002:a05:6512:1092:b0:545:a1a:556b with SMTP id 2adb3069b0e04-5452fdb9988mr5179716e87.0.1739889339564;
        Tue, 18 Feb 2025 06:35:39 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309311777a8sm12360831fa.25.2025.02.18.06.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 06:35:38 -0800 (PST)
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
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v5 2/7] tee: add TEE_IOC_RSTMEM_FD_INFO
Date: Tue, 18 Feb 2025 15:34:51 +0100
Message-ID: <20250218143527.1236668-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218143527.1236668-1-jens.wiklander@linaro.org>
References: <20250218143527.1236668-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_063541_707865_7112C9C9 
X-CRM114-Status: GOOD (  17.27  )
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

Add TEE_IOC_RSTMEM_FD_INFO to retrieve information about a previously
allocated restricted memory dma-buf file descriptor. This is needed if
the file descriptor from a restricted memory allocation has been saved
due to limitations in the application.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c    | 31 +++++++++++++++++++++++++++++++
 drivers/tee/tee_private.h |  2 ++
 drivers/tee/tee_rstmem.c  |  8 ++++++++
 include/uapi/linux/tee.h  | 27 +++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index f4a45b77753b..01a2a9513578 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -848,6 +848,35 @@ tee_ioctl_rstmem_alloc(struct tee_context *ctx,
 	return fd;
 }
 
+static int
+tee_ioctl_rstmem_fd_info(struct tee_context *ctx,
+			 struct tee_ioctl_rstmem_fd_info __user *udata)
+{
+	struct tee_ioctl_rstmem_fd_info data;
+	struct dma_buf *dmabuf;
+	struct tee_shm *shm;
+
+	if (copy_from_user(&data, udata, sizeof(data)))
+		return -EFAULT;
+
+	dmabuf = dma_buf_get(data.fd);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+	shm = tee_rstmem_dmabuf_to_shm(ctx, dmabuf);
+	if (!IS_ERR(shm)) {
+		data.flags = 0;
+		data.use_case = shm->use_case;
+		data.id = shm->id;
+		data.size = shm->size;
+	}
+	dma_buf_put(dmabuf);
+	if (IS_ERR(shm))
+		return PTR_ERR(shm);
+	if (copy_to_user(udata, &data, sizeof(data)))
+		return -EFAULT;
+	return 0;
+}
+
 static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	struct tee_context *ctx = filp->private_data;
@@ -874,6 +903,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return tee_ioctl_supp_send(ctx, uarg);
 	case TEE_IOC_RSTMEM_ALLOC:
 		return tee_ioctl_rstmem_alloc(ctx, uarg);
+	case TEE_IOC_RSTMEM_FD_INFO:
+		return tee_ioctl_rstmem_fd_info(ctx, uarg);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
index bf97796909c0..b076089b2512 100644
--- a/drivers/tee/tee_private.h
+++ b/drivers/tee/tee_private.h
@@ -25,5 +25,7 @@ struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
 					  unsigned long addr, size_t length);
 struct dma_buf *tee_rstmem_alloc(struct tee_context *ctx, u32 flags,
 				 u32 use_case, size_t size, int *shm_id);
+struct tee_shm *tee_rstmem_dmabuf_to_shm(struct tee_context *ctx,
+					 struct dma_buf *dmabuf);
 
 #endif /*TEE_PRIVATE_H*/
diff --git a/drivers/tee/tee_rstmem.c b/drivers/tee/tee_rstmem.c
index 3b27594ec30b..5108772f3ca0 100644
--- a/drivers/tee/tee_rstmem.c
+++ b/drivers/tee/tee_rstmem.c
@@ -178,3 +178,11 @@ struct dma_buf *tee_rstmem_alloc(struct tee_context *ctx, u32 flags,
 	tee_device_put(teedev);
 	return dmabuf;
 }
+
+struct tee_shm *tee_rstmem_dmabuf_to_shm(struct tee_context *ctx,
+					 struct dma_buf *dmabuf)
+{
+	if (dmabuf->ops != &rstmem_generic_buf_ops)
+		return ERR_PTR(-EINVAL);
+	return dmabuf->priv;
+}
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 88834448debb..30ab5bd80a55 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -431,6 +431,33 @@ struct tee_ioctl_rstmem_alloc_data {
 #define TEE_IOC_RSTMEM_ALLOC     _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 10, \
 				       struct tee_ioctl_rstmem_alloc_data)
 
+/**
+ * struct tee_ioctl_rstmem_fd_info - Restricted memory information
+ * @fd:		[in] File descriptor returned from the previous allocation
+ * @flags:	[out] Flags from the allocation
+ * @use_case:	[out] Restricted memory use case, TEE_IOC_UC_*
+ * @id:		[out] Identifier of the restricted memory
+ * @size:	[out] Size of the restricted memory
+ */
+struct tee_ioctl_rstmem_fd_info {
+	__s32 fd;
+	__u32 flags;
+	__u32 use_case;
+	__s32 id;
+	__u64 size;
+};
+
+/**
+ * TEE_IOC_RSTMEM_FD_INFO - get restricted memory information from an fd
+ *
+ * Returns information about a previously allocated restricted memory
+ * dma-buf file descriptor.
+ *
+ * Returns 0 on success or < 0 on failure
+ */
+#define TEE_IOC_RSTMEM_FD_INFO	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 11, \
+				      struct tee_ioctl_rstmem_fd_info)
+
 /*
  * Five syscalls are used when communicating with the TEE driver.
  * open(): opens the device associated with the driver
-- 
2.43.0


