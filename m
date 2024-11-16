Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09506D68BD2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 08:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgXb1td7DF2l84CX27nRb6yiXc8AJKijgPvBho0FrJE=; b=l18nvU0VV0SaEj2ASGwhEj40uB
	gWGArs9fYvsVqhhMzk9nYngMwYSQeDb7i0RPzYhUeL1Ws+8A1NFMw077V8mkaxzs6ww+bvTKz+KiO
	sjTsLiGm5xmxOI5e39bmKnkPnP5nESQaWfwk0BKiihgpnBuIF/XoNuJTpL3PcQcr3qWe91c+8KTYc
	9MYT5/2vNKoI1LTjDKYXU38LevVneWIfhx8oM+7mT/46rgO6NDyy4hYjO8LDh1FKbOidDHNNHXcUw
	f9KOPBAPjcANPjG9JqIOFWWclMg3A523o455YEqWPFunVFszLdohN7LJWG/IJxd3mAFZ9od5khQ8x
	zQhjbYUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCE5x-00000005DwI-2HdN;
	Sat, 16 Nov 2024 08:23:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCE1l-00000005D9V-1PlF;
	Sat, 16 Nov 2024 08:19:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60040A40085;
	Sat, 16 Nov 2024 08:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D290C4CEC3;
	Sat, 16 Nov 2024 08:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731745171;
	bh=GCOmRbv/GyYdnHeXa5q5vrx3cB5TAF+dSdL665F3kuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MO5STveOVD0odbSgLIzSj/yq1GdC7poAi7FEnmHg+3sKxl4fm0Aqp6/mvYCGHq5Jo
	 IlnRpPxwGsZZZbTCIqwFWml87iKrbTZOgXkT4x4SdPGCaSXxD+ySsinDvstOy4f20X
	 QPAfXVTugoivf4Rt+OPYCJ2NUaNpec5IJbjGl+CIJXrBkzGSE/l91lRxft3DnOBpyA
	 uBasviRc7HqVfUHf9t/oFITErP3ptGDhSZ2tcI8s01amyOWeHYM52rSaq80jxbC8Vi
	 ME4uodSh3QS8xpRiNXtwRMQ3X544fERN1CrVKqNGZV/fLlwqcHYGH1Z8Qg2AlpB7nF
	 MT9/VM5giFWXA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 16 Nov 2024 09:18:25 +0100
Subject: [PATCH v3 4/6] PCI: mediatek-gen3: Add comment about
 initialization order in mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-pcie-en7581-fixes-v3-4-f7add3afc27e@kernel.org>
References: <20241116-pcie-en7581-fixes-v3-0-f7add3afc27e@kernel.org>
In-Reply-To: <20241116-pcie-en7581-fixes-v3-0-f7add3afc27e@kernel.org>
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
X-CRM114-CacheID: sfid-20241116_001933_451006_E00979B2 
X-CRM114-Status: UNSURE (   9.75  )
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

Add a comment in mtk_pcie_en7581_power_up() to clarify, unlike MediaTek
PCIe controller, the Airoha EN7581 requires PHY initialization and
power-on before PHY reset deassert.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 2b80edd4462ad4e9f2a5d192db7f99307113eb8a..dd30530a43b1097871acc9e76a7534f30819432d 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -928,6 +928,10 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	 */
 	mdelay(PCIE_EN7581_RESET_TIME_MS);
 
+	/*
+	 * Unlike the MediaTek controllers, the Airoha EN7581 requires PHY
+	 * initialization and power-on before PHY reset deassert.
+	 */
 	err = phy_init(pcie->phy);
 	if (err) {
 		dev_err(dev, "failed to initialize PHY\n");

-- 
2.47.0


