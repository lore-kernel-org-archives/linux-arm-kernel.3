Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62812D2F02C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 13:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlR/WA7RxT5C3CkoKZj7WZ73vofWrh2up1KlQooa0gk=; b=wHeuHiszD9157HptJg8shHOQlS
	q5qRD8b+w5u5u3I3hYJqEjlB/cVRX+aSgsk0P0gv8oKOBZniJ9c0G4ut9VHaYrdP+BU4DITpvgm/w
	ST29yV2jvy5iABvgFeseA067r7oEshhjUBAm4ciQE06pmkh8iWhW9GT9j5RFLGkTCVglkZFP6HInB
	anfV4NQEbTF1c3NTEMm+Yf9cXAjHFlJKzAoCD1Y2w68dfBSoUga2ZVQofcTLVzoJAk8jkwj2bUTwq
	EvJaCP8ZY5DyX7ZpSFy8Fqf9I8QyFxNwqvM9TjFUVr3uwSFUn6TG0mTqF4UG+c59fQc9yX34ozX12
	w5IC6Qmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjIW-0000000EJy1-1OMd;
	Tue, 27 Jan 2026 13:40:00 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjIT-0000000EJxK-46fP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 13:39:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so5780312f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 05:39:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769521196; cv=none;
        d=google.com; s=arc-20240605;
        b=P6LG0vPvv4dBispqh5UuI9GRUH4sCrjAJuqXL1CjEpd3LF7+kfZ0PAx5+4eG9gbzQP
         ZZT9nMEbY22nqARBKre3rdvpgHxwW+T6hTkUUfYPu27t3hE935O+rescZx7fuuzQ08Gz
         FlC/2SAgXYLqpqqj6T2TrZbeDMbqkTjQoe++8zKeCR2014/5PoxumEOHSv3/n1q/FV/K
         8cACdbOD2G0/YYJED0TSYLIBJ0H16NdwswkTafBUM75yQQPP34TSFGQ8nEydUTJiQoon
         tdZiNy8ApF3ThE75dYDZD8IkW6GllqyTBOJIPJ48saqc3qu0n54B83Ysccs6/Kr0V5Ig
         Vxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IlR/WA7RxT5C3CkoKZj7WZ73vofWrh2up1KlQooa0gk=;
        fh=wTJpxbUWakxTRi2Qd3BXGauRk1V70utlDc2QdVDz7KQ=;
        b=NzTecpOIJ3hlusvWGmsfQSNcRezrqynXep0PjdoNjv9DAMrRbd1v/66oumCmvvRpo0
         PoyLht3ydUGK41BVuFF9j5KLqGpCJzBAxnj1hjLu3K1QVX6FMuUoSwJt/wk8xi3SsN71
         GlZc0oBfSG58r6oQp+7tNto9EsKAc5hhv8VEorl51c5EZZ1HnnqppLgJTnMEnGIdCpU7
         JmcOPK8xdTs51/x6MC+7zdyGkm0Uz8h6r5pT1XoJQsahda8nxH+NI1tI1+UMQ7Vc8XTb
         gKk2B51d8z6KWKpHMTinbqtTz1AkjD3oviLnE7UNtnn08m8MtHVYfOeBmoEaSzmXSBkj
         JXqQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769521196; x=1770125996; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlR/WA7RxT5C3CkoKZj7WZ73vofWrh2up1KlQooa0gk=;
        b=c5eXuDRqqTfOaDKfPld9a06Zx2sM5JfdwNF6QHlMSGKOwb5kIIKcnlEg97iZUnlqfm
         Kwj7ap2RA1ekRn9xMLkEnFuMt+GutNl6iJGKy9bNfQs0x6E+jwO8hCA9QLIaoEJVZyp4
         jm48yfypfDJ9o5ezm1hBKtt24Lq6zYcWDM2HwtERofGP2MNozImTXYwKzUTaaFE8yawi
         7pBH3Uuwz2RifQ2R2Dcnny0vYdsAVQsDiU3/SSzHr/Pdi16POpYStYx9Veu8xHUt6x7Q
         c2bwWNDzPHjH1WykwOp8+BeY4QH7vQr5F0oWcmtMNlhDWX9VIayECfXguhT/UOSV6guH
         BChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769521196; x=1770125996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IlR/WA7RxT5C3CkoKZj7WZ73vofWrh2up1KlQooa0gk=;
        b=lokiAEQNUU595Vv3RKReGCkSwTdUD+kGHW7x+vke+kNfxVU5fQ5/PzMiJHGRzXHBBk
         NTFJf+DUEd07Bm0PZFBZw5sQb1ijU3EC6qeFtznAEQQ1TnwCVqocQdj0Qsl0elGL+osG
         G1oVO7S8qjF7Jg1uqj44rWL9/pi1XUM+SFghWVpT54RhxfI8aS+Up2iFdCxbqrCLTg2V
         VnP/d06tGQjqN7QuwBHC3F3ckwWft9rf5gU/Yb2V3a/1V2t1Za3HSkoS0d6JwCIO+5oY
         ebFFF8gcvq4Mk40gME18LZN6J/EemHp7/HnAb5257h0esZdZAN+H3qeE1HQgmDus2VXe
         4O4g==
