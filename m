Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D7AD0E3F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWh4J0aa2PbUDPqwlIFmr0FJD1LzIoNaSDYOypvwd5g=; b=lkOgyF0EPoUTzE5t6kAkU4uOhy
	GEKVRvnJ5ubAvvwsZOdeAast2N9eWwkORXFm+pFpXfThS914LNA7d9Y7I2rpbrbOAnIaj0HjcHWg4
	4E06HeMcrZ8rOlRtJyWa2q1gFOpr7/g17flvI9QEvk0EtXpMuRKN4KyJ6dEix+7iCSQRBcgioEisv
	4VGNN0WJrunN4YkDg4MMtntrG9YAcWieMUIGAqkitq/ODP7c0rO6mOuxlUzirGdU5irIyTacDle/o
	xy4rnwubYS5x4sFvD7qjf0RxlhlfEdtRcUaPbJC5HPIDojKJQQt/7tqkDywFu5cM0QsHUmvBpekbY
	9ibuhNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t442w-00000001gTD-1ipK;
	Thu, 24 Oct 2024 20:03:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t43Q1-00000001ak3-3Okv;
	Thu, 24 Oct 2024 19:22:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05BC0339;
	Thu, 24 Oct 2024 12:23:16 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6E593F528;
	Thu, 24 Oct 2024 12:22:42 -0700 (PDT)
Date: Thu, 24 Oct 2024 20:22:33 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-usb@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Yangtao
 Li <frank@allwinnertech.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Parthiban <parthiban@linumiz.com>, Linus
 Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>,
 Maxime Ripard <mripard@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Yangtao Li <tiny.windzz@gmail.com>, Viresh
 Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 06/13] phy: sun4i-usb: add support for A100 USB PHY
Message-ID: <20241024202216.6cded8c4@minigeek.lan>
In-Reply-To: <20241024170540.2721307-7-masterr3c0rd@epochal.quest>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
	<20241024170540.2721307-7-masterr3c0rd@epochal.quest>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_122249_989969_FFC1BB7F 
X-CRM114-Status: GOOD (  20.51  )
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

On Thu, 24 Oct 2024 14:05:24 -0300
Cody Eksal <masterr3c0rd@epochal.quest> wrote:

Hi,

> From: Yangtao Li <frank@allwinnertech.com>
> 
> Add support for a100's usb phy, which with 2 PHYs.
> 
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> [masterr3c0rd@epochal.quest: modified to use quirk flags]
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> index b0f19e950601..a3942b2ee90b 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -1006,6 +1006,16 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
>  	.phy0_dual_route = true,
>  };
>  
> +static const struct sun4i_usb_phy_cfg sun50i_a100_cfg = {
> +	.num_phys = 2,
> +	.disc_thresh = 3,

This member is never used when .siddq_in_base is true (and yes, this is
wrong for the H616 too), ...

> +	.phyctl_offset = REG_PHYCTL_A33,
> +	.dedicated_clocks = true,
> +	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
> +	.phy0_dual_route = true,
> +	.siddq_in_base = true,

... which makes this whole description identical to the D1 version.
So at the very least we wouldn't this new a100_cfg, but instead just
point to the existing d1_cfg.

> +};
> +
>  static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
>  	.num_phys = 4,
>  	.phyctl_offset = REG_PHYCTL_A33,
> @@ -1040,6 +1050,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
>  	{ .compatible = "allwinner,sun20i-d1-usb-phy", .data = &sun20i_d1_cfg },
>  	{ .compatible = "allwinner,sun50i-a64-usb-phy",
>  	  .data = &sun50i_a64_cfg},
> +	{ .compatible = "allwinner,sun50i-a100-usb-phy", .data = &sun50i_a100_cfg },

And this also brings up the question whether we need a new compatible
string. As it stands now, we could also use:
	compatible = "allwinner,sun50i-a100-usb-phy",
		     "allwinner,sun20i-d1-usb-phy";

and wouldn't need any driver changes at all. Which would have the neat
side effect to make USB work already with v5.18 kernels.

The only downside is the somewhat weird ordering of the compatible
strings, with the much newer chip as the fallback.

What do other people think here?

Cheers,
Andre


>  	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = &sun50i_h6_cfg },
>  	{ .compatible = "allwinner,sun50i-h616-usb-phy", .data = &sun50i_h616_cfg },
>  	{ .compatible = "allwinner,suniv-f1c100s-usb-phy",


