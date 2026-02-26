Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EE2FD8FC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0ezGVOcarv9ScNAFNBu6P5NdLNkz1RoEz4XxD5dNpA=; b=WwoFmi7lsXfIr8McUrw6IzdCVF
	mrXFfRM/wv03ReSupLmda7Y4o682pYPaZBqgEVlBMfeRAGQ0j8fJcecw0tW3G+a0tuX6Kq29RfCid
	GktTGK8G97EqXAXPXzQE+mhLlOCJyu7ia2tjcxmtcB8VYfXxg4wgu9yUfdhTn4X4GVjf9Fxt7cI1/
	+vxgpSphwSvghjnAvjbp8usJRFHQwclio9F8urjhmd9HQiC99vnlu5zfhiMQ8HYTKfFq7LKfuBb9h
	NdpFyx7MN7ANgpcsJdhYhr3CWxPs3cUqkE+PNSn8otZmK+s/bwDT/rcU6dWW0E9W2LI3Oww2i+QJf
	n+XeUGvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd4D-00000006TDl-3s7s;
	Thu, 26 Feb 2026 15:14:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd4D-00000006TDH-0VH1
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 15:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O0ezGVOcarv9ScNAFNBu6P5NdLNkz1RoEz4XxD5dNpA=; b=PZp7/Y/MYJA+4/IlvcYz1Qdbma
	SlL+4bqYTbJd4cv82R7nF0iFFFkqoO2Ji937yEaQWGZchb2PiRr0j8LUseisr/RfD5haCJbiJnNmt
	jVU6DxnOHkbUKc3vsK0ZBrYoxB8oEkr/VZWSgR+UFipCK+MrGII/3VUlKTiThhpafaFvNMYF1bxSd
	KglSs4jyT703wfyL2Yg5YB5VKqICgNghfm3g1lO3vTZOdphkXvKZDJvChH0zAR6I2IdsUSM3HQ8CV
	yac/LOX5BXgIe4L7LHXK4THT2XktPc6CCGgxvEyjh1rcsSa/aJ1IeC3abnfKMtdbuSYOQoayZDsZH
	mOJg6zjw==;
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd4A-0000000BHxD-1YH6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:14:16 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a84f2bf7bso1133383e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772118852; x=1772723652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0ezGVOcarv9ScNAFNBu6P5NdLNkz1RoEz4XxD5dNpA=;
        b=f3UKS1SQwaHAcpq2VsktMAM5jUUiD3DXDzbGCMmdXEjEA3tivqKETiUtcq9TggJotv
         i92fFGpJmJ3X7z+K2rqy8ZvpgCzLgKabG6cCrq0zxoSvPPXWrF0ClAzVApn6lLm31EI2
         p0CRum1o52c3/pbzbp6wJLyuZ9rf6Ngg8Vc1OCUMml4zO3HSUHH6giZtoNAVtx0yi7cH
         8MwNFT/zSRKDTnb3Tge+JNxwo22XT64J84fpvB8664fbqZ6ZwEr2VwAgWaY5/U4CNgv7
         E90H3Ns/YhVLkf4yFDg1krFChDzq2pMKITYCaxQUCrbRGw8Xmw1g49yIHPXU61hSPqtM
         WoQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvaAk0ZuqGXVOMkxrmvtrCcrGlIsL6ZKDXJjpmyjXShW4ZTnlnRlJv/81OVm1kovDEUQB3WekUq9nKiYKsVtAK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2eyXlotVgekI34aINkJdfUs6+vkKQi1tH+4s6p9gumZfFvpAE
	/Bn/In/Qga1ZNYJBj2otpd/iZR6RzT7kCckdzgv+B8eGVP4LUaOz2VaGEsUnDT+x
X-Gm-Gg: ATEYQzxHYsaQfuPiZPhtSrmqRDWXRFBftHHOiV3hE5SKxhO2dHf/kUo34C9FkSnhL1J
	XVRk+/058+zpNE/IT2o327WG9SFiu0yhF18ro10RaawX5DLf2POOBA92mvkVTxWrxAsbNSSDqgJ
	I5WcAMl7YdMfnz9YNQCObbAUuhgOt7y/98q7pKusQSOUiJnTZNF3scUr7UKQGC2e5vlRtaJm9jz
	QmRSAgVG7WKIdzF9lfo9Sn8etHeyKAjwlmu/iPPO1wCtMaypveBRhf0g3KB+6nwcEnzPGOs+Zdf
	TtrI7FfVL8dQpl0Wo+23FX10WhFmxDdj3Kb3jx2iLkPX0GGsHYCFPYFiB44FKJhf+ToWjWsHSyD
	7G37rT77nulMN692l5o7iyVbR/uxqD3rVuGoQfKwFnCrVwnj5X3D9vUqSaurAqWwnx41HY+EdCP
	pbsnUAF4gvKoeDqlNFZCMVXy7sOQxbC/XNZklYUHBQWJGkiFWTBrwMz7tPPau2fbZA
