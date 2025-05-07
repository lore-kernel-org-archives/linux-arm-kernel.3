Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD5AC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 08:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUbeHMzIFsOzUSMB2htO29hpRr03KwAvpfp2sAuDens=; b=VLDy+OkDHdWdY314O4YFWwemfb
	zH9QE23VkTx+6b3+sSCfmR/o6QTMzGHwH/vtspLshufSsyjaoInBFOAxM5hB2FPowxvQcSBrjx+7v
	fVTflNYcs03gOvR0ucpfd6eP2F2kul3nwoeUNAf1NqUDa6Fude2GowclXvWBVo8lYqq6MOpQWksca
	ZSEbJinzmHLHT0Wwx+K4xoDq1WvWlSUghM4floKJYXpIXmlm917j+b+G4rjy+5XCkqsspeOKam1Vl
	e10Jdl4XWByFeR46aB9PlKMVz2xOZ+bNNh3nFxiGnTofdwOuaXeg0rrRbtjfmr2nE9A/2oB886bEX
	QtgE+pEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaJ3-0000000EmiS-1y6K;
	Wed, 07 May 2025 08:39:09 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZMb-0000000EZ4m-2Brx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:38:46 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a0b291093fso365499f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 00:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746603524; x=1747208324; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LUbeHMzIFsOzUSMB2htO29hpRr03KwAvpfp2sAuDens=;
        b=d1dnJHBkw38dD5Wf4k+kSdxFWvOck5fSo2IdUfCnNFwmp8bLZ/sQD8YS3NRavCfPSe
         odAcF50AhzCvZAOGC3fl8FouhCFc0QgIX64ptZRlqnTqaTFbiHPtrkDmzsE4ZLbKYqMs
         0OtcsrszvdDOgZpusn82GFthzGBZQlTprzhoUWUiTxfCb4eM0GwkA8eRe/0Lf3y9SDRW
         WgQiHTKZSDC2C8DBpwewSl4UyaNqJEtkdeb2FieFxlx/jPh9KyD2+A+qYpuBY9CPf5P+
         E1MyoQXcuymn+dxuzcsxswGJI55DBFiROuQKQegepA4yNCC0NEuNK4LCG77T4BZn79FE
         7Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746603524; x=1747208324;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LUbeHMzIFsOzUSMB2htO29hpRr03KwAvpfp2sAuDens=;
        b=WEkrIf2FfHrAnLHZMteLuilCY5EEJKWXms1hzgHQBJNRZAoKA3EmxLu8rOiAkN4zlp
         Voip6/3pcaRZ8ozGUO0W5jijx3rYvA6BeO2SQD2JehpInr4H/Nm41REdgL1YvccCaCGv
         NbcDjjc42/JIU8RfDBQ1+8gdL/swGySWIDnh/0pi0hgGMnFISyQb6qLOerI4DNdKYDdv
         pe2Y5hBmyncNc31e93yV02zIoLdDcvWwiQ/IelfVOktJfIZ8EeZctY30ageNvp5go48l
         MPPBxqKRP6OJzzG7mDGs3JwwKOAVsjJRTXEtKjlt2fJp9lui+M6TGRfRiw8ZVVxh1L1n
         VkqA==
X-Forwarded-Encrypted: i=1; AJvYcCX9IaiS1Khm9GLT1yZBeQPQw1WDzQKj4sXLR19AkJ81NZmAjAnUVUm1iS3QUErkojPS28SO9jy5wK1p9cyyc6Vb@lists.infradead.org
X-Gm-Message-State: AOJu0YyXFzeqE8CrM7F4knEZn6dZMmnLFCU7DYikLf2mP9byvIrLA9re
	SCfxvuVRxjNus18B4Tkni9R8oJhYA7tC68DBZ6FNEDVah0AcHQ8l
X-Gm-Gg: ASbGncuZkB4avm45bYgfs5FLLeFui69RUFahfjim1pMQDzHSjOr9wcYFUujmaVASrTR
	vNZ8W1bDgW7AEzzTcw+92GxxOVTGT68T1DOm8osc9SVudVkBCzu7DR11pzkEQje5j/HilTqCNB9
	6QNO20+MqBz39oWjhKQaBWokdKwOu/RS0xGl2cwFTmgYvdFBJlTbRMsfbSriKR2zK2wKfkWlZEb
	1MARzxRo2MoDYiN3h9ZkACFmOc5+YPS+TFxrL2aNZxtCa2V+YnF7DYAmHOJI52MsKMgALd3xvoV
	ZGoqqf2Lc7ufcGdB71p6BvHhfwfwRlKUR/PlxxRLa3Tp5dj7qJ+MrfQ1JpjoycVd1zOC2C50TI5
	zXt0PMF1tuIDo36k=
X-Google-Smtp-Source: AGHT+IFcrfJVgjIHTQQ2WPmB67RGJPQ8xi7u9h/v5miFvmeP2RpN+ZcyLqGtFi9WsQS7CkgsL5VSLw==
X-Received: by 2002:a5d:64ad:0:b0:39e:cbca:74cf with SMTP id ffacd0b85a97d-3a0b53a06bfmr1636435f8f.6.1746603523625;
        Wed, 07 May 2025 00:38:43 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17748sm15851404f8f.100.2025.05.07.00.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:38:43 -0700 (PDT)
