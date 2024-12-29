Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D41E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzsVBhjhlmiF36sGbiHfZNPUdaBOg5gbMlUQSL+IAZc=; b=Aroj28XpXTcRAfYIeafnle0PbS
	Zk0PR7PKKYuqjvcCgu7nieYpd+EcorVSJ+62vp8zoQ4ldb1xDxerA0u+Hf6vAbBFwlXKSXh+PZIlf
	j1ZD3eCtvceMGRMhWz6mRTd8dOcVVm7wYGuufUAdORyyTd2he0DOigbNsHDhc9E0Nakm9K70E11Ap
	b6ugWJOvWvcAD7MVjgFWyZUDyMCm4btfPqaw+rG+LvA9/fdo/wcCfHQ3ETS2GfljCznWHmwSoX88E
	kP6pbi/AYV0QLmGySQE70e1k01qhn9MZMC3hty43wSEYbkHc1i0nQ8J7G8m39J5pHnXfpkzvxvPP+
	LU6tR5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRuxw-00000003YpS-0Y1X;
	Sun, 29 Dec 2024 15:12:28 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRudB-00000003W3y-0w6B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 14:51:02 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fdafso17216551a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 06:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483859; x=1736088659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzsVBhjhlmiF36sGbiHfZNPUdaBOg5gbMlUQSL+IAZc=;
        b=hzfThL4sejViwpkpuDJn0UeE9eMHWVj/p1QCvlZVNKJA9Vl3fUXBfnMgd2d51On+NI
         i8ghvrHvVFr/8JBW9dtEyh6VYAnzf1yIiyf2B+nvtyI1ZMP8XUxaqu6RbK5Ir2Xto4Yd
         AT6p80eIqNrKhVAmWJWkMy9ZhD6dvBy5CwgRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483859; x=1736088659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzsVBhjhlmiF36sGbiHfZNPUdaBOg5gbMlUQSL+IAZc=;
        b=QkjUNVMgGfHMr0O3YJE4qYCqvgJRLb9ULpZZgKy2yTwwGj0ewSw5Bn63YJvqm1KeFW
         NPP+h16yAXkg6lHDlcWDtZ3e3BPzCoRupoz63jaVHnQB4AUzmcoj/OLowEccN+8rr2SH
         cmM9OpFjWk53sje5Fo4msu7wR2abm6hmHEhXlCS8T9erSCeklNeE1/gc0rMdH9JQnBXR
         ymIlo0yTiNeTH8hI2zh4+rURCXO5kx9bv1DPJl4bjvW8Oa0mNoUM/9ad6NCk7+7riKno
         k4YeQMW7iKci2e7OGDWO8BQCg3BRMTZS0T791aCehporYwnhv+zX9s2YBb5pT+tzfQ6O
         b0og==
X-Forwarded-Encrypted: i=1; AJvYcCU8RySr0F7LjvLh5l/5nDEeVHcwnfkUwqiKc8zwMGNkk5oG/DW4RouydG/4H6jD1WAm+cmHw3yMhWf9I8y+qu77@lists.infradead.org
X-Gm-Message-State: AOJu0YzdcKoxv/rGV9TIjWxdzX3udsSAVOBxnz3dleny22xfEy82+Ybi
	Eaa3IYm1bU8nUdckyfuPk+OUoWeRJXUWAtigOU+jTXGGo95Q+MvntSPCWg7OrXA=
X-Gm-Gg: ASbGncub/A9veXm6fO+RIZ4iroci/G2E5E38l24hJQn68vXX81f+GPySpaytYma/b78
	SqHt6VMIp5l153hfCdbRv3WY9lsk97Ru2Xwos9ZSON7B7+xEAsE3dGnP1YqcVZss7ZtzzEth4vV
	UqSOO3/VuWcMbT+ddgsJD/1J2EMrZ/qReXDYaJqbRVPPHynVPzi9QwHGWNMNffl0cxJppFoAdK7
	niNW0U6yp601UHXk7ozE5Jk1yYG9Uo8MilSms/Zu4axY/dys8uE24CZU8veX6oyUubFL6kDfrYg
	qmliuaxzgPG/551dvKm0Qw==
