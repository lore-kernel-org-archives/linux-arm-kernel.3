Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754D2E67A6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 05:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xg1uZWJossyBD+q6zxGguo3A8O0UO4OS1MVY0/VBkLM=; b=mUsSTx4Em0baZ9Kz9N338ShX7b
	YcG1BDttzUNSN5IOiuCFkWJ6SPeeq+PcrcSEkqsNQDd8qev1f27deuQHagMOnHW7cJs2Hr+pwAjYE
	iNK8PJY20Ko/7Pt241EEdvwi35mMtugyao6zcs35zL+bnN6z++joUTmAgmFK51MkMzAH4gtBWj82O
	BREbD8DAUpVdNhY3ynb4Y/ASGuQ0eCHvLzJ8SirtHncTS/xpw1lGRZiCaYTvlk9TPhp6aTQNQU3o1
	JjNK5No+ASAn+1JOjEKO5w45Fga6OAf5hiGmDD6ivjFMeTlxHGTnnf9jxh3J3BEM+ZqUlp3DphZ9Y
	4fxsMY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIa8-0000000EZ5A-1MVo;
	Tue, 03 Mar 2026 05:46:08 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIa4-0000000EZ4N-3AbH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 05:46:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48371119eacso64879025e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 21:46:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772516762; cv=none;
        d=google.com; s=arc-20240605;
        b=HOKDA1+V0EBNgXH8ra8b6Pt3yAuYWSq7y6xLZCEHzjoBpay+bqk7vlkc5nZCtBHE8T
         77TtyoDgiuOKGvKMETvNh8y2iiINk4iruVR7gzY8g9kvGsMLjaOJoo1tgc7uX8SKGUrD
         vkA1xiOCS0Jdm0XyTDG4PMAVTQQogx6k88aVFOxx4H5dsyxpOI50NWHLzuU2XS4sEyQq
         fdqcMPpDlDB0qIvmtSil7mlcW3V7QPASlRiBY1HW1ZuueG0wsrNOZXBGtdCJnChcISV4
         odpqL6okBHmicSM1q/WBJhF0o1diSsrjVco/IsIOTizmwCNFD2CiO7/TV58O5LL2xgZj
         7Q/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xg1uZWJossyBD+q6zxGguo3A8O0UO4OS1MVY0/VBkLM=;
        fh=iG4lVKXAiBirI1zXwqfLSQlUJXZo0fYtfyUWKKEJFTM=;
        b=TvR0ycMxVzovTMXl9Ov+nhYrodmNEK3ULgO+MoMR737xj9k4lur2m0QF3PrkNsQdC2
         PviTHlqqpp6PCXD46M4gixOwFanSjOw3wcARY8skXbe6f3pW0kv4dxyu20tdnq4Icdsk
         dDfEuaAeibiub/78BLnFlgC8IRgcLdQ3ezS07TLOfP1FdHyHsIJH8CiOZUmcpf8oI0AU
         YgRROILV/mpPitj6CpT0UpEyhL2B3WDsCB/yFA6iu9Wizt/RTpN6EbShmLs/qASsOtOf
         omj/d5/TEK3P5vjUlY5QPbHiid89slYjyepisBG9F4ovT5axu2mBJCvERe6ZIUsPawIM
         c4PA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772516762; x=1773121562; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xg1uZWJossyBD+q6zxGguo3A8O0UO4OS1MVY0/VBkLM=;
        b=TpBnf5L1gbisp3qeYCtcOdRUtiFA7oK92HkvxYg9mVKnFq5Km8FmYGJSGMi73okX2v
         rlDgCcjHPxZfgSeicTqCfRglnkLKmZeMuOucnCunrlOavvSlL0HPvs6nH4n3DT5WlS1q
         5Q1wczcZote1hYIl9r7sHDkVYL+lqNBbYwl3szyIALz5gvN+26LxjAq8QZNIEXzaWTSf
         d0AwZPqfkjwufzq3NhPfc0NtO9ZjCCa94tkdmjSYiExobHb6TB8dSo9KaJmioLxxULAl
         FP5rPpGzmXcpP1erwGzGFsuFPD0BVKbnCxFcVELRuHO3ymX+Rf8+F9l1EATMO3G9kJ41
         UIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772516762; x=1773121562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xg1uZWJossyBD+q6zxGguo3A8O0UO4OS1MVY0/VBkLM=;
        b=XEuGg7xYOesB+DfYc6dD+AC2CBoM4NPl5FUfB/MHrJS9d1ELxSoub6Po3vd9k5nQPA
         7JsE6cQ6HUz7R4BSsH5HWKPtQOmhh/4ucxXSRLxUVU+rtwaWF/FoVFIOwVchzSFxZw7B
         6jeszIRcGqXmOByjO3q14srt6ZhbLW4WlC4vTW2X70J15bLNIPlLG+8RLGh9pXhsWkO1
         JBwoleUPRBIzXVfIMXvkXZ59qZRtO0+XcEukuByTHczFmuLveOTBReVOen/pI0YFcitp
         tyrM8UvrlK6dc0c6uBFqtEd13OOCM5K8I2bIRvZQL0wCUQQDZ4JxgBOuEKOp/nP66LIz
         nBEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUetEUX23FyU1JDy6dqgAKxv/ub9qzRI6UU/KHLZWMPb2x2TOOhl+P2QOuEY5di/X99xgyBa4UUBpYR8Sw+8rYH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8Gnbe9psRLlPeSEfYRmGNS/3DlvoVxgEi0lUGRiq0eJC58T9P
	p+aW2Bw25zH3nVcuZNfrFxejCC2H/edbQ8VQnEJg8QnysiKFYQUeIopIxXBzY450ke/EMHWZrIn
	G6aBJJXoXP1C3xyfrl0B7aMG3TbUqdPo9jwR1
