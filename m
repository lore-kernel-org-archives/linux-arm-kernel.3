Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D0AC54756
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNSClxM+jKsd/dTIO05jTh78NvDeoSQJjK54O1MZ82s=; b=N2XI0Hi0Y+aZFRTPYcAluTPVSk
	ExiOVMkA91NPnkXw0lhq/XQf27nVa1r0HxdAXLakT84RSeK/s32QPTvdDsyFWgU5IlV1MlOaR4VL/
	5JWLrsp8sqYoe1BpMyeyeHY1OYB7+9ld+gRIISVPAm+2jm/oqmcrlZmgvdc2iwwnPlU90TFVf/4vu
	CeddSlU8D0G29N+GIHs9yLn+1aXgLto+XEoYReq7Bbt8/22DdpF2WWTvNQ79hw7oCkh7mkVzpPOp3
	otErqAebRQ6/E/yvoZUAkCUlvnBRzvgGlgbfX77b65mH3Ihk0KWD+upgiAfVi/8nSf3IXtGqOVQ5a
	tj2RkD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKIH-0000000CNVw-0TFJ;
	Tue, 20 May 2025 10:33:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHK2S-0000000CJNA-3cBp;
	Tue, 20 May 2025 10:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747736255;
	bh=lztmPtS30ZevqKydVmDOVzb5SAQsRr7i7DGMRE/a6g0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mg7bPV/N1atkKzr5TpefdCZ6m5af5Z6H9Yjk/qPcAq/nTiw7g7hXnT0c+e3n9Zihd
	 ruhWleo4pvMpDHB2arOe1i5JBSTRqGaapLkjcFlNDEGg7GIU4WrCmuEf1O0qsmRaVa
	 lk4/yzYgvhRz36rmEmChHlrB93zm03X6vzn0/CjVQOAmWz0B2uE723L+JA95wPGVZe
	 f30PUeLWGOgp2TSn8Y+oXQrgouDo9H8YHtte75OdWTb87MNwM7L+8pMjTYtPSfACDF
	 nuVu+ty7fypQ1LP1g1RTM7l/6VxRQfjqfoIdD4yUy74xh0oo1S0l6ZNDc6Q/j9Afg4
	 Tprrzi/8NV2Uw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A2E017E0FA8;
	Tue, 20 May 2025 12:17:33 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, 
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250516180147.10416-1-linux@fw-web.de>
References: <20250516180147.10416-1-linux@fw-web.de>
Subject: Re: (subset) [PATCH v2 00/14] further mt7988 devicetree work
Message-Id: <174773625395.3349397.13086242383163646813.b4-ty@collabora.com>
Date: Tue, 20 May 2025 12:17:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_031737_054681_4F879D1C 
X-CRM114-Status: UNSURE (   7.62  )
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

On Fri, 16 May 2025 20:01:30 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This series continues mt7988 devicetree work
> 
> - Add SPI with BPI-R4 nand to reach eMMC
> - Add thermal protection (fan+cooling-points)
> - Extend cpu frequency scaling with CCI
> - Basic network-support (ethernet controller + builtin switch + SFP Cages)
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[04/14] arm64: dts: mediatek: mt7988: add spi controllers
        commit: 21e0977b4c074c393205b601509574820e534122
[05/14] arm64: dts: mediatek: mt7988: move uart0 and spi1 pins to soc dtsi
        commit: 35818d5038e8003745f31d8a535dea245483b61a
[06/14] arm64: dts: mediatek: mt7988: add cci node
        commit: 05c81fe3a6aab2a9df7a067b035ef7f269b66e24
[07/14] arm64: dts: mediatek: mt7988: add phy calibration efuse subnodes
        commit: 22ebf43c4eef099beffc510ec0b2a2549668d8e5
[10/14] arm64: dts: mediatek: mt7988a-bpi-r4: Add fan and coolingmaps
        commit: 1b8747157f8eda93545163f0401d9493780026fe
[11/14] arm64: dts: mediatek: mt7988a-bpi-r4: configure spi-nodes
        commit: 91c09be53d9a66cc93e998d8c3252dc4ef469ae9
[12/14] arm64: dts: mediatek: mt7988a-bpi-r4: add proc-supply for cci
        commit: 2bb566a7f04bc775120d016a232d6b69005f3c97

Cheers,
Angelo



