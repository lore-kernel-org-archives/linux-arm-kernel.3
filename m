Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A2AC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjKk3n/EWVmeikEmbqzIG+MPD0szAgZhKNxV6SUP6YY=; b=ZFFiAlbDb5lJ+3XnkwYbJcNwkG
	OM1PJFlYDb+j1kCoLttNrlHCgqQO60sgyBZ70UK/vDwRZB6rmoKVEYcgX+wXxLHU9d/bv+if/d20g
	emmR8vq5traxhE6/EbKXqw8tzoAdHpHi8pWaSet2vScQdYr3BXNIzdGndEJEJR7yughVO2jXGDLzJ
	JBsvg+o5EyQ5BrvjRP8qiX6IrjzhMkxjdIBtaQDSVXReHlMUbBB4ClMhmGfUBnIa5C0OLRTYFxqH4
	TvQnkBleWc6p5ITcNrBru1l20xFcAaZUl5rJP2EaQgZDfEodKI6czL5OkiSCmLGxRxNlM9q6nVySD
	0YnrqGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8Lw-00000002Pbn-3XEm;
	Sat, 18 Jan 2025 12:55:04 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88V-00000002NBQ-0tgI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:41:12 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d3d143376dso4505501a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204070; x=1737808870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjKk3n/EWVmeikEmbqzIG+MPD0szAgZhKNxV6SUP6YY=;
        b=mhzTIB/1ZfsM/4V3bF4j4rte70LGRTZXoKf8JXbtGw38Su4sFGLR7KdJ6ODOQNe+/C
         JOCWETjF7oqkqKDccwvMCUUVGTOIOh5mvDfO0S1aYSGjde+uMYWFgvYlpDRKgUWc1Pko
         qgANGT7Xbrl0rdfkpUospr4mV2nImErc/Cvfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204070; x=1737808870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjKk3n/EWVmeikEmbqzIG+MPD0szAgZhKNxV6SUP6YY=;
        b=KBM3rHdvOg6DdTOoMq08aXRNN8e40lSbBdXTjlm4fJde51FHVQfriHNF/z0DUeCfjQ
         NKfdIx1Cs9Kq8UlMWEqf2iKNdXGLfIIMkkyd2iDHHHKapl4ojc8wabxFHgqjRCTPvXTY
         L2C5TBpjQipVaIOuMWwcJwp4tsE2dmQGKC650hWQv55fl1kPoxN+oBAtZEQYaX0g1CKn
         BN1+ZNluJ8vbDDKhY/Vsa/wX5mw6e8GVyrIIgcnnQ3mkC5H4BSPc95Kkq5VZzpgNkNlh
         g29IgWLxokW1pzokOyXxmZNWJZulDGLftIUio4Kwo9yiqFmKO4UDfWJxkuXzTJYXkYMy
         9dNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmY9wq4bdqHOtc7fuph1SPlMYiw+JvpXmzcXElNBoWsDYGr/HBSrIwcyJDkej3gUMv62hkrvyz3KX2gMtUoIOP@lists.infradead.org
X-Gm-Message-State: AOJu0YxORWLG62whKsek2x9H6eMBbkRbFihfQ7oHpACAL+iKo9PEUAd7
	/AQX0QBmqYGATsJUc7IFYs9yzikRuYb5Mnml1knhvTByyJ2TBkuLxTnMj3ezcHM=
X-Gm-Gg: ASbGncsFKgB01gY/vs8wmJoI28ggEtLx32soeUdqCytQBKBOdnmoBWM91D3jRJUW28w
	HGibzrZXPC7/wghQJVKj4Gf1VYu6qTsynwW0w7xEl+WaO8g6N2IXhhun5FuuUY9hvvENu1umfj0
	LnPozJaJtgQM90fb78N+GsROODoeWRUBVApuYpxbiUgFVBbVuIKtR0wxlIf6cQKPLrSQQbIR2/U
	5cD/zNfKR3C6tUnTP3EsbNfhHMbWYPGTHaL5vYIF30QXlljXxOkTjxkKYYXuZyRiteBZKNYJBzp
	T6xbEVH9IHK4jV1E6ey/4PFhRNCSznksw7EM4k2CXmxlproaHRhW7nURTSUDJmlhKNajGgaUQb4
	drw0kdBi3GJQUX/riyywEZ33bddqlEx8e1jYy
X-Google-Smtp-Source: AGHT+IG+E9QI4nYzoY+YN1QOMcP80jWKF/DOpc0bYiVCZW9BPZzE9/t7StCYdIbpqJGBKvVbQm3HcQ==
X-Received: by 2002:a17:906:c108:b0:aa6:79fa:b47d with SMTP id a640c23a62f3a-ab38b0b8138mr568616566b.1.1737204069853;
        Sat, 18 Jan 2025 04:41:09 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:09 -0800 (PST)
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
Subject: [PATCH v9 10/23] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Sat, 18 Jan 2025 13:39:53 +0100
Message-ID: <20250118124044.157308-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044111_249434_F247266E 
X-CRM114-Status: GOOD (  11.68  )
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
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan

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


