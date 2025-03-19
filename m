Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225CBC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 13:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oY53vO58JzNvxYYAlmbZC46+s+umoahlSMEnnhdBcAs=; b=O+fV/EK3j9jKnVxU8pYu65jbmI
	zUTvvYJWaNMQiPkOf6O7A14DMW+8Ors2aq/ny5vs8SDGQ7HUVVwSFg9CgYhuDUfnGjAQ+vc2Zya4f
	w3ZmxevZfsiNLeQre7G2oS1sbxN2RKhnc2nUtcDmXdsdOFZ0v7r5pTNAJUQ0gv9xx+d0u2k+uuHvg
	k1JSLCyH8UxJefD9/gQngNm14VEOUjcpbuR+8DTGqwvBq0pWRWCQJEWJy0/1Mz8odwD+RKbOTAg8U
	9RFFAtH+vFLJXF8UwRDNv2CnjezOXnvUqjwSOeVp5z7QN7H3cmm1qt4xxVJnamRZlVWo5IG1OCtIV
	NHWfEBIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tut5q-000000092Tb-1ijQ;
	Wed, 19 Mar 2025 13:04:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tut49-000000092Jo-3eMu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 13:02:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6EA235C577E;
	Wed, 19 Mar 2025 13:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635F0C4CEE9;
	Wed, 19 Mar 2025 13:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742389356;
	bh=b5MAxAbhDjq6ZZSL+MGfjF0CskG7HgvkDEAYGiOdDq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2kglXAat9+cETPdezJ9I+/0XQsd/3vBuEOuaW/9wTeIzdPqhLgnNzofNsLxKFduA
	 NFnN4kvMDersEzqtPRxHkGhmD98ux4FAIFzbRsGtMb6CM42PVofnPabL7rOKFO7vwJ
	 4tUc4ta5uB6KhU36B8y5AdWr18dqzTqJ2X9aDsqnrsvkaEs3GZYgpgug+7t2494H1U
	 Bu0zTRMqwClOBBTFwirLPaCnpBjbKYzqIaKOWiKoHMbK3HiZh/GquicmEnNdjQ2Y9m
	 NxsI1ueqrBKHsWsCB6YqfX4Fj4sbIKeyJM1LsJ+2Pzh6wQvZbzeNk+Awjt5ChhUOiI
	 SMZ53uBCn6Lsw==
Date: Wed, 19 Mar 2025 13:02:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gavin Shan <gshan@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 6.12 8/8] KVM: arm64: Eagerly switch ZCR_EL{1,2}
Message-ID: <83ba4e5b-7700-4527-8376-2c60507bd0d7@sirena.org.uk>
References: <20250314-stable-sve-6-12-v1-0-ddc16609d9ba@kernel.org>
 <20250314-stable-sve-6-12-v1-8-ddc16609d9ba@kernel.org>
 <019afc2d-b047-4e33-971c-7debbbaec84d@redhat.com>
 <86r02tmldh.wl-maz@kernel.org>
 <Z9qaW_H9UFqdc1bI@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="48i1XDxjnyzJoEmY"
Content-Disposition: inline
In-Reply-To: <Z9qaW_H9UFqdc1bI@J2N7QTR9R3>
X-Cookie: Chairman of the Bored.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_060237_949082_D00DD7FD 
X-CRM114-Status: GOOD (  15.27  )
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


--48i1XDxjnyzJoEmY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 19, 2025 at 10:20:11AM +0000, Mark Rutland wrote:
> On Wed, Mar 19, 2025 at 09:15:54AM +0000, Marc Zyngier wrote:

> > The result is that this change is turning a perfectly valid HYP VA
> > into... something. Odds are that the masking/patching will not mess up
> > the address, but this is completely buggy anyway. In general,
> > kern_hyp_va() is not an idempotent operation.

> IIUC today it *happens* to be idempotent, but as you say that is not
> guaranteed to remain the case, and this is definitely a logical bug.

I think so, yes.  I suspect the idempotency confused me.

> > Greg, it may be more prudent to unstage this series from 6.12-stable
> > until we know for sure this is the only problem.

> As above, likewise with the v6.13 version.

Yes, please unstage these.  I'll send out new versions.

--48i1XDxjnyzJoEmY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfawGUACgkQJNaLcl1U
h9B7twf/ZUvdzHI6/ofuTOV2FN8KUBzERD5r5gX2ERnb6+ulsDq1weTD3yOHhVAt
pt3ShWCPHKkEWn9ZhmA7NhRgW9jJfNL3UNZ2utngKYgSu+EwOs/2RYmgJioWvT0/
KL8QDmi7cUZCzaESb9xGVrYPxQr/xGUtpdgaIzh7f+Xj9O/u/5viHBP5qSQVJx5s
zTZ9nX2AvVbBH23+krKPLbw2Norf+riVp9lvsFoCMTXgD62/JIrhW9gGYm+E0+p8
8w72Z9Rq2x4hGI2oAj33xG3iLpVBi+lFF3ctiPNLl6UOw/wUoU/Pk8rePEXqTtnj
6fTU+M08IF2Ed5+yF/DuNQ+GjmEyQQ==
=Oq0o
-----END PGP SIGNATURE-----

--48i1XDxjnyzJoEmY--

