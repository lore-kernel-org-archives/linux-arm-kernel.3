Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2911CCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 02:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9T8mhgY9nX4b1GTDoanzs4NGx5M5/HhR9wB18Kbszzk=; b=UAQCwmMb1fU1zwzYPH/ovPyQRn
	ZJQHwe9r8NJ/8j6VPDe5ShYrMSzmK2Rmuq/ANuYdUp3C7d0y4LaaPG0Xgj8RWayyuaS6RBRJbCtgx
	NfAESGMFxmQhGNo5WMhHw1N0pVfEF32i2ZsMDOkF7/LAk432ljLF7m+S04sWs2TwQliP+HCFL1Knv
	IfFwrynYSlbK4+Aij+m4Tpa1tNZiZpwbyjHH3SHspMxwf3Wk6uiMZMIN4T15a1jpKFlSUx2Qqu8Eo
	/5cnofKr4jem6tnCkgdrhgBbS4UGNZupPUxG/xTILpC19EnUHKU4a89B1xmj1FHnJkjms2fgdqPl4
	6iOzzoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuiLe-000000062w0-2Qtu;
	Sat, 06 Sep 2025 02:08:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uui4I-00000005yQs-0kEJ;
	Sat, 06 Sep 2025 01:50:19 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3e249a4d605so1954528f8f.3;
        Fri, 05 Sep 2025 18:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757123416; x=1757728216; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9T8mhgY9nX4b1GTDoanzs4NGx5M5/HhR9wB18Kbszzk=;
        b=jPndKpKciuG48QxOk5fC4oXsbFg3c0z2GEdJ2brUSuCT1V9AZLY4sxv3r8b13N0dX1
         3Ve7FGaj+p4bUdpHz/5oi/jRhV/WCI4kPbGI6ViiM5bMPFXRd9EkSOvfD9mT2pd1J3Dz
         GL14jwet+4tsk5S1vqT0PhqkjgPFrPjzh/ybsxdH3BWfJJ6m9Txz3QZ/pPsjh22synf3
         UFcEtaIZdobRiLixcUmLmvkdFJLwMUjOwxuujEgAY8ghSnP98qfm0CVl8zKiKiQhx2mA
         SYhJsP093wXU66TQ1Jo8wkBXM9iSdkybeqbEzpaR4M58QpAT3TfQMeuxOLhOO/8GJO6A
         3BUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757123416; x=1757728216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9T8mhgY9nX4b1GTDoanzs4NGx5M5/HhR9wB18Kbszzk=;
        b=RvTgIabfIuivc5mHLpWX6sErpEPs8l9OcLpHlCb/Ce39XBTU9rXFGHcrgJmvmklxgE
         XtNPXVQrmtyl5qImukOIY4Ygk/4wIDBchWHesXhH9KFvyNFGZ48EdoIRvOxs0I/vEVcx
         C7OPC6Y4M3lmK++32au2Fe2odPZ5V1DgTy7PD4KlA2FEUQDcdUaPxYQyzUzP1G7QlPuM
         HwnLo7FJWzVxot0DGK/biYjcgXo33J2HYozRssBli8eMBmvv5SSlBy2+cQzeCvRIIjQ+
         13whlqexBtoqJ+UAObvzNz/g+SE6xwc8KUDSO0Pu/6t7EGf0cIoYvUBgblxhpBa+zOIr
         hVSw==
X-Forwarded-Encrypted: i=1; AJvYcCUXb2Jay6iAhs/mmQucntGqUzCeQ9frvJzuRlOkiSUCE9q8/5ORHclMpgmH8b95V8bNeV9f7bk60BK4NoGMc+t6@lists.infradead.org, AJvYcCUY14qgRIFL39jvJDUsCBNFhAcP/W9LULLuE8VIqKCKwgYXt13q3Gg4hay0lnlGubriupVBWX49Lf4V8dYhmig=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCagBFIZdStFAx7ibTwBJco8DrOTgqCPsGeGxNAXSOxLglUujx
	sITjHbsLDg6VISFLIEhy+2vzmrvgAhwZAanlyRJFeiNJHwv7wsEwXtsT+GnkKI5hVhiOeVfdr6I
	k/nibMUaBRu8nMMB92Y1B83hTAJXdoSo=
X-Gm-Gg: ASbGncsryNFDxYIRdr2OTrDgSNN+r2GXwNHtLYHN7cc80+PgbVLofYLS/9nOkZxZM+p
	PT4Gge5pX9uYmUP2Dyi6Pb4iWimlwY+1sFeoZrw2vzBlTn6fGBrhjoRfcb3+LotzmHAplwHyJdw
	GsWGT2ynD2PrAFxRwL0+4S8L7FDnRGl+bUtyKLfDp114hJjGe82+sMtYBbUPHQ9H1IJurkzOwrW
	ri+Yba5jxqkf3yQDgEbNS6rWn2jK5LJzIjYmRzCdsyPHFM=
