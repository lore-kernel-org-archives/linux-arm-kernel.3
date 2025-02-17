Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F214BC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 20:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXixNoTFb/Zn5YPOBctAEBI6Gl60auOPtW0O825FsR8=; b=EYctMxZAoZl3gezrhumng8QxmX
	8n4mIv+Hxq+b+5V3nWHFeHXyLu3kg+5DjlpwmvvdPbpOAcDmyCfCuqhXR1Nsz8/kektmZrhtW/cDb
	i+5J6TNkrY6JrgjuRlkIlzgEgDwBiFdkJ4ZcsN+phCUUqA8vMM4WXowgbvGP84+L5mGPnGiXHsPg2
	cb6bnUjvNekWyOmwUCAfOrNXGPGIC0d9BqNQ1DhRKQwwIepSQ80z7QeJWriYJZRABS6qYeCHq1adz
	md7kPKvkyG0x5M4SPlJsbugPqamnfLuBSu+dqYvZ29VXHN+rcwlNNu6yiVTztloHQ+PIGC/12RyIK
	fq9SOwFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7qS-00000005ud1-3Onl;
	Mon, 17 Feb 2025 20:36:00 +0000
Received: from mail-ej1-x662.google.com ([2a00:1450:4864:20::662])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7fk-00000005t3w-3AVE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 20:24:58 +0000
Received: by mail-ej1-x662.google.com with SMTP id a640c23a62f3a-ab78e6edb99so719414066b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 12:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=patrick-wildt-de.20230601.gappssmtp.com; s=20230601; t=1739823895; x=1740428695; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eXixNoTFb/Zn5YPOBctAEBI6Gl60auOPtW0O825FsR8=;
        b=Qq2EoTUoLYlCLd9PA5b2fy6EMAeGoLZ/AHhe+n0A6DEsqI8Tk0hplmUhO6uC6th/bW
         jo/bTKiXFg/+soi3WGA8nyghwvVrPy6R0tZUpq7QMZf5/6lSgqORelu02SgS2y9B76ry
         Hg5pUTk8jPKRLPaTui6uw/xjurldQ/ZVw8EpN/2s5g4vyn02rWLSYzBktqbdH0fTUuCs
         xT56nSHA7Cs06HaaoBQzlUw/9SsA2EutxXEsRUoWGuQ+0c7wT+WF+v8YVJA+4sv7QRWR
         nFdKHeC6m7GVoyHJ5MUqnyKoGXnExHChETrZFvzxM2J16uAwk2jI5suiZQ6vKP79WzAS
         uGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739823895; x=1740428695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXixNoTFb/Zn5YPOBctAEBI6Gl60auOPtW0O825FsR8=;
        b=aRvYh8WKKMZhw2vjOG5ub8Amfn+aWRQOwwAJtdFZ2I2Xa5UVikiQ1mUlhl3waLk19u
         BM65B2dMISn1CNvXhD8VWQN7dunr+TjBATyeaZM22Dw2fYd/8kF5lq5Dik6DEmVsiqpu
         +Mao3NBA4KOT96B9ZL3qhmAelTg0m3EXf+M+QONDjjR3He0EHxyK30naYvwnN/2Vs46w
         OzPcIGINhwso4gn1nl/SyP5CGe1utoacNORM29Z3MzLDnezhE9IexMsMARp4r5GLe27o
         BJFFsHYnhIBoKgKjdLnKzz6GRORgCtJVjxGxV2zFEjckymt819DOOR+7Ni5wRIQr3dkA
         WNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnt3Saih/41iJ0cR8VkpxlqgIesN5oh600abT4azwbTRCxoe4l0dem9PUWruNDxI0jj6IyJsvWR3CxxFrDoWWU@lists.infradead.org
X-Gm-Message-State: AOJu0YwvamAjlQcs7gO2CO86NiWJx66pLVi+QHQKK9SZIb7uLrtvZTgE
	Cdf5fAbC9DOcktr6xTFcHN1hEvgSxDDRp8P5tffFYB91ze1vZI+GhWjKjnp01nyrkyDoXTO5ZUE
	/6vEVkSMMVSsV5ty5FIT8UPu4cBhh/rE/
X-Gm-Gg: ASbGncugkV/Vmy0plQgww08zA2rEb/dCMH0/eCNUOytsqWpPfr4/27G9rVr6BiK+Jnl
	QxdMdM0FqKj3uH0bnVY8tNL1SXMkRAtuVzuGYhscueuvsho4Mc2/eL3RR80Tn7uUfFterwG1Z96
	1+HSL096YqjeGs67NK5k3lzaPm+VNlYxJ/seOSF7Mq5hbVvwYg4mdROmTocSJ70WWfafWwUI7AF
	wcxwrWbqpiKI2mh7pFuIlc1SXhOXE/t/FlV5Z2KsWXS3RpMCAZqZOrv2+W68OrKqw09t91gi1rp
	ZVdbBU7Ad9KtYU5oL77iPYXEtkFqTZ3J
