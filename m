Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B7FD43FEC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rO/lPSZb8nRec+V1AYL4z/9hDsMUGOgUj+c3xPPWYeU=; b=BoZbIf8TM9jMwdjF3UNjJYLThw
	zgGO36A1iHbIJo/baEy353T7TCA3ML/InvWCtg2AmsINSRcZ89p7gg5QNRBHyj35mCFN3+IMnofjN
	Iew3xyCEU8kWlzxpLvm/5skXNhpjDlteTmD0wuxIttgwBqgBLuEKfBTJbt1wiz+VN/3RO1iTeQCVj
	nSaUz3MwYaXdgrTy+uL8XBgLD0St75YlQ79viYeEq3EplzyN/cYkxQpAqwhLvBHcrfjZVV5N3Sv/X
	Sma9q6D4XEEmGax4RFUc9n/e2psrh23xKTsgIqd8VEmIT0kz9Bir3ht0bV82zXyidVl2CPeIVAvCe
	MYitddFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwpm-00000008itm-0SlL;
	Mon, 18 Nov 2024 08:10:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwlJ-00000008iDL-41WB;
	Mon, 18 Nov 2024 08:05:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9331FA417BD;
	Mon, 18 Nov 2024 08:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C3AC4CECC;
	Mon, 18 Nov 2024 08:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731917132;
	bh=MpFcnXsLs0FykV4/uYqbeWHc6Oz2yoAZD2lwk7/5GiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K3h+wdqc2+vd8N2fSa+a+STJtPFjVQh8ET/uuysZZoioX45SIGX7eas+bA20tJ40y
	 LsCowysdMznZeGxfI5SesbDrjRb/jSiEgg9kqfUhwtgpzZqxKbBAtMRSVqPNtgJAqF
	 ZJDyFfok9/ASFk4o6O4MrYa3xZXi9OPL0CHbFqBPnSk8v2XYa/g5/ssIgyvuKaPBub
	 S4fkZCeVTFvUs+DATHKl7eMFgZJMIzl4K8iwJIblUWeDkKv5uOeu/cM0X7wYYutQZ8
	 a0hfjsrbZEGK4H2tPS7ubg5FmCRPtaxhCP/47d8Qc5isk8rv2kJSoniY/vT5h9gzYf
	 2RjYeW8FaNvPA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 18 Nov 2024 09:04:56 +0100
Subject: [PATCH v4 4/6] PCI: mediatek-gen3: Add comment about
 initialization order in mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-pcie-en7581-fixes-v4-4-24bb61703ad7@kernel.org>
References: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
In-Reply-To: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
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
X-CRM114-CacheID: sfid-20241118_000534_108116_4392ABC6 
X-CRM114-Status: UNSURE (   9.92  )
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

Add a comment in mtk_pcie_en7581_power_up() to clarify, unlike the other
MediaTek Gen3 controllers, the Airoha EN7581 requires PHY initialization
and power-on before PHY reset deassert.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 2b80edd4462ad4e9f2a5d192db7f99307113eb8a..e4f890a73cb8ada7423301fa7a9acc3e177d0cad 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -928,6 +928,10 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	 */
 	mdelay(PCIE_EN7581_RESET_TIME_MS);
 
+	/*
+	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
+	 * requires PHY initialization and power-on before PHY reset deassert.
+	 */
 	err = phy_init(pcie->phy);
 	if (err) {
 		dev_err(dev, "failed to initialize PHY\n");

-- 
2.47.0


