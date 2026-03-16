Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1311F53D89
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 19:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6YEWYDxsGoIm4yL+4NYvnq6M4+UNpxlTz1wd6uROck=; b=bLMz5h+4GZTCcy/l0mI2r4DSHz
	ud+if41KM1BMOjpYOT/tKwjxLrYI6QwAUk4IVgE1wOkG7TTXICCsy/5wrlDPDxtYDJmYB1gO5nBhs
	ecRrSLxmCMvYbaaAbZceeD6stVeXSCAZccshhl4p7DcHObRRWEGbIqZCibKjUlLir0s6Ik00UnaLR
	7Wf6dmCvff9uexxuwQbYRUfZ8+rA+EpHQ5eH7cEIoWosoyQ1VygQXIyQ479klD05yI1ZBFoahvncN
	5+ZasCOrwkpxMwtfX97yZC++aQsf8x6zUpeoh/qvrF6sus+vTzGN404qKyoPpnhZjfBZSzcd7VLYx
	ede5AsWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DLf-00000004jCo-3Bsy;
	Mon, 16 Mar 2026 19:11:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DLF-00000004inR-2rQZ;
	Mon, 16 Mar 2026 19:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773688259;
	bh=VmFPKdenj3QFsYbLP0ILMBFLE2Mcejoa2t1BOAKrK+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QCFudlw+FYNmjsNVUY55FuI6Uv+hGDglS4rn8tZoRthRiZBpVVJYM4OZWBHopRhYr
	 XgoYxhKUCp9j/QZLfbuXo4gUrdfBFKDjkpNFxl6N9uPVMTMmuzU9Qq+Ldrld8hhlf6
	 1BX7TnsVHOEmja5kw5JwLw8F4WAhFE7tkO41VR6gd1qgCTqtuV29y366YONt6XNcBy
	 hfE47+KQD7SiErY0m66l5/LOsz5jU8mAlY6OS0GyJNHCs7XVztuyH/T19rmhfIgEdD
	 he2qUH98FLS3hiKxg98uQ20s+qPdXf2FyMnMDWk9Ddnu8ZmLos/CJFDQhB++PcCF6y
	 DRKwQDijk+/6Q==
