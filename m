Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39B9CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZ31nFbpBywr5LWV7R5R4cpzaC/84WhWlclxZ1iDl8w=; b=kvjKvRI/J6CPX2REVHktuifWvD
	JNlPUAiHSQDSbDDHI6xlleBo/AOviKZdAc7ZnlZAql5ZRN06Dpozkpw29tMH1uvzVLFz5gFByFbBu
	ZhioVOpdiDJOM8R444HgyPE1U80SjzENWi9HkMTwLU6GcY07m9iNRcsyKNracJCZaN5sfBMsuJDak
	deUq8/oLiWvmzFrAEaMfS9fzMr7J8g61cWYb4Jc6jFfigWs/Oeg6jgDXvhlivgXkinbZvSo1t/yVo
	B/febXvkHval5yYIApFhlmK3pAkhvAjEHi1XWsBMUCkIIFBgOZ2ninp7fKA/2PtHmDI4Q8Jrs5+j8
	OpiKf4dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsEV-00000004sm8-1sPC;
	Tue, 09 Sep 2025 06:53:39 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlWL-0000000316G-3NPg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 23:43:38 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-74526ca7d64so4248460a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 16:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1757375016; x=1757979816; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZ31nFbpBywr5LWV7R5R4cpzaC/84WhWlclxZ1iDl8w=;
        b=Fqj22PG84/A9NJhKEEEfrp4c2gInXC540BdhQ0xc0nW5wd6qyee7/kaJonZR10+lag
         FkYeM8/XyRhPHwh4tzAZ2uXqcyjzbwWWNNDpwmuIWhLk+zkfPxzQ6ZogtNkkwCXNPE7s
         uFIdE9F4dzi6486gt9qcn79/qgPwSdpzhs8Ddxw0eZC6BNJ3eY350rq4rWB4blUEv9sV
         0OQ8CF7SxlbF/7waW9gPSVLGH+k/rKWDfO+ktLFAOkTQfhaQgJuTu65UXXjIGudXgSPx
         nZrc1GnNqYYu0UXLbAzyik3jsypm5DL8B82q0UByPmUQONsGybwASqpNNRiSUTq10EiU
         0yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757375016; x=1757979816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZ31nFbpBywr5LWV7R5R4cpzaC/84WhWlclxZ1iDl8w=;
        b=MUoRomFgaeE4VDRN1xqY7MPI37OfzHjG5gpWCnlKzXv6cg46g4tEOTv7NG+gB7kG56
         ktwtt9P6Kge9aQiosQei+jFjm6T6+zXSvBmrT52iRLGXAEkPnYcpMKS9LiYdsxE6lsAW
         c11gEE/Va5izpNs518bFHmsxUegOZDkMK71EnFsib+oWotYery56EZhnMtOphTiFiv7G
         XbAoi20PhagexUxAruYAF94XNB/X1zUYwrAwS5fYMdF/Y5CMeKHB2IA1J3oFl87fAHlK
         Kd3aAZeW0VcImVcwomlAoRoWxKeNBEvtWULpTqjI17l3koujvDIcWJoVyU0hJ3IqkMyJ
         XJSw==
X-Forwarded-Encrypted: i=1; AJvYcCVEPkKf+LYC/fOMn/B22smNp4LOC96+IqNQhrA6knL5F+YQvBtRfuuYkJA/Q4y8xAkMm5Vy7/r2qAkjO03pqgDz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1fVSbP5DSmItePPpQYtGYfP9mCCG8ZWN85+79LK0ALzJfyu6k
	VB0BBkcgQvfm5WCpN9JC1xF9F7wpZiDJpbMFYtWxqINN1avOk1YdZ2Lb+GL/5nt6WiBVFPv2nhK
	317+Vq7ldVmrxLNo8HFQ7oCFaxh7lo5waWxJE6iMJzA==
X-Gm-Gg: ASbGncuL00T0tkxpdbnIfAI/9r61d8YTZ9hiGdnr8oxQOyrmIhjM/B+Vrv0AB1S9lrT
	rqzKexCPkOjdhZevsB6tJHtLrt5GGqG7rWidWp89usoxawyvtt5YdmdquO3ezuy9gOYvRgMlkV3
	DGh3CAdOgkc4EvzQkCM6eZxhrmcNekipHZoNlOwtxx4t4DvNUKlxrwVEIOe39sjefUEZ2YgY7Xb
	i8lz47lThHab9QsTQ==
X-Google-Smtp-Source: AGHT+IFz9G3l1NgBkuI646j9EnzDEEYlshmM1HaRnKUWjXTHPYCEEDbgvsYhJH8t3TMOXGnJoUgXdZIdCebMwUfCQhE=
X-Received: by 2002:a05:6830:4885:b0:745:52d3:947c with SMTP id
 46e09a7af769-74c71eff9demr5731156a34.11.1757375016543; Mon, 08 Sep 2025
 16:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250815-imx9-dts-v1-0-e609eb4e3105@nxp.com> <20250815-imx9-dts-v1-8-e609eb4e3105@nxp.com>
In-Reply-To: <20250815-imx9-dts-v1-8-e609eb4e3105@nxp.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 8 Sep 2025 16:43:25 -0700
X-Gm-Features: Ac12FXzVP_2vJkdlY1v1O3gS6w0Yd5KqydILTTKyUiWG6S13pVl8pRj4kS7eaz0
Message-ID: <CAJ+vNU2hro_ZoRvmQ9yowKsX25AnrgZdGMn2D-RCkyJA02CEhA@mail.gmail.com>
Subject: Re: [PATCH 08/13] arm64: dts: imx95-19x19-evk: Add phy supply for netc
To: Peng Fan <peng.fan@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_164337_850339_3DD8CD06 
X-CRM114-Status: GOOD (  17.76  )
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

On Fri, Aug 15, 2025 at 4:50=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Add phy supply for netc emdio on board.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 20 +++++++++++++++++=
+++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm=
64/boot/dts/freescale/imx95-19x19-evk.dts
> index 39815b21d235d2f8cfa49720d3be49d056ea039a..feee6da65d37cae7413b09216=
014d6fe2b76b032 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -226,6 +226,25 @@ sound-wm8962 {
>                                 "IN3R", "AMIC",
>                                 "IN1R", "AMIC";
>         };
> +
> +       reg_aqr_stby: regulator-aqr-stby {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "aqr-stby";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               gpio =3D <&i2c5_pcal6408 1 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
> +
> +       reg_aqr_en: regulator-aqr-en {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "aqr-en";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               vin-supply =3D <&reg_aqr_stby>;
> +               gpio =3D <&i2c5_pcal6408 0 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
>  };
>
>  &adc1 {
> @@ -502,6 +521,7 @@ &netc_blk_ctrl {
>  &netc_emdio {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_emdio>;
> +       phy-supply =3D <&reg_aqr_en>;
>         status =3D "okay";
>
>         ethphy0: ethernet-phy@1 {
>
> --
> 2.37.1
>
>

Hi Peng,

I'm not sure where you are with regards to this patch but it indicates
to me that you may have the enetc_port2 10G port with the AQR113 PHY
working on the imx95-19x19-evk with upstream Linux. If so I would be
interested in knowing what other patches you have for that. I'm seeing
the interface fail to register with:
nxp_enetc4 0002:00:10.0 eth2: PHY has no common interfaces

I'm wondering if there is some support missing from enetc or the
aquantia phy required to work with 10gbase-r.

Best Regards,

Tim

