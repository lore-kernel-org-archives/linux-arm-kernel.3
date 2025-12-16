Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C4BD5B87C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgLiR9L5wEhCMccIYV392PBhORkDXeC6wYlSh2crOgg=; b=owueZXoJlrHoBXtBXJJf3ClqXy
	owl8yxloKvVYl8ZhzvuntR+M/YhHtlnMH/LK1rDNeUwd66LOrOKe6GTw43GMs3byAvwKFEhS1+Jdr
	bh4TPhcW3ZHP7RK50AXQnuGJPFlFkAKI4aYSgkzcHVOG8OI0H057h4HrZiD/+KZPZ3NJQbkQE5E7j
	zqmeyqlsqIY8uTZfwvy3CX+xj1whbkXE6Kari05kaqMJIBsRt01lT/tO3HoU/CkBYiGYM4BA1odMC
	ddm5wItvjrGq8nZnFCI3KwaQce7s7AT0RiJ04XSiSJe+ugOaCddei13B9ZuNq1NVjoOJOhZHm5cez
	f1mi72Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPuk-00000004smw-3XE5;
	Tue, 16 Dec 2025 07:56:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPui-00000004sma-44Xy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 07:56:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso15046235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 23:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765871767; x=1766476567; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dgLiR9L5wEhCMccIYV392PBhORkDXeC6wYlSh2crOgg=;
        b=RbBIMP3M7XGHnySe3Hj3Iii8WZrnrSH1FmjMEotnJPOqnqIlcj6lIHCdfa85pzlogi
         47LvTzFZU7XOH7Y5mph+C03TSbWqx3BRGGr2kVDemB3jlfV3XSlztu4+ymNshmLvJrTF
         7O7rOwddeyfyljH7WnBUMlpxhCZ2mpTGhQQxh5T+uauM3q32aadZOyRYee7ZSharNEIU
         W3aydqI5NWY1SXYDSQdkQ8yDwTDp1gjaArTzhO4xxZYy/R9enH1c7HiyS+V5lIQLM4QM
         PhM3r0AVbfuUDiUbkcgma76idMAs83IDngt8G7LiR4NDHSy/flyVRlFu2jb6X5mpX4oB
         UUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765871767; x=1766476567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgLiR9L5wEhCMccIYV392PBhORkDXeC6wYlSh2crOgg=;
        b=KReMLXdKCjl3tBLOY+mdY89o271WK+4MMSLnsM6s18DLGVbmMeXuAwlAlTK5DJ9Fng
         d1re+JxT1+z1v72L43Hya4qdiglOk3JKdPupJ51VFWbVBIq37SEBpwWcvXn3ZJT6RDw7
         dhPd348xTTwr7bpcF54PGoGp2D3zE+e9M2cFa6sKNa3ioe0f8W74amMY3uRsoIBjFe4Z
         di/vamNJ0fg+HL5uAhRk6NZr0TfavLDGDrquzxLUtsLcm+0claO46Af0jtMj+g/e3e7x
         FyQFHpOXmahkC/OmHuPoEgkHuxyGXwIsJaOvl01w/JkI1MhDA00LZiqLO0uWVqjBPi9p
         51+Q==
X-Forwarded-Encrypted: i=1; AJvYcCULxQoqw6ku/CQdsEm4xwOTqQISx6ORYrUWEslqeA8bWKHS1WC+3HlB/7Oip3xvFC/cRYmmvyiHN/rAPcmBj2BQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwQzTNuyxqGkjiHlMhp66QGNk3cxb6O65I4ostfMKhBHof2VcL+
	odjSvjS6HY54dDEu9JblCUNLaoeZ/RZvDKBJ1ufTwmE4Nck2VqOPqR1YjvJcPhEfe4E=
X-Gm-Gg: AY/fxX4ldc2Fq1c2A6oojDTlnQExs70A2l7CFllYYE4vXzLwACVcFYNCBtKs3p2Jn8K
	lw7VK58iyYPtSQoXPpdB0jMumRq1ZapjjLUgkBMXlF4JtTY8LFivSqErDxk9P9ShggNjZJXeORe
	HYLE/vEg4Vh4oDqjmLFmPsEcFzPMmczNVsSFsGvSEJfQO/rJp0O1PLH23+dq+53ra0/5ihj3vrb
	gEKrjNQqhocle/w4abxl/J6QCTx8Xgi3VePixdlBX3whAqQo/y6hp9IeZLc7GxrHalFU0lFgs9W
	3Sttk3aV84KonGx4htrWH+oJFZcpZr/ZmNRDHB+mzv43Pr+zI4KS4of0/tRnT8YgA4371+B1Jny
	PV4x9wb5yd4pPb9l1r/aSZbQdN0yxcqiPM3ege/ujm5zfT8hFIpCjTApwntzI+EOYP7820ybfsl
	je1tHtaA6l1BX90I2W
X-Google-Smtp-Source: AGHT+IG+piBYJp8yRE0JaiL0XBKJcrLuB82TEEFiVQtz41FJiO/E2QY1ciGNs20Cvz2Woq6tSTEwTw==
X-Received: by 2002:a05:6000:26d0:b0:430:f74d:6e9f with SMTP id ffacd0b85a97d-430f74d6ef6mr8155517f8f.14.1765871766545;
        Mon, 15 Dec 2025 23:56:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f1fa232csm19824386f8f.6.2025.12.15.23.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 23:56:06 -0800 (PST)
