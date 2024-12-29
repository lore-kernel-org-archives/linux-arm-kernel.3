Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0FDE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 15:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHfQ/VeJmhz8wn8A9KlfaIopMLyJVISWJA2tyBqE4w0=; b=sii91SnYecy0IUuu4ERySX9iT8
	PdqBxI8adr8rmVMJHlHkA9JzSPse0XP5NRUmOIxKrOXvAf1xotGR/W1XunKnRpTJo9l2FTDWsJQRp
	9visn79nTKMdkSoJNyu+QHCQejNlkBwMeRPgU47l2jCW+/QH9T3+wNHTfRdXvjIRXGJRKiefYPH3Z
	Y+HbfJGDIUx8C0yW8UZtSOM0+/oLIbH/VQCPk6nIffJyd2QH+fzLPBLDte6jIk+xCtlbI7J0fpp8d
	cHbX6yL1OnfVFT/C+Sh3TRsYf6tp66bZDPkImc5fhkdXkknV5mNb/NngQ5BKdhtHimFJMB3JMQBVI
	epVBArJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRupi-00000003XyN-1B4c;
	Sun, 29 Dec 2024 15:03:58 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRucz-00000003VzA-1Z34
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 14:50:50 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa69107179cso1409630066b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 06:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483848; x=1736088648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHfQ/VeJmhz8wn8A9KlfaIopMLyJVISWJA2tyBqE4w0=;
        b=L7AEgnGPdsxy61YSebLHXgyJTCgVnH4Xs5aOXxc1jT2KJZZ8iFLE8BbAvZgYNnTWfo
         j0YoEWi+7IDeJRoyJKq3/aym/ohzAZoAOErgSKJefqyaFDm/g/pvskox/fR4apS2ZsRA
         4ndGCz9VtzKt7tcbEmxeZ75Og9tAYINh946dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483848; x=1736088648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHfQ/VeJmhz8wn8A9KlfaIopMLyJVISWJA2tyBqE4w0=;
        b=XUjkdzSeJjetkvF99oCHf+fSKaBhgEJ4mUB/tkrQK2sVxKoSfQMia7RRt/uGYDA2Uk
         arh8j7WHF9EVhZAWURv5b5l0i/TGyb0YLR2UOXCNGiu8D0ARNHTsH7fI2V8Kb0IlqbET
         OmfjbM/g4xq2psmx9d1m3gmOXtj12WRH7ldccCSDF2SFyCVmYd/Ma8WPH+QRJeRaRWEU
         NR12RvnTaH+ioWkUdIsUZ+Vu6FZu2SXVLESX7G8CXtqP9t8eIChqdPb3fzOdrrnJnt2j
         rck9c8acZxKPDLC1qwTZKB2+pRSELGh7sWTr7x5xQAw18FFFcvYzJ3LSzIfMA/g19GNO
         j4Og==
X-Forwarded-Encrypted: i=1; AJvYcCUc1ZFcCDpOAbXeQB3h5JNUBrmNw99RpfkIXJTyz7esKg0dyh9Q4JFcLA4DWLPArVwXZBCFR2B8OpmB7lepZDPB@lists.infradead.org
X-Gm-Message-State: AOJu0YzAyo3jHeFPzAXGkIbVI//6GjEnC2PorBMYo0hqGDLlWFcR2969
	aLfcDfr3eIY8ZzDlc20lEx2mfC30k5f69uMRpfdrz7HYjVICXf+J0Bhlk8tgLQk=
X-Gm-Gg: ASbGncsqF1q2pUXiTkOMdZU9Nz6mL0+KKXpgTpg/983PnlVxpxECIVuB+Bt5bQzlhwN
	hiBT/raGqMzu5swZkRmqAkDUno84VOLL4SIPP7MFG3DV76BVY46Rr1zCnspJJ7JDrRAUZmisqqF
	pCvC4kS4sZTSY4IIFaeG5A6biING7GLCTBJZ/B8I6YFTc9npHM+ZHvpy/ZRaXRoqn5Jaxv1Jajk
	YT7Y6ke0A7bRky7TytOa9sMo1bINuvG+0oNzkprbJ8uiH3H8TnRqWjG+AXTpsH5BPkbu/2TAwLI
	MjH+JAZuoPU1QGbhNwuKNQ==
X-Google-Smtp-Source: AGHT+IGnU9rddkEjFb71xBUpHoE7jAWdM0Mj4zsaR45d/rt3vvu1CgxNBArT5n379CI0wDcjZNjmxg==
X-Received: by 2002:a17:907:96a0:b0:aa6:7feb:193f with SMTP id a640c23a62f3a-aac2ad81a25mr3181092166b.20.1735483848082;
        Sun, 29 Dec 2024 06:50:48 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:47 -0800 (PST)
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
Subject: [PATCH v8 10/18] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Sun, 29 Dec 2024 15:49:34 +0100
Message-ID: <20241229145027.3984542-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_065049_416557_D539601F 
X-CRM114-Status: GOOD (  11.62  )
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

(no changes since v7)

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


