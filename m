Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9315FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 20:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUxRiLX4DyVPlrMacNkPsStsx8cpP9d0LZJXAgp6S6A=; b=By2l8/GlBNiLF5jFLERTlefQLd
	auDj9lNeGkSHHalbHk2FsqJ5iZjH9c2OpHc5zYmPNDUK6xtFgjtG4zgmelyvfl6vi/J1g7tXwR20d
	ciwYufQxDjxuCMDw4zTTNeVLD4xOL3vhakqHiycBHYYZ4Ncr5Ufzj825MqXhd3US8IjY680izEnGb
	y27uw8YmCa5eZ87VSU7loNJPjhlY7/EmfZy8diSwZAt4s6Of5BIn2x0syNjUHWrV4eC794dntlIgT
	pruaKNa3KHOtn7qVRGazyD3gInak0EZ+MlS25MkFI1WR5uGChPsJtImUhpr0llEId5J21ZOT5CJ+V
	Uldk5Ggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlDG8-00000002oGj-1GVT;
	Thu, 20 Feb 2025 20:35:00 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlDEd-00000002nwK-122i;
	Thu, 20 Feb 2025 20:33:28 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38f378498b0so1160808f8f.0;
        Thu, 20 Feb 2025 12:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740083605; x=1740688405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUxRiLX4DyVPlrMacNkPsStsx8cpP9d0LZJXAgp6S6A=;
        b=d6usahXmLaQfmCaHnj6/cgTVz+9UJaoAavQK+ED/FkdNacrtI7/3dDteF8h0OUHEWP
         V8vq0ARPfZO8kmk+ukICz+bKQfGeXX3HdiAxHJaL4saJsuzn1tW8Hz7+jwZ/NttYCi54
         eaNeil679giSPSvzHCi1dbEU9ww1drcwbXtpfIZkNpEKSDzSdwtwiUUlVHz+hzHJNf3h
         5gSrPUjQXWzH88rh2stIupm9FiIc3S/oeVxPIA/uaN3mrJRMkrE+I+omhnS6s6VcHQeM
         k1erB7WscGEeItXnG6bPK65iqmTIfdRTIDWhNKgTWsl5eBsQYiy6qM96kf7AP77ALlRN
         cJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740083605; x=1740688405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUxRiLX4DyVPlrMacNkPsStsx8cpP9d0LZJXAgp6S6A=;
        b=E/THRZpIrSxxURYO53wobXTFaNYztRxCijEKmxPOfRAEW5xszNvYS26IGRR8GmlMre
         UGJ33skM+y+0JNXsS0tRhxOy2R5cKZyI9F8ECest4ZE7e4qR4OhyMgJEvitAbTl2ZVGt
         x8j5wkh7HdeN69fRB0G7wrtp9g63AQLy8SpwXDgS0oeG1/cUbvrSdB96EH3ZZC8MsbxN
         WEHKAJKJnO6xddYQX8c5fguORXzDWxVu5kM/ndmOBwfvCDZAbJEq6JxRLJXbcQV6XV5w
         Z3e9dNGTyR/qyPYd6jCKF60HwJ/VyHpW3YgkLKefJoWTx1ab6MfXjnFTwGhtn/3Jhd2d
         d35Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyRdvAKr4g/D+HffAWb1JdAs+l5gSZowU/T6dtNw8uEgDXiJiRGS1J1D16uxMP+SADV9gonEbTOPjmaMLGVnQ+@lists.infradead.org, AJvYcCXGehipSsQBCpsf1DvQIj9dv57IAjRBofh0AeHh3lgtyu4vczIDPKTBQx2R1n4cSLkaDbUAbUdJPw6Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwKXHl0Ez+AuPRz+EpaQA1mP2dXcTVkQaML8TgVldUA1SGXjXkK
	ISSIJY5OPBQLbwam6v7y5pZbVyOkJ4WFIOuQ0Hm4CSbvWjt0nu2DXJZnrIac0Hg=
X-Gm-Gg: ASbGncuqwbh6aW27BurlEhwSXafR0S77oiNe+xYsWqzpb8AZYLOI4tSDA2/p/qOXKJW
	9AQa1uvUCamta2+Nt93Sz4AEoQUx0Ozll/C5LGWcdTAtW7Wfbp3BiPH5rejDhb8Xr8hEuQsLdAn
	CaIBbAPc6HJikfYWcZLfe1GEHaoo7hRU1ksAd8NNwAG3d1BGzUgfOgE/eCl/aQwn3ZikpoIEeIa
	aJ6phWpxhM4kZF8D8QE60dqhXSzrnNkgLvEZ+y39JsW6THwk5QcKrqjIOP2XMg02SoL9uyiIF0T
	tr99xOz9dIxHgbhVHtC+7LqI16oFRF3Z0+ZMyR7TA0nBJsFgIHpW0Qr/QeKjG2I5MqM=
X-Google-Smtp-Source: AGHT+IG3ll1f11+UZwtw+Jor04/g1jCvuU4qYpcPBlXzdyIiMI+7ByMCtbhip+csjv0HRfpmtu7BRw==
X-Received: by 2002:a5d:456b:0:b0:38f:4e50:8b0b with SMTP id ffacd0b85a97d-38f6f0630d5mr472733f8f.31.1740083605337;
        Thu, 20 Feb 2025 12:33:25 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4158sm21289979f8f.3.2025.02.20.12.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 12:33:25 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Philippe Simons <simons.philippe@gmail.com>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 Philippe Simons <simons.philippe@gmail.com>
Subject: Re: [RFC PATCH 2/3] phy: override dr_mode for phy0
Date: Thu, 20 Feb 2025 21:33:24 +0100
Message-ID: <2428472.yKrmzQ4Hd0@jernej-laptop>
In-Reply-To: <20250118102207.9339-2-simons.philippe@gmail.com>
References: <20250118102207.9339-1-simons.philippe@gmail.com>
 <20250118102207.9339-2-simons.philippe@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_123327_285274_819D12F8 
X-CRM114-Status: GOOD (  17.72  )
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

Dne sobota, 18. januar 2025 ob 11:22:05 Srednjeevropski standardni =C4=8Das=
 je Philippe Simons napisal(a):
> PHY0 mode is fully determined by the selected mux route.
> Ignore changes requests from controllers.
>=20
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>

Some context is missing. Why is this patch needed? Which scenario causes
issues without this patch?

Please also provide cover letter to the series, with "big picture" explanat=
ion.

Best regards,
Jernej

> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinne=
r/phy-sun4i-usb.c
> index 24fbabe7a..f163b355e 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -544,6 +544,18 @@ static int sun4i_usb_phy_set_mode(struct phy *_phy,
>  		return -EINVAL;
>  	}
> =20
> +	if (data->cfg->phy0_dual_route) {
> +		/*
> +		 For SoCs with dual route the PHY mode is fully determined by=20
> +		 the selected mux route (i.e. USB controller to use).
> +		 As both host (EHCI/OHCI) and peripheral (MUSB) controllers uses
> +		 the same PHY, both drivers can try to set PHY mode.
> +		 We need to ignore this requests, but not report error in case
> +		 of valid mode values.
> +		*/
> +		return 0;
> +	}
> +
>  	if (new_mode !=3D data->dr_mode) {
>  		dev_info(&_phy->dev, "Changing dr_mode to %d\n", new_mode);
>  		data->dr_mode =3D new_mode;
>=20





