Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A26E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 20:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYliTF35nPNFNRmXPIOQ4ksdgvuWl/AzFHNeTIQ3J/I=; b=yh4LW8lJgwPpBQVDkWTeLKYNDg
	B7oSwOq7o922o8UcfDIv8yA1ub249GPLPgJ2l51H9ZEvifJ1iJ1s65bpHWgLidjXIIXyMShBudHYz
	tqcKEz1kFoafEJT0bjYJajLLq7Mi5hzu8G3seA7MWxHuasvA2Pp2JgxiBU+JmQ/ydX3ISXPJye1is
	kplBaVGeIuZmIeYgoQIEhq4X2NJbzdEeKkZ7enr9Ay0+R06zJZrwJBAXT387GBL7oRbBMUpitVq/6
	wxRKLhm03yTP6Ap8zPZ55aUNikaGxJCCnQWRIf6DVnuiGgBfQkM9tzfDtg9oFOZ70AOKR2XJcGqMY
	X5el5Haw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLTk2-0000000G4wl-1dqq;
	Wed, 11 Dec 2024 20:55:30 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLTiy-0000000G4hu-1Nq3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 20:54:25 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-85bb264993cso1507168241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 12:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1733950462; x=1734555262; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dYliTF35nPNFNRmXPIOQ4ksdgvuWl/AzFHNeTIQ3J/I=;
        b=EVafdoQsUP7r637RXo12Y+Xf49/+NEO7SQ8xWvkU4qh3CGgWMpV7TGWu9ECJ1f8bcY
         5fphETIWcHkm3OA61+xDUhW1+fQegEK18sLYKNn2sAJo8SbJts7oVOfG8OlnRov0tksi
         a76JE3iW4+7SdQemrLhb892dLoltCv6JpJm4lcr3OtOyy4HfXTarJ1G1qeHY09P+ScFl
         xx45oqbz3dO4VoCJSgSJAGfiLghDvHdPqIDZnEdX5DJNB/ywdwOpxYN911JaXm3vG2rC
         GkgorH/SOwaoc5lyuTO3jIbVB3mWSJy3Ji7Vj8tghIAqksOGRuEeVegV0UQajfhcA7L2
         4yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733950462; x=1734555262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYliTF35nPNFNRmXPIOQ4ksdgvuWl/AzFHNeTIQ3J/I=;
        b=jVnvRo+UXA/KCmN5XQZEWS9NhWFwBLTe/Evw7pNMkEEULGdAQi2bk72i65MqBv5NzT
         NF14XggA6QXJFkcfT5G42lCwDjmhzcEZ2R85Sjez+xPmq04ouzoEnEu4RV9ubgKtrQ0l
         Dg8C6zSWjqASf/BSu+kn2m6a2CjgxbvXyN7JIGv5+c7TSF1L0bvLfzQavbbVLKRZzvPo
         7O9t9CligaKCcqOpd+QYTO/X28chn8s10B9TXBuNGjuIG4BRRmbWM48lVj9rOMc/afq2
         8DtkB0qL/SalPNE2ri5xPD5yFqyf/fP1ArHPciCtFT6GZB9H0iM2G9TDXjgRAI6ZfJGj
         t9/A==
X-Forwarded-Encrypted: i=1; AJvYcCX3z1D5+yOGX1t/cI4v061TiTuwTdjWVPsiK9NE1IkAqqNDZ5AvQb4NCqE4QKATJrFtthaDh/wgSpoAzlTajWXd@lists.infradead.org
X-Gm-Message-State: AOJu0YzHFzUv/TsiSgAHoccoHjDrTYB+UkoImwc9/NZNjyD5GCuL2khz
	Z9nkmSd3eqtkPjRG8b+wW7Xqxqq1IBG47SGDBEwhO35vT/Du/bbQkKL90Ho7U6CqtCu0ryPmCan
	FFlUJIxw+nC11SsZKyhuVwVob0NB1yQDUeguPMA==
