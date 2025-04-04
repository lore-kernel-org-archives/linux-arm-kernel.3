Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC979C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 13:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93a7crTZlqKDMjN5KTloXonEd2PPWUNDkKzR+C+Mo+Q=; b=jizD9znpcN7TN2DKuGQrrfNLRj
	DEYHcYt4Y/qwuIt8c1Vnrr+0ekCtXlqgPiZFadPOJgXV4NPSnXptiqVgGC5M1B5VEaDPmRYTLmCNv
	JNNYxC8UhhtaIriVoj/6mhc9klAbNqhEz/H2OofouhVF4swTQs2/jovepSc/hU7x3o7C9tWkWqZV1
	1lpadvhtd4olAtJHsnUg4z1NzVxSatJe4zyjw4HH8Ts7XWAWXL2AJ9oaJPUWtmbEE1YXKwG2lTkAl
	iYQ9/qmPXMq2BWOFPMpgsZXEe5RbzhPkRdZTdzLGN8dzjceB30v+K9MQ/8u22PbsKc9yZeS/Ufqgi
	dIArparg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gzu-0000000Bodu-3Kus;
	Fri, 04 Apr 2025 13:22:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gyA-0000000BoQZ-3Urw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 13:20:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14E5BA471A5;
	Fri,  4 Apr 2025 13:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F113EC4CEDD;
	Fri,  4 Apr 2025 13:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743772825;
	bh=93a7crTZlqKDMjN5KTloXonEd2PPWUNDkKzR+C+Mo+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tu8qJbap36HFmnfA6jGTd3EKeBOK83E1Dd1e20nwXEllxvBtxHT+u01vjhBVIxUBX
	 tNDCTJ/Rp8yrpF5M5/67bcE/FXvVMIrDnnw+yie1MbkAve5bPucHm/vNecSt3CQDxF
	 CNcq+R6GFWmlb416GJ176e08p0OwgNz+9MnWvvJAzO2eBYAAV+DnJPLSNhOC/bCdP2
	 rSk/I9dzlFPCuHiO/CR8P7JRoxBi+egZ2fBd+yzs5NpHcJcM0LfvUS7pG76KeBfFjO
	 /qOl2T79FGLXqcCYNLQowZGBD7Ou9zh0WRhVHTZ0O7FoDauyGHlAMoPP0dmzssKc0K
	 F4K2gRIjg6OtA==
Date: Fri, 4 Apr 2025 14:20:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eauger@redhat.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Florian Weimer <fweimer@redhat.com>, Fuad Tabba <tabba@google.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	James Clark <james.clark@linaro.org>
Subject: Re: [PATCH 00/10] KVM: arm64: Backport of SVE fixes to v5.15
Message-ID: <0cf47dd3-f02f-4872-8a44-14b6a968b3b8@sirena.org.uk>
References: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
 <1b4ce8d2-2e0e-49ef-ab91-4a831e22b8ed@sirena.org.uk>
 <20250404130316.GB29089@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h+RcjSQLM2x9OHrW"
Content-Disposition: inline
In-Reply-To: <20250404130316.GB29089@willie-the-truck>
X-Cookie: You will soon forget this.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_062026_941451_DDC7894A 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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


--h+RcjSQLM2x9OHrW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 02:03:17PM +0100, Will Deacon wrote:

> I think you made the same mistake on the 6.1 backports too:

> https://lore.kernel.org/r/20250325-stable-sve-6-1-v1-0-83259d427d84@kernel.org

Thanks for spotting that.

--h+RcjSQLM2x9OHrW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfv3JIACgkQJNaLcl1U
h9B1BAf/XmJVthgKmdYLjKgCmCQpUDyevnL8xAXWkeVo7/ANogep7E39NQu3uzLb
JaEtpLxYJe55nLgqYwD6Ggud9+q+Dcyh/LlVkpPueFGoGUTVDcxbDZtCUJANEfjW
TuI6h9oG2ZLlsNWFoWYVyqLPIoOFhm5wvjIvJBcWckyJHv52tAaeOEyHwmHDK4zV
Fh7Da1aR/5l3x/O7VtvnJ0O5nDiZL/BQtpi0VIJCZmPc/z0CMYCAXRqUcjnUAAFN
2yONNBwkYnwqdMZ0s+88JEQDKe7eq6NZjAdj7yFojZxoce57NcvxnpK9vOxBqivu
49Cb8+JPWvyIn1IhNiLK2PyTr+vT5Q==
=uED7
-----END PGP SIGNATURE-----

--h+RcjSQLM2x9OHrW--

