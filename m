Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383CB106ACE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwiFGJRSfB6hzdknB7fn9cdgGxf64BtP9o6kcYSkeQ8=; b=DRyR1iUIx0cPcNnB0ObTiBolrD
	UDQI5anuKMtLKVO08c8tV3F7oZN6xy9Pf4FnaM3/drPGTVO6SfovPuvO7nS5M40s3zmaZtRbOmouf
	7dTLZsjVkNaCMChuxYpn0dvkKxYAZNinkzZA/hY/ihe6V28Xtmj733HDmbdN8LtgZR/atorLd312D
	VZqm4BMrRmQJblVGijNXJWfSf8RsVrqU0kA8nGmUm2L7afzw0n0o31x1Y86jUu1DNyIOpGtu6uFqT
	hnN6TeGThezFy9zbovIHdmOxjqja4flUx4Cm5ojEF6HRgJyiyFeDURC0oEHgbe1uiaAXqdihy2GTy
	ec81FXzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lkF-0000000F6qr-2VsH;
	Thu, 12 Mar 2026 19:30:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lkE-0000000F6ox-1HaK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nwiFGJRSfB6hzdknB7fn9cdgGxf64BtP9o6kcYSkeQ8=; b=OG0k84C/0y6fdJL2dEVjkrF3CL
	J7iCij0NwktxL9g5KS10vICvE9PdmLoktHzDoSHaU+X58XOadHHCVsXPK0OocMEXR06TesHS9oII6
	Z03DxR8ZtTzZxqdqrzviqnpW3+gbO3YVEFKThA7BsYTL/nb8iocE6PByXYSr+zXQ/ZpHTNf5Zinsx
	zp78dfSZuixgSNuxQVGKGPdqTi4R5zCuPqdeJN5cd+zQqedXMD2TA+7bdjI9y5sKrys/RJbnNvF+U
	wAfCyrvHs3cUuzHOCk+pR3jn80eMbdwz0YOueYxG17r5mgsJC7hBTGQ5wl384jwpV/lfqKfCKJ6RU
	RKc+rFDA==;
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lk9-00000001tkU-2d2Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:30:52 +0000
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4672076355aso1009221b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343847; x=1773948647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nwiFGJRSfB6hzdknB7fn9cdgGxf64BtP9o6kcYSkeQ8=;
        b=Y2VP6zkgTzOWNbeOz4YGiTOy2+QKHihY6nTcUTwE8C+HcB1YigAsLlPiFz1eiFxSlb
         OWvm31GIsD+kVWeh2me4jIMU1y9ARSMI1Nl7fXew2sAojH+IVZC7qP26F/NjvRpWVVew
         ZKtPUDkpRNVRYM24ae3iyoUKUCg8K/ACkPkXc3Ggr1fjFJgCB8ecF6CC47gGo3y8mIDT
         7RBEXZdoVffFDFMfTzawhIZ5SHj1wsUeZsOZiaaMONX10k7BGATuYEFd3PeS4NtRA/e1
         HjobEn9BCMNHnTgDBlFf+0hkPRlTNC+x3RElzrm/Kh40IS5hN+mKPN20qTnURad5t3H0
         3Frw==
X-Forwarded-Encrypted: i=1; AJvYcCWzo2oI+x+OF1g+zOyjoGwFElQjm1UUrgZSFrYme7+54wFQTggZvFgvnkOaIFcWLcyVq99jXtkwRkx1dkXmmQ4l@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9+KM0O9VxWowE+xDpy1hAzxQHeVnh065cDT/uZJ9UUodWos8V
	zFWGBp1Rxy8964rzpECszYOBgy6kol+8UoVyEaOpMjfSIbeZgnNcxHlGIt61TA==
