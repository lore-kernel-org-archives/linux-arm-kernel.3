Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39534E6ADE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 15:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUE1pHJYwRUi/53EXVIpRsmhO21jBiLOCp1isJcz4iw=; b=Hutka1geSfY1XPeOj35rZyyIXW
	QRq3Ya+QFqbvlTwI/RoSFuICd63gxjlxIeWwVKI4Z8p2LHxIzhCKaskBGOIn4vVmhEIV3UvN8PrlS
	hC+4R0KuOxxs3aocL69IDAaUKqItmKUGBK6lK74xEU+Ij9uBdmSLCcuDXGy4rUF7EfjTCbri1UKhx
	U/5RTrd95z5+RMKpW4XBkPpYR6lpMKAW3jJt/NepGJqnSb3vxSXIToG4uaBMnEIQoPEckShWv1oLG
	09ECNiWKQKjUmf5OapTPJSvM2qu7NZGOijnaY8g7dwbv9T8FR5Chl8gO+46kml1OqBHmwpXPBq4SS
	2qDRyFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tErfw-00000004TpX-47M1;
	Sat, 23 Nov 2024 15:03:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tErez-00000004Tl1-1iFy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 15:02:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 180145C4BA3;
	Sat, 23 Nov 2024 15:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D12C4CECD;
	Sat, 23 Nov 2024 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732374176;
	bh=P157WcS5ohYQAn6edzPl90GuO3alev9bLB/aKLVAonA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a2i9jlGpP4BY6M3sO6UvZGtTn48iTlYRswftLo6T216t08sIJe8jGSigKCHnMe0LP
	 /DCUGBZ4MPSDbU/CS9GdyV1H+/prcZ+6O/6jrvC1YGrL0bHHcSF/vONpdWnZPC4Z70
	 lQItjByFZ+PXk96ckzl6Nd2+ghTQQFeCZHJOKM/l0JKqmvnbnS2AHAk5gtOw77FGOk
	 qYGE+/yHOTQjHX523ydlcgUTBD3L2156BZP9Glret02gBGijXBajFBY9ms9c5YIQeE
	 ZcFlgRH4L8968l7+vzPNW5vlWIgf426zAhTWzlV+hiimoLcMnmEcZFEA8JX9peP0Mk
	 +hDck6GqSJF7Q==
Date: Sat, 23 Nov 2024 15:02:47 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: lars@metafoo.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, u.kleine-koenig@baylibre.com,
 tgamblin@baylibre.com, fabrice.gasnier@st.com,
 benjamin.gaignard@linaro.org, lee@kernel.org, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: trigger: stm32-timer-trigger: Add check for
 clk_enable()
Message-ID: <20241123150247.718ee116@jic23-huawei>
In-Reply-To: <CANeGvZVxte61_FgrrYEt_oTRXXzCESrvq4q90xSWz4JqpMAtYg@mail.gmail.com>
References: <20241108200900.44727-1-jiashengjiangcool@gmail.com>
	<20241109133846.53d7ef06@jic23-huawei>
	<CANeGvZVxte61_FgrrYEt_oTRXXzCESrvq4q90xSWz4JqpMAtYg@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_070257_551864_E960F7DD 
X-CRM114-Status: GOOD (  36.51  )
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

On Mon, 11 Nov 2024 14:15:43 -0500
Jiasheng Jiang <jiashengjiangcool@gmail.com> wrote:

