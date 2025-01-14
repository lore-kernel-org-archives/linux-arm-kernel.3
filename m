Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34323E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 09:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUkrlqyJMSue4T39ZMAvPFJocT8wJ7xje6FDMMbnAa0=; b=ysNiwNbfYwsm6ytF72Iuhpmzy5
	sIqNfWob8oxvMFsTmHyC6kVDrQnPMWz0FsK2da5V7spRdOoj6R3dosRIS60W1zzTehmW7g7dr679V
	zXZ0KJv+41N7PhB2Ge7A6gjQ0l4bJamDmhgOUSnBfajSMqTtnKu98dOr25eEFB51WTqjJHYQG7iYL
	i8jy+CsQFzeP/BeCcEn+VfwmPe0kXpLON+C2IPqb+b0V5vyw+Qcye2jZmn+UBqkAKvwVJ2NNhmWuY
	QdpRuQuaDnAN+msDYPoh4VhVVh71p1Gi4S/GcEBAHJRpVo2dv/HydKC3ZaS5ts8vgYg2fZC+7UiAj
	I1lvaHxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXd56-00000007w3m-1zHG;
	Tue, 14 Jan 2025 09:19:28 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcxX-00000007v2W-3po6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 09:11:41 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa67333f7d2so800326866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 01:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736845898; x=1737450698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUkrlqyJMSue4T39ZMAvPFJocT8wJ7xje6FDMMbnAa0=;
        b=nPz1azlHFPVOsJgIN0ifRAEXMibIUeWlEbEqh5y2kVlScFbpcxYK7OGpPv1JOdGqDV
         eCjhAIUFk+jZvcraq1qP+3AhLaiOoXM6Dn0mgKtSlRPCnPpq6UPdn5Bu/RDj93Edfyqn
         vTA86/S1RcQ20oAx3ogq4T7r4LfKqnbya7y4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736845898; x=1737450698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUkrlqyJMSue4T39ZMAvPFJocT8wJ7xje6FDMMbnAa0=;
        b=dG69lh/vsAUKH1y8LSwnnfiUkKIoKGGWJrzcVCam+W+/hIDKDvenUGeGNLRl0DvoIU
         5mX4VUufVdNj+GL0P+UFeU2mGFsriG94zMr/h4FdbLM3WtAtsD+hekJ3doBAl+5u7mRq
         AADV8obtOjkYWrPzpMrVS1YmMRq26T6nVSED/FGeWWQXYqIpC5OyQi2sTLPBtxgWylIV
         vxD67MykKGN6aDNvPdGAyH7OhBihSP3PjTNA+pAtxuMutPmwtfv9GzNw6rABd+iKMvU3
         TC7DYeceiBzwSZjWCDECN+U9XrH4FjY2S5pt4QN+mD07SZf9Vzcq/mCiLgkUg60G5S5Y
         xmxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+uZC1tIDbTxEiHvsFsMVXoek+eM+kFV9LTlUQhquvcnHmasWO8UFbOWD8BE2OxJprWLhzy2cO08svydyjNKlb@lists.infradead.org
X-Gm-Message-State: AOJu0YzGlY0EJ7uGx64KOiLu8U1Mlzwx2uU5YLMXJQUJPxO7f79fIn+9
	RQIPSgFjtK3Dq9zsIAcr8GWW2aKHcc65asaDiTzSUo4StZZ4hzVQU+ydSVGHlK0=
X-Gm-Gg: ASbGncu44gnPeW//eUOnKiSImxTH2Ig1eldnDBbzqfHBGZp92A4vS4h9zDdfF7QP7lO
	r38UD8B0Bz6jDWjS68N3gH47GVPJwUGnsXxBsJhzm6AUrj6bBMkjMoPdh7vpN0KWu6fCCcPyaTC
	pMuSwLMHOAOi05G63BvyV47VhS7c7K6C66tUZP4RxqvacXbke9EYNjyhos0NHoCjqNRyb5zBDPm
	T4bCs5coQIh/CC31y1DTBmuvcn5f1Gol/I6zfG8YuJAHcHG0BJKb7SDLr7SAGR/zYAmlcqfjgXN
	jx1+4Fpzv6oxgfvndLisZw==
X-Google-Smtp-Source: AGHT+IFMvcxOWGObd8ehOX4GwDaId2HovFmu8cG/IwwMFqO8YRpZxQ1daJcR9OcH/g7GFRV9lZ8KUg==
X-Received: by 2002:a17:907:d8e:b0:aae:ea52:3a5 with SMTP id a640c23a62f3a-ab2abdc0bc4mr2261767166b.44.1736845898485;
        Tue, 14 Jan 2025 01:11:38 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b7317sm599640766b.154.2025.01.14.01.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 01:11:38 -0800 (PST)
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
Subject: [PATCH v3 4/4] clk: stm32f4: support spread spectrum clock generation
Date: Tue, 14 Jan 2025 10:11:16 +0100
Message-ID: <20250114091128.528757-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_011139_975448_5F87C423 
X-CRM114-Status: GOOD (  20.23  )
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

