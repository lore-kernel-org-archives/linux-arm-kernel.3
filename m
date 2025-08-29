Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ADBCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 10:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lt9hsKg2jjndWJtcMzUkXjJssRZGU67hhVVRreUhicc=; b=ucWbPfE0isz26H3HF4j23rEI86
	JvyQwMzPhBLRaZpgtQXh/KXhcsecxI29JpUXYOwrewC9/Z6OxlgZxBXMrf480r9bfXoiVM1I/frm2
	80BsavbYBqNb0qyYWb9GRgTiKOIa8u6j3iJs+PJ3Gvyi56ZRKEmuPurMBUiy1gU1WupcFCusK2gxS
	b/lxwWMVnr1iqlX5qDoHRgc16Kl6ZE+PUWoMlD581djPoCFFiro++V21CwMV/9S9D5s25Q9saeFSx
	W/3hqAiNjHz0b9+fOdZjxHB7yUXKcB4EkIRXWXjJZ9jJWVkxEyIyfwl+5bBaRjKH9crBYHOGK4wbR
	RRh7Lx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwha-00000005Nrl-2ljh;
	Fri, 29 Aug 2025 10:51:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvI9-000000057k5-1glS;
	Fri, 29 Aug 2025 09:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756459264;
	bh=/quwpo3Td+EOEF9Gi50+IzfkKTC4g4fSCb+/GxjyPG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cNZRHop4PNqzJAPFaNGF9C4oogrjja8d7dGLjpBxQTYqVIN4tuOTUc8ke38XMPZHJ
	 ivjWY/3NC1ZzjopAUjsVCtgUYVjA6NHMaemH74Gh4Inej1fBlivSJIudE6K9J2cXmf
	 tZO1w/SgiD9FyWSynPkSIuzmpwddGYLS1qT50DEYflWSIhVB3WHqsYE9uo86YEEzxx
	 wGMY7TL/1SDsiefcLgh4tY5cdAKsuyNkGs2l/SZbI8+SDFWS/HOzOT+KzPf5/hYqVr
	 5XjZNvvNdMkeq6BAIMPOU9INDArz7Gh5IFWyTakhugd7P+qt2E1WL3T5zeDFV34lrU
	 RpgLTENtTgu1Q==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:f5b1:db54:a11a:c333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1884717E12C0;
	Fri, 29 Aug 2025 11:21:03 +0200 (CEST)
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
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v5 08/27] clk: mediatek: clk-mtk: Add MUX_DIV_GATE macro
Date: Fri, 29 Aug 2025 11:18:54 +0200
Message-Id: <20250829091913.131528-9-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829091913.131528-1-laura.nao@collabora.com>
References: <20250829091913.131528-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_022105_583813_E806904A 
X-CRM114-Status: UNSURE (   9.58  )
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

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index c381d6a6d908..5417b9264e6d 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -175,6 +175,25 @@ struct mtk_composite {
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


