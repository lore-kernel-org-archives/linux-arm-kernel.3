Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6EFE74903
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 05:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLI6EQT5smrDlxFXcMXg4ADAaAObZLSLjRKawafbQAY=; b=q2yLa1PuHzBRfE7eRenSkixO1c
	PrAI7cBCGaTapeak7JYTFt0kTgUD35peLEeyzMZxwUmmPW48xaWeMezz3l5Z8BnN0hlalI++90KAb
	/kR8/qc0fNZUoRvIJmDF5n7LZGgTYLe59gLm0AvIP4Ng0IzGPPxo/RNzjDAod19kttz3BeXyaQ6aQ
	jlbwbkGxiITfMX+WD+XPl9WPMO2Ha8ZEtknipNiQnyMbgHxjhqdUXL+pzb+JXzcFLIGmujxdbd3MA
	bws0o9cmxfi1XcgAccM3/RUm5bKw6FIO8rhUvbX/jD5GNoCdWLqF1ffJC4RDZQ45+KS90hRyrpWbG
	kQqDhJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHSW-0000000GQxV-2LYu;
	Wed, 24 Dec 2025 05:30:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHSV-0000000GQxM-22ls;
	Wed, 24 Dec 2025 05:30:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9154B60123;
	Wed, 24 Dec 2025 05:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1F1C4CEFB;
	Wed, 24 Dec 2025 05:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766554250;
	bh=1X9APecdnLI/dPB5jwwC+T1kxLB0WLC073vyb8hkJgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SISDydjirDPYMUr4FcfxX40KBetH36Bjt+7pfTrpYmEmu1dd3hfUs3tTGX/NJ9qQF
	 X9Fm57cx+ptcwhFuNNkN5uGbHO5TM696KG63jvQbPbeLXIMWoSRPgCpeNPlB7uNiNl
	 RVsK/7XARw8cBznR0jdphIRjJBW9PrBsb5hKiBLaoONmjOQ76AUknCN3p2Gcp6OXPA
	 uBm0TPM9fBzuM+86esajXU34fbEWeVAd2/uXW+oOWiv5GQ7n5T+CC+/5F+CyCQ9p7O
	 x0kP0727nRjzkrInVLGaSyPnJR/4lVYXQdVCWjot+cn8BAk/DvXPZM2vtGmk89FaB8
	 pSw44WM1/otYg==
Date: Wed, 24 Dec 2025 11:00:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>
Subject: Re: [PATCH v9 2/2] phy: Add Google Tensor SoC USB PHY driver
Message-ID: <aUt6hobN9DPUGbpz@vaman>
References: <20251222-phyb4-v9-0-82c0b671b070@google.com>
 <20251222-phyb4-v9-2-82c0b671b070@google.com>
 <aUqhbVFHczpL9qnL@vaman>
 <CA+zupgxP+_2iRYABhPM1OOJtRdkrcOvrsKH=Sxk45XwsiamzTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+zupgxP+_2iRYABhPM1OOJtRdkrcOvrsKH=Sxk45XwsiamzTw@mail.gmail.com>
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

On 23-12-25, 09:53, Roy Luo wrote:
> On Tue, Dec 23, 2025 at 6:04 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 22-12-25, 21:31, Roy Luo wrote:

> > > +struct google_usb_phy {
> > > +     struct device *dev;
> > > +     struct regmap *usb_cfg_regmap;
> > > +     unsigned int usb2_cfg_offset;
> > > +     void __iomem *usbdp_top_base;
> > > +     struct google_usb_phy_instance insts[GOOGLE_USB_PHY_NUM];
> >
> > so you have an array for one phy?
> 
> While the current patch only supports usb2, I used an array
> to simplify future support for usb3 and DP. I understand this
> might seem like over-engineering for now, and we could
> certainly wait to implement the array until the second phy
> support is added. I’m happy to move away from array if
> you’d prefer a simpler approach for this iteration.

Rather than do array, allocate mem as probe based on how many phys will
be there and use that. That would be a better approach than static
allocation here

> > > +static int google_usb2_phy_exit(struct phy *_phy)
> > > +{
> > > +     struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
> > > +     struct google_usb_phy *gphy = to_google_usb_phy(inst);
> > > +     u32 reg;
> > > +
> > > +     dev_dbg(gphy->dev, "exiting usb2 phy\n");
> > > +
> > > +     guard(mutex)(&gphy->phy_mutex);
> > > +
> > > +     regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
> > > +     reg &= ~USBCS_USB2PHY_CFG21_PHY_ENABLE;
> > > +     regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
> > > +
> > > +     reset_control_bulk_assert(inst->num_rsts, inst->rsts);
> > > +     clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static const struct phy_ops google_usb2_phy_ops = {
> > > +     .init           = google_usb2_phy_init,
> > > +     .exit           = google_usb2_phy_exit,
> > > +};
> >
> > Only two ops? I would expect more... No power_on/off or set_mode?
> >
> > --
> > ~Vinod
> 
> No, configuring usb2 phy is pretty straightforward. The hardware
> does not distinguish between "initialized" and "powered on" states,
> it also does not distinguish phy mode.

ok

-- 
~Vinod

