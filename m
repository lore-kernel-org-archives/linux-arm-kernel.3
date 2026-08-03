Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093BFC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 17:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65tLrBmDcrjX0P/kWTBoZe536eu486JrEmAUPZ6dfSY=; b=bzRwa+h5u0gxEKx80KDxQ5xFeZ
	+YR3FnXaxCFR7SZyODNLma6FBPVSiazEYbAoq91FMxzxGCUimzHPFm7VDNKQL70yk6CSqn8Ikdl9I
	kWEvg8aj4TdI05+455oh+Lq/l2E5gybOWr5kllhwA6a1QQZjloI/eluoexqXJRRqRHkHnMjZNmRMW
	m9NUjkMJVXTPZ7/aroSm5W8a0CufX7grg3iUA0eJPxxzq3BTAz/e4eH9PG7RhNoCOcLRxsROTYAsw
	d8zABL7WzyrUCxTeNjZbB3G7VuJKi3sfIAgInJYnUFwYXvkp3t69NUVZTlMvt07vgM0oewqAHXP55
	ldJGIyZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGA-000000001lb-09uE;
	Mon, 03 Aug 2026 16:11:26 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvG7-000000001hq-0S0V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:11:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49553515a8bso36277495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773481; x=1786378281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=65tLrBmDcrjX0P/kWTBoZe536eu486JrEmAUPZ6dfSY=;
        b=gCHUSGNn0glASZvptbYQDB7xqi0C1zVwR2SgUwMxthxZMpPTbLZgMTAvEuxKlnImZR
         PACZQAK/wGtIweoMH77vrljZo1ORQExVJNaMfE/s36YhQ/POvoDg1qQW8UueCfwsPVOV
         B2WBDk1FEYmkO/oLZFigXJ+WvGDcn7ujvlGE1LjEfhB/6lYmOccfsX91UKNDy8bu6x1o
         XhUU3E3Ck0YcUC1lB0SHRowJ3gD7fbiqbajmIJ2S/W50CfSzV+0v/ewjg2eJN0Rv/oyE
         Z51B156KpgKRic4t2GeJ7kEgHg8IgvVwNjCVp+luiMvrS0jTf7pKu90pG1/hvPoMZbuE
         tnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773481; x=1786378281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=65tLrBmDcrjX0P/kWTBoZe536eu486JrEmAUPZ6dfSY=;
        b=n1LUPYo8jCadns7tuPZaKOVVJ9IgfNYYs+UO+DnOk675iGiTklXWK7aDDW+lj+URis
         wVHVLRNjpkuuh8KDfyMRAvw3pOUwqJshCsttcsHfX5kEvkUcOC70RMyCn/3XQE0Hhjdq
         XHibqlj3eabPLzY8AQvcxMzFX0EakKwKtjQGcGwU02BCkXe+djCLIWnsfYtkxiHt0RPv
         9fnXe+NsNwCYTIofUItjvx1zbJonbL/pkA2yE7jxvNgWMeDBxKxGBxp/avtiVBON6Emk
         qpO5pvhfgA1+ZRmyUu6qW9QBPSnaBku0ezbeEc+YjxeoqqaT3NNqclrXhigNnOz1y6+F
         WGbQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCCWyVdq/J2wcu3BpdOTUVdX6wVAVpvioccK29HB0U4eX4RqLqUPTFPMN699tYdmUd02hrmtnj2IKcYtbcDAxS@lists.infradead.org
X-Gm-Message-State: AOJu0YzJqBxJTGejygrtrqwYUkjTCdFfLeb73tUoFN3zH3yUCt7deHlB
	u5bwYK6TI/eYbKVv3Oz4iF/ln8g/7GqSC355N2Axlkl1hT7mY3SxjjHo
