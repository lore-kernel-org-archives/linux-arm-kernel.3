Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A155FCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObmcF4C+T8N19cVMniegJQo4RItlifGeuvtddMkK6z8=; b=28VO1Ovn7YOEqs6scsnxXThGas
	esALfULwrdpQ+jz34xE1ENPRgaSotHkaBg9BWMsOme7mb+iBkHbiKNJCAWQj1O4yij2Vjg2poujDx
	rOO4NaSKap3MBcDLDADErY8uZt1X50MWWTDqpdTTl9YpJJU3mMUt9Y1djBhAjRwL2+Z95r+mChF+S
	Gue6IFT2/EORA9tShQGgEjO960tgbFfrFHk2PNaXor9XbB77jTPyCfgLBAktrz2pSzjFly/ZZvoxm
	tVrgAuS0PD6mMLxTPAm1VzkIugiJ27quECXf4A5n+77AGauFScckuY9R8kbERCcKRuESkmUAzYVum
	TOOHS+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2AvH-00000002gzi-0o6t;
	Fri, 26 Sep 2025 16:03:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2AvG-00000002gzD-3P3P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 16:03:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D755861E93;
	Fri, 26 Sep 2025 16:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B590C4CEF4;
	Fri, 26 Sep 2025 16:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758902629;
	bh=ObmcF4C+T8N19cVMniegJQo4RItlifGeuvtddMkK6z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IaJZ20iiY2mQIh0cB0OB4arkaX3zvJNT7Y12tsG/xT6145aJm+eeF0koiHmITnQYH
	 FD7jngGj9n+y7KWyKr++bv9GT3d98mhoY4pQM/SWH4bjUxjnH6wIDrmQh11lmz8vmo
	 4UKBGeFCaoTxOy+oRrtHetBWssY0oxM6q+V+5CWVgN+6QoNCXm8qvBDhSf81syayDw
	 IAqY4eqIRhe90amXwEXOM8WVlevEvWyMIC/G4yFZSmL7kOmo/M4yfKlYvYwv1t4fQG
	 TOR+fEt4eWFP5hph1Lc+w14dCVWmEgfEPsUGqrlyW+2pw3PiUpbZ9u3xp+bc89z4DI
	 jg3JjyVbAJR8Q==
Date: Fri, 26 Sep 2025 17:03:43 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "yury.khrustalev@arm.com" <yury.khrustalev@arm.com>,
	"adhemerval.zanella@linaro.org" <adhemerval.zanella@linaro.org>,
	"nsz@port70.net" <nsz@port70.net>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"dalias@libc.org" <dalias@libc.org>,
	"jeffxu@google.com" <jeffxu@google.com>,
	"will@kernel.org" <will@kernel.org>,
	"wilco.dijkstra@arm.com" <wilco.dijkstra@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"codonell@redhat.com" <codonell@redhat.com>,
	"libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH RFC 0/3] arm64/gcs: Allow reuse of user managed shadow
 stacks
Message-ID: <5c616340-2767-48f0-8727-326deebf718f@sirena.org.uk>
References: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
 <760447dc3e5805bf5668e80a94bf32356e2eb2d3.camel@intel.com>
 <aNasTpkYm8n1AHZ7@arm.com>
 <04dc6271e11b453204255779fcd3c29573c9c296.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HdsstHaENm3Rb3lO"
Content-Disposition: inline
In-Reply-To: <04dc6271e11b453204255779fcd3c29573c9c296.camel@intel.com>
X-Cookie: Your canceled check is your receipt.
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


--HdsstHaENm3Rb3lO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 03:39:46PM +0000, Edgecombe, Rick P wrote:
> On Fri, 2025-09-26 at 16:07 +0100, Yury Khrustalev wrote:

> > What do you mean by "a fuller solution from the glibc side"? A
> > solution
> > for re-using shadow stacks?=A0

> I mean some code or a fuller explained solution that uses this new
> kernel functionality. I think the scheme that Florian suggested in the
> thread linked above (longjmp() to the start of the stack) will have
> trouble if the thread pivots to a new shadow stack before exiting (e.g.
> ucontext).

Is that supported even without user managed stacks?

--HdsstHaENm3Rb3lO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjWuV4ACgkQJNaLcl1U
h9CB9Af6Amiwsbjop9BcOnSoURnplsrcG/pyYCUpMiraJ4DWRZ6JhT0gasKnabgY
9yaQ33czhMyB49aKN8F4vOJ76gTMrjxrpmTtoVTJXLAB2ws10n51XOTv+N8VkVO8
js1oOnxIHNwFLhk1uuCZ/W73//IUkUJiJOCHnlWqqrZUC4hLEoUYMe1O5kYK1fjB
Ij3ESrwUp17z++3luTdL0NQgoNNRy84yKA4cIq2XKN3thX2pzXS1t9KVpq+a6Z4o
hRoRE55SVe+AStC4C53L8gB2kbIRFc+yQ+KytuLhNOkPAJm+8aXlN0MOLcvfZI4p
JpBidc9QZrzn8pab6F3q8YNyOQeI1w==
=mecK
-----END PGP SIGNATURE-----

--HdsstHaENm3Rb3lO--

