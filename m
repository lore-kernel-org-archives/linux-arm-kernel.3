Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72854C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJPUilpm25GT69DD5Yt1sEWK/7fI6b7BM1tjdZsDCdE=; b=1BdEmvyls+XhJ6rQyBdLBHNVF2
	k1f89VcKuhl7JhAI/kE3okxrpeeCyUlAtLx+jABTLuLd/v4igNimJ5Fdw2uoX+EeeXGKFLegJFqOg
	PIl5hy24mZ5GGrJ8l2hBe4x1VNb3rQigcZ1IJ+0DOcMGWBWr0eUmtEYnmAwgi0qYh8G/FDCfOkThZ
	hz2nD+cGkNuEJDCHTp+Pzxsilv3Tinc8/ljbs9LEyYf7CKFlA8wwaKz/CpOsA19RDfw6dWaNpMBLy
	3KHsSvVpTJRdJZIwhHAluxO0C8EGV9MipmtcqNIbcWQXQUldJut+Y+ul3k2zQpd4Tl9u6qPDvxb47
	YNLtjstA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iy3-0000000Frww-0Ud0;
	Fri, 18 Apr 2025 10:29:07 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5isc-0000000Fr8x-45re;
	Fri, 18 Apr 2025 10:23:32 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30bf1d48843so15025301fa.2;
        Fri, 18 Apr 2025 03:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744971809; x=1745576609; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kJPUilpm25GT69DD5Yt1sEWK/7fI6b7BM1tjdZsDCdE=;
        b=LkPwA7zKAfjum31KFgs0Kei9K+/SU9TK9srF0c/VPbATxX9EgdYLutqPNyaKjhbowk
         S0A2FxYmASct3uPEQL4fnEnDvT5/IBBlfqbkEdF7Z8fxBEiea5HHemwn5LJ3Mw6TZoy6
         7X4/02/osGx3do50J6t4tuiFGKsUnWv40w2V9V7+rD+JY8pTzrBmyEvlq6Xy8YrteE4c
         4LnlZwATeNIstyR1nDguKqE5+sGH6vnqWva2Nt4HuLQOdJA3LuX8cDxGzkR5qzoTEsB9
         BF4uvWKwSezxL5tJZK5Vj53tCDsXMPU/oH+sIdCZyjysEg457UNuCOEnGrOVHOvCtZ9p
         hHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971809; x=1745576609;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kJPUilpm25GT69DD5Yt1sEWK/7fI6b7BM1tjdZsDCdE=;
        b=pTEvtz6709dT1SOlRZLHYPclCAsYRoXKijjHhBBetbKpP2H495IrXM5Qslu/HsS42Z
         o7e2scUQ9dUgh2fC67H37aRpjoIzpKZLhhUwVS36VTPu5MnFZSovfOLfWxtfODjn4qML
         TdmVUcnTUy4DKX1bvmw6esJOVDdin8Oe2f2zvv/qPG5ODAOWyGw0YEfMkNUXrMuPDDRR
         j2C2P6yQu8kIfkN+/+bK9SQN0rZupFJMbCE1JrJV2xmGU6lF5XZ6BLWUIzcstLSMpUUf
         K/rWdP1rf/SOx+qkMY9zNZaFf4lENERDllF5gpaEj9o3G5GSWo78yTkJSsQ7IBOFRs2E
         7f3w==
X-Forwarded-Encrypted: i=1; AJvYcCUCYkZ3Oef7iHp6MlDK+7rvgWd5Tn9X9S/xnAQfR27RZOnHu43h0qbTHQljfwhDtn5ebXNZVuE0cWYxagkiSG8=@lists.infradead.org, AJvYcCUutGuf7dxfKEdBFOYRo4vRBKsL1ipWQ8Q1M/TaUKHQ7vKsgr87b/Vgj8HSHvWIRtf3fcKUViefwU0juKVHQVSu@lists.infradead.org
X-Gm-Message-State: AOJu0YwGeP+oI2V2QsZCr58EHY75o4hsg4hQFplSUQ4lVaUvpIF3Keq1
	IFd8bgu+HKi4wAYYrxzRaJD1DiBR7flD37E1DvYQK63yc8wR/2wZ3JWV2CnUKYc=
