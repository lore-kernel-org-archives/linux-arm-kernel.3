Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DA9CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 10:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/Nk4vPQPh0CW8IIxSh5GD9J7BcZmYtjb7vHxo1Fj6A=; b=JfEpxbEZsbI8ytMPtLk5H/LOs7
	Ow+/DcYHd98qFfo4Hlg7EAZEICAVSEl5Tc6ieygYb1d1BlS4TBSznwdAqsTFZ3jMDoOH8ZtGhz0q4
	9Got2DHefgqyXtlqUDdlk1yiqN4kHRzB+DQqh/gyEzYSgQJqELQ+tCXnBNhpXEyDOdKzMSVO3R4G0
	KQka56BrGQA0C3Opz79/6n7sFbbm28JP1YH8tX+VpD34cyhAmrwzwsppc1QugaHApgbVr84Z+vmj7
	PsJEgFfvj7OT0qLZxT/Xrnv/umBV+TrooNRJQYpBGHKMibpFYPBJSlLLGqS/+B9pPwBSIn+MLU8fe
	wbmjH7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdtC-00000004HhZ-1vzw;
	Wed, 20 May 2026 10:10:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdtB-00000004HhN-0dI5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 10:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8/Nk4vPQPh0CW8IIxSh5GD9J7BcZmYtjb7vHxo1Fj6A=; b=hx+8vzyVZ/btOkzMxWD0Gp24py
	MAzCCFQxpm9foQvYIStKkerXr2u79Dasla8n4JTF9ytACe5GHCJWvJKpFBFO6xXzUt7NaC8Gjfl83
	zJZv7kD3kUQ32pGaSQPQdOH9kJwAT65k7zAbogBV0qpay+P26wttsFL+bb5n9FGPj0qsvojpalHIK
	//6YLWhOKYOKNOlTSOcSK1CZD4CmmAlr2TQHK5rHdfDZCURM2OCJFdOgsOsFa6Tml4m/YEiU+H8Wc
	GXQyfnaYMih5fwwLqu/nxDS1aLZk2KApdvtYnuhu9UcrWwjHiVVHVfNhR73Xyl+avI1Ak9xyPZ/F7
	8LcavSbw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdt1-0000000GShL-35Vs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 10:10:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 758504346E;
	Wed, 20 May 2026 10:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BAF1F000E9;
	Wed, 20 May 2026 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271846;
	bh=8/Nk4vPQPh0CW8IIxSh5GD9J7BcZmYtjb7vHxo1Fj6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kqzyR9iarPoVRPZapZy1o91ByBc5CmJZZ1xpTdT2vRSRwBSf0TtB18tSB+Uh8mKRM
	 /mVD4QHz6XlazB8ms3CjXQ8yxVtPzWCFwWYKDxag41kPFbhMAU8kiBSuPK7h8x7lA7
	 fTW3cWzof75A2x4RXGR79xVMK5FI6CoejoTSEfj/Mc3Plp0PWM7amSzapYHEmgS0Qg
	 pAotSBhZ4lT4RQPE4oc//Rhb4qOg8YWjjY7oRmDlq3kQ5z5nh/fS2UDyCi3jPncf5K
	 BJ44bQaRUg3as4vSafa8HLa3Wqed5w7ptmPTeTirZFz2b/WpLc2kVGMk+sbhLwizUK
	 ANXHF1UvN+a0w==
Date: Wed, 20 May 2026 11:10:41 +0100
From: Mark Brown <broonie@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, clg@kaod.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] spi: aspeed: Replace VLA parameter with flat pointer in
 calibration helper
Message-ID: <b629d6bb-fb17-4c17-9a79-d96d39ed0d0b@sirena.org.uk>
References: <20260518095708.2502537-1-chin-ting_kuo@aspeedtech.com>
 <20260518095708.2502537-3-chin-ting_kuo@aspeedtech.com>
 <659a6593-0223-4a26-830b-1390326b84e5@sirena.org.uk>
 <20260519181348.777f7dc5@pumpkin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KmowL/JuPoFq42Ku"
Content-Disposition: inline
In-Reply-To: <20260519181348.777f7dc5@pumpkin>
X-Cookie: Natural laws have no pity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_111053_304675_6EAA7F7B 
X-CRM114-Status: GOOD (  14.92  )
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


--KmowL/JuPoFq42Ku
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 06:13:48PM +0100, David Laight wrote:
> Mark Brown <broonie@kernel.org> wrote:
> > On Mon, May 18, 2026 at 05:57:08PM +0800, Chin-Ting Kuo wrote:

> > > -			while (k < cols && buf[i][k])
> > > +			while (k < cols && buf[i * cols + k]) =20

> > This really needs () to make it clear what's going on; the precedence is
> > well defined but not everyone is going to know that off the top of their
> > head.

> Come on, it's multiply and add - everyone is going to get that right.

No, I have to stop and think.  It's not just "what is the rule" it's
also "is that the same rule whoever wrote the code thought there was" -
implicit precedence is the sort of thing that flags up as an alarm bell
when scanning through code.

--KmowL/JuPoFq42Ku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoNiKAACgkQJNaLcl1U
h9BIxQf9HkMWU0/J36NRwMFjRutEI7x1P5sg8Sloy12eLKK6LBY1hzsPKyZ4ZaIw
vVtbThixSNpcSL6oBndIVKdvWoWyYT/o3x2bfTnzKHbdKT5Ok9heXD6aSc/f1ck4
k0Xp0kN9MptpXrEEVBr15nBjhkUOOyFVnlsFotYE9TBzhGWBWxJrQrK1w+eBYu6r
MEd0mR0/FfuUwFm27aMR6Ur33GRUPs/pVN5/2ndfNGwtIXrjKICYIQ5/lJyONp+5
nCIorPasL6Yywp5B6+p492omJxkuUpkq3EhWhwowOwTD/zlpnglzkNyVuIp3E3Wf
jyCptDj/7h3ujYiwLZ80EgTAcxFF4A==
=pk4f
-----END PGP SIGNATURE-----

--KmowL/JuPoFq42Ku--

