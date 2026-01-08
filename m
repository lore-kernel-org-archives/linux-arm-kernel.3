Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15482D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxqTloeRRUJ6OTAy8ylqgLk5rTozFp8ZfC7yqvSuiZI=; b=sfaeagEFRdKMOrLDClIZxg9KF0
	gF9Ag2FimGgwof859WUSXzWs/6FexiUaph1ll0qwoA87CnpEMvRuQ37yu8ksi3dbuQXpu7ZkePZ0v
	7GWQLkwQti2q4P27qoBKOZGDal/+xPcuaHojFx0UjPs9vcUTX/ZNtmG+be57hgtvQuRKxiHSzkAYB
	3i1wFM+vSIzIQiVav1lji4O7vZeq9gZ6MsGxSW41UAmGgacuxrou/dIgPgjoJP21+PfvxKFgNyBh1
	rY/2GGtGJg34jnbrUsDcSPKQCXDNUya024X3YAvGFVxh7s0F+MwtFqs6flP2Olxxtubu5AA2Co1aS
	rREwxzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsST-0000000029Z-1B40;
	Thu, 08 Jan 2026 16:01:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsSP-0000000022h-0GIB
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 Jan 2026 16:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sxqTloeRRUJ6OTAy8ylqgLk5rTozFp8ZfC7yqvSuiZI=; b=jeOuk6wS5IfnCMdv6kAUT0Je46
	rRISQVDHu6I70xMv6Qril/gSzvOMXZeG3EuRShMFVbNpRB7c5Z9IAsn3rLkyPhjAEjCk4/s2rDdI3
	r6ITZ0qBB2CmF/3NTr0hhxoHew5eOFC+gvFeEJ4qxFFtMyRY/89a80RQz/IWKvT6IKixoLq4dMaAw
	CeOZ1L/yd2SrIK9onGHpp/m/iFjMd56adX+//jm3DvPEDNRqrJiX8AmXPrWwNsoyl6iQKZGsP2G4r
	QCx4LPgX7M+3EMRU5T4wPH3aMP4gP+jzRpYwMsekc8BHAqjR0/C96GGJcHql40b/gctb74pOoRdjW
	Vwf2rK5A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsSK-0000000Daa0-1sSO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:01:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF516439A1;
	Thu,  8 Jan 2026 16:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71169C116C6;
	Thu,  8 Jan 2026 16:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767888103;
	bh=sxqTloeRRUJ6OTAy8ylqgLk5rTozFp8ZfC7yqvSuiZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=flWD6jlR1Z44zvUG/fL3f5FNu3EI/1cBSatqAL5XBmWvlKYlOi9c0pe35AK4vYMsd
	 4lumye5+L76U5O9nywXUC+l6xYjFiW9WX0nUeDQ4ETPhbSI7kBEnnRrwoGhGVqTbXc
	 TOQfNxtoAI634qY14nkDUQKKZEe6LIA0Ot6ncS0oUUZstX651CNuNWOmVRf/z7V6So
	 O0hsgiB5CgKvWJfkuQWydML0rll3BwyNvU/r4+oljTNHHaj5oeECVrXJS2rcwmMHU2
	 Gj1KDqk+MMdmKD1x+cTqJNzyZosjq4qxjqkCmUlv51VKwqolgrFaKKk17fE7CEh6aJ
	 Dxw+C9qou+kNg==
Date: Thu, 8 Jan 2026 17:01:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>
Cc: Sean Nyekjaer <sean@geanix.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] pwm: stm32: Always program polarity
Message-ID: <j7qywnmejd4v2tez77hxmjnq7pavmaoed7z4aoelsbfdyt4qyx@7jawgsz2kfy7>
References: <20260108-stm32-pwm-v2-1-ced582974f8b@geanix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6bapewmlqmprl67v"
Content-Disposition: inline
In-Reply-To: <20260108-stm32-pwm-v2-1-ced582974f8b@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_160148_750840_711431DC 
X-CRM114-Status: GOOD (  15.20  )
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


--6bapewmlqmprl67v
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: stm32: Always program polarity
MIME-Version: 1.0

Hello Greg,

On Thu, Jan 08, 2026 at 01:45:23PM +0100, Sean Nyekjaer wrote:
> Commit 7346e7a058a2 ("pwm: stm32: Always do lazy disabling") triggered a
> regression where PWM polarity changes could be ignored.
>=20
> stm32_pwm_set_polarity() was skipped due to a mismatch between the
> cached pwm->state.polarity and the actual hardware state, leaving the
> hardware polarity unchanged.
>=20
> Fixes: 7edf7369205b ("pwm: Add driver for STM32 plaftorm")
> Cc: stable@vger.kernel.org # <=3D 6.12
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> Co-developed-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>
Signed-off-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

> ---
> This patch is only applicable for stable tree's <=3D 6.12

Can you please apply this patch to v6.12.x and older? The problem fixed
here doesn't happen in mainline since commit deaba9cff809 ("pwm: stm32:
Implementation of the waveform callbacks"). That mainline commit however
is too intrusive to backport it to stable, not even considering its
dependencies (e.g. 17e40c25158f ("pwm: New abstraction for PWM
waveforms")).=20

I assume such an exception to the sable process is ok and the patch is
simple enough to be easily reviewable? If not, tell me, then I can apply
the patch and merge it (with `-s ours`) into my next PWM pull request to
Linus :-)

Best regards
Uwe

--6bapewmlqmprl67v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlf1NoACgkQj4D7WH0S
/k6OqQf9FV+4wHydQ1d2QmXQkObz1Jz2DRvaFNGUHj2G6fyzrdXWZdOhetkguAQ9
b/pP0M15fUph3X2jzWn9/ftG1C4xzCJFzDEbxu2nZAoQy3lhZwIKq0IfiueG7eHZ
8jg1wcUZRgJPc3fVp3KFr0w8s+pAq5m4RCX+EAeG/3rZyLKV2zpPNOOXq2kVRm8Y
VnevGuGZk/U1CkgI3wSpXmd8/ueQTPOHh3fO/an9mB6xjSPNHJ/NClILhzYHAR9i
FyxIQm+py1G/cPfbmFNSfNKniIiDSNZHj2Z/bsv/R8SiHEn3pqThTGdZShy3z4uF
jCCjRCfUrPQ+/OqPwN20f/16HMtR7g==
=WGlv
-----END PGP SIGNATURE-----

--6bapewmlqmprl67v--