X-Google-Smtp-Source: AGHT+IGonlEnl0JiDrA5A72iBC8cUxm0T3+II8EAxliL06cYdXrClqNNSpQCBZm7+nUKIwPGFzUbWQ==
X-Received: by 2002:a17:906:f598:b0:aae:c3c1:1361 with SMTP id a640c23a62f3a-aaec3c1186fmr2529063966b.44.1735483859533;
        Sun, 29 Dec 2024 06:50:59 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:59 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v8 17/18] clk: imx: pll14xx: support spread spectrum clock generation
Date: Sun, 29 Dec 2024 15:49:41 +0100
Message-ID: <20241229145027.3984542-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_065101_273091_7CBF2982 
X-CRM114-Status: GOOD (  19.36  )
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

Add support for spread spectrum clock (SSC) generation to the pll14xxx
driver.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---

(no changes since v7)

Changes in v7:
- Add 'Reviewed-by' tag of Peng Fan

Changes in v6:
- Update the code based on the changes made to the DT bindings

 drivers/clk/imx/clk-pll14xx.c | 134 ++++++++++++++++++++++++++++++++++
 drivers/clk/imx/clk.h         |  16 ++++
 2 files changed, 150 insertions(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index d63564dbb12c..c20f1ade9dff 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -20,6 +20,8 @@
 #define GNRL_CTL	0x0
 #define DIV_CTL0	0x4
 #define DIV_CTL1	0x8
+#define SSCG_CTRL	0xc
+
 #define LOCK_STATUS	BIT(31)
 #define LOCK_SEL_MASK	BIT(29)
 #define CLKE_MASK	BIT(11)
@@ -31,6 +33,10 @@
 #define KDIV_MASK	GENMASK(15, 0)
 #define KDIV_MIN	SHRT_MIN
 #define KDIV_MAX	SHRT_MAX
+#define SSCG_ENABLE	BIT(31)
+#define MFREQ_CTL_MASK	GENMASK(19, 12)
+#define MRAT_CTL_MASK	GENMASK(9, 4)
+#define SEL_PF_MASK	GENMASK(1, 0)
 
 #define LOCK_TIMEOUT_US		10000
 
@@ -40,6 +46,8 @@ struct clk_pll14xx {
 	enum imx_pll14xx_type		type;
 	const struct imx_pll14xx_rate_table *rate_table;
 	int rate_count;
+	bool                            ssc_enable;
+	struct imx_pll14xx_ssc		ssc_conf;
 };
 
 #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
@@ -347,6 +355,27 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static void clk_pll1443x_enable_ssc(struct clk_hw *hw, unsigned long parent_rate,
+				    unsigned int pdiv, unsigned int mdiv)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+	struct imx_pll14xx_ssc *conf = &pll->ssc_conf;
+	u32 sscg_ctrl, mfr, mrr;
+
+	sscg_ctrl = readl_relaxed(pll->base + SSCG_CTRL);
+	sscg_ctrl &=
+		~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK | SEL_PF_MASK);
+
+	mfr = parent_rate / (conf->mod_freq * pdiv * (1 << 5));
+	mrr = (conf->mod_rate * mdiv * (1 << 6)) / (100 * mfr);
+
+	sscg_ctrl |= SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
+		FIELD_PREP(MRAT_CTL_MASK, mrr) |
+		FIELD_PREP(SEL_PF_MASK, conf->mod_type);
+
+	writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
+}
+
 static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 				 unsigned long prate)
 {
@@ -368,6 +397,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
+		if (pll->ssc_enable)
+			clk_pll1443x_enable_ssc(hw, prate, rate.pdiv, rate.mdiv);
+
 		return 0;
 	}
 
@@ -408,6 +440,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	gnrl_ctl &= ~BYPASS_MASK;
 	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
 
+	if (pll->ssc_enable)
+		clk_pll1443x_enable_ssc(hw, prate, rate.pdiv, rate.mdiv);
+
 	return 0;
 }
 
@@ -542,3 +577,102 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 	return hw;
 }
 EXPORT_SYMBOL_GPL(imx_dev_clk_hw_pll14xx);
