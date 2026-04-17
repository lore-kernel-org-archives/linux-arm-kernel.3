Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B4FF4368A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOEjg9H4WHmfDp+/GfeO6AbXlJ+ZvwEfMwwkt6HZ3i0=; b=N5LKg2hKRrOpQALY74UhXJi+pZ
	v1VaXReDGehyx4Y5aWBhhAmfQ1TwMZXlooIPHu7AAsWBzLfq/5Ekg7hRtZIPslePiNymL5uffzM5Z
	Oz+P6VIWUv2Z/tS8VNoUEQJWSLOXrbHMaQNZn53FHlYko8AIDEYqSpXylQh7qFi+VLtadHOLsyIry
	32gpZBFEXqYwfxiVYFgkygLEjQvX020ZQ6o9Oi+SE+Em9ppVpu7QN141eJzkUJRjc7T/mOdsAEuNV
	2LGvs6/ItdESAjEND8AGRmod8PQEKIinowo0whHvZEnIoGEzBEHJ+esQkVbZDDVREtKVwZ3KkuJpx
	nxDkdzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDgmt-00000003vtH-1a9I;
	Fri, 17 Apr 2026 10:51:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDgms-00000003vt6-02S4;
	Fri, 17 Apr 2026 10:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33BF36012A;
	Fri, 17 Apr 2026 10:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598B2C19425;
	Fri, 17 Apr 2026 10:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776423060;
	bh=kSJnzsPBw1lwFdGqflMCj/6BVcSbCNpP00or8JnwiYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/e0wyp+Xc6NNHKUyHtFrHHPGSo6IYdvVQvKiDzzKeC09oFmSMfadNFHPXN/Yx+gi
	 u/J79Qs35UD/m8ifRZk6uCHcXJYx6fYIG1Oy+OL7BLUciEYV1FpgdyDp/0pvRyDY/D
	 cKeG2UO2VIB1CGiVNZuxEgAlk1Fe09ijL0DBvcyDzPO5IgxF7XZJ2+wiRUWQsrIW0H
	 W08bE2dxVEjnUXH9cj696C9n3Sua6P48Jhi4OipIhipTQeO/Qt7ICdenouvHvYNmpx
	 kvgT50OSWf1rdnhGbvgbzZElNmXPGLELxCUZsxK1XB7tYzmm2ulYiS8tqAgw9S6XM/
	 ApVbtfcb+FHhg==
Date: Fri, 17 Apr 2026 12:50:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Naushir Patuck <naush@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v2 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aeIGxfQ7AoIVR5n6@monoceros>
References: <cover.1775829499.git.andrea.porta@suse.com>
 <0d99317b9150310dfbd98de1cb2a890f0bffe7cd.1775829499.git.andrea.porta@suse.com>
 <adkrHkANCzxO8KUP@monoceros>
 <aeC6U7D6TfWm8JPx@apocalypse>
 <aeDmk-t5Lc1zpkg9@monoceros>
 <aeH373a_xmr6fnAy@apocalypse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nnaiyhbmq7n4v5c7"
Content-Disposition: inline
In-Reply-To: <aeH373a_xmr6fnAy@apocalypse>
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


--nnaiyhbmq7n4v5c7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] pwm: rp1: Add RP1 PWM controller driver
MIME-Version: 1.0

Hello Andrea,

On Fri, Apr 17, 2026 at 11:05:51AM +0200, Andrea della Porta wrote:
> On 15:48 Thu 16 Apr     , Uwe Kleine-K=F6nig wrote:
> > one thing I forgot to ask: Is there a public reference manual covering
> > the hardware. If yes, please add a link at the top of the driver.
>=20
> Sort of, it's already reported in this driver top comment (Datasheet: tag=
).
> The PWM controller is part of the RP1 chipset and you can find its descri=
ption
> under the PWM section. This is not a full-fledged datasheet but the regis=
ters
> for the controller are somewhow documented.

Ah, then I missed something different than I thought :-)

> > On Thu, Apr 16, 2026 at 12:30:43PM +0200, Andrea della Porta wrote:
> > > On 19:31 Fri 10 Apr     , Uwe Kleine-K=F6nig wrote:
> > > > I assume there is a glitch if I update two channels and the old
> > > > configuration of the first channel ends while I'm in the middle of
> > > > configuring the second?
> > >=20
> > > The configuration registers are per-channel but the update flag is gl=
obal.
> > > I don't have details of the hw insights, my best guess is that anythi=
ng that
> > > you set in the registers before updating the flag will take effect, s=
o there
> > > should be no glitches.
> >=20
> > Would be great if you could test that. (Something along the lines of:
> > configure a very short period and wait a bit to be sure the short
> > configuration is active. Configure something with a long period and wait
> > shortly to be sure that the long period started, then change the duty,
> > toggle the update bit and modify a 2nd channel without toggling update
> > again. Then check the output of the 2nd channel after the first
> > channel's period ended.
>=20
> I stand corrected here: after some more investigation it seems that only =
the
> enable/disable (plus osme other not currently used registers) depends on =
the
> global update flag, while the period and duty per-channel registers are
> independtly updatable while they are latched on the end of (specific chan=
nel)
> period strobe.
> I'd say that this should avoid any cross-channel glitches since they are =
managed
> independently. Unfortunately I'm not able to test this with my current (a=
nd
> rather old) equipment, this would require at least an external trigger ch=
annel.
> Regarding the setup of a new value exactly during the strobe: I think thi=
s is
> quite hard to achieve.

