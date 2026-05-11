Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1B8CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZuid1y2W7Sn7+5T+vH7bsCPfMv82SwuIePo76Mbw5w=; b=22Pdp0ma/2S1A50pS4A+N6qgU1
	Ln0w/p6+dIjVtX64s/UaqkJryp4HsqW0/JpQ6AeIirp3ylD21SRCgIhV9rqiDIYHmgxhCgQGn3nO+
	LyzGnO9HqiRfx9FeFjbgMbIB0wH3f8eefrMYfzJEFT+24L7YvYrHNjL8sXQxfPJ6wYktJz88BPq3o
	PZW6U9xYnohrFZP5q1Aoo+Fc0ucBZ+njeVjnGYw8hek4wvzfenpMH50I+UoduFhZbsXLCyV8Qzs+w
	Iamxu+L3ABKhX6Nz9v6RnkWTEHr1tp2ctEKYS9d32aMBrOMTlCiaOCF4XWwMuKSklDwF7TywH/rH5
	gCL+U10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPy6-0000000Da2k-32zP;
	Mon, 11 May 2026 12:42:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPy4-0000000Da1g-1Oy2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 12:42:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53C9740493;
	Mon, 11 May 2026 12:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16463C2BCB0;
	Mon, 11 May 2026 12:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778503359;
	bh=pYD09DsDxe/u4ilOmhS2skYVkR2myP8qJ3xnhphSpY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HMzeD+F0LmEMwTQFrhGfdrsCKn7booeRX+vlAVri2V2f1V76IeHzz7BG5DWjlKuZ0
	 eSjJkgMpPpwmwAMME13LOZwUH6jrKtJPa+UcsUh5muV7bnkRdiOA7SzHRjM6p+6BvR
	 M9AnGxDOZIpUs5Vq+n8Tvozcad7h5hkJKqCWufFSdA9qoLdhy/OeFJ5T05eHTwDqLm
	 3aTaWWQqIMZX7dlXuRsdLYoZDGO1nzl9JT8V1/PKw3uAWx5b2OXAE+g64TuOysxHa0
	 chlfaziVpuZGn4QmcVFFCiRbVOS04PpKxosmBJAO6qkAZLHmQwB/qePt9ltyN9lF+M
	 3cEJb51enKcuA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EA5DB1AC58A9; Mon, 11 May 2026 13:42:36 +0100 (BST)
Date: Mon, 11 May 2026 21:42:36 +0900
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 04/30] arm64/fpsimd: Determine maximum virtualisable
 SME vector length
Message-ID: <agHOvFiI1e3y_ur4@sirena.co.uk>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-4-43f7683a0fb7@kernel.org>
 <agGwWE2hcj9O4EGu@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8I5lQUED2RQSZNsg"
Content-Disposition: inline
In-Reply-To: <agGwWE2hcj9O4EGu@J2N7QTR9R3.cambridge.arm.com>
X-Cookie: Truckers welcome.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_054240_414610_EBAAC611 
X-CRM114-Status: GOOD (  13.74  )
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


--8I5lQUED2RQSZNsg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2026 at 11:32:56AM +0100, Mark Rutland wrote:
> On Fri, Mar 06, 2026 at 05:00:56PM +0000, Mark Brown wrote:

> > +#define SME_VQ_INVALID	(SME_VQ_MAX + 1)

> Does using (SME_VQ_MAX + 1) for this make something easier than if we
> used 0?

There were checks for VLs less than $THING which were causing annoyance
IIRC but it should be workable since we shouldn't offer SME to guests if
the invalid VL comes up.  I'll look again when I'm back from holiday.

> To solve all of the above, I think what we actually want to do is find
> the largest uniformly implemented VL which is smaller than the smallest
> partially implemented VL.

Yes, that's what we're going for.

--8I5lQUED2RQSZNsg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoBzrwACgkQJNaLcl1U
h9BD+Af+InI7f6CgI/Kl7rjYPDy/01C1QRQjXjxrG9nJHf2fp57ZuQPJO32v1e+8
54g+pxbwOJMMyR87wxnj8tTcQbJQqtIAiInLxPlIs06Wxs4/hV20mhOD9fDIPDq+
0DK2xWI2URuTWI8xvkWN7v8Nzi9uWmJ9AIuunvFYrz9GPUZIICEiu7+/sm4bD8fd
9RjnDI1/gmn6NjVlFh81aWDaBFFqomK1WGMwa1NVnpDTj6sv++fyeh0/0AdgpJMv
haYVOScpgtqOh/V0+Ryxf+zlYjFf37AIOTPvweJ7zWYtcHPqXmQLgXe7VUseb2Xe
IpiAILfnTKYKlw8vN0jO1Wcdzjwt4w==
=5P29
-----END PGP SIGNATURE-----

--8I5lQUED2RQSZNsg--

