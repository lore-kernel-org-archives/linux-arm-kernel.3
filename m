Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8582AD735E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 23:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UqCAYZFNMu6JnOhaseOWdc80sMo6pY6gxLyDP5it5+M=; b=hC385L/+fjLDaN
	ny/zxUcMuCB84Xyj5bmXCSZERGkc1tdmOSVDsofudYT6TUUriyq1dDmEd8ymXilyEWBfq+WXHkzvQ
	CoWVOb7m3o4tjHNxMvQD0q8atGaZExQkblwn+SbV8/ZGsRqM2IWyDbqHFp2MELfNZajnBb37HBH0d
	JxFjSiAxBsLIeqmvFTTGTObJauy9I+nSOt40utK5xfS3jV5ZtT0IWnaKb5xhpTFSQ8HjS+TeIcc3F
	KziVBg8POYrByg1BOVHVFBBab3smy/jEhhbnHH2avRtByWs1O/QnDyIRe1RheKhAlLLyTmgu9AABW
	byR5RM1+kOJvsBtvwtLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHAJs-0000000168X-25fF;
	Fri, 29 Nov 2024 23:22:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHAIt-000000015w3-1mjY;
	Fri, 29 Nov 2024 23:21:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2008B5C5DE2;
	Fri, 29 Nov 2024 23:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A7BC4CECF;
	Fri, 29 Nov 2024 23:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732922492;
	bh=98GR4l7HhkOrsjECfowwM3AlW16asMwfcWomv8Ndi/c=;
	h=From:Subject:Date:To:Cc:From;
	b=AAH7RPpncQuVKhs/wfigtX6eNrbVR53saE8ZK7JKbCSEcC8NTYDpdrTB7tWJwNmvE
	 NvQDU/F47Xc5MiM3VFPn8ARI8Qs+q4FdrRQuH5AsrjaRN4uReggLx5mrpXJs/vE4mt
	 5U+HuoPvNzbzT6jb3ID0ZUYfMzJyA99fmNJb83DeTEulBxFrdXuOSNfasACpmgcAyS
	 6NfPrMTaYJtb9SxhKXDuf9Z6ONcY/b7VSj23GT+YTVS7Ce5NHuwHSwUIdE+WlvkHZq
	 5yhZHtSfAdiw+P4hXY0rf3d2TpbTBiSRGgzv2bbJcBwYRNKXbLbF5zyTSWRNeYpR6z
	 HLeGDaQkTHPSw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v5 0/6] PCI: mediatek-gen3: mtk_pcie_en7581_power_up() code
 refactoring
Date: Sat, 30 Nov 2024 00:20:09 +0100
Message-Id: <20241130-pcie-en7581-fixes-v5-0-dbffe41566b3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAClMSmcC/33PwQ7CIAwG4FcxnMVAC2Pz5HsYDwhFiWZbwCwas
 3eX7TTj4vFv839N3yxTipTZfvNmiYaYY9eWoLcb5q62vRCPvmQGApSUwvDeReLUGl1LHuKTMoe
 m0kIHD6iRlV6faF6U2vFU8jXmR5de84lBTtN/2iC54DYIVxtAQGcON0ot3XddurCJG2BJNGsEF
 EKQRatsaBoVfghcELJaI7AQwVjv0QYHhn4ItSTqNUIVAtT5XEkj0PrvR8Zx/AAngwF+fAEAAA=
 =
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
X-CRM114-CacheID: sfid-20241129_152139_499511_1A9D18EE 
X-CRM114-Status: UNSURE (   8.27  )
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
Changes in v5:
- fix comment in patch 3/6
- fix commit log in patch 5/6
- Link to v4: https://lore.kernel.org/r/20241118-pcie-en7581-fixes-v4-0-24bb61703ad7@kernel.org

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
 drivers/pci/controller/pcie-mediatek-gen3.c | 61 ++++++++++++++++++-----------
 2 files changed, 38 insertions(+), 24 deletions(-)
---
base-commit: ac9626f643ea9cde795811d924388fa49f2c4c0c
change-id: 20241107-pcie-en7581-fixes-296505fd2353

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


