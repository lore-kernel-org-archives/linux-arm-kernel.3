Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753D1C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 23:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tX/dTIeYNxTzj5gZHvJ5AtwpzySsIM3wBh1XC79KOyI=; b=Nmtjtwdd7Hhe5qePX+khx3oAS3
	yaepx38JqeWXK1JgTf4lrqPp0AwVYWOZkqLrGJPeSqKkLZ3OdQdEbCFsz+FTkgZ6+yFW6eanqy+P0
	zx3drFl3MgjNWn+R7eln37hBaudrmWK1IEgj8MivkpyYp8VI/9grB89UAAjVjt77jRdDlP1xjiQTg
	y5BiJBvifHhGWnotBHkUMSuQq8cfcMBWEI6wy8kq3Sf/j6i5H1821yzEsVXmiuVKHuGSiTkg7tt/d
	GhOwhTS8t1C+2+Kc0QxxszXZBs2U5/+pfefq8JDrSc7R4iI0Lq+2MMorElsfMfsXfiaNP9mnt6bIT
	/DUSQyYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8r1-00000007AXN-1w0X;
	Tue, 11 Mar 2025 23:17:43 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8pN-00000007AKh-0ohy;
	Tue, 11 Mar 2025 23:16:02 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so6274535e9.1;
        Tue, 11 Mar 2025 16:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741734958; x=1742339758; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tX/dTIeYNxTzj5gZHvJ5AtwpzySsIM3wBh1XC79KOyI=;
        b=dXtFjgHUEZdNF4CrNZtU4gEnp0Val8+zT/fhkGxIW/4lnHMkI1zUGYzE0vaY10SR2s
         wE4qo2vJUOn0A53KcDRc34UWwVD2+MPTjb26QXOrjgSnJ0pFNtWOmH9JPWOALWgspLe0
         mQLf3Yo86m7ZwsOiUsgbnbIFn2tqb4VL0Sk27ebietGB8QHVyEBOBkk5ox19UyGkzjTc
         bTGPPKC95HF3GRqCDpA4hXvr5ftU2BSHsd0wXc+BOW2yf0QgjnVotQ8tLaa5iS9kDUj6
         UyRRbyvwox7lV+79QVyVnKbYBl9rPsL7xZMu7zf/PYru0Hhg5VkBAXVHbf+/X013sEu/
         qayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741734958; x=1742339758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tX/dTIeYNxTzj5gZHvJ5AtwpzySsIM3wBh1XC79KOyI=;
        b=NdzD/xwAN4AYzeC8xdAzO4QZ3DQrni+z1B+NRTQDvzPjUfpbMP/HlViQarjd3sKapH
         8+Iq1W94v52z37uyBgIWOsxHOdLrfAlKMUJqD+3RpXi74zEopQyS8Vci73gCla9tTG5L
         q42djYl5xfK9lvn8esWzTJdNyDJmzkG++3Pfriae+HlqxL5GqHbzNGU2yhDGk78HjqgQ
         jN6ZXvhBMJV9b+Qx07yJgctEVHPf4gOlmraXIPl9qUU3CqrTRktq4SozGhm6k0CvTKt6
         58rVJe50fwiEug4sXBC0myO0V9x3wnqMlWLNr6cdO633PkxEDTiVlbA4lwyDLycR2uCK
         IPvg==
X-Forwarded-Encrypted: i=1; AJvYcCVmH96tIMqpsDDJwbQIUnHvf7KB1iSYlRu5ffO6LGIFNRUpwdRbit/k1U2/5mVzobHsgvxDW8eQB/DH4OX44vh7@lists.infradead.org
X-Gm-Message-State: AOJu0YwJoZ1l5ezRjr0/lruTep38BSsw2+YVMBy4eRABiynx3fKg+zEP
	2kuVhdrJUoZXq8UvT7SFAIv5nNOsb8f+Eqx6M98mBcvUSBkBjFSVdMBYLHTbYGr4v4Lb+AbdJhR
	0QMiYILs16YgpWu7+oJM2Bd5aMCk=
X-Gm-Gg: ASbGnct0NEX9O8l5nCDq77P+8FB0z/SwDsqe+NP5f1Yv+qPfI5DCVOWh2gkYxRiT9O4
	42znVE8CgnjDXnWultesqkwmVBFstF9MB0nnzBuodc40Wn5anA/xFfrceWn9NEj7WmnyOQ2Jqin
	VlwP/mqqJtb733nNLvN8xciBdW6WBryCJ52cKBS12pV+7K6Bji5basKoBf3jHi3WZf3Hn4
X-Google-Smtp-Source: AGHT+IHdE+IvjKPy/H/187X9ESbJuc1W239VyqGDem3VC44hAK/6v4MUY7Ogj5IPUx6y6MopfRCWPyu9jEmvdN+2VSY=
X-Received: by 2002:a5d:47cc:0:b0:391:23de:b1b4 with SMTP id
 ffacd0b85a97d-39132db0648mr15300763f8f.45.1741734958355; Tue, 11 Mar 2025
 16:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250311141245.2719796-1-liujianfeng1994@gmail.com>
In-Reply-To: <20250311141245.2719796-1-liujianfeng1994@gmail.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Tue, 11 Mar 2025 18:15:47 -0500
X-Gm-Features: AQ5f1JpTXjTmVT-uFEQ-cp0wVYjs646Qn0g9ep9yELCKIu65h4ws4boyJnIroik
Message-ID: <CALWfF7JfJxudKKfvOBXiLOMijUi+xZCAUL_WRsB-UxpV3XKDEg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix pcie reset gpio on Orange Pi 5 Max
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: linux-rockchip@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_161601_239077_03BA4DBC 
X-CRM114-Status: GOOD (  18.14  )
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

On Tue, Mar 11, 2025 at 9:13=E2=80=AFAM Jianfeng Liu <liujianfeng1994@gmail=
.com> wrote:
>
> According to the schematic, pcie reset gpio is GPIO3_D4,
> not GPIO4_D4.
Thanks for the correction.
Also applies to the Orange Pi 5 Ultra.

I made the typo when starting with the Orange Pi 5 Plus with "gpio3
RK_PB3" and changed both "3" to "4".

I'm guessing u-boot has already initialized the device, otherwise the
problem would be more obvious.

>
> Fixes: c600d252dc52 ("arm64: dts: rockchip: Add Orange Pi 5 Max board")
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Reviewed-by: Jimmy Hon <honyuenkwun@gmail.com>

> ---
>
>  arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi =
b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
> index 6e4dcd8fff26..f748c6f760d8 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
> @@ -64,7 +64,7 @@ &led_blue_pwm {
>
>  /* phy2 */
>  &pcie2x1l1 {
> -       reset-gpios =3D <&gpio4 RK_PD4 GPIO_ACTIVE_HIGH>;
> +       reset-gpios =3D <&gpio3 RK_PD4 GPIO_ACTIVE_HIGH>;
>         vpcie3v3-supply =3D <&vcc3v3_pcie_eth>;
>         status =3D "okay";
>  };
> --
> 2.43.0
>

