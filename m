Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF35AC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 13:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3EFoMtLUWx6MbDX6P0aC3dbBN3HKxOB4zApNaP2oCeA=; b=tLF0V0U2HmxOw3iZiqKnCRC2Ns
	3ea2DOkaBQfCmdWXvApJ+B71nBT8aB6QulztjbR/yUEynVWL7BjWGbYYm4pPjdYNsieS1UkDbcM7h
	+JJWGaJspCezmn4l/tseQuz77KPYh/vX5sRtwzFkcKZnoh9LDzyftWVh+QMrC96/FL2R0v7MSqZ8Z
	HiPDphen3LHPgiDimxB22nxqfK32YzpQr3Bc5Lj+QsGa04/SBTkQQGGe1DqYRhtV/tlvxFPI/gKuH
	fyOiwTxZw5r/NU/JDGnBcaizVG8v2gjFypNhPV7KFAUSgXPkYJdJspxunmyR6NusRwYxZdp5up34m
	4N6vqdOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlRu-00000002TQg-0G8R;
	Mon, 07 Jul 2025 12:59:58 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYl1o-00000002Qiz-03pa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 12:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751891580; x=1783427580;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=3EFoMtLUWx6MbDX6P0aC3dbBN3HKxOB4zApNaP2oCeA=;
  b=Bu9OuasEqeeOQ0JJSdDLilyoNsi3CVRa18PqvfRUAtk6c4QL+slJPAgT
   cOkZ2LERVTlCMsUSWe2Q8J8k6Un7RUo+4eoZrD6eg0rx4ceoubmJwxMT4
   W1QtyguYN1SBvq0cEOtQqLa+ocJjwB+5tA7uqk3QadgcMkkAmlDtkwcgN
   0wyHhqFLoKWS9E9hTC7+Xx+QwvhhlsjiFHBPMcgJ2UVhnBIZBt6utAkvf
   xTIV7uwE7XOmWQd/t4nYP+qUI/duBsny2Nc6jrceaRAUpfmkR9yzmTSFL
   WYi8d1ckThIPiwEICAwNRePvPfCUulbaiJeab2OK8Agye1iNWP3C1ZLFW
   g==;
X-CSE-ConnectionGUID: dwPCq672SsOplsYjP+AsxA==
X-CSE-MsgGUID: ayOzl+24QC2/dpqRYojkJA==
X-IronPort-AV: E=Sophos;i="6.16,294,1744063200"; 
   d="scan'208";a="45062521"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jul 2025 14:32:55 +0200
X-CheckPoint: {686BBE77-11-4C91DA42-F9D38293}
X-MAIL-CPID: ECC4F355EFDBBE1EB90FE1E99CCFC922_5
X-Control-Analysis: str=0001.0A006397.686BBE89.0055,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A300164D01;
	Mon,  7 Jul 2025 14:32:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751891571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3EFoMtLUWx6MbDX6P0aC3dbBN3HKxOB4zApNaP2oCeA=;
	b=a4QFFm5GESvBpUD4d2yaaa+l+TsYTB46OOtPgJPHFCHRMDRwCRlHRJUtJph6HveriV4d8+
	47P2d1fiec1o2zISgVTJj5dFnFHmsLuRN2qvmdg5/Do9VDOzmOraA4zSCI3XpigixMTVys
	xcVwWkfRu7qmDXw3gA8itDCsqFvM/egOYYEoZd9H7mh82YyDTdhdKxaCgck4I1i9lfkq61
	eF/L6/WnJ3oxeBTQvyTBjW+lV+AuRfV+/8YpHjYPmCIy7pbA0nNFdInIHxxWM5Xi3pp5TV
	N6GkhxoaG+IPSArJUJPcy+Z6BJJzF5obbNnA+jv5AaueT2wjSPLliQQFCdrUiQ==
Message-ID: <bf08cf4f890060d2d32d365abfb49d1c708a7fad.camel@ew.tq-group.com>
Subject: Re: [PATCH 05/12] gpio: tqmx86: use new GPIO line value setter
 callbacks
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Date: Mon, 07 Jul 2025 14:32:48 +0200
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-5-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
	 <20250707-gpiochip-set-rv-gpio-round4-v1-5-35668aaaf6d2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_053300_539177_E63BF777 
X-CRM114-Status: GOOD (  15.55  )
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

On Mon, 2025-07-07 at 09:50 +0200, Bartosz Golaszewski wrote:
>=20
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

> ---
>  drivers/gpio/gpio-tqmx86.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
> index 18f523a15b3c03e083b363a026e751f7367fb080..056799ecce6a256f3438d9fd8=
1ee4677cdd20125 100644
> --- a/drivers/gpio/gpio-tqmx86.c
> +++ b/drivers/gpio/gpio-tqmx86.c
> @@ -93,14 +93,16 @@ static void _tqmx86_gpio_set(struct tqmx86_gpio_data =
*gpio, unsigned int offset,
>  	tqmx86_gpio_write(gpio, bitmap_get_value8(gpio->output, 0), TQMX86_GPIO=
D);
>  }
> =20
> -static void tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
> -			    int value)
> +static int tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			   int value)
>  {
>  	struct tqmx86_gpio_data *gpio =3D gpiochip_get_data(chip);
> =20
>  	guard(raw_spinlock_irqsave)(&gpio->spinlock);
> =20
>  	_tqmx86_gpio_set(gpio, offset, value);
> +
> +	return 0;
>  }
> =20
>  static int tqmx86_gpio_direction_input(struct gpio_chip *chip,
> @@ -368,7 +370,7 @@ static int tqmx86_gpio_probe(struct platform_device *=
pdev)
>  	chip->direction_output =3D tqmx86_gpio_direction_output;
>  	chip->get_direction =3D tqmx86_gpio_get_direction;
>  	chip->get =3D tqmx86_gpio_get;
> -	chip->set =3D tqmx86_gpio_set;
> +	chip->set_rv =3D tqmx86_gpio_set;
>  	chip->ngpio =3D TQMX86_NGPIO;
>  	chip->parent =3D pdev->dev.parent;
> =20
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

