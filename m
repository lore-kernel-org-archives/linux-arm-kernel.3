Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A7CC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbZ5zfwh7oAWQ9rUKaaES+YOBoWmN1midVh0tt2UzNo=; b=HdJ2sHwAcZAZDKpHLhHdNaUGwi
	j4yGqMuYSOYXygeuH3LuTADFB3NNeXXAAAnu2mAF4nOCpBPzZwyZJ+aIHSsNa8gH5kOh80ahds8FI
	YPXXYzjwlHb/xbJaH1kPiZyRo1m5SftIN+mnruH+xs64vhvYGqfEKVc7tmLQIwToBxq9YiRbASdIm
	MwYO8CglGJ1ZNw/bCux8NDc8FnquuNCnK/9W2GyuJ/yXkeeY2UHXEV0RCsnfsdUUapwjX3+ECfxan
	OeaO6t3gkL4obL6555M2eux7V71cA/++0BL1VZXLLZRKBeKb76VXnUvQ/BxhG97v5PnrgupZoQwq9
	Mj2uCzxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCapg-0000000Esgo-0xXp;
	Wed, 07 May 2025 09:12:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZLM-0000000EYoJ-2ayP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:37:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso4322556f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 00:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746603446; x=1747208246; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DbZ5zfwh7oAWQ9rUKaaES+YOBoWmN1midVh0tt2UzNo=;
        b=cY5ahF+X8mulcvdE27F9CnZ7LEIjnbTGxSmPt7+DzfKGmOhuyDjNvOlnSXRKM8OnB6
         zHs3/t2gMOFHfWz9qLI25DXZYHIqqmU93DSdvqPlhcsqqqun5Rhd5YW1BYq8LU8T9nEc
         4Ty50pPfIZUvIrM8A8LHfTS106zTUQVFV+PryA10tN7PcBtvgMwt1/5/eqQCG8phjgJH
         nxAw4/x5XngYMkIPjRYzgF941jpAzuOwpI8NuYbDOHcvs1FgQBFx0qbKvCicI82GxfdX
         Fxov2xqruOP+/gDU/4TfAzIT04/2mD7H1dFIosqE4RdM7nxKQ1oeNtEScJqK6mWjcX5g
         5FIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746603446; x=1747208246;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DbZ5zfwh7oAWQ9rUKaaES+YOBoWmN1midVh0tt2UzNo=;
        b=M6HQVxNkN4C55+bGwRyLSfAMCvg/3Qi3XdgfwyYEWlEeTahPoYRABWIY9gH1wGst1Y
         ZGF1PIXoDEnX780c388iHz+JByLHqeFEupysTpNxIaIKhMftlFP0ApkDR3A3T/oFC2et
         lNLZ4WdwrvalM/4SKWAsgbeJuK5rbwCSURL6/rtIhRmKq42QZ2ZF3BQ+En/sDBYMY037
         Utj4jpEBdL/Mnlhe66Pi9GVXBxDAcUEoOHrLudN2px+4vpleGizf+PG2Gz3NYjgAyrYp
         dDB9W3s4sMe/FDjbfYpgs8NuaE33KE3f+ELB1qLawUIFX+ddU9c4AcfmYLENreVtSjeL
         /Pvw==
X-Forwarded-Encrypted: i=1; AJvYcCWhrDr/P0e/qVL6Gz/gI5wpmDUsaFtcAdHD6VrnE3tYFhu1z7/1GL89fXypeOpDwhlwmCtHU2IUO1QonzicsI9w@lists.infradead.org
X-Gm-Message-State: AOJu0YwIEuzruye1dueb5QplMQMA7kvROYc71AR8uPLVYh6UttrPpjke
	ArMy2+Jo7rTR5u5F6kj4EJJhB5Z1JkVxpEZKZmwOhO3go5rXfV+X
X-Gm-Gg: ASbGncuDHaaH0mMiNBuGnNRizQe9HFSrXLxr3WOmSzRDjV6tibkRu8Yq/IHUqShx9VY
	MvPE/hjieCWjRW03lLoHMKHXW5fDfucnRub/9oQc3S6xpecrZi0VpDikf6eFdwwkMC7eifZIuZP
	nVfXN6Zjc9s/oiVdhUayw9F5tp8753gGQrAJi84d/73PPnHM68mhUyJ0zhHETEYaZ2GewZHo5OB
	oIYDbtUYgjTY73bjVGRjFtUNVzG6lDPxR/6LfEvTi7NteaE13lfKRrs9bcvwnqmvafRv0/70hzW
	kgATUgKGBQQWGe/NU9CNDkKa5i4CpBAhQIllDLvafAjoUngTtZ/l73owXXZvjCwviJyc/PQTbOT
	ERUFl3THvrVPddhQ=
X-Google-Smtp-Source: AGHT+IFOksKkR0HZi+I7KBLluOyRJCQ76SAH8OckOWSd1HHAyJ3vZMTUpdS4daPAGAHRQm6jtP2RIA==
X-Received: by 2002:a05:6000:2905:b0:3a0:6b91:fefc with SMTP id ffacd0b85a97d-3a0b4a465ecmr1462408f8f.50.1746603446339;
        Wed, 07 May 2025 00:37:26 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b6d0e1ebsm378231f8f.80.2025.05.07.00.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:37:25 -0700 (PDT)
