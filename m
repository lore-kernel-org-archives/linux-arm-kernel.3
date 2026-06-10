Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D54ECD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 07:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHfSgeA/fGjDjbLrs9feaMOJjE/ZZnjX2Fhpf1TFZoY=; b=Oq3ismWdJKf/u3MPh531LVNyxC
	Ogrg+ed9Ww1QfZwfRRukN7wt2M8LB9BI1dn9ar9qyB2DLnKw7b+jqGXE8sdROcPPB+/3Djte7QuPF
	3plgPgMmZ+RHfilnYH03IJiU7u2OM3tU3jvlyhmaWATWp1E+cFICyP/vZItvLgdfJMODadXBc59wa
	YjShi3RUjHmZrxrrQ0XqVmj/HDS3mlHclh8Wcil9jG714i6jnkGBGbVApSdr7hGJieVNpTmc/gnTX
	pKQoU+z1FOsGIjCDY8N/46EkZ23LGpcqhwW31v+prqO+/Vy5VWNCd0CAaXzMx6LASZJTCBbuvsK9L
	CAbruDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXD6B-00000006wMU-0lyY;
	Wed, 10 Jun 2026 07:11:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXD68-00000006wLm-06CK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 07:11:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so4383981f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 00:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781075494; x=1781680294; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NHfSgeA/fGjDjbLrs9feaMOJjE/ZZnjX2Fhpf1TFZoY=;
        b=pLw9CTeR2IEQ9MEQEcW7L0MNF6Q0rasimKygelgrj/JEGWdgoEoQa5ozMYJhZ+l51u
         c2Lthwl9OXtguxuyt3AMySaR6nRNgoukhaICT9Ae2O5M4HL/MjSsnIKZeSZxCJYlxCvp
         AdbjK0lHeOBd1HGTNSnXLO4iwZKdB39pbXtErZibxE/a9tgKMs76uuuQ17N8z8jmHlCl
         hcWtuFB+ODkx5j+crK2T2+w+qQmfXFKf7A3t84HMCPixxQ8CdjeX8J9s4HfozJCxfSfD
         SB5J3d/3XjB+UXO1pCRaOSyOHseDV4SGiykqkueFQxCXJUOlKHdkAl+bDGSQlIEkbfla
         v3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075494; x=1781680294;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHfSgeA/fGjDjbLrs9feaMOJjE/ZZnjX2Fhpf1TFZoY=;
        b=W1vhbPJBunx+uXDguX1XLapBPEeFTqrGCfSnFGJW3Ajy9oiMD0aleEv4OI1ZAYi14c
         AcZSLVna4OtKHlxBebfi0BcybUPSDF2lOd5yydJoLOfMvFVmHeKUapyIVBcfYbAg3fW5
         wldO7uLtovmrJuAYZS82WtQNVMXQvg6pQDj7IoQnFJ1nH/+8sNCQNs+Y/Wv6YhF2JIDn
         IOpmKzazKUA7fTE9DdgydqbWRXWRs5P1DggcV2f2c/UZxXUlimEtLxMI9owFkNAd6cn6
         GTZyRHjmdW96kcO/ReECOsr1mTEyiRIfmb8qIrLg+pXHjkEB3EQHsAd1LQrq2M/Rm+Oj
         DP9w==
X-Forwarded-Encrypted: i=1; AFNElJ+/zlK95WvL6yymHL9dKmC+i9HtOStcetbptH9NKTgwKyqvELCPkv8FDhVIjiWLMFVLlZxTs+4Etvel+ntqLDRP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx59qrlJWI2v0zX6byAwxuUKLpfKiF/SA44cFySzsRkvQvBX87I
	L1qeUYmz2yV+hhMyrexrdmRG2EIfjGBsYYWOPEQZwv/C/pPxVUSqePc5AHXQywpzi2U=
X-Gm-Gg: Acq92OGGgwIzyEGU0J6LeFFGqZnYeGYFevSPBs93SgoejrMbqq/isTheIGsNR2diLSt
	BUHbfsjAQLgFRVqk9pP0zTdO+JPD/nnMMkmQx6Jp2i4GfjbB8VGRzdMPqhY8J+MA7INQQR09RgR
	HF+zQgXyrO8EM3Cq7M6fP+0GW1aw/7v1sQrKlk2JlGIrrEXlbifam3/DoYOKxrYay0x7XojPXzB
	1M/27W+76BXd9rK/eg1YiW/SIg6hE6SGHPFqAMmLrWSsseabePy1ZZ5sgQirJJdLjLIQ2i3fdWu
	GRkXHq36pGeG3CYlQeRdIfEizpNlw6rp0WMljkidoQYvFSN+2i+b7TaTnKnNsnM7j+1I1/Js1AX
	Ldx8tl9oXs7yOe/H74Q8PJDeFxMaB3OacepKdhiiZY5KnaGXOitu8NkMPDYN163ZGcRM0BoFLDb
	r65I/DO6Q1h4rOtOzOAdoRXNIbjz/VzyG6Jto/fzgv
