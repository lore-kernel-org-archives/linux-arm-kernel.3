Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C14C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 10:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKqKeEQIi5rBs6NnW9qgvGwfpsv4wtOKoQMRdiWhtWU=; b=YBwJ00UTFxv0/t4SeCNjPTSQlO
	v3JbmWWxGzi+0Z5oMCcV93akMWJkoQAXBHsI4AlNmHj3NOAxzrAqv09GOAuo5sr9vUpSBzYt8zsOY
	T8mHRRkqn4pO12XTUNYCsFLvSqalYg6b5Fh3pVxu8Xy/eO7Bhl5U3tnleWK2EKyFA/8KMnClT5Gdj
	O0Lznc/rpx/9PCvYjiLCU2gyI2PPYRBBjMoN+ilce5xHUZDporfIuW/b37m32rjpAmfE8NSp07j1h
	f6c2+53cyaXv4MuXcxv/3JGHYdaGuBMU2JYUrV4rVWzYDpzO5bP01w87YE0LDOcEKe6vSn3RWL6t8
	rcVWiPzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV65t-0000000EE3V-2m4x;
	Fri, 27 Jun 2025 10:14:05 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV60R-0000000ECsc-39cP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 10:08:28 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-5308b451df0so620969e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 03:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751018906; x=1751623706; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKqKeEQIi5rBs6NnW9qgvGwfpsv4wtOKoQMRdiWhtWU=;
        b=bfHxswU/wkykS0oT+SfviahQ38A2n1AX3yGUeBHK6qV5JXP/AQp8K2IqihQGXcyKIE
         Tl0Pyj0MH/CsCkl+s8yCjfHZNk7ZJsxHpNBIluLirhLhJrD2Mtr5zXA594RVmYAV5daz
         4ptBUi6M2u+P3xAmAyF1MtxM74WRexScAv+Uki5xtN/KekXf5zQhCG6OqvhrsHzgZl4c
         GjDxWwTmB4DEv6mIFtiSMcBSpRNBoklrW24hGYCIV1X9L3v0/opCWkSVfpP/zaDNaWCr
         m7hQf8qxCcy/2nlgsX7BjFVMjgaPU1wPaS2FgJxf5pNmugLZWi7fvBTsYHYPN7uWZub8
         0QlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751018906; x=1751623706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKqKeEQIi5rBs6NnW9qgvGwfpsv4wtOKoQMRdiWhtWU=;
        b=b6nzIuTHSEtqlaP2QMBvNhCustM86dZhcJe6C2fg4DtGkxB4lQy7mSdtlrFxcuzVEu
         yPSX4ynWNzM6hkoMx2q4jlP3kp3IdC49UfZoKUglxEDoV2hAEmiCJBCzw6u3RKlSbL0H
         MireGwkynIgSia63xgw+isNu+ZkwY2SVaTMXsKtgL1PQRwr+7iBSZoAv74Y7zBKpvAB3
         hFV6VH6zZ6HhT4G2Tz4rslFFVO4JjoCKlc/pTpm4Y+chjG+am6uTcu8akr3bZrpHjFGx
         h77iLRu2Qq4ekgm61BRO/mj8aOmxqZnazUPgE6oUlJU5UGOzwIiI9kpg+DpzT+QjXwH5
         G47A==
X-Forwarded-Encrypted: i=1; AJvYcCVPR4D+WSlf1xImPF5JZjgKZJGfwrICHmIVye5i8X3JFrhBt576EuOG+Mn8iiGCsWHDVOhZfCozZLSK19Q7aEYB@lists.infradead.org
X-Gm-Message-State: AOJu0YzhVDlB3RfF4l0uOkXTAAzQDGlj3wrO7v467uBL4auLz4hnmb+y
	PH06j3YSmBp9wdenufoJWcUO95VfzQWTnAUy/Df397jbv3VSXGJglbOq93v6+cdBC+cFI7CJjeW
	V43/gjhx8gEAujjw1WJbHis5nAYzc4j0=
X-Gm-Gg: ASbGncuG9DM4XPemI64sYYzrxB5EqULnJu2qhM9ysZ7eASKHsNWNK+H+oQbPb6/BlGx
	vpfd+rEKKvBrPH8D+gXX6W5Hybxy+Q0k7a5OysEJ0ZFJkdEyetOlQkHrpWd0wZFBefNW7qOl1L8
	2Y3eBRhXgthZ8scIU2B1dnuoVqU0ZZY4kLqvNoUZkhYQ==
X-Google-Smtp-Source: AGHT+IFJR1ekkTakx7iLzFg2MmwPx3iR2frkf7yCwLG0DMtrwqa0Ef2TsBzcDBBDhQMnhbqRc/4wjrzOgmYP5u2BEfo=
X-Received: by 2002:a05:6122:201d:b0:529:2644:8c with SMTP id
 71dfb90a1353d-5330c05f7e3mr1650742e0c.8.1751018906374; Fri, 27 Jun 2025
 03:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org> <20250627-exynos7870-dsim-v2-1-1433b67378d3@disroot.org>
In-Reply-To: <20250627-exynos7870-dsim-v2-1-1433b67378d3@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 19:07:47 +0900
X-Gm-Features: Ac12FXwuq4aPAVgwoZvhR-bhfqA6nFAJEthK_CWI5Sw-XpWQOZJfdg9HyifhjZA
Message-ID: <CAAQKjZOHUGg8WEZxfhVxrUPS3O68BQJ6=cDnUSk6BomYjuY62Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] drm/bridge: samsung-dsim: separate LINK and DPHY
 status registers
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_030827_793679_636DEE21 
X-CRM114-Status: GOOD (  24.80  )
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

