Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A80CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 15:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIfdj0bkI/AF+cY45UzcdEFuqUeZwDTRdo60GWbYwAg=; b=EauvlPDrgb6Vm0lk1boUT72Lyh
	SsMnKMr2oiFIHCPTKEsr3uQ9MVg1J+xVXwShGRbQe4bbKeiQINRCeRVJayUeAVtTd9tcP4I+DScQY
	ZZQdYIigtSqwwIyRzIl6NMKEths1OkGsO6xfZQoGFGC7p+k8Zmk01UR8swA8W7wJZHpSOcjAhJpzo
	T6KnssoT5F0q120CmKqlarCOmyR4GhG8c1JrYlvv4XXszUSK5VX4pAcl+S0iiscmVO8z99/udt8wA
	uRlJSfKWs1yMKfmbQmJUdI57iF62961w1hs77BWsxXggROGcxFQ+U0sBMgbQKotRjif49G/EiU7sm
	0KBm59WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOGg9-0000000Av4H-0UVK;
	Sat, 16 May 2026 15:11:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOGg6-0000000Av3b-2HKG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 15:11:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1654F43F91;
	Sat, 16 May 2026 15:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596EEC19425;
	Sat, 16 May 2026 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778944304;
	bh=lg0rxOCQCLqVZWSQOLYhY0Pgw1UG8QKlLFT66nXg4pw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gU1UZoDVy19Pq3Edyqd3E3hghl0X0D51BZtWufEL/1oSmP1iF+9FwKYIpIn9mJQJ7
	 Bk2n8NFI3SYgZM+9NsQyjR+K0koZs9vobLisKzAheWcy/RBzWT51YuiFsYPl+feVnM
	 /Qgp12WQdwMR3mv0YeHGWQcZLC4eO8c4O7AiqQTWy0kSOWdhL7M3E3oVqbL5EfSgDs
	 QUw4P1apzogbuG3hNhHsDfAYRvBk/IIhdqw/OZLOOPDY7j+yvt5dMSUH9Miuz/Wsqz
	 riRhtTZiAVJeV3jLPpw5tHTFexJMuKqqt8CHO4JUdTXjdJgrZqUpvE1GkElDBAEqd1
	 xx40wphMHeTVA==
Date: Sat, 16 May 2026 16:11:34 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev
Subject: Re: [PATCH v3] iio: adc: sun20i-gpadc: support non-contiguous
 channel lookups
Message-ID: <20260516161134.0fc1ad10@jic23-huawei>
In-Reply-To: <20260516-fix-sunxi-gpadc-sparse-channels-v3-1-4d229d18ff3b@mmpsystems.pl>
References: <20260516-fix-sunxi-gpadc-sparse-channels-v3-1-4d229d18ff3b@mmpsystems.pl>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_081146_623432_30B7301D 
X-CRM114-Status: GOOD (  21.98  )
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

On Sat, 16 May 2026 07:48:37 +0200
Michal Piekos <michal.piekos@mmpsystems.pl> wrote:

> Using consumer driver like iio-hwmon which resolve channels through
> io-channels phandles will fail for sparse channels because IIO core by
> default treats phandle argument as index into channel array.
>         eg. <&gpadc 1> will fail if there is only channel@1 specified
>=20
> Add .fwnode_xlate() which maps DT phandle to the registered channel
> whose chan->channel matches the hardware channel number. It allows
> sparse channel maps to be consumed by drivers like iio-hwmon.
>=20
> Tested on Radxa Cubie A5E.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
Applied to the testing branch of iio.git.

Thanks,

Jonathan

> ---
> Changes in v3:
> - Add iiospec->nargs validation in sun20i_gpadc_fwnode_xlate()
> - Keep Andy's Reviewed-by tag since change is narrow validation fix
> - Fix spelling issues in commit message
> - Link to v2: https://patch.msgid.link/20260514-fix-sunxi-gpadc-sparse-ch=
annels-v2-1-d4a66b70c7a7@mmpsystems.pl
>=20
> Changes in v2:
> - Move loop variable declaration into the for statement
> - Fix indentation using clang-format
> - Correct commit wording
> - Link to v1: https://patch.msgid.link/20260513-fix-sunxi-gpadc-sparse-ch=
annels-v1-1-6c21e290bcee@mmpsystems.pl
>=20
> To: Jonathan Cameron <jic23@kernel.org>
> To: David Lechner <dlechner@baylibre.com>
> To: Nuno S=C3=A1 <nuno.sa@analog.com>
> To: Andy Shevchenko <andy@kernel.org>
> To: Chen-Yu Tsai <wens@kernel.org>
> To: Jernej Skrabec <jernej.skrabec@gmail.com>
> To: Samuel Holland <samuel@sholland.org>
> To: Nathan Chancellor <nathan@kernel.org>
> To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> To: Bill Wendling <morbo@google.com>
> To: Justin Stitt <justinstitt@google.com>
> Cc: linux-iio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Cc: llvm@lists.linux.dev
> ---
>  drivers/iio/adc/sun20i-gpadc-iio.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-=
gpadc-iio.c
> index 861c14da75ad..8a75498557ff 100644
> --- a/drivers/iio/adc/sun20i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
> @@ -139,8 +139,23 @@ static irqreturn_t sun20i_gpadc_irq_handler(int irq,=
 void *data)
>  	return IRQ_HANDLED;
>  }
> =20
> +static int
> +sun20i_gpadc_fwnode_xlate(struct iio_dev *indio_dev,
> +			  const struct fwnode_reference_args *iiospec)
> +{
> +	if (iiospec->nargs !=3D 1)
> +		return -EINVAL;
> +
> +	for (unsigned int i =3D 0; i < indio_dev->num_channels; i++)
> +		if (indio_dev->channels[i].channel =3D=3D iiospec->args[0])
> +			return i;
> +
> +	return -EINVAL;
> +}
> +
>  static const struct iio_info sun20i_gpadc_iio_info =3D {
>  	.read_raw =3D sun20i_gpadc_read_raw,
> +	.fwnode_xlate =3D sun20i_gpadc_fwnode_xlate,
>  };
> =20
>  static void sun20i_gpadc_reset_assert(void *data)
>=20
> ---
> base-commit: 6916d5703ddf9a38f1f6c2cc793381a24ee914c6
> change-id: 20260513-fix-sunxi-gpadc-sparse-channels-2b6b2063bd49
>=20
> Best regards,
> -- =20
> Michal Piekos <michal.piekos@mmpsystems.pl>
>=20
>=20


