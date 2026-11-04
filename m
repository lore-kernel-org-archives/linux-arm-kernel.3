Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9563606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=401AtxsB;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ZahJNV6Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S+ck/Y1jUYQofWJ7Q2k9BREFmgj2ytIsC87GbjuuUbw=; b=401AtxsBh3b/hy
	ColcX4GPJi4sMBDu2ViPJmYdGyLIHsZxFVbCOna25tzNHoYX6yScKfHKZmRce5wjFS2aAjJeF2S6e
	6RmjmB1v6PwXz2B21ksRcBtSoFfzIepHPcithOrp76qDcqlSwMPaF1P5zwwogqIWNyM6Vfyo05xtN
	nN9PuvNdaZxLGtQIkdkXFhYshsxcHBO8YdDxPGVLhvWc11izP52RoWuZ+61tnSTFVKcvcGdsGFj+y
	BOqa5MehifqlboNoaMUbuGEDtjcW+N32ng5jh8f//g6uDLTUfB9Eqsa0dKlTgYskqN/x1SywJJBTM
	WlBxCUUdJRQz/vpiu5Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa6j-00000005JgT-36ap;
	Wed, 04 Nov 2026 12:28:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa6Z-00000005JSZ-47dz;
	Wed, 04 Nov 2026 12:28:41 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C34E232A;
	Wed,  4 Nov 2026 13:26:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793795179;
	bh=Ed8zH7eVXyshlepJ2a6VxF47jhQzEAoGKAtRybwj0yw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZahJNV6Qupejq0WQeykhHN85LlnxFqVSn4CJIGVD+NTy/ljqrddzfYHGF6LLFBOdf
	 7WBUIkDIjxxcs8EiasfTSl4n8CW9ti79M7d4hvzk8zOXsejhrKAQbMvFALdY9JRjbJ
	 izjqxCZcctwH66qACTBfEPZfKnqAEPd5EayPKcG4=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 04 Nov 2026 12:28:21 +0000
Subject: [PATCH 6/7] media: v4l2-isp: Introduce "reset buffer" concept
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-v4l2-isp-resume-v1-6-06aeb8cf2940@ideasonboard.com>
References: <20261104-v4l2-isp-resume-v1-0-06aeb8cf2940@ideasonboard.com>
In-Reply-To: <20261104-v4l2-isp-resume-v1-0-06aeb8cf2940@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8462;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=Ed8zH7eVXyshlepJ2a6VxF47jhQzEAoGKAtRybwj0yw=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6yTvABSD/Ovufvg2xAspJQNRPQZLAHYJVpUjd
 wQUuuQ/2buJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCausk7wAKCRDISVd6bEV1
 MutZD/4k34mDvjjZfm9sg772I8vLH8hegDcOQTUPDfVzMNQO+dqTi326z7BKalEBz++nVP7Whqx
 7gZcOviUs6Ki5WGToCsRSdOg0gObSB7BFPOIniaCjZp7UXsKr5miwy9fE5I4YF7mkl6dfVaYTDI
 JO7DvILZ+owE7oDNfNaa3ykG3nPKT8dkCb/GfM9VSb0fJp+iWCnGo+nMdQOT34FlakO0Kk4WmbE
 BW8MO/gzCXpsB77vejkNM2+28gBMaOnLJNqg7ViverMCcYa7MX8uewKZjBj/dwa3H6wJbAcmOHl
 Gc53TDxFQME9wkjGDiWFsk+V3nzkLYduvaM51O/B6j7iY+xxS62SUajPQARKQVwdvPh3cfKf8U/
 mTEuzGcFhYO3FEkfVlumXJaWPCeXk+/nvsWeM43PYlgRH0w2eJCBIJA+7jq4Xav9Abk94YE6Kju
 i9Jd8wxQ2ixVJcwLaxTLKyzj76vBfCRni6HXItf6v0z4ObGP57C2jvgxQ9BhFuzyV2e/gqgRueK
 pu50onDSRYif+0zN63BPeQz+fCmWZZm/txLtP3XbTo3CmXSFHbKwuU3dcyC91JOiSZmpeGgj66+
 BN6/WSeiZhUyZIq+4wc3akmmfe6biYgL8MEl1zpW89q3FRLc83L8Vbm35KbGQdBmo3L8ntG19im
 /5aoiOjv8UWC5Yw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_042840_375834_926C0FA0 