Message-ID: <ec7c00c640b0b359bfd98d460d067aee64ca069f.camel@gmail.com>
Subject: Re: [PATCH v5 0/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>,  Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Eugen Hristev
 <eugen.hristev@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Trevor Gamblin <tgamblin@baylibre.com>
Date: Wed, 07 May 2025 07:39:07 +0100
In-Reply-To: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
References: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_003845_559022_3F78FF06 
X-CRM114-Status: GOOD (  30.32  )
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

On Mon, 2025-05-05 at 11:31 -0500, David Lechner wrote:
> Creating a buffer of the proper size and correct alignment for use with
> iio_push_to_buffers_with_ts() is commonly used and not easy to get
> right (as seen by a number of recent fixes on the mailing list).
>=20
> In general, we prefer to use this pattern for creating such buffers:
>=20
> struct {
> =C2=A0=C2=A0=C2=A0 u16 data[2];
> =C2=A0=C2=A0=C2=A0 aligned_s64 timestamp;
> } buffer;
>=20
> However, there are many cases where a driver may have a large number of
> channels that can be optionally enabled or disabled in a scan or the
> driver might support a range of chips that have different numbers of
> channels or different storage sizes for the data. In these cases, the
> timestamp may not always be at the same place relative to the data. To
> handle these, we allocate a buffer large enough for the largest possible
> case and don't care exactly where the timestamp ends up in the buffer.
>=20
> For these cases, we propose to introduce new macros to make it easier
> it easier for both the authors to get it right and for readers of the
> code to not have to do all of the math to verify that it is correct.
>=20
> I have just included a few examples of drivers that can make use of this
> new macro, but there are dozens more.
>=20
> ---

LGTM

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> Changes in v5:
> - Add new patch to set minimum alignment to 8 for IIO_DMA_MINALIGN.
> - Adjust IIO_DECLARE_DMA_BUFFER_WITH_TS() macro for above change.
> - Drop one ad4695 patch that was already applied.
> - Link to v4:
> https://lore.kernel.org/r/20250428-iio-introduce-iio_declare_buffer_with_=
ts-v4-0-6f7f6126f1cb@baylibre.com
>=20
> Changes in v4:
> - Dropped static_assert()s from the first patch.
> - Handle case when IIO_DMA_MINALIGN < sizeof(timestamp).
> - Added one more patch for ad4695 to rename a confusing macro.
> - Link to v3:
> https://lore.kernel.org/r/20250425-iio-introduce-iio_declare_buffer_with_=
ts-v3-0-f12df1bff248@baylibre.com
>=20
> Changes in v3:
> - Fixed a few mistakes, style issues and incorporate other feedback (see
> =C2=A0 individual commit message changelogs for details).
> - Link to v2:
> https://lore.kernel.org/r/20250422-iio-introduce-iio_declare_buffer_with_=
ts-v2-0-3fd36475c706@baylibre.com
>=20
> Changes in v2:
> - Add 2nd macro for case where we need DMA alignment.
> - Add new patch for ad4695 to convert buffer from u8 to u16 before
> =C2=A0 making use of the new macro.
> - Drop the bmp280 patch since it was determined to have a better
> =C2=A0 alternative not using these macros.
> - Add a few more examples to show the non-DMA case, both in a struct and
> =C2=A0 stack allocated.
> - Link to v1:
> https://lore.kernel.org/r/20250418-iio-introduce-iio_declare_buffer_with_=
ts-v1-0-ee0c62a33a0f@baylibre.com
>=20
> ---
> David Lechner (7):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio: make IIO_DMA_MINALIGN minimum of 8 by=
tes
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio: introduce IIO_DECLARE_BUFFER_WITH_TS =
macros
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio: adc: ad4695: use IIO_DECLARE_DMA_BUFF=
ER_WITH_TS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio: adc: ad4695: rename AD4695_MAX_VIN_CH=
ANNELS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio: adc: ad7380: use IIO_DECLARE_DMA_BUFF=
ER_WITH_TS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio: accel: sca3300: use IIO_DECLARE_BUFFE=
R_WITH_TS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio: adc: at91-sama5d2: use IIO_DECLARE_BU=
FFER_WITH_TS
>=20
> =C2=A0drivers/iio/accel/sca3300.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 18 ++--------------
> =C2=A0drivers/iio/adc/ad4695.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 11 +++++-----
> =C2=A0drivers/iio/adc/ad7380.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +--
> =C2=A0drivers/iio/adc/at91-sama5d2_adc.c | 13 ++----------
> =C2=A0include/linux/iio/iio.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 42 ++++++++++++++++++++++++++++++++++++++
> =C2=A05 files changed, 52 insertions(+), 35 deletions(-)
> ---
> base-commit: 7e9a82ab5b861d3c33c99a22c1245a5b262ee502
> change-id: 20250418-iio-introduce-iio_declare_buffer_with_ts-2f8773f7dad6
>=20
> Best regards,


