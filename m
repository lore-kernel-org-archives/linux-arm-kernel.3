Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7044EC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 21:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6K1DK8TwWXVFwtnP7hylwxjWAnaQ8nQe4sIAcH0KiI=; b=XzCokU6rWat99uFyx+dKc1Wqeb
	W8gO2c93t5zcN6TkZ3qav+nXFCotaN9ia5kEj/u7osiuej8bYvK69TcPhAtJZrdPtaVtdotKTNub5
	ScTBIPAQ3c91tderGfcZTsBCpdD5KFkRuzoWtrmnPR0h374mSBxfsUbG3EooGRaS5wm/9FPk7kaSv
	pXS6VpVj4i9ywvD/aAu5kfhL63P0gnqeDCWuN6R2KjOM5UCXW4bkr6kdRcri/Cj31wOr/vHJS2SYT
	1Re8/IbOqnEaJV81AmIeIXfoTOb94XCTxtoJafpIzvIEkJRks2kTxULx0NZGVOqWO2Qshr5boaEKe
	TxdtbKVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONrb-000000031uT-1yQC;
	Sun, 08 Jun 2025 21:47:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONUW-00000002zU2-2Hnk;
	Sun, 08 Jun 2025 21:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=t6K1DK8TwWXVFwtnP7hylwxjWAnaQ8nQe4sIAcH0KiI=; b=AE0wCESVzCTtp0M8ElqNVDGXRM
	oGFM+uCGOfAOyb9B0QkwBlohtYwCV54AeYrviLNRh09FEZZ1gi+HBm2qSYdOXZkp2gl1Os+5gOl2n
	JGHmqqGaG2RRZpE83eoNbG+VjkxTaZ/EzB1CHOFam8alz/6jwvvpf+eXZzU2QF1nwqtY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uONU2-00F6eS-Px; Sun, 08 Jun 2025 23:23:14 +0200
Date: Sun, 8 Jun 2025 23:23:14 +0200
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
Subject: Re: [PATCH v3 06/13] arm64: dts: mediatek: mt7988: add basic
 ethernet-nodes
Message-ID: <cc73b532-f31b-443e-8127-0e5667c3f9c3@lunn.ch>
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-7-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608211452.72920-7-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_142344_579691_345A7CB5 
X-CRM114-Status: GOOD (  10.39  )
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

> +			gmac0: mac@0 {
> +				compatible = "mediatek,eth-mac";
> +				reg = <0>;
> +				phy-mode = "internal";
> +
> +				fixed-link {
> +					speed = <10000>;
> +					full-duplex;
> +					pause;
> +				};

Maybe i've asked this before? What is on the other end of this link?
phy-mode internal and fixed link seems an odd combination. It might
just need some comments, if this is internally connected to a switch.

> +			mdio_bus: mdio-bus {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				/* internal 2.5G PHY */
> +				int_2p5g_phy: ethernet-phy@f {
> +					reg = <15>;

It is a bit odd mixing hex and decimal.

> +					compatible = "ethernet-phy-ieee802.3-c45";

I _think_ the coding standard say the compatible should be first.

> +					phy-mode = "internal";

A phy should not have a phy-mode.

	Andrew

