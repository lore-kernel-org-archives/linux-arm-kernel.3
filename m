Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4BED43360
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nj05JeNbx4CnDMtvSdHFQExqg5uMDG7Qle6mMTZ13ik=; b=EcA8JGuXziyK19
	r3RG6p2MXtM+wrqSz6D/XKYEJdTCHYo4vBPOSYUipUfYFZOb/SgQ9sq0NwlyUTAMd3k3MqC8LMoL6
	qZ4CdrdAUjdrQLbUg6GJ/keklkT/vKcqiGfxWGhiTHLst7zS8QiFg98pDVXeNSSgCpTsG+3p8pgE2
	ujlBBXlg3Kt/YNZ+Mq0ms25T42/ZgApvnRAR0e4H59ocblYrjwfqxJ7bz8EldjEzRJbrM2fow0Z+l
	lILCfNzB/5ba4QNdEUUaGr1HaKAZSgeH/SFTDX6Wm81lEK8sxiLV2wJ9FgGBWx41bxjEy1lgYBKSr
	CrHKiA7ACoDgl5c+XHww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t92yJ-00000007C5O-08jX;
	Thu, 07 Nov 2024 13:54:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t92ux-00000007BVh-1Ywt;
	Thu, 07 Nov 2024 13:51:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 802865C58BD;
	Thu,  7 Nov 2024 13:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2D1C4CED0;
	Thu,  7 Nov 2024 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730987481;
	bh=dLpTfBzBR4l3dk9jBKmt+I9L2IwzEPpeAgKAP5o9ehU=;
	h=From:Subject:Date:To:Cc:From;
	b=T1OiSVUqVLAXBaN/1uR2cwpX8Y8CSgSn93azivwoF7bOH8onOWdu+1rmVKVYfXcZq
	 u8pEb8u1xDgsH0eauIFXgmyuIbPf2ErEYsQRP/DsvUC/jKoAM3+V2xkkrvgFZmDS8w
	 ZEZbJ8VHWK123nH9VvhBGcAC4hWTOSbSlWVeOqnX+S6rB0qrqziv2GhwjwMG2uCr5u
	 rY9slBGbl9/qhIf8Wcv4OGI9i0fduvlUTg1fngPI+Q50zsCYP5P6HtD4bsGGS2kIdY
	 eMb8u8GAGkYchsT5qsZfqtR17Is0hOSMcm201ahVo7HA+LBP4oVze4hKTl8afU3XVt
	 m3iTBD4GwgEnQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 0/3] PCI: mediatek-gen3: mtk_pcie_en7581_power_up code
 refactoring
Date: Thu, 07 Nov 2024 14:50:52 +0100
Message-Id: <20241107-pcie-en7581-fixes-v1-0-af0c872323c7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALzFLGcC/x3LTQqAIBBA4avIrBtQy/6uEi3CxpqNiQMRhHdPW
 n483gtCmUlgVi9kuln4ihWmUeDPLR6EvFeD1bYzRg+YPBNSHNxoMPBDgnbqnXZht61roX4p0x/
 qtqylfD+3Q5BjAAAA
X-Change-ID: 20241107-pcie-en7581-fixes-296505fd2353
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
X-CRM114-CacheID: sfid-20241107_055123_490945_C61DBE1B 
X-CRM114-Status: UNSURE (   5.00  )
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

Minor fixes and code refactoring in mtk_pcie_en7581_power_up routine

---
Lorenzo Bianconi (3):
      PCI: mediatek-gen3: Add missing reset_control_deassert for mac_rst in mtk_pcie_en7581_power_up
      PCI: mediatek-gen3: rely on clk_bulk_prepare_enable in mtk_pcie_en7581_power_up
      PCI: mediatek-gen3: Move reset/assert callbacks in .power_up()

 drivers/pci/controller/pcie-mediatek-gen3.c | 42 ++++++++++++++++-------------
 1 file changed, 23 insertions(+), 19 deletions(-)
---
base-commit: 3102ce10f3111e4c3b8fb233dc93f29e220adaf7
change-id: 20241107-pcie-en7581-fixes-296505fd2353

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


