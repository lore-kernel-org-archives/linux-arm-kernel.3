Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF346C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 17:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s19CEAGQjEkgbjrj5F4lWFyemfQPSIUWWA4sTAuxhsc=; b=YZf1Kj1LOKsx13lqX932CtDYzP
	zOlBiUZP6/Sa39jlpCgpDSkRaFUfvbE5rDGoemixoXTHxayJ49wu1yickoCLZ+0oz/i2LRdsR1KY9
	NZeq2FIfc5w9KSsvLmf4w94DJmHltJdwjbKhHXbSpjWbdy7aGOZ7ozqfnFxf1W64hH3SZGEtdiFq8
	A4vsTr1rvoAgSzL/pdID2yV8WsfbTn0briAUifPpt0UTDFhMYmW29jIBco4btsBiX/Ue0UdEp2EbN
	DVVp0R+cz2donvugb9NDsFNvTHjDWReRMdlXZNAOERT5vn8cWxu0HcRnWoNnPtQSwAOxm6JHjrCKe
	rwF1P0HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNrU-00000005yal-2rZo;
	Mon, 13 Jan 2025 17:04:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNpg-00000005yMh-2H4a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 17:02:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 211B55C10E8;
	Mon, 13 Jan 2025 17:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C24DC4CEE7;
	Mon, 13 Jan 2025 17:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736787751;
	bh=s19CEAGQjEkgbjrj5F4lWFyemfQPSIUWWA4sTAuxhsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tEwi4e/vhIgJghd19EYbuksAW5q7HTkMSpVJoP8VYVt4QwFqUvCsB16h5YKrhi1Fa
	 hP1cHUEbGqrQLgQk9JUMNSegzdy3HeVY422dvAT09HKHI2QvKT9gUY/KZWGRvKX6vO
	 Ali6n7kZZsQ6NfiCslHqyGuPaLwei2YF48oxiwEGH86kyTI3Sds4aQUS0RZr1esKsJ
	 8qKTqw5ozxd1roZwm+FX7wWfWAuk1Zfc4PLYrozGPA7m+3l8mYGiNT4nIGqW/aWWz9
	 1QRw2jGsgnqhdmea39B2Q+QDaHD9K0AxizCBwLwTv0SoI+RUV9SW88GSsHiVT5knas
	 gr00pN0aXqWKw==
Date: Mon, 13 Jan 2025 17:02:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: James Clark <james.clark@linaro.org>, kvmarm@lists.linux.dev,
	oliver.upton@linux.dev, suzuki.poulose@arm.com,
	coresight@lists.linaro.org, James Clark <james.clark@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shiqi Liu <shiqiliu@hust.edu.cn>, James Morse <james.morse@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 04/10] arm64/sysreg: Add a comment that the sysreg
 file should be sorted
Message-ID: <996c7843-7f51-49a0-9122-e688e37f9902@sirena.org.uk>
References: <20250107113252.260631-1-james.clark@linaro.org>
 <20250107113252.260631-5-james.clark@linaro.org>
 <87frloqjso.wl-maz@kernel.org>
 <760969b6-18b7-42ac-9524-2f1f845b3703@linaro.org>
 <86jzaywtea.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MSJwDqeLzComXiFD"
Content-Disposition: inline
In-Reply-To: <86jzaywtea.wl-maz@kernel.org>
X-Cookie: You will outgrow your usefulness.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_090232_624715_7A749AF4 
X-CRM114-Status: GOOD (  14.22  )
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


--MSJwDqeLzComXiFD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 13, 2025 at 04:49:49PM +0000, Marc Zyngier wrote:
> James Clark <james.clark@linaro.org> wrote:

> > I think it's ok if it avoids review comments that new entries should
> > be sorted. Or maybe we do the opposite and the comment should say this
> > file is allowed to be unsorted...

> The better option would be to add the comment *and* sort the file.
> Leading by example has some value, it seems.

Yes, please.

--MSJwDqeLzComXiFD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeFRyAACgkQJNaLcl1U
h9AcyQgAgEUDp38F8GdJqjTrHtAkDZHEDq6Yrc4P5vWgzbfg2Q7T8jVrvvlzHwe3
S9SGQlI85G6EL33/wiWUUNEuz77CoeS/ZkF0owwRpN43isyMHsZKKsrs2lK/sVEJ
gF4Irn9vAAA2WsG4UY8DgzF0qcsAcIxv1u7/NQL2EYF+1OuQWfo9ymVjpDrVhpvP
fxBKS2qbVqqY5cxbXPlgRJtl/3UVAfnwMliD5FsrphywxOszezOv9WdHZMbztWlS
KXBhGuWBx8Nh1mTjD4Uo3zWHKDwByKW+kTjvaDfN3l0s1obv4UQqf3COc46533b5
Lb9Nd03wMIJQNAzGPdjooGJWRVhfeQ==
=FrjU
-----END PGP SIGNATURE-----

--MSJwDqeLzComXiFD--

