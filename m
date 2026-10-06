Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1D4CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txP3ruVYCLkbMDGy07Vcni7w37L1LO/1WObGN9fDR6g=; b=OAOz1TEY+Yh6qQGf/qr3rO6oZo
	6ydaGxmmaUyLjwq7LVGQJlAiNyJRU+ZFEFWdcoc3CBVxUwu6PJNa3++OdNzN0nlNusvw2pMV9XoYE
	5iuGmhnCgWt7lD2xKcMvlOACL2NAU0+FfhVeJK4Q/J/uK+Jr05CrFMmCwlU0kb8e9OXuOnVzPd6uS
	uF3kv4pIL2jjEZo6N3YNwDKFyZyzkn+njDaCt12aPrLXOdLLtT8qBgddR6nUw/30l0f5PR3Kdnjf+
	axu6DWfz5J27q7MwBEcchSmkMT+cXGvgUKuBZnAQDRbtFe12VXpitU7Aecu8MMSg2Es4tCEUIiFDO
	iTQNWIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7np-000000017KD-2iU6;
	Tue, 06 Oct 2026 16:14:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7np-000000017K1-0Fxr;
	Tue, 06 Oct 2026 16:14:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F94E43CC4;
	Tue,  6 Oct 2026 16:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330131F0089B;
	Tue,  6 Oct 2026 16:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791303244;
	bh=txP3ruVYCLkbMDGy07Vcni7w37L1LO/1WObGN9fDR6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g1xdCTZWc+2keXIczvFXqEioig8hAdmMVgPi0UUdiJ1jt/m+HcLtmBHFVGhNbyH6P
	 v2CxRkYvuRtEcGfObj3btZB08LnhgnVJ4OtTSNV/kFLzcMOjhTei9WhhWVKT7ISpBk
	 5v0UuzTVRln7IpACNwOxWxRIAAc/E3SjyElDIZCE08/xHh8WV2Y5rfiCUf3sEAIFzA
	 imIC8VzpHbrfCc+he7/NinmJ5gUcaF8GlEStOrKf0l4hE3lq9XwUOwaEkaSUfGZf16
	 DuHsrWUkTS3a3pUwLA8mSPPsir6UiTFxPUXw4sAG3y0j0+9TkgmXJsDkO9ZQJWDXTH
	 /rHc88pYFlhhQ==
Date: Tue, 6 Oct 2026 11:14:03 -0500
From: Rob Herring <robh@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Coia Prant <coiaprant@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v12 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
Message-ID: <20261006161403.GA2469169-robh@kernel.org>
References: <20261006074749.2010233-1-coiaprant@gmail.com>
 <20261006074749.2010233-3-coiaprant@gmail.com>
 <08736f4d-a728-4b1e-a28e-882648a412e0@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08736f4d-a728-4b1e-a28e-882648a412e0@rock-chips.com>
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

On Tue, Oct 06, 2026 at 10:53:22PM +0800, Shawn Lin wrote:
> Hi Coia
> 
> 在 2026/10/06 星期二 15:47, Coia Prant 写道:
> > On RK3568, the SGMII interface can be routed to either GMAC0 or
> > GMAC1 via the GRF register pipe_sgmii_mac_sel.
> > 
> > Add support for this selection by introducing
> > the "rockchip,sgmii-mac-sel" DT property.
> > 
> >  From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> > bit 1 (pipe_sgmii_mac_sel) is defined as:
> > 
> >      0: SGMII routed to GMAC0
> >      1: SGMII routed to GMAC1
> > 
> > The hardware reset value is 1 (GMAC1). If the property is set to 0,
> > the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
> > remains at GMAC1.
> > 
> 
> Thanks for your patch. I have a question below, please have a look.
> 
> > This is necessary for boards such as the Ariaboard Photonicat, which
> > uses the SGMII interface connected to GMAC0.
> > 
> > Out-of-range values are rejected by dtschema, so the driver does not
> > duplicate the range check.
> > 
> > Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > ---
> >   drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > index 7843356a4dd47..7b867e7520064 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > @@ -186,6 +186,7 @@ struct rockchip_combphy_grfcfg {
> >   	struct combphy_reg pipe_xpcs_phy_ready;
> >   	struct combphy_reg pipe_pcie1l0_sel;
> >   	struct combphy_reg pipe_pcie1l1_sel;
> > +	struct combphy_reg pipe_sgmii_mac_sel;
> >   	struct combphy_reg u3otg0_port_en;
> >   	struct combphy_reg u3otg1_port_en;
> >   };
> > @@ -212,6 +213,7 @@ struct rockchip_combphy_priv {
> >   	bool enable_ssc;
> >   	bool ext_refclk;
> >   	struct clk *refclk;
> > +	u32 sgmii_mac_sel;
> >   };
> >   static void rockchip_combphy_updatel(struct rockchip_combphy_priv *priv,
> > @@ -375,6 +377,9 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
> >   	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
> > +	priv->sgmii_mac_sel = 1;
> 
> Before this patch, SGMMI was routed to GMACX depends on bootloader(if
> setting), or routed to GMAC1 by chip default. Without knowing any
> potential candidates setting it via bootloader, you might not force any
> DTS files without "rockchip,sgmii-mac-sel" to pick GMAC1 as fallback.
> 
> Maybe you could just keep the SGMII route as-it if the property is not
> present. Meanwhile, should validate rockchip,sgmii-mac-sel is a valid
> value passing from DT.

That is the typical way tri-state properties work (as opposed to using a 
boolean). In that case, no 'default' in the schema would then be 
appropriate.

Rob

