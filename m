Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B92C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7UI2Y6MBJpdKB31fdutcaWyVKKdFp08Cn0ReKUGIo8=; b=M/TtTz57ficbUdpbYlVeW9/HjH
	scvWwQlqHHsQGKfUrn4dhUCJlUUTSVbLSkbHu/mlaIUzuMI11EIRQnxB/QuWPDHmwtUA8DZigaJQz
	o93dagSqFuyAUeK950QvzgQGv/GOvFMo3bTbT3Fum/FdkIFJDbopqRgTrxVSz2K1Gv/YySWtNNHg+
	crQOBXb+0nL7Xz3WUY3GAQzy4X2jmKIm/Ld2Gi5dRMWWOxWr7SfffEjdXcHbNVa5f+UD72nEx+d+7
	QQdQlDBnj6c6QXpLXceBN4LvOwbW9Fd2gyvkZBbrEIzWimi6Ts7cwOVohiux/PDByvEFobLIoeyrf
	OGLpuuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6U-00000002e9R-1lUS;
	Fri, 02 May 2025 17:23:14 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtdM-00000002a5i-0Lqq;
	Fri, 02 May 2025 16:53:09 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-30863b48553so3404345a91.0;
        Fri, 02 May 2025 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746204787; x=1746809587; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7UI2Y6MBJpdKB31fdutcaWyVKKdFp08Cn0ReKUGIo8=;
        b=W2q6WtobNcKe7YmZ1q0frr4lIOQB08awLMCJX2n8+Jb+odXXgz7oxrdvPaqDvrLIV8
         rvo8flqCUSFtQOiC5KF94MdHlWNXs8vX0su9TP+mWsBrU4Pp54ojb6g5ti7S0oNrebfB
         cMWUhWXglRFBgjXUWTLyYEREmo8Xn5zL9nnuUEuHRouviM0MiEuEmKAEkHB/x0E0kKJE
         GZlZfVedxzaxM8/OTv1KGkqyglqH1lzdPdQsupm1FaA+RiCZrBj7r0E6cFRXr78X8/Ln
         hF0y7pllMN+HX8i/rD0jlQ+gqh8MZPQsHR/KuuqHISQRQh9K9XZEWmQNaSMRinvXSHGf
         v4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746204787; x=1746809587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7UI2Y6MBJpdKB31fdutcaWyVKKdFp08Cn0ReKUGIo8=;
        b=k9DZGtg1YeEsXc4JS7y2ogjGyfTmxVbUMPUBdKhuJW/RBTd582WB+yEsLXOOPEsaVz
         gYRuZcRsKPel6Vmlsq4zzmqrDGFuuTGxPYB+PDmBoRnoR2rn376eIlY8s1rRjh4isJTQ
         vUFqNVKxf8FOxzUzb1duz99c+SLkPTZM8YS4UXKVSq3u0bt3q5WQdorRZhGuWQ3ttijF
         kxsB1GrsD5yH13xCZtShnzqokN94z27AUFDUh4vSsm1i2GGF9bfeMarTgSPuGF00KhGJ
         JvVwhjugwuN5UjW40i+z5MD8Pj5+5AWTyQjdMMcxzYl16r+QPxU34msUazzIyZ8KPOkf
         P0jw==
X-Forwarded-Encrypted: i=1; AJvYcCWVVjbNA1lbVciQoqelBk7JAB3C4a8RYe86JywSyXUmUOHyYWT+yZrpBesZQR4k9DdwFZxiPfUtATZNILbgtxQ=@lists.infradead.org, AJvYcCXEJEnIQ8LvpD6sh112eq63Db/DU4HA52HCr2BORBKVeX5LFoIm55nXKflAedG9rcFInjsb84QWG8I2Ls6rqgJ7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/4iw2pD7LLqjR4yqDimq1R06G3UJ9EnXSmYbegYmXN7olOrIg
	kGbHQ3s3SqoPJGm3/LJ5fbcxPiF49hfEsYAGBT+wvgNU9QvGj/IAEjChjvNlNE8rDuzEpLiDg0S
	i+scrjQsvxzA9KzDTQiswjKB2QN0=
