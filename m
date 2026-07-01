Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41357C4450B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTdl6SrvdUt+pphCfCKYY91/lt/YqidgveXR/r5H1mk=; b=4NnHaqasADh5jyZj/akezEVv6Q
	H5rFz80XzCM307KCRvZU351CjRfJDsPnqj9KXbZdV7IOoG731UdMooQkFPJRgxKDMRYDIQGgIb7iQ
	Gcku847vN23dA6md7k2xG1r0K7fwjNJNWcAvg2dCV6E5rXj58WC/FCFLRFP4wbNf/e/FD/fa4t0TT
	CE4q1djI80AUEwCj6vmKD+ewTTiXkqBl9HN1aG2ykm378nkIIjBMgU3LNxDhvwxI09UFafCh7O7lT
	p/nFwF1wayYA7tYGfc1SaViUzZO8Hc22w/DCtiga0e62ubdBeA+6UYocpws8Q0M+kX9d0tANaMape
	E0xinqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwx-00000001vYF-05UR;
	Wed, 01 Jul 2026 12:21:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwV-00000001uGC-1EdB;
	Wed, 01 Jul 2026 12:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uTdl6SrvdUt+pphCfCKYY91/lt/YqidgveXR/r5H1mk=; b=PK5DCZO7odym40v6hN8RDMZFos
	hf6pSgvs5QTZ+KD+6jZwjb1Q08LpHBytBIGdaN2QdfyGnokFx8Sk3go2hAw58aFD+IRBw2Ej9R836
	ZbKNa7dNSBbgDjgK4LwSvt153TBxDyvYo8/yQ6PI3uQ6B8cpHg4qVMuUSKBWC+RB9GChRGk+aX/of
	O68C7lgeXtGB4jjGGjgVQtoK05u9POVBRXNkU9wstlcZadS79nhSkQG49nIxKd1RXVKarhIGKOz4I
	MYdUENIX8UAdrbkaBAALOtK9jyviT4Ad5VhFyVC3pFqPT/bbslcbJhT/+vq5JnOBVTJAxmUAs+ovb
	zosH9PwA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwS-00000006at1-0rYB;
	Wed, 01 Jul 2026 12:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908483;
	bh=LKT/zTBQSapzzhlIMK9NPg+W0V/2P6jPDkAcunQ83b4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oPon5576JZXKINcB+tgSR8RJ00pS8CNBhp56gQuhcsuyu2e5dAEureTlIsjMJ3Cj6
	 fVWm/Z9MjJJNgvcwmYAu97+S47/lwhnqZBALtbrhB68ehdp65H+pFurN02uBTuWEUn
	 ddWrzx1Oh+sWahE+3idgm3TioIsGc8U9INZTQgi8ZcB19jswmlqmQDH3/ejXOzHVdE
	 kRe1OwuQRtzaRHjKGJVwZVqYa05N29+Vc+GNzFP9xLIiD5pIUAniBVqcPb/kYPUqdz
	 fcd1pw/isWAnwZZ6SMgcyXiMUOzNvnPXQsYHV4SFEEddlkPTIBPp/C3Xu7EKRIdN5P
	 MWTrzHsC39OpA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B1EA17E35C9;
	Wed,  1 Jul 2026 14:21:22 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 18/42] soc: mediatek: mtk-mmsys: Migrate to new Multimedia DDP HW indexing
Date: Wed,  1 Jul 2026 14:20:33 +0200
Message-ID: <20260701122057.19648-19-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132124_463965_F56E923C 
X-CRM114-Status: GOOD (  19.07  )
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

The mediatek-drm driver is ready to switch to the new Multimedia
Subsystem Display Controller HW indexing.

Perform the switch by:
 - Adding new "from_comp_inst" and "to_comp_inst" members in the
   Multimedia Subsystem HW Routes structure (mtk_mmsys_routes);
 - Changing the MMSYS_ROUTE() macro to use those, which performs
   the migration of all SoCs in one go (as all of them use this
   macro to declare their route entries);
 - Adding new mtk_mmsys_hw_connect() and mtk_mmsys_hw_disconnect()
   functions, making use of the new HW Component Type-Instance
   indexing.

Unfortunately, this change needs to go along with the related one
in the mediatek-drm driver, otherwise functionality of the Display
Controller will regress.