X-Received: by 2002:a05:6102:f0a:b0:5ff:8b8:9f8c with SMTP id ada2fe7eead31-5ff20b97e2emr1322301137.26.1772118852100;
        Thu, 26 Feb 2026 07:14:12 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df65c4951sm1891160241.14.2026.02.26.07.14.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 07:14:11 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a84f2bf7bso1133337e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:14:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPlXr9jkJAL+VpfB7qzokpk0SrlYZGBbRkn+P6RsmYPkZcoNB1gfLz2sGjLOHu60IOH2rKmu2C38buN7GmEsrh@lists.infradead.org
X-Received: by 2002:a05:6102:3a09:b0:5ef:6550:e9f0 with SMTP id
 ada2fe7eead31-5ff20c71950mr1513822137.36.1772118850413; Thu, 26 Feb 2026
 07:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20260111093940.975359-1-vladimir.oltean@nxp.com>
 <20260111093940.975359-6-vladimir.oltean@nxp.com> <CAMuHMdUBaoYKNj52gn8DQeZFZ42Cvm6xT6fvo0-_twNv1k3Jhg@mail.gmail.com>
 <20260226151036.x4z4bdlxwgsqlkhs@skbuf>
In-Reply-To: <20260226151036.x4z4bdlxwgsqlkhs@skbuf>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 16:13:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXKbiKUkP=+FDA_-Kd_qx1X6vzSuyPU+Tdd9MgR=Q5WMw@mail.gmail.com>
X-Gm-Features: AaiRm50hl5iFqVfPGnJ3OyUGaG2ytMnVkvc4q6N2_1XHwxz7HIPlFh5Oi8AcHkM
Message-ID: <CAMuHMdXKbiKUkP=+FDA_-Kd_qx1X6vzSuyPU+Tdd9MgR=Q5WMw@mail.gmail.com>
Subject: Re: [PATCH v3 net-next 05/10] phy: add phy_get_rx_polarity() and phy_get_tx_polarity()
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Daniel Golle <daniel@makrotopia.org>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	=?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Eric Woudstra <ericwouds@gmail.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Lee Jones <lee@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	KUnit Development <kunit-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_151414_484983_48E4CA02 
X-CRM114-Status: GOOD (  31.96  )
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

On Thu, 26 Feb 2026 at 16:10, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> On Thu, Feb 26, 2026 at 02:22:29PM +0100, Geert Uytterhoeven wrote:
> > > +config PHY_COMMON_PROPS
> > > +       bool
> > > +       help
> > > +         This parses properties common between generic PHYs and Ethernet PHYs.
> > > +
> > > +         Select this from consumer drivers to gain access to helpers for
> > > +         parsing properties from the
> > > +         Documentation/devicetree/bindings/phy/phy-common-props.yaml schema.
> > > +
> > > +config PHY_COMMON_PROPS_TEST
> > > +       tristate "KUnit tests for PHY common props" if !KUNIT_ALL_TESTS
> > > +       select PHY_COMMON_PROPS
> >
> > This select means that enabling KUNIT_ALL_TESTS also enables extra
> > functionality, which may not be desirable in a production system.
> > As PHY_COMMON_PROPS is bool, this extra functionality is even part of
> > the base kernel if KUNIT_ALL_TESTS=m.  Unfortunately PHY_COMMON_PROPS is
> > invisible, so this cannot just be changed from "select" to "depends on".
> > But perhaps PHY_COMMON_PROPS can be made visible if KUNIT_ALL_TESTS,
> > so the select can be turned into a dependency?
>
> Is this what you're asking for?
>
> -- >8 --
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 02467dfd4fb0..1875d5b784f6 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -6,7 +6,7 @@
>  menu "PHY Subsystem"
>
>  config PHY_COMMON_PROPS
> -       bool
> +       bool "PHY common properties" if KUNIT_ALL_TESTS
>         help
>           This parses properties common between generic PHYs and Ethernet PHYs.
>
> @@ -16,8 +16,7 @@ config PHY_COMMON_PROPS
>
>  config PHY_COMMON_PROPS_TEST
>         tristate "KUnit tests for PHY common props" if !KUNIT_ALL_TESTS
> -       select PHY_COMMON_PROPS
> -       depends on KUNIT
> +       depends on KUNIT && PHY_COMMON_PROPS
>         default KUNIT_ALL_TESTS
>         help
>           This builds KUnit tests for the PHY common property API.
> -- >8 --

Yes, that would work.  Do you think it is acceptable?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

