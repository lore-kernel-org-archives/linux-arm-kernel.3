Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406F2CA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjRrcQSrMswia1nxSNoObebwrAJY/4KfRJ2G70zDpHk=; b=iSXo97uDIPFHyOkv3anUggLMIa
	r4kaHXRWrtd7c0DNa99WRQ8OmzN81XRl9FAx+r4iz8lpotZ2a9ZPgQW/v4tDeeY/aQqcvzZ/PiNZ+
	nmr6TsCARYo2fkdZAYm/HDgsLVya/BTE9MNpY+vFykSlV7m4S/iuu6sPlA/cYURXDZ/tZ8e0jieRI
	YonAcHkjWSroCtWjLCXY5xUBzMMnpb6LIG/rG+PJuienhE4D95YzqYtlExUEZ0jz+XKct5mSlGgjQ
	d9FUXZcRjd4tbeHIq8S/E1lowVn4EPJLoGkKJGb/iOHd9ykWQtn7ceJM/V4H3tvXHlEJeBr5tZgZJ
	mhaiRwpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBubn-00000006ATP-2M6D;
	Wed, 30 Sep 2026 13:44:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBubd-00000006AQK-3Kls
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:44:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D697A497;
	Wed, 30 Sep 2026 06:44:17 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 639003FA32;
	Wed, 30 Sep 2026 06:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790775861; bh=WEicB4D5YyI+tjiM5xOW0IJVdZ3kiHRmlpVO33u6hfo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N+vVfa/VETfQ6CnxK+iHwHXrzvhr0IAV5zgjH0UwLU71DDZTZxzoNuK9rgcmEyHyG
	 WQa0GocZgeej5A7zea1j8ywTk+SCKjvQB8oIpVZxL4gO4wVgslzUIXcs+cKijXaZxy
	 /u+hyW3G5idFYq+KV99R4/0Mj0S8cnBLA8YxK9uo=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 30 Sep 2026 14:43:59 +0100
Subject: [PATCH RFC 1/3] virt: coco: introduce tsm_default_tm() and
 tsm_mr_read()/write()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-ima_tgx_integration_v2-v1-1-722c35370548@arm.com>
References: <20260930-ima_tgx_integration_v2-v1-0-722c35370548@arm.com>
In-Reply-To: <20260930-ima_tgx_integration_v2-v1-0-722c35370548@arm.com>
To: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Eric Snowberg <eric.snowberg@oracle.com>, linux-integrity@vger.kernel.org, 
 linux-security-module@vger.kernel.org
Cc: Dan Williams <djbw@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8185; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=WEicB4D5YyI+tjiM5xOW0IJVdZ3kiHRmlpVO33u6hfo=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqvRIt8Mxt71dVCSHmWjAp5jGB+I/t7XkPkEXo1
 0LV2s/+P1uJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCar0SLQAKCRBt1cPRWsUx
 M/LmDADbYL0xj3Ethqs859DOZxMpDYCDOYBIgvT+C+dUVpOZvmcKXj52TtV4WVmd1QZSGlLdwqW
 sROyctxupihKK+PDBq8XiJ+JGufjNY1ilwQZLv8BzfXLSAcBCUiAIIL6gcWlD0E81OE3bh848DP
 CMkct3RGs5bHtv60CG+D9Boq7dnBeeYLh0FggraSQE9tDdbuoK4cWCoQF/7Gs9N/OBmFhz5zpRp
 NtywCw347RN4k0SJ3/aAyUJ0UwfcUYEKjFKZlaOirc54sW6HPK/EEFEidlVxK1noJsegxgS49S/
 scnDo32mv+JjZyaRR58qftjtL4gukrw9uTC3ErBPWY064rq9uNYKC3DfHQV0dh8b3IjAfxYfvoc
 dxSFILAStIQpgsCImuFHu3i+D+yd+7TkZ/T2/ctRJqAVQEKx+8kAdsq1HwPDyNQ6t0j8luP21ks
 vla0QJK1UMulpl+kb0mza5c+ymwWPt7dqSTg4akGQ7kvJKLnTtZrKj6uA8kLiUKGwird4=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_064421_989377_8FA846A4 
X-CRM114-Status: GOOD (  19.68  )
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

This is preparatory patch to use tsm measurement registers in IMA.
Introduce tsm_default_tm() and tsm_mr_read()/write() APIs
to read and extend the tsm measurement registers in IMA.

Since IMA is supported only when it's built as built-in,
export those symbols only tsm-mr is built as built-in.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/virt/coco/guest/tsm-mr.c | 159 +++++++++++++++++++++++++++++++++------
 include/linux/tsm-mr.h           |  26 +++++++
 2 files changed, 161 insertions(+), 24 deletions(-)

