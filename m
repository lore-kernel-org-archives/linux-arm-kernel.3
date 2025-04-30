Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DC1C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 02:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVFZTctHxV0J4BThDv/Rh1bu5X7V1E/RSG49b70KuFk=; b=j/yhQnAyeT6R7ZBFgkXPgE5StC
	/qHKJq8gEV5oYWHLsG57jJCQUdb1YRdj2nYEmSBxZ6wsSlwRItZZkc0fPoofWEF7SqtG/o8QDrLGQ
	pLupCVtkJY/GiWWeoXZ/SEzgk92cAgYmsVI9k5RsvuGMh1sJ6ISt8heCVfR8pknNdmTnpbk7t8lID
	DROv+1IPUveshoNbTh9HnGcq63TpL7aoM3C0h8+vW3ToC8f4XMBWPb37H0Cr24poNfcLPj39RyJx/
	IVV65Joi6XIWm+44FdD/rvFM45ioD9coywg9nVcc6YIMezDZ4F4etalPIfMyVt/M2tXoKJxyaYfvK
	tFck/PYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wlD-0000000BTnr-1zXJ;
	Wed, 30 Apr 2025 02:01:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vcw-0000000BNKE-2TrA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 00:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VVFZTctHxV0J4BThDv/Rh1bu5X7V1E/RSG49b70KuFk=; b=gS+tZ5aLEwFAL0N9aGAPMLPBzD
	DnB0wh0Zoyb8Q5/Gob/RNv+OjTLb2xHBPJh5UYJGXZElpbKw2eD0t2/KJJOum/YHDFY/MWFmc+Y9z
	IQEnNWTZ4lF49Xx2bxECUvQIJbjyFSrXbPRwa43IulD84PMQJXLcr/bzzRBGv9O3ow+POmgQfBdGj
	poeDIuM0S3uEiNE+aW/YLK2CxhwNPNXMuXDKWM4BhPcQPXXsJx728daJSWYr/KiFwq1/lrrDNHeX7
	X4IrN0FvKFv1c/mAb8FqUG6RvRt+hcOMFx74SZcCp0gKokflTqvwAG4AxXiPvqXMCsJ67JF3zMDp5
	pH7/2+5Q==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9vct-0000000DbPz-2pqt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 00:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FEDA5C0F9C;
	Wed, 30 Apr 2025 00:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD11C4CEE3;
	Wed, 30 Apr 2025 00:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745974115;
	bh=VVFZTctHxV0J4BThDv/Rh1bu5X7V1E/RSG49b70KuFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NW+eklPwrSa6qc0ANGDyz5ecCRQIwS8PesnSG7ZB0CPRIM67IQ+chPQENuKAi8zd0
	 Zm0R4pyyTFAJ92d2wvYK8KPthnCFMB4BchhmNBtnzWe8xgtVMFWUGiyoWKvSGNE2Fw
	 ENRTIbvu37efEZw9Qc9JXc3kQFVt9iN7UUm1kJrvcFFzdq6cNsGSE7nkA+c7mr4XpO
	 1Lzs6pVxugKDBfktLfW4aEWSQIThcWbYpdZvOE+/EEUrwFtNI6r3Tq0J9zcYco04Ao
	 uuPddb65DCIMCvzEIGz8vbggqDjU6uZxMsTS6t7v1flq7FdDn5fM4GFDvj9xs+TbRA
	 /7/jj5o1gfZ/A==
Date: Wed, 30 Apr 2025 09:48:31 +0900
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH] KVM: selftests: add test for SVE host corruption
Message-ID: <aBFzXw-ASk1bXQvx@finisterre.sirena.org.uk>
References: <20250417-kvm-selftest-sve-signal-v1-1-6330c2f3da0c@kernel.org>
 <aBDv39FD7eDYoplg@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C+U9jvApfUFUi2KB"
Content-Disposition: inline
In-Reply-To: <aBDv39FD7eDYoplg@J2N7QTR9R3.cambridge.arm.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_014839_929940_A28AD523 
X-CRM114-Status: GOOD (  16.29  )
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


--C+U9jvApfUFUi2KB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 29, 2025 at 04:27:27PM +0100, Mark Rutland wrote:
> On Thu, Apr 17, 2025 at 12:32:49AM +0100, Mark Brown wrote:

> > Signed-off-by: Mark Brown <broonie@kernel.org>

> Looks like my Signed-off-by got dropped by accident; it should be above
> yours here.

> Aside from that, and the initial feature test, this looks pretty much
> identical to my original WIP.

Sorry, for a while I had a version of the program that was a lot more
modified (I was trying to make it work with a wider range of supervised
programs) so it didn't feel right to carry your SoB forward, but those
didn't actually go all the way to working enough to enable any of the
additional programs I was looking at so I ended up unwinding them and
didn't also unwind that change.

> I'm not sure if it's worth keeping all the printf() calls, which were
> only there to help me check the UDF trap was being handled correctly.

I've found them handy when using it.

--C+U9jvApfUFUi2KB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgRc10ACgkQJNaLcl1U
h9AtJAf+MbIe0znLqzLeaZE59FpZ7imkJVYN6BNayn6dR6KSH0ba5TR2bJ6BOB+F
420HSoFS7860BB8M5gF1SYpt0BfhiwjXrCFEBjh/CI4n7XhIJKgWodPjFsSN4hIA
scNzDwbQ8TSF6N2BV/Wqa1y6SX2qE6HcSEsS3kiIn8dcPFXWKwxMAypCXPJpVF6p
SfQKTaqgkOkQBHW4TrPMbA20jdgLgGnYfGtB77/1VgTWfqaULkOc16bYSPVTYvu7
DXXhpzMrMwzCLSPIS9t9c3IZDSQKyeyk5SM2O17y5moR2ymnTSBRtR9aA1IQh+AJ
D/dD4tw21AQDTCp5d5zWoqSLzmIeyg==
=V8X6
-----END PGP SIGNATURE-----

--C+U9jvApfUFUi2KB--

