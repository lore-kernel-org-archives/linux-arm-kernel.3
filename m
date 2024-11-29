Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF91D735E5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 23:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ysfdY1LvLduVleL9uyf0h5NdKNyOB+OXhhYEFf6pMo=; b=mm9h6TqweQGOvBcJw0mGNvtl7Q
	TVAQlsjDKbHDpBnaKE0eIddAembmV61pSXB3hjrh9y5OeYILPUhjC7ivp2XlOxTTtJQQC1nYRvZBs
	ifNrPmXs6TAKL7ghfqmscF+jGrjKVUNTIb7Kkrk9+GQ9241XhQaoAeEBayGm8Lo+6YbGMgegVOumN
	AfprGn1MAVYWvxceGStVh4G1r0fS+mWYZgW28O21b17OkRwIGunecslFmiAz1cNtmhAwGD3Rs7C63
	6sqe4Z2swa1+hOBEkzdLY3VtoB59XOgPY1Pt9gXDIesfRQBgok2WPNDF093bu5lH9qSVRgj5Av/YN
	deBgcTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHAOd-000000016lU-1c0n;
	Fri, 29 Nov 2024 23:27:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHAJ1-0000000161T-0Nwu;
	Fri, 29 Nov 2024 23:21:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A8FA3A412A4;
	Fri, 29 Nov 2024 23:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763F8C4CECF;
	Fri, 29 Nov 2024 23:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732922506;
	bh=RF3q5O23wBAonOVltARg7fJQ3V5muUeYMukIBjPft+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kY4Q+u5MYbYurISr6lmZRf/rHl7NOIa1OCmedWiWjAZvUw/+1U8fqT5DnYLTfhU3m
	 VsasxitWqdDAZNyvSDc2SL3c9np7j/lb/uZlmWoJ8Znibwpx7oRH/Ps18Ts7KI+aDg
	 Ee4DRCBw1VjT4uXl3DKcsJTuhk1FDo+BSvJeze9Qk6Oa4azcgw062GygOwqTxBD8sK
	 2b56+H1bYmcFLuNmhQgPcoBEHZdfPBsd6wgpAIgN9iOCP2domJyndDuHESc7MZG//g
	 fc3itkw/Pa2JpEfelXQ2d4DSSykEm2Ds28H+Frls/XauhqA+1nREDVfw7gS0oWMzOL
	 OjpV5ev1h9NeA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 30 Nov 2024 00:20:14 +0100
Subject: [PATCH v5 5/6] PCI: mediatek-gen3: Add reset delay in
 mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-pcie-en7581-fixes-v5-5-dbffe41566b3@kernel.org>
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
X-CRM114-CacheID: sfid-20241129_152147_272634_35954F25 
X-CRM114-Status: GOOD (  13.00  )
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

Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
causing occasional PCIe link down issues. In order to overcome the
problem, PCIe block is reset using REG_PCI_CONTROL (0x88) and
REG_RESET_CONTROL (0x834) registers available in the clock module
running clk_bulk_prepare_enable in mtk_pcie_en7581_power_up().
In order to make the code more readable, move the wait for the time
needed to complete the PCIe reset from en7581_pci_enable() to
mtk_pcie_en7581_power_up().
Reduce reset timeout from 250ms to the standard PCIE_T_PVPERL_MS value
(100ms) since it has no impact on the driver behavior.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c                    | 1 -
 drivers/pci/controller/pcie-mediatek-gen3.c | 7 +++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 22fbea61c3dcc05e63f8fa37e203c62b2a6fe79e..bf9d9594bef8a54316e28e56a1642ecb0562377a 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -393,7 +393,6 @@ static int en7581_pci_enable(struct clk_hw *hw)
 	       REG_PCI_CONTROL_PERSTOUT;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
-	msleep(250);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 01e8fde96080fa55f6c23c7d1baab6e22c49fcff..da01e741ff290464d28e172879520dbe0670cc41 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -977,6 +977,13 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 		goto err_clk_prepare_enable;
 	}
 
+	/*
+	 * Airoha EN7581 performs PCIe reset via clk callabacks since it has a
+	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
+	 * complete the PCIe reset.
+	 */
+	msleep(PCIE_T_PVPERL_MS);
+
 	return 0;
 
 err_clk_prepare_enable:

-- 
2.47.0


