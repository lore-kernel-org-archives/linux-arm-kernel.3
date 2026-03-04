Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38391EB7EB5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfpuQIHOoxZnPlfJ4IEbT+2iIAqatMbwmzDVX6rDGmM=; b=XexQCTLBqVq2a5kGMkH26UZVvt
	JHpSxnhAtROsiSva4UQaNxlOgwplHctlV877mQ0dlNClpUqPSrNyBfFa+n0lZkd+R5VheLdNUwusU
	kp4fdjQfiaZQbTq90MCl2+ZqlFCsoozpQSMjLXV4xkhp4Z832/A5iuyBQ+Ia/wIc6qJdJuS+Xkvp+
	Yz6AGSMbBCy3e3swDuMKQM+Yd8OaEOHEdbHzG2gLie+SdBVYXogUaQn9HiqtrAr1Hnejh4jMoXRS0
	0eermyjuLAiOavbCE138R94OUrOn6r1nJeobSlDjp1eKC6aRrOks3pzEbhEZQRIfqypHyRxzhdy4h
	nLuKEqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiZQ-0000000GsIk-0J1G;
	Wed, 04 Mar 2026 09:31:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiZN-0000000GsI5-1RuW;
	Wed, 04 Mar 2026 09:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA6CA408EB;
	Wed,  4 Mar 2026 09:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99223C19425;
	Wed,  4 Mar 2026 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772616664;
	bh=zgQE9FPg79NGedD2qfd8rrEbgmI4ffrc7T2hh1mMJGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nM++lJkfi0p1/jKfOa1D+SffAY8be/O9gEmD2PT9ZTwuqGwVM1VSkTvzj+W7HiYE/
	 u1bt9hSCZdXwGoyy71KOHeyUeE5T5BQ3/LHCed27eQcXArBchaxw7NyiRKJUB4FunA
	 HBgTGF2hDdooYslK8PIhi4PWwpvCin/mEoz/9Op0AHUHIPgnIGgTUlNLnu/Rioj8x1
	 /6RhEweeWR2ms7D/bxvbWrFo+/ISYanwH6djArYLBHXYdakBjHdtP0GeovKHxhhCQJ
	 JE7u1UuyeHI73A1i7yFg5/TPmB28KzDjkCncr8WDbuGtARNrAmf02o7AGBos5Je4C4
	 hYKrLmEEfy1sQ==
Date: Wed, 4 Mar 2026 09:30:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, lizhi2@eswincomputing.com,
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	wens@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: ethernet: eswin: add clock
 sampling control
Message-ID: <20260304-capable-setback-908ba5b5c858@spud>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061637.872-1-lizhi2@eswincomputing.com>
 <20260303163846.156d18f7@kernel.org>
 <20260304-regulate-verdict-c3a361d2dc83@spud>
 <05a15890-392c-41c3-9566-8eb506ddfe5f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VyT/OApBJ2ELuMkj"
Content-Disposition: inline
In-Reply-To: <05a15890-392c-41c3-9566-8eb506ddfe5f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_013105_449609_FC114892 
X-CRM114-Status: GOOD (  23.69  )
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


--VyT/OApBJ2ELuMkj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 05:23:18PM -0800, Bo Gan wrote:
> Hi All,
>=20
> On 3/3/26 16:47, Conor Dooley wrote:
> > On Tue, Mar 03, 2026 at 04:38:46PM -0800, Jakub Kicinski wrote:
> > > On Tue,  3 Mar 2026 14:16:37 +0800 lizhi2@eswincomputing.com wrote:
> > > > There are currently no in-tree users of the EIC7700 Ethernet driver=
, so
> > > > these changes are safe.
> > >=20
> > > What do you mean by this sentence? The commit under Fixes was part of
> > > Linux v6.19 already.
> >=20
> > The "funny" thing is that caring about users doesn't even really matter
> > on the devicetree patch, except for this hunk:
> > |@@ -81,7 +99,9 @@ properties:
> > |                          or external clock selection
> > |           - description: Offset of AXI clock controller Low-Power req=
uest
> > |                          register
> > |+          - description: Offset of register controlling TXD delay
> > |           - description: Offset of register controlling TX/RX clock d=
elay
> > |+          - description: Offset of register controlling RXD delay
> > |
> > | required:
> > |   - compatible
> > And it only matters here because an item is injected mid-list. If this
> > was moved to the end with the RXD delay, the **dt-binding** changes
> > don't have issues with safety. I've not looked at whether there are
> > knock-on concerns about users in the driver or whatever yet, but from a
> > binding POV only that hunk can break something that currently works.
>=20
> This was already discussed here in v1:
> https://lore.kernel.org/lkml/e7183ae1-8b8b-4e77-9f4e-3bc1b4b63556@lunn.ch/
>=20
> The device-tree is not checked in yet by ESWIN folks, so there's currently
> no user of the dt-binding. No need to worry about backward compat.

The binding and driver exist, there doesn't need to be a dts in tree for
there to be potential users. If the break was important I might not
care, but this seems to be a gratuitous break, since the new items could
be added to the end of the list and compatibility maintained without
incurring any more difficulty for you.

--VyT/OApBJ2ELuMkj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaf70QAKCRB4tDGHoIJi
0t+yAQDaqUwbBXUnRZdznNlE9A9+14ZFfzPctlXgnLmjDlK8KQEAznLn0a9hkqF9
NpmQ3RerxFbR3zZlgJKl/8p/5oYxngk=
=yS9x
-----END PGP SIGNATURE-----

--VyT/OApBJ2ELuMkj--

