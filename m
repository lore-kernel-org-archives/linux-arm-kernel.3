Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F55ED5E362
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hj+yKpDG6Oj8U/HfQTfQTrhnazZVOznFiYSZWtlAo1Y=; b=PB1PbIetKfEmyy3dYkS+qFbTyG
	wRXnSpF501SnfncYfy1wzjrWV4H6nAYgx/zlnoW0lSPDoFpdZ5EHS7DjxcHAx312mhkIUiKOdCoo0
	vfxTSa6bxX1eb31AJAV2MtD2SM2TE5z5cA0UiI7gl08MofRxWgvdko88N0BQxo4XLac8JYN0MuRqS
	pef8YPJzb2gvaLIQn9T73jOCUargdjZ17ZLHKrttm1/FTZJ0mWwqVe71DidoL3HcxMjQkRDbK+SIr
	R7ZhCttjLkElLHcVt1OIfe15BLvEJTYvQYn2AaA2gHGT1+NlgMEzZQySmjuY/MB5X01lOLlaoSs3f
	PmpSJRFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hv9-0000000Czyj-1URv;
	Sat, 09 Nov 2024 09:38:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hme-0000000Cyyv-0BRM;
	Sat, 09 Nov 2024 09:29:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6AF95C4A5E;
	Sat,  9 Nov 2024 09:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92281C4CECE;
	Sat,  9 Nov 2024 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731144570;
	bh=+BcPyG4I1IF3EXLrEkXmng4dCXSymF4dMJ8XpkxZI4k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=offz9ekkgH0jrv3N1QGwBDKkc4x9pVQe86sBYqBv2hSxhC2r+0OlPizA+i5isYMQl
	 UghLiaYW0E3ge9qfhleygJLv+tqI2VHtQ7Ro+++S4MaIiBt6/YtYLYuqZGJsIo5bls
	 yk9WZUOb0FRuexfapY9hE2I2U/WaX7S2btTeuHWWMM3nRXA02EbknbKMES2tEk62g1
	 yyO9fiTSdGve+BJYi/jZmp+tdRJuFdodY+Ef/6qd8dVjfR4j7N5kAYPBtTGkRm2R8u
	 MWaTeRxLBLZ0iQKntNGaBmuIejvlFtwnshUoITwld2xXe5f9eFROmRvr2buM3jQz82
	 0jLO9rLs1l6Ow==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 09 Nov 2024 10:28:40 +0100
Subject: [PATCH v2 4/4] PCI: mediatek-gen3: Add comment about
 initialization order in mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-pcie-en7581-fixes-v2-4-0ea3a4af994f@kernel.org>
References: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
In-Reply-To: <20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_012932_165573_21DFD266 
X-CRM114-Status: UNSURE (   9.71  )
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

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 1ad93d2407810ba873d9a16da96208b3cc0c3011..c9981013e59d18ccd3294acdcbd536dd95a0e436 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -884,6 +884,10 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
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