2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:42, K=
austabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Exynos7870's DSIM has separate registers for LINK and DPHY status. This
> is in contrast to other devices in the driver which use a single
> register for both.
>
> Add their respective entries in the register list. Devices having a
> single status register have been assigned the same offset for both
> entries.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index f2f666b27d2d5ec016d7a7f47c87fcdf1377d41a..7fd4c34cdc3170d363942f98f=
eec048097da3c06 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -30,7 +30,7 @@
>  /* returns true iff both arguments logically differs */
>  #define NEQV(a, b) (!(a) ^ !(b))
>
> -/* DSIM_STATUS */
> +/* DSIM_DPHY_STATUS */
>  #define DSIM_STOP_STATE_DAT(x)         (((x) & 0xf) << 0)
>  #define DSIM_STOP_STATE_CLK            BIT(8)
>  #define DSIM_TX_READY_HS_CLK           BIT(10)
> @@ -239,7 +239,8 @@ enum samsung_dsim_transfer_type {
>  };
>
>  enum reg_idx {
> -       DSIM_STATUS_REG,        /* Status register */

According to the datasheets I have, both Exynos5422 and Exynos7420 use
DSIM_STATUS, while Exynos8890 splits this into DSIM_LINK_STATUS and
DSIM_PHY_STATUS. It appears that Exynos7870 follows the same approach
as Exynos8890.

The current modification removes the legacy DSIM_STATUS_REG and adds
new DSIM_LINK_STATUS_REG and DSIM_DPHY_STATUS_REG. However, this
change causes the register names used for older SoC versions to differ
from those in the datasheets, so I think it is better to keep the
legacy name for backward compatibility.

How about modifying it as follows?
enum reg_idx {
    DSIM_STATUS_REG,          /* Status register (legacy) */
    DSIM_LINK_STATUS_REG,     /* Link status register (Exynos7870, ...) */
    DSIM_PHY_STATUS_REG,      /* PHY status register (Exynos7870, ...) */
    ...
};

static const unsigned int exynos7870_reg_ofs[] =3D {
    [DSIM_STATUS_REG] =3D 0x00,        /* Legacy compatibility - use
LINK_STATUS */
    [DSIM_LINK_STATUS_REG] =3D 0x04,   /* Link status register */
    [DSIM_PHY_STATUS_REG] =3D 0x08,    /* PHY status register */
    ...
};

Additionally, by configuring the hw_type field in the
samsung_dsim_plat_data structure like you did with the patch[1], you
can use the appropriate register name for each SoC as shown below:
if (dsi->plat_data->hw_type =3D=3D DSIM_TYPE_EXYNOS7870)
    reg =3D samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
else
    reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);


[1] [PATCH v2 12/13] drm/bridge: samsung-dsim: add driver support for
exynos7870 DSIM bridge

Thanks,
Inki Dae


> +       DSIM_LINK_STATUS_REG,   /* Link status register */
> +       DSIM_DPHY_STATUS_REG,   /* D-PHY status register */
>         DSIM_SWRST_REG,         /* Software reset register */
>         DSIM_CLKCTRL_REG,       /* Clock control register */
>         DSIM_TIMEOUT_REG,       /* Time out register */
> @@ -264,7 +265,8 @@ enum reg_idx {
>  };
>
>  static const unsigned int exynos_reg_ofs[] =3D {
> -       [DSIM_STATUS_REG] =3D  0x00,
> +       [DSIM_LINK_STATUS_REG] =3D  0x00,
> +       [DSIM_DPHY_STATUS_REG] =3D  0x00,
>         [DSIM_SWRST_REG] =3D  0x04,
>         [DSIM_CLKCTRL_REG] =3D  0x08,
>         [DSIM_TIMEOUT_REG] =3D  0x0c,
> @@ -288,7 +290,8 @@ static const unsigned int exynos_reg_ofs[] =3D {
>  };
>
>  static const unsigned int exynos5433_reg_ofs[] =3D {
> -       [DSIM_STATUS_REG] =3D 0x04,
> +       [DSIM_LINK_STATUS_REG] =3D 0x04,
> +       [DSIM_DPHY_STATUS_REG] =3D 0x04,
>         [DSIM_SWRST_REG] =3D 0x0C,
>         [DSIM_CLKCTRL_REG] =3D 0x10,
>         [DSIM_TIMEOUT_REG] =3D 0x14,
> @@ -690,7 +693,7 @@ static unsigned long samsung_dsim_set_pll(struct sams=
ung_dsim *dsi,
>                         dev_err(dsi->dev, "PLL failed to stabilize\n");
>                         return 0;
>                 }
> -               reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);
> +               reg =3D samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
>         } while ((reg & DSIM_PLL_STABLE) =3D=3D 0);
>
>         dsi->hs_clock =3D fout;
> @@ -966,7 +969,7 @@ static int samsung_dsim_init_link(struct samsung_dsim=
 *dsi)
>                         return -EFAULT;
>                 }
>
> -               reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);
> +               reg =3D samsung_dsim_read(dsi, DSIM_DPHY_STATUS_REG);
>                 if ((reg & DSIM_STOP_STATE_DAT(lanes_mask))
>                     !=3D DSIM_STOP_STATE_DAT(lanes_mask))
>                         continue;
>
> --
> 2.49.0
>
>