X-Gm-Gg: ATEYQzxPXVeYSBj2NwJmiLisdu8XPfALasKH8jnm3StLN/m1+0VC2k+aQz+E/Sp7GZB
	lm3SF+vmEUhiyiUtWUx7UNdgTTY0GAw69PVobUk5ozq1DQ1NFAE/IJWib3gdXhO0QOYnet99IoX
	3OH5zu0gLPGPpIUWTuItHnYWhYBqbM7ABhf5T4aSBFhB+5JVAWNJVkCL2dqRgHPZ7we2ZUFLDhf
	TP1kXWRh3swXlyElZvLKelp9Lkt20wn6s+XmDyn5svGAOd5FKgeWKXrBjMprB+nK/VJiCbEIpCV
	j8AwzKRDDOnfSiGN9XTjbJvCjjJpHgEdOx7eTrsMqcWzbVjB+NUbCd08CEg0fE6MFUaYP7h3MJH
	of/gJSY4WaBeGx/MSDTQQRddwwceALZulWYDqNqFMgXXsL4U2GObW2mroNU/MHJSgs/kAaWaTaF
	y+/yMEKdn4A3f1JF8hT9EC8cZ8XSDAqcWG7j71YPx0JjFzxhuMTN4Hu9QX2wnMDMHqipnY+iual
	JSowwWf8lLsJk3wojOGSxtHiA5NVKqNsgOros79Sr682zqTKgXQeOiCNDAw+eC+9Cubf7OH1nlZ
	uJn0NUNM
X-Received: by 2002:a05:6808:4905:b0:467:1462:a9b3 with SMTP id 5614622812f47-4675753d060mr230462b6e.38.1773343846688;
        Thu, 12 Mar 2026 12:30:46 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4673415c264sm3474883b6e.5.2026.03.12.12.30.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 12:30:46 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d77b179b52so939175a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:30:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU25WolJSTucqeILYbBubYuNs7ynKetlBHwQF5Qz0a4FbDrAa8uEysdCbgMeJrTlG4xbj4ZMa6Y8/YlwVHAZf2V@lists.infradead.org
X-Received: by 2002:a05:6830:6508:b0:7d7:44f2:cf6 with SMTP id
 46e09a7af769-7d782574aadmr414436a34.22.1773343846017; Thu, 12 Mar 2026
 12:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <2838895.vuYhMxLoTh@fedora>
In-Reply-To: <2838895.vuYhMxLoTh@fedora>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 12 Mar 2026 15:30:09 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-KwNNGoi3mpPeNq3Jmtzj_5seuj1Qeh2_1dt994iCJSA@mail.gmail.com>
X-Gm-Features: AaiRm53c1qZCB280A2IGi5tKHEffuGeO3K6uS7gw8tLpnvn5EhoDD4Js_TJQtX8
Message-ID: <CAEg-Je-KwNNGoi3mpPeNq3Jmtzj_5seuj1Qeh2_1dt994iCJSA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: apple: fix spelling error
To: Axel Flordal <axel@flordal.net>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_193049_691162_122657C8 
X-CRM114-Status: GOOD (  15.61  )
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

On Sat, Mar 7, 2026 at 5:29=E2=80=AFPM Axel Flordal <axel@flordal.net> wrot=
e:
>
> Change "configiguration" to "configuration".
>
> Signed-off-by: Axel Flordal <axel@flordal.net>
> ---
>  arch/arm64/boot/dts/apple/spi1-nvram.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi b/arch/arm64/boot/=
dts/apple/spi1-nvram.dtsi
> index 9740fbf200f0..d2720b307774 100644
> --- a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
> +++ b/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
> @@ -2,7 +2,7 @@
>  //
>  // Devicetree include for common spi-nor nvram flash.
>  //
> -// Apple uses a consistent configiguration for the nvram on all known M1=
* and
> +// Apple uses a consistent configuration for the nvram on all known M1* =
and
>  // M2* devices.
>  //
>  // Copyright The Asahi Linux Contributors
> --
> 2.53.0
>

D'oh! Thanks for the spelling fix!

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

