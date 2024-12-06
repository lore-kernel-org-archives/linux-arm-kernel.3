Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379E7E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpS/Zt5Xq9vuGvkn4jptuxcPyo4ktemXE6eY8TMimTI=; b=Mk14UhPx+2B5xIrEiqcW8oxWKr
	Q5zf3rTDYU5fNso5NLUOTwYwyMfEzBRgx+rOCpN7jtV/3OuFEADnl04Gula6HJBWXa5KzjA6DHADF
	3giX//51MfFAUEt2yUpVyus3wZqvVemrQaapWrJq57cQOluI5cIJvE/3UDGC6EMgXLwO1tTEzATAO
	++BvWyhP8v4IXUnAZ55cmIJVMSbZzbtprvEQv4jGzVqm4ozIsaR8K7I4M/x6fREHYAbCnWj96KhEe
	ghhr/HIrvFLDK5SflgLSZxwZLiFVsSuPvfVS3gSPwlRcoBxWd6LdLWogp0GXTfEGgtNew3Sl6SZ3V
	EQbcrfOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbav-00000002FP5-1eNn;
	Fri, 06 Dec 2024 16:54:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbZu-00000002FBC-2vTz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Dec 2024 16:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JpS/Zt5Xq9vuGvkn4jptuxcPyo4ktemXE6eY8TMimTI=; b=P6WybMvrn3HF7S6ShNpM6suGvp
	xC35+VWORU26fzhlO8vlG0y2qicInpY6MyaG7v0DyqB2mOORde8RvjtpA0z4p43Gh9kso0BafevLe
	K0RCtmvTYcO8DyrRuCkHkMNOncZfWQd6udpO053Ht5TSgYY3P18xUs0bvTzYhqkBeIqKMqV2qt6Hj
	VocBS+0OqZaxrk0wE77rsYtTDsSWQXcxPRWerF0urmGYoDd5pyvxthLGid6zcTK9YRfqZxvC1kF92
	iVHzJkq4hVhL5HrZIUtNiNM0DDGyhyVR0SQGo5mtaRk5sTP6aY8+32Ano7/cAdXTrEuVNoE5H3Om4
	1Bifxkig==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbZr-000000037YV-3gHx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:53:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C03DF5C5B4B;
	Fri,  6 Dec 2024 16:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2E6C4CED1;
	Fri,  6 Dec 2024 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733503991;
	bh=JpS/Zt5Xq9vuGvkn4jptuxcPyo4ktemXE6eY8TMimTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHza94HH8zx5zpl+tyZniMpGI8BVsXN6Ue6b1SnP0Q2AeEPTMtSpePIt0PNJ7ln5e
	 Bi8fql9veu1U3/o5xq0bkxI8FinVXnn5uxim3eo/IA2y/t3LGchsLlmh7Qm2s2qrae
	 lDtyaJUupUDJ2Oxf7PNi68ZUKN5YK26EiBhd8DAxIYdWA8aBkLlkqpIppabcDR9PpU
	 eBZ++wepN8+6I3qTEUj3RCuJmHq8Rjr/De8FAfTMIew/3IrS15ou8lfHgZQ0EHeed9
	 llM9rjlFP/esIVb0Ef1TSlkYCbxvsJalbYZ/0bY5ZgOsEufHV9g6xvBhPzdJmLlhYW
	 Ni3LPwqthYfyA==
Date: Fri, 6 Dec 2024 17:53:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: fabrice.gasnier@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, hierry.reding@gmail.com, lee@kernel.org, 
	linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: Re: [PATCH V2] pwm: stm32-lp: Add check for clk_enable()
Message-ID: <o6rh2bcxnnubhx6xem55otgequw5zrqmkretcgofohvcpbygdw@z3qagurhjyp3>
References: <20241206012605.2877412-1-zmw12306@gmail.com>
 <cim6rnzdvhik4kdibfmglf6jiky7xccynqwazmxmnr2f5fvu3f@lvoo3drlgaua>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lvtle2mtnfezbcjm"
Content-Disposition: inline
In-Reply-To: <cim6rnzdvhik4kdibfmglf6jiky7xccynqwazmxmnr2f5fvu3f@lvoo3drlgaua>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_165316_152324_DD66456E 
X-CRM114-Status: GOOD (  17.02  )
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


--lvtle2mtnfezbcjm
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2] pwm: stm32-lp: Add check for clk_enable()
MIME-Version: 1.0

On Fri, Dec 06, 2024 at 08:12:57AM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Dec 05, 2024 at 08:26:05PM -0500, Mingwei Zheng wrote:
> > Add check for the return value of clk_enable() to catch the potential
> > error.
> >=20
> > Fixes: e70a540b4e02 ("pwm: Add STM32 LPTimer PWM driver")
> > Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
>=20
> In reply to (implicit) v1 you wrote:
> > We detected this through static analysis, instead of actually hit.
>=20
> Would be nice to mention the tool that actually found it in the commit
> log.
>=20
> Otherwise I'm happy with that change now.
>=20
> Given the issue is old (the offending commit is in v4.14-rc1), I'd note
> send it as a fix before v4.14. I'd send it along however if something
> more urgent pops up.

I wasn't very attentive when I wrote that mail, what I meant was:

Given the issue is old (the offending commit is in v4.14-rc1), I'd not
send it as a fix before v6.13. I'd send it along however if something
more urgent pops up.

Best regards
Uwe



--lvtle2mtnfezbcjm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdTK/IACgkQj4D7WH0S
/k42UAgAs6H2mPbme8oPwP5+Vo7po8iDZLSjx2VBZfboLqKgg60SSEgkWJDW3QRW
JSMgjh22hbHhuXTjBDM3281KZfebAxFyiVCUoLkFX4dxsP/HBJGb1VCovMAAIdzp
aKNyDDpyGzvbXv+rNdV8nIRLYooE0AxWuoZiQU5/54Zsg6BQOdRYOw/7NrUffYHx
Y4cuErXghldB8y6lDG86quZffAwnAp0BFuV55mixSpcV1MKiwiPWqRmr9w605/m3
e8V6BYUoh+IK/2hvFlcdl95pULgQjAtzaq+NNMQgBU3mT05sD5oOl6EAtvVbJEVd
fNXPXDr9aVWZWRuTWR8pnjJFn9t/wA==
=eYs8
-----END PGP SIGNATURE-----

--lvtle2mtnfezbcjm--

