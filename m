Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB6AC5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+7Qf4C+BCkphTM5Iv8Y9G8botn3Z1MPiWmfqLgbhk8=; b=scoWU11DifEMpRfw+RfOBYREbl
	db4Dda6MufV+vmjisSyQaCzeHqjPO9jiThXYQsAVXvOL2ZgnoBl6uDoD0yAVCRRcpH6oqvSb7aP73
	caYhMvpiKiQBVk2cKxxNM8AuCbJnhnC+mRnMYsv/+zxvEEsPC9NsARGQ54EcByeyzvQh7ilMKU6AD
	Lba5n1rPtR2q1hAaH8FrHUS6g0JhYHhz3Mh1HVXMExb3bjaJsIVmm7tO3Gzp93hTw46Luf0hc8VtL
	HmhEm1/uIIfhsjKNr7lb+knIvkXO2essa5gnLpEutKx+eqddQ3hTUtEiER5RFljHwCWKMmJZwFEeK
	AgN0vW1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUqm-0000000CdxO-1MN4;
	Mon, 10 Aug 2026 18:35:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUql-0000000Cdwv-1Fjn;
	Mon, 10 Aug 2026 18:35:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF1A84323D;
	Mon, 10 Aug 2026 18:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FA21F000E9;
	Mon, 10 Aug 2026 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386950;
	bh=J+7Qf4C+BCkphTM5Iv8Y9G8botn3Z1MPiWmfqLgbhk8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HlzpUbYzcJ3KMfPEvXyW3Fdt/nE5/mxqLTwgQd16JMs1HWaHaTGufcH6czd6tgMZ3
	 q5k786zQ4Zphisf702b1r/G+BCt2fll3h81IcQ/S7RBIcdpBCzVhVl3q9xYVFRN2Vz
	 0GGN5j1vEs1t6jvao2VddGT+ws7pP6d+v2bHKphI1pn1tTPDEqyUsOX+KFYWVffcO0
	 KcPlP0Kgse5B/lTHtocl0cfyMJ+M/6J6ri+2vdoc/Av1RK3s5Sjfya7g2NycTE7g9y
	 gW0gdlCAV7+3XC0Z/bokVCVPUn6q4uJA4xXHDEl8ujcjS5IbLCpjdH5z2Aa43Yh0wB
	 d1O782y0QFKdw==
Date: Mon, 10 Aug 2026 11:35:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, Aurelien Jarno <aurelien@aurel32.net>, Brian
 Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Daniel
 Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>,
 David Wu <david.wu@rock-chips.com>, Eric Dumazet <edumazet@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner
 <heiko@sntech.de>, Herbert Xu <herbert@gondor.apana.org.au>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Maxime
 Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Olivia Mackall <olivia@selenic.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH 00/25] ARM: rockchip: Add peripheral support for RV1106
Message-ID: <20260810113548.7fd24d56@kernel.org>
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 10 Aug 2026 15:10:51 +0300 Vladislav Leonov wrote:
> Basic support for the Rockchip RV1106/RV1103 SoCs currently under review.
> This series builds on top of that and enables the peripherals needed to
> bring up a board beyond a serial console:

Don't expect maintainers to dig out patches for their subsystems
from a big series. This is not how upstream development works.
Repost 4+5 as a separate series to networking..

