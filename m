Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AEBC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pU6H/OdBGDlK0qj7JzU80PGILtqmXoZpaRcZeS2u3Bc=; b=prH+AU/h8+3kMJChjV7tv1os+r
	T68Fcy3duux9qb+7ZQ8bMkUwF0m7yxG+nx0YvcmBmGy/9no5dOmomuNpvvhb0NJX8quufiOi2CaRR
	C2F9yzgx6ibU8eYWte0Xz0ZWBJ3vWnWS3rx5p47ncQenApCaUAuxCq9MomMcQQWQNPXVfVfIU4GDT
	kyj8lhD8qYqlU10J9B4QBIODv1IpRBFlqT9CARhoVteZvbP4PH1xunE9W0iHRaM/FNugIVQ6f7T4R
	4QmisRgh5YdzdPkgDsO9GDdafLo7jWFNVkubMUVVYbrWe8jmGEP8gEDgtWEyHSv99HFVsipvEu61d
	qLcgW5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLObq-000000040xb-3idG;
	Sat, 31 May 2025 15:58:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLOZi-000000040su-2qhy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 15:56:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C9BBAA4ED36;
	Sat, 31 May 2025 15:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90EBC4CEE3;
	Sat, 31 May 2025 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748707004;
	bh=Si0gaSTIfmA9UreI5SjdzlMFGHES65UvOtKJTsLJWeU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lWQZrisGAesr6zhFA4NExGYhOrZS8k5bUecjEphb+vIBGYHPwTBeqB50DJHsFf6g4
	 wJxcUDzXyg1sxo6zg2VhlpzelUyteHsGQe+xpjCMwTNt6RAtOIMqj3U8BWjIr/DyUT
	 IPhro+M4iwUH/6LIylWdCUwzGsn0F9dLfWkPG2TYSh7RTMG47E+L3rAByuJ0r4H2IF
	 tDBBmefxYoGefboyx6ohp3VOOuFovzk7k2hrr1+Bv9p97h0Avkiix4mJTt/tQj0YUk
	 Sz2d7f0wxpd54jYj04AszohRxesb3wcEnk1uA7PKDsRxNm57yZq/br3R+EVNXAH0ok
	 sxQwY08AnAQkw==
Date: Sat, 31 May 2025 16:56:35 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>, Chen Ni
 <nichen@iscas.ac.cn>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
 <andy@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <u.kleine-koenig@baylibre.com>,
 <tglx@linutronix.de>, <robh@kernel.org>, <jirislaby@kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>
Subject: Re: [PATCH v2] iio: adc: stm32-adc: Fix race in installing chained
 IRQ handler
Message-ID: <20250531165635.262839dc@jic23-huawei>
In-Reply-To: <ab75c390-b172-4dbb-b46b-8cbf64d4600a@foss.st.com>
References: <20250515083101.3811350-1-nichen@iscas.ac.cn>
	<229cf78caaa7e9f2bb4cfa62c019acd51a1cd684.camel@gmail.com>
	<20250525120703.5dd89fc2@jic23-huawei>
	<ab75c390-b172-4dbb-b46b-8cbf64d4600a@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_085646_861125_887836A0 
X-CRM114-Status: GOOD (  23.72  )
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

On Mon, 26 May 2025 17:48:31 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 5/25/25 13:07, Jonathan Cameron wrote:
> > On Thu, 15 May 2025 11:26:56 +0100
> > Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:
> >  =20
> >> On Thu, 2025-05-15 at 16:31 +0800, Chen Ni wrote: =20
> >>> Fix a race where a pending interrupt could be received and the handler
> >>> called before the handler's data has been setup, by converting to
> >>> irq_set_chained_handler_and_data().
> >>>
> >>> Fixes: d58c67d1d851 ("iio: adc: stm32-adc: add support for STM32MP1")
> >>> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> >>> ---   =20
> >>
> >> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com> =20
> > Looks good to me and I've queued it up for after rc1.  If any
> > ST folk have time to take a look that would be great. =20
>=20
> Hi Jonathan,
>=20
> One minor comment at my end, not sure if that changes a lot...
> This could be a fix for the older commit:
> 1add69880240 ("iio: adc: Add support for STM32 ADC core")

Agreed. I've tweaked the message.  It won't apply cleanly all that way
but at least we flagged it for anyone who cares to backport past the code
movement in the Fixes tag Chen used.

>=20
> Apart from that, you can add my:
> Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Added.
>=20
> BR,
> Fabrice
>=20
> >=20
> > Jonathan
> >  =20
> >> =20
> >>> Changelog:
> >>>
> >>> v1 -> v2:
> >>>
> >>> 1. Add Fixes tag.
> >>> ---
> >>> =C2=A0drivers/iio/adc/stm32-adc-core.c | 7 +++----
> >>> =C2=A01 file changed, 3 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32=
-adc-
> >>> core.c
> >>> index bd3458965bff..21c04a98b3b6 100644
> >>> --- a/drivers/iio/adc/stm32-adc-core.c
> >>> +++ b/drivers/iio/adc/stm32-adc-core.c
> >>> @@ -430,10 +430,9 @@ static int stm32_adc_irq_probe(struct platform_d=
evice
> >>> *pdev,
> >>> =C2=A0		return -ENOMEM;
> >>> =C2=A0	}
> >>> =C2=A0
> >>> -	for (i =3D 0; i < priv->cfg->num_irqs; i++) {
> >>> -		irq_set_chained_handler(priv->irq[i], stm32_adc_irq_handler);
> >>> -		irq_set_handler_data(priv->irq[i], priv);
> >>> -	}
> >>> +	for (i =3D 0; i < priv->cfg->num_irqs; i++)
> >>> +		irq_set_chained_handler_and_data(priv->irq[i],
> >>> +						 stm32_adc_irq_handler,
> >>> priv);
> >>> =C2=A0
> >>> =C2=A0	return 0;
> >>> =C2=A0}   =20
> >  =20
>=20


