Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD7FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8yg3QvomJv1gMtGn9ahf58zrykZU2YPfuu6iYkEHyPU=; b=eP1iy0oTAv7ssAtRwlvY4FN355
	C7w/xoQWzklMS8Igln6IZWBEo0VM7T1Vq0C3DWgMHOCkn/EORxKLW7BH3089YlhitzObXPSao3htM
	ctjAmbC0Xo2D/jQmxr+vy3WnKUTktgFcBnCzxGBOoKAeqEaGT9ttOJp1kg7KYpj7piAjnc7J5u5qQ
	kS6TtpwXB3Rr62TtM2uvqnhvmi8pV2ypG3i1ZoBk7UDu4NySXAC/TjEic5RXt2bDKoqHx7kQH9WTl
	vuILl3zGzHfZI1fpoR930SlZFc8Vmc+z6iQOE1DZ4FLlEiwCVpCSTVBBzkBPGGTGNy0QWXxQrFcov
	5JbY6MEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufc9H-0000000BLqH-2rEq;
	Sat, 26 Jul 2025 10:29:03 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufc6f-0000000BLZn-3Oer
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 10:26:33 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4EB8D140023A;
	Sat, 26 Jul 2025 06:26:20 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 26 Jul 2025 06:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1753525580; x=1753611980; bh=8y
	g3QvomJv1gMtGn9ahf58zrykZU2YPfuu6iYkEHyPU=; b=hRMxDKfgmXdTBBXXVn
	5oOKx+qV5kptvoBmgbcQQklcVGFwzRM83M77XO7B12TA4FroySZHHtziF0y37jKA
	xwLVkmvedUZSWRuRwHALEKKV00d1VwiBG9alBuTRR+YfDMcfHe8RxEIUouYXX036
	d70JQPyLtul1KM4pqwFjoBFDbIA99dk4TuOOa9fYqwQSgN0G+TDUrhICmcd3a1jF
	1Yi1yF37cL69eayYPz1WTAbgFuAQREm9SgDSRwSPHuVGocYHLOZ+XjBMhBI999Ji
	Tie7uaNwISZj02Xkc7q3JCQO6LdggRjq3elseC+jOdeY4eORTzQQHTUUXsREtvGF
	I3jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1753525580; x=1753611980; bh=8yg3QvomJv1gMtGn9ahf58zrykZU
	2YPfuu6iYkEHyPU=; b=aWsQVayh73rj7OgZcokPEmGlfM94xu4ssID5K5UCaU1a
	Ais7Jlj8gRJ5wbaQuC5N8SGEy4rIpMpGQtNpnhOvGUZkoJbjOZ+OcRujqKuS4Lcz
	SDXjgVCuOR4Ny05cVqP5ObwN/NGRgcD64KTJQiWljHzxS6lCfnsIF24RuFAQbku/
	LynsUqf5vQveTTIeEJwvql7aBnvDZopMi+LORBz4xwts77CaChcx7Gw3iig4gjYx
	BAd1nDTEHBnhe/i7uPnKoniHlfKHXpqJX4wE3qe2xEUD+8a1PC03qWvZBiookM+Y
	OWspqmMcag6EzMIllRM1xHE2Esvgm91AsTrbDnQe3g==
X-ME-Sender: <xms:S62EaAuUtcsYgBN0Hc3VX4FoZE9aW-TCqSdM5mOcG46GnF010LqUdg>
    <xme:S62EaNcGbCvMF35CupxxP-peNlwiRexkYigkpHwNhnulHUAcV67aEDGFPbiB5D0Nf
    aXO-Ms4fOMGYKByDLo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekiedujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegv
    rhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpe
    ffffffheeugfefhfduvefgleeijeektdfffeeijedthfevgfeiieevjeeuteefvdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrg
    hrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:S62EaMuPNB7b4W1qEffNW8bD47C-dApUvk9F7bLvh49SrXs6Ktp0UA>
    <xmx:S62EaE8uyFHoGbReGJWDSDrMMYvlfM7riUmI7paRQZBcID9m7XtvlA>
    <xmx:S62EaOPbS2T01biTkyCHkSPrYtZuRBZPVUiRY61-C2zjVJPn6qNvcg>
    <xmx:S62EaKFONKDqFg_aMDqjekoKzidS0Y7lU8iYqcnHor-JhD6iWCLtuQ>
    <xmx:TK2EaNOnr-llFy8Niy1OQoaBY61k_9lUdsKGcoErLnIXuGdqQpW02MKS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C02C5700065; Sat, 26 Jul 2025 06:26:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 26 Jul 2025 12:25:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Message-Id: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com>