The only way to make this possible in two steps is to duplicate
all of the routes structure arrays for all of the SoCs, which
would result in a total of around ~1200 lines changed twice, and
that ignores the big increase in size for this driver during the
migration process so, in order to avoid useless bloat, I opted
for an inter-dependency between the two changes: mediatek-drm
and mtk-mmsys.

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c       | 99 ++++++++++++++++++++------
 drivers/soc/mediatek/mtk-mmsys.h       | 14 ++--
 include/linux/soc/mediatek/mtk-mmsys.h | 16 ++---
 3 files changed, 90 insertions(+), 39 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 21f05fac2cb7..24296ebcbae3 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -1,7 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2014 MediaTek Inc.
- * Author: James Liao <jamesjj.liao@mediatek.com>
+ *                    James Liao <jamesjj.liao@mediatek.com>
+ *
+ * Copyrignt (c) 2026 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  */
 
 #include <linux/delay.h>
@@ -191,38 +194,90 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
 	writel_relaxed(tmp, mmsys->regs + offset);
 }
 
-void mtk_mmsys_ddp_connect(struct device *dev,
-			   enum mtk_ddp_comp_id cur,
-			   enum mtk_ddp_comp_id next)
+/**
+ * mtk_mmsys_hw_connect - Connect MultiMedia Subsystem (MMSYS) Hardware IPs
+ * @dev:            Device pointer
+ * @src_type:       Type of the Source IP
+ * @src_hw_inst_id: Hardware instance of the Source IP
+ * @dst_type:       Type of the Destination IP
+ * @dst_hw_inst_id: Hardware instance of the Destination IP
+ *
+ * This function connects one MultiMedia Subsystem (MMSYS) related hardware
+ * to another (in the same subsystem), depending on supported connections.
+ * In short, this connects "Source" to "Destination", as in, enables sending
+ * data from a Source IP to a Destination IP.
+ *
+ * As a final note - depending on the SoC and on the specific IPs, it may
+ * also be possible to connect multiple Sources to a single Destination.
+ *
+ * Examples below follow this format to explain hardware components:
+ *      [Source Type][Instance ID] -> [Destination Type] [Instance ID]
+ *
+ * Example 1 - Single Source to Destination
+ *                         GAMMA 0 -> DITHER 0
+ *
+ * Example 2 - Multiple Sources to Single Destination
+ *                 MDP_RDMA 0 -----\
+ *                                  |
+ *                                  v
+ *                 MDP_RDMA 1 ---> MERGE 1 \ 
+ *                 MDP_RDMA 2 ---> MERGE 2 -\
+ *                                           >> ETHDR_MIXER 0
+ *                 (other 1)  ---> MERGE 3 -/
+ *                 (other 2)  ---> MERGE 4 /
+ *
+ * Note that in Example 2, some components are not chained together, but
+ * connected in parallel to a destination.
+ */
+void mtk_mmsys_hw_connect(struct device *dev,
+			  enum mtk_ddp_comp_type src_type, u8 src_hw_inst_id,
+			  enum mtk_ddp_comp_type dst_type, u8 dst_hw_inst_id)
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
 	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
-	int i;
 
-	for (i = 0; i < mmsys->data->num_routes; i++)
-		if (cur == routes[i].from_comp && next == routes[i].to_comp)
-			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask,
-					      routes[i].val, NULL);
+	for (int i = 0; i < mmsys->data->num_routes; i++) {
+		if (src_type != routes[i].from_comp_type ||
+		    src_hw_inst_id != routes[i].from_comp_inst ||
+		    dst_type != routes[i].to_comp_type ||
+		    dst_hw_inst_id != routes[i].to_comp_inst)
+			continue;
 
-	if (mmsys->data->vsync_len)
-		mtk_mmsys_update_bits(mmsys, MT8188_VDO1_MIXER_VSYNC_LEN, GENMASK(31, 0),
-				      mmsys->data->vsync_len, NULL);
+		mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask, routes[i].val, NULL);
+		dev_dbg(dev, "Connected %u-%u to %u-%u\n",
+			src_type, src_hw_inst_id, dst_type, dst_hw_inst_id);
+	}
 }
-EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
-
-void mtk_mmsys_ddp_disconnect(struct device *dev,
-			      enum mtk_ddp_comp_id cur,
-			      enum mtk_ddp_comp_id next)
+EXPORT_SYMBOL_NS_GPL(mtk_mmsys_hw_connect, "MTK_MMSYS");
+
+/**
+ * mtk_mmsys_hw_disconnect - Disconnect MultiMedia Subsystem (MMSYS) Hardware IPs
+ * @dev:            Device pointer
+ * @src_type:       Type of the Source IP
+ * @src_hw_inst_id: Hardware instance of the Source IP
+ * @dst_type:       Type of the Destination IP
+ * @dst_hw_inst_id: Hardware instance of the Destination IP
+ */
+void mtk_mmsys_hw_disconnect(struct device *dev,
+			     enum mtk_ddp_comp_type src_type, u8 src_hw_inst_id,
+			     enum mtk_ddp_comp_type dst_type, u8 dst_hw_inst_id)
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
 	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