X-Gm-Gg: ATEYQzyCZxnmQmfx/bRoG052hDxCM4WttWE+1EK6UmDZ5nKHwpjOG3Szb2+oECBs+po
	Kun+0Vkv1e5cNYMasqT8NJBuzIKBySzHMn7JvPzlTx3t5eGKnjGFbH7JkRwNn4DrxTC7NmwbDE8
	jm/k9NHu62Xssw4ZDUeCfVCZ8aG3ydmpieBRXDKI1iJVtXrrIpIYEeeDLvNYTK5UDNXWYDSGglz
	1rGd3C20xsIxm33McTgBCOk22bW3NlELP6yW/zbNMOqsq2ztaW0ssPbUi6xxY1hQk+ujwpJWQa/
	9T8fseIRqz01JQNfLcGrB/rMhC4VeW3YNUeOndA=
X-Received: by 2002:a05:600c:444d:b0:480:4a90:1afe with SMTP id
 5b1f17b1804b1-483c9c2be1dmr238500735e9.34.1772516761986; Mon, 02 Mar 2026
 21:46:01 -0800 (PST)
MIME-Version: 1.0
References: <20260228205418.2944620-1-dennis@ausil.us> <20260228205418.2944620-3-dennis@ausil.us>
 <7914983.EvYhyI6sBW@phil>
In-Reply-To: <7914983.EvYhyI6sBW@phil>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Mon, 2 Mar 2026 23:45:51 -0600
X-Gm-Features: AaiRm513DtYPYb0SE8zCJViZ_vWjiX4flM-ALyo4bupgiMyyhndhFJi4olO5cRM
Message-ID: <CALWfF7+fkGRVGBtjupK_1xL9F48JSSHiz2xt2_6_BX_-bt8rDQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Heiko Stuebner <heiko@sntech.de>, dennis@ausil.us
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>, Hsun Lai <i@chainsx.cn>, 
	Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Alexey Charkov <alchark@gmail.com>, Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_214604_869602_E386341C 
