Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C7DC53200
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3sPIKoAx90t708w0uIB0htRsTVjX2aOFm5BS0bEd+U=; b=1in31A7K9FO88JCyqeuAljEFIe
	NJyH+k9hIrawisA3W/9nv58pjzTNTLtlrfGn174ICqS3eRJ6NKaUe9MbfdgN5V/O8rRhbaukSsK+8
	1L/JAeoXOzod/8Nq/GXceHD2/ECdPXhm3StBiw7byidG7ptFbthgr1PSa7cwxWAu131Bme8E1WDh3
	GzgbVLd/H0lZc60Bxe+YwOIuFhSg13ssYtjezjPs//kIOw0IAFGR6CFRcY0wBWYf/UjTFWPLbmeJv
	s9h0csz16XUGehnSvWu4H4deIFWgO/SaF4uJiJ2eOeH/uCwtN6mqyWI5BNYCuLqdMuNNKy7b/ImpS
	plPG0Aeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnyjp-00000001BzR-1rKF;
	Sun, 26 Jul 2026 13:17:53 +0000
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163] helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnyjh-00000001BtL-0A0t;
	Sun, 26 Jul 2026 13:17:46 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id A87E0F40DE2; Sun, 26 Jul 2026 15:17:31 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 2/3] nvmem: core: deprecate reg_write callback and add reg_write_const
Date: Sun, 26 Jul 2026 15:17:20 +0200
Message-ID: <20260726131724.15299-3-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726131724.15299-1-linkmauve@linkmauve.fr>
References: <20260726131724.15299-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_061745_287406_996CD7B7 
X-CRM114-Status: GOOD (  18.43  )
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

This callback used to take a mutable void * for no reason, which causes
the compiler to be unaware that the val buffer should never be modified
by the callback.

This was found while drafting the nvmem-provider Rust abstraction.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/nvmem/core.c           | 28 ++++++++++++++++------------
 drivers/nvmem/internals.h      |  1 +
 include/linux/nvmem-provider.h |  6 +++++-
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index f65aebe7837b..8e10fa34619f 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -71,7 +71,7 @@ static int __nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 }
 
 static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
-			     void *val, size_t bytes)
+			     const void *val, size_t bytes)
 {
 	struct nvmem_operations *ops;
 	int ret, wr_ok;
@@ -81,14 +81,17 @@ static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 	if (!ops)
 		return -ENODEV;
 
-	if (!ops->reg_write)
+	if (!ops->reg_write && !ops->reg_write_const)
 		return -EOPNOTSUPP;
 
 	ret = gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
 	if (ret)
 		return ret;
 
-	wr_ok = ops->reg_write(nvmem->priv, offset, val, bytes);
+	if (ops->reg_write_const)
+		wr_ok = ops->reg_write_const(nvmem->priv, offset, val, bytes);
+	else
+		wr_ok = ops->reg_write(nvmem->priv, offset, (void *)val, bytes);
 
 	ret = gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
 	if (ret)
@@ -121,7 +124,7 @@ static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
 			kend = min(end, keepout->start);
 			ksize = kend - offset;
 			if (write)
-				rc = __nvmem_reg_write(nvmem, offset, val, ksize);
+				rc = __nvmem_reg_write(nvmem, offset, (const void *)val, ksize);
 			else
 				rc = __nvmem_reg_read(nvmem, offset, val, ksize);
 
@@ -153,7 +156,7 @@ static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
 	if (offset < end) {
 		ksize = end - offset;
 		if (write)
-			return __nvmem_reg_write(nvmem, offset, val, ksize);
+			return __nvmem_reg_write(nvmem, offset, (const void *)val, ksize);
 		else
 			return __nvmem_reg_read(nvmem, offset, val, ksize);
 	}
@@ -174,7 +177,7 @@ static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 			   void *val, size_t bytes)
 {
 	if (!nvmem->nkeepout)
-		return __nvmem_reg_write(nvmem, offset, val, bytes);
+		return __nvmem_reg_write(nvmem, offset, (const void *)val, bytes);
 
 	return nvmem_access_with_keepouts(nvmem, offset, val, bytes, true);
 }
