Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CA8C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 09:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IgTXMi4Z6/pPHAJvWr1PzOr0CtmvNpPFfsgTnXCpDoE=; b=KDzW/PUNbqw00UFDQ7jqNaG2oj
	bZ3smdJLypVd/jXonqeS9njYS+lYCC8b+pVFr3AZXrEsrU9UoKf4xhjhckAhipKWkFdNwbzWX/iP8
	flBXM/CUGSo79YtK2cDDlPBEfVtAMfTgcyG6jrtTNchedJ+MBhk6EVLbgM7taVzM6IeareoJsgwe4
	BEoeVEzsNXI5BckVxJP1iIGcRfDFvGwINBEbXmkvXUyC5slnbSlpyp0DZawVdAtwiLgmRoGrywZ9x
	aS0Dvm+e01muX53qwrIIdd+fXyeN8MrhgHEkNKkTDQBb9BsseoxFwcm6wb47SzyaWR8t9pA8rTV28
	Pg0qXDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdnei-0000000AL0N-0WuW;
	Fri, 31 Jan 2025 09:49:44 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdndO-0000000AKuz-1f3L;
	Fri, 31 Jan 2025 09:48:24 +0000
X-CSE-ConnectionGUID: Z+PrpjS4SYKuLNBTu5ZRNg==
X-CSE-MsgGUID: VxM4iI87TweP3hHFzGXvqg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 31 Jan 2025 18:48:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.122])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E4CBC40165B8;
	Fri, 31 Jan 2025 18:48:14 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] of: base: Add of_get_available_child_by_name()
Date: Fri, 31 Jan 2025 09:48:10 +0000
Message-ID: <20250131094812.118340-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_014822_548863_ACA57240 
X-CRM114-Status: GOOD (  11.96  )
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

There are lot of drivers using of_get_child_by_name() followed
by of_device_is_available() to check the child node availabilty
by name for a given parent. Provide a helper for these users to
simplify the code.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
grep showed the below files will be the user for this new API.
I will be updating these drivers once this patch is in mainline.

drivers/net/dsa/rzn1_a5psw.c
drivers/net/can/rcar/rcar_canfd.c

drivers/net/ethernet/mediatek/mtk_star_emac.c
drivers/net/dsa/mt7530.c
drivers/net/dsa/sja1105/sja1105_mdio.c
drivers/net/dsa/qca/qca8k-8xxx.c
drivers/net/wireless/mediatek/mt76/mac80211.c
drivers/net/ethernet/ibm/emac/core.c
drivers/net/ethernet/ti/am65-cpsw-nuss.c
drivers/net/ethernet/actions/owl-emac.c
drivers/net/ethernet/mediatek/mtk_eth_soc.c
drivers/media/platform/samsung/exynos4-is/media-dev.h
drivers/gpu/drm/tegra/rgb.c
drivers/gpu/drm/msm/adreno/adreno_gpu.c
drivers/clk/davinci/pll.c
---
 drivers/of/base.c  | 28 ++++++++++++++++++++++++++++
 include/linux/of.h |  9 +++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index af6c68bbb427..3f5119fbfdb4 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -824,6 +824,34 @@ struct device_node *of_get_child_by_name(const struct device_node *node,
 }
 EXPORT_SYMBOL(of_get_child_by_name);
 
+/**
+ * of_get_available_child_by_name - Find the child node availabilty by name for a given parent
+ * @node:	parent node
+ * @name:	child name to look for.
+ *
+ * This function looks for child node for given matching name and check the
+ * device availability for use.
+ *
+ * Return: A node pointer if found, with refcount incremented, use
+ * of_node_put() on it when done.
+ * Returns NULL if node is not found.
+ */
+struct device_node *of_get_available_child_by_name(const struct device_node *node,
+						   const char *name)
+{
+	struct device_node *child;
+
+	for_each_child_of_node(node, child)
+		if (of_node_name_eq(child, name))
+			break;
+
+	if (child && !of_device_is_available(child))
+		of_node_put(child);
+
+	return child;
+}
+EXPORT_SYMBOL(of_get_available_child_by_name);
+
 struct device_node *__of_find_node_by_path(const struct device_node *parent,
 						const char *path)
 {
diff --git a/include/linux/of.h b/include/linux/of.h
index eaf0e2a2b75c..9d6b8a61607f 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -301,6 +301,8 @@ extern struct device_node *of_get_compatible_child(const struct device_node *par
 					const char *compatible);
 extern struct device_node *of_get_child_by_name(const struct device_node *node,
 					const char *name);
+extern struct device_node *of_get_available_child_by_name(const struct device_node *node,
+							  const char *name);
 
 /* cache lookup */
 extern struct device_node *of_find_next_cache_node(const struct device_node *);
@@ -578,6 +580,13 @@ static inline struct device_node *of_get_child_by_name(
 	return NULL;
 }
 
+static inline struct device_node *of_get_available_child_by_name(
+					const struct device_node *node,
+					const char *name)
+{
+	return NULL;
+}
+
 static inline int of_device_is_compatible(const struct device_node *device,
 					  const char *name)
 {
-- 
2.43.0