X-Gm-Gg: AR+sD12B6B4YvVk8ipq0F9XosEBH+BrcITMi/CwPBRosFGmfIXo5rJP9KPDwPExI0n7
	sULuGbVFVx5PJ4lq8jGiYK9kdOZogzhJsok12pLQRa57+r/ffVonJSd/MeKevIc3zb2TLJ8/RVZ
	0UoG9Cgr3Gt3CYKch+ivmHhq7m3yqqtJ8JqCezJJbd72y8tk1TMpnFllxJXs3UdBX8LFTkLVT4l
	MSGhBm3J+s68ToLo6+Skdp7QW5Dr5BKKl6BEMWircwB/D/nrCiI8lk37LOnP287dEiz55mVcjF6
	PbmIdTTkrHXJK/ajS9avaS9+lF8SKMa9o7aWZoXySS/GVFmQesQtMkhG9JZI53kiN+YVzAytD6k
	x3OWhvNDHnPHUG8PuSTSRD5QFd+XKt3o6iRkdjm2yYtgoUxFWcfh89lniRqbpAQQQFg3Q8aN8e5
	S7ud0yXMQcIbjsGfk/bYerNYO65z4dcnD7Cl+ocoUY2MlBsaFpxMQrjbHKMoY755pcJ9EHmeXV/
	+PK1g0W9ok2XjkQ9uSY31w4NOdB5nLZ6eMIsdKMTRK4P8229mxjxqTMICFG7WblTvtjHFCyT5hL
	nNc5Pi0sxtJIzxWRvNAGllGg6v7pw3FUFgtRsTmaqOqoSnwTuQJlLEyEaIXilVLulhKTbil4di3
	Rdaqx9af1slmPmkE3JM+2btigswJcw1cP8lGs2c4HB3yBDwk1kFidbiPerS8f7x7js4VbSNwRG6
	bliw==
X-Received: by 2002:a05:600c:19cf:b0:495:7a04:b006 with SMTP id 5b1f17b1804b1-4980c66b572mr227085475e9.8.1785773480944;
        Mon, 03 Aug 2026 09:11:20 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:20 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 04/13] drm/sun4i: tcon-top: Keep mixer routes distinct
Date: Mon,  3 Aug 2026 18:10:42 +0200
Message-ID: <52eb247169b268054302afa71e598add0b04748d.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_091123_260250_1063FFBA 
X-CRM114-Status: GOOD (  20.91  )
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

Both mixer selectors reset to TCON 0. Selecting the same TCON for both
mixers causes black or corrupted output.

When a route would collide, park the other mixer on another described
TCON, or an unused selector if none exists.

Since the TCON index is now used as a shift, also reject negative
values.

Tested on Orange Pi 3 with TCON_LCD0 and TCON_TV0.

Link: https://lore.kernel.org/linux-sunxi/Zn8GVkpwXwhaUFno@titan/
Link: https://lore.kernel.org/linux-sunxi/20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org/
Fixes: 05db311a792d ("drm/sun4i: tcon-top: Add helpers for mux switching")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 71 +++++++++++++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_tcon_top.h |  6 +++
 2 files changed, 65 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 8adda578c51b..9cbd655518b2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -25,6 +25,49 @@ static bool sun8i_tcon_top_node_is_tcon_top(struct device_node *node)
 	return !!of_match_node(sun8i_tcon_top_of_table, node);
 }
 
