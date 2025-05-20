Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60926C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8f48gVEq76eu7Jzd10P5hjnjlUphuf3Sf3hfwkaBwg=; b=puffVoVa6kJySnLkeWjGgu+ZjO
	lEhm3eDzf1fexGCK/AmvPhyNgFMowLoKOpeKQJxb+i4CMsdW0bPiDxGIEiJHDyZMI+G+vk7/UaPYO
	NNgHvZDOYYTzI4/XvG9Pjl01lwkFbtUoySGyvTePWQqeM3P4mfhoZ2cYXn5zC4i4EIbB3kLxorB3y
	1R1mHVfN9ht0FbzYd/QVXZ4lA1hogUPhCKD9UgEPjTsYAp99m7JKy7GewzGMqjjjxu09CFkcjGxtu
	wWXBNQHntQBDYSER/P7lZazIlmhgGlR2JjKZpZtf+F0tNJhS0lNHO9is6viLXtWqKgWUf+7jaUR3z
	kH3wx4/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHK1L-0000000CJGD-26fT;
	Tue, 20 May 2025 10:16:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJZV-0000000CFXG-1BxY;
	Tue, 20 May 2025 09:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747734459;
	bh=DBGPnEJJRtWOLGffcQvnQBXkpXJUe5Cw+ywavZ+qnQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JdXto/qrBmxynP/97NRajMT4XAPSguV97LWyK+veoB3dQMr6PTLPvBIPPRnD12YkJ
	 zJhIgVozU9XrSkEdCjIoX1rpdUa5Eknpb1LFMPA87J4thSNPkJNPQvyZcRgfCmeAzN
	 Tx/WRs1DZ1ynCgwjA+kmTkufmibYOeN/5/BgDs6NPtyV062Eqc0jygDx8N9ncA218B
	 nuuri5LlXOYNrq1lvqid6nsBVM5tSiyteGMe9RKpZ82nT2Oyj7PdWgPBpYB950sYlG
	 EHIoP4e/nykfRacACrf5QI2iGbVlyxOlT13LG+1v5Xri9+BJENvdX+NwCmfCGF64x4
	 JSxn25fNmZMew==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BFB6417E0256;
	Tue, 20 May 2025 11:47:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org
In-Reply-To: <20250422132438.15735-1-linux@fw-web.de>
References: <20250422132438.15735-1-linux@fw-web.de>
Subject: Re: (subset) [PATCH v4 0/8] Add Bananapi R4 variants and add xsphy
Message-Id: <174773445869.2947010.18205156294642701979.b4-ty@collabora.com>
Date: Tue, 20 May 2025 11:47:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_024741_496678_150C89D6 
X-CRM114-Status: UNSURE (   7.21  )
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

On Tue, 22 Apr 2025 15:24:23 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> With this series i continue the mt7988/bananapi-r4 dts upstream work
> 
> changes in v4:
> - changes based on review comments in v3 (mostly bindings)
> - changed topmisc unit address to match reg
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/8] dt-bindings: arm: mediatek: add bpi-r4 2g5 phy variant
      commit: dedef1ddbd1bb8e36530626f75eaba786a818dfe
[2/8] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw variants of bpi-r4
      commit: 2bec30e8fc935b0868e87c32685e6f04190b1390
[7/8] arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2
      commit: 45885a2c0bd8a6e91adb2c8897880dca228850e8
[8/8] arm64: dts: mediatek: mt7988a-bpi-r4: enable xsphy
      commit: ba0f084948e1f273c6264b1c8cc3cbed814f3b62

Cheers,
Angelo