X-CRM114-Status: GOOD (  31.23  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The extensible parameters format defined in the v4l2-isp framework
is designed to allow userspace to pass a truncated buffer of params
for an ISP, which need not include all of its available configuration
settings. This allows heavy configuration like lens shading tables to
be passed by userspace to the driver a single time, and subsequent
per-frame buffers to be much lighter. This is problematic in the case
of suspend or hibernate and resume, in which scenario the hardware
will lose all settings, but userspace has no way of knowing that they
need to be re-applied.

Introduce the concept of a "reset buffer" to v4l2-isp. Userspace can
pass a new flag that marks a parameter block as needing to be
re-applied. Where the validation process finds that flag, the marked
block is copied to a VB2Q-independent instance of a
v4l2_isp_params_buffer. If that block has been written to the reset
buffer before then the existing copy is overwritten.

The intention with using the existing v4l2_isp_params_buffer is to
facilitate a driver easily using the normal function to apply a
params buffer to also apply the reset buffer on device reset.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 Documentation/userspace-api/media/v4l/v4l2-isp.rst | 19 +++++++
 drivers/media/v4l2-core/v4l2-isp.c                 | 66 ++++++++++++++++++++++
 include/media/v4l2-isp.h                           | 15 +++++
 include/uapi/linux/media/v4l2-isp.h                |  1 +
 4 files changed, 101 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/v4l2-isp.rst b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
index 8a3f05b5e85fd335e68e349234e2cfe5e7e83099..6bd72c7741816676d22a3197ae72ae6796973a5f 100644
--- a/Documentation/userspace-api/media/v4l/v4l2-isp.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
@@ -56,6 +56,25 @@ returns an error.
 Extension to the parameters format can be implemented by adding new blocks
 definition without invalidating the existing ones.
 
+ISP Reset buffers
+-----------------
+The parameters buffer format described by :c:type:`v4l2_isp_params_buffer`
+allows intentionally for userspace to pass a truncated buffer of parameters for
+an ISP which does not need to include all of its available configuration
+settings. This allows heavy configuration like lens shading tables to be passed
+by userspace a single time, and subsequent per-frame buffers to be much lighter.
+
+In the case of a suspend or hibernate action followed by a system resume this
+presents a problem. The hardware will have lost all settings, but userspace has
+no way of knowing that they were lost and need to be re-applied.
+
+The V4L2 ISP framework includes the concept of a "reset buffer". As part of the
+validation process, the framework will store the "last-seen" instance of each
+configuration block type in an instance of v4l2_isp_params_buffer. Drivers can
+then simply re-apply that "reset buffer" using their normal configuration
+function when resuming from hibernation with an active stream
+
+
 ISP statistics
 ==============
 
diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
index 925632e1037db18f0948ceb0ce7c652e167516c9..1420aa0f48194ff04a29fbbf83d0646d3b9d23d2 100644
--- a/drivers/media/v4l2-core/v4l2-isp.c
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -54,6 +54,69 @@ int v4l2_isp_validate(struct v4l2_isp *isp)
 }
 EXPORT_SYMBOL_GPL(v4l2_isp_validate);
 
