Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BF4D43FED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 08:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1XFIY4vyzNRi8PkU/A4cigtz4FbyZS5iygLc4aU1FmA=; b=GFYmPLlgbhysEX
	Bt9puL2PqRv72A7q/DjNFj/5JYQe+Q2K6GvoI4+JDpjqYE8rtD3qAORcjs1AujI0dKznZCxmIZeQt
	XEbWgd9htTWSBN2T1M2s8TO07YEJ6iMyNVzcJtmB/N0cvlVEimO46u74lZiY4kQkdlsoIN0kO2j6v
	QenQpKN/tJf5mqCFCVJ/CoLFatbnp/NeUzqY8Z3VkbRpwDqhqHhysWZtN/xdtZ74rugy+utR4HOnE
	ctkzWHNmIw4L0txbzW+laWcES2OGmS4AzRkk5B78Etk0Bhlwn4xnTeuKWefvQ+j76n7qKImZjeb6y
	RiYy0ufG1nnT4RkQ1T6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwmA-00000008iM5-3y45;
	Mon, 18 Nov 2024 08:06:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwl7-00000008i99-2vBW;
	Mon, 18 Nov 2024 08:05:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 174AA5C475F;
	Mon, 18 Nov 2024 08:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C4FC4CECF;
	Mon, 18 Nov 2024 08:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731917119;
	bh=spc3BCehefvXljejaMy5S4i/Hscl4iY4xnBC2Qdg15c=;
	h=From:Subject:Date:To:Cc:From;
	b=R5McfxiwncmtwJFZJqpiAZSKCwY5xQdooOFsayfh93oAjStTekaQAnN8d/fTGN7I5
	 droBPbTp9y4oQyKuOO3/7/HP3OaXF2Q/0fc9zm3p1ToRXR5AzKBjymxf6K0Fk4MVL4
	 f9mb+uUbRS837jZ0SF5lc2F2EroFt/w0RQcFDwZOh1NRtCSOAPvAEKwQyqTmoaOrVF
	 yYiLzIQbQ/8Wls+brL71qATyY/8lPjOOTNX4/FrXHa0vOgAs3mYVT8rceU/TADJCLd
	 xFElGNNVJgGVYoU2zFHDrMrrEYNas/zo4cHA816IR9GmX0oegMaq9knSlNfRM6yPZo
	 DNOkpves5rnjA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v4 0/6] PCI: mediatek-gen3: mtk_pcie_en7581_power_up() code
 refactoring
Date: Mon, 18 Nov 2024 09:04:52 +0100
Message-Id: <20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACT1OmcC/33NQQ7CIBAF0Ks0rMXAAKW48h7GBaFDSzS0AdNom
 t5d2lWNxuX/k/9mJhlTwExO1UwSTiGHIZYgDxVxvY0d0tCWTICB5JxpOrqAFKNWDac+PDFTMLV
 iyrcglCBlNybcDmV2uZbch/wY0mt7MfG1/adNnDJqPXONBgHC6fMNU8T7cUgdWbkJ9oT5RUAhG
 FphpfXGSP9FiB3B61+EKITXtm2F9Q40fhDLsrwBzQUyGTkBAAA=
X-Change-ID: 20241107-pcie-en7581-fixes-296505fd2353
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
X-CRM114-CacheID: sfid-20241118_000521_784685_D526D7CA 
X-CRM114-Status: UNSURE (   8.39  )
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

Minor fixes and code refactoring in mtk_pcie_en7581_power_up() routine

---
Changes in v4:
- fix comment in patch 4/6
- Link to v3: https://lore.kernel.org/r/20241116-pcie-en7581-fixes-v3-0-f7add3afc27e@kernel.org

Changes in v3:
- add trivial patches 5/6 and 6/6 to the series
- rename err_clk_init in err_clk_prepare_enable
- fix commit log for patches 2/6 and 3/6
- Link to v2: https://lore.kernel.org/r/20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org

Changes in v2:
- added trivial patch 4/4
- improved commit logs and comments
- introduced PCIE_MTK_RESET_TIME_US macro
- Link to v1: https://lore.kernel.org/r/20241107-pcie-en7581-fixes-v1-0-af0c872323c7@kernel.org

---
Lorenzo Bianconi (6):
      PCI: mediatek-gen3: Add missing reset_control_deassert() for mac_rst in mtk_pcie_en7581_power_up()
      PCI: mediatek-gen3: rely on clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up()
      PCI: mediatek-gen3: Move reset/assert callbacks in .power_up()
      PCI: mediatek-gen3: Add comment about initialization order in mtk_pcie_en7581_power_up()
      PCI: mediatek-gen3: Add reset delay in mtk_pcie_en7581_power_up()
      PCI: mediatek-gen3: rely on msleep() in mtk_pcie_en7581_power_up()

 drivers/clk/clk-en7523.c                    |  1 -
 drivers/pci/controller/pcie-mediatek-gen3.c | 60 +++++++++++++++++++----------
 2 files changed, 39 insertions(+), 22 deletions(-)
---
base-commit: ac9626f643ea9cde795811d924388fa49f2c4c0c
change-id: 20241107-pcie-en7581-fixes-296505fd2353

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


