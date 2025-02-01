Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8AAC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 11:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=husOVBxxb+JwN8Jg0YoEaEiVT0azMwi+L2W2E0taOe8=; b=dyaXTwtlcyx/abEF9weEYGZm8R
	qm4fv7hXOLPHB8CmrmMnhQo8Agy5RROT2AobkmYDpLdv2KaYJ/Q+caPrGN4QbBEWseEBpbD6Si6er
	3UAWitiykuQ6D4i+Qne3eNxKRSeh9I/mKhd47mvEVGKxeHMVOcfSpmbjvQTfmWz0lwkzsVpPTD73H
	3GC/o3qNh3v+OojAP2WxYRjOZnqbYD161tmGCweFVa9rmjnmCiJsEmTvGBRaVwJFLPkEOKrf2o7FZ
	ycS/7Lwxv8BmuaGAeeyf1fWzRpdZZFIWJIEzKOBlfG2FnDEdH1khXdfsqyuANzny+AA7ICXySpvLg
	pb8uRo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teBGI-0000000CBVp-29h3;
	Sat, 01 Feb 2025 11:02:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teBEz-0000000CBO2-2L7W;
	Sat, 01 Feb 2025 11:00:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C41B5C117A;
	Sat,  1 Feb 2025 11:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3286C4CED3;
	Sat,  1 Feb 2025 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738407643;
	bh=JmWAHXdOaXV/M3CCGGuc0twYRRreA4gPfNaDgyIKvt4=;
	h=From:Date:Subject:To:Cc:From;
	b=jObRT3yyoJqHYF5aDMmUTZBS1b4olMA/WGDtswtX1sg1FnX4jM9X0sbWfPaUoPx+J
	 DaW8nU+IKhT+oi13JNz9UOHqQ5Lsk3CLqbwsBheuTzz7O7fLn5BMSUeC7JT6wNcNi+
	 N/IlrlurmoPB/iynqZgAKAdICNNl/zrUx0LUe9xvWBU3voty2uosTzCNcg0e/JHgTn
	 PtbBJoQoVzE+ZfafA7EprUrsl7flCxV1HVdOkmL0r1KFPWJPsYkBiyxG03oVVtFoAp
	 g3AKzNL+/TfIWABKHtTMHSfAFLMbZkQi8QS+MSGmjZKk03poAAh+p24Nd4JQTU5mpY
	 K9IMjjjlGgvdA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 01 Feb 2025 12:00:18 +0100
Subject: [PATCH v2] PCI: mediatek-gen3: Remove leftover mac_reset assert
 for Airoha EN7581 SoC.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250201-pcie-en7581-remove-mac_reset-v2-1-a06786cdc683@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMH+nWcC/x3MQQqEMAwF0KtI1gbailXmKoOIU7+ahVVSEUG8u
 2WWb/NuSlBBok9xk+KUJFvMcGVBYRniDJYxm5xxtXHG8h4EjNjUrWXFup3gdQi9IuFg69H8PCp
 MxlMudsUk17//ds/zAifk0mNuAAAA
X-Change-ID: 20250201-pcie-en7581-remove-mac_reset-16e7b6e3ef06
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
X-CRM114-CacheID: sfid-20250201_030045_653176_7CF75EAB 
X-CRM114-Status: UNSURE (   9.35  )
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

Remove a leftover assert for mac_reset line in mtk_pcie_en7581_power_up().
This is not harmful since EN7581 does not requires mac_reset and
mac_reset is not defined in EN7581 device tree.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- fix typo in commit log
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index aa24ac9aaecc749b53cfc4faf6399913d20cdbf2..0f64e76e2111468e6a453889ead7fbc75804faf7 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -940,7 +940,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	 */
 	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
 				  pcie->phy_resets);
-	reset_control_assert(pcie->mac_reset);
 
 	/* Wait for the time needed to complete the reset lines assert. */
 	msleep(PCIE_EN7581_RESET_TIME_MS);

---
base-commit: 647d69605c70368d54fc012fce8a43e8e5955b04
change-id: 20250201-pcie-en7581-remove-mac_reset-16e7b6e3ef06

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