X-Received: by 2002:a5d:4e03:0:b0:43d:740:fb37 with SMTP id ffacd0b85a97d-46030641a81mr28093929f8f.24.1781075494136;
        Wed, 10 Jun 2026 00:11:34 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:6881:1355:3b75:b347])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcae2sm73998699f8f.6.2026.06.10.00.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:11:33 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=994575abcf1e9190cecd15ed8f5aca86c3a1ed0abda2c617779b5e42dcaa;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 10 Jun 2026 09:11:22 +0200
Message-Id: <DJ56KCZMDJ35.3CKN0VT59QRJV@baylibre.com>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, "Nishanth Menon"
 <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, "Judith Mendez" <jm@ti.com>,
 "Daniel Schultz" <d.schultz@phytec.de>, "Andrew Davis" <afd@ti.com>,
 "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Paresh Bhagat"
 <p-bhagat@ti.com>, "Bryan Brattlof" <bb@ti.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Devarsh Thakkar" <devarsht@ti.com>,
 "Beleswar Padhi" <b-padhi@ti.com>, "Francesco Dolcini"
 <francesco.dolcini@toradex.com>, "Stefano Radaelli"
 <stefano.radaelli21@gmail.com>
Cc: "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Sebin Francis" <sebin.francis@ti.com>, "Kendall
 Willis" <k-willis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, "Hari Nagalla"
 <hnagalla@ti.com>
Subject: Re: [PATCH v6 04/11] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com> <20260609-topic-am62a-ioddr-dt-v6-19-v6-4-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-4-16afba97fbe0@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_001136_086650_F2B029AA 
X-CRM114-Status: GOOD (  18.22  )
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

--994575abcf1e9190cecd15ed8f5aca86c3a1ed0abda2c617779b5e42dcaa
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue Jun 9, 2026 at 8:56 PM CEST, Markus Schneider-Pargmann (TI) wrote:
> The wkup_r5fss0_core0_memory_region was reserved with only
> 0x0f00000 but the MCU SDK linker for the wkup R5F firmware on

This and the var-som patch incorrectly mention the reserved size to be
0x0f00000 in the commit message while it should say 0x01e00000. I will
fix the commit message with the next version.

Best
Markus

> AM62P defines the DM code/data DDR footprint differently:
>
>     /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
>     DDR                         : ORIGIN =3D 0x9CAA5000 LENGTH =3D 0x1B63=
000
>
> which results in an end at 0x9e608000. For this memory region which
> starts at 0x9c900000 this means a length of:
>
>     0x9e608000 - 0x9c900000 =3D 0x1d08000
>
> Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/ex=
amples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti=
-arm-clang/linker.cmd
> Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boo=
t/dts/ti/k3-am62p-verdin.dtsi
> index 7ee894d59113aa727d41b7ecd6b2bc7e12760823..8a5ff5c457579c7b1be7157d2=
35fd4b4e5c6af11 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> @@ -170,7 +170,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 =
{
> =20
>  		wkup_r5fss0_core0_memory_region: memory@9c900000 {
>  			compatible =3D "shared-dma-pool";
> -			reg =3D <0x00 0x9c900000 0x00 0x01e00000>;
> +			reg =3D <0x00 0x9c900000 0x00 0x01d08000>;
>  			no-map;
>  		};
>  	};


--994575abcf1e9190cecd15ed8f5aca86c3a1ed0abda2c617779b5e42dcaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaikOHBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlPa
gAEAyrybqnS6hv3Ovek0j7b14FzBa99hKAVYVQajdPf6WZYA/jNeWkQ0ZfOTfw7C
HBBAgvhweurSyFbfEsO3R2u7jS4M
=GC8Q
-----END PGP SIGNATURE-----

--994575abcf1e9190cecd15ed8f5aca86c3a1ed0abda2c617779b5e42dcaa--

