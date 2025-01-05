Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BABE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 18:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYt+s6fkrUpxe5XF17lxHByzQRCB3AxfRzKWTwCyBC0=; b=3i6jDE+2TG7p61rkrTxyrkyKXl
	D2oZjRHY2gvUFNiiruuTD1B+yyIWzYEucPiRKmEubKrCWU4XmT407teLfnbCd7NDwzTQlIHvYWv0O
	tua5Tn4uo84q18AMMDDMtljzXoAkfx3jiqGbNo+xqQBdfTco2P3boD5cj7Z0RLxuPzfDbEpYdDqiQ
	MM0B4JccOgdYuAfuHUCBOkB57KjkkLNaUaJCRp9VIHv6sIyWEX/T5LSTvddYaG9SqLHU6ToC/HTfi
	616TSeHdCLPEud6kmjMj0sf9QG/fMXHkZ8j2s9wSudQBRyV4jeNgA8AxqReRbq1Qk98aBF9QebUY3
	J7ySFyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUVI2-0000000HFr7-3mue;
	Sun, 05 Jan 2025 18:23:54 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUVA8-0000000HExh-1I9P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 18:15:45 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so1302830766b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 10:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736100942; x=1736705742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYt+s6fkrUpxe5XF17lxHByzQRCB3AxfRzKWTwCyBC0=;
        b=dg1iqYeap4I1/4CwOmLz2wqyXmfxV7ygsKy4PvVtwW2v2z76jTx9PQPExsV5bLLm3g
         JZvFhQW4ZI7BRhM8dx18RGBspza5usBdRDn9LmDo7sespreFmeKsUMUbMHrOpQMEJvni
         P0tGzqfe8CWiQU2+wTMQNsXFVLWRR/IdMpFjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736100942; x=1736705742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYt+s6fkrUpxe5XF17lxHByzQRCB3AxfRzKWTwCyBC0=;
        b=vjbMSI4zYAl8yJf0w20SiAbhFEIU9dBnwIZMs2RBYtJ/O5QJRPzswwxi9dHih/Cl4k
         zFsKLl9I2Ncw/xQ1V+S9g0LsJ9q/1nDAd0E0RA//kYvtiGcSouDRxqt4tS683qNeEC2C
         Hut+5GQvWenQR8cX65rCY+AHMDBnZU6xEnVkmB5Z6fIdvse90LYNAYHBW7WN6DI4yyH9
         tuBVkee6dajuDV8Ytymu+xP61nFmKmfj+H+m0P2MoekcAKlY6uOVFgYqbs+zx7XNO03Q
         TOunSovVQMGMA9qbmywi+UzZKmfpz0jDg0usbmF7nk/8RsHDHOgXN0YzM/+1wcJF1P6G
         njCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPJjDSds9GYh90CVbOWC/I5CpgHK7rLl5v8xhGgdIfuF7OtK6Vkn6zLcqZcfROHPgIZlSqPWm8cFe+kR86m1np@lists.infradead.org
X-Gm-Message-State: AOJu0YxwAqmAme8TIwKeU3AalFdu5aqzH83yXc1nIC3/EdpyUxP0FWnW
	SOFZzXCO9s1Dm486xkuK5cf0Sb9g52ZLwTgHSmkgU2NQGbtb20/EpjxPhPpA+XU=
X-Gm-Gg: ASbGncuQyJRaTx1UoNqPG69skijdraCZaA9QcejOD3CqTjpeFETUJn91B87QZA6odVp
	Y73XxR4vaF32pTTYHhrL+i2ap8pCZZzP4+Jj/ObXBqJvlufYqjtrdwpLBXxjm85iyAuuETNDGKb
	jRQjTZDZPB7zmwt39S0AzUCAUtCu7Yp77BHXkdV7UAqk38TnzF8OJ2ZpP0slSXAMqVfhYAuVAec
	6gGBthNEW2GdcGLLTUTeD5ECKDS5xJrQbfJmHcGNNOsuTBou4QmxCwk3dW/ORJhXXt22tsXrNCi
	FQOvPs9Ef3VOJVIjkPZky1uySWpgwmPCs3lIeAnnKDocbocKp6xMZhban3cCaBCYsQLXHbHLXGF
	cOrGX5570NaKgbnle8A==
X-Google-Smtp-Source: AGHT+IHKfniWL7KIZr5UBchy8RdTJDMipbRucCKrppnn1VBJEdWfGEKF6uqo/1J4HGrc00eEihpFhA==
X-Received: by 2002:a17:907:7e86:b0:aaf:ada2:181e with SMTP id a640c23a62f3a-aafada219d8mr879413566b.26.1736100942566;
        Sun, 05 Jan 2025 10:15:42 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 10:15:42 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 6/6] clk: stm32f4: support spread spectrum clock generation
