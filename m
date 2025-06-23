Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3056C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 12:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3ITvPPultw5XLhyeRV1U8drGwQtxEgBH+z3+MDwaH4=; b=VJD3z3zMCJOTHFi4p18rxCoBUR
	NBnt/ABhez06LH9g98LYWlvxQeZ0htCPfkz0PcAQSFRBv3hga6MY0U4TlFyDneJUE91zf8bqyFQK5
	2wIBbORKu6w58E0dtlVkAz8bPiv8DiDTMuXwJbfGwvksIce/qH/ORcrmbvF6CF+3V3AqfcmIluBi4
	rvt/1CTV9hyBRxj7VO5tXv7Ki5asD25oqxcdlWP3y8wYIU6a07PcfNL5N1+vzJe+NRHG/FPprnw7X
	XpNXRk4xWKBWdx7xA8HoR9FEB1Lxbk57eRp/taA/wrVpOSpUbe2rg9FGlANGJ2uh0fFFFdcizNXWd
	DKjJNIjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgft-00000002mRv-00Hg;
	Mon, 23 Jun 2025 12:53:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeRi-00000002M4b-2RL2;
	Mon, 23 Jun 2025 10:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750674636;
	bh=Brkc+6GuvreWYNLPzilP9Zav00LSZiZlD76bJuKjzH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UXIPWBvTh5tjmXZcSzMncTy5ddfliH3e9B1J8SaEUkG86CB00oi4I54F9cs0awnSE
	 yy/ata0HkOACut3hJFfHAYrT6tgRWfmmGRdu8DJLYfM+tQKaKlHAVPbpdScQIlSIfa
	 LxWxNJ5/yE8k5yC/itdfKoByhn4MMtlCUyISG0CWCp+/TNn3hn+V/nVUMW3N5Z/jXA
	 ZTuVxnkox5TjHosPEIecTa8MdbItqVNocm/KHxzpvcW0FCtbttrCrppspMzeI2OPY0
	 Efgm/2hTj0URr0fy3a1VdqrfoMgL8xTiyDtWcCNfv4O3X3SFVkJrSXYQZAZEgFIZml
	 PpTwQHQvTIClw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:e046:b666:1d47:e832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9EA2517E156D;
	Mon, 23 Jun 2025 12:30:35 +0200 (CEST)
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
Subject: [PATCH 08/30] clk: mediatek: clk-mtk: Add MUX_DIV_GATE macro
Date: Mon, 23 Jun 2025 12:29:18 +0200
Message-Id: <20250623102940.214269-9-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623102940.214269-1-laura.nao@collabora.com>
References: <20250623102940.214269-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_033038_793766_47BAC134 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

On MT8196, some clocks use one register for parent selection and
gating, and a separate register for frequency division. Since composite
clocks can combine a mux, divider, and gate in a single entity, add a
macro to simplify registration of such clocks by combining parent
selection, frequency scaling, and enable control into one definition.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index e2cefd9bc5b8..3498505b616e 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -176,6 +176,25 @@ struct mtk_composite {
 		.flags = 0,						\
 	}
 
+#define MUX_DIV_GATE(_id, _name, _parents,		\
+		_mux_reg, _mux_shift, _mux_width,	\
+		_div_reg, _div_shift, _div_width,	\
+		_gate_reg, _gate_shift) {		\
+		.id            = _id,			\
+		.name          = _name,			\
+		.parent_names  = _parents,		\
+		.num_parents   = ARRAY_SIZE(_parents),	\
+		.mux_reg       = _mux_reg,		\
+		.mux_shift     = _mux_shift,		\
+		.mux_width     = _mux_width,		\
+		.divider_reg   = _div_reg,		\
+		.divider_shift = _div_shift,		\
+		.divider_width = _div_width,		\
+		.gate_reg      = _gate_reg,		\
+		.gate_shift    = _gate_shift,		\
+		.flags         = CLK_SET_RATE_PARENT,	\
+	}
+
 int mtk_clk_register_composites(struct device *dev,
 				const struct mtk_composite *mcs, int num,
 				void __iomem *base, spinlock_t *lock,
-- 
2.39.5


