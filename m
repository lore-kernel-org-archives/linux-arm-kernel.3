Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF27C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 21:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNR/B7AqzdKfH857DzdE8tOVpJSvBSdIIAm71LoG8+Q=; b=3LnMm9vQCyHVDhl11MU3MFHvTp
	iHllyFArhz2yhdNi4Dc+v0a8QLHI0mqvSiLEEarGqP2NHsDC4gHDPMiNkP4qd7AEtyE//a4YWi2mb
	B/5d3e13Ra/B2D3rRSzgZcvpXVIprTRGbq4JXrToSRBQbIth1AK0jKQOHIGwsDCSrm7fonngyExpM
	s3Runha0Y/uRqmBYZAETa6lXqCWL/GdICOukQDMWbcK/iW0G2IrLXpG0JeuaXHZsv4kDXsPfliuq6
	EWpvJhI5m/urpGKZgoamHvu3BFfXFA8qLovxz0BXTSPJWH+YZaxqrhZaQTVXJdJ0gCOM7bnGNrZLF
	p/yh12kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONxt-000000032Ui-3MMY;
	Sun, 08 Jun 2025 21:54:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONcW-000000030Ld-2H9c;
	Sun, 08 Jun 2025 21:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cNR/B7AqzdKfH857DzdE8tOVpJSvBSdIIAm71LoG8+Q=; b=w9VG/uwrH6ldVIbDNCSzexwlcA
	0IkhUzqmyvjr8S5smyyX/m9une4wVH4uaSieDcpqc0vdEgdI/OJckwaOmoF0++WOuysWVwbdKKNOO
	DZiNCTs/0sijtcNrgbwvQmednFxrbPPUH+WXRH8ZYxfB17hNyUJj3xP7iMFp8IU13dFI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uONcB-00F6it-L9; Sun, 08 Jun 2025 23:31:39 +0200
Date: Sun, 8 Jun 2025 23:31:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <linux@fw-web.de>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 12/13] arm64: dts: mediatek: mt7988a-bpi-r4: add sfp
 cages and link to gmac
Message-ID: <934b1515-2da1-4479-848e-cd2475ebe98d@lunn.ch>
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-13-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608211452.72920-13-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_143200_579408_0C9574C1 
X-CRM114-Status: GOOD (  11.47  )
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

> +&gmac1 {
> +	phy-mode = "internal";
> +	phy-connection-type = "internal";

ethernet-controller.yaml says:

  phy-connection-type:
    description:
      Specifies interface type between the Ethernet device and a physical
      layer (PHY) device.
    enum:
      # There is not a standard bus between the MAC and the PHY,
      # something proprietary is being used to embed the PHY in the
      # MAC.
      - internal
      - mii
      - gmii
  ...

  phy-mode:
    $ref: "#/properties/phy-connection-type"


so phy-mode and phy-connection-type are the same thing.

> +	/* SFP2 cage (LAN) */
> +	sfp2: sfp2 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&i2c_sfp2>;
> +		los-gpios = <&pio 2 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpios = <&pio 83 GPIO_ACTIVE_LOW>;
> +		tx-disable-gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpios = <&pio 1 GPIO_ACTIVE_HIGH>;
> +		rate-select0-gpios = <&pio 3 GPIO_ACTIVE_LOW>;
> +		maximum-power-milliwatt = <3000>;

sff,sfp.yaml says:

  maximum-power-milliwatt:
    minimum: 1000
    default: 1000
    description:
      Maximum module power consumption Specifies the maximum power consumption
      allowable by a module in the slot, in milli-Watts. Presently, modules can
      be up to 1W, 1.5W or 2W.

I've no idea what will happen when the SFP core sees 3000. Is the
comment out of date?

	Andrew