Changes in v3:
- Changes to patch 4/4 "clk: stm32f4: support spread spectrum clock generation"
  according to Stephen Boyd's suggestions.
- Drop pr_debug() from stm32f4_pll_set_ssc()
- Add __init to stm32f4_pll_init_ssc() and stm32f4_pll_ssc_parse_dt().
- Add const to conf parameter of stm32f4_pll_init_ssc().
- Use fwnode_property_match_property_string() to parse the
  st,ssc-modmethod dts property.

Changes in v2:
- Fixup patches:
  2/6 dt-bindings: reset: st,stm32-rcc: update reference due to rename
  3/6 dt-bindings: clock: stm32fx: update reference due to rename
  to
  1/6 dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking

 drivers/clk/clk-stm32f4.c | 143 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index db1c56c8d54f..f476883bc93b 100644
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
@@ -367,6 +374,16 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
 	{ STM32F4_RCC_APB2ENR, 30,	"mdio",		"apb2_div" },
 };
 
+enum stm32f4_pll_ssc_mod_type {
+	STM32F4_PLL_SSC_CENTER_SPREAD,
+	STM32F4_PLL_SSC_DOWN_SPREAD,
+};
+
+static const char * const stm32f4_ssc_mod_methods[] __initconst = {
+	[STM32F4_PLL_SSC_DOWN_SPREAD] = "down-spread",
+	[STM32F4_PLL_SSC_CENTER_SPREAD] = "center-spread",
+};
+
 /*
  * This bitmask tells us which bit offsets (0..192) on STM32F4[23]xxx
  * have gate bits associated with them. Its combined hweight is 71.
@@ -512,6 +529,12 @@ static const struct clk_div_table pll_divr_table[] = {
 	{ 2, 2 }, { 3, 3 }, { 4, 4 }, { 5, 5 }, { 6, 6 }, { 7, 7 }, { 0 }
 };
 
+struct stm32f4_pll_ssc {
+	unsigned int mod_freq;
+	unsigned int mod_depth;
+	enum stm32f4_pll_ssc_mod_type mod_type;
+};
+
 struct stm32f4_pll {
 	spinlock_t *lock;
 	struct	clk_gate gate;
@@ -519,6 +542,8 @@ struct stm32f4_pll {
 	u8 bit_rdy_idx;
 	u8 status;
 	u8 n_start;
+	bool ssc_enable;
+	struct stm32f4_pll_ssc ssc_conf;
 };
 
 #define to_stm32f4_pll(_gate) container_of(_gate, struct stm32f4_pll, gate)
@@ -541,6 +566,7 @@ struct stm32f4_vco_data {
 	u8 offset;
 	u8 bit_idx;
 	u8 bit_rdy_idx;
+	bool sscg;
 };
 
 static const struct stm32f4_vco_data  vco_data[] = {
@@ -661,6 +687,32 @@ static long stm32f4_pll_round_rate(struct clk_hw *hw, unsigned long rate,
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
+	writel(sscgr, base + STM32F4_RCC_SSCGR);
+}
+
 static int stm32f4_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long parent_rate)
 {
@@ -683,6 +735,9 @@ static int stm32f4_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	writel(val, base + pll->offset);
 
+	if (pll->ssc_enable)
+		stm32f4_pll_set_ssc(hw, parent_rate, n);
+
 	if (pll_state)
 		stm32f4_pll_enable(hw);
 
@@ -788,6 +843,84 @@ static struct clk_hw *clk_register_pll_div(const char *name,
 	return hw;
 }
 
+static int __init stm32f4_pll_init_ssc(struct clk_hw *hw,
+				       const struct stm32f4_pll_ssc *conf)
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
+static int __init stm32f4_pll_ssc_parse_dt(struct device_node *np,
+					   struct stm32f4_pll_ssc *conf)
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
+	ret = fwnode_property_match_property_string(of_fwnode_handle(np),
+						    "st,ssc-modmethod",
+						    stm32f4_ssc_mod_methods,
+						    ARRAY_SIZE(stm32f4_ssc_mod_methods));
+	if (ret < 0) {
+		pr_err("%pOF: failed to get st,ssc-modmethod\n", np);
+		return ret;
+	}
+
+	conf->mod_type = ret;
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


