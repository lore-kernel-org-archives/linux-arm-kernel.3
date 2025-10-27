Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91803CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 01:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0mq+S0SSwJZlAF16bAHUInjGI8BPuKNwrhS742qQjU=; b=ALZRx8m1dbWDhGBinvusADOm0s
	9q91Ic0FNb6667F7vAT/infr2wcqRV2waS9hJlzMwXCqn8q+Yvgkv9k+nEfuP++b7xeTfLmrdN6og
	ZtbFuj418ImJ4QIEOLUKLK0tdwXJIMa1YHwvZy2Uqq6CYwLH9uwEJgbhuQ8czKlAubdJWBfXl5xh+
	pWA4p1+lYYQ7dOogK5spYH3pY477/DRQbGlw9pTZgEnZmJ9pOP2p/UAT7zyNfYQlMCoXt2j7SU83k
	xA/20U3d6sJ/jdVjYhfCYzmb1+h2waoxwvZIHDXFJVgZY6LPllhkILrkozvrNORL+0vOdVd6Gqw2+
	acoiLqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDC4r-0000000CxBM-3uaE;
	Mon, 27 Oct 2025 01:31:17 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDC4p-0000000CxAy-1XFD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 01:31:16 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-586883eb9fbso4976655e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 18:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761528673; x=1762133473; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0mq+S0SSwJZlAF16bAHUInjGI8BPuKNwrhS742qQjU=;
        b=dBeCghAeVnDR8cxpJ3nY5ARVsgtO5Gznh+2xxpOVH9vvgSGK3DU6OaLw/3W4rcBRBT
         eemHns85cI6R53CxsM6ngRLW8N/jwK/dfXJY+gr2/S8HijVYSgNVPH+pMyETgQVUPOW8
         hmkwq4ymEySQmSkQ0RfWHRLSjNGOOyS7AeoVfd4abkGH76kyFf1Ryl4vPXI2S31U+pRQ
         vfNb17xrNsfZdUD5DpRF1itODGCSWHGKUzp3JxUkqfWDkqVBNxVj3sVlMJsEekMu6wFv
         LMcPcSeEjyFHddNdVCBFWbVj4WXpigsJqZoQluYDgcGUentqAw/g+kby+qLFG9qS5BMx
         hfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761528673; x=1762133473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0mq+S0SSwJZlAF16bAHUInjGI8BPuKNwrhS742qQjU=;
        b=YZ2zEoX80LkKSTDn/w22hb1YdCW4TIwNRQFWhoCow4Xc/8yK5gWRckRYWEoBvsVwWk
         DZ9AVuvv0DL1NDMM2JvGbXVhttron5CsSFXNFih31Y8aEFPevsnL++0PelNBkCPIPF1W
         r3JtADJVuz9AdUW24nadckbyhLYWLiYR2NHIWhqScusj3193AWRi4ba1d16E9w9dFLoB
         htHh982eum1O0S+SjpY3IzU3N4g9HfqwonwpmELa9uuUAY2ZJ/Eu6fw9svYq9cW5GqpG
         qFVs7kmM9rSqOInnufGjA3gPPtuL+HarQWiN+jNzs+oLwyoqaaLStvgnBumYmwiZseU8
         rDXg==
X-Forwarded-Encrypted: i=1; AJvYcCXA87WbrilLWLfUFFSTpoA3UFuu0ICT19Rrh3Sf8LVuL1QX+/H//aUczFcrVX2E3XP8GP8mHQ3H11uYSS8BLfqf@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ1NXaozZtKUvy5H/m1q0cwHspJNIPEDHTTCRiFMcvJN0X+cvV
	Y2FKpKglmpVWAQ2Ti1PzIIZkScJvnz8/hYKk9s4oN8Lkp252wCZ2fiJwPD97c0T1db5emUVXbf9
	jMyQw1hMezcEwbPJ1Mf2SEZBSHYBhz/c=
X-Gm-Gg: ASbGncsfWQhsdtvWCN6SwibkqPVhnZmI4GCWTTCeqXK26GJmvvR+L5t9zxsRuCAn6DN
	AdfwwuoYVyv3XlcYEcXJVw20JYt859G8UJ8Qvx1/fbYoShbaDG+vPzLi7pfERCYB1jl7alpoT1S
	pEBRHznEH1C1IboXBLYClSaUV3dhJFnKq9Qw8AHY9MdWifChTE+aoI5S/tXHqSTYneTRim3RI2W
	e8G8+P6BS0e0HunzFyxAg8dzJcLZP/pNeEEjgTXIouoUNmq0RFx4PKKuPJjGcOkJEjuMh7jqaHR
	2aCfam2mhn1csNxLVu41E+9BvEQ=
X-Google-Smtp-Source: AGHT+IHF8zYNH9eypIhSI26+bPKx1nLvnQNG4yomtu1EBpIHmW05juPCXzFQHtyIUt4DQWHwS9Ulh5ysegd2cmPvh6Q=
X-Received: by 2002:a05:6512:e8d:b0:57a:311:3234 with SMTP id
 2adb3069b0e04-591d856f103mr12296255e87.55.1761528672466; Sun, 26 Oct 2025
 18:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 26 Oct 2025 22:31:01 -0300
X-Gm-Features: AWmQ_bmu-eo2lHZa39sy9y-lchMDaDzmYdTAdeuJ7Cb4yBT_ijmH0CspguIjQAw
Message-ID: <CAOMZO5B3p-mpYqmj=OgH+=pWstgjVf5xJOX8SB9GGYdA3h8nHA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Daniel Scally <dan.scally@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_183115_445426_85ED0226 
X-CRM114-Status: GOOD (  24.72  )
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

Adding Andrew in case he can help with the review.

On Sun, Oct 26, 2025 at 9:29=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> devices produces an interrupts storm. Disable EEE support to fix it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> The exact reason for the interrupt storm is unknown, and my attempts to
> diagnose it was hindered by my lack of expertise with DWMAC. As far as I
> understand, the DWMAC implements EEE support, and so does the RTL8211E
> PHY according to its datasheet. What each side does exactly is unknown
> to me. One theory I've heard to explain the issue is that the two
> implementations conflict. There is no register in the RTL8211E PHY to
> disable EEE on the PHY side while still advertising its support to the
> peer and relying on the implementation in the DWMAC (if this even makes
> sense), so disabling EEE is the only viable option.
>
> This patch is likely a workaround, but it fixes ethernet usage on the
> board, so it's in my opinion worth being merged. If someone with better
> knowledge of EEE and DWMAC, as well as an interest in getting it working
> properly on the Debix board, wants to submit additional patches to drop
> eee-broken-1000t, I will be happy to test them.
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arc=
h/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> index 9422beee30b2..4aa47f71425b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> @@ -102,6 +102,7 @@ ethphy0: ethernet-phy@1 { /* RTL8211E */
>                         reset-gpios =3D <&gpio4 18 GPIO_ACTIVE_LOW>;
>                         reset-assert-us =3D <20>;
>                         reset-deassert-us =3D <200000>;
> +                       eee-broken-1000t;
>                 };
>         };
>  };
> --
> Regards,
>
> Laurent Pinchart
>