X-Gm-Gg: ASbGncsQQHSaeSBtv+4hjejriq3HZr0E0lifMCfz2/drEDhx+eCpaeKs2BcWZYFySsN
	xqUWhVO9kO0P+8sQndiGxuPH2ovU596OC5bBvnGy092WxHiean8AIVvS58+dmE2n0coiAFQ0RX6
	ZrcT/a9+ISXnbjMX/bsJXz3FT0HetXLp2PvwUN6i4j+QCISQ3uEt//vqmQzOl6X+UxOTBOJSe4A
	1goPzZ5lg6vpMbteOmXkSeAFtcZisuUbEdO8Lx3ats1zBTjYkSr33YZM1xvkVO/sEmydenD3q5K
	2tWwbeUdAlFjhXxIb8iCFuBy6HSe6WIcAPFAd7cE8hOO9BUT+Tbz/2WLw1SbXRw+jx9taW2YA4N
	+iNmNpnOvzmI4Lmg=
X-Google-Smtp-Source: AGHT+IHyu7Y9UocFj6NyupWQTlJdBONm83Bu6jCvrQKTBDg/mDOlNqwmUghvwlMKZE314LRRl+t+tg==
X-Received: by 2002:a05:6000:4201:b0:391:456b:6ab7 with SMTP id ffacd0b85a97d-39efba5db9bmr1508046f8f.34.1744970239352;
        Fri, 18 Apr 2025 02:57:19 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207afsm2310967f8f.12.2025.04.18.02.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:57:19 -0700 (PDT)
Message-ID: <057bec6375819c3a4cd227c20a60ec1dbb7405c3.camel@gmail.com>
Subject: Re: [PATCH 3/8] iio: addac: ad74413r: use aligned_s64 for timestamp
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>,  Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,  Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Tomasz Duszynski <tduszyns@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,  Andreas Klinger
 <ak@it-klinger.de>, Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Fri, 18 Apr 2025 09:57:38 +0100
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-3-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	 <20250417-iio-more-timestamp-alignment-v1-3-eafac1e22318@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_032331_012185_E58E9E9D 
X-CRM114-Status: GOOD (  15.43  )
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

On Thu, 2025-04-17 at 11:52 -0500, David Lechner wrote:
> Follow the pattern of other drivers and use aligned_s64 for the
> timestamp. Technically there was no issue here since
> AD74413R_FRAME_SIZE * AD74413R_CHANNEL_MAX =3D=3D 16 and IIO_DMA_MINALIGN
> is always a multiple of 8. But best to conform in case someone copies
> this to new code and then tweaks something.
>=20
> Also move the unaligned.h header while touching this since it was the
> only one not in alphabetical order.
>=20
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/iio/addac/ad74413r.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/iio/addac/ad74413r.c b/drivers/iio/addac/ad74413r.c
> index
> f0929616ab899cb374f00869787321eed4ccde16..a0bb1dbcb7ad9d02337d0990e5a3f90=
be7eaa4ac
> 100644
> --- a/drivers/iio/addac/ad74413r.c
> +++ b/drivers/iio/addac/ad74413r.c
> @@ -4,7 +4,6 @@
> =C2=A0 * Author: Cosmin Tanislav <cosmin.tanislav@analog.com>
> =C2=A0 */
> =C2=A0
> -#include <linux/unaligned.h>
> =C2=A0#include <linux/bitfield.h>
> =C2=A0#include <linux/cleanup.h>
> =C2=A0#include <linux/crc8.h>
> @@ -24,6 +23,8 @@
> =C2=A0#include <linux/regmap.h>
> =C2=A0#include <linux/regulator/consumer.h>
> =C2=A0#include <linux/spi/spi.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> =C2=A0
> =C2=A0#include <dt-bindings/iio/addac/adi,ad74413r.h>
> =C2=A0
> @@ -84,7 +85,7 @@ struct ad74413r_state {
> =C2=A0	 */
> =C2=A0	struct {
> =C2=A0		u8 rx_buf[AD74413R_FRAME_SIZE * AD74413R_CHANNEL_MAX];
> -		s64 timestamp;
> +		aligned_s64 timestamp;
> =C2=A0	} adc_samples_buf __aligned(IIO_DMA_MINALIGN);
> =C2=A0
> =C2=A0	u8	adc_samples_tx_buf[AD74413R_FRAME_SIZE * AD74413R_CHANNEL_MAX];
>=20