X-Forwarded-Encrypted: i=1; AJvYcCU8V0pyoeHQgTERetXyFHaGa5GtmQAJ7hE+eISjo8uqbVQAnc7l7piQMzA95Yhwj89O80a4xGcX+KN1ig7aTHWQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/VoO7sDr90RsURD5KWVMtktT5ogtYWZhilLJYXsFDQu8ZW2Dv
	77q6D+g6eUCO4J8IcCe0Bg4KF5iXRb9W9s24RnyQ2ptBIhBwx9qwPXoSrURPUjUZbeudG94sDjg
	fZy2Lcrxjq7jq5CxhQAQ7XVUHmaYCZjI=
X-Gm-Gg: AZuq6aIwx8zxmyc6mE6RinELiYmvnjSZ1p/QesoGOJAak8HExggi9fv65rTkzyEWWO2
	HOkqjV1OgP8ZzopZYFTRaM4uzrPGFT37lVK8Vw0nbsjYV3zVguaPikuTZYPku/gZRfNSdPGUEh9
	1thNEPBB4zN+bUcQaTS5RkTMyak5K9wgJ/uVoV9XfZSF6HkgyvnTNFtZAvH7cU7xtFLMY+2N1eu
	M6sE9X6zQ8/EwgiV82r+40w1pcjT0Tv6QHNVg0Mz/ywdIYd5bksqBZaRLc+e+KH8bBAigMs66ar
	AnP3EXAfgf21lNmkfjLvjrzusxbvsElU9UYiNEZqjzds7IUHvrgzr884Zw==
X-Received: by 2002:a05:6000:26c7:b0:435:9691:d525 with SMTP id
 ffacd0b85a97d-435dd02bd66mr2596133f8f.13.1769521195749; Tue, 27 Jan 2026
 05:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <aXeuR_YLoAFYEAVi@shell.armlinux.org.uk>
In-Reply-To: <aXeuR_YLoAFYEAVi@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 Jan 2026 13:39:29 +0000
X-Gm-Features: AZwV_Qi7ONuSH5cnoHQEqydQB-V8V2QfAv3cVDqg-9__qb79RGS2Oo_Iqp8eszA
Message-ID: <CA+V-a8t5RKY9vyFDg0V3AWcBovBdWbcvqdPeiPYmHRA8v2=UGQ@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: stmmac: Preserve bootloader MAC address
 across unconditional reset
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_053958_063282_5464F608 
X-CRM114-Status: GOOD (  39.64  )
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

Hi Russell,

