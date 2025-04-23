Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0A4C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZCKFNYd97xAEnWYzkN3+9aBHK//JskyWTQ4y/72t8w=; b=Fv0afU0VCQPA26MJfG9llrw92b
	PLKk2DIVGL7NAxu2paXMrEwNExvjkOllWDa9PN9QZrA81HEs1bffDD6k4jO/0rZcuSGRee3psB/LK
	l2Z0tbptCFMAVzSzh6fOQK7H41rfu2rTBNKMFisz++8wMXAJFd57vWB/ru4DAeDC++bXJLkTAJMmQ
	cumCsioFPvbZAz6pQf37/rAPgOauzDnhezO0M47fXiiBfBzcPzSV7SZC4BVddBJwgcWrWYCWYNoVh
	f9lNUOX/ZI56M9DzKW27qKhvUza0FFtvabH5ul5Nz8xGjov1kWaCd7tb1qhKMkAJa8TKzjr2dIlxa
	7zJtBTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7g3d-0000000BpIT-0Pqq;
	Wed, 23 Apr 2025 19:46:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fzY-0000000BoPv-3ZCT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 19:42:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D5866844C;
	Wed, 23 Apr 2025 19:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CED2C4CEE2;
	Wed, 23 Apr 2025 19:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745437363;
	bh=ctYGyuPhpbkQw/STF5j4HRUKC3D1Ft1TdkVeReqE1QM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aO5Uf8JED7xdR5Sqpkq0LFktP3AlooyJkQrzX/3l9vvfYa+HCX/fc5UMvNv6g5biA
	 tKCLD1YgmcoGOrrqDxvU04wl5xLzW3RaqbHakFCkVMjoEueRDlaqQEVFCFsHlPI4Bs
	 yGLgAMVG5CwDsnWy7ADvwPYjlNA0aGZVriCX+9jAqElA3El1L50sXRoHmA15I5Kn04
	 /5zVRKtCXE0xJvKIi9Kgr6C+RKN1O6sdjXRngjopN/QKPAM+Jz5Qtx0m5vcdKyCv7/
	 E5AVhxDzb4XKtVQvEw5Vs4cVuzVZ6VrzF5wOlnpfRLuLtsvEAgpX3ihHTcyg2MoJPr
	 +dQ9ZoKYdCfDQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 23 Apr 2025 14:42:13 -0500
Subject: [PATCH v2 1/4] of: reserved_mem: Add functions to parse
 "memory-region"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-dt-memory-region-v2-v2-1-2fbd6ebd3c88@kernel.org>
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
In-Reply-To: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
To: Saravana Kannan <saravanak@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.15-dev
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

Drivers with "memory-region" properties currently have to do their own
parsing of "memory-region" properties. The result is all the drivers
have similar patterns of a call to parse "memory-region" and then get
the region's address and size. As this is a standard property, it should
have common functions for drivers to use. Add new functions to count the
number of regions and retrieve the region's address as a resource.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Wrap function parameters
---
 drivers/of/of_reserved_mem.c    | 80 +++++++++++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h | 26 ++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index ee2e31522d7e..f87915cce961 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -12,6 +12,7 @@
 #define pr_fmt(fmt)	"OF: reserved mem: " fmt
 
 #include <linux/err.h>
+#include <linux/ioport.h>
 #include <linux/libfdt.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
@@ -740,3 +741,82 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
+
+/**
+ * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
+ * @np:		node containing 'memory-region' property
+ * @idx:	index of 'memory-region' property to lookup
+ * @res:	Pointer to a struct resource to fill in with reserved region
+ *
+ * This function allows drivers to lookup a node's 'memory-region' property
+ * entries by index and return a struct resource for the entry.
+ *
+ * Returns 0 on success with @res filled in. Returns -ENODEV if 'memory-region'
+ * is missing or unavailable, -EINVAL for any other error.
+ */
+int of_reserved_mem_region_to_resource(const struct device_node *np,
+				       unsigned int idx, struct resource *res)
+{
+	struct reserved_mem *rmem;
+
+	if (!np)
+		return -EINVAL;
+
+	struct device_node __free(device_node) *target = of_parse_phandle(np, "memory-region", idx);
+	if (!target || !of_device_is_available(target))
+		return -ENODEV;
+
+	rmem = of_reserved_mem_lookup(target);
+	if (!rmem)
+		return -EINVAL;
+
+	resource_set_range(res, rmem->base, rmem->size);
+	res->name = rmem->name;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource);
+
+/**
+ * of_reserved_mem_region_to_resource_byname() - Get a reserved memory region as a resource
+ * @np:		node containing 'memory-region' property
+ * @name:	name of 'memory-region' property entry to lookup
+ * @res:	Pointer to a struct resource to fill in with reserved region
+ *
+ * This function allows drivers to lookup a node's 'memory-region' property
+ * entries by name and return a struct resource for the entry.
+ *
+ * Returns 0 on success with @res filled in. Returns -ENODEV if 'memory-region'
+ * is missing or unavailable, -EINVAL for any other error.
+ */
+int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
+					      const char *name,
+					      struct resource *res)
+{
+	int idx;
+
+	if (!name)
+		return -EINVAL;
+
+	idx = of_property_match_string(np, "memory-region-names", name);
+	if (idx < 0)
+		return idx;
+
+	return of_reserved_mem_region_to_resource(np, idx, res);
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource_byname);
+
+/**
+ * of_reserved_mem_region_count() - Return the number of 'memory-region' entries
+ * @np:		node containing 'memory-region' property
+ *
+ * This function allows drivers to retrieve the number of entries for a node's
+ * 'memory-region' property.
+ *
+ * Returns the number of entries on success, or negative error code on a
+ * malformed property.
+ */
+int of_reserved_mem_region_count(const struct device_node *np)
+{
+	return of_count_phandle_with_args(np, "memory-region", NULL);
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_region_count);
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e338282da652..f573423359f4 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -7,6 +7,7 @@
 
 struct of_phandle_args;
 struct reserved_mem_ops;
+struct resource;
 
 struct reserved_mem {
 	const char			*name;
@@ -39,6 +40,12 @@ int of_reserved_mem_device_init_by_name(struct device *dev,
 void of_reserved_mem_device_release(struct device *dev);
 
 struct reserved_mem *of_reserved_mem_lookup(struct device_node *np);
+int of_reserved_mem_region_to_resource(const struct device_node *np,
+				       unsigned int idx, struct resource *res);
+int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
+					      const char *name, struct resource *res);
+int of_reserved_mem_region_count(const struct device_node *np);
+
 #else
 
 #define RESERVEDMEM_OF_DECLARE(name, compat, init)			\
@@ -63,6 +70,25 @@ static inline struct reserved_mem *of_reserved_mem_lookup(struct device_node *np
 {
 	return NULL;
 }
+
+static inline int of_reserved_mem_region_to_resource(const struct device_node *np,
+						     unsigned int idx,
+						     struct resource *res)
+{
+	return -ENOSYS;
+}
+
+static inline int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
+							    const char *name,
+							    struct resource *res)
+{
+	return -ENOSYS;
+}
+
+static inline int of_reserved_mem_region_count(const struct device_node *np)
+{
+	return 0;
+}
 #endif
 
 /**

-- 
2.47.2


