Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB574CFC29A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 18:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0Lat5Lybgmydvmco3yn5fpGeDyEHrPo9zBkU69PSlI=; b=XGoyNrbauAqu781ddTMpORkBge
	kH89OYKx/n43vx1HpM7IOLSHK3I8TOz5AsDzsDhjDF7Y38XMiQAzmAgnvbZZiQPKCEOBFLFLkzsfi
	C3LU6BBJJswQIXYsgN9RH3WnxXNTjfSKi+NYIeqEyQPBDnTK+p3dYQAVfByY892o8lXwE0DWZplws
	Xe79VIVwowQOkLVLUF0pSs6ZtyfeB2oYqARy7PfwemASUdzEUO5Mk+NKLSwMTsKVGZWi2m5unmRK7
	dvzigljlj1EaQMRpxpChCAqYvhNQV5ihUrlsUkGKN8TD0xxz9fSuMi3hbZrjXjeZOqbEBOxkS+aIP
	zxKP4mFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMW7G-00000008rmU-19EZ;
	Fri, 21 Nov 2025 18:44:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMW7E-00000008rmF-2ali
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 18:44:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CABD9601CE;
	Fri, 21 Nov 2025 18:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6399C4CEF1;
	Fri, 21 Nov 2025 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763750655;
	bh=er1DOqN8XKcwmjh5oTWZ/2giUJo2yI7UZQbBBDHtzOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PU3Ev8qFEy/Hh4XsuOCwhFbtwDbMICtrEXQqAsONV5fPTQJ5vgQXYcIm36g/oCKBv
	 U+Mx7JTGyPjfl7ibI+7Lt1bXC8XV0CTbVhZm9FQ6C3jlREEOJDBXA4jHjn9EtIvr7C
	 9MvQafAR6I1F6lfQ3XAixPTtlTBxEgdMlCgJn1LrLiI+PmcbqwiSEtsim+96u0JxpS
	 UmlQZYDL2dzl9/n4F36jhAlAP/cDz186yVz7/zG4VFJk+kAPZamoTpGSVPLC6xXJix
	 ELaiTDl4URgiY8liHpe4GYYAK4ef+lUVZcGIme299td0m/ZhNf9vdDWI0Z9RDNi4i+
	 +PRwwOT+TjhMw==
Date: Fri, 21 Nov 2025 18:44:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, wangyushan12@huawei.com
Subject: Re: [PATCH v1] arm64, lib: make ARM64 select
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION not GENERIC_CPU_CACHE_MAINTENANCE
Message-ID: <20251121-uncoated-trapeze-e1e7d9c0cbb8@spud>
References: <20251119-zippy-distinct-1e2a7da7b69b@spud>
 <aR9QRuUigBsxxelm@arm.com>
 <20251120-ruined-liability-9ecbf53affd1@spud>
 <669d4bbb-4011-493c-b056-34e682a1ac26@infradead.org>
 <aR-KxRIDvGNlW2jy@arm.com>
 <a6fff5b6-7e7f-4883-b905-500d55dbf21e@infradead.org>
 <20251121104827.00005033@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/1G6JnR6SY9eI9zl"
Content-Disposition: inline
In-Reply-To: <20251121104827.00005033@huawei.com>
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


--/1G6JnR6SY9eI9zl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 10:48:27AM +0000, Jonathan Cameron wrote:
> On Thu, 20 Nov 2025 15:25:46 -0800
> Randy Dunlap <rdunlap@infradead.org> wrote:
> > On 11/20/25 1:40 PM, Catalin Marinas wrote:

> > > As an alternative, I'm happy for arm64 to select both the ARCH and
> > > GENERIC options if you think that works better.
> > >  =20
> >=20
> > Yes, I think that would be much better.
> > Thanks.
> >=20
>=20
> I'm fine with that as well (was where we were in earlier versions).
> I'm offline for 10 days from tomorrow, but wangyushan +CC has been heavily
> involved in this series throughout if we need to test anything etc.
>=20
> For a patch that is basically just (this to me seems fine to squash
> as well if that is easier)

Right, 3 votes for both, so I squashed that in.

Thanks guys.

--/1G6JnR6SY9eI9zl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSCy+wAKCRB4tDGHoIJi
0hf3AP49RJTktKwmPiJYJH0F7CQBkBz2DLxIykNLJ5LyitA9OgD/TybjvGMP8lSU
CnHl/S5msYsThe2KBHhzYGDR4gMRKwo=
=4J2T
-----END PGP SIGNATURE-----

--/1G6JnR6SY9eI9zl--