X-Gm-Gg: ASbGncvmDA7OYIo2Rs5IG8ylseQY9WnBrAjINfR3uCrfqiEBCrFGhDa5hsF2eujtvSQ
	RthKi3TV2HH2XbhdkUdxDcv7KakpqVCo6opBbTMsHAyGG1EsLUwspHnxz47CHUv2ZwA==
X-Google-Smtp-Source: AGHT+IFDJ3hxR2NNeGvlMcd40FPBdx04p3qGo6Inh+bBqmvdcNtdNFdP1cY9W4nm5HsXXzcK6b0wp6lE6uUBauKHkAs=
X-Received: by 2002:a05:6102:50ac:b0:4af:d487:45f3 with SMTP id
 ada2fe7eead31-4b2478d8b65mr1386165137.23.1733950462194; Wed, 11 Dec 2024
 12:54:22 -0800 (PST)
MIME-Version: 1.0
References: <20241025124515.14066-1-svarbanov@suse.de> <20241025124515.14066-9-svarbanov@suse.de>
 <4bbdf9ed-f429-411b-8f5f-e51857f0f9d0@broadcom.com> <f9f49030-0518-4e30-91a7-3c088c31180b@suse.de>
 <474e5e38-37a4-439b-b25a-fe60df03f25b@broadcom.com>
In-Reply-To: <474e5e38-37a4-439b-b25a-fe60df03f25b@broadcom.com>
From: Jonathan Bell <jonathan@raspberrypi.com>
Date: Wed, 11 Dec 2024 20:54:12 +0000
Message-ID: <CADQZjwci2SVN=AG178kj3yN=17nVixOHEZOjZCs9LSUihbby4Q@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] PCI: brcmstb: Adjust PHY PLL setup to use a
 54MHz input refclk
To: James Quinlan <james.quinlan@broadcom.com>
Cc: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrea della Porta <andrea.porta@suse.com>, 
	Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_125424_452239_361E7590 
X-CRM114-Status: GOOD (  35.47  )
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

