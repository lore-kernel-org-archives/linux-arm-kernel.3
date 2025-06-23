Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD5CC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 12:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ijs6kxqKVjfEwn4t7p3gPaOsQNgpZdz/rhqSeA8Cduc=; b=hiRnkkN/w9+ERL6U0PVKg8hvyH
	O5F/hcWuKvWATxT3ouyovaOjP/o2ezsTTlyQ43X9bz75dKVUW6Ey+oJAkN6e1kZrJzyMoijUOQ0Dd
	Kul+KiOZ1CuKrFmVUt+QVYu3U4P3HR4hHypXL5BeA0b21xTAaUpsemjJnDmQxuWdgF4uqZ2qidcG+
	4W2Ky5889XQWL4PzmSLLi02K6L/W+vdDRo590A5g1125+El/n5lWTVbgIeNHJpKc4c+/YkYs7rWYj
	jtoJ9M2fik2jY5WowdTd//l1gEAqUgQdY5j1aiYLznRDjasJhIDd3cgQfO2LWqKEX8udfCV9exwwb
	3iSXUm5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgHK-00000002giM-1TC8;
	Mon, 23 Jun 2025 12:28:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeSA-00000002MG7-3vjd;
	Mon, 23 Jun 2025 10:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750674665;
	bh=Qwv6pzhi6PuN0st6EpFSbXJ8MS0e0vzzWswD1TZPMls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QI4p74ep7GJ2n1Skyil4M2uYoOfHtTFLwbdKVJyACJNN0IvIX9fnxwHTySIE0V5aX
	 /gys3bsLFofoUCFYw/sRmzk8w64unMXiGWJ6Hs52sGdTMwhx/zut3oomHZB4h7DEsb
	 R0cKPERjohlkV2oO/ELgxlq5kqlEjS9QCC1uRU9nLsnG7Z+XgwCvl5qgtjWXrY2EtO
	 4hJakwEa7bNU689ha/DjBB5qgc8AHin9LDTy8Oxkyzkqzc3Z5LDLdSF3LKicsMvpib
	 DCVLn7JjsY1dCDoRpt8/qel/AmvhK0C3fIEXcycKY4Bmba5sLb7Bub1Xut8wAfYfjo
	 poFMVRG1oQw9A==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:e046:b666:1d47:e832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 91AA617E0D64;
	Mon, 23 Jun 2025 12:31:04 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH 29/30] dt-bindings: reset: Add MediaTek MT8196 Reset Controller binding
Date: Mon, 23 Jun 2025 12:29:39 +0200
Message-Id: <20250623102940.214269-30-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623102940.214269-1-laura.nao@collabora.com>
References: <20250623102940.214269-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_033107_127007_D40B841D 
X-CRM114-Status: GOOD (  11.32  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Add a binding for the PEXTP0/1 and UFS reset controllers found in
the MediaTek MT8196 Chromebook SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 .../reset/mediatek,mt8196-resets.h            | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt8196-resets.h

diff --git a/include/dt-bindings/reset/mediatek,mt8196-resets.h b/include/dt-bindings/reset/mediatek,mt8196-resets.h
new file mode 100644
index 000000000000..1a01b2b01f7f
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt8196-resets.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025 Collabora Ltd.
+ * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8196
+#define _DT_BINDINGS_RESET_CONTROLLER_MT8196
+
+/* PEXTP0 resets */
+#define MT8196_PEXTP0_RST0_PCIE0_MAC		0
+#define MT8196_PEXTP0_RST0_PCIE0_PHY		1
+
+/* PEXTP1 resets */
+#define MT8196_PEXTP1_RST0_PCIE1_MAC		0
+#define MT8196_PEXTP1_RST0_PCIE1_PHY		1
+#define MT8196_PEXTP1_RST0_PCIE2_MAC		2
+#define MT8196_PEXTP1_RST0_PCIE2_PHY		3
+
+/* UFS resets */
+#define MT8196_UFSAO_RST0_UFS_MPHY		0
+#define MT8196_UFSAO_RST1_UFS_UNIPRO		1
+#define MT8196_UFSAO_RST1_UFS_CRYPTO		2
+#define MT8196_UFSAO_RST1_UFSHCI		3
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8196 */
-- 
2.39.5