@@ -309,7 +312,7 @@ static umode_t nvmem_bin_attr_get_umode(struct nvmem_device *nvmem)
 	if (!nvmem->read_only)
 		mode |= 0200;
 
-	if (!ops->reg_write)
+	if (!ops->reg_write && !ops->reg_write_const)
 		mode &= ~0200;
 
 	if (!ops->reg_read)
@@ -346,13 +349,13 @@ static umode_t nvmem_attr_is_visible(struct kobject *kobj,
 	struct nvmem_operations *ops = rcu_dereference_raw(nvmem->ops);
 
 	/*
-	 * If the device has no .reg_write operation, do not allow
-	 * configuration as read-write.
+	 * If the device has no .reg_write or .reg_write_const operation, do
+	 * not allow configuration as read-write.
 	 * If the device is set as read-only by configuration, it
 	 * can be forced into read-write mode using the 'force_ro'
 	 * attribute.
 	 */
-	if (attr == &dev_attr_force_ro.attr && !ops->reg_write)
+	if (attr == &dev_attr_force_ro.attr && !ops->reg_write && !ops->reg_write_const)
 		return 0;	/* Attribute not visible */
 
 	return attr->mode;
@@ -904,7 +907,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (!config->dev)
 		return ERR_PTR(-EINVAL);
 
-	if (!config->reg_read && !config->reg_write)
+	if (!config->reg_read && !config->reg_write && !config->reg_write_const)
 		return ERR_PTR(-EINVAL);
 
 	nvmem = kzalloc_obj(*nvmem);
@@ -960,6 +963,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	ops->reg_read = config->reg_read;
 	ops->reg_write = config->reg_write;
+	ops->reg_write_const = config->reg_write_const;
 
 	nvmem->owner = config->owner;
 	if (!nvmem->owner && config->dev->driver)
@@ -995,7 +999,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		goto err_put_device;
 
 	nvmem->read_only = device_property_present(config->dev, "read-only") ||
-			   config->read_only || !ops->reg_write;
+			   config->read_only || (!ops->reg_write && !ops->reg_write_const);
 
 #ifdef CONFIG_NVMEM_SYSFS
 	nvmem->dev.groups = nvmem_dev_groups;
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index bc7a99f5aefb..14243d44815d 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -12,6 +12,7 @@
 struct nvmem_operations {
 	nvmem_reg_read_t	reg_read;
 	nvmem_reg_write_t	reg_write;
+	nvmem_reg_write_const_t	reg_write_const;
 };
 
 struct nvmem_device {
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..e944530999b4 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -20,6 +20,8 @@ typedef int (*nvmem_reg_read_t)(void *priv, unsigned int offset,
 				void *val, size_t bytes);
 typedef int (*nvmem_reg_write_t)(void *priv, unsigned int offset,
 				 void *val, size_t bytes);
+typedef int (*nvmem_reg_write_const_t)(void *priv, unsigned int offset,
+				       const void *val, size_t bytes);
 /* used for vendor specific post processing of cell data */
 typedef int (*nvmem_cell_post_process_t)(void *priv, const char *id, int index,
 					 unsigned int offset, void *buf,
@@ -93,7 +95,8 @@ struct nvmem_cell_info {
  * @root_only:	Device is accessibly to root only.
  * @of_node:	If given, this will be used instead of the parent's of_node.
  * @reg_read:	Callback to read data; return zero if successful.
- * @reg_write:	Callback to write data; return zero if successful.
+ * @reg_write:	**DEPRECATED** - please use reg_write_const instead.
+ * @reg_write_const:	Callback to write data; return zero if successful.
  * @size:	Device size.
  * @word_size:	Minimum read/write access granularity.
  * @stride:	Minimum read/write access stride.
@@ -128,6 +131,7 @@ struct nvmem_config {
 	struct device_node	*of_node;
 	nvmem_reg_read_t	reg_read;
 	nvmem_reg_write_t	reg_write;
+	nvmem_reg_write_const_t	reg_write_const;
 	int	size;
 	int	word_size;
 	int	stride;
-- 
2.55.0


