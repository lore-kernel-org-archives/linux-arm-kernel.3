Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58777C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 18:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sY2K0NFqeHlnnXVJj9mphRlP5+qDd3iUqsbcAY+xNQ=; b=rYfFU6gkZwCKTwC2CuRIGQTh46
	9W9tllvpNgRNsVB01TOaIuQmnE68SU4FAM25Kbr0kXiS0Ohyt33F3XbG/mtPGkF7hoTxlYDagwdZY
	JtltGtrikhD0MqMr+1FZZptBVmQOFrtnpKp3Q+rthbd7G0O1oZu9DXvySSLc0zwpKgER6YH1/vYBg
	9v9iU22L51hPBoP/DTtlRiGxeqSKqruljVxqejPQYxysiD9E2qbm4YDKVg8sEkxdbUxlBY4JYWxZQ
	8dMmM0dolIZU0Um2wVEa2FO4nK1kn1rzroEG9vsGmp63E5pG29aCr3WWbbSqD/l2b1Q5+3oLQk3dm
	AHTMBBEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dXB-0000000FLC1-0OQI;
	Fri, 18 Sep 2026 18:42:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dXA-0000000FLBt-1iTM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 18:42:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC36440764;
	Fri, 18 Sep 2026 18:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F2A1F000FF;
	Fri, 18 Sep 2026 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756923;
	bh=5sY2K0NFqeHlnnXVJj9mphRlP5+qDd3iUqsbcAY+xNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dGsvJzURnx4P2I2ySeknphYi171fhnjGzSiD1bWzXoT3bnkbdVesM6rLQImvP+Rng
	 Tk1LDa0FfDwc1zq+cR9oPuMBlf5PNOSu1W9pnXJDcJW6IXEHDGGCxqoXWF39997mPF
	 i3qD1PswT/s8eLDbaIRPOaUTvyvWttwc0L6vTjqrP25zlQnG1durEI9UZxpQTYY0os
	 vk0kMkn1GVD9F5rorzOzFa6GQZZYfGSyX7bngD2cTHwC8fDlNPbvQmNo7w3bQWLNSn
	 dV+HPLPKau1h2cPRnbjw/Sf4SAsgpxD7Vud+vm+C8T/WeoUk7J/5pRO7XygeqBHBqw
	 WecR2YK94mx/A==
Date: Fri, 18 Sep 2026 13:42:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	linux-sunxi@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Richard Cochran <richardcochran@gmail.com>,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: sun8i-emac: Add A733
 GMAC210 compatible
Message-ID: <178975692133.1355528.3349670401889953428.robh@kernel.org>
References: <20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com>
 <20260910-allwinner-a733-gmac-support-v2-1-4f4a1e520c23@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-allwinner-a733-gmac-support-v2-1-4f4a1e520c23@baylibre.com>
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


On Thu, 10 Sep 2026 12:25:26 +0200, Jerome Brunet wrote:
> The A733 GMAC210 is a DesignWare MAC 5.20 close to the A523 GMAC200, with
> the following differences:
> 
>  * The glue configuration registers are a dedicated MMIO region of the
>    controller instead of a syscon register, so a second reg entry replaces
>    the syscon phandle.
>  * The DMA channels and the LPI event have their own interrupt lines.
>  * A PTP reference clock and an AHB reset are needed.
>  * Unlike the A523, the controller does not appear to belong to a power
>    domain.
>  * The TX clock delay field is 5 bits wide, allowing up to 3100ps.
> 
> Add the new compatible and describe those differences.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 130 ++++++++++++++++++---
>  1 file changed, 115 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


