Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BF2C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNLXS2ez3G7NtIzmW+K0Ec5UFQW3DCf7KsBaQsnVv6s=; b=FkksvEFCNwr68Evyn8kMegxFqX
	oRepVl/NuCaIAomhdYviEuZ0CN3CR75FxRdPCvv4VuPl8Fu7F/U6wFZmEOR0mwMYvCo/9QcuZGLSf
	GIyRDJvVkYzet1WnUhs37ffVPzhlIRXlVRK5OnCB5SOzTyAokcvCifWUMckKc/RA/LbB60699bca3
	0k0vgyyFXrLZ/ruYPTYCnR0gdid1HobbQ3F6c9eK1LmSZQrlzbE1rbppFL64V15QKp71vYGTiWOlR
	y3VzaswVA71Kaaj9kpSO3vw75x0miC+feuWUsb3Gvcw0Fo2P6WWFgj1YXTPgIaYgIS4gPmiqlnD/z
	+PQDbOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVn-0000000HMBs-00pY;
	Mon, 03 Aug 2026 14:19:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVm-0000000HM95-0vj0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Aug 2026 14:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HNLXS2ez3G7NtIzmW+K0Ec5UFQW3DCf7KsBaQsnVv6s=; b=a8yzz3mQxaEs0u+yzGMSFnPVyq
	5O4rQ5IRS/jfcSsuHcTrHrBtcUCbCjeUpIOb+Gbz0vOcGVz66b5637nTMg9SDQgWrVmtmM7m03+Rd
	93MLsAbbFoEgj+R9XtWSeAY3gxcUnCEeta6ifjPBIM1nUUqmBuiASskoVCwACSzXGOzNwtSFVny+r
	UGj+613WSoGfbCmhf+dF+bZIpGEZo55QkhUlqcz+GL0/OeG111oMoGRNboXEbn6DxYEcReSejJQFh
	XrLuxMxs9s7UkYQC8g8enooTOrB+zyEY145eYyNhd7vzYvRX2LEtXDKNw81UbnTKJ01Yx0NSXypn9
	zxkcJpyw==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqtVj-000000092IM-0NM7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:25 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so3220020a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766761; x=1786371561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNLXS2ez3G7NtIzmW+K0Ec5UFQW3DCf7KsBaQsnVv6s=;
        b=fDTIXjAUSe7lV2E4PdQxexN5KSHq6CDS7R+bwlbQE5xQ2ZFBB3Mz7UtEvJ05PfAP92
         gOQtYZilrclFvxEj+JKHqHS7f5ATBGLcB8p1Br1l17Md/g0rzfpA76L7ZAxCX/zhAyC6
         sdrs2TZyXmCeKWHJ94oK4F7liFrkG2pgjKOq1DvRWW3JZch00/XgjAg8aZFtbrwbIfOz
         E77D1CoKZNN+ZkN9MangeOganNjJbbrjUowYjY8Vc2bWk1zwcQZiZOGxp7pVcLg+dOkf
         t+RcN2jG2W+ksLbyNhN6KkTpeNu27v948dD7Hy4cNYy8U8VwLQZV53Q5eNyeR/e4RLfe
         DVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766761; x=1786371561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HNLXS2ez3G7NtIzmW+K0Ec5UFQW3DCf7KsBaQsnVv6s=;
        b=MX/ClVk/FzuT11Q0rPYByR4Syo1IjskgOVpq/aS9eMuO5LDosS2C0Wvfs0wUriDxCA
         eZFPqFRGANlgLiTgNDJmWvHkHEyLVusZcUJMQQnpUFclkQZ0C3zzHkz9omTkAcuv9nxc
         9M6HoSOe6mUnn2UygD3GazxiYlBqEyx64m+n/TrSjxGgONLG+4kS8d79hReAXkO6psiW
         i72ZopNfinPocfFzB0rIOBiDbwNrQp3797A4ZFPv60dZ/Yd3VkChQnDKVrctQNpDz8nz
         aUif966Y9QbDB6foJ/jOKa6fWSqt/HK1wsbPQQEyCblk2NYAwgjZJ4s33LDcFv4u5pHT
         jdNA==
X-Forwarded-Encrypted: i=1; AHgh+RqRBLP1EcLGP1J7n51mnm/S3Yry6KPbS6jKyXjpGPKu4QnQhCZUmWKSyn04S5UyrchUM6mUFSmDjsTWtZdZNVyv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9If7iqmvKw2QF6Z6QZn03+xEonvV5nasUBQzC+gqNVKr55bHC
	mQGjbjxnS44CxMnQXsMlaGbM0ProDzF3cj6QTGspw2lAc2X9Lt9MiFdG
X-Gm-Gg: AR+sD11ZXIrLe03olTKD+1M25/rsZVt7eCKSpQ8pgQeIs9H1ad9Cw/DBa2LTVrJLfVv
	1RDcLPpUWRzjhg0CEnkZypkLApDyu9K/haWd97Sdq8oADGa8H+19hWP6iWRYSsM1T9C+hAyjyKn
	ajuUivlKmSaj3Hfgb2Q4fD/A02X3luZBZBk81mzyzaerDF5CkvvGZRrtKZcW7A8/l37hWPF5zI2
	3Xk+kd04jInSkmIm9gDx64J8oNotv6z/5uXVkFuiTyJ0j2UrNhOPy7/A7qFqLQLyQ3+4rDQJqLp
	+5R7I5sQcIqzejfhDP43tuSYJBtbgNA8TiHmzN+/1RZz5zyzTvnY7RM4uOp7dhbhZ03WWJaxyKE
	R+6tEM1dxf/MKMQF9FzzouaedKLOVP9ROPVOre4RaFw3tAohap3hyAbzSDJ8L/6mYjcgOr1D4N5
	OLwHXy1crgBa079bWsHZdAwgJLjuRvXpQky9jJnctLHalonsYI5AMqLSOqmlwK97d1KljNcrFv1
	LuoGuAoKwrtBdZTVsR1