Date: Tue, 16 Dec 2025 10:56:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, linaro-s32@linaro.org
Subject: Re: [PATCH v2 0/4] s32g: Use a syscon for GPR
Message-ID: <aUEQkuzSZXFs5nqr@stanley.mountain>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
 <aUAvwRmIZBC0W6ql@lizhi-Precision-Tower-5810>
 <aUBUkuLf7NHtLSl1@stanley.mountain>
 <aUBha2/xiZsIF/o5@lizhi-Precision-Tower-5810>
 <aUBrV2_Iv4oTPkC4@stanley.mountain>
 <aUB4pFEwmMBzW52T@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUB4pFEwmMBzW52T@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_235609_062481_131177A9 
X-CRM114-Status: GOOD (  45.81  )
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

On Mon, Dec 15, 2025 at 04:07:48PM -0500, Frank Li wrote:
> On Mon, Dec 15, 2025 at 11:11:03PM +0300, Dan Carpenter wrote:
> > On Mon, Dec 15, 2025 at 02:28:43PM -0500, Frank Li wrote:
> > > On Mon, Dec 15, 2025 at 09:33:54PM +0300, Dan Carpenter wrote:
> > > > On Mon, Dec 15, 2025 at 10:56:49AM -0500, Frank Li wrote:
> > > > > On Mon, Dec 15, 2025 at 05:41:43PM +0300, Dan Carpenter wrote:
> > > > > > The s32g devices have a GPR register region which holds a number of
> > > > > > miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
> > > > > > anything from there and we just add a line to the device tree to
> > > > > > access that GMAC_0_CTRL_STS register:
> > > > > >
> > > > > >                         reg = <0x4033c000 0x2000>, /* gmac IP */
> > > > > >                               <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> > > > > >
> > > > > > We still have to maintain backwards compatibility to this format,
> > > > > > of course, but it would be better to access these through a syscon.
> > > > > > First of all, putting all the registers together is more organized
> > > > > > and shows how the hardware actually is implemented.  Secondly, in
> > > > > > some versions of this chipset those registers can only be accessed
> > > > > > via SCMI, if the registers aren't grouped together each driver will
> > > > > > have to create a whole lot of if then statements to access it via
> > > > > > IOMEM or via SCMI,
> > > > >
> > > > > Does SCMI work as regmap? syscon look likes simple, but missed abstract
> > > > > in overall.
> > > > >
> > > >
> > > > The SCMI part of this is pretty complicated and needs discussion.  It
> > > > might be that it requires a vendor extension.  Right now, the out of
> > > > tree code uses a nvmem vendor extension but that probably won't get
> > > > merged upstream.
> > > >
> > > > But in theory, it's fairly simple, you can write a regmap driver and
> > > > register it as a syscon and everything that was accessing nxp,phy-sel
> > > > accesses the same register but over SCMI.
> > >
> > > nxp,phy-sel is not standard API. Driver access raw register value. such
> > > as write 1 to offset 0x100.
> > >
> > > After change to SCMI, which may mapped to difference command. Even change
> > > to other SOC, value and offset also need be changed. It is not standilzed
> > > as what you expected.
> >
> > We're writing to an offset in a syscon.  Right now the device tree
> > says that the syscon is an MMIO syscon.  But for SCMI devices we
> > would point the phandle to a custom syscon.  The phandle and the offset
> > would stay the same, but how the syscon is implemented would change.
> 
> Your SCMI syscon driver will convert some private hard code to some
> function, such previous example's '1' as SEL_RGMII. It is hard maintained
> in long term.
> 

No, there isn't any conversion needed.  It's exactly the same as writing
to the register except it goes through SCMI.

> >
> > >
> > > >
> > > > > You still use regmap by use MMIO. /* GMAC_0_CTRL_STS */
> > > > >
> > > > > regmap = devm_regmap_init_mmio(dev, sts_offset, &regmap_config);
> > > > >
> > > >
> > > > You can use have an MMIO syscon, or you can create a custom driver
> > > > and register it as a syscon using of_syscon_register_regmap().
> > >
> > > My means is that it is not necessary to create nxp,phy-sel, especially
> > > there already have <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> > >
> >
> > Right now the out of tree dwmac-s32cc.c driver does something like
> > this:
> >
> >     89          if (gmac->use_nvmem) {
> >     90                  ret = write_nvmem_cell(gmac->dev, "gmac_phy_intf_sel", intf_sel);
> >     91                  if (ret)
> >     92                          return ret;
> >     93          } else {
> >     94                  writel(intf_sel, gmac->ctrl_sts);
> >     95          }
> >
> > Which is quite complicated, but with a syscon, then it's just:
> >
> > 	regmap_write(gmac->sts_regmap, gmac->sts_offset, S32_PHY_INTF_SEL_RGMII);
> >
> > Even without SCMI, the hardware has all these registers grouped together
> > it just feels cleaner to group them together in the device tree as well.
> 
> Why not implement standard phy interface,
> phy_set_mode_ext(PHY_MODE_ETHERNET, RGMII);
> 
> For example:  drivers/pci/controller/dwc/pci-imx6.c
> 
> In legency platform, it use syscon to set some registers. It becomes mess
> when more platform added.  And it becomes hard to convert because avoid
> break compatibltiy now.
> 
> It doesn't become worse since new platforms switched to use standard
> inteface, (phy, reset ...).
> 

This happens below that layer, this is just saying where the registers
are found.  The GMAC_0_CTRL_STS is just one register in the GPR region,
most of the others are unrelated to PHY.

regards,
dan carpenter