X-Google-Smtp-Source: AGHT+IG6oix8mLMZHDuSE3WNnpjGJG/3AhhOv3u2JxvodBrLWsljciM9kQJmzeRwfNEpuDP8Q7Dg/c797dvznUQWxEc=
X-Received: by 2002:a05:6000:2883:b0:3e3:f332:73f0 with SMTP id
 ffacd0b85a97d-3e64c693923mr284627f8f.49.1757123415784; Fri, 05 Sep 2025
 18:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250905090115.718622-1-dkx@t-chip.com.cn>
In-Reply-To: <20250905090115.718622-1-dkx@t-chip.com.cn>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Fri, 5 Sep 2025 20:50:04 -0500
X-Gm-Features: Ac12FXwbiLHfVMuDhY7SOkXke4RxqgSQCIhrk8FrjSiEnCfjNXAuJcrVNoPzTFc
Message-ID: <CALWfF7+6dTqLRHYKHL1iBf9YknLQ5yTrwPur8VySmjiy3mzh0Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add devicetree for the ROC-RK3588-RT
To: Kaison Deng <dkx@t-chip.com.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Wayne Chou <zxf@t-chip.com.cn>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, FUKAUMI Naoki <naoki@radxa.com>, Peter Robinson <pbrobinson@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_185018_218323_4D366F8C 
X-CRM114-Status: GOOD (  19.01  )
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

On Fri, Sep 5, 2025 at 9:32=E2=80=AFAM Kaison Deng <dkx@t-chip.com.cn> wrot=
e:
>
> The Firefly ROC-RK3588-RT is RK3588 based SBC featuring:
>
> - TF card slot
> - NVME 2242 socket
Could you update the commit description to match device tree. It looks
like the M.2 2242 socket is configured as a SATA (i.e. "sata2")
instead of NVME.

Is the M.2 slot also wired for NVME operation? If so, will you be
providing a DT overlay to use it in that mode?

https://wiki.t-firefly.com/en/ROC-RK3588-RT/usage_sata.html#software-config=
uration

> - 1x USB 3.0 Port, 1x USB 2.0 Port, 1x Typec Port
> - 1x HDMI 2.1 out, 1x HDMI 2.0 out
> - 2x Gigabit Ethernet, 1x 2.5G Ethernet
> - M.2 E-KEY for Extended WiFI and Bluetoolh
> - ES8388 on-board sound codec - jack in/out
> - RTC
> - LED: WORK, DIY
> - BTB connector for PCie, UART, USB, CAN, SARADC, GPIO
>
> Signed-off-by: Kaison Deng <dkx@t-chip.com.cn>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |    1 +
>  .../arm64/boot/dts/rockchip/rk3588-roc-rt.dts | 1120 +++++++++++++++++
>  2 files changed, 1121 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts
>
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index 9d56d4146b20..ad684e3831bc 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -181,6 +181,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-orangepi-5-ma=
x.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-orangepi-5-plus.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-orangepi-5-ultra.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-quartzpro64.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-roc-rt.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-rock-5-itx.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-rock-5b.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-rock-5b-pcie-ep.dtbo
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts b/arch/arm64/=
boot/dts/rockchip/rk3588-roc-rt.dts
> new file mode 100644
> index 000000000000..1d50009d3153
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts

[snip]

> +
> +&hdmi0 {
> +       status =3D "okay";
> +};
> +
> +&hdmi0_in {
> +       hdmi0_in_vp0: endpoint {
> +               remote-endpoint =3D <&vp0_out_hdmi0>;
> +       };
> +};
> +
> +&hdmi0_out {
> +       hdmi0_out_con: endpoint {
> +               remote-endpoint =3D <&hdmi0_con_in>;
> +       };
> +};
Does the board support hdmi0_sound and hdmi1_sound (and the
corresponding i2s5_8ch and i2s6_8ch)?

> +
> +&hdmi1 {
> +       status =3D "okay";
> +};

[snip]

> +
> +&sdhci {
> +       bus-width =3D <8>;
> +       no-sdio;
> +       no-sd;
> +       non-removable;
> +       max-frequency =3D <200000000>;
> +       mmc-hs400-1_8v;
> +       mmc-hs400-enhanced-strobe;
These properties should be in alphabetical order.

> +       status =3D "okay";
> +};
> +
> +&sdmmc {
> +       bus-width =3D <4>;
> +       cap-sd-highspeed;
> +       disable-wp;
> +       max-frequency =3D <150000000>;
> +       no-sdio;
> +       no-mmc;
> +       sd-uhs-sdr104;
> +       vmmc-supply =3D <&vcc3v3_sd_s0>;
> +       vqmmc-supply =3D <&vccio_sd_s0>;
> +       status =3D "okay";
> +};

Jimmy

