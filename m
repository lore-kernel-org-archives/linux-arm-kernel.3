Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA34FCC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o35PHDe/WaanrdpB4YPbubHCz42M3a4P2DweWS1SB0E=; b=cPk0jqfoGUkF6tuagUAALsFWo+
	X59KUpROWW4G9ifXLwYuL1xL7SMU9wYkq6TgUlS2wlM5Y2dWPeSs0oRHwZtfwHcN6zyt8r8dkSL4e
	/0dttmHT8KhqjIK8crH/gPMCiT0YqAswuOCjJADu1Ouz/gFT0gXwyxWxZo29iMqA8oeyHOFWr0iPu
	zHUJx1D4STiST5lP1KF1AC51MRbLhnbSCKMXgSITF6mMUcUuArCIvW1WAVlPCnIqzgyTbXsOsYQ2L
	HlT6vorzVI0/vcxHkbV2ZA94niJA9XE+yiS/7h3UIxelj8H4gKZxFpqyDizFTf52Lp29pZpknfO+1
	VOku9ALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJo-0000000DIn9-1JS7;
	Tue, 13 Oct 2026 15:21:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJ5-0000000DIA7-2Fru
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 15:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o35PHDe/WaanrdpB4YPbubHCz42M3a4P2DweWS1SB0E=; b=LvFD2BAY6YyjNIksr8I4dN+24X
	JLj9SXb/k167AznZCsoHRIOP48NKCASLV5CDZdxiKfKE3Nan8fiKxCn8YblXQO2ndHweNsFSy7qDF
	yKoCTjE1Muw0jAmWf63PRvHUE2bnXv7Ll0++ajlygiE2wIHzYPIv+fgR6je3mDDlDJS6NmY69aIrJ
	yqHDOU2eLsOD7uJ/fcq7CPtjB3H6X7utImXGEWQm5mr/3z7fYctUkYISg0gJdf49PQsPAehdbdt2L
	/QDiYJ5Pdo//HX03ltRfFRwYGH4UeMRw8AgqgCNuea5JLcyRV4FoKrXp7scNl/U4KvbaOJGR84Z3o
	9tkNN8EQ==;
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGeJ2-0000000FhgX-1WJi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:20:46 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so1369653a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904842; x=1792509642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o35PHDe/WaanrdpB4YPbubHCz42M3a4P2DweWS1SB0E=;
        b=Brl/KBsR/yUxPYSZNXEXQCULF+fP4M3EDqJJbuyStpgAtJrkYX3Sq9gTXmlnWsnr4k
         J5hrms72nid3P3evQLLLHlVtoPdm/cexNEDu20nZMmyi0XPw7TaBd4+c0Z3hEA99YW7X
         4G2YfvqAXGKrjOM/2rt2EUsWLNzVpwYbrf8dDrqsymdHjV3cvMDc3AOeRIY7CrdgzFgX
         1p7P3NEFxJ9PAJHt9aGtQ5j/YF21iOqL6wmfapahJe2m/N1eMfXQzghLoOu1tSQdyrUG
         z8eb9w0zIWBMts45O10zYMrETslrSpJDNqB6z8jKkzfq0ogEY2Bx2Tn03aoDXwmoNFjm
         sIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904842; x=1792509642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o35PHDe/WaanrdpB4YPbubHCz42M3a4P2DweWS1SB0E=;
        b=fo3p6+Tp/0b5Ylx2yaHwGksaSg0iIlKCXsCy86TV0L4MQ1QcvqW35Sq0zZcSbhmJQ4
         +XJOCchXlWoLGaPqLwQP8rHldjAeqYmMEBxx8DRXmxE0DI7puQL2WObzIl19Y3RytNXr
         zVmWEmvAMof8GrlnxowbznBNy44gAkS77mk6AWhh4lORtimt+wsmZhynGxiALcc/zMPN
         s2K7CJGQBFZl9DWl+JOOK30z7CDBjKTgaz3yg2nMpDe3LouxHUwm+4j6RHDdaAfWnzXP
         C3oPeFYEY1kgf8Mfh/4GfCXnhALflWUfgjPAsjskoIeUtIrz/7/ZT9FgWRHMKgdDBpIh
         ulXg==
X-Forwarded-Encrypted: i=1; AKwUvBxQkfG0qXXK6vorBk1Aw9SxNYnI8DWBBIN7v7ET3Xlqvn5EiuWJer3mIRbhrV/FHPccWbOGTUNFz4wpfp6OXPRa@lists.infradead.org
X-Gm-Message-State: AFq9FYLTNtVYE9wTmyrFTWxJC5Z0ZbWo0kJyDm+ARxxLJMsjJLdlIQT/
	m6giwRVT6cAigkum0/2d4A4CqGTgewGmCEcX7Qq7Stsy/WB8LzlXn3T3
X-Gm-Gg: AYBFou09coxU6KKV7c3kLCjtYvvgCES18NG0v21TOBVaS9+LNtcWk9PCm4wBGJhjYPk
	ccv+A12zFtik5T+22yuinPMPFRCFO3Z8M+rzmd85jTshJZKOr76Pu6/htY6s0t1N1z3NKJrhalO
	OmWxmCkpiZZM+3BSwHjrwO2v6Y7f1fa326i+LocT4jKseVOqXXsAjx6nCDtJR4xg5qTtWOw0iuH
	a0PDFaG55Ai3ZNsLNPo/+IIR64cYEtWGkOvA1QvZwIKWwp/p8ilypMz83AWahqJljjImj3/54Zu
	x7VkSjjIC5Ij5+H8WU21E6b1SE0Y01/MA59CDbAjFP0jN6fyx4NHdgDhWwW2S2UE8/NQO7KbMNL
	7BwdUiNNDQZv2j2tIGlIDTlOiNbrTs1JYZ5EhCINVFpgZWR40z7WoL362vzwkfd5iIBZKm2cd2y
	X6jJ0igjZu36CW2Bn3xOTpQjdeKPwsHCTGbjFBssi12Zl9x7l57paCJ7Q7TPQqZuC0evtpdjdIp
	vER6HaJmF8WVxTzWON79bDfixH1UfjJUv51Zjo=
X-Received: by 2002:a05:6a21:8217:b0:3dd:a00a:c5ba with SMTP id adf61e73a8af0-3e16c02df28mr13473096637.45.1791904842064;
        Tue, 13 Oct 2026 08:20:42 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:40 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 28/35] clk: mediatek: mt8173-infracfg: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:27 +0900
Message-ID: <20261013151734.3177690-29-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_162044_607716_DF113FB2 
X-CRM114-Status: GOOD (  19.80  )
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

The MT8173 infracfg driver previously needed custom probe/remove
callbacks to register and unregister cpumux. With cpumux support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Drop the CLK_OF_DECLARE_DRIVER early init for infracfg; the kernel's
deferred probe mechanism ensures dependent drivers like cpufreq are
initialized correctly.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
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
2.56.0


