Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF0EC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCaFx1tau/uvLCClkf2wwSaMLTwgcjUvUC6CkU3RdXs=; b=D60nTM/NYYnBSxjzXclnEvPx5I
	5R7QwgZYZ5lw52J4z3ABNoo4t0e3vmvAMKegLGlwMR+He1Q2ngsqf+JE3aDZSskCGvS75Dqztjjba
	8KGgo1+8ogVK1CwmLSS6qvxkcq/x/1RPZUrDOJA+tt8IO6IhgYUIkQIZpHsB4+aaAOoxeiPoCkzLP
	xDklxOPZxc//Kh6ms/e2AmPfduyJVyaI0ZZIbgwAJrXvqHRYsSW6yRaREnnPYUIYXnMEjFx9SD0BM
	+hGi1QdZKz1gHMSpTthWsd4+X/dkTwgKuMt7q5SnNZX7xdO+aP4jiJVwF8NNwyPrPLB72VjUHaQSF
	QN8i9GBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdte6-0000000AwF3-2WV6;
	Fri, 31 Jan 2025 16:13:30 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtZe-0000000AvZw-2AzK;
	Fri, 31 Jan 2025 16:08:55 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-518ae5060d4so691588e0c.0;
        Fri, 31 Jan 2025 08:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738339733; x=1738944533; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCaFx1tau/uvLCClkf2wwSaMLTwgcjUvUC6CkU3RdXs=;
        b=ZODPXg34J/70tA3ottq7XM1G6s1NLVLZskCPa5wDmB4TGPOk+mnb9vEMeCXUud4IuZ
         asx5lxufp0qtn80HbB9/CpcZ5I+SlE23yldo8hCfpxcoNRB4OjH6sH1eeuheEyPsqucU
         kRY5lPIhgkLpiKVtdqMD88WP5Orp8P5qLWwQKv01iOzp8MleurHDkvkcXRZs7JjSnF83
         s0x3agCjrZ9/SY+yEHNhLcrwI9viYtyrRfJVy126IjDVKti/wU0NYCABlHiU5RRcbGgY
         2Dy5ejnCg6Bt7BMynGuheoAcV9G01j+wxbBk4Qq0/lRANrhfELFZWERBwbfkc08FYCYq
         IQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738339733; x=1738944533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCaFx1tau/uvLCClkf2wwSaMLTwgcjUvUC6CkU3RdXs=;
        b=Yam5A7d7s5QevaHFNqcTM8ril2ifNgYcAQpPz0eFAVAHdyl2xDhiG12jfkh/K91Zog
         ibciGoJca5kcEFzm+uMUO5qTFS2XtNvJ0k/NXLvErqbXLbx8Qk+WHp/ijy5JtLHZ8P8y
         uAC+IE4Y5opBdBibRoi6Z6QxNlpQ0kb+mOcSGu67yUL+k9eB3kUMkuDNfPn/tfGOgg16
         G9Hnve4oGx8kmwq/iVFfxrVZDYEPg4hPOGSwA9NKF/vL6n+XhYxL8Lg49pjeGXFP4c11
         mGcqtmCQeG5TRJ7Df8yUnoxcYfSIw/JqdLBcz1cRXByiePr2GxmPEShonJF2Y8D0vFv4
         zTsA==
X-Forwarded-Encrypted: i=1; AJvYcCWhlxNTF2TvtyoKmptiFMLRMTgpGBAVRPzS6oRgn2sbRy6nURVytRMrwnjKG70CYTwnT6g9nKXbezA4mCUWjibK@lists.infradead.org, AJvYcCXvnLu21Nhitbb7qCHkeD9B9hqAMAHN0Qq9HA2wdHMb1dY09bels2emE0gHWBUCw8U/fH074xqZDhEYhC3JHDTYeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyrJkgdwMaYcIHDDFLwu+1yPhjzZCP81swagKAiB6xt3Ea4aVq
	27mt9Ou22XsVNOsAPAqFgISw8PXh6GoFaIBULBrKz6jSRVDhYwgqW8KbbIGMG9bieujv4A5Z9R0
	0DehW+I/EyXtIxTsy8UoidtwAsLCNSR1X
X-Gm-Gg: ASbGnctyW8YBDTpB2OMCSseQFgzoTFCYDFM88FNc5NRaHXfcgZBwD9XMkxfdp/9oMe9
	UFgHX5Lb88oyokUAeVMcux6l+9QXs0beIY+OgiZkrl3MKOx64jvrvaDUO4Pu/Cew42umhu5MVUA
	==
X-Google-Smtp-Source: AGHT+IHYtHN7NQoh6hNtrAdwoAYa7qI0MoWaBUwelkEk8UBLOskbrKXzZjF4j5miCwRUI07KmI2jpZGXVvhHioJuiQw=
X-Received: by 2002:a05:6122:1990:b0:51c:aa1a:2b5b with SMTP id
 71dfb90a1353d-51e9e3fdc44mr10795837e0c.4.1738339733279; Fri, 31 Jan 2025
 08:08:53 -0800 (PST)
MIME-Version: 1.0
References: <20250120130119.671119-1-svarbanov@suse.de> <20250120130119.671119-8-svarbanov@suse.de>
In-Reply-To: <20250120130119.671119-8-svarbanov@suse.de>
From: Jim Quinlan <jim2101024@gmail.com>
Date: Fri, 31 Jan 2025 11:08:40 -0500
X-Gm-Features: AWEUYZlRDqLoEwfW8ZjsMYge0gy5rqvEFzsQwIrPsTXZFKyo6tYXuM7WIrcpHfc
Message-ID: <CANCKTBt2J0c54jLO9C0coEExLUGtjCioj2SQTAuQkKctgLH79g@mail.gmail.com>
Subject: Re: [PATCH v5 -next 07/11] PCI: brcmstb: Adjust PHY PLL setup to use
 a 54MHz input refclk
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrea della Porta <andrea.porta@suse.com>, 
	Phil Elwell <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_080854_574585_9903A8AF 
