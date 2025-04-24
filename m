Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F9AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 06:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=; b=M+BXbrEZ6LiauHscWX9NjAD+e8
	N6LrYdf1IjtxNcHAX7a20nO+XhQ9t61lVaIzvUAB2/s6+OzA6V7gK0p7mOp1+DHjZdzVq1/ir/m7l
	4nv3D8LoDSg1F2JYEUwuySl2WO1zZa4MI/mkjAN27ytN4HdAY6uYeI1n+ws2cwk2On2g3tL7I4gtq
	hv/oWH3ec2EYmZsDcnZLvGw5zaunuTFLg97ZUtHz0k5cZxAjMXMtCTRfQAh+zk41THC2XQXBCmZJ8
	BbnS/3Us1UVLD1IBnpLg2uMsN6kY02My4rtTugSum1yc7yTznJOuNGGLs348no2PlG3Tn3NB+YTmE
	rCWDkc1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qJv-0000000D2ZD-3UVd;
	Thu, 24 Apr 2025 06:44:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pyX-0000000CyZ9-3DrF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 06:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=; b=dNfiX3/aLrLnIBNym6SS8S2IrG
	sjXplYxUdWboUrYlC29WAgPeA+gPCLBZqB5fDqIDXU/8w7Ad8TjU6XIWA6vCd6RgZON+Me7TfV0q7
	V15by5FOx32xHJeBorJIoO1WIJ0e/iTQ9fSDmxbjHawQSnvibn995g9kAT4xTbJLmTtTvd6Dsh/Md
	+lSd0gcpgGHTFVkbMiq/uDHUuNw76mqeso8WhoojhwoSTUTJI9TOdV9CL7pyVt97V4d/IJL/p7RjW
	7yXGMLNySKcti+ZwMLgJqF8qQ3iVPswuTnEpdViVqZWTBr/QO5Ts92cfPy5BEmKzHloXqp3Hrjfk9
	alPkW/Sw==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7pyU-0000000BWsS-3dv8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:22:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso5003315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 23:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475737; x=1746080537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=ae1/PkZ3HeOQCFApGqvmBpbzMoaPyW23+fytlEwppE/4qjzXRN7ZnL6c5tWiO/1qLj
         XzclUZoouQsWhfXK0sOpOkLdxTDq/6V9FLP5HdubzLthqoa6aRa9PhfOb5OT0jYbEM0g
         dyadGUxIAe1iSH4FGLlNgEkd/P3JGmenx6FEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475737; x=1746080537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=wygLlDed1ervDwa9FWvvWfPazxsX7YylUogP+WAjm9lCsH0hQqah2A3o5KcBmCBLQz
         LPeYNNzNPO6GId0pR+O6GfetXclFymEdA1s4kw7X/XMbbi4wuWbslZxykWRE5Mlpi4Zz
         N6M5kuoM0v0uOJcB9GUVrYoDEGt7G1SNWtzP5Ig16AKxfM5sHpo73ss6mHXc9Q/fe4k5
         NrQP3jjr9nBDoSFmXsOuqhI6kYowft2/Kz4nHXDZhr6/uoRVMRQBnuDT6QKCyvwLlre/
         mW7G2/wg7dHGyQGgs3Obbdf70ZvKytyz1jNAkoc+N3c4pn0hqCgEE4tQsc0mj6u7Blmm
         E1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWmJKhaCV0d71Tv+4Dogoopbv5BSD1Bujv4xdVDhiZdxPUo8VOs5Njf5RZLDNn74ptzxvim9mqhWkWpHwvISdov@lists.infradead.org
X-Gm-Message-State: AOJu0YxYZEoOsRdy8C2tFe1jdkEGRNZg1apS3/CkI1mUetEqO2D45aW2
	y/1BnmSdFImT56+Jk97/StVeg4wqRSjIls421iAgwmeRGkMoTrLI5CFLt6Q/xKg=
X-Gm-Gg: ASbGnctiJXr2dEe+LZ0qwgrqc97tn04qLjSERPMQQ4Y+oQcOI/8UTNBK1brNvFM9tMl
	pvcdm/FIYIe//qsou+bEnsEaEEVtOMZT/i80M9FNmzEYgE5fMJJbZZjj2Je267R3tL+j6qcRv35
	pqbZSwxm68yhWH412L4iAa4mouX/7WMCqOul6Pt1d9uSJzNSjThJqF7TPW9CoXVZ8yTnILdA/X+
	RfmpMl8yFAJ+gNNF1SbyxKPSUt7gYtfrCNfT6gridsNM+HYosvsVa/XcwfCDh9gkO9ZgTMvmOvm
	yBGDdU5pFN01ZRIbkuNetqCFbJXJYvLTwiNKtCSj8BZw7KvLDHpwf13Izt+uqFdd3ahbEQnL3vk
	Ujgnt
X-Google-Smtp-Source: AGHT+IGyI/+7MJ4IDLyNiZ7HG0se9/Du4KUg/pG6scYz/TegXiOuG86VE+RGX6eH8s+Yzc+aY9yVDg==
X-Received: by 2002:a05:600c:4693:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-4409bcfc14cmr9455825e9.5.1745475736712;
        Wed, 23 Apr 2025 23:22:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 10/19] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Thu, 24 Apr 2025 08:21:40 +0200
Message-ID: <20250424062154.2999219-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_072219_149430_5976CF1D 
X-CRM114-Status: GOOD (  11.33  )
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