Date: Sun,  5 Jan 2025 19:14:18 +0100
Message-ID: <20250105181525.1370822-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_101544_347698_A805F4C4 
X-CRM114-Status: GOOD (  17.29  )
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

Support spread spectrum clock generation for the main PLL, the only one
for which this functionality is available.

Tested on the STM32F469I-DISCO board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/clk/clk-stm32f4.c | 143 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index db1c56c8d54f..6c80c0dbb0a3 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -35,6 +35,7 @@
 #define STM32F4_RCC_APB2ENR		0x44
 #define STM32F4_RCC_BDCR		0x70
 #define STM32F4_RCC_CSR			0x74
+#define STM32F4_RCC_SSCGR		0x80
 #define STM32F4_RCC_PLLI2SCFGR		0x84
 #define STM32F4_RCC_PLLSAICFGR		0x88
 #define STM32F4_RCC_DCKCFGR		0x8c
@@ -42,6 +43,12 @@
 
 #define STM32F4_RCC_PLLCFGR_N_MASK	GENMASK(14, 6)
 
+#define STM32F4_RCC_SSCGR_SSCGEN	BIT(31)
+#define STM32F4_RCC_SSCGR_SPREADSEL	BIT(30)
+#define STM32F4_RCC_SSCGR_RESERVED_MASK	GENMASK(29, 28)
+#define STM32F4_RCC_SSCGR_INCSTEP_MASK	GENMASK(27, 13)
+#define STM32F4_RCC_SSCGR_MODPER_MASK	GENMASK(12, 0)
+
 #define NONE -1
 #define NO_IDX  NONE
 #define NO_MUX  NONE
@@ -512,6 +519,17 @@ static const struct clk_div_table pll_divr_table[] = {
 	{ 2, 2 }, { 3, 3 }, { 4, 4 }, { 5, 5 }, { 6, 6 }, { 7, 7 }, { 0 }
 };
 
