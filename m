Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E51E75426
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 07:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mo1q3wRHSL5SHejPUoaAmaXNeAXM+TFbJZpNrsm/4eo=; b=cCdllWrbe331uvH/WizbN2BJJH
	vKbhv0P+eG+522ad2jRxRHaOO6aK9nJAoaQc7lx54B3vdflKFkl8cokWDYtti0DwufpiC8Hde47sw
	RY5YXUhpPH2pXxf02qo2XZRsh3LXWZuo/QXCuEDFhYd6pAY671AsSaSvlmgtSHUsuwETlbAggwmw/
	zO+k5Ixpybb++wt2l+u2yE8udsi4Eg1fTxpPGr9jWeC1oandJyCT0cD+UepuA09IWuZCVdE8PH7wM
	UDYOmHkwnar6TH6Bzot03Zblg5GYkxkiVli7zphUUBF/a9SaHqwo07QUoXabdHHzV9lqwq0GluP3c
	wKd3SmuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYJKR-0000000GXRZ-086I;
	Wed, 24 Dec 2025 07:30:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYJKL-0000000GXNj-03kD;
	Wed, 24 Dec 2025 07:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766561429;
	bh=pV4PNUpZZSOyiYrDnysupRUAFKualbvc4cyd7FmaVdk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jFsW0pObzUo+yW4CAXx/y0sJgnzwCU9npOv5eO8a0h/JozBErOTft9yx5BKZlbP3A
	 WpwivJD8crBCjWvfB58AayPK8svC3yPW9AZZmG2qlMxv72oHfOXDC9CjeZ3+/aXb+K
	 0lxqcPUmEDw4T1bQgZGhb/J8d7xexaYT6B7yOAQBmbuw1XIv1xFWEd8/qp1IiSH8u9
	 hwOv4K5rmUp3sPaqlDh3Jbmfq9jovtiBKiiScFA8ZHer58c/K1v3S4OdXgmUMthLBL
	 y0Od/x7ozkk6xLGdZ2ZSEjIwAMl4lyatDBxCZXBtA9WjEcgBn6PU1GYcfviNLjaBO7
	 3CMgX4uXAdtXQ==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531:0:f337:3245:2545:b505])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1716F17E0CA3;
	Wed, 24 Dec 2025 08:30:29 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id BAA4511A3A2D5; Wed, 24 Dec 2025 08:30:28 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Wed, 24 Dec 2025 08:30:10 +0100
Subject: [PATCH 1/4] clk: mediatek: clk-mux: Add helper for muxes without
 UPD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mtk-not-a-gate-v1-1-d4667e3b7856@collabora.com>
References: <20251224-mtk-not-a-gate-v1-0-d4667e3b7856@collabora.com>
In-Reply-To: <20251224-mtk-not-a-gate-v1-0-d4667e3b7856@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jianhui Zhao <zhaojh329@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
 Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_233033_445130_C12E6CA5 
X-CRM114-Status: GOOD (  10.20  )
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

Not all muxes have an update register. This is already handled by the
driver when the upd_shift field is set negative. Add a small helper
macro to declare these muxes, without having to pass a bunch of -1's.

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
 drivers/clk/mediatek/clk-mux.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 151e56dcf884..1a385cdd00d0 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -126,6 +126,13 @@ extern const struct clk_ops mtk_mux_gate_hwv_fenc_clr_set_upd_ops;
 			0, _upd_ofs, _upd, CLK_SET_RATE_PARENT,		\
 			mtk_mux_clr_set_upd_ops)
 
+#define MUX_CLR_SET(_id, _name, _parents, _mux_ofs,			\
+		    _mux_set_ofs, _mux_clr_ofs, _shift, _width)	\
+		GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,	\
+			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
+			0, 0, -1, CLK_SET_RATE_PARENT,		\
+			mtk_mux_clr_set_upd_ops)
+
 #define MUX_GATE_HWV_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents,			\
 				_mux_ofs, _mux_set_ofs, _mux_clr_ofs,			\
 				_hwv_sta_ofs, _hwv_set_ofs, _hwv_clr_ofs,		\

-- 
2.51.0