To sum up: period and duty_cycle changes might result in glitches unless
the channel is disabled. This is ok, please just document it.

The purpose of the update flag then is only to start several channels in
sync? What happens if sync is asserted while a disabled channel didn't
complete the last period yet?

Maybe it's worth to test the following procedure for updating duty and
period:

	disable channel
	configure duty
	configure period
	enable
	set update flag

Assumint disable is delayed until the end of the currently running
period, the effect of this procedure might be that no glitch happens if
the update flag is asserted before the currently running period ends and
the anormality is reduced to a longer inactive state if the updates are
not that lucky (in contrast to more severe glitches).

If you can configure a short and a long period that is distinguishable
"manually" with an LED I think this should be testable even without
further equipment.

> > > > > +	if (ticks > U32_MAX)
> > > > > +		ticks =3D U32_MAX;
> > > > > +	wfhw->period_ticks =3D ticks;
> > > >=20
> > > > What happens if wf->period_length_ns > 0 but ticks =3D=3D 0?
> > >=20
> > > I've added a check, returning 1 to signal teh round-up, and a minimum=
 tick of 1
> > > in this case.
> >=20
> > Sounds good. Are you able to verify that there is no +1 missing in the
> > calculation, e.g. using 1 as register value really gives you a period of
> > 1 tick and not 2?
>=20
> You are right. The scope reveals there's always one extra (low signal) ti=
ck at the
> end of each period.

So the hardware cannot do 100% relative duty, right? Please document
that.

> Let's say that teh user want 10 tick period, we have to use
> 9 instead to account for the extra tick at the end, so that the complete =
period
> contains that extra tick?

I would describe that a bit differently, but in general: yes.

The more straight forward description is that setting

	RP1_PWM_RANGE(pwm->hwpwm) :=3D x

results in a period of x + 1 ticks.

> This also means that if we ask for 100% duty cycle, the output waveform w=
ill
> have the high part of the signal lasting one tick less than expected.a I =
guess
> this is the accepted compromise.

I assume you considered something like:

	RP1_PWM_RANGE(pwm->hwpwm) :=3D 17
	RP1_PWM_DUTY(pwm->hwpwm) :=3D 18

to get a 100% relative duty?

If this doesn't work that means that this has to be formalized in the
callbacks. That is the fromhw function has to always report
duty_length_ns less than period_length_ns.

> OTOH, the minimum tick period would be 2 tick, less than that will otherw=
ise
> degenerate in a disabled channel.

It's expected that in general for a period_length of 1 tick you can only
have 0% and 100% relative duty. IIUC for this hardware you cannot do the
100% case so there is only a single valid duty_length for period_length
=3D 1 tick.

I think it would be more complicated to consistently filter out
period_length =3D 1 tick in the driver than to just accept the conceptual
limitations. (Otherwise: What would you report in the fromhw callback if
period_length =3D 1 tick is configured in wfhw? Would you refuse to commit
that wfhw to hardware in .write_waveform()? The pwm core handles that
just fine and consumers have all the means to detect and prevent that if
they care enough.)

> > > > On remove you miss to balance the call to clk_prepare_enable() (if =
no
> > > > failed call to clk_prepare_enable() in rp1_pwm_resume() happend).
> > >=20
> > > Since this driver now exports a syscon, it's only builtin (=3DY) so
> > > it cannot be unloaded.
> > > I've also avoided the .remove callback via .suppress_bind_attrs.
> >=20
> > Oh no, please work cleanly here and make the driver unbindable. This
> > yields better code quality and also helps during development and
> > debugging.
>=20
> I wish to, but the issue here is that this driver exports a syscon via=20
> of_syscon_register_regmap() which I think doesn't have the unregister
> counterpart. So the consumer will break in case we can unbind/unload
> the module and the syscon will leak.=20
> If you have any alternative I'll be glad to discuss.

My (not so well articulated) point is: Please be stringent about clock
handling to not bank up technical dept more than necessary and such that
the driver can be made unbindable if and when syscons grow
that feature. Optionally wail at the syscon guys :-)

Best regards
Uwe

--nnaiyhbmq7n4v5c7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmniEI8ACgkQj4D7WH0S
/k580Qf/SO3OiWMc9QDwejdP76mKbZJN81A0PEMT1XqTsTsB04ePmAQV8kf4+BrG
fmv8hLQCTDUCRLXxdAaveYUiefKqE7oArFXJO4FJYs8R+BOCO1jK58OawmjxlCA7
k6K4ccZp0ZrMdo6OwkQ+0N1rN/Wxuxmo2faGwkaVwacC7Ot/yobuE+hKfBVram3I
/qBpp04vKsNmxBKGxi1ziUIKajDkE/VvPd98qWGEp5mI2JpLQFeHXLnHQyHPEwhU
LJeXkbClLqYLhkobqw0f/etJZzFFGWyGQEeEuS9gBjufT2H3cQMplqRt/wemSjlR
uSf1kc+4Z7NqJrm17G3PgBJDLbOj8w==
=lj2I
-----END PGP SIGNATURE-----

--nnaiyhbmq7n4v5c7--

