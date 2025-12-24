Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52966E7544B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 13:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbu83KDb8EzV5fBCpVF9Ofv9QvuINTQfWgSaYI2v7SA=; b=N+GNhvLw1Zq9EbJTAEc5AVD3Cs
	tQA2WOR4871sZ1rr9WFPNTO6wN8/oR8VN1BUps/St+m2x4Gdh8nwD/oeH2UygWTYBFA1NO834Pggp
	yycPlq7jPyzmxxdLZ6XzmgVf+65ZNwIEKrW4+JQJyrX+hF/eUxxuEaFJMQWAyyj2ehQEIN2PKIny5
	FV5sVYdFFID2X38oCcD5ghlfM+8026DTgaETKJef2i011yJ5S1knQ3To/uqTkiK8be/SSdUdTJ4Hk
	N0etnyn5JXlsyfsTwCQLVLYyydv5Rtl4H5Dprzbs7dscHVzojth4cPAPHgyzQRqGITpv4ofvmEPHe
	XS52YFmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOyZ-0000000GqtE-2S57;
	Wed, 24 Dec 2025 13:32:27 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOyL-0000000Gqso-0Dss
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 13:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1766583118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xbu83KDb8EzV5fBCpVF9Ofv9QvuINTQfWgSaYI2v7SA=;
	b=DEHZIvg4Ki+CGC9dPeVP65atqr2lD/HbbCKx2IgDAZyJ++LHBm6mGdJpLvqm1yVa6wvdCo
	e33UpVsAOyw6MNZnD9cFpL+K1heqU7rD5VAIJijN9F4mwjYwoixKdfDqpvXni9X7q/WsRp
	D55qOu5YZ0UXQidG7niJggEcy9NMSOc=
Message-ID: <e661a947f0cefb1651dcd3f7f57855313ad9fd7a.camel@crapouillou.net>
Subject: Re: [PATCH 3/4] mmc: jz4740: Fix Wvoid-pointer-to-enum-cast warning
From: Paul Cercueil <paul@crapouillou.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Aubin
 Constans <aubin.constans@microchip.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Nicolas Ferre	 <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Robert Richter <rric@kernel.org>, Andrew
 Jeffery	 <andrew@codeconstruct.com.au>, Adrian Hunter
 <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers	 <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-mmc@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	linux-mips@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, 	openbmc@lists.ozlabs.org,
 llvm@lists.linux.dev
Date: Wed, 24 Dec 2025 14:30:56 +0100
In-Reply-To: <20251224124431.208434-7-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
	 <20251224124431.208434-7-krzysztof.kozlowski@oss.qualcomm.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_053221_216185_BED81B67 
X-CRM114-Status: GOOD (  11.90  )
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

Hi Krzysztof,

Le mercredi 24 d=C3=A9cembre 2025 =C3=A0 13:44 +0100, Krzysztof Kozlowski a
=C3=A9crit=C2=A0:
> "jz4740" is an enum, thus cast of pointer on 64-bit compile test with
> clang W=3D1 causes:
>=20
> =C2=A0 jz4740_mmc.c:1055:18: error: cast to smaller integer type 'enum
> jz4740_mmc_version' from 'const void *' [-Werror,-Wvoid-pointer-to-
> enum-cast]
>=20
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/mmc/host/jz4740_mmc.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mmc/host/jz4740_mmc.c
> b/drivers/mmc/host/jz4740_mmc.c
> index 6a0d0250d47b..6a3c26b7c82d 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -1052,7 +1052,7 @@ static int jz4740_mmc_probe(struct
> platform_device* pdev)
> =C2=A0	host =3D mmc_priv(mmc);
> =C2=A0
> =C2=A0	/* Default if no match is JZ4740 */
> -	host->version =3D (enum
> jz4740_mmc_version)device_get_match_data(&pdev->dev);
> +	host->version =3D (unsigned long)device_get_match_data(&pdev-
> >dev);
> =C2=A0
> =C2=A0	ret =3D mmc_of_parse(mmc);
> =C2=A0	if (ret)

