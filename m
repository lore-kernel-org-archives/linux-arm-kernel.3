Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A47CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 01:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/csn1MNH7CqxFXm3s7m/76YlqYFlImYSXV+Re8/2PKc=; b=x+DXww4rrFC34w629QE/sTP4Y6
	6GiG7Hb7xTQlrEui3UxnB2Dv24GGKh/4vuP4Kb5/7/hto93edzMa//EYFLCVvU9haTtsqaAFTo8QD
	v04Gyk2fTERGv9mAiJ4m+gqrgO6ARntUp6WgkGdQXSk6dL3/fiFI5csgq01k4/OQn1tSx8az0Gecl
	BubwzmglV1ErvrFb4mVfzZuuu3PCK1x8xKXJ4IazGZ8w/2PErrocLhSfEXxGJpbje8PQsvuoPhsS5
	hEiqEDwI+N1yw1YqY61stdLlsBNIZwVkiqTBfeEEhOhCM7c4xOE6TGB+8xpAFw/qy3+5LfE3ZzWol
	CmDzxauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhpH-000000074KP-1ciX;
	Fri, 15 May 2026 01:58:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhpF-000000074K6-2ZOz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 01:58:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8B4660008;
	Fri, 15 May 2026 01:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48918C2BCB3;
	Fri, 15 May 2026 01:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778810332;
	bh=/csn1MNH7CqxFXm3s7m/76YlqYFlImYSXV+Re8/2PKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5pxKzdwNjKdE8TGxE90IYP/49WOgSOflnJanmfjicNzCsOcd2c4CFiACAzlBXFRb
	 n0ACEYMRTcu0F1UVnqo2B0lB/s+oN5ktVIXiONRISjc63QmnT0baoUYaHN73Dt3Dk2
	 q10yhPgkw9/gvlg9Jg+0ILBJdFbJKvAlcqET3mpZJ5TtnO4ttmKMQCZQCcR4zf+VCC
	 WemngNbgxqgeVrCDWwNpsF5Z2tM+Xkr6Kgh0D8L0XTHfSGrrPqHC4Nn0PGpCp/aw//
	 OAGb5GkztWe0exOdND7MFI8KmRSLA7a5o9clb75x6nChwksC16NIiW+y4AWMg/Bkc9
	 U08+t8bGvzUkA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EABCF1AC58D5; Fri, 15 May 2026 02:58:49 +0100 (BST)
Date: Fri, 15 May 2026 10:58:49 +0900
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
Message-ID: <agZ92TVjcYpEv_eH@sirena.co.uk>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
 <20260513104329.81592-3-phucduc.bui@gmail.com>
 <agUknFcDIfwrOCld@sirena.co.uk>
 <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JHw9B3lGFRV/+bbA"
Content-Disposition: inline
In-Reply-To: <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
X-Cookie: Truckers welcome.
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


--JHw9B3lGFRV/+bbA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2026 at 05:33:17PM +0700, Bui Duc Phuc wrote:

> I'll send a v2 of the whole series with this fix.
> Would that work for you?

Yes.

--JHw9B3lGFRV/+bbA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoGfdkACgkQJNaLcl1U
h9B8ZQf/Wr48Xle/QH86Qy9wtXpd8zyaMYRJrmD7tgd33VlhL1P2qqPPpzIgFrUx
+oQOYBU8Y+JZajXK4OINoFfDIr1rLrMm7+nu5V8VYWVitSbQS0DF78UDQKn6AbVl
qbP4EkTeB4F5EP734i8DHd8asnpcB7wiDy8NAmyxpdlfswb4YNza/Zgv56BMbAQQ
vT9e6m3hAbFpmHqROAfgjOMExTCn2sjNEZ7EoZIZPpDWzDssNwavU+844z8UqFeT
sdaNE5jTe+DIV6NHimxIdUWkmnJMO5FFj7vse9C2Zrfp5J990SHdQUM4nmTzcXld
iEtrhJ77xFh2eFPZij6nhd7doLSf1A==
=xBvo
-----END PGP SIGNATURE-----

--JHw9B3lGFRV/+bbA--

