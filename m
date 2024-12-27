Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B770E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2b1DvWsKR3kWK9JNfXRovoEHigCoxQCmQlYrGVfIyUo=; b=y2ZOlSCcA6OvNI+c9qY3jqvc+P
	HjL7l2GJ97ZrEjm/TintkCCsOrZDS8hNFK78y1KqlLioPUif0M/Ilrcg49UlbgEdFDYnCTPDRq58V
	OhKLkggMDqbGaaHWfC7rpvbEVS+/gU8z2CAn6jzJ/Sf+xV9eNDgvMQv/J7Ha3K3Pg64Wms1yIE8b1
	LLPs+lAGY9gLZXwKM7iV/bI29su5mO0vndu1bOhJG37G+Xp0//6bbuJCA3ToEXdbZXbIM3adOEcZR
	Fh+ZCP+0bbeTSNchRp8YclnL/f+b26u09fmwWcqhI7tlqUj4U+3BZEHJSHRtrI6BfcVxlf7yxqrou
	7LnqsGyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDwd-00000000hFQ-38hG;
	Fri, 27 Dec 2024 17:16:15 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDen-00000000eZd-3A2A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:51 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so306550566b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318668; x=1735923468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2b1DvWsKR3kWK9JNfXRovoEHigCoxQCmQlYrGVfIyUo=;
        b=SlgFXH7a2KmW/N4dE9uqZ4PwhGAdJXFM/5prlvnFA3m1PH8BVK7jhC77KBcsRQ0Lye
         Uey0eSN0FToyZ9s1eO82h+cwOlCpNO++AemMo5f4eIy6hhPoIMqTxCaEHdO5IUGscoxH
         U4PKtu/Op1xP59xhNaxBA7HP2Kw9tRVJ4dHQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318668; x=1735923468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2b1DvWsKR3kWK9JNfXRovoEHigCoxQCmQlYrGVfIyUo=;
        b=visid5RE/HrM7iZHozF2XMciVW1CI3nZ/u+7pPAWzz96+uMqupfx73Ej2OiK72A/KJ
         fDg04+YbqFq9yDMDMwNUJN125+gx22iX/GNIr/t/jJXm1AslpT3A+TDVS2ob3v9wKij1
         2k2GfaMw2MF8GGBvpNg4G5IRSM9X6ZKKV18bt9ZMFzj7/pe8WB73vfaEjcAxgk7xtP7O
         YLMgZkFYyhhrLe+Ja62sxsu3ujTFQ3q5i0HkFhC6wxmbZfM46H71E7OP2YzyxiM4Ntw3
         pINzO1vmJA6Utk6L5Kg/PIgqpnPTbvUby5kieCfNjnMl85mAcXjEsuYXOSx9puTVj9xC
         +qtA==
X-Forwarded-Encrypted: i=1; AJvYcCXMl32D3P8an/KjI6Sb7n8X1xbLKXhOlE956A+JKjr0i5VenhvQdRm259XMStiMABQwNoNCIOrF0Uaep1uXwsHT@lists.infradead.org
X-Gm-Message-State: AOJu0YxsgeHs9SontvMjvje+AeMISqYcqTQEOrsAYdxS+Btpm/Gl3cCX
	Pm+xAt22G4oXVgBdM4ARUdj7bQmWALM3+FHACyNaVSZKblM2qQ2DZ88laSwfRi0=
X-Gm-Gg: ASbGncvHR9smc+siFXS8zdINpzhQc6TRsRiZ9/dtO7wdgqaxLECy2cLE3YAfUpLSW3Z
	VqyltUnOEe1j3w21RWnNkanHrI11/85vdcEIJzVaCx09ls5vFgW2RV073obqgNJuBOJ9PSIbLY9
	O56qfFGDTb+Yy+XoHDgZWVuDf4pCDIRF4vXAX+0IgCIby/0lq+V/0pvZUj90WhD0sOOXth2/Cod
	fKnL0/w2OWWYbhnOIzie34U4p4ELs0SPrMPSA10vdfxsUgTwjELrkCF2VxiyE5/nRTYdQkAdfiK
	XwsmU6zLDuLXp0Zl7vjp4g==
X-Google-Smtp-Source: AGHT+IFdtsrBznelwwJuBM0+oIFuAtsVZztgwfPwBkxRjqySUJIDbs8HNHC7GQMygSlEz9WnVs+UvA==
X-Received: by 2002:a17:907:704:b0:aac:23db:af61 with SMTP id a640c23a62f3a-aac2874937fmr2719500066b.3.1735318668380;
        Fri, 27 Dec 2024 08:57:48 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:48 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v7 15/23] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Fri, 27 Dec 2024 17:56:18 +0100
Message-ID: <20241227165719.3902388-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085749_793850_FAC7A442 
X-CRM114-Status: GOOD (  11.13  )
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

Get the hw of a clock registered by the anatop module. This function is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- Add device_node type parameter to imx8m_anatop_get_clk_hw()
- Rename imx8m_anatop_get_clk_hw() to imx_anatop_get_clk_hw()
- Drop the gaurding macros so the code can be used also by i.MX9

Changes in v5:
- Consider CONFIG_CLK_IMX8M{M,N,P,Q}_MODULE to fix compilation errors

Changes in v4:
- New

 drivers/clk/imx/clk.c | 15 +++++++++++++++
 drivers/clk/imx/clk.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index df83bd939492..a906d3cd960b 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -128,6 +128,21 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
 }
 EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
 
+struct clk_hw *imx_anatop_get_clk_hw(struct device_node *np, int id)
+{
+	struct of_phandle_args args;
+	struct clk_hw *hw;
+
+	args.np = np;
+	args.args_count = 1;
+	args.args[0] = id;
+
+	hw = __clk_get_hw(of_clk_get_from_provider(&args));
+	pr_debug("%s: got clk: %s\n", __func__, clk_hw_get_name(hw));
+	return hw;
+}
+EXPORT_SYMBOL_GPL(imx_anatop_get_clk_hw);
+
 /*
  * This fixups the register CCM_CSCMR1 write value.
  * The write/read/divider values of the aclk_podf field
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..50e407cf48d9 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,4 +487,6 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 			       u32 reg, const char **parent_names,
 			       u8 num_parents, const u32 *mux_table, u32 mask);
 
+struct clk_hw *imx_anatop_get_clk_hw(struct device_node *np, int id);
+
 #endif
-- 
2.43.0


