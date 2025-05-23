Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C8DC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 19:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VS0A7f4cZPS7BRx076fCSjrBX3EzmckOUBCVUWvGfQY=; b=Lue4NJLX0fILJt1bKQfTw5+D7x
	mPvltJvt7M7YlbG41vu9TxO+LOcMfup6if93S8+IfFlWv0UGTGaqDkkAcylLHCkfPXhe/1FVlR9y3
	Y3A3g/qfpIRqNJfF9ceBYM27l8NVEkrf84zubU7PDvxG9LN12bltes6C1YvatZWSVQpTzIly+RdBV
	P/iYuCBnhoHgb9Gvb/Yid5gdfrmOoOgWmOTFpujOsuju8kas6HuWhXS7o1kKG1MwdFUfFQNMtjtLl
	lQjwN1yiWNFjmAhv430cV+h2RhkORKAkZ8zUk4l56vYh35Stvm2ysSgJw4jdlKgHLcAgCieSdvGCx
	DkJK5KnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXlA-00000004leB-26YE;
	Fri, 23 May 2025 19:08:48 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXj6-00000004lNc-1YhL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 19:06:41 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso1465691fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 12:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748027198; x=1748631998; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VS0A7f4cZPS7BRx076fCSjrBX3EzmckOUBCVUWvGfQY=;
        b=MX68ELlia4YBY3YiWFFlgN9kffhK24dSpFfp/wunnDkqRLNn76nicJFJ9Ykt65a3sV
         CU74UWiLzhG5BVI36i0+bgezZxpIDzEs03iUbNwGbyvs8NwLFuKYIymCwejwL1mHmWyu
         EdheX98to75OiSCk7MiEnIO8pH4PNbp7zqjNqK9lBJGQQTcYoTC7/eysw18s9FBe/k0O
         ErXXee6RebIYoX2IwUj9OsP73HmeCT6Lvns1FBasSo7FhTA6BXK7kcRTR1r0SWLGQZJE
         DWiUGrsPieJcMKhA9BFlCNyXrf21zzh2Bly1iIukOObnU5j2WJD7xO0DeeFiHC1LPT8r
         Yk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748027198; x=1748631998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VS0A7f4cZPS7BRx076fCSjrBX3EzmckOUBCVUWvGfQY=;
        b=Le/MTFuFiDcqPpzI2zVamf8d8A0tp0fb9lfwqJ0u/f8f63/IiJ0+HPKZMKkOjoEEju
         0ECzzK3BPZ+0jFk5HQV9DwtGkpAwbxqtORpenxijjk/8ssa3131Dd6pVaJdkO6PVlVyg
         UXTZvMVl7dAIZdMiF1zqZe5leWXtGqT0Zl8HWDowZMmi2DiE9siuYGBMgNubz6C9m8IU
         XY5HaHOuoQ9sBAF0mu8IbKYva+LSkj9qmZo989iypfqNn5Ebrzht53iAffsCarheTWVz
         x8g6/QFDfVDuoTVr77KUcCyfL2++lsPe8q+M4H8I0SSg+HsA9XlzZzAbqmsi3JQOQBmF
         tQqg==
X-Forwarded-Encrypted: i=1; AJvYcCVSiDLvAWc6fRQ/AXeSkYkTrs0qxp/CEQ4cGwWSHFp2kakmpuUeYuCByKRAKD/e1nrYJsc91rvGZFj63/VMg+EV@lists.infradead.org
X-Gm-Message-State: AOJu0YycBQjFFZHi1qnZt9eeDHXvMSkseAagsvQzDwXSclqIzoI8gKvb
	rcdFBPFNb7KPBsirOpDV2PZ9ZggXgJDf6Fb+u910MMCfXivQWYVIqyhovs5/s42JIkX+NfFPtCO
	z9/SC1E5rLwRLyAt3NrkOAF5NibqvBCc=
X-Gm-Gg: ASbGnctgqVKDtw3fgjqQFACpWoKQ8nd85gthHM7vnZHors1/ZVAyJVncV0W5wV/tkkD
	LgwfhE2QXZCRHkyxDBSo39ydNOWpaPChtkKc2AB+R02SY2ccq2DsyHkT7WKfqYW76Oi+I5G81p6
	GP6BjcPYdMis4/YgEPGBeIKoWAMwWzdjYvO7j08c2tZ8BgTJbimfI1y2wRrMle8GtMjpN0nsLGe
	fU=
X-Google-Smtp-Source: AGHT+IETmeJkocuRxzffEQVOPnq+Mvm4DCm90i9IzQsKc/gpILBub7RZRta81dz6khIpq2Bq9LX8qd/CQIQnEMrf0do=
X-Received: by 2002:a05:6512:3e07:b0:552:1c32:9ce7 with SMTP id
 2adb3069b0e04-5521cba96f8mr174230e87.35.1748027197619; Fri, 23 May 2025
 12:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-fpg-nxp-imx93-frdm-v1-0-546b2d342855@pengutronix.de> <20250523-fpg-nxp-imx93-frdm-v1-1-546b2d342855@pengutronix.de>
In-Reply-To: <20250523-fpg-nxp-imx93-frdm-v1-1-546b2d342855@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 23 May 2025 16:06:24 -0300
X-Gm-Features: AX0GCFsnj4NlCC9trwiG2lT4T5M7HQnFlcG-GgfTv8N9bFCYaGXgR6BHfTt3N-k
Message-ID: <CAOMZO5AP_ySh70S6sAKwKAqPypT07AdJdnkCZ55xPPRwY9nY-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: freescale: add support for NXP i.MX93 FRDM
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_120640_407672_78D9D79F 
X-CRM114-Status: GOOD (  10.77  )
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

Hi Fabian,

For arm64 dts files, the Subject should have the following format:

arm64: dts: xxxxx

On Fri, May 23, 2025 at 3:17=E2=80=AFPM Fabian Pflug <f.pflug@pengutronix.d=
e> wrote:

> +       reg_vdd_12v: regulator-vdd-12v {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "reg_vdd_12v";
> +               regulator-min-microvolt =3D <12000000>;
> +               regulator-max-microvolt =3D <12000000>;
> +               gpio =3D <&pcal6524 14 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;

There is no consumer of this regulator.

> +
> +                       buck4: BUCK4{

Missing space before {

> +                       buck5: BUCK5{

Ditto.

> +&usdhc2 {
> +       pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sle=
ep";
> +       pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +       pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +       pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +       pinctrl-3 =3D <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_slee=
p>;
> +       cd-gpios =3D <&gpio3 00 GPIO_ACTIVE_LOW>;
> +       vmmc-supply =3D <&reg_usdhc2_vmmc>;
> +       bus-width =3D <4>;
> +       status =3D "okay";
> +       no-sdio;
> +       no-mmc;

What do you think about adding aliases for the usdhc and rtc nodes?

