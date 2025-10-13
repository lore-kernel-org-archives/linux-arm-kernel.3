Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1634ACCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 08:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qjn80fxqTnWd47bRID7zagiFWJvRCbz/QkHXqwtfnJI=; b=3cFpl5GDzaNKrOp04q2/dR0KSj
	/Qc1tTKeZMiXzSCe50lywYu6rfQUbkBY5V8dmcYIFVndoERVDhqUi6JwH4Z/FVb/29BElUO56WTwk
	iCodWonq66ogrMQdbEAMcmk5N+wKkPTGO94B5Lu+HgwM3PECRf1OGBSHXtV3dgbQ1G8KAsB7TWIIm
	qosNLaJXVpgHyNDK+roeL0dJdWKsQJedNHpg+qHYqLPcqZIOvNmB40X4t/xMdAa84aoa8aU11mjuF
	RCF/sz3fDqOVz49/zydsASQO24IigWa1vZZNfH/0P/2NRu9k3AVVfiDA06ZVuoO+mmT+azuW7tcLd
	1Nt8yQsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EHF-0000000CejL-3nVI;
	Mon, 13 Oct 2025 08:51:33 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EHD-0000000Ceia-1jWD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 08:51:32 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-78defc1a2afso82782196d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760345490; x=1760950290; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qjn80fxqTnWd47bRID7zagiFWJvRCbz/QkHXqwtfnJI=;
        b=fgj/hNU251P+oh1BAcvhocVSKfAMvL3ST+0jz8qIBwByk8/CBwineZ7KoBlyQNzAY5
         ZJs0BZCFZIhVHmKDTwBenDbbEi6HbDTl0DtnRGKI2gD7ZIpqcnpVcO0UHdeO0m/Uxa/p
         nvK+6GzU0MDzVoka4Ajo2SXMR2K2G/j+Yp8MIP84+UI5qhTZ6Ma6PVC36zBzW55Ny6Yu
         bTHZIGR+VJmPplatPFPym2xpcjU1mj6MktZ/pnmd9g5tzsbZ0+3x2grfacxPtOqwGWmg
         qAyS/rjpmPm0fCtRkrus7DmZyF25bI1ZT0HNqAKsdHCkRhJpSYt4DQ/Cy7/iHnel+PnN
         Mpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760345490; x=1760950290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qjn80fxqTnWd47bRID7zagiFWJvRCbz/QkHXqwtfnJI=;
        b=vsj0hRJa/qM/ID5/J8KtJZP1lnnMrLGZnmBrQU1OBZ+53xNq73fxQvqBhgbK8vj+tv
         msMsBnRVdEmY2LO3MbCull8MxCCkneqOkteYOJtxCAXpTnUr2NRsxMNL4/9hlXUm8S9h
         GeYT/eCe1Hom4vMqSG3f78X7o9G+Nv9HrsLeGo0r4K48/XZPEmmQ7nuubWk5/sC2vmid
         Y2r9aM345/O9KfETdUtxfOsmXYjFgbgQJ2P9N5w+E/A9qa1eRHfsbW8akBw95YhNon7v
         4fEh/PWRv9X5fYuOYLKPybgtf9RcXMu1Dk9kWF3EeX/w+UsBLEIu2rRKa8Br39kRp0Tb
         Lc8A==
X-Forwarded-Encrypted: i=1; AJvYcCUk3/Jsx2SVJfdPEA/RNSYJT9ii8tFLknxTdo2Vt5jX6nwyVk8lP0tJzEwoV39PP6FIQ+2cvtCqN3oQr632t2RO@lists.infradead.org
X-Gm-Message-State: AOJu0YyWc5b4dwNXR06nne6AUpP6izPF4sU1MGMtheP5d9jDvn6QXlRB
	Qtjz/BmdzoDBCWvlh8MeGcT4YTVtFFnXd+nLeWczUT5Vm5hP32T+T6CRdBSHFAZieCS/19n0obQ
	O41QjIf15nbd4dFBq6GZjA/Fqoq792Cc=
X-Gm-Gg: ASbGnctgOBLxJYjzjF2sZB94UqCuxot6IqHZvtG9lDtL9dp9vXpgj9/F81BZ9SkXHzO
	ibsmkUzLBrgCw0byMOBI6IlDly981pOSDFjGxJBjYDO947maKAKaXgJSBH/WO8HQpn88MrPLVD8
	6460n+aPDuwdVYKUuGZEmZUzaVGKLmEmLNV4FaRyXgx6ZiQzp05gSgN4XQ8DNin2mMDa83FwbZN
	p5Ns3y9HZv4qskU4huENSeZIQmT3Yse/x1+0g==
