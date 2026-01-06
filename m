Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CF7C47BEA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpZ9a6BXZLK2t8VLw/I32vovbpQXSb2aQUMDb54O4es=; b=t5dI6cRbatmh9TAuz0twe0k6PL
	8XZEtZ7cG82PtmpL8nLkrYSUK0qu0IJ96XAAW7D0hDyMSqURqhhEf2KxcW8E1TvdQhmVZcjlrfscG
	Bg9XXTptmuh9tE0x4GuEVwsitwKivI+LMiu8Iy0oLuXSBNo1vw6O1aoZR9h7PZ+1wA4oHixuMkDQ9
	IBpgReHB7diMqTHIPFzqXYh6iYjkIKzLdnikroLRxHEt+NEibrqcA8d+qUzQaYFcxWkcG0W/bI9xg
	w2G4DWtKQxuSiJkv+Tj2xLDr1nxdwKPd+jtN1Bjuz1vTh8u7AuLXxexZCPF1obWgNssvpuCLvhPfh
	JzPN4+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5Gx-0000000CsqX-21WM;
	Tue, 06 Jan 2026 11:30:47 +0000
Received: from mail-106100.protonmail.ch ([79.135.106.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5Gu-0000000Csq6-3K6X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail2; t=1767699039; x=1767958239;
	bh=mpZ9a6BXZLK2t8VLw/I32vovbpQXSb2aQUMDb54O4es=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mizbAzOsLh3qycHcIAVYKJQ+eFrxAa5/EfrTxq2h4TvFlUp/ck2DJTtSh2jyedtyw
	 yiusH5ZdqIV3dYLmdc6cxVeixwBM/XaaBCuQDukVVfs4BhJe5sy2seNLHdLR9nf27q
	 yKrmMQn/Nni3gDKD7oqyRu8LRNsJDPa5rvLyXTnTnjn4sOhlQiYxhykXPi1JSIL14r
	 +bbvi+DifomcYj4aIIfg23ECZKtNfcgQBFu8LKWZX3288fYl+3J27ES1Wj3D1gKfxj
	 oXmGa9gponyar1Y9QpPU58qCLEIJlaUGEMXD78WJVPOxEuRYrgPiKQZpI5sb7Da3Fu
	 +ugk9btn6901A==
Date: Tue, 06 Jan 2026 11:30:34 +0000
To: =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
From: Sean Nyekjaer <sean@geanix.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pwm: stm32: handle polarity change when PWM is enabled
Message-ID: <2e2iahbzcepbzwgk7xeta2afxmycfjgv2zofzngqjvp4on46r2@mzpi4bz4uqie>
In-Reply-To: <kemjjoyrhqglqq4p2j6kygspevq2mdbiujtnksw4rkdapoqcfy@zte2c7fhqvn3>
References: <20260106-stm32-pwm-v1-1-33e9e8a9fc33@geanix.com> <kemjjoyrhqglqq4p2j6kygspevq2mdbiujtnksw4rkdapoqcfy@zte2c7fhqvn3>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: 2e006c92e9af34182a73b56e93f3230599eee605
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_033045_749477_25805B36 
X-CRM114-Status: GOOD (  30.69  )
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

Hi Uwe,

On Tue, Jan 06, 2026 at 11:22:57AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello Sean,
>=20
> On Tue, Jan 06, 2026 at 08:01:57AM +0100, Sean Nyekjaer wrote:
> > After commit 7346e7a058a2 ("pwm: stm32: Always do lazy disabling"),
> > polarity changes are ignored. Updates to the TIMx_CCER CCxP bits are
> > ignored by the hardware when the master output is enabled via the
> > TIMx_BDTR MOE bit.
> >=20
> > Handle polarity changes by temporarily disabling the PWM when required,
> > in line with apply() implementations used by other PWM drivers.
> >=20
> > Fixes: 7346e7a058a2 ("pwm: stm32: Always do lazy disabling")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > ---
> > This patch is only applicable for stable tree's <=3D 6.12
> > How to explicitly state that and what is the procedure?
>=20
> I haven't checked in detail yet but I wonder if the problem also exists
> in newer kernels. Also I think that changing the polarity with the
> hardware on happend before 7346e7a058a2; in that case you blamed the
> wrong commit.

For your reference i bisected to that commit.

>=20
> So even if we decide to apply a small targetted fix for the issue you
> report to stable without an equivalent commit in mainline (due to the
> rework the driver saw in v6.13-rc1~157^2~9^2~3 ("pwm: stm32:
> Implementation of the waveform callbacks")), I refuse to do that if the
> problem still exists in mainline.
>=20

I have tried to boot stable/master 6.19.0-rc4, my backlight is on!
In stm32_pwm_write_waveform() TIMx_CCER is set before MOE is set.

> > ---
> >  drivers/pwm/pwm-stm32.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> > index eb24054f9729734da21eb96f2e37af03339e3440..d5f79e87a0653e1710d46e6=
bf9268a59638943fe 100644
> > --- a/drivers/pwm/pwm-stm32.c
> > +++ b/drivers/pwm/pwm-stm32.c
> > @@ -452,15 +452,23 @@ static int stm32_pwm_apply(struct pwm_chip *chip,=
 struct pwm_device *pwm,
> > =20
> >  =09enabled =3D pwm->state.enabled;
> > =20
> > +=09if (state->polarity !=3D pwm->state.polarity) {
> > +=09=09if (enabled) {
> > +=09=09=09stm32_pwm_disable(priv, pwm->hwpwm);
> > +=09=09=09enabled =3D false;
> > +=09=09}
> > +
> > +=09=09ret =3D stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity=
);
> > +=09=09if (ret)
> > +=09=09=09return ret;
> > +=09}
> > +
> >  =09if (!state->enabled) {
> >  =09=09if (enabled)
> >  =09=09=09stm32_pwm_disable(priv, pwm->hwpwm);
> >  =09=09return 0;
> >  =09}
> > =20
> > -=09if (state->polarity !=3D pwm->state.polarity)
> > -=09=09stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
> > -
> >  =09ret =3D stm32_pwm_config(priv, pwm->hwpwm,
> >  =09=09=09       state->duty_cycle, state->period);
> >  =09if (ret)
>=20
> I would prefer the following change:
>=20
> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> index eb24054f9729..5f118c20f1ca 100644
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -452,12 +452,16 @@ static int stm32_pwm_apply(struct pwm_chip *chip, s=
truct pwm_device *pwm,
> =20
>  =09enabled =3D pwm->state.enabled;
> =20
> -=09if (!state->enabled) {
> +=09/* The hardware must be disabled to honor polarity changes. */
> +=09if (!state->enabled || state->polarity !=3D pwm->state.polarity) {
>  =09=09if (enabled)
>  =09=09=09stm32_pwm_disable(priv, pwm->hwpwm);
> -=09=09return 0;
> +=09=09enabled =3D false;
>  =09}
> =20
> +=09if (!state->enabled)
> +=09=09return 0;
> +
>  =09if (state->polarity !=3D pwm->state.polarity)
>  =09=09stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
> =20
> Maybe it's just me, but I think the resulting code is simpler with this
> hunk.

Fine with me, I just looked at the other PWM drivers and copy/pasted
from them :)

>=20
> I have hardware using this driver, will set it up later this week for
> testing.

Very cool, looking forward to hear if you can re-produce.

>=20
> Best regards
> Uwe

/Sean


