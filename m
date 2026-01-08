Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61033D185DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 12:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9Gn14IpojzvUVrHWdXmzVkyL12/O34BYkSCNxkLXBk=; b=4FZqs1FlvZcr1wMnuOvrbQ2g76
	hQXmrJ/S4/Zv98ApmR2Wyw4Do1IGj91/crXNQ12zqRpd1zaz/Wq0UGhxVxUa/kbiltrwhaJFfyMR8
	pJ6xfIIcu/Gj0EoFyA2iFIHN81N3cnaKi1sXzXISNahMyDygXSS9m3JyOS1r7g/yrlai95wiMwLkk
	xUwu0IUnW/BTlXEmT4RKIHdEnANYNrGUkjr10Qj0JWw+Z+0vuJiVZdyUVXE7ubCDvOYlRN8nz+6uu
	FvJ+wrnqPwxlK2Q+OYuegbxowRJ2wFTGweKD87NgVvFOzclzQE9XYxJ1kIoXCTgTWFpEo9FQc8G0X
	nUeelvpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoqa-0000000GwPF-3Q53;
	Thu, 08 Jan 2026 12:10:36 +0000
Received: from mail-4398.protonmail.ch ([185.70.43.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoqW-0000000GwNV-1Mgk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 12:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail2; t=1767874226; x=1768133426;
	bh=e9Gn14IpojzvUVrHWdXmzVkyL12/O34BYkSCNxkLXBk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=M4oCYYR05LjR1zuWmGDLY2NUDmgqoA0Gs7RIIA+jsPfvKLSztQWtPWNrCFHINJfCA
	 HFXOvt9td6Rtbae2jI34iZADjK26DfHt8wMZYngw2WqA3QgjgtfA19ixm0AiMX/5nA
	 GspzkdlI2oqkssw84nB6a2pxOpT2syKFjRd0aJl9DbkXW7oyDKLBpLkG6GSnJQdLvd
	 msN4snaag7B79uKVpGOK3aKfLCmTgMGoX7I7FpmPlQQkcc6S9udkPEMDy/cBtMjrhQ
	 1mg2gUajN4kAVQonHK1UpGoTOzGMTbko1kMlPnvL+3RYZaFymnmkO+XYQJ9Sr1ye5u
	 Mtj7TEkdLVBMA==
Date: Thu, 08 Jan 2026 12:10:22 +0000
To: =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
From: Sean Nyekjaer <sean@geanix.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pwm: stm32: handle polarity change when PWM is enabled
Message-ID: <scu6yj7say5bnhbgyns4xrjbrzdayckk2ghn2a4xsgg4dswakv@6ushlcfw4dju>
In-Reply-To: <r2jq72u3hfxrl4slgvuei2eobke37apebf67naxrvuabtcvaxe@pamwe3nejqge>
References: <20260106-stm32-pwm-v1-1-33e9e8a9fc33@geanix.com> <kemjjoyrhqglqq4p2j6kygspevq2mdbiujtnksw4rkdapoqcfy@zte2c7fhqvn3> <2e2iahbzcepbzwgk7xeta2afxmycfjgv2zofzngqjvp4on46r2@mzpi4bz4uqie> <nwhixocvhii27jvcyg7ex5emewntgfhyxa4ds5vo2dphe7xfe4@ibjsjdd5fgmn> <fwaodg2ovh7j47ifwjhgeppxs3oiqht5ecbs7bmfbi7j6djejs@shwokpcmutr3> <zj2vpruzoeyvyyzxiqcffajyhpmem4q75l6gzgxd4jgaizhrdq@bxuudn4kyvr3> <paj3uf6apunonvfz2w2anqmddivjrofmfo5wktygz4r6l7diqf@7gen7gjgyuar> <r2jq72u3hfxrl4slgvuei2eobke37apebf67naxrvuabtcvaxe@pamwe3nejqge>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: 65182a408632275be51d6c5397e4a1b9201fdc8e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_041033_264435_F37471E5 
X-CRM114-Status: GOOD (  22.46  )
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

Hi,
On Thu, Jan 08, 2026 at 12:33:10PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Thu, Jan 08, 2026 at 06:44:06AM +0000, Sean Nyekjaer wrote:
> > I hope that clarifies things :)
>=20
> It does. I'm convinced the following patch implements a simpler fix:
>=20
> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> index eb24054f9729..86e6eb7396f6 100644
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -458,8 +458,7 @@ static int stm32_pwm_apply(struct pwm_chip *chip, str=
uct pwm_device *pwm,
>  =09=09return 0;
>  =09}
> =20
> -=09if (state->polarity !=3D pwm->state.polarity)
> -=09=09stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
> +=09stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
> =20
>  =09ret =3D stm32_pwm_config(priv, pwm->hwpwm,
>  =09=09=09       state->duty_cycle, state->period);
>=20
> While is isn't optimal as it might write the polarity into hardware when
> it's not necessary, the same holds true for the values for duty_cycle
> and period. Compared to your patch this is simple enough to make me ok
> with applying it to 6.12.x (and older stable kernels) without an
> equivalent commit in mainline. (Backporting the waveform stuff is out of
> the question IMNSHO.)

The above does work, I have also checked that it doesn't write the
polarity if the PWM is active.
Agree, with the backporting part :)

>=20
> Also I'm still convinced that 7edf7369205b isn't the correct commit to
> blame. This one changes the preconditions for the problem to occur (and
> thus it's plausible that it's the result of your bisection), but even
> before 7edf7369205b the problem can happen with:
>=20
> =09pwm_apply(mypwm, &(struct pwm_state){ .enabled =3D true, .polarity =3D=
 PWM_POLARITY_NORMAL, .period =3D DC, .duty_cycle =3D DC });
> =09pwm_apply(mypwm, &(struct pwm_state){ .enabled =3D false, .polarity =
=3D PWM_POLARITY_INVERSED, .period =3D DC, .duty_cycle =3D DC });
> =09pwm_apply(mypwm, &(struct pwm_state){ .enabled =3D true, .polarity =3D=
 PWM_POLARITY_INVERSED, .period =3D DC, .duty_cycle =3D DC });
>=20
> After the 1st call polarity is configured to normal (unless the bug
> happens already earlier :-), the 2nd disables the hardware without
> configuration of the polarity (before and after 7edf7369205b), and the
> third skips setting of the polarity because state->polarity already
> matches pwm->state.polarity. The original problem exists since=20
> 7edf7369205b ("pwm: Add driver for STM32 plaftorm").
>=20
I will move the fixes tag.

> Are you able to create an improved patch with these insights in a timely
> manner? (Grab authorship for yourself and honoring my part with a
> Co-developed-by is fine for me.)
I'll do it now and add the Co-developd-by tag

/Sean


