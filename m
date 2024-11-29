Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228FDD735E5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 23:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sujiykjihKResBDt1EJDB2mpOSAnPMhkrJwpaXX7Q0Y=; b=Y0eHRan3Vu6dnl93TVofSdimB7
	gH66G4UhUYot6zQ+sWsGei5BGbH+XcFjdYZKAVlurMjvkOYjnGgkoqZo2Ck0Pl8Q5c1hjsOC8uUuE
	Cl+pdNr9QtcMEbKuz3ym6GGltt4UDU6QpWZhl80p3YF9W6hJbCL4p1or8KveaQ09i2cay7hNStYzo
	hM3iLl08U/UiGk/5iPNNLD92Fv9PjBVy3dxPFuJGww6QwhVE4DO//KROn4nPu/IuWdS24apq2CoP4
	W8jUcTz25r+TfjCsSCwqb1hnpidbl+AjYFBlKN8fvJjZhFEH5lVROUYQhWG0nqzu2G88VCJmJiF14
	mqLyQTxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHAPa-000000016rz-1eC0;
	Fri, 29 Nov 2024 23:28:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHAJ3-0000000162b-396E;
	Fri, 29 Nov 2024 23:21:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60271A43874;
	Fri, 29 Nov 2024 23:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F83C4CECF;
	Fri, 29 Nov 2024 23:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732922508;
	bh=zff8+jE90CeXzoQGgZrfYREKOMGTptEOnRjdJiM7uwE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i2aAenO7PjaXMxVmbrH8v5iL+Nr/zSj3Oo36EWAa8m7R16YaCWQvT3MOk7Lvymtu7
	 3wDMJdGIp+rUzennJFLtqKDUyCwGFudSdTeAL+Rs9JrKAOJYUk5yktGfLuW27IsnoS
	 wl+0vfaTGPNl6/6RNP6KLwUcoI4O7omVzIhRi3gboarCCnib2BMtmKLoRAQ1IN41IH
	 19cgJqTXRjZndL2iTULFhHJ/EQNgrJ7YBh+ve+j/UUrHWgSIx1c946CQXNdrDA4eCa
	 lq0R/tkUxetZCSRaHoOlxwN2Z+OccQiLk9Bm6+Ad5ix8tzBerWOtYmIjmUFK/W2bfV
	 FqEUXsCoZizkQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 30 Nov 2024 00:20:15 +0100
Subject: [PATCH v5 6/6] PCI: mediatek-gen3: rely on msleep() in
 mtk_pcie_en7581_power_up()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-pcie-en7581-fixes-v5-6-dbffe41566b3@kernel.org>
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
X-CRM114-CacheID: sfid-20241129_152149_854970_B5E6D1D6 
X-CRM114-Status: GOOD (  10.88  )
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

Since mtk_pcie_en7581_power_up() runs in non-atomic context, rely on
msleep() routine instead of mdelay().

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index da01e741ff290464d28e172879520dbe0670cc41..0b4367fe2c3387ac55f4f44d8c2aace4df840a37 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -923,7 +923,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	reset_control_assert(pcie->mac_reset);
 
 	/* Wait for the time needed to complete the reset lines assert. */
-	mdelay(PCIE_EN7581_RESET_TIME_MS);
+	msleep(PCIE_EN7581_RESET_TIME_MS);
 
 	/*
 	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
@@ -951,7 +951,7 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	 * Wait for the time needed to complete the bulk de-assert above.
 	 * This time is specific for EN7581 SoC.
 	 */
-	mdelay(PCIE_EN7581_RESET_TIME_MS);
+	msleep(PCIE_EN7581_RESET_TIME_MS);
 
 	/* MAC power on and enable transaction layer clocks */
 	reset_control_deassert(pcie->mac_reset);

-- 
2.47.0


