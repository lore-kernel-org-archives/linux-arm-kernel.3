Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF2FE95A77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 11:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DhaHJWr2nWv1al9K6mLQLe34skpWhfOOb6P3+q+LeM=; b=R7C9RmMOO9X6WCGrsiMDmu9Vn8
	X5iwKTHh38nTjz7XVPZrLRuoFVOuuvGGV+3M5vaah2AWbIggKQ+VB/g5rUSC8aBc4yKlyOrDjlKLh
	WbVfz0p1zeDOClm82dYkMhY6wO/vLfk4RkBat8J/kOYPybpoGgaX4ri82Wyo/uCPBSgmbqHG770N0
	AaAAEcwX6Vyoc1NNvOXvWZEDmBIgPLNBZ8WEWOfdvD9co21hOG3yZzQrPGdcG/qYaKLZMMPO4HL1s
	P0hiSqqo1LvhvSMi20t/eW/Cef3c22Rvhq0tRDOhU8Lu5zfVh1LMhvq0YwXoSCmv4Qu0bslQzxN+m
	eiJ0fPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXfM-00000004kUa-20kV;
	Tue, 30 Dec 2025 11:13:28 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXfK-00000004kTq-3NRt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 11:13:27 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59b30275e69so4886949e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 03:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767093205; x=1767698005; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DhaHJWr2nWv1al9K6mLQLe34skpWhfOOb6P3+q+LeM=;
        b=JAnR+BP3jtdtgb6ORKtg+rGTskU/UdLa8Usvai5+RFs7C6WqTOJ66IteI7DKbFgtCq
         stDUP6aure5y+zRk3HnoGIH1vW8/FlcxpA9qxWAwxaOHSuyyVXaucUKGriSGFgk+nQlq
         Xxtxylq/D39O4JTq7nZNvM21rOGEfbFtb2jMgQSiGta/mgF43DT5nP+hkOrAt2P2YVAA
         0aUrDsNwm8USKew36ss+7txKSWo2iK0ElWLOZ1WaQ8UcJ/tu7iigvKVbTo51e5pb+aE5
         tAcKV+AP2/ISnjD0XittrgCIOR0LbF9dnhicX8CwzE/bvZJth0XZwfAvP6i3f6eCR+c2
         kBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767093205; x=1767698005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0DhaHJWr2nWv1al9K6mLQLe34skpWhfOOb6P3+q+LeM=;
        b=gfNIXGvWtWZ6MDOT89eQEXC+NwbmZs66F4kVaiicc18fFnUoUfqbR/YxOxVUJzZi6l
         51ax/demvG/ct50NdxK4YAdCjvNMGcYHoYmQHo2tSfYjipVGjB/hP1wHidswUoN/RI1b
         bCIJWFJrncgUJ5rLULvwt88aplTBinrQLr+OlupCw5fDhNaMTHd4UrA1ysbOywOOkU+h
         LmaixbwIhN4gcM9A956uOWZP1Xyadhws8K6i2xJyQTaKgHr5kpxMQ7rBSnksTYhiZ0d/
         vC9bs4TRTbW97NEtcq55Oxjt6tBEbx4Ic5Okw/piuvZzip+6pKl4OBRlBhzv535M1x2V
         6M5g==
X-Forwarded-Encrypted: i=1; AJvYcCWcTuws37TR5XkBoJ4V5dm4K7LWvcjsII1F/xBgufLtG+aRlO3XTIDubvF2CUpnTgrFSy8KcljrLZ1kq57Tcstj@lists.infradead.org
X-Gm-Message-State: AOJu0Yym0mTCiIb3blHoX5+ZccbvtY0ErH9Qc7i3lsk6TrwsEo2VH/UM
	OWESRgpO/n7k56JmB00l/g9AGDpkD6q+TI6HNZ9wwOsBq0NCH+dtF9Rkb25tbcUrezm+Q7SB37d
	/5BH8CaJhD/YLX6FrAZgACYt5SVzbuHk=
X-Gm-Gg: AY/fxX6CJVfL6h5E/Nl1JwWU0FWiGa27SQZ5qA1+OtU7i3i8ck3g3VSuDYse/UClpvQ
	rtNTnfXYGu1yFuw9DKZnFBqM/xbiRAxlE1hPtgtmA3p+A5l0ta44YZXdHWj9DpFtbJoxm+lbpr1
	ppNmlAklTEyCYLsvAhnO+HcdEBokZPEHN452W+O6vfnkWsEvJCSffLk6vgTW/2Y1+prFsiNJO/a
	gq7tT0Usm9MGrFT8wNbA/h17AoAtlaVA+BKyHapL7eeWb8FttxjJErBQ8Xi9ok8dJNlVSeOjkkO
	fG5KDFOYe5v8wetnDr5k+8VTLe4=
X-Google-Smtp-Source: AGHT+IFq8iKQHu6vpcCYiWXyzz3tsn0MBXJbshrFfK/UlMVKowVKSf2tIcJTFEyHx5cpFKKTRtj3dLTLa2JxOdsPHZc=
X-Received: by 2002:a05:6512:3e06:b0:59a:107a:4593 with SMTP id
 2adb3069b0e04-59a17d722admr11700584e87.4.1767093204378; Tue, 30 Dec 2025
 03:13:24 -0800 (PST)
MIME-Version: 1.0
References: <20251229213726.79374-1-stefano.r@variscite.com> <20251229213726.79374-3-stefano.r@variscite.com>
In-Reply-To: <20251229213726.79374-3-stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 30 Dec 2025 08:13:13 -0300
X-Gm-Features: AQt7F2omZLLu61VmQRr9xvfISMKNSHVaUEafxRkAtNsj_CTzmp5R38uxHvlk4qA
Message-ID: <CAOMZO5CsN-DMKoJ2Fz063tVKVqsr6Y1dq7B1Mg=Krz+_g1tQcg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite DART-MX95
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Yannic Moog <y.moog@phytec.de>, 
	Primoz Fiser <primoz.fiser@norik.com>, Markus Niebel <Markus.Niebel@tq-group.com>, 
	Josua Mayer <josua@solid-run.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_031326_849726_D4EC2048 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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

On Mon, Dec 29, 2025 at 6:37=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> +       reg_audio: regulator-audio-vdd {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "wm8904_supply";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-always-on;

Please drop 'regulator-always-on'. reg_audio is consumed by the audio codec=
.

> +&lpi2c8 {
> +       clock-frequency =3D <400000>;
> +       pinctrl-names =3D "default","gpio","sleep";
> +       pinctrl-0 =3D <&pinctrl_lpi2c8>;
> +       pinctrl-1 =3D <&pinctrl_lpi2c8_gpio>;
> +       pinctrl-2 =3D <&pinctrl_lpi2c8_gpio>;
> +       scl-gpios =3D <&gpio2 10 GPIO_ACTIVE_HIGH>;
> +       sda-gpios =3D <&gpio2 11 GPIO_ACTIVE_HIGH>;
> +       status =3D "okay";
> +
> +       wm8904: codec@1a {

audio-codec@1a