On Wed, 11 Dec 2024 at 19:39, James Quinlan <james.quinlan@broadcom.com> wrote:
>
> On 12/10/24 08:42, Stanimir Varbanov wrote:
> > Hi Jim
> >
> > On 12/10/24 12:52 AM, James Quinlan wrote:
> >> On 10/25/24 08:45, Stanimir Varbanov wrote:
> >>> The default input reference clock for the PHY PLL is 100Mhz, except for
> >>> some devices where it is 54Mhz like bcm2712C1 and bcm2712D0.
> >>>
> >>> To implement this adjustments introduce a new .post_setup op in
> >>> pcie_cfg_data and call it at the end of brcm_pcie_setup function.
> >>>
> >>> The bcm2712 .post_setup callback implements the required MDIO writes that
> >>> switch the PLL refclk and also change PHY PM clock period.
> >>>
> >>> Without this RPi5 PCIex1 is unable to enumerate endpoint devices on
> >>> the expansion connector.
> >>>
> >>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> >>> ---
> >>> v3 -> v4:
> >>>    - Improved patch description (Florian)
> >>>
> >>>    drivers/pci/controller/pcie-brcmstb.c | 42 +++++++++++++++++++++++++++
> >>>    1 file changed, 42 insertions(+)
> >>>
> >>> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/
> >>> controller/pcie-brcmstb.c
> >>> index d970a76aa9ef..2571dcc14560 100644
> >>> --- a/drivers/pci/controller/pcie-brcmstb.c
> >>> +++ b/drivers/pci/controller/pcie-brcmstb.c
> >>> @@ -55,6 +55,10 @@
> >>>    #define PCIE_RC_DL_MDIO_WR_DATA                0x1104
> >>>    #define PCIE_RC_DL_MDIO_RD_DATA                0x1108
> >>>    +#define PCIE_RC_PL_PHY_CTL_15                0x184c
> >>> +#define  PCIE_RC_PL_PHY_CTL_15_DIS_PLL_PD_MASK        0x400000
> >>> +#define  PCIE_RC_PL_PHY_CTL_15_PM_CLK_PERIOD_MASK    0xff
> >>> +
> >>>    #define PCIE_MISC_MISC_CTRL                0x4008
> >>>    #define  PCIE_MISC_MISC_CTRL_PCIE_RCB_64B_MODE_MASK    0x80
> >>>    #define  PCIE_MISC_MISC_CTRL_PCIE_RCB_MPS_MODE_MASK    0x400
> >>> @@ -251,6 +255,7 @@ struct pcie_cfg_data {
> >>>        u8 num_inbound_wins;
> >>>        int (*perst_set)(struct brcm_pcie *pcie, u32 val);
> >>>        int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
> >>> +    int (*post_setup)(struct brcm_pcie *pcie);
> >>>    };
> >>>      struct subdev_regulators {
> >>> @@ -826,6 +831,36 @@ static int brcm_pcie_perst_set_generic(struct
> >>> brcm_pcie *pcie, u32 val)
> >>>        return 0;
> >>>    }
> >>>    +static int brcm_pcie_post_setup_bcm2712(struct brcm_pcie *pcie)
> >>> +{
> >>> +    const u16 data[] = { 0x50b9, 0xbda1, 0x0094, 0x97b4, 0x5030,
> >>> 0x5030, 0x0007 };
> >>> +    const u8 regs[] = { 0x16, 0x17, 0x18, 0x19, 0x1b, 0x1c, 0x1e };
> >>> +    int ret, i;
> >>> +    u32 tmp;
> >>> +
> >>> +    /* Allow a 54MHz (xosc) refclk source */
> >>> +    ret = brcm_pcie_mdio_write(pcie->base, MDIO_PORT0,
> >>> SET_ADDR_OFFSET, 0x1600);
> >>> +    if (ret < 0)
> >>> +        return ret;
> >>> +
> >>> +    for (i = 0; i < ARRAY_SIZE(regs); i++) {
> >>> +        ret = brcm_pcie_mdio_write(pcie->base, MDIO_PORT0, regs[i],
> >>> data[i]);
> >>> +        if (ret < 0)
> >>> +            return ret;
> >>> +    }
> >>> +
> >>> +    usleep_range(100, 200);
> >>> +
> >>> +    /* Fix for L1SS errata */
> >>> +    tmp = readl(pcie->base + PCIE_RC_PL_PHY_CTL_15);
> >>> +    tmp &= ~PCIE_RC_PL_PHY_CTL_15_PM_CLK_PERIOD_MASK;
> >>> +    /* PM clock period is 18.52ns (round down) */
> >>> +    tmp |= 0x12;
> >>> +    writel(tmp, pcie->base + PCIE_RC_PL_PHY_CTL_15);
> >> Hi Stan,
> >>
> >> Can you please say more about where this errata came from?  I asked the
> >> 7712 PCIe HW folks and they said that there best guess was that it was a
> >> old workaround for a particular Broadcom Wifi endpoint.  Do you know its
> >> origin?
> > Unfortunately, I don't know the details. See the comments on previous
> > series version [1]. My observation shows that MDIO writes are
> > implemented in RPi platform firmware only for pcie2 (where RP1 south
> > bridge is connected) but not for pcie1 expansion connector.
>
> Well, I think my concern is more about the comment "Fix for L1SS errata"
> rather than the code.  If this is a bonafide errata it should have an
> identifier and some documentation somewhere. Declaring it to be an
> unknown errata provides little info.

I'm the originator of this thunk - erratum is perhaps the wrong description.
If the reference clock provided to the RC is 54MHz and not 100MHz, as
is the case on BCM2712, then many of the L1 sub-state timers run
slower which means state transitions are unnecessarily lengthened.

This change, and the MDIO manipulation above, should be applied
regardless of the RC instance and/or connected EP.

> Code-wise, you could use u32p_replace_bits(..., PM_CLK_PERIOD_MASK) to
> do the field value insertion.
>
> All the above being said, I have no objection since this code is
> specific to the RPi platform.
>
> Jim Quinlan  Broadcom STB/CM
>
> >
> > ~Stan
> >
> > [1] https://www.spinics.net/lists/linux-pci/msg160842.html
> >
>

Regards
Jonathan