+
+void imx_clk_pll14xx_enable_ssc(struct clk_hw *hw, struct imx_pll14xx_ssc *conf)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+
+	pll->ssc_enable = true;
+	memcpy(&pll->ssc_conf, conf, sizeof(pll->ssc_conf));
+}
+EXPORT_SYMBOL_GPL(imx_clk_pll14xx_enable_ssc);
+
+static int clk_pll14xx_ssc_mod_type(const char *name,
+				    enum imx_pll14xx_ssc_mod_type *mod_type)
+{
+	int i;
+	struct {
+		const char *name;
+		enum imx_pll14xx_ssc_mod_type id;
+	} mod_types[] = {
+		{ .name = "down-spread", .id = IMX_PLL14XX_SSC_DOWN_SPREAD },
+		{ .name = "up-spread", .id = IMX_PLL14XX_SSC_UP_SPREAD },
+		{ .name = "center-spread", .id = IMX_PLL14XX_SSC_CENTER_SPREAD }
+	};
+
+	for (i = 0; i < ARRAY_SIZE(mod_types); i++) {
+		if (!strcmp(name, mod_types[i].name)) {
+			*mod_type = mod_types[i].id;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int clk_pll14xx_ssc_index(const char *pll_name)
+{
+	static const char *const pll_names[] = {
+		"audio_pll1",
+		"audio_pll2",
+		"dram_pll",
+		"video_pll"
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pll_names); i++) {
+		if (!strcmp(pll_names[i], pll_name))
+			return i;
+	}
+
+	return -ENODEV;
+}
+
+int imx_clk_pll14xx_ssc_parse_dt(struct device_node *np, const char *pll_name,
+				 struct imx_pll14xx_ssc *conf)
+{
+	int index, ret;
+	const char *s;
+
+	if (!conf)
+		return -EINVAL;
+
+	index = clk_pll14xx_ssc_index(pll_name);
+	if (index < 0)
+		return index;
+
+	ret = of_property_read_u32_index(np, "fsl,ssc-modfreq-hz", index,
+					 &conf->mod_freq);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32_index(np, "fsl,ssc-modrate-percent", index,
+					 &conf->mod_rate);
+	if (ret) {
+		pr_err("missing fsl,ssc-modrate-percent property for %pOFn\n",
+		       np);
+		return ret;
+	}
+
+	ret = of_property_read_string_index(np, "fsl,ssc-modmethod", index, &s);
+	if (ret) {
+		pr_err("failed to get fsl,ssc-modmethod property for %pOFn\n",
+		       np);
+		return ret;
+	}
+
+	if (strlen(s) == 0)
+		return -ENODEV;
+
+	ret = clk_pll14xx_ssc_mod_type(s, &conf->mod_type);
+	if (ret) {
+		pr_err("wrong fsl,ssc-modmethod property for %pOFn\n", np);
+		return ret;
+	}
+
+	pr_debug("%s: SSC %s settings: mod_freq: %d, mod_rate: %d: mod_method: %s [%d]\n",
+		__func__, pll_name, conf->mod_freq, conf->mod_rate, s, conf->mod_type);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(imx_clk_pll14xx_ssc_parse_dt);
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 50e407cf48d9..38e4a4cf253d 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -69,6 +69,18 @@ struct imx_pll14xx_clk {
 	int flags;
 };
 
+enum imx_pll14xx_ssc_mod_type {
+	IMX_PLL14XX_SSC_DOWN_SPREAD,
+	IMX_PLL14XX_SSC_UP_SPREAD,
+	IMX_PLL14XX_SSC_CENTER_SPREAD,
+};
+
+struct imx_pll14xx_ssc {
+	unsigned int mod_freq;
+	unsigned int mod_rate;
+	enum imx_pll14xx_ssc_mod_type mod_type;
+};
+
 extern struct imx_pll14xx_clk imx_1416x_pll;
 extern struct imx_pll14xx_clk imx_1443x_pll;
 extern struct imx_pll14xx_clk imx_1443x_dram_pll;
@@ -489,4 +501,8 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 
 struct clk_hw *imx_anatop_get_clk_hw(struct device_node *np, int id);
 
+void imx_clk_pll14xx_enable_ssc(struct clk_hw *hw, struct imx_pll14xx_ssc *conf);
+int imx_clk_pll14xx_ssc_parse_dt(struct device_node *np, const char *pll_name,
+				 struct imx_pll14xx_ssc *conf);
+
 #endif
-- 
2.43.0