+static unsigned int sun8i_tcon_top_get_tcon_map(struct device_node *node)
+{
+	static const u32 out_ports[] = {
+		TCON_TOP_MIXER0_OUT_PORT,
+		TCON_TOP_MIXER1_OUT_PORT,
+	};
+	unsigned int i, map = 0;
+
+	for (i = 0; i < ARRAY_SIZE(out_ports); i++) {
+		struct device_node *port;
+
+		port = of_graph_get_port_by_id(node, out_ports[i]);
+		if (!port)
+			continue;
+
+		for_each_of_graph_port_endpoint(port, ep) {
+			struct of_endpoint endpoint;
+
+			if (of_graph_parse_endpoint(ep, &endpoint))
+				continue;
+
+			if (endpoint.id < TCON_TOP_PORT_TCON_NUM)
+				map |= BIT(endpoint.id);
+		}
+
+		of_node_put(port);
+	}
+
+	return map;
+}
+
+static unsigned int sun8i_tcon_top_park_index(struct sun8i_tcon_top *tcon_top,
+					      int tcon)
+{
+	unsigned int candidates;
+
+	candidates = tcon_top->tcon_map & ~BIT(tcon);
+	if (!candidates)
+		candidates = GENMASK(TCON_TOP_PORT_TCON_NUM - 1, 0) & ~BIT(tcon);
+
+	return ffs(candidates) - 1;
+}
+
 int sun8i_tcon_top_set_hdmi_src(struct device *dev, int tcon)
 {
 	struct sun8i_tcon_top *tcon_top = dev_get_drvdata(dev);
@@ -57,6 +100,7 @@ EXPORT_SYMBOL(sun8i_tcon_top_set_hdmi_src);
 int sun8i_tcon_top_de_config(struct device *dev, int mixer, int tcon)
 {
 	struct sun8i_tcon_top *tcon_top = dev_get_drvdata(dev);
+	u32 mixer_msk, other_msk;
 	unsigned long flags;
 	u32 reg;
 
@@ -70,21 +114,27 @@ int sun8i_tcon_top_de_config(struct device *dev, int mixer, int tcon)
 		return -EINVAL;
 	}
 
-	if (tcon > 3) {
-		dev_err(dev, "TCON index is too high!\n");
+	if (tcon < 0 || tcon >= TCON_TOP_PORT_TCON_NUM) {
+		dev_err(dev, "TCON index is invalid!\n");
 		return -EINVAL;
 	}
 
+	mixer_msk = mixer ? TCON_TOP_PORT_DE1_MSK : TCON_TOP_PORT_DE0_MSK;
+	other_msk = mixer ? TCON_TOP_PORT_DE0_MSK : TCON_TOP_PORT_DE1_MSK;
+
 	spin_lock_irqsave(&tcon_top->reg_lock, flags);
 
 	reg = readl(tcon_top->regs + TCON_TOP_PORT_SEL_REG);
-	if (mixer == 0) {
-		reg &= ~TCON_TOP_PORT_DE0_MSK;
-		reg |= FIELD_PREP(TCON_TOP_PORT_DE0_MSK, tcon);
-	} else {
-		reg &= ~TCON_TOP_PORT_DE1_MSK;
-		reg |= FIELD_PREP(TCON_TOP_PORT_DE1_MSK, tcon);
+
+	reg &= ~mixer_msk;
+	reg |= field_prep(mixer_msk, tcon);
+
+	if (field_get(other_msk, reg) == tcon) {
+		reg &= ~other_msk;
+		reg |= field_prep(other_msk,
+				  sun8i_tcon_top_park_index(tcon_top, tcon));
 	}
+
 	writel(reg, tcon_top->regs + TCON_TOP_PORT_SEL_REG);
 
 	spin_unlock_irqrestore(&tcon_top->reg_lock, flags);
@@ -143,6 +193,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 		return -ENOMEM;
 	clk_data->num = CLK_NUM;
 	tcon_top->clk_data = clk_data;
+	tcon_top->tcon_map = sun8i_tcon_top_get_tcon_map(dev->of_node);
 
 	spin_lock_init(&tcon_top->reg_lock);
 
@@ -175,10 +226,6 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 		goto err_assert_reset;
 	}
 
-	/*
-	 * At least on H6, some registers have some bits set by default
-	 * which may cause issues. Clear them here.
-	 */
 	writel(0, regs + TCON_TOP_PORT_SEL_REG);
 	writel(0, regs + TCON_TOP_GATE_SRC_REG);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.h b/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
index 0390584a330e..2b887470a49f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.h
@@ -14,6 +14,10 @@
 #define TCON_TOP_PORT_SEL_REG		0x1C
 #define TCON_TOP_PORT_DE0_MSK			GENMASK(1, 0)
 #define TCON_TOP_PORT_DE1_MSK			GENMASK(5, 4)
+#define TCON_TOP_PORT_TCON_NUM			4
+
+#define TCON_TOP_MIXER0_OUT_PORT		1
+#define TCON_TOP_MIXER1_OUT_PORT		3
 
 #define TCON_TOP_GATE_SRC_REG		0x20
 #define TCON_TOP_HDMI_SRC_MSK			GENMASK(29, 28)
@@ -29,6 +33,8 @@ struct sun8i_tcon_top {
 	void __iomem			*regs;
 	struct reset_control		*rst;
 
+	unsigned int			tcon_map;
+
 	/*
 	 * spinlock is used to synchronize access to same
 	 * register where multiple clock gates can be set.
-- 
2.43.0


