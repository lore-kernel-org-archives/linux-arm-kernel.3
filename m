Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39766606A336
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fbkn0reV;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=cSh9vyw+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V7idvstUKq5Y3g5dooO1YgpGOwROoEie37j6p8edmkE=; b=fbkn0reVKRnVcw
	eFZobGk9R5zgdIdxaFk8zZVY1jcCbrnEAJLfDCkRXpA/kHoLRxTnjl4da6YdjLu4cNvWECzS8vaV0
	ZeA+PnhsvGDjrYIaQ2DAJ6+TvoJzrzM0z5fLDPAI4RNau6BdIQm3dimK5C2dw3O1lNqZE1yNfDYFx
	9wLVr7X15EB3YlgIy91ixFPKEGGPEq4gBEF5KiCbDvuy+K2Adl9G3KBJC3sL1tAEfimhZkzu0k8Ij
	/vd/hkqFmDjNyCpjQEBRfBJEkYmjd7IXje60jn7rh7UEsC3BmeOABUmIRRVZLEZkJbjnrfT4RO1+g
	LBOeYaRIyacTVuEl7ZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxav-000000098dh-3ToO;
	Thu, 05 Nov 2026 13:33:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxag-000000098Bd-2HkP;
	Thu, 05 Nov 2026 13:33:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793885591;
	bh=a03maraQoPJPOSS4qJMpaXsYfopSi59sHbEBuBxkyzk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cSh9vyw+/WrkTy1uo97nSXi1VvuoXyudRP6l6Z/AaK/86m541UeEIEIEQBrMKRO+t
	 2vkmmOOQGRKd7IemcpLwLyOlfgLmeLWsANI3ECBN2QZa9EVoLJZpAiBsF7QpBRlFon
	 NAB/nuA8Hl9FxEWWR5WNS45uGxqCMyOi6N6LFq9uiI361xU8LRfFmKFduqwfxcvgVI
	 fOZ8YJqnUEjksY2j8wF/0I02j5uS+lejDHgDkZAPpo8+P66xmXYYbvSDQgzo/yWkmR
	 65h/DnteNeTajg69LcoCtgqBfF5TjbgRuIgXn0kr4ooo4a8lDmIF67rOO+Gs0mdhgr
	 qZxodJgy3s0bA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A045417E0C7E;
	Thu, 05 Nov 2026 14:33:11 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F0241480047; Thu, 05 Nov 2026 14:33:10 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 14:33:17 +0100
Subject: [PATCH v9 9/9] PCI: dw-rockchip: Add system PM support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-rockchip-pcie-system-suspend-v9-9-a2e55846649e@collabora.com>
References: <20261105-rockchip-pcie-system-suspend-v9-0-a2e55846649e@collabora.com>
In-Reply-To: <20261105-rockchip-pcie-system-suspend-v9-0-a2e55846649e@collabora.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4897;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=a03maraQoPJPOSS4qJMpaXsYfopSi59sHbEBuBxkyzk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrshZYb3BOu/8nm682Cgw0Um/Z9FM/+aUhUI
 i+U/8Y9YZ7A7okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7IWWAAoJENju1/PI
 O/qaNlIP/jN7gAEqv+U8MZsvoZ7/YnCQh4mqb4bXxILeneRRBtNCcSx5iJ05lZ46+DEby+NFqJY
 +iC8VKwwWhe9rLjW5XzG0Hfvmhu8k4tEfTLbI7zU8+Kgk9dXRfSSgzvDkLU+IsFjIfhu4DRKglg
 tZMS3+eV1xehTQfttdAmVRYbIAYWvXYYRy020vKIyzLaI5dcN96h7v+sehedV3CGAWQduIxXO3f
 p+mETp8NBs3Ljw++EdDa0PjBJ6EyUHEWd6x5GX/iZc887Pe0g+v5ShCplngVMPyNXdIHcqEAkb6
 moTFhvCtGIVPxLUS9V4ysT3vQ0YAz1mzl1/3Dow/xSUU04SdGs0qw14uAC+CHoV7c7NxjbXyYvH
 LwgxgmunC96tS8gaUB8NAY+lBdZxa6aMhVDuAywlJKvzXP7bw2KBtQ7f58P/mCBUv9B5o/LIQ0L
 Uu4w4dJRT8TBfc8PtX6T650s4GOQA+MEwOveEw9+2hCSDjDJh47DgEPd9SAgavmE55Ey05gENtg
 XEUEAP799/eNV/9eMHrKy+h7Z4/Q7zsebHr95WicGifChqTrL2Sf2s+wlTrQUXl5075H+qR/sTB
 X+BVg/Z6T2I7nfEg3rBmwiP7unQ1+BSfFsuv9FaVaqn62A0zH+3QAFQaCo4PdmsYAitTzL7xGuZ
 EGRWyKftN1Jm2xB1Zorkxcg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_053318_954849_19491DAC 
