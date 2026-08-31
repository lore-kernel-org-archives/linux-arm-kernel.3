Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D00CC624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/h+0+I7fXQ52AgonO29/UsUwGiBzhMLYBL0Aiheh2c=; b=LHY6mNd9BvMuqsInMzSorY+9YV
	3OmfR8pINWfjJpchoTUO9zOec6BXHR3yOJLTdGxf72w4P4uU6CbSluk/yr6mbZnVZeQQuths+b9tL
	r9qcEDPizDm0OE/QyeCSQ+LpexqtyQnKurkOnUdoPxdWXQCChMOcrO/0Osnbrs0l3A0qw5vfMaJsf
	ljJ95538P1MFg23jOjU0JqJ4Wi1Fs6zApDI3CJnpacU912+LMhLRkK7gK5Gnn1BubaE8Rxn00OPhA
	zriTbWvGWmTaDlb8V5hmum2qgjlgUxbSw+nh4YzsRG95kgOQb7mO7Q6+FOr6tqhe6NQqmcR7pVdCI
	GXP8ZySg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14FB-00000009vNP-05P0;
	Mon, 31 Aug 2026 15:48:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14F5-00000009vLD-083Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 15:48:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso5046975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 08:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788191293; x=1788796093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/h+0+I7fXQ52AgonO29/UsUwGiBzhMLYBL0Aiheh2c=;
        b=pgMAfb9ZC1qn+s381XpJFoA801vCjNoNcbXRqalSN9mIn40OrBjFOv0qr/xGOm27Zb
         QnuhXaYVs8uJSIyrwlC4q3aNQXCsbPJTa1xIOCAXlG8XLNH32ZxwXzjft4AQ6TsGK2to
         mmx21rLAFuDS22SQG2uYTkT9ftRMAcQJAktO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191293; x=1788796093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N/h+0+I7fXQ52AgonO29/UsUwGiBzhMLYBL0Aiheh2c=;
        b=MnEKoCjOvXGcLRp9r1I6s+hLqgxf6hQtBu4fX6P8mp8G/WW7M5Z+3OQJayrBGI07Sx
         LQQxXEOUnU9+UHZqV18JAXGNKdfJG2MqG4j4rTyL+6q3slMPqNbm8OeRaVwEbsFE2sP8
         kQ53L53Fu/Ji1ic/bifjCszq49LjUgxpIsyDHanUDbkOyCvrDvhWDjIeNjDutnF5byBd
         2xMawu/F4bKPkzjSPloKdSPAgvTlnHZDEwFoTTxjTC4QBoUL+WtieAAQCWTh/DPcpcmj
         E4shauDqaNL2rNBOwgOCiPxDYsNrldb03CKxzH8p8hsSPkqDnTYb9rhP1RIiJIlKlSif
         o5ug==
X-Forwarded-Encrypted: i=1; AHgh+RrKabpJEZqJj5pIZj7vvQL4KXyQVbXDySsBHFEqJC6zBOguBCxu4MdQtLD8WxQ6ZPrwL9Pg89vRj7nRq5Dvavky@lists.infradead.org
X-Gm-Message-State: AFuF++kLzb74q0qqfuHnwvgKu4jLLfQrZLDYiojbgIg72SsuV1wGmoEo
	m1dm6H5NbB1v4AeOpLv9nkcVj/OXF8skiwfT1T/2Wuc86jqth/0Vz1rDNKqzVgMyH7I=
X-Gm-Gg: AR+sD1202kk3sRBmEA9hGC9X3edIBZ4itOGtUBq2WI50eOlufXBpFZTgjSvSJixqdtr
	MzcZj1/enhHBgAO8hhRnYKXNTQnm3vppFXBI/lwRrNlNxWkjDkPWTLb1QtfHjdWa77zln/7VajR
	MR6CkpXVN2amNkV1ZXCiMGenNznJ/UTY+cLe6J3RJ3G42CDIPfaqJLhpl5gfOeNmB8BGqCqYx7p
	98PfRUuQJQ8Bu3Pf7O4Cnc8VD9gWZz4sTwJ20kBApkg8wQVtumz7paFImswJRf2tdRcWOloDSvk
	TMuXg93hQuP3Vk5K9DF1wipirMBkym5NrKMiXE3jareeJ9dwbuyzYHGPmrIRWeMkzXme68zoct5
	zV//tK3Zo4ksXZV/fgjoFsY+D3Fbt17bPq0ZqFC4uEakbNHbhyJAi4eV/UHKdoOgempj44SW6W8
	pn88UUV2JgRqJCVVoPipKpuYAPpUa6rqJOhrIonBqhWOda/4iUmIFTTKZhG8e3o3/O8qBepv9uz
	e7wxJwNqaOsbCi+uMrSkImd9rvFficO7PnFOrs+1ZBXE/Rpb245HVZNzKF+QWnh5I24QsxnEgFc
	MWdoFFDm7nxhas56WO/0D5hO6ekz0gR4r9YzEATXLflU/tueeRTUqx3JdCnV