X-CRM114-Status: GOOD (  32.02  )
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

On Mon, Mar 2, 2026 at 5:27=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> wro=
te:
>
> Hi Dennis,
>
> Am Samstag, 28. Februar 2026, 21:54:17 Mitteleurop=C3=A4ische Normalzeit =
schrieb dennis@ausil.us:
> > From: Dennis Gilmore <dennis@ausil.us>
> >
> > Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S). The Pro
> > differs from the base Orange Pi 5 in the following ways:
> >
> > - No SPI NOR flash; eMMC module slot instead, you can optionally solder
> >   a SPI NOR fin place and turn off the eMMC
> > - PCIe-attached NIC (pcie2x1l1) replaces the GMAC1 ethernet
> > - PCIe NVMe slot (pcie2x1l2)
> > - AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
> > - BCM4345C5 Bluetooth via uart9 with full RTS/CTS
> > - Two-colour (blue/green) GPIO LED using modern color/function binding
> > - audio is wired up differently
> >
> > Vendors description and links to schematics available:
> > http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/detai=
ls/Orange-Pi-5-Pro.html
> >
> > Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> > ---
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 376 ++++++++++++++++++
> >  2 files changed, 377 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro=
.dts
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dt=
s/rockchip/Makefile
> > index 4d384f153c13..c99dca2ae9e7 100644
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > @@ -214,6 +214,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-nanopi-r6c=
.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-odroid-m2.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5b.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5-pro.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-cm5-base.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-radxa-cm5-io.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-roc-pc.dtb
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/=
arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> > new file mode 100644
> > index 000000000000..d656328c906d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> > @@ -0,0 +1,376 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include "rk3588s-orangepi-5.dtsi"
> > +
> > +/ {
> > +     model =3D "Xunlong Orange Pi 5 Pro";
> > +     compatible =3D "xunlong,orangepi-5-pro", "rockchip,rk3588s";
> > +
> > +     aliases {
> > +             /delete-property/ ethernet0;
> > +             mmc0 =3D &sdhci;
> > +             mmc1 =3D &sdmmc;
> > +             mmc2 =3D &sdio;
> > +     };
> > +
> > +     /* Pro uses gpio-leds instead; pwm0 LED is not wired up */
> > +     /delete-node/ pwm-leds;
> > +
> > +     /*
> > +      * Pro uses i2s2 (i2s2m1 mux) for audio, not i2s1. Recreate the s=
ound
> > +      * card node pointing at i2s2_2ch instead.
> > +      */
> > +     /delete-node/ analog-sound;
>
> I think it would make more sense to move the relevant not-shared part
> out of the dtsi instead. Yes the duplication in orangepi-5 and orangepi-5=
b
> should be fine.
>
> Having a devicetree with so many /delete-node/ and /delete-property/
> elements sprinkled throughout the file, will definitly cause readability
> (and handling issues) in the future.
>
> Additionally this makes all the comments in the file explaining individua=
l
> difference unnecessary.
>
>
> Thanks
> Heiko
>
Hi Dennis,

You could follow the pattern that was used for the full RK3588 Orange
Pi 5 boards.
The Orange Pi 5 Max and Ultra are very similar, so they both share a
DTSI. However, the parts that are also common with the Orange Pi 5
Plus are put into a common DTSI that is used by all 3 boards.

So for these RK3588s Orange Pi 5 boards, you could refactor the
existing DTSI to separate the parts that are only used by the older
DDR4 Orange Pi 5 and 5B, from the parts that are common to all 3
boards.

To verify the existing Orange Pi 5 and 5B boards DTBs are not damaged,
you should be able to convert the DTBs to DTSs before refactoring as a
baseline, and then after the refactoring, convert the DTBs to DTSs and
compare with the baseline.

As an example of the delete-node/delete-property leading to problems
in the future is when DisplayPort AltMode is added to the 5 and 5B.
The new properties will be inherited into the 5 Pro device tree, when
they are not wanted.

Jimmy