Message-ID: <b986f420280ae64b77c9534b856f3537bd5b29ed.camel@gmail.com>
Subject: Re: [PATCH v5 6/7] iio: accel: sca3300: use
 IIO_DECLARE_BUFFER_WITH_TS
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>,  Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Eugen Hristev
 <eugen.hristev@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Wed, 07 May 2025 07:37:50 +0100
In-Reply-To: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-6-814b72b1cae3@baylibre.com>
References: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
	 <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-6-814b72b1cae3@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_003728_655169_1B8F7C5E 
X-CRM114-Status: GOOD (  23.41  )
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
> Use IIO_DECLARE_BUFFER_WITH_TS() to declare the buffer that gets used
> with iio_push_to_buffers_with_ts(). This makes the code a bit easier to
> read and understand.
>=20
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
> This is an alternative to [1]. Also, this serves as a test to see if we
> can get a rule of thumb to decide how much is too much to put on the
> stack vs. needing to put the buffer in a static struct. SCA3300_SCAN_MAX
> is 7, so this add a bit over 64 bytes to the stack, make the stack now
> roughly double what it was before.

IMHO, I think that for this buffer size, having it on the stack is very rea=
sonable.

>=20
> [1]:
> https://lore.kernel.org/linux-iio/20250418-iio-prefer-aligned_s64-timesta=
mp-v1-1-4c6080710516@baylibre.com/
> ---
> =C2=A0drivers/iio/accel/sca3300.c | 18 ++----------------
> =C2=A01 file changed, 2 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/iio/accel/sca3300.c b/drivers/iio/accel/sca3300.c
> index
> 1132bbaba75bcca525fac2f3e19f63546380fd4f..67416a406e2f43e4e417210410904d4=
4c93111d2
> 100644
> --- a/drivers/iio/accel/sca3300.c
> +++ b/drivers/iio/accel/sca3300.c
> @@ -58,15 +58,6 @@ enum sca3300_scan_indexes {
> =C2=A0	SCA3300_SCAN_MAX
> =C2=A0};
> =C2=A0
> -/*
> - * Buffer size max case:
> - * Three accel channels, two bytes per channel.
> - * Temperature channel, two bytes.
> - * Three incli channels, two bytes per channel.
> - * Timestamp channel, eight bytes.
> - */
> -#define SCA3300_MAX_BUFFER_SIZE (ALIGN(sizeof(s16) * SCA3300_SCAN_MAX,
> sizeof(s64)) + sizeof(s64))
> -
> =C2=A0#define SCA3300_ACCEL_CHANNEL(index, reg, axis) {			\
> =C2=A0	.type =3D IIO_ACCEL,						\
> =C2=A0	.address =3D reg,							\
> @@ -193,9 +184,6 @@ struct sca3300_chip_info {
> =C2=A0 * @spi: SPI device structure
> =C2=A0 * @lock: Data buffer lock
> =C2=A0 * @chip: Sensor chip specific information
> - * @buffer: Triggered buffer:
> - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -SCA3300: 4 cha=
nnel 16-bit data + 64-bit timestamp
> - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -SCL3300: 7 cha=
nnel 16-bit data + 64-bit timestamp
> =C2=A0 * @txbuf: Transmit buffer
> =C2=A0 * @rxbuf: Receive buffer
> =C2=A0 */
> @@ -203,7 +191,6 @@ struct sca3300_data {
> =C2=A0	struct spi_device *spi;
> =C2=A0	struct mutex lock;
> =C2=A0	const struct sca3300_chip_info *chip;
> -	u8 buffer[SCA3300_MAX_BUFFER_SIZE] __aligned(sizeof(s64));
> =C2=A0	u8 txbuf[4] __aligned(IIO_DMA_MINALIGN);
> =C2=A0	u8 rxbuf[4];
> =C2=A0};
> @@ -492,7 +479,7 @@ static irqreturn_t sca3300_trigger_handler(int irq, v=
oid *p)
> =C2=A0	struct iio_dev *indio_dev =3D pf->indio_dev;
> =C2=A0	struct sca3300_data *data =3D iio_priv(indio_dev);
> =C2=A0	int bit, ret, val, i =3D 0;
> -	s16 *channels =3D (s16 *)data->buffer;
> +	IIO_DECLARE_BUFFER_WITH_TS(s16, channels, SCA3300_SCAN_MAX);

On top of what you mentioned I like this change. The pattern you're removin=
g is the
typical one for getting into unaligned accesses.

> =C2=A0
> =C2=A0	iio_for_each_active_channel(indio_dev, bit) {
> =C2=A0		ret =3D sca3300_read_reg(data, indio_dev->channels[bit].address,
> &val);
> @@ -505,8 +492,7 @@ static irqreturn_t sca3300_trigger_handler(int irq, v=
oid *p)
> =C2=A0		channels[i++] =3D val;
> =C2=A0	}
> =C2=A0
> -	iio_push_to_buffers_with_ts(indio_dev, data->buffer,
> -				=C2=A0=C2=A0=C2=A0 sizeof(data->buffer),
> +	iio_push_to_buffers_with_ts(indio_dev, channels, sizeof(channels),
> =C2=A0				=C2=A0=C2=A0=C2=A0 iio_get_time_ns(indio_dev));
> =C2=A0out:
> =C2=A0	iio_trigger_notify_done(indio_dev->trig);
>=20


