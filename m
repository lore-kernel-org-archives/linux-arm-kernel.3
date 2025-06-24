Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B2AC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 16:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJgTMCYrUEzLdUUrCZs/p13PTnDj4ZHtEeRJmK6ojGY=; b=Tiab7sJW44vxY0SVT6x0n7ty7A
	uSgdhr62mLLxGs/5r48vHQy31KRnozLnvZoJ6ahzFztWlqNK65mnzuKhrtonO6rMmnfMCD4QlfAgM
	U316FZIz82dotZssvKYiPHcfS5KQbw30QOYv7FBZicMoukGxKVH79jEwlz8r2Rzx/PQVgGNLbiRZi
	63knyrx9wZUordD0qYzMtsK/ChUQVKaLlEL8fRBRfFq73hfIBbHlMD18T+0DecU0z0YR8UMsQs1BR
	0c4eyIhjdVrkXdPmBuKMaSB/KOxh8VhgawPOXex/tx4TVucK5MAiGDM0PtpDn3rPxNPqkOcszS1ti
	TghtwpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6UL-00000006GbJ-1ydp;
	Tue, 24 Jun 2025 16:27:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4ia-00000005vb2-1sVI;
	Tue, 24 Jun 2025 14:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eJgTMCYrUEzLdUUrCZs/p13PTnDj4ZHtEeRJmK6ojGY=; b=Ib+by9rGFImaYyQWEADW3UJyC3
	jMnwrHblAgJUjd2Ut/wME/WvHDYWqOLAgFXoekuWPsVLdp1bL5gl+LHL6YZFpKBFULSKO6YkuZk1r
	Hp2WDLh27hVT/6lVOf1GKALVazbMx9FfV8gZq2PDS3Rst1SQG9ycImMJSeXkhggwANUJLP5dmJsJX
	5hA5vJA7TMjMdZhSPTyg/7VNR03ehgB9N68rZIjgcqQVocBoygomjAhuc+KnItiKX7CZe1mHczjJT
	WkiwhC9YosdacRYANobzGBKErXSOE3Q40GysvJryukk5fx5nnlurL5COQS14eZybcNMEd7rLUAAkp
	1M04P/UA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4iX-00000005Ss0-2kNU;
	Tue, 24 Jun 2025 14:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750775624;
	bh=bf++AAMVsRdlK8ZXZIEoCdT5vXCmrXzvterr8licGP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kCGVLLUZPg6n83RiJw/QUn1WmQlLddpQMsa6yq9QG+f5fV/C5cN1DWLBwaOonmXKl
	 KNeefaUGGC8JkLlIJJxIo/cYj0NzjDj4QTWXNw/BD3qOU++bQNadvcR4+qhdtFqrbh
	 iXjuPgUZILvITrwnLO0pFMB+i9L4Q+prR5gw5vs7gGlBtx0KbU72VyOyxauwPiX4A6
	 rGeEs9tdeSJU+dPqQ90Yd86/y9RN5IGBES1N9asHZqFiF+sHUDiHgcrJP/vPEv5lak
	 Cipgpyk4fzltEeFaSnUOfu1gKpFwVif8HTh7CTMGOdtMVjd72ldszZ021gq0/pumzE
	 3tToasGptiOzA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:d2c7:2075:2c3c:38e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3114C17E088B;
	Tue, 24 Jun 2025 16:33:43 +0200 (CEST)
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
Subject: [PATCH v2 10/29] dt-bindings: reset: Add MediaTek MT8196 Reset Controller binding
Date: Tue, 24 Jun 2025 16:32:01 +0200
Message-Id: <20250624143220.244549-11-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624143220.244549-1-laura.nao@collabora.com>
References: <20250624143220.244549-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_153345_964224_FF125DEA 
X-CRM114-Status: GOOD (  11.23  )
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
index 000000000000..46ced0850d91
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt8196-resets.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
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


