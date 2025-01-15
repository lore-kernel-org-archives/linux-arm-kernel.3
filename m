Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F8DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Upt/HfMdWGKSnxZ90iRw8HV4YDvibzUnc+Z+31Ue4g=; b=xNL8TuKcqxJgANAD91PMnD/Vie
	6Z1iPR006RKJsntBMIitRb+qtBHQQTUugRlp/HvgXc0j5M0NrZE1NksGXJEEN3kiSDLdjvKxJXmji
	HWtI96fdYmVbBXgcHTHG0x1QMXYD6eaau9r87hl3A3uPUlGUD8+R/JNGN91fLtd5X+tqinF9Lq5XZ
	NbFqOZYGGfOySdhWxfRktDwEVxrTk57wyxrhER+PMuZC9avCFJua2SeukZjZN7dRDyXmzPephiBGv
	T+Sf0XUCN6U0oUDsJYvm7OQ1aMOssi2JWnkhChcAHUvwLiqzCxWsBer+xwMTNECXcgLNTYXzy54Km
	eLQblHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1WI-0000000BfUn-3NUr;
	Wed, 15 Jan 2025 11:25:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Tg-0000000BezW-08XI;
	Wed, 15 Jan 2025 11:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description;
	bh=0Upt/HfMdWGKSnxZ90iRw8HV4YDvibzUnc+Z+31Ue4g=; b=OtKUVPcauy/mpGTIcT93S7AyMD
	q6JjBicgMqlETca4myab8LkFnt+9/zzeJf4gQ2w7LvCLogcDzb2T94FT8pFuGnXU0NfoaprTlUPRJ
	SVYWdAc1ASkBWojmaCH67+GSFy3DaoL/HL8JYiCuCrjtvZ9AhbwgDoopmL+2JkrAbvCM0rTPJR6KV
	56UymwJZVOaf0VEa7ITAXsAfr6f1AIKRd6sLP8+tzTqCvdH5yJK1T0QvC2O04S4N1RfF888xeC5TK
	uk4AeLP54wgRIainAjAfRFrx9o+ie+5FN5yDFxIAGN3FDCGfcHY1nu502FFpLvwrpnWLhWGTrmSjH
	vm5wfq9A==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Td-0000000Ar9A-0Uog;
	Wed, 15 Jan 2025 11:22:26 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d3e8f64d5dso12709139a12.3;
        Wed, 15 Jan 2025 03:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736940142; x=1737544942; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Upt/HfMdWGKSnxZ90iRw8HV4YDvibzUnc+Z+31Ue4g=;
        b=htme1WZiUNks1Nb4AgEyQae2fpjLcNbLl0338sfbzzSoBP0Rki+x62zZ5ljo12VEDr
         Ny6dkM4yULJ+iwAyM2HDI4g3LxQ+/cx1BHdfFHS5bTnjYO3ZXoLs01gOXRGr9Q6WSq8y
         w4qACIw6jOg+DaXp7W+E2iRtgbE1dk8YdaZwDtWwKdLdomZBTkacQI2YUC34x53dz+Uh
         t6gBwRsh43Lwji475EHsFdHc3V9lwHwiSbH5k0a+SmTlVsmuhebzJ4Xn6sif6sBlt+gQ
         3WBFuAD4EtusPf1aQcjxgnypOuL7u4DB8MfHyo7WkQNgrVy1yQjSbJ2RNfS4fP87LILE
         kxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940142; x=1737544942;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Upt/HfMdWGKSnxZ90iRw8HV4YDvibzUnc+Z+31Ue4g=;
        b=LYxY/FlLq32iTClrqhEWiXPZf6fxyLvuY0AOAo1j5rbLPdWzkv2Gh60YzdXZcZA4Ia
         hvkDdAVhzS1LFOWnn5QIOBIX5Fzqzae/NXb6smSCePqqrRywqZBsu+puO6jT3B7ZSWCD
         DKShooTlqNGhaLov4YjuNFfYvhHg5FtfEolqho6uHtrRTsKjJ6bk7U6n3M8BJ1mhIQg4
         eBw9zBMhA8bZ50SHAhNynqiMh9FpvDjPjpubKPJluNN2dVETrq1zOpeQe7afF3MCkDfY
         Dtvf2tNVQm8nZJmE/FUXumGkaiNM4eile4SoymNQ3UwRRwCzCZIA3RxAKXuU4WA09xBt
         AmIA==
X-Forwarded-Encrypted: i=1; AJvYcCUU/yyDUP7PlHwo/pAcqFpT0S697iUr5i8w1dbUdhq4rIU4SXyA/dpk8SnPxjpBVRgac+I/4VqXy4yD@lists.infradead.org, AJvYcCVXQ3/HIbWSfzQaKL7bnu8+YsPwwAqO2VCs/Hl7XA3zpY2/BwHQWsHy33WZ5I+TSEMoLBGFGCS0wFMKfbqyYLsB@lists.infradead.org, AJvYcCVgaSBfb+mzhubz6B4z4GDtj/8SDngoxMXYol4QflL5cCsWvs1igArSPf4sQ2deFJflSWaIuxovMp9r5iLYBgI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yze1HcXeTULC/BkwyQqE8rvfy/aSE8QPVYB8sNCxzZUAFrbbbIA
	f4gPbBcLm4CPUkri2wRWI9hauX7QRBjJd+7FL6URwmuBXlbqe6lU