> On Sat, Nov 9, 2024 at 8:38=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
> >
> > On Fri,  8 Nov 2024 20:09:00 +0000
> > Jiasheng Jiang <jiashengjiangcool@gmail.com> wrote:
> > =20
> > > Add check for the return value of clk_enable() in order to catch the
> > > potential exception.
> > >
> > > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com> =20
> > Hi,
> >
> > In principle this is fine, but I'd rather we made use of guard()
> > / scoped_guard() rather than adding the explicit unlocks.
> >
> > If you do that as a precursor patch in appropriate places
> > in the driver then this will be a little cleaner.
> >
> > Note I'll not be taking this until next cycle now anyway.
> >
> > Jonathan
> > =20
> > > ---
> > > Changelog:
> > >
> > > v1 -> v2:
> > >
> > > 1. Remove unsuitable dev_err_probe().
> > > ---
> > >  drivers/iio/trigger/stm32-timer-trigger.c | 32 ++++++++++++++++++---=
--
> > >  1 file changed, 25 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/=
trigger/stm32-timer-trigger.c
> > > index 0684329956d9..e1e077122f73 100644
> > > --- a/drivers/iio/trigger/stm32-timer-trigger.c
> > > +++ b/drivers/iio/trigger/stm32-timer-trigger.c
> > > @@ -119,7 +119,7 @@ static int stm32_timer_start(struct stm32_timer_t=
rigger *priv,
> > >                            unsigned int frequency)
> > >  {
> > >       unsigned long long prd, div;
> > > -     int prescaler =3D 0;
> > > +     int prescaler =3D 0, ret;
> > >       u32 ccer;
> > >
> > >       /* Period and prescaler values depends of clock rate */
> > > @@ -153,7 +153,11 @@ static int stm32_timer_start(struct stm32_timer_=
trigger *priv,
> > >       mutex_lock(&priv->lock);
> > >       if (!priv->enabled) {
> > >               priv->enabled =3D true;
> > > -             clk_enable(priv->clk);
> > > +             ret =3D clk_enable(priv->clk);
> > > +             if (ret) {
> > > +                     mutex_unlock(&priv->lock); =20
> >
> > as below guard() for when the mutex is locked is cleaner.
> > =20
> > > +                     return ret;
> > > +             }
> > >       }
> > >
> > >       regmap_write(priv->regmap, TIM_PSC, prescaler);
> > > @@ -307,7 +311,7 @@ static ssize_t stm32_tt_store_master_mode(struct =
device *dev,
> > >       struct stm32_timer_trigger *priv =3D dev_get_drvdata(dev);
> > >       struct iio_trigger *trig =3D to_iio_trigger(dev);
> > >       u32 mask, shift, master_mode_max;
> > > -     int i;
> > > +     int i, ret;
> > >
> > >       if (stm32_timer_is_trgo2_name(trig->name)) {
> > >               mask =3D TIM_CR2_MMS2;
> > > @@ -326,7 +330,11 @@ static ssize_t stm32_tt_store_master_mode(struct=
 device *dev,
> > >                       if (!priv->enabled) {
> > >                               /* Clock should be enabled first */
> > >                               priv->enabled =3D true;
> > > -                             clk_enable(priv->clk);
> > > +                             ret =3D clk_enable(priv->clk);
> > > +                             if (ret) {
> > > +                                     mutex_unlock(&priv->lock); =20
> > As below. Prefer use of guard() so we don't have to handle the unlock m=
anually. =20
> > > +                                     return ret;
> > > +                             }
> > >                       }
> > >                       regmap_update_bits(priv->regmap, TIM_CR2, mask,
> > >                                          i << shift);
> > > @@ -482,6 +490,7 @@ static int stm32_counter_write_raw(struct iio_dev=
 *indio_dev,
> > >                                  int val, int val2, long mask)
> > >  {
> > >       struct stm32_timer_trigger *priv =3D iio_priv(indio_dev);
> > > +     int ret;
> > >
> > >       switch (mask) {
> > >       case IIO_CHAN_INFO_RAW:
> > > @@ -496,7 +505,11 @@ static int stm32_counter_write_raw(struct iio_de=
v *indio_dev,
> > >               if (val) {
> > >                       if (!priv->enabled) {
> > >                               priv->enabled =3D true;
> > > -                             clk_enable(priv->clk);
> > > +                             ret =3D clk_enable(priv->clk);
> > > +                             if (ret) {
> > > +                                     mutex_unlock(&priv->lock); =20
> > Add include of cleanup.h and swithch the place where the mutex is locke=
d to
> > guard(mutex)(&priv->lock);
> > then remember to drop the explicit unlocks. =20
>=20
> I found that cleanup.h is already included.
>=20
> Moreover, since labels cannot be followed by declarations,
> I encountered a compilation error when using guard().
> Therefore, I switched to using scoped_guard().
Sometimes it is better to just add scope for blocks in switch statement
with=20
case XXX: {
	guard()
}
because then we don't get the extra indent a scoped_guard() requires.

I'll take a look at the result in this case though!

Jonathan

> > =20
> > > +                                     return ret;
> > > +                             }
> > >                       }
> > >                       regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_=
CEN);
> > >               } else {
> > > @@ -601,7 +614,7 @@ static int stm32_set_enable_mode(struct iio_dev *=
indio_dev,
> > >                                unsigned int mode)
> > >  {
> > >       struct stm32_timer_trigger *priv =3D iio_priv(indio_dev);
> > > -     int sms =3D stm32_enable_mode2sms(mode);
> > > +     int sms =3D stm32_enable_mode2sms(mode), ret;
> > >
> > >       if (sms < 0)
> > >               return sms;
> > > @@ -611,7 +624,12 @@ static int stm32_set_enable_mode(struct iio_dev =
*indio_dev,
> > >        */
> > >       mutex_lock(&priv->lock); =20
> >
> > Perhaps scoped_guard() is  appropriate here.
> > =20
> > >       if (sms =3D=3D 6 && !priv->enabled) {
> > > -             clk_enable(priv->clk);
> > > +             ret =3D clk_enable(priv->clk);
> > > +             if (ret) {
> > > +                     mutex_unlock(&priv->lock);
> > > +                     return ret;
> > > +             }
> > > +
> > >               priv->enabled =3D true;
> > >       }
> > >       mutex_unlock(&priv->lock); =20
> > =20
>=20
> Thanks, I will submit a v2 to simplify code with cleanup helpers.
>=20
> -Jiasheng


