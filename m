Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE5FC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 07:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/mmi/yKE1XX17GxFkgO2afry/vumxMd+JoqMLh+sdI=; b=H8ABnwjigluChYQfJYnWv/hBD2
	+jB42BaQyDnqHQo7pvBNDR24e1ED0t6q9JaQ9QKXQjqit5dDnUD+DtFIvi5/TByyxrQj66FQQPSZ2
	/P0ofiF9EHQSsRugme1V6YKCRiaMDp/3kZjVzNO7De02dyJMLSkY5+RmRHtajW4Gf3MP2UBmMHXgd
	cFT6RVIrNb0vdjspD+sKG+hwH28tW4qlvcTtmQpm/6+xDVpYO/xlsAO44B5msQ2unm/ACpToZ+ujH
	aHKm9W5RZSJaAtKCyZCulTuLuV4+5cb92N2O+tn94FeIEoCrMbTyAAiA5trnUdIYf2it5h/daAIU1
	cysMgs4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFXo-00000002669-0C0o;
	Mon, 27 Jul 2026 07:14:36 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFXk-00000002659-3RtS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 07:14:34 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-9305a2121a1so205205385a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 00:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785136471; cv=none;
        d=google.com; s=arc-20260327;
        b=hBY7YK6AlyNiwfCeLvsQXtzU7lpmRvdBmdIVQztlt48BsaNMpo8XhcDblArpTKXY8C
         HjkjmVaaD4CrTiesDA1ChVkrKBJipbI9e3jVvpEDWEcqL6PX7VrQ0yeo5BGSQ6Jj6kg+
         AF+4+o+rCyocOI9yzG2P5zyt6ROMfNsRRZeoHFex4ZuZqkI82vYFrMu7EDacqV4zn2JG
         2By1uOt17ofLgzQSt7uycNmOX3e5jT4sC2LTXinA3fAcyeUDQ1g6CPJ819jC1Zn/jH9s
         /X4gfeKl/qL1LgCafHp1ngodkVkfr9O4axhCGDRgunA5ClqdJj1+xPpaBfz4aOEY83iJ
         cmVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+/mmi/yKE1XX17GxFkgO2afry/vumxMd+JoqMLh+sdI=;
        fh=+oabfv8O5rZgwm6Y6ygBXCMOSEBX60Yi9GuzA8gsKKo=;
        b=Jj+EO+Mm4N8huEREIAzt6xVOJsEWwCEfZ50Rphs9COtMJNPJVZsXJKcSLrr+rjRog8
         yfbZDGq2SKrPr3XYpIZDpXe7lcEECO9h8qJ4XCSTZ8qXvICfYMVe/U6KNrYy3qxdkGSV
         xGW/stUTGdQpEKlysTWjAnzVHHqhBYPfgPXbLb41SyOpXRp3w6E1veo02Jt3lh04iLaw
         YTyz+vQ5GPraRCOMkCthTTOEmT9eyZXdvh+DDkoYA9raH2ZGHBdf7G6FxJDVgckF2O1d
         xYgua1vQLRvIZkNoZEOua5QSFqx1H7YxRk4X4t2/yp4/2HpDZYdt8ImME3yx/wh4jvy/
         DDbg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785136471; x=1785741271; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+/mmi/yKE1XX17GxFkgO2afry/vumxMd+JoqMLh+sdI=;
        b=B5Qy8sRba4VnhZ6ZRv38vPqJvqTaoxWO19LwWiB2BuAq16XH93Rpd3/DqmziEj6mDh
         AvC0uK75jG/fM0sJzIqu0hEoRl62fWXc6h0686vZbrmyJ6sjTf2dqng8HPmCQu/bxbGM
         /lp3vMGDI3lCzbTO7kXNStfPtTpGetb41m7hVNuhVAkn2Xe1tsCaL/PvL5SBs+gHsLtr
         a2i810A3FJj+N2ID/Kyi/l88G2JqalVBUIDNf2uQ2Gx6BnJM3h5OcqN5gdmxHb6z7qd6
         S6DuoOANy4uktx/2VIlMYgVyDE7P3JBvXEVhS1yfeiKzkTeAIcdHFw9sfGwPoLNhtN71
         A2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785136471; x=1785741271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/mmi/yKE1XX17GxFkgO2afry/vumxMd+JoqMLh+sdI=;
        b=S0RtX+BKLRx0AuuAlQicIRNFPkdf0OEQ4wrin+QK01twSo235KrRu9iQWmotyj6JxC
         YG+S5gIQ/aUWoJD3vHPszRNAQh9u7KUIHnjZt0+wwqAH+QhiTYW6an88m1noyZ+dtVCY
         BosYW3MTIORSqGkV1u323KxNpBvg6LFBL0VpN5bL2TrR5vtOBZuD/O21vJPshufROt4A
         z1LpjPrgvJvG5dxMqGW4PGcl6TZ1ydqWG95cwfkDPf8KdMmDsZz4QSaE7vtguWu2DKOk
         Lr9Dg4rsjubW2vkqI1iWx7S0AeBwfJRwNCYZT9yquSu1YiAPcTdFPbH5YaeRkDJUUMjz
         Uxuw==
