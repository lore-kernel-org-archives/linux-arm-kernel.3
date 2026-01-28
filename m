Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F67FD46BEE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 18:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/4xNgZc1irIgWz2/dXYtoRGvJYT5RtuSmiXMRgYKOM=; b=m1VPJJDcx+fX9WIvb/4DEY/tq6
	Cdc4nVdxV/OUN9NbWgZSXvUqtDc8rB7UC2/77AH+QHmT/DpHkxmw/bKXUk/sbBkT2MunKZoteGqqD
	dN3ymYhUjmZmgTI0+kbwMbvqhqDF5O5xpWg+u8+jcNqz3PE3xFToc1SKJZsmpR8E0WHXzT9aq6IJH
	eoFWbxKU8/S/6P5BpKeW/rYE73KzAlb/rCTlPNr5RUNYsiYELXNO6rzFD4v10wdged3w0rMIjiR7y
	T4PJG7+kw1EZ698EQfcHMdwVv6FCtAroNu239I8bsHlYcy+rRd8iRh+jq5lqOHW1NyNrFx6HlNzr8
	XDzHv4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlASS-0000000Gd88-2QYo;
	Wed, 28 Jan 2026 18:40:04 +0000
Received: from sender4-pp-g123.zoho.com ([136.143.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlASP-0000000Gd6c-0xbL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 18:40:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769625583; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R++kYFz7gCfMdJMHUcVO2B3uN2gmHB0yIcDza4Rf3UliSC5Ao/2sxbpS2P8j4CCUBALZLflkdQ/ip3fPL400fYRU2djpHiEtUMU5TOP4axFpWahn5qO9MKc3bEIaA1ETeBbsQvTDr2Srhb2PP3bVrWw+SzGikLsRXoOX/TCYI1w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769625583; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X/4xNgZc1irIgWz2/dXYtoRGvJYT5RtuSmiXMRgYKOM=; 
	b=CGzyu1Tl/RcMSxBQ7bdKYz2TR7FYWJevUKhvA5v1NG7oMRBIazhs8IRU/MrzJ93+nwulpDCV78ms1TLV2LBdl6pfU23LJg18Lqf46sq1a8pE/ei5/OxcZ4N/3R0lGzljIL7v8ZXOVWJ8H1HJQE1xeiEglRLtcVGi39+J9+Atn4E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769625583;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=X/4xNgZc1irIgWz2/dXYtoRGvJYT5RtuSmiXMRgYKOM=;
	b=MRp5K8mzfg8OF/g/+voqgixFXJN+bIP9cpHNWJwE0xdj4h0Yt/0BwdlFAnAPXBmo
	OCf9l06Y3IBPnb4QgMvRB3KCSvDFXoMXhQaiRZyaicQ2ROqkGtuYKfJdxKtYllYsOgA
	ezQrCvPJLaTsR9cdGUbfIW+9m8kRKUQ/l4Lrrcmw=
Received: by mx.zohomail.com with SMTPS id 1769625582177877.4278006459197;
	Wed, 28 Jan 2026 10:39:42 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 28 Jan 2026 19:38:51 +0100
Subject: [PATCH 2/2] clk: imx8mp: Mark arm_a53_div as critical
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-ops-parent-enable-fix-v1-2-ff39cc37f98d@collabora.com>
References: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com>
In-Reply-To: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com>
To: Mark Brown <broonie@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_104001_359308_CA2C49DD 
X-CRM114-Status: GOOD (  12.30  )
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

It appears the i.MX8MP does not like when arm_a53_div, or rather the
parent it depends on, sys_pll2_500m, is briefly turned off during
__clk_core_init.

In the past, this clock driver could get away with not declaring the
clock as critical, as nothing ever fiddled with its parent that early
on. However, after Commit 669917676e93 ("clk: Respect
CLK_OPS_PARENT_ENABLE during recalc"), this changed.

In order to guarantee that it keeps its parent enabled during
__clk_core_init if it sets the flag CLK_OPS_PARENT_ENABLE, the clock
must be marked as critical.

Fixes: 669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during recalc")
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Closes: https://lore.kernel.org/r/6239343.lOV4Wx5bFT@steina-w/
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/imx/clk-imx8mp.c | 4 +++-
 drivers/clk/imx/clk.h        | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index fe6dac70f1a1..ee10f845faff 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -655,7 +655,9 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_CLKOUT2_DIV] = imx_clk_hw_divider("clkout2_div", "clkout2_sel", anatop_base + 0x128, 16, 4);
 	hws[IMX8MP_CLK_CLKOUT2] = imx_clk_hw_gate("clkout2", "clkout2_div", anatop_base + 0x128, 24);
 
-	hws[IMX8MP_CLK_A53_DIV] = imx8m_clk_hw_composite_core("arm_a53_div", imx8mp_a53_sels, ccm_base + 0x8000);
+	hws[IMX8MP_CLK_A53_DIV] = imx8m_clk_hw_composite_core_critical("arm_a53_div",
+								       imx8mp_a53_sels,
+								       ccm_base + 0x8000);
 	hws[IMX8MP_CLK_A53_SRC] = hws[IMX8MP_CLK_A53_DIV];
 	hws[IMX8MP_CLK_A53_CG] = hws[IMX8MP_CLK_A53_DIV];
 	hws[IMX8MP_CLK_M7_CORE] = imx8m_clk_hw_composite_core("m7_core", imx8mp_m7_sels, ccm_base + 0x8080);
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..97cac1d623ca 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -454,6 +454,10 @@ struct clk_hw *__imx8m_clk_hw_composite(const char *name,
 	_imx8m_clk_hw_composite(name, parent_names, reg, \
 			IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
 
+#define imx8m_clk_hw_composite_core_critical(name, parent_names, reg)	\
+	_imx8m_clk_hw_composite(name, parent_names, reg, \
+			IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
+
 #define imx8m_clk_hw_fw_managed_composite(name, parent_names, reg) \
 	_imx8m_clk_hw_composite(name, parent_names, reg, \
 			IMX_COMPOSITE_FW_MANAGED, \

-- 
2.52.0