On Mon, Jan 26, 2026 at 6:11=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Jan 26, 2026 at 05:25:03PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Commit 90f522a20e3d1 ("NET: dwmac: Make dwmac reset unconditional")
> > asserts a reset in probe when a reset controller is present. This reset
> > clears the MAC address registers, so a valid address programmed by the
> > bootloader gets lost and the driver falls back to a random address.
> >
> > Read the MAC address from the hardware registers before resetting the
> > hardware. Keep the existing address selection logic when no valid
> > address is found, and program the selected address back into the MAC
> > after probe so it remains consistent in hardware.
> >
> > Export stmmac_bus_clks_config() so the early read path can enable the
> > bus clocks before accessing the MAC registers.
>
> I don't think this is a good idea. stmmac_bus_clks_config() is specific
> to using platform devices, but the core stmmac driver also supports
> PCI that doesn't use stmmac_bus_clks_config().
>
> stmmac_bus_clks_config() handles:
>
>  - plat_dat->stmmac_clk
>  - plat_dat->pclk
>  - any clock handled by the plat_dat->clks_config() method
>
> For platform devices, stmmac_probe_config_dt() gets these two clocks
> from DT, and prepares and enables them both. So, by the time the
> probe function is called, these clocks are already running.
>
> For those handled by the platform glue, the glues that populate
> this function:
>
> eic7700: eic7700_clks_config() - this is called from the init/exit
> handlers. Will be invoked to enable the clocks by stmmac_dvr_probe().
>
> imx: imx_dwmac_clks_config() - called by imx_dwmac_probe() to enable
> clocks prior to stmmac_dvr_probe() being invoked.
>
> mediaktek: mediatek_dwmac_clks_config() - called by
> mediatek_dwmac_probe() to enable clocks prior to stmmac_dvr_probe()
> being invoked.
>
> qcom-ethqos: ethqos_clks_config() - called by qcom_ethqos_probe() to
> enable clocks prior to stmmac_dvr_probe() being invoked.
>
> So, I can confidently say that all clocks should be running by the
> time __stmmac_dvr_probe() is called, and thus there should be no
> requirement to call stmmac_bus_clks_config() in this code.
>
Agreed.

>
> The next problem: you place this code to read registers from stmmac
> before:
>
>         ret =3D reset_control_deassert(priv->plat->stmmac_ahb_rst);
>
> Sadly, the binding documentation is too vague to pin down what this
> is, as dwmac can have AHB master (which generates bus cycles for
> accessing memory) and AHB slave (which would be the target for
> register accesses) interfaces.
>
> The problem here is that if some platform glue has wired this reset
> such that it resets the AHB slave side, that will prevent register
> access, and thus your attempt to read the MAC across all devices
> will fail.
>
Ok, got you.

>
> The next question that comes up is that we have a perfectly good way
> that's been around for years to pass a MAC address from the boot
> loader into the kernel for any network interface. I notice that it
> isn't mentioned in the DT bindings, presumably to prevent people
> from adding it to their in-kernel DT files.
>
>         mac-address =3D
>         local-mac-address =3D
>
> The old documentation in ethernet.txt was:
>
> - mac-address: array of 6 bytes, specifies the MAC address that was last =
used by
>   the boot program; should be used in cases where the MAC address assigne=
d to
>   the device by the boot program is different from the "local-mac-address=
"
>   property;
> - local-mac-address: array of 6 bytes, specifies the MAC address that was
>   assigned to the network device;
>
> Given that these are interfaces between the boot loader and the kernel,
> they can't be deprecated, as platforms will rely upon these properties
> to pass the MAC address from the boot loader to the kernel. For example
> on one of my systems:
>
> $ vdir /sys/class/net/eth0/of_node/
> total 0
> -r--r--r-- 1 root root  4 Jan 26 18:08 gop-port-id
> -r--r--r-- 1 root root 50 Jan 26 18:08 interrupt-names
> -r--r--r-- 1 root root 80 Jan 26 18:08 interrupts
> -r--r--r-- 1 root root  6 Jan 26 18:08 local-mac-address
> -r--r--r-- 1 root root 14 Jan 26 18:08 name
> -r--r--r-- 1 root root  4 Jan 26 18:08 phy
> -r--r--r-- 1 root root 10 Jan 26 18:08 phy-mode
> -r--r--r-- 1 root root  8 Jan 26 18:08 phys
> -r--r--r-- 1 root root  4 Jan 26 18:08 port-id
> -r--r--r-- 1 root root  4 Jan 26 18:08 reg
> -r--r--r-- 1 root root  5 Jan 26 18:08 status
>
> where "local-mac-address" states the MAC address to be used for eth0,
> as specified by the boot loader.
>
Thanks for the pointer, I will use the above-mentioned method with
which we won't be needing this patch on the RZ/T2H platform.

> I don't think stmmac needs this extra complication provided platforms
> make use of mechanisms that already exist... and I feel it's time to
> start saying no to platform specific quirks that can be handled by
> those mechanisms.
>
Ok.

Cheers,
Prabhakar

