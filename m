Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8A7CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksIL4rip+tLI1Yx6QhQXSN6krUTnsd9SRkVzjQXrZjA=; b=hDbV5Weib4XvjWy8cd0BhcbLlx
	hxaWNmb+CfdaKyZ7YXBHTfgpDzz2fwhPpdh93/eVXNUebAxaaH/0nequpGqNkaYVgewNlCunpD6Zm
	bgsgJ/jehHUi2f+YUOz8CpsdCJyFm0xX31cvIF0lj7AZhT8hbY2yP10Ms0IA315iUooE+EMEWlV7x
	slDf4IUsstw+C2+vWG++IG9uoca8+8es997adhvsUvT6y037AbcRalBkd4caLfU1zaxcxLFyH98Me
	VNnqYBEdW3HH+v4nZE8EnopzlhKr7oJ8mvcRsBLdF8GUTEwnIApr3Y99Bzx1ItDRTULrCtApiGUoa
	QSEFqJIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQ40-00000005Pws-3IBR;
	Thu, 30 Apr 2026 12:00:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQ3z-00000005Pwd-1EWO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Apr 2026 12:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ksIL4rip+tLI1Yx6QhQXSN6krUTnsd9SRkVzjQXrZjA=; b=mMNmyRcj5XBVovhhKcjiCTzzXY
	xdHUt0Parzimt25VhlDbSdN7jCikvDtgEF0UoqMQ2MRm1cz7aLXuw+6IIZIlBY+EJJLM8F1pamaUz
	yifQNeNN6ucl9J1MsSijXZmB8YVl2irtoQvAwsPumxUgsRqGi8SwfNbcBgWdPVQrGpXHTL3K3Abn3
	iZAgNARkrLmF+be27NUE5limpMs+Ag1j0UhJJVDcSXix311POohnI9rWgxk79qpOqrBHwihKygmqO
	GqA0hCcmCit4kNoSfYaUsgzSXwgew5/Y9br70wUb/x+LZfS3LlFpA72D2/ojUJxx/dXaGOPSxmkSM
	t3Bu4YdQ==;
Received: from mail-ua1-f43.google.com ([209.85.222.43])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQ3u-00000007JYD-3npi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 12:00:14 +0000
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9589125e047so372782241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 05:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550409; x=1778155209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksIL4rip+tLI1Yx6QhQXSN6krUTnsd9SRkVzjQXrZjA=;
        b=p+HkLQfrc4gAx72KALBSmJv8Xpi6OebqqnoIfLPFv01gpHOr55cQU8gqKYX1p6ejL4
         2oQfk/4o81bX6te/9XTQFCMWlOUUr876jAALbKK3HLkc6JWykhScr7V6QHi8iVyRpG3G
         +nKQH8asMm9BQVfGSzDfxOnO5/4DXwdu8aG4M2UrHFwT4wTH9yN+gutnZ9/sqMk8bMyF
         1Sil57rS234twNk+jZ42yAy3XDqirMEVvzvAORrhfQHJOGutgE2vfhtiBRGWq8Kk5NXn
         +lONX6e8sop13h5mjIqkYuT0a/bIazYKpwn8RQwCD7UusBXy0XZ5PlNBC1ZEBEvEYC3t
         npTg==
X-Forwarded-Encrypted: i=1; AFNElJ+aOb+suyF9wRlM7Ro/Rwh3dwT7pI0NcMfwtxhzbI+MVlLKkHuLYPWf13FKacP7byaLBoam34qdlCGNiUqD1a6H@lists.infradead.org
X-Gm-Message-State: AOJu0YwOEj64UW1esSrFPZlmBsakA3mFQemO5GoO5oTjwJe7ulHN+15/
	nHS1lz1PtDtNVj8EwoAlHu8wE2bKKJoDeLQyxAN2bFCw7HYeOAsIvUPdLAEY+LDJ8+w=
X-Gm-Gg: AeBDietCNpOQtwpHzjzUU/MgsTNtj2TG8ZBfDApsv0gI87EOFieXueP8l6MHnstCio3
	NLP5woQLUnjFgY5Ws1KFe+LeWw9dBp6WmUMlW9yXReG5EuvKxhUSLAGeNB3ckueUff/32YvavzD
	ijm7uCPjYRRG9he7CO4y5t5KK6V+UK+R5gcQBRVIw10JwHdBPb6MNASmYeAeAm4SuDTs99UTurd
	7Xm/qU/9DjTNzYtdQ1qjRQj4MJDGQl+ADb+T5rKtYAVMXzSY1JSLvBenhkFiIFDBW7ZOmjjgkAB
	PZz7F8+kf3p04tGGiy+ESUKTwoigqVZbVe4nOujd8yG98vj/8Pox2f4tmse32Gx5ieODkVC5uTm
	LlnzLErogjw4tyXNXDaFuLB54feVfLjnxiLJ5dF49uVfuM+d2ImyLjlrKuPXu3WgGlnDWw/X13K
	8NWmDvo2amb1hOqupY4uqtTpxr3pVxOk71m4/Lx3Kb2kJclcRCMQFRSKHF5KvvqWHUEwzvylc=
X-Received: by 2002:a05:6102:6b0a:b0:607:d68f:d0f6 with SMTP id ada2fe7eead31-62aff523e54mr633697137.20.1777550408952;
        Thu, 30 Apr 2026 05:00:08 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb7765acasm2581542241.8.2026.04.30.05.00.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:00:06 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9589125e047so372754241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 05:00:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/hnZf3REc3HFDwgryddxKQJukrw5A+/BdlaISw7H60tlX1rnEYdoF1MUtVGaTwho1Ns1NJPUfQh3ZrINeC9BYk@lists.infradead.org
X-Received: by 2002:a67:e708:0:b0:610:347f:9f3b with SMTP id
 ada2fe7eead31-62afc506100mr613209137.3.1777550404889; Thu, 30 Apr 2026
 05:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260430110652.558622-1-vladimir.oltean@nxp.com> <20260430110652.558622-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260430110652.558622-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 13:59:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
X-Gm-Features: AVHnY4K0yYb6vTu9KdtDciwvAziqboYRX_ITZ386sa6ttixZ1EP_Mzy9gi4Pi0E
Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
Subject: Re: [PATCH v7 phy-next 17/27] phy: introduce phy_get_max_link_rate()
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
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_130011_163225_FC006AB0 
X-CRM114-Status: GOOD (  23.77  )
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

On Thu, 30 Apr 2026 at 13:07, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> In CAN drivers, the transceiver is acquired through devm_phy_optional_get()
> and NULL is given by the API as a non-error case, so the PHY API should
> also tolerate NULL coming back to it. This means we can further simplify
> the call sites that test for the NULL quality of the transceiver.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Markus Schneider-Pargmann <msp@baylibre.com> # m_can

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 3 +--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar_canfd

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -57,6 +57,7 @@ int phy_notify_disconnect(struct phy *phy, int port);
>  int phy_notify_state(struct phy *phy, union phy_notify state);
>  int phy_get_bus_width(struct phy *phy);
>  void phy_set_bus_width(struct phy *phy, int bus_width);
> +u32 phy_get_max_link_rate(struct phy *phy);

This (and all the existing getters) should take a "const struct phy *".

>  #else
>  static inline struct phy *phy_get(struct device *dev, const char *string)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

