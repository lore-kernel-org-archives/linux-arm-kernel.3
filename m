Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955DFCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkzAyC4/hQUC/YpyaL/Sypsk0z2p8M1mDK3uNiM+3Ms=; b=VsYnCEjvLyfTIOj/53v0/rg1Vp
	7jAmMoaFvabD3TGfbWrmD59K//kirXND2FCAhYveBifbe4LSM8rOlz0tAEom3XkpFUO6vxxPJveyS
	fvgTjFUP87GzpHquuV0MJXkTh2JEM+xhZ2+tP7OLtXAapJqfHcGmbsYD+Nrervn7NFaNp2G3zAjwo
	E3a7uaWTc0EO3O+yxuFt8PEnPef4N0ndvjHwe7nD7MYRD71YkzOOTDtGLQc+/gpLu7hYhHQK+CS+3
	ELwHbDehit6GnTqkfzKpp+8Ix+1Yw7p+Bc7nkxXlYOBgVvylTWHXlw3hISN8ViWKgwoOzK9Dm1EsT
	Q3ttiw4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwOq-00000005KeQ-0dsH;
	Fri, 29 Aug 2025 10:32:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvI0-000000057fR-38lD;
	Fri, 29 Aug 2025 09:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756459255;
	bh=bplvKw3zvmSnneQLtQiY4eCGKwGoRbO2yeH7My6SVlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dO7zWLoDF7Wjoof3UEyymABQW8yeheGV7vdz8i7uPVSHrggooV+1LaKG3okjIzeUI
	 y3ugdOZKoXQkCZLoW7huwH+zZ6uTOYWzwIrRusvgOk4yFxBkdw+Wy/nZHN6PN95Z+P
	 sCTXFoThP9PLFUGYAz76bIJgXLDalnu6YoX0mQcD4AqTr8zVq18wlaiWQQJkG02t+3
	 YcZGMscUCpuSG3mtpJhw2dYgeCVLxxSGoP/51e+koYS0cLSwcDaWWrlJRT7ZyZdxEx
	 eJ3MdqMe5JNJ9kiQfXZwIowrti1g4kXbSEz+WWrouDSZTL+lVU3w6k0E4gq3rikLcg
	 r1n77P0kFq9sQ==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:f5b1:db54:a11a:c333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0FB7E17E1259;
	Fri, 29 Aug 2025 11:20:54 +0200 (CEST)
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
Subject: [PATCH v5 01/27] clk: mediatek: clk-pll: Add set/clr regs for shared PLL enable control
Date: Fri, 29 Aug 2025 11:18:47 +0200
Message-Id: <20250829091913.131528-2-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829091913.131528-1-laura.nao@collabora.com>
References: <20250829091913.131528-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_022056_929263_1A1B3942 
X-CRM114-Status: GOOD (  10.34  )
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

On MT8196, there are set/clr registers to control a shared PLL enable
register. These are intended to prevent different masters from
manipulating the PLLs independently. Add the corresponding en_set_reg
and en_clr_reg fields to the mtk_pll_data structure.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 4 ++++
 drivers/clk/mediatek/clk-pll.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index ce453e1718e5..49ca25dd5418 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -308,6 +308,10 @@ struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
 		pll->en_addr = base + data->en_reg;
 	else
 		pll->en_addr = pll->base_addr + REG_CON0;
+	if (data->en_set_reg)
+		pll->en_set_addr = base + data->en_set_reg;
+	if (data->en_clr_reg)
+		pll->en_clr_addr = base + data->en_clr_reg;
 	pll->hw.init = &init;
 	pll->data = data;
 
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index 285c8db958b3..c4d06bb11516 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -47,6 +47,8 @@ struct mtk_pll_data {
 	const struct mtk_pll_div_table *div_table;
 	const char *parent_name;
 	u32 en_reg;
+	u32 en_set_reg;
+	u32 en_clr_reg;
 	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
 	u8 pcw_chg_bit;
 };
@@ -68,6 +70,8 @@ struct mtk_clk_pll {
 	void __iomem	*pcw_addr;
 	void __iomem	*pcw_chg_addr;
 	void __iomem	*en_addr;
+	void __iomem	*en_set_addr;
+	void __iomem	*en_clr_addr;
 	const struct mtk_pll_data *data;
 };
 
-- 
2.39.5


