Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BB2CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 07:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCxy5SDWHowEDbxrjGnQzeWW2JpysbkJk+FBY3MBfRc=; b=QGaHi3PfXXHR9wU7tiLjpsvHMi
	7FbbUvnRCTzrFcfpH8gqX+/4XiNOfNSSQKcVowm1fflWON2Bxo3QbYZ5USr4/GZxfreSZlj1uXkEn
	VslARMcsG9glyWA8osRefDPexRj4PKFtZdI/CC0dXFVSmgE1g11owejhaDicKlMbYcFdBieeNw+XS
	Lu2/dVNV2gRMg5BQCNWEL2WG+IXktxk9OiD26igWyR/0wwBcGGYfmiCaHsm9pac8On6DDd1Cv1Dfo
	so29OtDMYS1Ph6g51KnADxfTcLmgUH4ybRGT03xg0GI1ttfvu/PRxiTkzvMiYfWnGu++COF+8RXbq
	e0oUcKmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4a0R-0000000Bnbd-3xkk;
	Fri, 03 Oct 2025 07:15:07 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4a0P-0000000Bnaz-2JWX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 07:15:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3f44000626bso1071869f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 00:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759475703; x=1760080503; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SCxy5SDWHowEDbxrjGnQzeWW2JpysbkJk+FBY3MBfRc=;
        b=CEiogTKHyQPnjcUqv+3MPeAHMTZHsGpfYIDewjLeOl0YHV76OOT/l98x5wNjj+nwlS
         6OP1pNEjQd8Dj8ZBcm9ZvKpfjwmd2xqXiZ0sLF1KzMIUgbW7Gxn+DoljbhDdbQSVQZNH
         0oAoZWoQj0k8QPO9xVvIuO3iZTH13rwBQOz9oJp9cv+ST1a2Baz/zweCuq6eiZrVXTSn
         LZ8Gyh3jiR5XFx/+0SSdpPg8J9QxiIHJSIHlO0PJsiSDjit7c4NvZRoTsMFF8lhylSE7
         vcWzAVt7t9yaaPQgsqxnLC2NCNAdG0SXzGuxL/uwi6qVwQm3uo0kYIv19psJQMTuHzz9
         9JaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759475703; x=1760080503;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SCxy5SDWHowEDbxrjGnQzeWW2JpysbkJk+FBY3MBfRc=;
        b=NAEX7rtYQSvCFOAa9Z4aXH8/M7N18QYAUSuGQIK+FplW2klX7Pupz10dY3qqAKviSW
         HUFCh15NOHK/cGa/yzLqvdAlIK9lJpo7zeh2so8DFAWDNb05AueCbHPAm52bgcZYExKD
         ZIyK7C3NXsFraj7ltZ6PxIvV7OvYt+aYytksSDxV/zVwed4zTabFp4jdGD4eKu+t6WzP
         WtXDGLz5F/rMOJZocn6YCgDC5PaZ1Yi2UIlS93PmgbPS8qIaIUsbOyb5Jus9pCQNR6I6
         2A1RtvxtEURKc4KXQvyZfnk2T2M2ZfF7uAEa5qDZq3bWNaYjT1rlnAe+jyEx3rQ4btl2
         TTPw==
X-Forwarded-Encrypted: i=1; AJvYcCVYJzSugifryg0xIA/HDydR5Nx/X0FLDwKKQ+VMME6kgkNHhvhyxFS1x81WlNiLnUujQjJS5aj42EeuXSkOEohg@lists.infradead.org
X-Gm-Message-State: AOJu0YzDhuRbA5WSNSU5nKCrmySRTmTP6OgbVf5XMagfQkM8e/RPe2CI
	19XnF+uCo/PqAYdPfghmkoA4pvFT4qsjLpQQBm8GJnlQm82D/i2f55mp
