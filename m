Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44227CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1y5MNw5pAX4zEDE7oHbM3Qb22NF+hb8K41cpqkfKay0=; b=JkZA03JrglRnhBs78sWrRSBHGk
	b016+TNFMhewafehjeUj0YyhY1daZ4CEbtMBIqU7fT93FsiqjGih1rU3P07diutPcVzUX64JdN74T
	1XlAdqhkrRmt9fC2dOzUykkdaM8pyVaei2glHiJpXBV9jCrKTjQ98ZsUcDZHT50YPLcS7F2JWLDy8
	zh3Goz/6PqSluJXeyAVtJRz66022jJn8+iz+OtJUn8Rzd3iOxopsUzO1LM8pF/jOr7QIklssoHFXg
	IRpaQXBe43AlBrTHLQ+w7jrB6Cq5XeNYExaBIrABtto9ZEOvXxKlVuQTHcNAo+Fswc5G8JX3HrlrH
	VqpRgo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6rBs-00000006HFy-2sZA;
	Thu, 09 Oct 2025 14:00:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6rBq-00000006HFU-1Y5l;
	Thu, 09 Oct 2025 14:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1y5MNw5pAX4zEDE7oHbM3Qb22NF+hb8K41cpqkfKay0=; b=qXzi3/7EvQikSz7+v6VhkyeIyY
	mrruz6GjdBUnEFBc00hilEBAoR7HPxjlOK7SkMaB5y/w+OB2W4DfoQ2gvvduFK7Jn5R9ZaSFLaBQi
	5MC5Ap9quFLTVLl4/3RteQ9wz/zoRyfugx9Jc5NDnvkO2RLGWvAD9tidUw90QwmaT54OAm5ESY7yR
	7xXE2wDGLl5PAEipZAnTw/3lYKU+VwN6cQHE6l7VmrjKPKz8KIm8b6UKwpiOGTgEZbRXoiw5wuD9H
	SMsImcO4DcLek2T69/tnTNWnlNPZroH/GNk19tXuib12c0RyofsGVl0Sc/lskeR3ZkNEQEXRYm0wA
	26Z98Mew==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44504)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v6rBP-0000000074K-2fB0;
	Thu, 09 Oct 2025 14:59:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v6rBI-000000004rQ-3dqH;
	Thu, 09 Oct 2025 14:59:44 +0100
Date: Thu, 9 Oct 2025 14:59:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Liangbin Lian <jjm2473@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, quentin.schulz@cherry.de,
	kever.yang@rock-chips.com, naoki@radxa.com, honyuenkwun@gmail.com,
	inindev@gmail.com, ivan8215145640@gmail.com,
	neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org,
	pbrobinson@gmail.com, alchark@gmail.com, didi.debian@cknow.org,
	jbx6244@gmail.com, andrew@lunn.ch, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
Message-ID: <aOe_0EufouURu7R2@shell.armlinux.org.uk>
References: <20251009084416.45542-1-jjm2473@gmail.com>
 <20251009084416.45542-4-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009084416.45542-4-jjm2473@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_070018_704506_E200C0AC 
X-CRM114-Status: GOOD (  16.69  )
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

On Thu, Oct 09, 2025 at 04:44:16PM +0800, Liangbin Lian wrote:
> +&gmac0 {
> +	phy-mode = "rgmii-id";
> +	clock_in_out = "input";
...
> +&gmac1 {
> +	phy-mode = "rgmii-id";
> +	clock_in_out = "input";

I am fine with what is being proposed here, but I think this
clock_in_out property needs fixing. The description for it is thus:

  clock_in_out:
    description:
      For RGMII, it must be "input", means main clock(125MHz)
      is not sourced from SoC's PLL, but input from PHY.
      For RMII, "input" means PHY provides the reference clock(50MHz),
      "output" means GMAC provides the reference clock.
    $ref: /schemas/types.yaml#/definitions/string
    enum: [input, output]
    default: input

The problems that I have here are:

1) the description states that the only possible value for this when in
   RGMII mode is "input" which is reasonable, because it's due to the
   RGMII specification. The driver code is perfectly able to determine
   whether RGMII has been specified, and set bsp_priv->clock_input
   itself, relieving DT of this need.

2) bsp_priv->clock_input is only used in gmac_clk_enable() when calling
   the SoC specific set_clock_selection() method. Only RK3528, RK3576,
   and RK3588 populate this method. Every other SoC supported by this
   driver still requires the property:

        ret = of_property_read_string(dev->of_node, "clock_in_out", &strings);
        if (ret) {
                dev_err(dev, "Can not read property: clock_in_out.\n");
                bsp_priv->clock_input = true;
        } ...

  If one doesn't provide it, one gets an error print, which is not nice
  I note that the DT binding doesn't list this property as required, so
  the code is at odds with the binding.

  (I note that your Rockchip SoC is RK3568, which doesn't implement this
  method.)

So, taking both these points together, the code should not be printing
an error if "clock_in_out" is missing when either:

a) RGMII is being used (or maybe only when RMII is being used?)
b) the set_clock_selection() method is not present for the SoC variant.

With the driver fixed as indicated above, I then think clock_in_out in
your descriptions becomes unnecessary, and should be removed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