X-CRM114-Status: GOOD (  24.96  )
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

On Mon, Jan 20, 2025 at 8:01=E2=80=AFAM Stanimir Varbanov <svarbanov@suse.d=
e> wrote:
>
> The default input reference clock for the PHY PLL is 100Mhz, except for
> some devices where it is 54Mhz like bcm2712C1 and bcm2712D0.
>
> To implement this adjustments introduce a new .post_setup op in
> pcie_cfg_data and call it at the end of brcm_pcie_setup function.
>
> The bcm2712 .post_setup callback implements the required MDIO writes that
> switch the PLL refclk and also change PHY PM clock period.
>
> Without this RPi5 PCIex1 is unable to enumerate endpoint devices on
> the expansion connector.
>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
> v4 -> v5:
>  - Updated a comment (Jim).
>
>  drivers/pci/controller/pcie-brcmstb.c | 44 +++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controll=
er/pcie-brcmstb.c
> index 50607df34a66..03396a9d97be 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -55,6 +55,10 @@
>  #define PCIE_RC_DL_MDIO_WR_DATA                                0x1104
>  #define PCIE_RC_DL_MDIO_RD_DATA                                0x1108
>
> +#define PCIE_RC_PL_PHY_CTL_15                          0x184c
> +#define  PCIE_RC_PL_PHY_CTL_15_DIS_PLL_PD_MASK         0x400000
> +#define  PCIE_RC_PL_PHY_CTL_15_PM_CLK_PERIOD_MASK      0xff
> +
>  #define PCIE_MISC_MISC_CTRL                            0x4008
>  #define  PCIE_MISC_MISC_CTRL_PCIE_RCB_64B_MODE_MASK    0x80
>  #define  PCIE_MISC_MISC_CTRL_PCIE_RCB_MPS_MODE_MASK    0x400
> @@ -251,6 +255,7 @@ struct pcie_cfg_data {
>         u8 num_inbound_wins;
>         int (*perst_set)(struct brcm_pcie *pcie, u32 val);
>         int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
> +       int (*post_setup)(struct brcm_pcie *pcie);
>  };
>
>  struct subdev_regulators {
> @@ -826,6 +831,38 @@ static int brcm_pcie_perst_set_generic(struct brcm_p=
cie *pcie, u32 val)
>         return 0;
>  }
>
> +static int brcm_pcie_post_setup_bcm2712(struct brcm_pcie *pcie)
> +{
> +       const u16 data[] =3D { 0x50b9, 0xbda1, 0x0094, 0x97b4, 0x5030, 0x=
5030, 0x0007 };
> +       const u8 regs[] =3D { 0x16, 0x17, 0x18, 0x19, 0x1b, 0x1c, 0x1e };
> +       int ret, i;
> +       u32 tmp;
> +
> +       /* Allow a 54MHz (xosc) refclk source */
> +       ret =3D brcm_pcie_mdio_write(pcie->base, MDIO_PORT0, SET_ADDR_OFF=
SET, 0x1600);
> +       if (ret < 0)
> +               return ret;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(regs); i++) {
> +               ret =3D brcm_pcie_mdio_write(pcie->base, MDIO_PORT0, regs=
[i], data[i]);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       usleep_range(100, 200);
> +
> +       /*
> +        * Set L1SS sub-state timers to avoid lengthy state transitions,
> +        * PM clock period is 18.52ns (1/54MHz, round down).
> +        */
> +       tmp =3D readl(pcie->base + PCIE_RC_PL_PHY_CTL_15);
> +       tmp &=3D ~PCIE_RC_PL_PHY_CTL_15_PM_CLK_PERIOD_MASK;
> +       tmp |=3D 0x12;
> +       writel(tmp, pcie->base + PCIE_RC_PL_PHY_CTL_15);
> +
> +       return 0;
> +}
> +
>  static void add_inbound_win(struct inbound_win *b, u8 *count, u64 size,
>                             u64 cpu_addr, u64 pci_offset)
>  {
> @@ -1189,6 +1226,12 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>                 PCIE_RC_CFG_VENDOR_VENDOR_SPECIFIC_REG1_ENDIAN_MODE_BAR2_=
MASK);
>         writel(tmp, base + PCIE_RC_CFG_VENDOR_VENDOR_SPECIFIC_REG1);
>
> +       if (pcie->cfg->post_setup) {
> +               ret =3D pcie->cfg->post_setup(pcie);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
>         return 0;
>  }
>
> @@ -1715,6 +1758,7 @@ static const struct pcie_cfg_data bcm2712_cfg =3D {
>         .soc_base       =3D BCM7712,
>         .perst_set      =3D brcm_pcie_perst_set_7278,
>         .bridge_sw_init_set =3D brcm_pcie_bridge_sw_init_set_generic,
> +       .post_setup     =3D brcm_pcie_post_setup_bcm2712,
>         .quirks         =3D CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN,
>         .num_inbound_wins =3D 10,
>  };
> --
> 2.47.0
>
Hi Stan,
Any reason you didn't make this a quirk like the other commit?
Reviewed-by: Jim Quinlan <james.quinlan@broadcom.com>

