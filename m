Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37ACD4977B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZ3YHSAuF6GRZeer7tzybOaIp6SswmD+4eSpj3aybE0=; b=H+0D8BIOnpVyj3s9WRg4wkc4el
	izq0Xsa3ew6cvF1f++7vs46/eqhGjTHA9GSwgWUZOKeqcRf1tz+m5Jl9xqOYMEIkrkYgERIR1FAam
	mGcW92+7F/34SDNmA3GARIoMtjgMFnvg2p1Biw2hXm0d+MDSJrCkmaocgz36/Ei3zzeEY4J5EexAd
	wABQ6UrB0BRLbxWoS780z3ojCImFKULPUomXPLvLtMIyMvihGJKVmFpJm96D2tFscCwzF7x3iFKNF
	FIUm/xojwev1uh4uyxcRedVhfrlv7cxIym0/rkC4mbs/L2ztjO1DEwtjIbt8yq+aHjAPMnELR4Auq
	Q9omAlNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHoDy-00000004AYH-3r5T;
	Sun, 01 Dec 2024 17:59:14 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo2k-000000048Wv-41nA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 17:47:40 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa532dcb470so241146166b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 09:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075258; x=1733680058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZ3YHSAuF6GRZeer7tzybOaIp6SswmD+4eSpj3aybE0=;
        b=ij6o7qbhm8T7LqOvb6UzGRUyFRgHxI8O9ww3RbjtMbeDm7SK64olT9e/b6IJ6AExAX
         Xkl60roho1vznJgznQ32X/ErAoUJGccktVppr4cmnnP5P4NH4jqLPZjENr4N9jxeANiL
         KAkO6mnrp8R6Qg8ldj/YCMqKH8dvvbEPfPZso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075258; x=1733680058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZ3YHSAuF6GRZeer7tzybOaIp6SswmD+4eSpj3aybE0=;
        b=PJtyfFXJ+uej/ekD/oR1x8C5wo5pbMyN0qjOGJ4euo2nwU+19HCeX3dEZ7wEEtyCpN
         mPwMC8ogjEFbkXcwyqNmovdvcPttOLwJ3yFoOYr6+lbYqML1kEjB7PY1AC1G4jxbfRkY
         g974gWqg5NRzvSMrCsyci2S/TMgM0mlGGZxXWsydUdtPNO+HjG6zd/Kd6/dpX2Fd6Ysd
         r+kO5PxZXm4TaUkQNkzECC29aLlyry9UVlzL/zZ9AMUfLwvQxTfbwNNEOOIyHL2wKwlx
         5EkY9wjt+OKT/Pe1UeOhMI8WKxttCtmpY/7WujGIbQhCZNlZkBUhbw3hhMDu8sdYjc5L
         IQUA==
X-Forwarded-Encrypted: i=1; AJvYcCX634KuxNV6aXFaDm75SccOyP0THDCwRpGJfELnbPGxLqJyH56qhKfVvLvVnpCSeYPi/UuZlWzHNUFNqoTUXDGz@lists.infradead.org
X-Gm-Message-State: AOJu0YxsOl7dP/C9ibH8+ocEAcY0YVCur+WlbvWchbI7vVw9sA61LQQ7
	t3x81UHX3ahRJIYdNg2fZfVAeqIBrwwocgJkQpgGdgTATql1Aux/33JE1LNnryg=
X-Gm-Gg: ASbGnctTpwlcr1oPlvJNuZtQvnT9wHW0GkrUgyEZhhoiXU8z7dXkHVHa5/uHz05tADC
	BTlNx8c9aSzHmTVjUtVILzl0tjKD0PfoDWZ5Mhw2NDGAmJbW294AkE1fN++h05oqbxBCqnUfOja
	pBZSPnhd0roYITbTehfEY554YnNmdNW3bTHUIG82MEbmRuSY3lyQUu4n+U4uS9py+30Gj+dTwya
	qtj7acGqr+HK1dcGI8/bLcFQ4z/OEWf0IM3aAbabGWRrdeG1xtmLejRpTReYZBpPMJHGh40yAoJ
	2lwZCifgyrHgGMCDo4D9zDqhLQ6iAUAD0sjTzROaomqKNgpopAfbDvhUrBxUguzuO/FSXGNf92t
	E1RB6sapl/y9hErnO
X-Google-Smtp-Source: AGHT+IGzjP2fqXTt6+l7OVN5JKc8cizq18lY5oJ6KQTBWwgFH+n4/LFwzMSUmqzkFa0IBPwW9Wme7g==
X-Received: by 2002:a05:6402:270d:b0:5d0:d2ed:ebb with SMTP id 4fb4d7f45d1cf-5d0d2ed103fmr8950481a12.3.1733075257612;
        Sun, 01 Dec 2024 09:47:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:36 -0800 (PST)
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
Subject: [PATCH v4 11/18] clk: imx: add hw API imx8m_anatop_get_clk_hw
Date: Sun,  1 Dec 2024 18:46:11 +0100
Message-ID: <20241201174639.742000-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_094738_999171_FE70B84A 
X-CRM114-Status: GOOD (  10.13  )
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

 - Added in v4

---

(no changes since v1)

 drivers/clk/imx/clk.c | 26 ++++++++++++++++++++++++++
 drivers/clk/imx/clk.h |  6 ++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index df83bd939492..8a8473a77b7c 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -128,6 +128,32 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
 }
 EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
 
+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MN) || \
+	defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MQ)
+struct clk_hw *imx8m_anatop_get_clk_hw(int id)
+{
+#if defined(CONFIG_CLK_IMX8MQ)
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
index aa5202f284f3..6b6af26f4f1e 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,4 +487,10 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 			       u32 reg, const char **parent_names,
 			       u8 num_parents, const u32 *mux_table, u32 mask);
 
+
+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MN) || \
+	defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MQ)
+struct clk_hw *imx8m_anatop_get_clk_hw(int id);
+#endif
+
 #endif
-- 
2.43.0


