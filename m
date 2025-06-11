Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CC3C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFzLi2GJiG2eSQGYZ/A84DHYRTuss7ATp9NGz/6F5aE=; b=2jOEJmE5uoHWvckv2/1P9+j4d0
	TNE/VfHD5qyl9FcuxFvhqt+4v9fweryXFB1aNvrs3iB2xOiT+4LHPC7unC+FtIEcqipDhPtGaM5X9
	ilQbQ3Ovl5yZopVD1dy3dUoS5mkFFDPAXmxhqjHipEgBNw+uBzjSjUbNIi3/RJ4L6+0E/R7udk1IZ
	/PAU0pEZQPhs0PON3Iwd2JNvVE9sNfvbKLdSpZJu/qsMU+4NiDxf12obL/3wxW0oWER+r8xpw/iqW
	MIDcnW2VblovkNu3oE/GtBVT5uJ3UIp+FGXrgyKzMHsUWVGlqfNJgBkTpn1e2JYgowwkWzDVJ6ezA
	UANnpn0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNnG-0000000AV7Q-2kgW;
	Wed, 11 Jun 2025 15:55:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKhj-00000009rDt-1ain
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:37:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 758E9629DC;
	Wed, 11 Jun 2025 12:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D12C4CEF1;
	Wed, 11 Jun 2025 12:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749645438;
	bh=pFzLi2GJiG2eSQGYZ/A84DHYRTuss7ATp9NGz/6F5aE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXrkSJEXnkAbML7FOF3UXngZlJeQzqon35d6caDl3yRuafAV0FOo2kVmCu8gVhaV0
	 1UCsMsvzBwYuqo++arlk2ZNCjK5CqykgXko2h+ei1PUI5sb/jz/KWFosNemWTDPdqx
	 yKhuf/T66jUSO5Aq426dDaVckdKWw4jgdVfUBblno1tdKipwgQs0YdDUaX+KyxKgMp
	 S0n0BklG8iAk6LjB7IcfVmEkYJTzjZOQXGIMomwy5ZC4Ql5iyLJOiCHYUshKIDaJwC
	 uqQBZWRxrBtYiMXjOexNLxWafm+ZXzwHAOzOPOzr3mi/abxgboXBDGD9TytnR6qJWR
	 z62IJkXHojaZw==
Date: Wed, 11 Jun 2025 13:37:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeo Reum Yun <YeoReum.Yun@arm.com>
Cc: Catalin Marinas <Catalin.Marinas@arm.com>,
	"pcc@google.com" <pcc@google.com>,
	"will@kernel.org" <will@kernel.org>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Yury Khrustalev <Yury.Khrustalev@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"frederic@kernel.org" <frederic@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"surenb@google.com" <surenb@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v6 6/9] kselftest/arm64/mte: add address tag related
 macro and function
Message-ID: <a2cf9241-12d2-484c-9066-de507c4717d8@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-7-yeoreum.yun@arm.com>
 <5e937cf0-3b71-4c17-838e-8b38595c153c@sirena.org.uk>
 <GV1PR08MB10521E68C886E8E6155AEE49EFB75A@GV1PR08MB10521.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EjqLoC0faXEjduIq"
Content-Disposition: inline
In-Reply-To: <GV1PR08MB10521E68C886E8E6155AEE49EFB75A@GV1PR08MB10521.eurprd08.prod.outlook.com>
X-Cookie: No skis take rocks like rental skis!
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


--EjqLoC0faXEjduIq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 12:25:50PM +0000, Yeo Reum Yun wrote:

> You're right. but what I calling the every main() with srandom()
> seems weird for me.

> I think it would be better to call srandom() in mte_default_setup()
> which is called only one time in testcase...

That also works, just something that's called only once during setup
rather than repeatedly.

--EjqLoC0faXEjduIq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJeHcACgkQJNaLcl1U
h9Cz3wf+OyhAzrPDMjSziXM2nkmPKhKanz+WaUWFiV+ituGYEEhjBrmyEDTgcBeq
s0FkQuWI1rJZGhRH6cXEAdGU/fiD7dAfmTkDgYQD8Fo4mXFylamRjmxW31zJkMMV
5jeSJttEi7jeyP0uWPhk0pmY0dg48S0mPvzB83W43hBRfPe9WqxRv//JSCIofWl+
V8THka6GZODD//kKKSqVuhht135YEAUWAW+KHKygEHjlxkg0v+PZT/dnxc9pi35l
MGEAFKcisp5/vaRWOIpZuT8d7tHvZWmHsSeXPTJ2BkjeNZvWq7hjAllCXsdhdzMh
lN1VzcMS28vByfUjgdHaXiS7WB4GBQ==
=QRq9
-----END PGP SIGNATURE-----

--EjqLoC0faXEjduIq--

