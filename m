Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F64EEF316
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 07:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xyHjzGnphi32H4Bte19x6wQV76UaiJqzbc3zMkJKs8=; b=Tw0pJux8oVx4lUD2dZwEJqrmAY
	yBjXigPWtnM839D2fjFfj8CPk4F1P9PdoggpAO+lqxyy9+gTfTJREDbe4u1QTQthkJz3hcgX1FULY
	dru5BP+L3dFpQwaeXw9IjNGA/VjNCocNSVnmrMlg5RfA1HzAjFw7YMEATOJq6vtsHQUFLFNt5qfjq
	YfIqOVxOxd78aTFZ7gqmlL6YTbNVH6Ya13JrWGiagYQQnXtbth3ebhjUL+BZl+pj52K9oM/I+UvRx
	yMlqxeht/w6Q44m/lGk3w049nRr+DyGQvwcVwHqocCBV4POs7khh8tb26DIV+h5Z0KJ4IWu9L9+hN
	B2sCCcsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3X3-000000018Ar-2mB6;
	Thu, 05 Mar 2026 07:54:05 +0000
Received: from mail-oo1-f45.google.com ([209.85.161.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3X1-0000000189K-1kxB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 07:54:04 +0000
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-679f6f0855bso4659165eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 23:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772697242; x=1773302042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xyHjzGnphi32H4Bte19x6wQV76UaiJqzbc3zMkJKs8=;
        b=lHFTpvcC+S9Y2QvMpGdCXReZ71r+iC9LkWSghVEt5CTm5MwxmL6+nZP2r0e849xlJn
         RURBmHbr3oYCC6Tf/KclJ7KijY4VbN/qb7uMWeCVYJpHP7wQrcT2SEwykzjl/onPtqZt
         NnPZYDWlQQmSirze5EhEG6UOXNqUV5O4rxazljdeOQi0COBwqW/vgBo2++XK3Ttltzrt
         RRRoF9fFDSPo0H+fpHN0KrO+vhQBQZ6kQINr/paNDG/9mXpUowdV4Zsgl1DPtDDRjw4D
         Z9KNyw8RBSAOzRfsrakWE8DRX8+geJsiER2YqgRtZfJiHhhFIzCxIcxK8TYcOA4aRj6S
         Mq0A==
X-Forwarded-Encrypted: i=1; AJvYcCXzN/TSDzL5DQ2orY1oMAHcHr+0Hh/KXFnyAfFU8KyR51CJqmXChXRf2m+XwnrL/vcwR/0TCJeCnwoksdBAF9ps@lists.infradead.org
X-Gm-Message-State: AOJu0YxiJp218HbKTGNXMD2aIxgYS3n28qGpoSNtUrsVkGat0hwKPjAR
	FcflLr4r+d5ggqxbtHwbIUlkl1/MvOd+/6LBqLZDUxbHZVgYXfkkNvHf2aqOQLJ2
X-Gm-Gg: ATEYQzz8dsBFCQ/czyHzuMJvjDIIfpRiDT+Rgk6kvOhPa9hzuKMDII4BVVozDqY0K3S
	Y8HP/UBpZwqeK8GH0oO3to0jZHs4zezGdgKe3leashHxXrRTp8RQVe759GhcRd95sKAZHWaa+Ql
	aR1lSd+pTX3k8AQ1KayaKzAde0AjgCSrp/tPuLvpKQu2r5tfxtGXtmvl0u3HYsWbk9esd4VH+3L
	avUioWM3EGE3H8ifbAU3BBRwURSDzYOeRsOXPoCFWKND+J1LywcpfI+tLn4RmpZdBQmWnUV9e9p
	dmzU9Xz8AHajIIs86zH4g6H5UIb8mwccqFQkSFXs6rTvptmt9uIgmtVIS5MCgYV7MZCE4oV+l62
	FDNV25S4s1B2VA0HXljKT0G3wtjQzD891peJxS8dcvMElY97PuP+1T2YnneF5QlLxfNtHZLHS1H
	pEZhf+zTjkIk885ol8MoPp2wzDwcC1rGMv/LdZfD9wbgSkxW5RDopDJGBqtcku34gv
X-Received: by 2002:a05:6820:1628:b0:679:7aed:9529 with SMTP id 006d021491bc7-67b0ffa7f7amr3307858eaf.1.1772697242012;
        Wed, 04 Mar 2026 23:54:02 -0800 (PST)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2cfb134sm14097152eaf.8.2026.03.04.23.54.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:54:01 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-463f00cda04so5011356b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 23:54:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXdyKCJkqGuNVD0DU0+Qz1AZAoeOkxMdhdxPcpQKRkjlbC7P7WzLYkuFJ1hOtgQgYTnszUPlKEvfla4SNYca3cP@lists.infradead.org
X-Received: by 2002:a05:6102:32c1:b0:5ff:a16b:93f9 with SMTP id
 ada2fe7eead31-5ffaae2d5b0mr1883200137.21.1772696877960; Wed, 04 Mar 2026
 23:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-14-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-14-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:47:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
X-Gm-Features: AaiRm514iMGAdfTBAVsgfVfK-GGHy9jHY4ezK-Lp3w09-JWpnENLQ0I4lkIFgvE
Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
Subject: Re: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate()
 helper for consumers
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_235403_453225_01C8B4ED 
X-CRM114-Status: GOOD (  23.34  )
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

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 2 +-

For the Renesas part:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -640,6 +640,12 @@ void phy_set_bus_width(struct phy *phy, int bus_width)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_bus_width);
>
> +u32 phy_get_max_link_rate(struct phy *phy)
> +{
> +       return phy->attrs.max_link_rate;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_max_link_rate);

Any specific reason you are not making this a simple static inline
function, like phy_get_bus_width()?

> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