+int v4l2_isp_params_init_reset_buf(struct v4l2_isp *isp)
+{
+	isp->params.reset_buf = devm_kzalloc(isp->dev, isp->params.max_size,
+					     GFP_KERNEL);
+	if (!isp->params.reset_buf)
+		return -ENOMEM;
+
+	isp->params.reset_buf->version = V4L2_ISP_PARAMS_VERSION_V0;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_isp_params_init_reset_buf);
+
+static void v4l2_isp_params_update_reset_buf(struct v4l2_isp *isp,
+					     const struct v4l2_isp_params_block_header *block,
+					     const struct v4l2_isp_params_block_type_info *info)
+{
+	struct v4l2_isp_params_buffer *buffer = isp->params.reset_buf;
+	struct v4l2_isp_params_block_header *new_block;
+	struct v4l2_isp_params_block_header *old_block;
+
+	/*
+	 * If the reset buffer was never initialised then the driver didn't ask
+	 * us to handle this and we can just do nothing.
+	 */
+	if (!buffer) {
+		dev_dbg(isp->dev, "Reset buffer is not initialised\n");
+		return;
+	}
+
+	v4l2_isp_params_for_each_block(buffer, old_block) {
+		if (old_block->type != block->type)
+			continue;
+
+		memcpy(old_block, block, block->size);
+		return;
+	}
+
+	/*
+	 * If we didn't find an existing stored copy for the given block type
+	 * then we simply add it to the end of the array.
+	 */
+	new_block = (struct v4l2_isp_params_block_header *)
+		&buffer->data[buffer->data_size];
+
+	/*
+	 * This looks awkward! We're memcpy()ing with block->size but setting
+	 * new_block->size with info->size. The reason is that the source buffer
+	 * might have only contained the block header rather than a full block.
+	 * In that case, we need to only memcpy() the amount of space that it
+	 * actually used in the source buffer.
+	 *
+	 * In future though userspace might queue a buffer with a full block for
+	 * the same block type. If we only reserved here enough space for the
+	 * header then things would need to be rearranged in the reset buffer.
+	 * Much easier to just reserve enough space for the full block right
+	 * away.
+	 */
+	memcpy(new_block, block, block->size);
+	new_block->size = info->size;
+	buffer->data_size += new_block->size;
+}
+
 int v4l2_isp_params_validate_buffer_size(struct v4l2_isp *isp,
 					 struct vb2_buffer *vb)
 {
@@ -170,6 +233,9 @@ int v4l2_isp_params_validate_buffer(struct v4l2_isp *isp, struct vb2_buffer *vb,
 		if (info->block_validate && info->block_validate(dev, block))
 			return -EINVAL;
 
+		if (block->flags & V4L2_ISP_PARAMS_FL_BLOCK_REAPPLY)
+			v4l2_isp_params_update_reset_buf(isp, block, info);
+
 		block_offset += block->size;
 		buffer_size -= block->size;
 	}
diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
index 5f13651b53d3c06fc676b32826daa68ad77b5cf6..b2ad6d98a4c266c388db623ddd549307b7fd4b09 100644
--- a/include/media/v4l2-isp.h
+++ b/include/media/v4l2-isp.h
@@ -72,6 +72,8 @@ struct v4l2_isp_params_block_type_info {
  * @dev: pointer to the &struct device associated with the ISP
  * @params: sub-struct holding data related to the V4L2 ISP parameters
  * @params.types_info: pointer to array of params block information structs
+ * @params.reset_buf: pointer to a buffer containing a copy of any block
+ *		      flagged as needing re-application on device reset
  * @params.num_block_types: number of possible params block types
  * @params.max_size: maximum size in bytes of the data member of
  *		     &struct v4l2_isp_params_buffer
@@ -88,6 +90,7 @@ struct v4l2_isp {
 
 	struct {
 		const struct v4l2_isp_params_block_type_info *types_info;
+		struct v4l2_isp_params_buffer *reset_buf;
 		size_t num_block_types;
 		size_t max_size;
 	} params;
@@ -104,6 +107,18 @@ struct v4l2_isp {
  */
 int v4l2_isp_validate(struct v4l2_isp *isp);
 
+/**
+ * v4l2_isp_params_init_reset_buf - Init a buffer to store device reset data
+ * @isp: pointer to the &struct v4l2_isp to allocate the buffer for
+ *
+ * This function allocates memory for &struct v4l2_isp.params.reset_buf, which
+ * is intended to be populated with parameter blocks that are flagged with
+ * %V4L2_ISP_PARAMS_FL_BLOCK_REAPPLY.
+ *
+ * @return 0 on success, -ENOMEM on failure
+ */
+int v4l2_isp_params_init_reset_buf(struct v4l2_isp *isp);
+
 /**
  * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
  * @isp: the driver's &struct v4l2_isp pointer
diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
index e4607e1217e1a720f8f0a180abf3c064a0d81bf7..43059940edf1a2cad9868a4bc049ee32211cc465 100644
--- a/include/uapi/linux/media/v4l2-isp.h
+++ b/include/uapi/linux/media/v4l2-isp.h
@@ -42,6 +42,7 @@ enum v4l2_isp_version {
 
 #define V4L2_ISP_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
 #define V4L2_ISP_PARAMS_FL_BLOCK_ENABLE		(1U << 1)
+#define V4L2_ISP_PARAMS_FL_BLOCK_REAPPLY	(1U << 2)
 
 /*
  * Reserve the first 8 bits for V4L2_ISP_PARAMS_FL_* flag.

-- 
2.43.0