X-Google-Smtp-Source: AGHT+IH0ySB3maj/sC8FUBTcxwFiIagWYmPDEWGIQC6hjlTOe05KTYNWC9uE9sG+FKiibmlzh++7qDDMrC8I5v1tVfE=
X-Received: by 2002:a05:6214:2264:b0:78d:4b1a:5ac5 with SMTP id
 6a1803df08f44-87b2ef37479mr282594966d6.48.1760345489748; Mon, 13 Oct 2025
 01:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251009084416.45542-4-jjm2473@gmail.com> <20251013070036.66901-1-amadeus@jmu.edu.cn>
In-Reply-To: <20251013070036.66901-1-amadeus@jmu.edu.cn>
From: Liangbin Lian <jjm2473@gmail.com>
Date: Mon, 13 Oct 2025 16:51:16 +0800
X-Gm-Features: AS18NWBHP3UXJATnpuEz0GehP1fSNqq1qliSBomIm1t4FH_TTzg2ldtvn1AzLb4
Message-ID: <CAP_9mL5=GmtJF3nSbfX6gRzPc=fAMrTOfMuOLyWFwq5D4OYUFw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de, 
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_015131_456727_3D7C533C 
X-CRM114-Status: GOOD (  14.57  )
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

Chukun Pan <amadeus@jmu.edu.cn> =E4=BA=8E2025=E5=B9=B410=E6=9C=8813=E6=97=
=A5=E5=91=A8=E4=B8=80 15:01=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> > +     regulator-vdd0v95-25glan {
> > +             compatible =3D "regulator-fixed";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&pwr_25g_pin>;
> > +             enable-active-high;
> > +             gpio =3D <&gpio3 RK_PB1 GPIO_ACTIVE_HIGH>;
> > +             regulator-name =3D "vdd0v95_25glan";
> > +             regulator-min-microvolt =3D <950000>;
> > +             regulator-max-microvolt =3D <950000>;
> > +             regulator-boot-on;
> > +             regulator-always-on;
>
> The property order should be consistent with other nodes.
>
> > +             vin-supply =3D <&vcc3v3_sys>;
> > +     };
> > +
> > +     vcc3v3_nvme: regulator-vcc3v3-nvme {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc3v3_nvme";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             enable-active-high;
> > +             gpio =3D <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
> > +             vin-supply =3D <&dc_12v>;
>
> Same here, keep alphabetical order.
>
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&vcc3v3_nvme_en>;
> > +     };
>
> > +             status_led: led-status {
> > +                     gpios =3D <&gpio2 RK_PD7 GPIO_ACTIVE_HIGH>;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     label =3D "green:status";
>
> The "label" property is deprecated.
>
> > +&pcie2x1 {
> > +     reset-gpios =3D <&gpio3 RK_PA4 GPIO_ACTIVE_HIGH>;
>
> vpcie3v3-supply is missing.
>
> > +     status =3D "okay";
> > +};
>
> > +&pcie3x1 {
> > +     num-lanes =3D <1>;
> > +     reset-gpios =3D <&gpio3 RK_PA3 GPIO_ACTIVE_HIGH>;
>
> vpcie3v3-supply is missing.
>
> > +     status =3D "okay";
> > +};
>
> > +&sdmmc0 {
> > +     max-frequency =3D <150000000>;
>
> max-frequency has been defined in rk356x-base.dtsi
>
> > +     no-sdio;
> > +     no-mmc;
>
> no-mmc and cap-mmc-highspeed are mutually exclusive.
>
> > +     bus-width =3D <4>;
> > +     cap-mmc-highspeed;
>
> > +/* Micro SD card slot is not populated */
> > +/* Wifi module is not populated */
>
> Why would you define them if they aren't on the board?
>
> > +&sdmmc2 {
> > +     max-frequency =3D <150000000>;
>
> max-frequency has been defined in rk356x-base.dtsi
>
> > +     bus-width =3D <4>;
> > +     disable-wp;
>
> disable-wp does not work with sdio
>
> > +&usb2phy0_otg {
>
> phy-supply is missing.
>
> > +     status =3D "okay";
> > +};

Chukun Pan:
 Hello!

All except usb2phy0_otg will be fixed.

> > +&usb2phy0_otg {
>
> phy-supply is missing.
>
> > +     status =3D "okay";
> > +};

VBUS on usb2phy0_otg is floating, this USB port only works on
device(peripheral) mode.
phy-supply is optional, so this should be fine, right?


  Liangbin Lian

