Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C629C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 06:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zk7akdSG+Lt4kXVv0DNDCRRXidxhfe8oAyzsOC/t6g4=; b=0swZ7E4BvnfrVttmrnpEe6MPoX
	OTaV/9Jk2lkKC2X+mVS5lqz+srkZbRWdUqWfeYxo2zpuipJ98qKzTb1JNMj+ntnK0LC7GGvrAl8/U
	WL+uuBar39DEsiB1VbaSspTb7D29HQ2mQy4wvJc6hl60I2XYoULjWIgrIxGNl+zoyiJzq8IJuaR5c
	fhygmrXoiTyEaViSaU3tDP7LgBB8Kwcp4o5//mT+djjOqlaaGKu55LX3OmkuPL0zCxvLy/Ns8p0TY
	wlSXP5UD0O8YLbypzqk6ic/NlFH23OSZa3xIkH79lj835hrntPfD1geXpbZZ2M/NNAJPM9XPAI2b2
	zrj8PhhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75xy-0000000AiIZ-1Kjm;
	Thu, 17 Sep 2026 06:51:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75xw-0000000AiIG-1TPM;
	Thu, 17 Sep 2026 06:51:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF12E447D6;
	Thu, 17 Sep 2026 06:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E201F000FF;
	Thu, 17 Sep 2026 06:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789627884;
	bh=Zk7akdSG+Lt4kXVv0DNDCRRXidxhfe8oAyzsOC/t6g4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VfgmtCRpAvVbXe7/1HGMr3VdOTboOboBfMHkAF5G99vlKXKhKGOJv1D2xb9XMDDKt
	 k6ofxrkFjri2YH0fDIYKR+P1yRX/L01W4GKj1t/4H0lVXyl6yXMr5BJEWJGcO041sF
	 M8Nl8IP8EvwKP8KFhRWtoZo417856nhCE3W7oQhjbnm+DSL0Xuov4RAaCSVFSidMgv
	 w1BRu/Fa8TugQ9cEbu5m7+Me43bXt+NTi+9flladeallexFNnaWATulAPVSbVkWLLd
	 MG8zyEPH3oetj1DOM6Mt1Q6L1SXVuoaGmAe5ymv8WmwxM5GHj1RgLZohwj5POqrWgR
	 kD8q1BsrqOA1Q==
Date: Thu, 17 Sep 2026 08:51:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Maud Spierings <maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v4 01/20] dt-bindings: phy: Add
 starfive,jh7110-inno-hdmi-phy
Message-ID: <20260917-mutant-chamois-of-competence-46ca77@quoll>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153214eucas1p2b548f3236ef98fb0cbf320e397420125@eucas1p2.samsung.com>
 <20260915-jh7110-clean-send-v4-1-f0e4fd6f2cc8@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915-jh7110-clean-send-v4-1-f0e4fd6f2cc8@samsung.com>
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

On Tue, Sep 15, 2026 at 05:32:09PM +0200, Michal Wilczynski wrote:
> Add the dt-binding for the StarFive JH7110 Innosilicon HDMI PHY.
> 
> This device is a child of the starfive,jh7110-hdmi-subsystem node. It
> functions as both a PHY provider for the controller and as a clock
> provider for the variable pixel clock (hdmi_pclk), which it generates
> from its refoclk.
> 
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>

While I appreciate other people looking at this, I don't think review
here applies. It was a blanket tag, given to the entire series, with
exception that it is from newbie, thus I want to ask: was this binding
REALLY reviewed by Joshua?

Are the rest of the patches actually reviewed or just "looks good to
me"? I see no comments from Joshua on v3, v2 and v1, which is usual sign
of doing review.


> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../phy/starfive,jh7110-inno-hdmi-phy.yaml         | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f838fcc238ec7db0a8e794234bdceec36cb6d9e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Innosilicon INNO HDMI PHY
> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +description:
> +  The PHY portion of the StarFive JH7110 INNO HDMI IP.
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-inno-hdmi-phy
> +
> +  clocks:
> +    maxItems: 1
> +    description: Reference oscillator.

This barely counts as a resource, so usual question: no resources here?
no MMIO? Even the user of this phy is the block itself.

This makes me wonder if this should be a device node in the first place
(instead folded into the parent).


Best regards,
Krzysztof


