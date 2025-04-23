Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8AFC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 06:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=; b=xy8vyVdaRLpf6t40DuzL12isMC
	McAr9Iyz0oDonDZurKy7Wf3thCG149x3DyVh5bW9BN6rqk/4SkppsCLaBXHtB3BSms8bNosrhmwvM
	VaCgsp87MlalrProlH80SjiS3jcOLQ7WcYbbd3u0WEu4NXAwDf/yq2fmL/AHGiP2M2p2Pojco6pub
	8wznY/ff+57cVPrv4kXi/krwR4JzNy9sVb0tvf3mBLXqGkgrsDbhcoYqDz+XivoRmvkv9NWDBejKD
	CAJRGAW8D76bbJZn2aj6OLvlIw8q4So3DsAllJ594+HOeLv3LdGWp1P7Vf0o20GQOJGmLxbSAu5Xi
	E7u0y5sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TXv-00000009KuC-2eGX;
	Wed, 23 Apr 2025 06:25:23 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TCT-00000009He7-0EcG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 06:03:14 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ac34257295dso1084686466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 23:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388192; x=1745992992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=ca/zM1FwD8KX+jOEUh30YS84q6GpaKtFYf+Pm2mXaUSEfow4L4XSwAoZlRSHScOetb
         HXjzXp42AZWD98ZMScJGtYxWNnejetQ4mXmPT5QCLnZd7tgB3X38pKH1QtiVvZPIHK8R
         MetuP/JNL6RWgtDYfeoQim34S0d0SOAFko3bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388192; x=1745992992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=QCZgNx3s01CMb8t8A5qDXIS4UIocbkDmVFCpx70ele5Y1hHWOzF1+UrBg781dzy9Jj
         lkePLFSlNcMP1DoxzUeGDp0hmmA7eIQtSuDvAwYJMfHkJj+W907r5p/Sdhgp5rc98KlD
         1EaL3XMrVwK4zs16AiUJa1Qsrf3gPk97bdd0X4MK0gwqxxXG0Nc+CbMLkfLcAXbC0BPE
         ylDKEcTG8BhKB3iZseHwmx6q3pgjMrTtdeS7Av+boPm0cyQ3B+bIRhBxaKX7qsHK9yAb
         d+Ix92u6fZOX4tjTQ12DFdL+WFC1+1WHMo7Oan/pXnQpo45hHqt6Do5Xog1ehV7vbZAv
         eeHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxC4y4MtD+Q8Phr7h9MCtXx6Bf6323KpM1W1uXeXenpfGCsxwYhufOKDF87hhRK+k6hqy2+jxfk4OqneWMnnqU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/mMjdZmlrdDuFLcXW5+T+s2F28n2mQ6FNUaesI/Dsoz64en3P
	+PvvWLc/U0L0NgOeu4UX+C7O3Jp0y2EVN3l62q8GrZIV946QGs2n5ccyiVRcwws=
X-Gm-Gg: ASbGnctEblP95Am+f9RvZE5MFHSGgfenahRPvKcct/pqyGTTk+4h0G776EiZlWa5EUX
	7PH7mNIRQaUBRc3xr0D1KMdCJRwgjvdF1I45HE2WiEks6fII4uUj0RZIjPJgUXhs7ygpFPpTw5U
	YkcgCoC5XBnCAVTba/qYMdFCsmkLZISY87zhNBN4Q1gygjqmU/ES54fwSnC3FlGM3Hvl0vvZvbw
	2v61RyEd+b4tfAJoIvjDm0GbZRiDEv72Xti79FMLUQbPiw1Sd8IQbYIBn2DixXvZuEKeaHKw0H2
	KsZMjhvvD56tTQ0xoUdDzune9owzsNgyP7dotkSh09866cOi7wr7TZEXsvsjrz/XS0Y406ETxiH
	0mM/L
X-Google-Smtp-Source: AGHT+IG9ZwINf1p8AnuBCmxXiuG1HeY2MVi7uyIvKg/QnRhdOn3/Wu5aQjRTNdLl1xCE330o96Hy9w==
X-Received: by 2002:a17:907:6e8c:b0:ac6:b639:5a1c with SMTP id a640c23a62f3a-acb74b5089emr1383851866b.22.1745388191664;
        Tue, 22 Apr 2025 23:03:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v11 10/18] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Wed, 23 Apr 2025 08:02:27 +0200
Message-ID: <20250423060241.95521-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_230313_095298_B573C8EA 
X-CRM114-Status: GOOD (  11.85  )
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

(no changes since v9)

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