-	int i;
 
-	for (i = 0; i < mmsys->data->num_routes; i++)
-		if (cur == routes[i].from_comp && next == routes[i].to_comp)
-			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask, 0, NULL);
+	for (int i = 0; i < mmsys->data->num_routes; i++) {
+		if (src_type != routes[i].from_comp_type ||
+		    src_hw_inst_id != routes[i].from_comp_inst ||
+		    dst_type != routes[i].to_comp_type ||
+		    dst_hw_inst_id != routes[i].to_comp_inst)
+			continue;
+
+		mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask, 0, NULL);
+		dev_dbg(dev, "Disconnected %u-%u from %u-%u\n",
+			src_type, src_hw_inst_id, dst_type, dst_hw_inst_id);
+	}
 }
-EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
+EXPORT_SYMBOL_NS_GPL(mtk_mmsys_hw_disconnect, "MTK_MMSYS");
 
 void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height,
 				  struct cmdq_pkt *cmdq_pkt)
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index d534d43aad6f..5c9319f3a2bb 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -80,19 +80,13 @@
 
 #define MMSYS_RST_NR(bank, bit) (((bank) * 32) + (bit))
 
-/* Temporary compatibility definitions */
-#define DDP_COMPONENT_CCORR0		DDP_COMPONENT_CCORR
-#define DDP_COMPONENT_UFOE0		DDP_COMPONENT_UFOE
-#define DDP_COMPONENT_GAMMA0		DDP_COMPONENT_GAMMA
-#define DDP_COMPONENT_ETHDR_MIXER0	DDP_COMPONENT_ETHDR_MIXER
-
 /*
  * This macro adds a compile time check to make sure that the in/out
  * selection bit(s) fit in the register mask, similar to bitfield
  * macros, but this does not transform the value.
  */
 #define MMSYS_ROUTE(from, fsid, to, tsid, reg_addr, reg_mask, selection)	\
-	{ DDP_COMPONENT_##from##fsid, DDP_COMPONENT_##to##tsid, reg_addr, reg_mask,	\
+	{ MTK_DISP_##from, fsid, MTK_DISP_##to, tsid, reg_addr, reg_mask,	\
 	  (__BUILD_BUG_ON_ZERO_MSG((reg_mask) == 0, "Invalid mask") +		\
 	   __BUILD_BUG_ON_ZERO_MSG(~(reg_mask) & (selection),			\
 				   #selection " does not fit in "		\
@@ -101,8 +95,10 @@
 	}
 
 struct mtk_mmsys_routes {
-	u32 from_comp;
-	u32 to_comp;
+	u8 from_comp_type;
+	u8 from_comp_inst;
+	u8 to_comp_type;
+	u8 to_comp_inst;
 	u32 addr;
 	u32 mask;
 	u32 val;
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index bbdd0b01927d..f67f21d04163 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -118,14 +118,6 @@ enum mtk_ddp_comp_type {
 	MTK_DDP_COMP_TYPE_MAX
 };
 
-void mtk_mmsys_ddp_connect(struct device *dev,
-			   enum mtk_ddp_comp_id cur,
-			   enum mtk_ddp_comp_id next);
-
-void mtk_mmsys_ddp_disconnect(struct device *dev,
-			      enum mtk_ddp_comp_id cur,
-			      enum mtk_ddp_comp_id next);
-
 void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
 
 void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width,
@@ -134,6 +126,14 @@ void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width,
 void mtk_mmsys_hdr_config(struct device *dev, int be_width, int be_height,
 			  struct cmdq_pkt *cmdq_pkt);
 
+void mtk_mmsys_hw_connect(struct device *dev,
+			  enum mtk_ddp_comp_type src_type, u8 src_hw_inst_id,
+			  enum mtk_ddp_comp_type dst_type, u8 dst_hw_inst_id);
+
+void mtk_mmsys_hw_disconnect(struct device *dev,
+			     enum mtk_ddp_comp_type src_type, u8 src_hw_inst_id,
+			     enum mtk_ddp_comp_type dst_type, u8 dst_hw_inst_id);
+
 void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
 			       u8 mode, u32 biwidth, struct cmdq_pkt *cmdq_pkt);
 
-- 
2.54.0


