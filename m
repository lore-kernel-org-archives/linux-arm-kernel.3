Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96D5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVXt77MmyayWVTjhC1zQYGhplrs4R1xCNUj96ytDRNM=; b=T01ZWXkBKd5CQtlNBX4W7fyEr0
	ng9fHLMkmAYS3lEX9mgMK93oiCIe26gzn/nobImDRJ6NB9vK5zeb80e0Trbyg2mHEdXw5IlMqEe1a
	RU52EcsvdNppmn46ZScWwpQWu5hXfyKxhZBq9ksypFip5J5NB77+BDoiTYB/ZjZXAk6yj1CeWxlyu
	O1No1JB55GwmmdIDs4rLvbTzb9Y1C2zkcGYwCtJiW0/2tQ9epbP7liBy5Z2EPiGGcs8n7fTRClevF
	cMZyMmvWlhGqI7UtYtwa48hyDPvzEw2K7D0wEPFxHmoSAGHFeyBmTwZvyJsrvN02j+Cg6JUnzelYF
	JggBlPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPbH-00000008ZgX-2gTR;
	Sun, 22 Dec 2024 17:18:43 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPOv-00000008Xrp-1PKV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:05:58 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso5458624a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887155; x=1735491955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVXt77MmyayWVTjhC1zQYGhplrs4R1xCNUj96ytDRNM=;
        b=G5AwUM7h7og2F/V+j043fqbg/PQTSsU97N7shiGSp5uRR01eGiT1H5g51XHna95WLd
         MHzE0Ki9pXteOeyVcitV/RgQlgK9y1MioiIAXYglTvU1kvKGaZ1MTDnMGnuGrTZC7n7S
         DhZvqBVRJz1UqyJKOJoCZt/4CjU84TRuFS2Po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887155; x=1735491955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVXt77MmyayWVTjhC1zQYGhplrs4R1xCNUj96ytDRNM=;
        b=NrfX6LgQOw7WJwYLQ77T43XE4QwpYWedpqDrQL336pKdCPL1h6dxyz2F4jN41YFRKa
         8YHEyXZIfG9TW++ob5CtfJOX2YLdWsQXnp5eemhHIEh15QrdpYhuSfcOVDNzCFKPeo3V
         xm5cMkAxQqdbJIuglvbCv2MEanSm4ANDTqXwLmBv1gHAR9OIttdnFt4lU/+2F6huWxH3
         Y4DVo6yb9Xh2CibE089HNEqewCfLU9DSW/aFtNlFLYcWhVYEyUv58P61HG0UUwYX5bJp
         yb30IIYb3TJ5ss88zuxlSG/hLlNYBsk74dNouD8ZDSxKiIgvRRrhOShrac0yu9p4Qzhu
         zo/A==
X-Forwarded-Encrypted: i=1; AJvYcCX8rsd74/CEW2PoO3SQa/o60EmGz7QbT5HiMWmBNEyZJrPxokN+alG+8srPjFRONFqAAsatZRguK5qPtAMiQViy@lists.infradead.org
X-Gm-Message-State: AOJu0YwPxh8UUZPr/eBMu/yHJoga1v95qG1GAkjUo81/xAwwEaRPyy8M
	kE7Ix/IAPY9bjqzA2VntyxfZDPbaPQKKy/Y+moszae1RhyWCs+Kp4VrFoXNxFVo=
X-Gm-Gg: ASbGncsrezR3blovIAssrqMgc+cQDNQuLs9Eu5MonLCF0lVqAx5dq17Lrm32M7/mgzB
	NhZzPEcJ4mvnpkKKsDuWJ3ebTX902Dm0rE2K+ISzpKnJXWxE/ypDo9zHkBWH1OYdYQwviNr6WVA
	PQIVmmdRC3DKeTCEm7bVD58gzfSYpETbTvrf1WSiDeKVFixCTdilleUDzavGC9g774m1icByBW3
	tAfCwAtPINBv8FPeE/7GRaIsJJpNu3ZKuFB8uUEnN6fMIVXnL5TdxF8oawZYGDzaJugrqmVIaZV
	90mjA5aduwPk5KSmXv5ZMsk4DEhn+vNBAsnv8klqdvffVQ==
X-Google-Smtp-Source: AGHT+IEtRv29UB2/vpHu5Pos5vtKqjoO8x1Oysl5897305hTSToDe3em3zRHQXaKniZ6rSfoLi31Mw==
X-Received: by 2002:a05:6402:51c8:b0:5d3:cd5b:64a9 with SMTP id 4fb4d7f45d1cf-5d81de39872mr7776824a12.34.1734887155565;
        Sun, 22 Dec 2024 09:05:55 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:55 -0800 (PST)
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
Subject: [PATCH v6 10/18] clk: imx: add hw API imx8m_anatop_get_clk_hw
Date: Sun, 22 Dec 2024 18:04:25 +0100
Message-ID: <20241222170534.3621453-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_090557_375976_2583EE0B 
X-CRM114-Status: GOOD (  10.90  )
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

(no changes since v5)

Changes in v5:
- Consider CONFIG_CLK_IMX8M{M,N,P,Q}_MODULE to fix compilation errors

Changes in v4:
- New

 drivers/clk/imx/clk.c | 28 ++++++++++++++++++++++++++++
 drivers/clk/imx/clk.h |  7 +++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index df83bd939492..9a21f233e105 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -128,6 +128,34 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
 }
 EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
 
+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MM_MODULE) || \
+	defined(CONFIG_CLK_IMX8MN) || defined(CONFIG_CLK_IMX8MN_MODULE) || \
+	defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MP_MODULE) || \
+	defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
+struct clk_hw *imx8m_anatop_get_clk_hw(int id)
+{
+#if defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
+	const char *compatible = "fsl,imx8mq-anatop";
+#else
+	const char *compatible = "fsl,imx8mm-anatop";
+#endif
+	struct device_node *np;
+	struct of_phandle_args args;
+	struct clk_hw *hw;
+
+	np = of_find_compatible_node(NULL, NULL, compatible);
+	args.np = np;
+	args.args_count = 1;
+	args.args[0] = id;
+	of_node_put(np);
+
+	hw = __clk_get_hw(of_clk_get_from_provider(&args));
+	pr_debug("%s: got clk: %s\n", __func__, clk_hw_get_name(hw));
+	return hw;
+}
+EXPORT_SYMBOL_GPL(imx8m_anatop_get_clk_hw);
+#endif
+
 /*
  * This fixups the register CCM_CSCMR1 write value.
  * The write/read/divider values of the aclk_podf field
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..52055fda3058 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,4 +487,11 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 			       u32 reg, const char **parent_names,
 			       u8 num_parents, const u32 *mux_table, u32 mask);
 
+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MM_MODULE) || \
+	defined(CONFIG_CLK_IMX8MN) || defined(CONFIG_CLK_IMX8MN_MODULE) || \
+	defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MP_MODULE) || \
+	defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
+struct clk_hw *imx8m_anatop_get_clk_hw(int id);
+#endif
+
 #endif
-- 
2.43.0


