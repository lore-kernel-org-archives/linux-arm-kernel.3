Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E21FE69EBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 22:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTtFsKdsyp6G2F6gB9aYbAwMsejXQk6jfdV5XrD5SgI=; b=LsVD+rntxLb+O9D3Gpn2CyHk9Z
	GQYb41sdmEyw08UMhTEIDTPv676azneFs048f7mQSOZ9kw2oE8DS9z/TsW04Oue5Qmg7RzE17dLAl
	Zax/nX02HKQQBcQ2XoDz+3dDfneZJCdLkuSNwy5Goi5je+MZtpPk5BDrZ2MQ305R7fp9r5oIdJ2Eq
	diEA8aoj1OxxV0rujadeelSW4LFxHe1rXIxBU/sJFkhowe01/RpSNk78NPTyfzhoyqTvWLC+/U4ro
	B7UEVws0AUfVujl6pAoS5La1qP5ttQjbQZ0W6PLc6PDzg9M1AxNO4g8iCV8hQOCq9/v7BmrMxLVMt
	Xt6qDztA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbMV-0000000Auyd-3L6t;
	Tue, 03 Dec 2024 22:27:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbHg-0000000AuA0-0KWq;
	Tue, 03 Dec 2024 22:22:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92D40A4195E;
	Tue,  3 Dec 2024 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AAE0C4CEDC;
	Tue,  3 Dec 2024 22:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733264538;
	bh=I4I5URB1VDk2Y1ouDFGGvz2k1B/mzf5I2HU3r9wirFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y+0TLJnDkKrzWZbina+CPZi6zr4SVit9pG0xtWnrXDk4QmTcFivDkf0wO+2arI3Y7
	 hoemoVk7ZiDIxpWmfNvPuCMDTxE9z3BlkKXjEN3LdbjiuvdDvEXmYvnRzKU7n1gDod
	 WoruJ9jAJOYeswjKTqJb1P+DGrfTnDsSjxF2gRgPHlP6ld5A/6OMqhXxDsBFLXD6aW
	 B2GQ7EE1HlLPNXc68jkF5BpnqmC7C5pxk6ceGo3tiVK7jnFcNp8sYiH4jDo0OFz9LH
	 hPymnB02MeY+Zni0byi+EcOyd1x/2mbI6hkzioezqcaaSB3eYqSJVbNyV52S4kw6xq
	 Tj3k6twbaDOKQ==
Date: Tue, 3 Dec 2024 22:22:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
Message-ID: <dbb2de3c-cb29-4384-a00b-4fdedeab1a10@sirena.org.uk>
References: <f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
 <1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
 <306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
 <1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
 <c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com>
 <1jplmf1jqa.fsf@starbuckisacylon.baylibre.com>
 <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com>
 <df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org>
 <1jr06pkof6.fsf@starbuckisacylon.baylibre.com>
 <37b656cc8272552ba07c93c5a9a59641.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vfsej6gT1fRj3j9O"
Content-Disposition: inline
In-Reply-To: <37b656cc8272552ba07c93c5a9a59641.sboyd@kernel.org>
X-Cookie: Alimony is the high cost of leaving.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_142220_183987_2B1836AB 
X-CRM114-Status: GOOD (  13.55  )
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


--vfsej6gT1fRj3j9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 03, 2024 at 12:15:48PM -0800, Stephen Boyd wrote:
> Quoting Jerome Brunet (2024-12-03 03:15:41)

> > I suspect the the generic path is likely to trigger more discussion.
> > I'd like to be able to finish this migration, instead of leaving half
> > finished like it is now.

> Is the half finished migration a problem for this cycle? I was intending
> to send the revert later this week and try again next cycle.

Yes, this patch was triggered by me reporting that multiple boards in my
test farm have completely broken audio with defconfig.  It's already a
bit frustrating that -rc1 isn't working.

--vfsej6gT1fRj3j9O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPhIsACgkQJNaLcl1U
h9D5iwf9Eohzpz2Z+ckFVyYXe/jKUAU36yzwFRoX5x5CT8xFgFF/zSLLbkQWNNgF
K/DLUkdb79PXfoiVKTM27FkJii1vQ5eUXudtXuOKOtk3s9PEGlZzaES9ieUXT3+H
rC/OJt/eVnlCSw53POeJUYNatrK6TBzS/7ZrYhYrii4D98vNo/q9R9b1ixjPR+ud
U5u4fZW3VO++tdYzYJzYgAAcnKcO7AuZbaFthys9MbT5ROAzNmFQV63Uj1BpaV93
rryPmwII4t9zDAyPAdpxuSduClQxJmlYHAeemw8sZDY8ufD+ot00ZyMakd9jbL0/
AzeMVkapZCI0kPNbR1lc4bduobU/pw==
=veKX
-----END PGP SIGNATURE-----

--vfsej6gT1fRj3j9O--

