Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A265C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 11:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJTziyOodsPwReK1BbsrmO0URWz28zA6gqie1hxEU9Y=; b=TAEgd+UbwRinCQoKoKcYKPtOPL
	mZI9fRaCQjbFT3l1Vh6SDjFeynI4FliHMIknMe1KyvMs2f8xIQ8l8H8iDCbX4VRxSoZyN/DcVrepa
	sFRWPVw6p18RgnNxtODD6gF2gf68z8zesv3+4oQ84uXyQ3rrW7IoY0QrVhvZ9f9paoYBBgc2rUKNe
	hmqmBOxwpO66InigIjqxxrGR7PEhNe/fBCHRFMoMGQB9Ny6lwihznPTG354SHHz8yii6i45Ida06Q
	xgIM+3YOr0A9LcKF2v5KAHbRacxd8Fo8Ik8oEsJVabAVcCtSexPo7ABy9YK21w9uJ3A8odqYRVg4M
	jr+O+fAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ9EM-00000006zqH-1oqH;
	Sun, 25 May 2025 11:09:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ9CG-00000006zj1-26Hh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 11:07:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28E055C5AF5;
	Sun, 25 May 2025 11:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71763C4CEEA;
	Sun, 25 May 2025 11:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748171233;
	bh=qpXaGvujtarEfKk3BiIc4HM0wrXt417FYc6nr/MLq9I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=trQwOgRO3ZBurIDEXNGoXPzj74AfvQE1XK6bGsrIANWvbrjZnmGyGFYMeopZANPnE
	 KmYX19dVAgxqsH3yI2zkZJh3mH/1zP48IP3bSQIBL4TS+0B0ooRou05sO69obTLaHN
	 68bbcSKlAAWdjz2wXUVrtI6/N8p8NUn8GOL0PUnrSwwN5/WBL9iIMOfS8F3maHrAJR
	 KEBLoYrZKtv8c5diphgYPxAJHdYs6LBlXv+ULmf4LrbZ5pJ/TkUFz/Y2aUu8OvWZ4A
	 RkCvmOrCOpfCY/r3c/pJt83E5n8Qw9gMp1hHfqUK6gPbmb+8rZk3c81NprMUwhdF+Y
	 Bios84jblFpKw==
Date: Sun, 25 May 2025 12:07:03 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: Chen Ni <nichen@iscas.ac.cn>, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 u.kleine-koenig@baylibre.com, tglx@linutronix.de, robh@kernel.org,
 jirislaby@kernel.org, fabrice.gasnier@foss.st.com,
 linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: stm32-adc: Fix race in installing chained
 IRQ handler
Message-ID: <20250525120703.5dd89fc2@jic23-huawei>
In-Reply-To: <229cf78caaa7e9f2bb4cfa62c019acd51a1cd684.camel@gmail.com>
References: <20250515083101.3811350-1-nichen@iscas.ac.cn>
	<229cf78caaa7e9f2bb4cfa62c019acd51a1cd684.camel@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_040716_580644_918B781D 
X-CRM114-Status: GOOD (  19.38  )
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

On Thu, 15 May 2025 11:26:56 +0100
Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:

> On Thu, 2025-05-15 at 16:31 +0800, Chen Ni wrote:
> > Fix a race where a pending interrupt could be received and the handler
> > called before the handler's data has been setup, by converting to
> > irq_set_chained_handler_and_data().
> >=20
> > Fixes: d58c67d1d851 ("iio: adc: stm32-adc: add support for STM32MP1")
> > Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> > --- =20
>=20
> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
Looks good to me and I've queued it up for after rc1.  If any
ST folk have time to take a look that would be great.

Jonathan

>=20
> > Changelog:
> >=20
> > v1 -> v2:
> >=20
> > 1. Add Fixes tag.
> > ---
> > =C2=A0drivers/iio/adc/stm32-adc-core.c | 7 +++----
> > =C2=A01 file changed, 3 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-a=
dc-
> > core.c
> > index bd3458965bff..21c04a98b3b6 100644
> > --- a/drivers/iio/adc/stm32-adc-core.c
> > +++ b/drivers/iio/adc/stm32-adc-core.c
> > @@ -430,10 +430,9 @@ static int stm32_adc_irq_probe(struct platform_dev=
ice
> > *pdev,
> > =C2=A0		return -ENOMEM;
> > =C2=A0	}
> > =C2=A0
> > -	for (i =3D 0; i < priv->cfg->num_irqs; i++) {
> > -		irq_set_chained_handler(priv->irq[i], stm32_adc_irq_handler);
> > -		irq_set_handler_data(priv->irq[i], priv);
> > -	}
> > +	for (i =3D 0; i < priv->cfg->num_irqs; i++)
> > +		irq_set_chained_handler_and_data(priv->irq[i],
> > +						 stm32_adc_irq_handler,
> > priv);
> > =C2=A0
> > =C2=A0	return 0;
> > =C2=A0} =20