X-Google-Smtp-Source: AGHT+IEtiv6f5A4U2toq6DqqVmoKr8/hELUWnQCbOTnz3yC6cI3s9TkqLpZPfdtjRicNlJeQoPDX4dVqC2mb
X-Received: by 2002:a17:907:6d08:b0:ab7:d87f:665a with SMTP id a640c23a62f3a-abb70dc5897mr1364395666b.46.1739823894356;
        Mon, 17 Feb 2025 12:24:54 -0800 (PST)
Received: from windev.fritz.box (pc19f8e2d.dip0.t-ipconnect.de. [193.159.142.45])
        by smtp-relay.gmail.com with ESMTPS id a640c23a62f3a-abb6c102affsm52334966b.42.2025.02.17.12.24.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Feb 2025 12:24:54 -0800 (PST)
X-Relaying-Domain: blueri.se
Date: Mon, 17 Feb 2025 21:24:51 +0100
From: Patrick Wildt <patrick@blueri.se>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: add MNT Reform 2
Message-ID: <Z7ObE57pKxcu_au5@windev.fritz.box>
References: <Z60MU05JLtI9VzuU@windev.fritz.box>
 <Z60MiujaPpWNYmBE@windev.fritz.box>
 <CALWfF7KHagN=ef1C01PmmpfumdthBy6PKPi3U+9K+rgP8sNrOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALWfF7KHagN=ef1C01PmmpfumdthBy6PKPi3U+9K+rgP8sNrOQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_122456_799168_14DA002A 
X-CRM114-Status: GOOD (  21.16  )
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

Hi,

thanks for the input!  I've addressed these things in a v4 that I just
sent out:

* Added chassis-type
* Removed unused nodes
* Sorted alphabetically

The brightness setting is in-line with what MNT are shipping currently
for their other modules.  I can send a follow-up patch to update the
settings for both i.MX8MQ and A311D.

Cheers,
Patrick

On Wed, Feb 12, 2025 at 10:28:59PM -0600, Jimmy Hon wrote:
> Hi,
> 
> A few questions below.
> 
> [ snip ]
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi
> > new file mode 100644
> > index 000000000000..898a7b29692f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi
> 
> That's interesting, the Firefly Core 3588Q SoM's dtsi is more than 95%
> the same as the Core 3588J SoM's dtsi.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi?h=v6.14-rc1
> 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts b/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts
> > new file mode 100644
> > index 000000000000..cd7a82a3b0de
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts
> > @@ -0,0 +1,348 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
> > + * Copyright (c) 2024 MNT Research GmbH
> > + *
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/pinctrl/rockchip.h>
> > +#include <dt-bindings/soc/rockchip,vop2.h>
> > +#include <dt-bindings/usb/pd.h>
> > +
> > +#include "rk3588-firefly-icore-3588q.dtsi"
> > +
> > +/ {
> > +       model = "MNT Reform 2 with RCORE RK3588 Module";
> > +       compatible = "mntre,reform2-rcore", "firefly,icore-3588q", "rockchip,rk3588";
> Will you be adding "chassis-type"?
> 
> > +
> > +       aliases {
> > +               ethernet0 = &gmac0;
> > +               mmc1 = &sdmmc;
> > +       };
> > +
> > +       chosen {
> > +               stdout-path = "serial2:1500000n8";
> > +       };
> > +
> > +       backlight: backlight {
> > +               compatible = "pwm-backlight";
> > +               pwms = <&pwm8 0 10000 0>;
> > +               enable-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
> > +               brightness-levels = <0 8 16 32 64 128 160 200 255>;
> > +               default-brightness-level = <128>;
> Interestingly, the brightness curve is more fine-grained than one used
> for the IMX8MQ SoM and the A311D SoM. Should those be updated
> eventually?
> 
> brightness-levels = <0 32 64 128 160 200 255>;
> default-brightness-level = <6>;
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts?h=v6.14-rc1#n24
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts?h=v6.14-rc1#n198
> 
> [ snip ]
> > +
> > +&combphy1_ps {
> > +       status = "okay";
> > +};
> Should this be left out? It doesn't look like pcie2x1l0 or sata1 is being used.
> 
> > +
> > +&combphy2_psu {
> > +       status = "okay";
> > +};
> Should this be left out? It doesn't look like pcie2x1l1, sata2, or
> usb_host2_xhci is being used.
> 
> > +
> > +&saradc {
> > +       vref-supply = <&avcc_1v8_s0>;
> > +       status = "okay";
> > +};
> > +
> > +&tsadc {
> > +       status = "okay";
> > +};
> These nodes should be sorted alphabetically
> 
> > +
> > +&sdmmc {
> > +       bus-width = <4>;
> > +       max-frequency = <40000000>;
> > +       no-sdio;
> > +       no-mmc;
> > +       no-1-8-v;
> > +       cap-sd-highspeed;
> > +       vqmmc-supply = <&vcc3v3_pcie30>;
> > +       vmmc-supply = <&vcc3v3_pcie30>;
> > +       cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
> > +       disable-wp;
> > +       status = "okay";
> > +};
> > +
> > +&mdio0 {
> > +       rgmii_phy: ethernet-phy@0 {
> > +               compatible = "ethernet-phy-ieee802.3-c22";
> > +               reg = <0x0>;
> > +       };
> > +};
> 
> Jimmy