X-Gm-Gg: ASbGnctm+CfdiMMY2yo5gnNiLZPA1cMEEXcVoH8+BUQhUVcL0d0DJq3gdV7RSHlDsoz
	SXTePNYPJFwKkA5g1HpbXLV6zHMeHVNLsDH+BQqPbirQMIWwjTyxOn6/me+7khlMfiOpIdohcMV
	YL6T/HTVdVJEfGjEeQlHRH9PUBlKpV1xRCLVq4eCHw5MnTXlVDMXwleaDW/BoFxvonYkmG924js
	Ai2bzSfDdmZ+K671HnC27RmZxcm3rqWHdWRwGforFH9i/QbDS3Qb5i8yMVdcYHrNoM/1YXlrOBr
	VanOnMPS2rrGgDxtk04WK5iuDKr9sGeI/3MJ7unh6uQn3mqHZKkXwu8YmS4N10qDYbn2YVvBVKC
	STqG/UEXFM9XSzvgqWqirSXb83dDxSncUvMcWt483ynykhITyCZuKDIrSv59MDeqC9Fgm+CJOBB
	ISEirybyncS3uN55E7dB0=
X-Google-Smtp-Source: AGHT+IGLTbbL0+EcLoLbEHHZSN9rL8yQmh7AzCqkvRkhjUJXYn5Zs5RuD/3SDImWP4OlYSCEwRkZcA==
X-Received: by 2002:a05:6000:610:b0:3fe:d6df:c679 with SMTP id ffacd0b85a97d-425671c1c62mr1159606f8f.55.1759475703242;
        Fri, 03 Oct 2025 00:15:03 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:94c4:fb0e:28f:2a8d? ([2001:818:ea56:d000:94c4:fb0e:28f:2a8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8abe9bsm6738262f8f.22.2025.10.03.00.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 00:15:02 -0700 (PDT)
Message-ID: <5243c2c5a8f3dd24f40e30a695e2a3d4f948f388.camel@gmail.com>
Subject: Re: [PATCH] iio: adc: stm32-dfsdm: fix st,adc-alt-channel property
 handling
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron	
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Maxime Coquelin	 <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-iio@vger.kernel.org, 	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org
Date: Fri, 03 Oct 2025 07:15:56 +0100
In-Reply-To: <20251002112250.2270144-1-olivier.moysan@foss.st.com>
References: <20251002112250.2270144-1-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_001505_611104_5280A2D2 
X-CRM114-Status: GOOD (  16.55  )
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

On Thu, 2025-10-02 at 13:22 +0200, Olivier Moysan wrote:
> Initially st,adc-alt-channel property was defined as an enum in the DFSDM
> binding. The DFSDM binding has been changed to use the new IIO backend
> framework, along with the adoption of IIO generic channels.
> In this new binding st,adc-alt-channel is defined as a boolean property,
> but it is still handled has an enum in DFSDM driver.
> Fix st,adc-alt-channel property handling in DFSDM driver.
>=20
> Fixes: 3208fa0cd919 ("iio: adc: stm32-dfsdm: adopt generic channels bindi=
ngs")
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/iio/adc/stm32-dfsdm-adc.c | 5 ++---
> =C2=A01 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-df=
sdm-adc.c
> index 74b1b4dc6e81..9664b9bd75d4 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -725,9 +725,8 @@ static int stm32_dfsdm_generic_channel_parse_of(struc=
t
> stm32_dfsdm *dfsdm,
> =C2=A0	}
> =C2=A0	df_ch->src =3D val;
> =C2=A0
> -	ret =3D fwnode_property_read_u32(node, "st,adc-alt-channel", &df_ch-
> >alt_si);
> -	if (ret !=3D -EINVAL)
> -		df_ch->alt_si =3D 0;
> +	if (fwnode_property_present(node, "st,adc-alt-channel"))
> +		df_ch->alt_si =3D 1;
> =C2=A0
> =C2=A0	if (adc->dev_data->type =3D=3D DFSDM_IIO) {
> =C2=A0		backend =3D devm_iio_backend_fwnode_get(&indio_dev->dev, NULL,
> node);