Received: from jupiter.universe (dyndsl-091-248-189-119.ewe-ip-backbone.de [91.248.189.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4ECEE17E1525;
	Mon, 16 Mar 2026 20:10:59 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A3436480031; Mon, 16 Mar 2026 20:10:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 16 Mar 2026 20:10:51 +0100
Subject: [PATCH v5 7/8] PCI: dw-rockchip: Add system PM support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-rockchip-pcie-system-suspend-v5-7-5bb5ad37d643@collabora.com>
References: <20260316-rockchip-pcie-system-suspend-v5-0-5bb5ad37d643@collabora.com>
In-Reply-To: <20260316-rockchip-pcie-system-suspend-v5-0-5bb5ad37d643@collabora.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4482;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=VmFPKdenj3QFsYbLP0ILMBFLE2Mcejoa2t1BOAKrK+k=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm4VcIjnhQdxoD++5bjt1A4x2JyA6ob8cWxr
 h3uWMtEdM4fwYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpuFXCAAoJENju1/PI
 O/qa5IAP/i1HIAFdpdeL08mlUd6WO2+90E9km0y2etMPWJ3Xk6yAUliDhuGID86smEUNWPhZQPI
 8rsTG9JH5hLlpmfyYkhUmStmwzwMOaZ95/2wBMNBxCpoEC8gsfE1cFEdJCTjQDheOOLweFmoYDK
 US6UqC75fxUtC+v56ICEALKYv2ssSUmamF151QPzV4fUY7U0D3H3nTvB7O1tqkFiqH3ty8UlS/L
 wopXLKSpd9+Bl0kNko2kKc/Aa70/BCi6nscgnfFNwIlrDWK3Zgnb5UwHCmupkz5iYPpyAB9Zvja
 gDSWpwZXVtufENBbm1cfgZfXaSM4/N1ZkwQtSV3Ovtnu3M6UvC7f4uINXeEMfqfVsu2SsxGYkFg
 9rBTzenbeoynKwdMchHg83zGHHd/9yqufgCHE984++CzA3IrutXeG9Wc4Ipzh+b7ILSV85TFJC6
 Z+tuL7OUPrHWb4IVKosDQxvMAWMkJZZ47bZ+3zQnKKXE+tCmfonls9A/eIeaL38oYlz/8IMvkl9
 65tqdIhkGVFdb8g8f+PwjeixoPIwT5zJ2ddbp6+77omf9W5djvifdWXDGMmaqU+se2ekTbd4OKY
 MoGzlhhf6dI86x0SMAwZ6XcN5tP7gGBG3QcLvmvY/oyTfnJBssIblriGjFUTCtfgQG458wcKWif
 QpBk0QcpIsN+LkkLyMvo0dQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_121105_899475_B3288EC4 
X-CRM114-Status: GOOD (  20.29  )
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

Add system PM support for Rockchip PCIe Designware Controllers.

I've tested this on the Rockchip RK3576 EVB1, the Radxa ROCK 4D
and the ArmSom Sige5 boards.

While I haven't experienced any issues, most of my tests have been done
without any devices attached (i.e. default board without any extras), so
there _might_ still be some problems. As system suspend does not work at
all right now, I think it makes sense to get at least the basic
configurations working as soon as possible as it will allow us to catch
regressions by enabling system suspend in CI systems like KernelCI.

Co-developed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 93 +++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 147add66db15..3be83feccecb 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -103,6 +103,7 @@ struct rockchip_pcie {
 	struct gpio_desc *rst_gpio;
 	struct regulator *vpcie3v3;
 	struct irq_domain *irq_domain;
+	u32 intx;
 	const struct rockchip_pcie_of_data *data;
 	bool supports_clkreq;
 };
@@ -775,6 +776,92 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int rockchip_pcie_suspend(struct device *dev)
+{
+	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
+	struct dw_pcie *pci = &rockchip->pci;
+	int ret;
+
+	if (rockchip->data->mode == DW_PCIE_EP_TYPE) {
+		dev_err(dev, "suspend is not supported in EP mode\n");
+		return -EOPNOTSUPP;
+	}
+
+	rockchip->intx = rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_INTR_MASK_LEGACY);
+
+	ret = dw_pcie_suspend_noirq(pci);
+	if (ret)
+		return ret;
+
+	gpiod_set_value_cansleep(rockchip->rst_gpio, 0);
+	rockchip_pcie_phy_deinit(rockchip);
+	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
+	reset_control_assert(rockchip->rst);
+	if (rockchip->vpcie3v3)
+		regulator_disable(rockchip->vpcie3v3);
+
+	return 0;
+}
+
+static int rockchip_pcie_resume(struct device *dev)
+{
+	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
+	struct dw_pcie *pci = &rockchip->pci;
+	int ret;
+
+	if (rockchip->data->mode == DW_PCIE_EP_TYPE) {
+		dev_err(dev, "resume is not supported in EP mode\n");
+		return -EOPNOTSUPP;
+	}
+
+	ret = clk_bulk_prepare_enable(rockchip->clk_cnt, rockchip->clks);
+	if (ret) {
+		dev_err(dev, "clock init failed: %d\n", ret);
+		return ret;
+	}
+
+	if (rockchip->vpcie3v3) {
+		ret = regulator_enable(rockchip->vpcie3v3);
+		if (ret)
+			goto err_disable_clk;
+	}
+
+	ret = rockchip_pcie_phy_init(rockchip);
+	if (ret) {
+		dev_err(dev, "phy init failed: %d\n", ret);
+		goto err_disable_regulator;
+	}
+
+	reset_control_deassert(rockchip->rst);
+
+	rockchip_pcie_writel_apb(rockchip, FIELD_PREP_WM16(0xffff, rockchip->intx),
+				 PCIE_CLIENT_INTR_MASK_LEGACY);
+
+	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, 0);
+	rockchip_pcie_set_controller_mode(rockchip, PCIE_CLIENT_MODE_RC);
+	rockchip_pcie_unmask_dll_indicator(rockchip);
+
+	gpiod_set_value_cansleep(rockchip->rst_gpio, 1);
+
+	ret = dw_pcie_resume_noirq(pci);
+	if (ret) {
+		dev_err(dev, "failed to resume: %d\n", ret);
+		goto err_deinit_phy;
+	}
+
+	return 0;
+
+err_deinit_phy:
+	gpiod_set_value_cansleep(rockchip->rst_gpio, 0);
+	rockchip_pcie_phy_deinit(rockchip);
+err_disable_regulator:
+	if (rockchip->vpcie3v3)
+		regulator_disable(rockchip->vpcie3v3);
+err_disable_clk:
+	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
+	return ret;
+}
+
 static const struct rockchip_pcie_of_data rockchip_pcie_rc_of_data_rk3568 = {
 	.mode = DW_PCIE_RC_TYPE,
 };
@@ -805,11 +892,17 @@ static const struct of_device_id rockchip_pcie_of_match[] = {
 	{},
 };
 
+static const struct dev_pm_ops rockchip_pcie_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(rockchip_pcie_suspend,
+				  rockchip_pcie_resume)
+};
+
 static struct platform_driver rockchip_pcie_driver = {
 	.driver = {
 		.name	= "rockchip-dw-pcie",
 		.of_match_table = rockchip_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.pm = &rockchip_pcie_pm_ops,
 	},
 	.probe = rockchip_pcie_probe,
 };

-- 
2.51.0


