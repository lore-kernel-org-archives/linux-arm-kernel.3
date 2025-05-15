Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A03C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpxZ/GZHuF46WGo3YQUUaxso8hhVDJj5zUiFHLXQNPk=; b=4KId3cPJTNxFgybaKDtD5+Rf05
	YOoJZ4MN277+/bBdcmT/Vtv4WkTwDBKJ+s0oFeiv/7QyqTNfMNtc6uvo6d5h5TMyqsOu9V5do9Api
	sMr0l4sYAxjVfzIbvHf1EL7gbihaAI7NGxp7pSBB9d3OnXEndMa0nICfPAyoDK3ULbi7N+Gxm50ff
	klnciqb5g+Tr70dW2nulNbAxB0xHgCV6B8hJijv4e4ahQ8YWSsj8sBie+uphUCc1AWKWjZa0Qz0WX
	bIcA2yPTpRa7jxcGftFiEIF58HGziob0tbYxoTPVoYHrZbYTqhcVcCy9U8ZwAugyaGptpLP8362s0
	Uq4wC2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWtT-00000000QSn-1nlF;
	Thu, 15 May 2025 11:36:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWnI-00000000PMt-0rCf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 11:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDF554A604;
	Thu, 15 May 2025 11:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE78C4CEF1;
	Thu, 15 May 2025 11:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747308631;
	bh=qs/HCp/tuPqxoIZBhL/5F24zhipN07IbjkxVJVKrgz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGtrEPQ+qNi7DwYEWf9t2kIgX0yUK9xH93+d7phxdg0AhZpJL8Q23vTkPWBpbdZcQ
	 bXze78eHqzJvcVEJvTQ2pj8RI/dkYek4k8UgyOEAIX8Xuw9EC425OWr8HuwHsmonBH
	 nHp80i5JXzG4g5CyMBuV1HhHd3ml37j7IsdMZWVTt8G+QEtWmOhbj8nlE8lTFZT5BE
	 DT6MEcUk901uV5LINbw5MeQPPKiGMt1wcItLUgErooF2+a+BCOFi9bFR7ZwcoTHpJq
	 ydt825eVVBdziEPDl5HSeK+IsiheqlUYUprKVeLYqZxZDhVs3c9t7zixf4Au5pU6pG
	 P73SeOiIC+Mig==
Date: Thu, 15 May 2025 13:30:26 +0200
From: Mark Brown <broonie@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Message-ID: <aCXQUu97HL_yrH89@finisterre.sirena.org.uk>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
 <20250515071357.GD2936510@google.com>
 <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>
 <20250515092000.GF2936510@google.com>
 <aCW0822BVpfKV2NL@finisterre.sirena.org.uk>
 <8beeddcf-1dc7-4af8-b287-4c896852b258@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EfsCzTWB3diViB+9"
Content-Disposition: inline
In-Reply-To: <8beeddcf-1dc7-4af8-b287-4c896852b258@gmail.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_043032_260204_C002CBBE 
X-CRM114-Status: GOOD (  16.35  )
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


--EfsCzTWB3diViB+9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2025 at 01:28:15PM +0200, Artur Weber wrote:
> On 5/15/25 11:33, Mark Brown wrote:
> > On Thu, May 15, 2025 at 10:20:00AM +0100, Lee Jones wrote:

> > > I can go with 2 in this case.  Applying in dribs-and-drabs as Acks come
> > > in would be sub-optimal and would likely end up in a mess.

> > Well, then just going a head and applying them on a branch with a tag
> > seems easier than delaying then.

> I can split the patchset into two parts (one for MFD, one for regulator)
> if it helps.

There's still a dependency on the MFD bits whatever happens.

--EfsCzTWB3diViB+9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgl0FIACgkQJNaLcl1U
h9CRQQf/Wx34agRsQjJ2L7RzP4M/Z0iU+/Xw0es0YHN1eDqCFQ7368/GShTJ7J4U
utqRkkzJTWqNvk0DQeHY4GsMCk6yPIrIR6cOENq8gUciYHzdm66JombPUN2mnqFs
z89Yg5kvAjbqoMjMAvppNzwgkTfMH/TtGFByO8+C8AdgXiepwJuNWKQTvMELoJ6A
Uy3wTygq9HlCCgguqG4p0CZJF+f3wNbDaRc2J9aes3GifYM95AOa46rdaUhz4EhV
2hDqSxBUnFIMHpFnWKaMr2o8nfWf29UY2TsqjOvoDhXnCsKSKuGvzIgZSk0FxCpG
v+6XIegFtSG6KQfjGQKcIH3V7sGk9w==
=G2Oh
-----END PGP SIGNATURE-----

--EfsCzTWB3diViB+9--