X-CRM114-Status: GOOD (  19.63  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 102 ++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index a603475d4450..39faefaf568d 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -124,6 +124,7 @@ struct rockchip_pcie {
 	struct gpio_desc *rst_gpio;
 	struct regulator *vpcie3v3;
 	struct irq_domain *irq_domain;
+	u32 intx;
 	const struct rockchip_pcie_of_data *data;
 	bool supports_clkreq;
 	struct delayed_work trace_work;
@@ -807,6 +808,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 
 	pp = &rockchip->pci.pp;
 	pp->ops = &rockchip_pcie_host_ops;
+	pp->suspend_poweroff = true;
 
 	ret = dw_pcie_host_init(pp);
 	if (ret) {
@@ -1030,6 +1032,100 @@ static int rockchip_pcie_rc_reset_root_port(struct pci_host_bridge *bridge,
 	return ret;
 }
 
+static int rockchip_pcie_suspend(struct device *dev)
+{
+	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
+	struct dw_pcie *pci = &rockchip->pci;
+	int ret;
+
+	if (rockchip->data->mode == DW_PCIE_EP_TYPE)
+		return 0;
+
+	if (pci->suspended)
+		return 0;
+
+	ret = dw_pcie_suspend_noirq(pci);
+	if (ret)
+		return ret;
+
+	rockchip->intx = rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_INTR_MASK_LEGACY);
+	rockchip->intx &= PCIE_INTR_MASK;
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
+	if (rockchip->data->mode == DW_PCIE_EP_TYPE)
+		return 0;
+
+	if (rockchip->vpcie3v3) {
+		ret = regulator_enable(rockchip->vpcie3v3);
+		if (ret) {
+			dev_err(dev, "regulator enable failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = rockchip_pcie_phy_init(rockchip);
+	if (ret) {
+		dev_err(dev, "phy init failed: %d\n", ret);
+		goto err_disable_regulator;
+	}
+
+	ret = reset_control_deassert(rockchip->rst);
+	if (ret) {
+		dev_err(dev, "reset deassert failed: %d\n", ret);
+		goto err_deinit_phy;
+	}
+
+	ret = clk_bulk_prepare_enable(rockchip->clk_cnt, rockchip->clks);
+	if (ret) {
+		dev_err(dev, "clock init failed: %d\n", ret);
+		goto err_assert_reset;
+	}
+
+	rockchip_pcie_writel_apb(rockchip, FIELD_PREP_WM16(PCIE_INTR_MASK, rockchip->intx),
+				 PCIE_CLIENT_INTR_MASK_LEGACY);
+
+	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, 0);
+	rockchip_pcie_set_controller_mode(rockchip, PCIE_CLIENT_MODE_RC);
+
+	ret = dw_pcie_resume_noirq(pci);
+	if (ret) {
+		dev_err(dev, "failed to resume: %d\n", ret);
+		goto err_reassert_rst;
+	}
+
+	rockchip_pcie_unmask_dll_interrupts(rockchip, false);
+
+	return 0;
+
+err_reassert_rst:
+	gpiod_set_value_cansleep(rockchip->rst_gpio, 0);
+	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
+err_assert_reset:
+	reset_control_assert(rockchip->rst);
+err_deinit_phy:
+	rockchip_pcie_phy_deinit(rockchip);
+err_disable_regulator:
+	if (rockchip->vpcie3v3)
+		regulator_disable(rockchip->vpcie3v3);
+
+	return ret;
+}
+
 static const struct rockchip_pcie_of_data rockchip_pcie_rc_of_data_rk3568 = {
 	.mode = DW_PCIE_RC_TYPE,
 };
@@ -1060,11 +1156,17 @@ static const struct of_device_id rockchip_pcie_of_match[] = {
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
2.53.0