X-Gm-Gg: ASbGnctTNGT1769ZDo771xTTwJ5ATWMlfnEZeCNNLSLSFHeLNUbVyfXCeY6bEDd1Fzh
	R18fDTP7mOlGn1+J4IkJt9CPCj5bpmPjx6HaQCHqmwx8kffLJzCQgnC3g05PpSb62oQJXI1bbJ7
	sPRwWG6ip/mD2qhzMy8H6Df6MGQwkhYyH2bRZSWFDh6cnQfY8QEVQV4B7SoFmnpqxpNAc52V9og
	FOnA6mC6vi8vmVFVLvRqrM0nOAnZi4G3z+5ZV7GwG/to9kdREhfXfOA2XYHLcb9OPw4I2IeDFDK
	MOsbuMKpFg024IzBiKbSCOHCZrh30bQNiFzsPQ==
X-Google-Smtp-Source: AGHT+IGWl/B1zVg3sTaIZCIqSaOylWRNJO6IX9a5vKaFN9b3NZrlex+SipGGEVJonU8ibV27hGe6lg==
X-Received: by 2002:a17:907:781:b0:aa6:995d:9ef1 with SMTP id a640c23a62f3a-ab2ab6a84d3mr2804550766b.12.1736940142135;
        Wed, 15 Jan 2025 03:22:22 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90dc6a8sm737651666b.72.2025.01.15.03.22.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2025 03:22:21 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for
 rk3328
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250115012628.1035928-1-pgwipeout@gmail.com>
Date: Wed, 15 Jan 2025 12:22:07 +0100
Cc: Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>,
 Michael Turquette <mturquette@baylibre.com>,
 kever.yang@rock-chips.com,
 linux-phy@lists.infradead.org,
 wulf@rock-chips.com,
 zyw@rock-chips.com,
 Dragan Simic <dsimic@manjaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 frank.wang@rock-chips.com,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Alex Bee <knaerzche@gmail.com>,
 william.wu@rock-chips.com,
 Zhang Yubing <yubing.zhang@rock-chips.com>,
 Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Trevor Woerner <twoerner@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 FUKAUMI Naoki <naoki@radxa.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
To: Peter Geis <pgwipeout@gmail.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_112225_267309_BB403447 
X-CRM114-Status: GOOD (  23.40  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 15 sty 2025, o godz. 02:26:
>=20
>=20
> This is my newly reworked phy driver for the rk3328 usb3 phy. It is
> based loosely on my original version, but as of now almost nothing of
> the original driver remains. The main fix here is the discovery of
> BIT(6) in the interrupt enable grf register fixes the usb3 =
disconnection
> detection (mostly). On occasion an unpopulated usb3 hub will take
> several seconds to disconnect. However this means all of the hack =
around
> work to reset the usb core manually is no longer required.
>=20
> I did my best to document all registers I could find. A lot was taken
> from emails between myself and Rockchip's engineers, much thanks to
> William Wu <wulf@rock-chips.com> for their assistance here. The rest =
of
> the config bits were taken from the rk3328 and rk3228h TRMs and the
> downstream driver. Everything that I couldn't find a definition for is
> prefixed UNK_ or UNKNOWN_. There's a lot of obviously used =
configuration
> registers with the pipe interface that are also undocumented.
>=20
> The only major bug I have so far is my AX88179 usb3 gigabit ethernet
> adapter (Pluggable brand) crashes out when large amounts of data are
> transmitted. I suspect this is related to the RX and TX tuning, as
> leaving it at defaults makes things worse. As I am not a USB3 engineer
> and I do not have the specialized knowledge and hardware to determine
> what is going wrong, I am hoping the mailing list will have an answer
> here.
>=20
> Please test and review.
>=20
> Very Respectfully,
> Peter Geis
>=20
>=20
>=20
> Peter Geis (6):
>  clk: rockchip: fix wrong clk_ref_usb3otg parent for rk3328
>  dt-bindings: phy: rockchip: add rk3328 usb3 phy
>  phy: rockchip: add driver for rk3328 usb3 phy
>  arm64: dts: rockchip: add rk3328 usb3 phy node
>  arm64: dts: rockchip: enable the usb3 phy on rk3328-roc boards
>  arm64: dts: rockchip: enable the usb3 phy on remaining rk3328 boards
>=20
> .../bindings/phy/rockchip,inno-usb3phy.yaml   | 166 ++++
> .../boot/dts/rockchip/rk3328-nanopi-r2.dtsi   |  12 +
> .../dts/rockchip/rk3328-orangepi-r1-plus.dtsi |  12 +
> arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi  |  12 +
> .../boot/dts/rockchip/rk3328-rock-pi-e.dts    |  12 +
> .../arm64/boot/dts/rockchip/rk3328-rock64.dts |  12 +
> arch/arm64/boot/dts/rockchip/rk3328.dtsi      |  39 +
> drivers/clk/rockchip/clk-rk3328.c             |   2 +-
> drivers/phy/rockchip/Kconfig                  |  10 +
> drivers/phy/rockchip/Makefile                 |   1 +
> drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 869 ++++++++++++++++++
> 11 files changed, 1146 insertions(+), 1 deletion(-)
> create mode 100644 =
Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yaml
> create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c
>=20
> --=20
> 2.39.5
>=20
>=20

Peter,
I applied this as test run on 6.12.9 and dmesg says:

[   16.368514] rockchip-usb3-phy ff460000.usb3-phy: could not get =
usb3phy ref clock
[   16.368534] rockchip-usb3-phy ff460000.usb3-phy: parse dt failed -2
[   16.368543] rockchip-usb3-phy ff460000.usb3-phy: probe with driver =
rockchip-usb3-phy failed with error -2

This is on beelink a1 tvbox.

Do I miss something?