X-Forwarded-Encrypted: i=1; AHgh+Rqhjn2QBQA+ItMdCjrVWLIsHF8nl+YucW3VnYGopIigQPnOisDi6ImxPC7baeEYmB8R/2q2en/EaZinhTWsGM62@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw46YfKNcLihdvY0HWk2+a7q4wyDPSxG1GvmbRI9+PrPuWBE4B
	FGHoC9/hIk5PiNJJKzGVEzK6BMjAX/Q0N+NAodnZeAAwz8XyabzDEgHeS/h3kUOxv63FsAguDau
	GPFrC9KO7Cs2sAhPKDs8aluYFR68iDXk=
X-Gm-Gg: AR+sD11Mc8YfX/1iQ7Gau2CUy9C9g0/HoSwfMOMZEgE7T7BbEBTwXvNfixPHTN4Ia/d
	6KWrBVgaOVYaEbY3YDddUhGuhN/9OlnDSNAqCEGd7s0OqkX18cHRBUUdl+VGoC8/zIetv54wNMY
	aaKNVhA6WRrcb3/MqDWpEgBM+Bin0rRQh9XlkClbfN5w3eZVAAILTBuLK+U8CvuKSCf4u/tSmdh
	ANzzoEaNt9eIXRkvzQ+trPMdPFFPxRH0votD0X/V7U9LknUcFnrHyUJzGXiZixx1UfDvlSYkwi8
	Th14/Cfh0+skORi11w==
X-Received: by 2002:a05:620a:271c:b0:92e:c118:18b0 with SMTP id
 af79cd13be357-932df725cdfmr696946585a.79.1785136470873; Mon, 27 Jul 2026
 00:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260727021048.3375444-1-attinagaoxu@gmail.com>
In-Reply-To: <20260727021048.3375444-1-attinagaoxu@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 27 Jul 2026 11:14:18 +0400
X-Gm-Features: AUfX_mx7QqYbJPKColdFHefAnfy7L2wNcFUU2ZgtkbVju2YipXpKoC8heF-3qZs
Message-ID: <CABjd4YyohxfbVufd1pwJGsm8a8f3Cm6rJiz=WLz=jBjAQRLj4A@mail.gmail.com>
Subject: Re: [PATCH net-next 0/3] net: stmmac: dwmac-rk: add RK3576 GMAC 25M
 refout support
To: Gavin Gao <attinagaoxu@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, richardcochran@gmail.com, 
	nicolas.frattaroli@collabora.com, sebastian.reichel@collabora.com, 
	sashal@kernel.org, chaoyi.chen@rock-chips.com, amadeus@jmu.edu.cn, 
	rmk+kernel@armlinux.org.uk, horms@kernel.org, alok.a.tiwari@oracle.com, 
	david.wu@rock-chips.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_001432_863802_F51DF369 
X-CRM114-Status: GOOD (  20.13  )
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

Hi Gavin,

On Mon, Jul 27, 2026 at 6:10=E2=80=AFAM Gavin Gao <attinagaoxu@gmail.com> w=
rote:
>
> Hi,
>
> Some Rockchip GMAC instances can provide a 25 MHz reference clock output
> for an external RGMII PHY. Boards already describe the MAC clock directio=
n
> with clock_in_out =3D "output", but the dwmac-rk driver does not currentl=
y
> request or enable the corresponding 25 MHz reference output clock.
>
> On RK3576, this means the REFCLKO25M_GMACx_OUT clock may be disabled by
> the common clock framework as unused, even though the board expects the
> GMAC block to provide the PHY reference clock.
>
> This series adds an optional "clk_mac_25m_refout" clock name to the
> Rockchip DWMAC binding, wires it up for RK3576 GMAC0/GMAC1, and enables
> it from the dwmac-rk driver when the MAC is configured for RGMII output
> clock mode.
>
> The clock remains optional, so existing device trees and SoCs are not
> affected.
>
> Tested on a PicoCOM RK3576 ACP board with a Motorcomm YT8521 PHY.
> The GMAC 25 MHz reference clock output remains active and Ethernet works.
>
> Gavin Gao (3):
>   dt-bindings: net: rockchip-dwmac: Add 25M refout clock
>   arm64: dts: rockchip: Add RK3576 GMAC 25M refout clocks
>   net: stmmac: dwmac-rk: Enable RGMII 25M refout clock
>
>  .../bindings/net/rockchip-dwmac.yaml          |  1 +
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  8 ++---
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 33 ++++++++++++++++++-
>  3 files changed, 37 insertions(+), 5 deletions(-)

Can you please try something like this [1] instead?

[1] https://lore.kernel.org/linux-rockchip/20260719034555.3623003-1-gahing@=
gahingwoo.com/

The GMAC on RK3576 neither produces nor consumes the clock. CRU is the
producer, and PHY is the consumer. So the GMAC driver shouldn't be the
one to enable it, nor should the dwmac binding have anything to do
with it.

Have a look at how other boards already upstream handle this. For
example, the RK3576 EVB1 uses a similar arrangement but with a
different PHY.

Best regards,
Alexey

