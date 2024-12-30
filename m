Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4641E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 14:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qg9NQodKWHX1D513dpZnbd/IQD5EHj/Db6eaT1vjqsc=; b=r97qClbZHIzpFzxIxchayAkU+S
	0NrMRESafNmEBb3vN1yeGk1y3JVMiT+jzLEGjAZyGdmeqHkmLo3DxdOEczgS3lPx1Jj2DzLcHCK5v
	iArGb7l3QbMzSy5A2RfKXC2+JUaviPjEY1OVWZCDKRq9H7T9roHMY+0nXxmOqVquDMMeuxb6jRtQG
	IiXS3vUDNLSI+2cY1kFA/GPLRqVHTPgfISAfNTuseX/EP5PqbPGlM9zbXwQuJVA6kcz9UvfbJ5VOs
	aoDGx9s1hS4oaa+aoIEDY9fGlXN2myj/Q+hNpne6abjMPr1rOgwECSHP9dj6gIWQN7y1CmadpPnWS
	bCCcej9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGWC-00000005KS7-1GSb;
	Mon, 30 Dec 2024 14:13:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGUw-00000005KKq-1wVu;
	Mon, 30 Dec 2024 14:11:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E04FF143D;
	Mon, 30 Dec 2024 06:12:25 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C93193F59E;
	Mon, 30 Dec 2024 06:11:52 -0800 (PST)
Date: Mon, 30 Dec 2024 14:11:50 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Parthiban <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Linus
 Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RESEND 00/22] Add support for A100/A133 display
Message-ID: <20241230141150.3d0c3ae6@donnerap.manchester.arm.com>
In-Reply-To: <314b6bbe-613e-41a6-955e-50db6e11ef8e@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
	<314b6bbe-613e-41a6-955e-50db6e11ef8e@linumiz.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_061158_617179_BC40B472 
X-CRM114-Status: GOOD (  24.14  )
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

On Fri, 27 Dec 2024 20:06:30 +0530
Parthiban <parthiban@linumiz.com> wrote:

> On 12/27/24 6:30 PM, Parthiban Nallathambi wrote:
> > This series depends on [1] for the eMMC/MMC controller to work and
> > [2] (lined up for 6.14) which adds support for the sram nodes and
> > display engine extends it's usage. Idea of this series to get initial
> > feedback and adjust, which will be rebased for 6.14 once [2] is merged.
> > 
> > This patch series adds support for A133 display pipeline based on
> > LVDS. dt-bindigs are organized in the start and later with code
> > changes.
> > 
> > PHY is shared between DSI and LVDS, so to control the PHY specific
> > to DSI/LVDS, phy_ops set_mode is introduced. To enable the DSI
> > using set_mode, analog control register MIPI Enable is used, which
> > may not be available for A31 (shares the same driver).
> > 
> > Otherwise, A133 also got hidden independent display engine i.e
> > mixer + tcon top to handle parallel display. But this patch series
> > adds only support for the 1 mixer which is documented.
> > 
> > [1]: https://lore.kernel.org/linux-sunxi/20241109003739.3440904-1-masterr3c0rd@epochal.quest/
> > [2]: https://lore.kernel.org/linux-sunxi/20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest/
> > 
> > Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>  
> Apologize for polluting with resend again. My internal mail server got blocked due to
> volume count, which resulted in incomplete series again.

I guess an incomplete send was the reason for the original resend? Please
note this at the top of the cover letter then, otherwise it's not easy
to see why you send something again. Something like:

*** Re-sent due to mail server not sending out the complete series. ***

It also helps to split up the recipients, so that everyone gets the cover
letter, but only the respective subsystem maintainers get the patches
touching their subsystem. I would CC: the DT maintainers on every patch,
though.
It's a bit more complicated to set up, but keeps the noise down for those
large-ish series, for instance for the IOMMU people, who presumably have
little interest in DT or graphics code.

Cheers,
Andre

> I will fix the mail server issue before resending the series. Sorry.
> 
> Thanks,
> Parthiban
> 
> 