X-Received: by 2002:a17:90b:4c51:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38fbc3f9ab6mr9427013a91.7.1785766760964;
        Mon, 03 Aug 2026 07:19:20 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:20 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 25/32] clk: mediatek: mt8173-infracfg: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:52 +0900
Message-ID: <20260803141659.559129-26-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_151923_427626_84B3BCF1 
X-CRM114-Status: GOOD (  17.62  )
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

The MT8173 infracfg driver can use the MediaTek clock framework common
initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Drop the CLK_OF_DECLARE_DRIVER early init for infracfg; the kernel's
deferred probe mechanism ensures dependent drivers like cpufreq are
initialized correctly.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-infracfg.c | 100 ++++-----------------
 1 file changed, 16 insertions(+), 84 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index 9b8c35897789..fdd994736e83 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -17,22 +17,20 @@
 		GATE_MTK(_id, _name, _parent, &infra_cg_regs,	\
 			 _shift, &mtk_clk_gate_ops_setclr)
 
-static struct clk_hw_onecell_data *infra_clk_data;
-
 static const struct mtk_gate_regs infra_cg_regs = {
 	.set_ofs = 0x0040,
 	.clr_ofs = 0x0044,
 	.sta_ofs = 0x0048,
 };
 
-static const char * const ca53_parents[] __initconst = {
+static const char * const ca53_parents[] = {
 	"clk26m",
 	"armca7pll",
 	"mainpll",
 	"univpll"
 };
 
-static const char * const ca72_parents[] __initconst = {
+static const char * const ca72_parents[] = {
 	"clk26m",
 	"armca15pll",
 	"mainpll",
@@ -44,7 +42,7 @@ static const struct mtk_composite cpu_muxes[] = {
 	MUX(CLK_INFRA_CA72SEL, "infra_ca72_sel", ca72_parents, 0x0000, 2, 2),
 };
 
-static const struct mtk_fixed_factor infra_early_divs[] = {
+static const struct mtk_fixed_factor infra_divs[] = {
 	FACTOR(CLK_INFRA_CLK_13M, "clk13m", "clk26m", 1, 2),
 };
 
@@ -70,95 +68,29 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
 };
 
+static const struct mtk_clk_desc infracfg_desc = {
+	.clks = infra_gates,
+	.num_clks = ARRAY_SIZE(infra_gates),
+	.factor_clks = infra_divs,
+	.num_factor_clks = ARRAY_SIZE(infra_divs),
+	.cpumuxes = cpu_muxes,
+	.num_cpumuxes = ARRAY_SIZE(cpu_muxes),
+	.rst_desc = &clk_rst_desc,
+};
+
 static const struct of_device_id of_match_clk_mt8173_infracfg[] = {
-	{ .compatible = "mediatek,mt8173-infracfg" },
+	{ .compatible = "mediatek,mt8173-infracfg", .data = &infracfg_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_infracfg);
 
-static void clk_mt8173_infra_init_early(struct device_node *node)
-{
-	int i;
-
-	infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-	if (!infra_clk_data)
-		return;
-
-	for (i = 0; i < CLK_INFRA_NR_CLK; i++)
-		infra_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
-
-	mtk_clk_register_factors(infra_early_divs,
-				 ARRAY_SIZE(infra_early_divs), infra_clk_data);
-
-	of_clk_add_hw_provider(node, of_clk_hw_onecell_get, infra_clk_data);
-}
-CLK_OF_DECLARE_DRIVER(mtk_infrasys, "mediatek,mt8173-infracfg",
-		      clk_mt8173_infra_init_early);
-
-static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	int r, i;
-
-	if (!infra_clk_data) {
-		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-		if (!infra_clk_data)
-			return -ENOMEM;
-	} else {
-		for (i = 0; i < CLK_INFRA_NR_CLK; i++)
-			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
-				infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
-	}
-
-	r = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
-				   ARRAY_SIZE(infra_gates), infra_clk_data);
-	if (r)
-		return r;
-
-	r = mtk_clk_register_cpumuxes(&pdev->dev, node, cpu_muxes,
-				      ARRAY_SIZE(cpu_muxes), infra_clk_data);
-	if (r)
-		goto unregister_gates;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, infra_clk_data);
-	if (r)
-		goto unregister_cpumuxes;
-
-	r = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-	if (r)
-		goto unregister_clk_hw;
-
-	platform_set_drvdata(pdev, infra_clk_data);
-
-	return 0;
-
-unregister_clk_hw:
-	of_clk_del_provider(node);
-unregister_cpumuxes:
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), infra_clk_data);
-unregister_gates:
-	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), infra_clk_data);
-	return r;
-}
-
-static void clk_mt8173_infracfg_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8173_infracfg_drv = {
 	.driver = {
 		.name = "clk-mt8173-infracfg",
 		.of_match_table = of_match_clk_mt8173_infracfg,
 	},
-	.probe = clk_mt8173_infracfg_probe,
-	.remove = clk_mt8173_infracfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt8173_infracfg_drv);
 
-- 
2.55.0