X-Received: by 2002:a05:600c:4e01:b0:49c:cedc:768a with SMTP id 5b1f17b1804b1-49ccedc76a1mr324658675e9.16.1788191293295;
        Mon, 31 Aug 2026 08:48:13 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9269f1b6sm220191845e9.4.2026.08.31.08.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:48:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 1/1] clk: imx: pll14xx: support spread spectrum clock generation
Date: Mon, 31 Aug 2026 17:27:01 +0200
Message-ID: <20260831154752.15401-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831154752.15401-1-dario.binacchi@amarulasolutions.com>
References: <20260831154752.15401-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_084815_110087_79B6389D 
X-CRM114-Status: GOOD (  17.11  )
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

Add support for spread spectrum clock (SSC) generation to the pll14xx
driver.

Tested on the video PLL of i.MX8MN and i.MX8MP based boards.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v10:
- Drop 'Reviewed-by' tag of Peng Fan.
- Adapt the driver to the new infrastructure. Implement the
  set_spread_spectrum() and get the modulation parameters from
  struct clk_spread_spectrum.

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan.

 drivers/clk/imx/clk-pll14xx.c | 58 +++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index b6f1cc9f5700..27a637847f57 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt) "pll14xx: " fmt
 
+#include <dt-bindings/clock/clock.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
@@ -22,6 +23,8 @@
 #define GNRL_CTL	0x0
 #define DIV_CTL0	0x4
 #define DIV_CTL1	0x8
+#define SSCG_CTRL	0xc
+
 #define LOCK_STATUS	BIT(31)
 #define LOCK_SEL_MASK	BIT(29)
 #define CLKE_MASK	BIT(11)
@@ -33,6 +36,13 @@
 #define KDIV_MASK	GENMASK(15, 0)
 #define KDIV_MIN	SHRT_MIN
 #define KDIV_MAX	SHRT_MAX
+#define SSCG_ENABLE	BIT(31)
+#define MFREQ_CTL_MASK	GENMASK(19, 12)
+#define MRAT_CTL_MASK	GENMASK(9, 4)
+#define SEL_PF_DOWN_SPREAD	0
+#define SEL_PF_UP_SPREAD	1
+#define SEL_PF_CENTER_SPREAD	2
+#define SEL_PF_MASK	GENMASK(1, 0)
 
 #define LOCK_TIMEOUT_US		10000
 
@@ -44,6 +54,7 @@ struct clk_pll14xx {
 	int rate_count;
 	s16 delta_k;
 	spinlock_t lock;
+	struct clk_spread_spectrum ss_conf;
 };
 
 #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
@@ -366,6 +377,37 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static void __clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
+					       unsigned long parent_rate,
+					       unsigned int pdiv,
+					       unsigned int mdiv)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+	struct clk_spread_spectrum *conf = &pll->ss_conf;
+	u32 sscg_ctrl, mfr, mrr, sel_pf;
+
+	if (conf->method == CLK_SSC_CENTER_SPREAD)
+		sel_pf = SEL_PF_CENTER_SPREAD;
+	else if (conf->method == CLK_SSC_UP_SPREAD)
+		sel_pf = SEL_PF_UP_SPREAD;
+	else if (conf->method == CLK_SSC_DOWN_SPREAD)
+		sel_pf = SEL_PF_DOWN_SPREAD;
+	else
+		return;
+
+	sscg_ctrl = readl_relaxed(pll->base + SSCG_CTRL);
+	sscg_ctrl &= ~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK | SEL_PF_MASK);
+
+	mfr = parent_rate / (conf->modfreq_hz * pdiv * BIT(5));
+	mrr = (conf->spread_bp * mdiv * BIT(6)) / (10000 * mfr);
+
+	sscg_ctrl |= SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
+		FIELD_PREP(MRAT_CTL_MASK, mrr) |
+		FIELD_PREP(SEL_PF_MASK, sel_pf);
+
+	writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
+}
+
 static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 				 unsigned long prate)
 {
@@ -390,6 +432,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
+		__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv,
+						   rate.mdiv);
+
 		spin_unlock_irqrestore(&pll->lock, flags);
 
 		return 0;
@@ -411,6 +456,8 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base + DIV_CTL1);
 
+	__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv, rate.mdiv);
+
 	spin_unlock_irqrestore(&pll->lock, flags);
 
 	/*
@@ -437,6 +484,16 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static int clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
+					    const struct clk_spread_spectrum *ss_conf)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+
+	memcpy(&pll->ss_conf, ss_conf, sizeof(pll->ss_conf));
+
+	return 0;
+}
+
 static int clk_pll14xx_prepare(struct clk_hw *hw)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
@@ -509,6 +566,7 @@ static const struct clk_ops clk_pll1443x_ops = {
 	.recalc_rate	= clk_pll14xx_recalc_rate,
 	.determine_rate = clk_pll1443x_determine_rate,
 	.set_rate	= clk_pll1443x_set_rate,
+	.set_spread_spectrum = clk_pll1443x_set_spread_spectrum,
 };
 
 struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
-- 
2.43.0


