Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61998C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=377z9agroO9vgw/MPipyApHAj2rPTrxxSFp/0FEh+cY=; b=CE/9OhSWlCPbpVPrR+xFCTP8yK
	njQuaHL7juZ4pwFuBHQlmapi3GhhIQqbeHVd6NgpVBTibU4ncx705rcEoZ3bKedw1KkVg8gTkElxv
	FWZ1vwluRoUM9x1c7OVoOuwWFQ8lebeISLGjGEt0AtPsYbDxk40eJ6cHaBkf8VagW+kJuqAwoZ9HL
	IhXNeK2prk/lcnUstbP61J94o+ew6ehQ17sk0LWZag5TP8SYkvJggZSqd+vDLmPZIn6Ux2u7U5APv
	IuhsiIXTOuOcp/ymcj70yJGfpHxj6kYisakbbsTQ3vLiZabaEv2sxQ31yGg+bNkk/1zsQHT7ETjUL
	Fyq+lC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JG1-0000000BAKO-0p4p;
	Tue, 01 Sep 2026 07:50:13 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFx-0000000BAEw-10tO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:50:11 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2d9520b9155so5951145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 00:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249008; x=1788853808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=377z9agroO9vgw/MPipyApHAj2rPTrxxSFp/0FEh+cY=;
        b=VcuG+5cMmvqpM6rwD0dwYl/4sszuxxK19A77SPnXvpfl5voP9jEAYhqH3Uv4oweRJq
         VRSD9xbN3EeLA4RpP5efqAXhKAsUJsqO5EyvOU/zJ3UwSA06Qg5Jrr5+k7MWzEbDU9Tv
         Nkkr/NG6cBhilX431ZO7qRQc28pMkez3I/KBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249008; x=1788853808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=377z9agroO9vgw/MPipyApHAj2rPTrxxSFp/0FEh+cY=;
        b=auu2p3iNv6HsaQMA6usqx5V9Kw3ZwnGBiNcnTG4MNkFG7roQr2dLL2lbZI7z9MHcO/
         jORUxBqHn+rfySD9NBca0H5xxpZkPIjF72A2HfkJ8YX3Nj8M2REFI9E8grCctc75Bqgk
         T0RGoz1OmTnrZXvF9/EwNvZiarkvkE2/bmN3VmQcE62poiPiCBJJzkLJ/3IlPP5sDkVv
         vjC4vaaOCCdPMCfqv2UStCbJKRH/zpWfQLw+psE9GjA8yx8TD60lxmTbhgcrkUeWc3Dr
         Je8l5lv5Qp97jYcRvxDqWBlTPsTGYtB0hdXEyiu/Fx6pDzXOwU7jIBO9sFR0CRcO2TjM
         +3WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBmu8xtYjevjn3a9SW9EPPI3Il04VHsDlkfvwlftJfwdYnkmL9Z3sUlveRLU8jbUlWaWIXl8wkbgaUjI+7oJPb@lists.infradead.org
X-Gm-Message-State: AFuF++kuAuYjyK0nHvhz0l0x1hlE45Si6telNx0HQ0Gl8DHBM33zuDl/
	HRro6MlhmnKyVaggCQ7xldOUa9aymLVq99iFWTy3AHR/6XjPuCANyQV6m6KhRLbHfw==
X-Gm-Gg: AYBFou1ungBBoYgm9Rd5Q8Buhynz58osU7gfF2I+VkdEwrk5gUyTBXVx4qjPqVpSybk
	9dpLwxDWRaJJdHTKQsaoSKvDk1UP3A4fLglX2KS3uQPcU9SR9akgTy8FNNCX1Zfk3AbKPRcaA18
	9G0wv+Kg0JYNzJPZAA25pv16RwbZ8GNewmHBLQddbtX7UAuFteutHxm8sYvT55KoBvT2/LamwcK
	UckcHSxuh+YzzdaM8bbgH11eHjMm/fYYe0On8D3LZ7EKfSYs0azmwqyIsoDDGcVVtdNjBpfQ1IK
	b2IZUma1JzU6bI8YIc474VmeL1/g83aiKPZJCLYnvV3HOKxSrXDDsFqDmZQfh/ANCu772rMMHoV
	x0CoFJ4CniP5R8PQWDpbyHZ9XNPY6bIb5iIsGzGxyyvqjXD7d3UT7PEfd3AtxI70WyGvbVdzZpJ
	xHKgd9myoVMBd5b1OWcQzoh3qcAwhXH63FE91Rbgvudhtles6PjkyjEJQtg2YZhVvPwfxTUb1CC
	Zyz+mEDZpIzZtZzfnVK3XcFp0gx4Zx/nxYbf/ltZV0lZg==
