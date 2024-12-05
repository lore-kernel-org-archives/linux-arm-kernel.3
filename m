Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52940E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sIT0jqKNMZhKzMLzfgvLUDfd+FJ1ix9dxzYWA8kfsM=; b=N1XyDsSPEc5yMKLlcZAWXiDNiI
	Jp3WZ0syHi/Jbcc6K6aTfJB9D3Si5XCRKy7Ar6nDc5PkQpOQgK1Nq/+8qIHjP9lCLGrc9GIE4cQV3
	mSrEzvd9rsg6n/pna/SO+ehe0PZWSuOT8f/TkH9rcTvJm1VperK0MZWUNzayCvTWkq0WpSM1VYQK6
	OVHXpDiXrLCPoz7KxZRmf2QvsKMgHkHl/8ZcetoTTTMOfUeV43/TUpOR5qc7wENdMwPwyliwcVo/m
	ZPGFttgLCHxuOp7cr70NqaVAG8E3Syj3S68OJDmeYC6peInBEa1zReslU2RQ0pLoBIw8bs0rhXihI
	n5rKTe8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBDH-0000000G0D0-1Pd1;
	Thu, 05 Dec 2024 12:44:11 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9tq-0000000Fgh7-2UpJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:20:03 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a9a68480164so98880066b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397601; x=1734002401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sIT0jqKNMZhKzMLzfgvLUDfd+FJ1ix9dxzYWA8kfsM=;
        b=E1I0L5e4Gna9DigGDEbcGrLl5phul2cbLE+Spb4LhdPkFD1C//5QEsv/3mzy7dSc7k
         MIodll0Qwc2zzQiqBWe0Ny4mt5ytLd9lJz/i+UcFqem67T6/tG6oEX9A30dSk+bTOtDb
         oX8VWM9wemVGZJTptEbOwKKhMrK6jqx/QC7jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397601; x=1734002401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sIT0jqKNMZhKzMLzfgvLUDfd+FJ1ix9dxzYWA8kfsM=;
        b=Oei7xdU6Is1GQoorjr7Li2Q8LLJrNfcOZuDnkNvDIMuEI43KNzmN/bz5u+GTy5L3pq
         1gF8p8OfUrzpR/SBde3/eCvx4T8lfzFbogNzICpqYoN9nj8iTDMhfVgBXbQGI4Y/3v2R
         V/tRwWW7JqHpRY9ooWw8DzZ5/1CFgw0PufeAOMoceTL0jW1I50Ofdxq6q6cFgdzY5j4y
         WS1EHfcBaHPtztv77+Ejn586YR9F90uSFsLZiEci99IRYylQXtHtZZWkH+7YJO+3uYcf
         PbOHQPCb5MANMClq+LR1XvaRUQat3r/kfHE+CZz2G6QKQOuN/C56A88OnkoCRV4yDk5U
         CpVA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ/EoFMCAH9Hn1sFZimk4iwBS3J9CvXfVteVZoLURAG8uJCOwFUqUS6rNz2YYGPzXnib6IiiCQngcONH0nif3X@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz7Xx3L59xfXb92g59ANPvSemo6VOSMqGLq7NY+c9pd3+gpd4g
	CSAFIlOgLj5pX2PRsp6ZlSYyLUOAIF9/qamzk3af949ht/4WvZ9d5R2OOGftZdE=
X-Gm-Gg: ASbGncsV3VlNe+T5yXGFdBpQo/8Gal0sV44fnUPufuKL8FxhmTf9QR28oJJg0Wzc2RM
	RFITaeicRFoyE4NxipN3crztmBCp+pFh/hXJ9LzE0RSj+YsPsZDgXQCC2Pc5vsvrLEJ6fZlD1Mb
	wuPrHnq7GtfuWg6/WvZf98y8EDxcBP1xBs0LDz7LTmLaZ4SflxqbaQlZ1Q1IbgWwkXDDlskCedL
	Mi5Zh8dVOqmcefMcpsZzqQp7LSTTTC2c2Afwm/iQm3cYfnd/nQZGe6sls3oVH0uTe5/OHn6KlVi
	DFftMkYPUcvq6uYi1tt+P2bJJ0Aa2b3N6ZieR84Rl28UqQ==
X-Google-Smtp-Source: AGHT+IFWmfdNCt85Uk2ZsGUp6FJYDKMTwFmyiWTZIau8bHhRLJjRv3qW139XBm4OciWPi9ZRYi576Q==
X-Received: by 2002:a17:907:7847:b0:aa6:2a5c:fee2 with SMTP id a640c23a62f3a-aa62a5d4b52mr116294366b.31.1733397601340;
        Thu, 05 Dec 2024 03:20:01 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:20:00 -0800 (PST)
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
Subject: [PATCH v5 13/20] clk: imx: add hw API imx8m_anatop_get_clk_hw
Date: Thu,  5 Dec 2024 12:17:48 +0100
Message-ID: <20241205111939.1796244-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_032002_631985_9E926996 
X-CRM114-Status: GOOD (  11.02  )
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