diff --git a/drivers/virt/coco/guest/tsm-mr.c b/drivers/virt/coco/guest/tsm-mr.c
index 657b9c5739d0..9e721348be8d 100644
--- a/drivers/virt/coco/guest/tsm-mr.c
+++ b/drivers/virt/coco/guest/tsm-mr.c
@@ -7,9 +7,15 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 
+
 #define CREATE_TRACE_POINTS
 #include <trace/events/tsm_mr.h>
 
+#define TM_NUM_CTX	(64 * HASH_ALGO__LAST)
+
+DEFINE_IDR(tm_ctx_idr);
+static DEFINE_MUTEX(idr_lock);
+
 /*
  * struct tm_context - contains everything necessary to implement sysfs
  * attributes for MRs.
@@ -42,21 +48,16 @@ struct tm_context {
 	struct bin_attribute mrs[];
 };
 
-static ssize_t tm_digest_read(struct file *filp, struct kobject *kobj,
-			      const struct bin_attribute *attr, char *buffer,
-			      loff_t off, size_t count)
+static ssize_t __tsm_mr_read(struct tm_context *ctx,
+			 const struct tsm_measurement_register *mr,
+			 char *buffer, loff_t off, size_t count)
 {
-	struct tm_context *ctx;
-	const struct tsm_measurement_register *mr;
 	int rc;
 
-	ctx = attr->private;
 	rc = down_read_interruptible(&ctx->rwsem);
 	if (rc)
 		return rc;
 
-	mr = &ctx->tm->mrs[attr - ctx->mrs];
-
 	/*
 	 * @ctx->in_sync indicates if the MR cache is stale. It is a global
 	 * instead of a per-MR flag for simplicity, as most (if not all) archs
@@ -88,20 +89,11 @@ static ssize_t tm_digest_read(struct file *filp, struct kobject *kobj,
 	return rc ?: count;
 }
 
-static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
-			       const struct bin_attribute *attr, char *buffer,
-			       loff_t off, size_t count)
+static ssize_t __tsm_mr_write(struct tm_context *ctx,
+			 const struct tsm_measurement_register *mr,
+			 char *buffer, size_t count)
 {
-	struct tm_context *ctx;
-	const struct tsm_measurement_register *mr;
-	ssize_t rc;
-
-	/* partial writes are not supported */
-	if (off != 0 || count != attr->size)
-		return -EINVAL;
-
-	ctx = attr->private;
-	mr = &ctx->tm->mrs[attr - ctx->mrs];
+	int rc;
 
 	rc = down_write_killable(&ctx->rwsem);
 	if (rc)
@@ -119,6 +111,36 @@ static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
 	return rc ?: count;
 }
 
+static ssize_t tm_digest_read(struct file *filp, struct kobject *kobj,
+			      const struct bin_attribute *attr, char *buffer,
+			      loff_t off, size_t count)
+{
+	struct tm_context *ctx;
+	const struct tsm_measurement_register *mr;
+
+	ctx = attr->private;
+	mr = &ctx->tm->mrs[attr - ctx->mrs];
+
+	return __tsm_mr_read(ctx, mr, buffer, off, count);
+}
+
+static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
+			       const struct bin_attribute *attr, char *buffer,
+			       loff_t off, size_t count)
+{
+	struct tm_context *ctx;
+	const struct tsm_measurement_register *mr;
+
+	/* partial writes are not supported */
+	if (off != 0 || count != attr->size)
+		return -EINVAL;
+
+	ctx = attr->private;
+	mr = &ctx->tm->mrs[attr - ctx->mrs];
+
+	return __tsm_mr_write(ctx, mr, buffer, count);
+}
+
 /**
  * tsm_mr_create_attribute_group() - creates an attribute group for measurement
  * registers (MRs)
@@ -138,8 +160,7 @@ static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
  * * %-ENOMEM - Out of memory.
  */
 const struct attribute_group *
-tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
-{
+tsm_mr_create_attribute_group(const struct tsm_measurements *tm) {
 	size_t nlen;
 
 	if (!tm || !tm->mrs)
@@ -230,6 +251,15 @@ tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
 	ctx->agrp.name = "measurements";
 	ctx->agrp.bin_attrs = no_free_ptr(attrs);
 	ctx->tm = tm;
+
+	guard(mutex)(&idr_lock);
+	((struct tsm_measurements *)tm)->ctx_id = idr_alloc(&tm_ctx_idr, ctx, 0,
+							    TM_NUM_CTX, GFP_KERNEL);
+	if (tm->ctx_id < 0) {
+		kfree(ctx->agrp.bin_attrs);
+		return ERR_PTR(tm->ctx_id);
+	}
+
 	return &no_free_ptr(ctx)->agrp;
 }
 EXPORT_SYMBOL_GPL(tsm_mr_create_attribute_group);
@@ -243,9 +273,90 @@ EXPORT_SYMBOL_GPL(tsm_mr_create_attribute_group);
  */
 void tsm_mr_free_attribute_group(const struct attribute_group *attr_grp)
 {
+	struct tm_context *ctx;
+
 	if (!IS_ERR_OR_NULL(attr_grp)) {
+		ctx = container_of(attr_grp, struct tm_context, agrp);
+		scoped_guard(mutex, &idr_lock)
+			idr_remove(&tm_ctx_idr, ctx->tm->ctx_id);
 		kfree(attr_grp->bin_attrs);
-		kfree(container_of(attr_grp, struct tm_context, agrp));
+		kfree(ctx);
 	}
 }
 EXPORT_SYMBOL_GPL(tsm_mr_free_attribute_group);
+
+#if defined(CONFIG_TSM_MEASUREMENTS)
+const struct tsm_measurements *tsm_default_tm(void)
+{
+	struct tm_context *ctx;
+	int next_id = 0;
+
+	guard(mutex)(&idr_lock);
+
+	ctx = idr_get_next(&tm_ctx_idr, &next_id);
+	if (!ctx)
+		return NULL;
+
+	return ctx->tm;
+}
+EXPORT_SYMBOL_GPL(tsm_default_tm);
+
+int tsm_mr_read(const struct tsm_measurements *tm, int idx,
+		u8 *digest, u32 digest_size)
+{
+	struct tm_context *ctx;
+	const struct tsm_measurement_register *mr;
+	int rc;
+
+	scoped_guard(mutex, &idr_lock)
+		ctx = idr_find(&tm_ctx_idr, tm->ctx_id);
+
+	if (IS_ERR_OR_NULL(ctx))
+		return -ENODEV;
+
+	if (!digest || (idx >= ctx->tm->nr_mrs) ||
+	    (ctx->tm->mrs[idx].mr_size > digest_size) ||
+	    !(ctx->tm->mrs[idx].mr_flags & TSM_MR_F_READABLE))
+		return -EINVAL;
+
+	mr = &ctx->tm->mrs[idx];
+
+	rc = __tsm_mr_read(ctx, mr, (char *)digest, 0, mr->mr_size);
+	if (rc < 0)
+		return rc;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tsm_mr_read);
+
+int tsm_mr_write(const struct tsm_measurements *tm, int idx,
+		 u8 *digest, u32 digest_size)
+{
+	struct tm_context *ctx;
+	const struct tsm_measurement_register *mr;
+	int rc;
+
+	scoped_guard(mutex, &idr_lock)
+		ctx = idr_find(&tm_ctx_idr, tm->ctx_id);
+
+	if (IS_ERR_OR_NULL(ctx))
+		return -ENODEV;
+
+	if (!digest || (idx >= ctx->tm->nr_mrs) ||
+	    !(ctx->tm->mrs[idx].mr_flags & TSM_MR_F_WRITABLE))
+		return -EINVAL;
+
+	/* partial writes are not supported */
+	if (ctx->tm->mrs[idx].mr_size != digest_size)
+		return -EINVAL;
+
+	mr = &ctx->tm->mrs[idx];
+
+	rc = __tsm_mr_write(ctx, mr, (char *)digest, mr->mr_size);
+	if (rc < 0)
+		return rc;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tsm_mr_write);
+#endif
diff --git a/include/linux/tsm-mr.h b/include/linux/tsm-mr.h
index 50a521f4ac97..43a0f761cd96 100644
--- a/include/linux/tsm-mr.h
+++ b/include/linux/tsm-mr.h
@@ -80,10 +80,36 @@ struct tsm_measurements {
 	int (*refresh)(const struct tsm_measurements *tm);
 	int (*write)(const struct tsm_measurements *tm,
 		     const struct tsm_measurement_register *mr, const u8 *data);
+	int ctx_id;
 };
 
 const struct attribute_group *
 tsm_mr_create_attribute_group(const struct tsm_measurements *tm);
 void tsm_mr_free_attribute_group(const struct attribute_group *attr_grp);
 
+#if defined(CONFIG_TSM_MEASUREMENTS)
+const struct tsm_measurements *tsm_default_tm(void);
+int tsm_mr_read(const struct tsm_measurements *tm, int idx,
+		u8 *digest, u32 digest_size);
+int tsm_mr_write(const struct tsm_measurements *tm, int idx,
+		 u8 *digest, u32 digest_size);
+#else
+static inline const struct tsm_measurements *tsm_default_tm(void)
+{
+	return NULL;
+}
+
+static inline int tsm_mr_read(const struct tsm_measurements *tm, int idx,
+			      u8 *digest, u32 digest_size)
+{
+	return 0;
+}
+
+static inline int tsm_mr_write(const struct tsm_measurements *tm, int idx,
+			       u8 *digest, u32 digest_size)
+{
+	return 0;
+}
+#endif
+
 #endif

-- 
2.43.0