+enum stm32f4_pll_ssc_mod_type {
+	STM32F4_PLL_SSC_CENTER_SPREAD,
+	STM32F4_PLL_SSC_DOWN_SPREAD,
+};
+
+struct stm32f4_pll_ssc {
+	unsigned int mod_freq;
+	unsigned int mod_depth;
+	enum stm32f4_pll_ssc_mod_type mod_type;
+};
+
 struct stm32f4_pll {
 	spinlock_t *lock;
 	struct	clk_gate gate;
@@ -519,6 +537,8 @@ struct stm32f4_pll {
 	u8 bit_rdy_idx;
 	u8 status;
 	u8 n_start;
+	bool ssc_enable;
+	struct stm32f4_pll_ssc ssc_conf;
 };
 
 #define to_stm32f4_pll(_gate) container_of(_gate, struct stm32f4_pll, gate)
@@ -541,6 +561,7 @@ struct stm32f4_vco_data {
 	u8 offset;
 	u8 bit_idx;
 	u8 bit_rdy_idx;
+	bool sscg;
 };
 
 static const struct stm32f4_vco_data  vco_data[] = {
@@ -661,6 +682,34 @@ static long stm32f4_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	return *prate * n;
 }
 
+static void stm32f4_pll_set_ssc(struct clk_hw *hw, unsigned long parent_rate,
+				unsigned int ndiv)
+{
+	struct clk_gate *gate = to_clk_gate(hw);
+	struct stm32f4_pll *pll = to_stm32f4_pll(gate);
+	struct stm32f4_pll_ssc *ssc = &pll->ssc_conf;
+	u32 modeper, incstep;
+	u32 sscgr;
+
+	sscgr = readl(base + STM32F4_RCC_SSCGR);
+	/* reserved field must be kept at reset value */
+	sscgr &= STM32F4_RCC_SSCGR_RESERVED_MASK;
+
+	modeper = DIV_ROUND_CLOSEST(parent_rate, 4 * ssc->mod_freq);
+	incstep = DIV_ROUND_CLOSEST(((1 << 15) - 1) * ssc->mod_depth * ndiv,
+				    5 * 10000 * modeper);
+	sscgr |= STM32F4_RCC_SSCGR_SSCGEN |
+		FIELD_PREP(STM32F4_RCC_SSCGR_INCSTEP_MASK, incstep) |
+		FIELD_PREP(STM32F4_RCC_SSCGR_MODPER_MASK, modeper);
+
+	if (ssc->mod_type)
+		sscgr |= STM32F4_RCC_SSCGR_SPREADSEL;
+
+	pr_debug("%s: pll: %s: modeper: %d, incstep: %d, sscgr: 0x%08x\n",
+		 __func__, clk_hw_get_name(hw), modeper, incstep, sscgr);
+	writel(sscgr, base + STM32F4_RCC_SSCGR);
+}
+
 static int stm32f4_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long parent_rate)
 {
@@ -683,6 +732,9 @@ static int stm32f4_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	writel(val, base + pll->offset);
 
+	if (pll->ssc_enable)
+		stm32f4_pll_set_ssc(hw, parent_rate, n);
+
 	if (pll_state)
 		stm32f4_pll_enable(hw);
 
@@ -788,6 +840,87 @@ static struct clk_hw *clk_register_pll_div(const char *name,
 	return hw;
 }
 
+static int stm32f4_pll_init_ssc(struct clk_hw *hw, struct stm32f4_pll_ssc *conf)
+{
+	struct clk_gate *gate = to_clk_gate(hw);
+	struct stm32f4_pll *pll = to_stm32f4_pll(gate);
+	struct clk_hw *parent;
+	unsigned long parent_rate;
+	int pll_state;
+	unsigned long n, val;
+
+	parent = clk_hw_get_parent(hw);
+	if (!parent) {
+		pr_err("%s: failed to get clock parent\n", __func__);
+		return -ENODEV;
+	}
+
+	parent_rate = clk_hw_get_rate(parent);
+
+	pll->ssc_enable = true;
+	memcpy(&pll->ssc_conf, conf, sizeof(pll->ssc_conf));
+
+	pll_state = stm32f4_pll_is_enabled(hw);
+
+	if (pll_state)
+		stm32f4_pll_disable(hw);
+
+	val = readl(base + pll->offset);
+	n = FIELD_GET(STM32F4_RCC_PLLCFGR_N_MASK, val);
+
+	pr_debug("%s: pll: %s, parent: %s, parent-rate: %lu, n: %lu\n",
+		 __func__, clk_hw_get_name(hw), clk_hw_get_name(parent),
+		 parent_rate, n);
+
+	stm32f4_pll_set_ssc(hw, parent_rate, n);
+
+	if (pll_state)
+		stm32f4_pll_enable(hw);
+
+	return 0;
+}
+
+static int stm32f4_pll_ssc_parse_dt(struct device_node *np,
+				    struct stm32f4_pll_ssc *conf)
+{
+	int ret;
+	const char *s;
+
+	if (!conf)
+		return -EINVAL;
+
+	ret = of_property_read_u32(np, "st,ssc-modfreq-hz", &conf->mod_freq);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(np, "st,ssc-moddepth-permyriad",
+				   &conf->mod_depth);
+	if (ret) {
+		pr_err("%pOF: missing st,ssc-moddepth-permyriad\n", np);
+		return ret;
+	}
+
+	ret = of_property_read_string(np, "st,ssc-modmethod", &s);
+	if (ret) {
+		pr_err("%pOF: missing st,ssc-modmethod\n", np);
+		return ret;
+	}
+
+	if (!strcmp(s, "down-spread")) {
+		conf->mod_type = STM32F4_PLL_SSC_DOWN_SPREAD;
+	} else if (!strcmp(s, "center-spread")) {
+		conf->mod_type = STM32F4_PLL_SSC_CENTER_SPREAD;
+	} else {
+		pr_err("%pOF: wrong value (%s) for fsl,ssc-modmethod\n", np, s);
+		return -EINVAL;
+	}
+
+	pr_debug("%pOF: SSCG settings: mod_freq: %d, mod_depth: %d mod_method: %s [%d]\n",
+		 np, conf->mod_freq, conf->mod_depth, s, conf->mod_type);
+
+	return 0;
+}
+
 static struct clk_hw *stm32f4_rcc_register_pll(const char *pllsrc,
 		const struct stm32f4_pll_data *data,  spinlock_t *lock)
 {
@@ -1695,7 +1828,8 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 	const struct of_device_id *match;
 	const struct stm32f4_clk_data *data;
 	unsigned long pllm;
-	struct clk_hw *pll_src_hw;
+	struct clk_hw *pll_src_hw, *pll_vco_hw;
+	struct stm32f4_pll_ssc ssc_conf;
 
 	base = of_iomap(np, 0);
 	if (!base) {
@@ -1754,8 +1888,8 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 	clk_hw_register_fixed_factor(NULL, "vco_in", pll_src,
 				     0, 1, pllm);
 
-	stm32f4_rcc_register_pll("vco_in", &data->pll_data[0],
-			&stm32f4_clk_lock);
+	pll_vco_hw = stm32f4_rcc_register_pll("vco_in", &data->pll_data[0],
+					      &stm32f4_clk_lock);
 
 	clks[PLL_VCO_I2S] = stm32f4_rcc_register_pll("vco_in",
 			&data->pll_data[1], &stm32f4_clk_lock);
@@ -1900,6 +2034,9 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 
 	of_clk_add_hw_provider(np, stm32f4_rcc_lookup_clk, NULL);
 
+	if (!stm32f4_pll_ssc_parse_dt(np, &ssc_conf))
+		stm32f4_pll_init_ssc(pll_vco_hw, &ssc_conf);
+
 	return;
 fail:
 	kfree(clks);
-- 
2.43.0