X-Gm-Gg: ASbGncswpK5W5H3UNhmRXsyMlJ5BspqwdlRyGSHrYnfAbM7mLUBbgjs4DB+kpQOHH+Z
	qtB8f1vUsR26jFYbbNXgZJW+LQ1Y4yEuZ7RUoWP3aZYnSX0iELL7ce+Xq6p6t/8qGM7QJGWJ16B
	BdT1Wd3la+3rk2t3uFtwRUQw==
X-Google-Smtp-Source: AGHT+IHGTYOtyWFxjXS9Ul06M6JVtewP0QqLDSWygChMn5nReUMS9WxVTU7k4hPxbBaUObqwnTWe5V/cpuVhKJnX2Y4=
X-Received: by 2002:a17:90b:254d:b0:302:fc48:4f0a with SMTP id
 98e67ed59e1d1-30a4e04c98dmr5766332a91.0.1746204787157; Fri, 02 May 2025
 09:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250502150513.4169098-1-m.felsch@pengutronix.de> <20250502150513.4169098-8-m.felsch@pengutronix.de>
In-Reply-To: <20250502150513.4169098-8-m.felsch@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 2 May 2025 11:52:55 -0500
X-Gm-Features: ATxdqUE-GbFHdhVzbDY9mw-AkKfv1gk9sfEHekiKJv7IfKQ5yld-yg7UXiz-NTw
Message-ID: <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: imx8mp: fix VPU_BUS clock setting
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, paulk@sys-base.io, 
	hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	sebastian.fricke@collabora.com, ming.qian@nxp.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_095308_141186_AA044DFE 
X-CRM114-Status: GOOD (  16.78  )
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

On Fri, May 2, 2025 at 10:10=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> The VPU_PLL clock must be set before the VPU_BUS clock which is derived
> from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MHz.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 97b09b647ec7..7f4bdefb3480 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2289,8 +2289,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
>                                  <&clk IMX8MP_CLK_VPU_G2_ROOT>,
>                                  <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
>                         clock-names =3D "g1", "g2", "vc8000e";
> -                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_BUS>, <&=
clk IMX8MP_VPU_PLL>;
> -                       assigned-clock-parents =3D <&clk IMX8MP_VPU_PLL_O=
UT>;
> +                       assigned-clocks =3D <&clk IMX8MP_VPU_PLL>, <&clk =
IMX8MP_CLK_VPU_BUS>;
> +                       assigned-clock-parents =3D <0>, <&clk IMX8MP_VPU_=
PLL_OUT>;
>                         assigned-clock-rates =3D <600000000>, <600000000>=
;

I think there was a move to make the default be overdrive [1]  and [2]
and use a 'nominal' device tree for those who are not in overdrive
mode.  According to the TRM, the VPU_BUS_CLK_ROOT, the nominal is
600MHz and the overdrive is 800MHz.  Based on that, I wonder if the
values here should be 800MHz and if we should add the nominal values
of 600MHz to the imx8m-nominal.dtsi file.

adam

>                         interconnects =3D <&noc IMX8MP_ICM_VPU_G1 &noc IM=
X8MP_ICN_VIDEO>,
>                                         <&noc IMX8MP_ICM_VPU_G2 &noc IMX8=
MP_ICN_VIDEO>,


[1] - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit/arch/arm64/boot/dts/freescale/imx8mp.dtsi?h=3Dnext-20250502&id=3D9f75=
95b3e5ae0ead20a74a5f2a8f0434b3254ac5

[2] - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi?h=3Dnext-20250502&i=
d=3D4b98bf3bff7353d94824c4d874ff2d7f38acc49a

> --
> 2.39.5
>
>

