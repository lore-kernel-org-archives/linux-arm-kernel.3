Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DACBD735E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 23:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKmLplaTa6QLDlf3NaD78wvmVhXmikiylJwYqpde5UM=; b=TQuuU80HMnMjQige04EOPfW2n0
	IU79iWsTeZ6gD16os9N4CKZRlNtegiRdNGGGrVDdkCal/FXskwadnYvG/RCk2z62IBLEur2PorX+q
	LBRM1M0MaOba/jjBf5gbA4GUa6jR3WVO5j6VWounYKbACNwLHgkP/mnRHsu7GiRAYWx2oT4TGIXVU
	bb3gFIKVNienw6oEtQ1ORIXWYkrn8nR5atdwxywQxMPPWlrxMiTNtrEE1a9EBbaTR4YSH2CJtpJr6
	UWz3warnh7m3G5JTyLEdU1IOVuJW7DX+4j0fGbm/EtrydRACEUFpw3QJOt4lS6vdpIdOePO2NVLGH
	29K+/kTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHAKp-000000016Fh-1hay;
	Fri, 29 Nov 2024 23:23:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHAIv-000000015w8-1q4o;
	Fri, 29 Nov 2024 23:21:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A9E15C5E0D;
	Fri, 29 Nov 2024 23:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDB9C4CECF;
	Fri, 29 Nov 2024 23:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732922494;
	bh=hl2S2LZwn2smx9ARAoEF8vIrYGRpQBw8WQAXlixKIJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tmpixqmaOETTs+0vhnV4hlMMgX3B8z5zvkAy+PrmhlC2Je2XIGNJG1WSZgBMaigd8
	 mVvexJAPbuaeVBHtDMXQk/bmMHjHUfptc394fRCdG11EKyWsVAUFMw8GOVRtKzSDoS
	 elBn0x5UIK0IgbuPylKK5tKmfvbSGsWiL/njD3Jj7M/HmmGGFSbwSofKs6jvXA9eaQ
	 pvznIbPl5N9ju6kSRW671B+A4LKbwR8wsZoCZ/yroX0ra8GmrmWrToAxt9q4HuRgFL
	 MJCStRSqvDa3xW/yKI4YUhAVDbEHFCEh8ufHlQMfgrhNwFJrjbE58+dz1xh7fugVeQ
	 iiUNQMsmCWANw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 30 Nov 2024 00:20:10 +0100
Subject: [PATCH v5 1/6] PCI: mediatek-gen3: Add missing
 reset_control_deassert() for mac_rst in mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-pcie-en7581-fixes-v5-1-dbffe41566b3@kernel.org>
References: <20241130-pcie-en7581-fixes-v5-0-dbffe41566b3@kernel.org>
In-Reply-To: <20241130-pcie-en7581-fixes-v5-0-dbffe41566b3@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_152141_512976_62662742 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

Even if this is not a real issue since Airoha EN7581 SoC does not require
the mac reset line, add missing reset_control_deassert() for mac reset
line in mtk_pcie_en7581_power_up() callback.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 64ef8ff71b0357b9bf9ad8484095b7aa60c22271..4d1c797a32c236faf79428eb8a83708e9c4f21d8 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -942,6 +942,9 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	 */
 	mdelay(PCIE_EN7581_RESET_TIME_MS);
 
+	/* MAC power on and enable transaction layer clocks */
+	reset_control_deassert(pcie->mac_reset);
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
@@ -976,6 +979,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 err_clk_prepare:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
+	reset_control_assert(pcie->mac_reset);
 	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
 err_phy_deassert:
 	phy_power_off(pcie->phy);

-- 
2.47.0