Subject: [GIT PULL 0/5] soc: updates for 6.17
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_032622_267999_731BC29B 
X-CRM114-Status: UNSURE (   6.33  )
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

This release is smaller than most of the recent ones, at 777 non-merge
changesets, but it does include three newly SoC families, in the soc/newsoc
branch: pxa1908 and sg200 are ported over from arm32 and riscv into arm64,
AX3000 and P1 and new arm64 chip families, and QiLai is a new riscv chip.

Raspberry Pi 5 support gets a boost with support for the RP1 I/O chip,
and there is still a good chunk of new boards and added features for
the usual chip families, mainly nxp, qualcomm, rockchips and renesas.

There were 209 contributors this time, with the most patches coming
from these developers:

     31 Lad Prabhakar
     23 Inochi Amaoto
     21 Krzysztof Kozlowski
     19 Thierry Reding
     17 Chen-Yu Tsai
     15 Frank Li
     15 Dario Binacchi
     15 Andrea della Porta
     15 Alexander Stein
     13 Manivannan Sadhasivam
     13 Diederik de Haas
     12 Potin Lai
     12 Luca Weiss
     12 Linus Walleij
     11 Nicolas Frattaroli
     10 Max Shevchenko
     10 Harshit Shah
     10 Bartosz Golaszewski

The overall diffstat is

   0.3% Documentation/devicetree/bindings/arm/
   0.8% Documentation/devicetree/bindings/memory-controllers/
   0.3% Documentation/devicetree/bindings/pinctrl/
   0.4% Documentation/devicetree/bindings/reset/
   1.8% Documentation/devicetree/bindings/
   4.6% arch/arm/boot/dts/aspeed/
   0.7% arch/arm/boot/dts/broadcom/
   0.6% arch/arm/boot/dts/microchip/
   8.4% arch/arm/boot/dts/nvidia/
   7.8% arch/arm/boot/dts/nxp/imx/
   0.4% arch/arm/boot/dts/nxp/mxs/
   1.3% arch/arm/boot/dts/nxp/vf/
   0.5% arch/arm/boot/dts/st/
   0.4% arch/arm/boot/dts/ti/omap/
   0.7% arch/arm/boot/dts/
   0.7% arch/arm64/boot/dts/allwinner/
   0.5% arch/arm64/boot/dts/amlogic/
   0.3% arch/arm64/boot/dts/apple/
   0.9% arch/arm64/boot/dts/axiado/
   0.7% arch/arm64/boot/dts/broadcom/bcmbca/
   0.4% arch/arm64/boot/dts/broadcom/
   0.5% arch/arm64/boot/dts/cix/
   4.9% arch/arm64/boot/dts/exynos/
   8.9% arch/arm64/boot/dts/freescale/
   1.5% arch/arm64/boot/dts/lg/
   0.9% arch/arm64/boot/dts/marvell/mmp/
   0.5% arch/arm64/boot/dts/mediatek/
   0.8% arch/arm64/boot/dts/nvidia/
   8.0% arch/arm64/boot/dts/qcom/
   5.5% arch/arm64/boot/dts/renesas/
   8.4% arch/arm64/boot/dts/rockchip/
   0.9% arch/arm64/boot/dts/st/
   1.9% arch/arm64/boot/dts/ti/
   0.3% arch/arm64/boot/dts/
   0.3% arch/riscv/boot/dts/andes/
   3.6% arch/riscv/boot/dts/sophgo/
   0.8% arch/riscv/boot/dts/spacemit/
   0.3% arch/
   2.8% drivers/clk/
   0.5% drivers/firmware/
   1.1% drivers/mailbox/
   0.7% drivers/memory/tegra/
   0.5% drivers/misc/rp1/
   3.2% drivers/pinctrl/
   0.9% drivers/reset/
   0.4% drivers/soc/aspeed/
   0.5% drivers/soc/qcom/
   0.3% drivers/soc/renesas/
   1.7% drivers/soc/tegra/cbb/
   0.5% drivers/soc/
   0.4% drivers/
   2.5% include/dt-bindings/clock/
   0.3% include/dt-bindings/memory/
   0.3% include/dt-bindings/reset/

