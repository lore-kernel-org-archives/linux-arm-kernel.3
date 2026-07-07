Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17661C44502
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d5GjZYWS+HXFEuSqKtCiNCRqZ9WDqnq5NYjxudoT2jA=; b=RiDegcBIP2mpspVedEPwg39Y0I
	Nc1e2ZK38DkKlRO8cBU3AYdyrbRrXqwuQI7IhANrWr1W6ud+qW/d3kFWxAEjeZG+bXt3ceIG2ViD8
	AZCQBLkhLGDWnifugjsjhFkF2frUTMI76bPOhYMgq8A1psf6S+RylbtZeFLceYCPiwVqwpJiGiw1X
	UgLB4Gtf9JBd9QChs35jfs8MYxi1ETS1WBptdk/OfiW1iJ+n9ZBgxuXriLZ65CopWFTWzxxgPKncl
	vZyJ3pB12tsA57yEfK58OEGXxXrXDcLc1NNzP4WGT5fYRhj/WK63Z7FQ44TvAPj7E41LJ4GSUmkUY
	arEhPHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh82T-0000000FNk9-3jBj;
	Tue, 07 Jul 2026 15:48:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh82Q-0000000FNiO-0NtO;
	Tue, 07 Jul 2026 15:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783439323;
	bh=8gT46EyjBlfYuZbNN5epCdtUQ9QymVpdD4NSdErheKs=;
	h=From:To:Cc:Subject:Date:From;
	b=NVXuIkGRkNj8en88XgSrcPw2VkHfe04nh0XKpmCBqbvMIESGVjmvQjY6zDhgc/+m+
	 N9Tjh/g9flqlC51oawWu2bG1Q3Z02icaebkSrx3HNeqg1p+GbcUgNfWiCwRwv3IeXN
	 4MKe0U7EsHfY8qyN8RGavSfcO+I06MSOxY+erYNlhqYhN0wtL/av5wveT2hNy58iyL
	 nrYczeURKlipFYCYGKeC494q19UipLiQ9Nuhg0VWDQ7Q4u+dDjy+P6oqQjsos3sDcB
	 QBuGpK3HzIlxryifmr7NXEX+qFBTt1X/V/5kLX+yfJaRwhpeYqi9YwEJgshVYN8XZ9
	 uEcY9ADsoliIw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5669617E0076;
	Tue, 07 Jul 2026 17:48:43 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com
Subject: [PATCH v2 0/7] dts: Add and use UART AP_DMA controller on MTK SoCs
Date: Tue,  7 Jul 2026 17:48:34 +0200
Message-ID: <20260707154841.198870-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_084847_459772_B02D4D5E 
X-CRM114-Status: GOOD (  10.08  )
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

Changes in v2:
 - Fixed node ordering in mt8188
 - Fixed interrupts in mt8173
 - Fixed interrupt cells and fallback compatible in mt8186

First of all: not all of them will use this and that's sure - but the
devicetree describes hardware, and this hardware was not described on
any of the SoCs that support the UART AP_DMA controller.

Besides, there is also driver support for this controller for all SoCs!

Let's add support for this IP in all of the SoCs that have it.

AngeloGioacchino Del Regno (7):
  arm64: dts: mediatek: mt6795: Remove deprecated UART DMA property
  arm64: dts: mediatek: mt8173: Add and use UART AP_DMA controller
  arm64: dts: mediatek: mt8183: Add and use UART AP_DMA controller
  arm64: dts: mediatek: mt8186: Add and use UART AP_DMA controller
  arm64: dts: mediatek: mt8188: Add and use UART AP_DMA controller
  arm64: dts: mediatek: mt8192: Add and use UART AP_DMA controller
  arm64: dts: mediatek: mt8195: Add and use UART AP_DMA controller

 arch/arm64/boot/dts/mediatek/mt6795.dtsi |  4 +--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 27 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 22 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 22 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 33 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 17 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 37 ++++++++++++++++++++++++
 7 files changed, 159 insertions(+), 3 deletions(-)

-- 
2.54.0


