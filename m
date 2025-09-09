Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6A5CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkzwHugjmhabskzh7Ix8LpicRj9CAy9tGfMYP3JIRC0=; b=gRd8iB3W6EJzI8tSFvuG/YBCpz
	j78wY2v3xl1d+Fn65y0ALS8vXSsDJzy15jcUPItv2pem8AE5NivJ8FYGBNIt5FpVvSASp03EBoT8u
	ZwJBdZVZgAtC22N+9LRHhiYTHjAXHwX28K2k7wOl6upD+jVRaoPdWZcHp/4uLrUDq9TZS3s6iLJUX
	835YrQGSPSuf8/oTqJlOLnbik0ADAh4ehQH3+xGGIV4qV0XALrobmOEOq1ZnkejeM2mSpgQL/CRiP
	CKJDAnA3+Lmvm+R3tNJ0XB64PqET5Pi9LJOoZzDBGQCF9cO1muQnkxeMybDIb+aKbGDyPBlODsXE2
	KGfdAPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1wO-00000008oSY-0cRF;
	Tue, 09 Sep 2025 17:15:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwQs-00000006hLe-0NFi
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PkzwHugjmhabskzh7Ix8LpicRj9CAy9tGfMYP3JIRC0=; b=JSvU4JuU03uLrSxiuuFphOuKsx
	etJJYM/RZB7CZL2JvTxCsaFbol/Ji9eqVZBnfXpeEG8ZUAz3voAJL0mLs1KLd6zNbP1fu/W8WTZ+u
	r9sd7A3QT9bmPbkoeU/yF3PmrJaNWBhLyehZyK3pHd7XTABeCE6yd4VEfNm7AGAPsyA9l0NwjlxGg
	HgqaIF5/iTB7Zq+YbMw6qz4eaMXUHFk9sVDVzid7Fml0bAFsJmVmduK48+kyrZtY0+JLCvq8IqFyp
	51MWSh8T6/Jt0Oj1MxhfcDNkFIZj3tY0CE+BcoGkbVcwWMpFFAET+R7XRTVtU2qFxagbyo32Amml7
	blQBpLgg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwQp-00000005J9z-0UrK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:22:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08D3D40931;
	Tue,  9 Sep 2025 11:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F198C4CEF4;
	Tue,  9 Sep 2025 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757416955;
	bh=1MZh7woJ0rdN+tehZ1cFMkjdvxHB0uNLIFNJTJya+Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FXF4Z007FLjA3PVwAxJmU9bqNx7BTsubwzEimaX0SKeey3p34WQH9oqMrIyPA7exS
	 KlxpQpZqkRoAmwZj0/l0YTnGYBCDW1tuRlQW1Xxy83P04gILlCMTFPxZ8g//PCk1X5
	 uGoZCoIhsX3br6j/HyxAU+5J9ga6VSFGHiB6A/47uYcZVO96HrMu8szveOsbnzvFPD
	 q3FYxMirHIj+IZdOZsa2fq3l59hyMsDVjBFQXX/I7JMemeKgk9uI/XVxu7Cm+jC9tm
	 ZAvzDPu8xyf6y7M7doo4+nwRbFGRDNHhMsxny8R+jlXRvBB0xKqrO8g1wz7FuRo9s8
	 cf3YaKczAVuAg==
Date: Tue, 9 Sep 2025 12:22:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 1/2] arm64/sysreg: Update TCR_EL1 register
Message-ID: <4f0ace4d-3398-4b5e-a85c-a30cd3f122b4@sirena.org.uk>
References: <20250907123000.414181-1-anshuman.khandual@arm.com>
 <20250907123000.414181-2-anshuman.khandual@arm.com>
 <a195095c-8ebd-4d74-959b-7b407d416a1f@sirena.org.uk>
 <bfe55fd9-e00f-44a8-bf4f-0b0a6cfc16bb@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I0KRvPxGGLsT2cj1"
Content-Disposition: inline
In-Reply-To: <bfe55fd9-e00f-44a8-bf4f-0b0a6cfc16bb@arm.com>
X-Cookie: Ma Bell is a mean mother!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_122239_480481_07D51A2C 
X-CRM114-Status: GOOD (  11.91  )
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


--I0KRvPxGGLsT2cj1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 09, 2025 at 09:20:26AM +0530, Anshuman Khandual wrote:
> On 08/09/25 7:28 PM, Mark Brown wrote:

> > I guess the cleanup of the redundant definition could've been a separate
> > patch but it's not super important.

> Dropping SYS_TCR_EL1 definition from header (asm/sysreg.h)
> into a separate patch ?

> #define SYS_TCR_EL1 	sys_reg(3, 0, 2, 0, 2)

Yes.

--I0KRvPxGGLsT2cj1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjADfYACgkQJNaLcl1U
h9D6Pwf8DT22bvBoI7SpN2eLMz5LCdZMEh25CjOW2LNAP5BIWVDEDFZGaP3M/ADa
XnUO06bqloVs2fljkorHAHDxZM/ohqoYJgQ+rbQIcqrpRWO/+59qEpqCuYQZYCKF
+Z/7HWTMlblQVeoAzxGR4DP+JAgKkH1KF3p4ryJjRzbTka7mBkUGQtFhsgVCITMy
q0/1PdZGjiVHa1AU4QNtVqpTqIIWlPWYf8ukhk6mTza46Y99eiQS5wqtEGLujW7v
IfvMwmnrBBwuBCBXnzC5FBjPlzFCjfemdqIqgsQ2CFJ5BpItRA8MOqrLfE0w72qe
EUrjJOEAS7L4SeeicUhCG6dFN8LSCw==
=Bqax
-----END PGP SIGNATURE-----

--I0KRvPxGGLsT2cj1--