X-Received: by 2002:a17:902:ef52:b0:2d9:383a:30f1 with SMTP id d9443c01a7336-2d9383a326bmr139940935ad.4.1788249008298;
        Tue, 01 Sep 2026 00:50:08 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/8] i2c: of-prober: Let cleanup op know if a device was found
Date: Tue,  1 Sep 2026 15:49:23 +0800
Message-ID: <20260901074930.764550-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_005009_280150_736F55B0 
X-CRM114-Status: GOOD (  19.57  )
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

The prober's cleanup op may want to do things differently if a device
was found, such as wait for the actual device driver to pick up
resources.

Add a parameter to the cleanup op to pass this information in.

Also fix up an incorrect reference in i2c_of_probe_ops's kernel-doc.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- New patch
---
 drivers/i2c/i2c-core-of-prober.c | 8 ++++++--
 include/linux/i2c-of-prober.h    | 7 ++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index f9f3c0ef93ff..97ef58bb4c04 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -130,6 +130,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 	const struct i2c_of_probe_ops *ops;
 	const char *type;
 	struct i2c_adapter *i2c;
+	bool device_found;
 	int ret;
 
 	ops = cfg->ops ?: &i2c_of_probe_dummy_ops;
@@ -159,6 +160,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 	if (ret)
 		goto out_put_i2c_adapter;
 
+	device_found = false;
 	for_each_child_of_node_with_prefix(i2c_node, node, type) {
 		union i2c_smbus_data data;
 		u32 addr;
@@ -171,12 +173,13 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 		/* Found a device that is responding */
 		if (ops->cleanup_early)
 			ops->cleanup_early(dev, ctx);
+		device_found = true;
 		ret = i2c_of_probe_enable_node(dev, node);
 		break;
 	}
 
 	if (ops->cleanup)
-		ops->cleanup(dev, ctx);
+		ops->cleanup(dev, ctx, device_found && !ret);
 out_put_i2c_adapter:
 	i2c_put_adapter(i2c);
 
@@ -388,12 +391,13 @@ EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup_early, "I2C_OF_PROBER");
  * i2c_of_probe_simple_cleanup - Clean up and release resources for I2C OF prober simple helpers
  * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
  * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ * @device_enabled: True if a device was found and enabled.
  *
  * * If a GPIO line was found and not yet released, set its value to the opposite of that
  *   set in i2c_of_probe_simple_enable() and release it.
  * * If a regulator supply was found, disable that regulator and release it.
  */
-void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
+void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_enabled)
 {
 	struct i2c_of_probe_simple_ctx *ctx = data;
 
diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
index bb6d47f50ee5..f28a40780d1f 100644
--- a/include/linux/i2c-of-prober.h
+++ b/include/linux/i2c-of-prober.h
@@ -45,7 +45,7 @@ struct i2c_of_probe_ops {
 	 *
 	 * Only called if a matching component is actually found. If none are found,
 	 * resources that would have been released in this callback should be released in
-	 * @free_resourcs_late instead.
+	 * @cleanup instead.
 	 */
 	void (*cleanup_early)(struct device *dev, void *data);
 
@@ -53,8 +53,9 @@ struct i2c_of_probe_ops {
 	 * @cleanup: Opposite of @enable to balance refcounts and free resources after probing.
 	 *
 	 * Should check if resources were already freed by @cleanup_early.
+	 * |device_enabled| is true is a component was found and was enabled.
 	 */
-	void (*cleanup)(struct device *dev, void *data);
+	void (*cleanup)(struct device *dev, void *data, bool device_enabled);
 };
 
 /**
@@ -131,7 +132,7 @@ struct i2c_of_probe_simple_ctx {
 
 int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node, void *data);
 void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data);
-void i2c_of_probe_simple_cleanup(struct device *dev, void *data);
+void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_enabled);
 
 extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
 
-- 
2.55.0.897.gb25b4bd76c-goog


