Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFE0C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 18:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDswP/zTtlamhTNgWOwGt/bK2scN2YOFm9u4b5IoSzA=; b=YQGbSQRNGAp5pheYHxoKDZy05a
	Lf9UquzMIhGBRue1eIQ7CTUoAYYGH/vqtMf9wfxB++3vNiovWxkbM+zEETxn4nj2O3uJe9mQC0+rH
	VmymTbIP0eE/mrFoDjiR4x2kKoTtJ3ZSLFLiVYgdPXD64eTz07MiQtc3mzm9InNs6OgWyjlRXLi0X
	09YptipzmdT6PHFY848Lvr2PcfDi433VylsLZ3+Aj1bOXL8Q9Oc0TsEMpOZ9156n8RuXEPex3UOOO
	gDhDTxnyog/OTKW1BROQQFICYChzTC7gCR+kI9h5VehBkqaRIvxyefx4sy5LwmriIOwYNKaLyUieZ
	JS3sWnnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkht-0000000AKLF-0bsI;
	Wed, 19 Aug 2026 18:08:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkhs-0000000AKL6-20pa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 18:08:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B6BF60AAA;
	Wed, 19 Aug 2026 18:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009111F000E9;
	Wed, 19 Aug 2026 18:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787162887;
	bh=yDswP/zTtlamhTNgWOwGt/bK2scN2YOFm9u4b5IoSzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Aw4v7TmIhMvmCT7kPU6JnfuwLfgRoUqV+iF5wE0g3hUQVgVXgnOqyc6czkcQP4sxE
	 vilP1kI9NXcrGiWTvrb15JhA2KCGVRzKiOsCs1NisrSn6pKdc3m1Vj8ciK4SJznvR3
	 w+D7IK7YywaDMdd2cGnAP2flEHElm5hZPv/9UxSMAk8DjofW/7njZi7q6Dbqhmsx1J
	 saC7rBuOZLTghng83dAmIGgPLhE13qVWlnb9f7b7f7uh6w7iZALvAGMYjbNolkzzfH
	 fL3JfdxuXX1szhCZe6yKNlhKxVQlU2fR25Y1M8J7Wb5V+EItSS+y1984PiGVqWUj/v
	 sVy5hqADZjT7A==
Date: Wed, 19 Aug 2026 19:08:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 04/14] KVM: arm64: Ensure GCS memory effects are
 visible
Message-ID: <3cc4cccd-1a4a-487e-8ac6-9bbbc9713e58@sirena.org.uk>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
 <20260812-arm64-gcs-v19-4-9105afd828ac@kernel.org>
 <aoXmfz5pPwRYRKTO@LeoBrasDK>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5kCzT7+Dr0CeiCFv"
Content-Disposition: inline
In-Reply-To: <aoXmfz5pPwRYRKTO@LeoBrasDK>
X-Cookie: Allow 6 to 8 weeks for delivery.
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


--5kCzT7+Dr0CeiCFv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 06:23:11PM +0100, Leonardo Bras wrote:

> You state that we do _not_ use GCS in the hypervisor, nor in the host.
> I understand that we GCSB() when we exit the vcpu context, but why would =
we=20
> need to GCSB() before getting back in?

> If cpus will GCSB() on guest_exit, and host/hyp does not use GCS, there=
=20
> should be no GCS pending operation at the entry point.

That's there to ensure that updates written by another PE are seen,
following the same pattern as DDI0487 M.c K10.6.5 example K10-8 (or the
prior migration between PEs example, that has barriers due to the stack
switch operations rather than as distinct instructions).

--5kCzT7+Dr0CeiCFv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqF8QAACgkQJNaLcl1U
h9BePQf+OGif9yTteOKxAeb4o+1LXzrTPgOt6KeKCzRt/t4tBBwTYB9KSRz2d3XT
yKGUZN6J9H9c2DuQB5Bd5YmSvnkDeFSmbyZiP6B++oDN07DJ2HrGW722/VA+fxwY
CU3zRqKUQT0K8AhGi5Sc2Xg+HANN+iG4FUTFstZSE+tw3ecm4/zZnabShXcJzpnQ
LEomvP77gb8tl4SASjXN5Eqa2XxhEMD9uT5k714u+FVWQ9TC9I9zbnJb+DHgFJXF
XVnObidvm7Hs+AsgUKi8Q4geY+CRRwVRqk0wRHCe+dF7iHOZFNDD0gGzJ2c5Hs/k
NENDaUUsfBso4RvD56Xybejkncilbg==
=swJ4
-----END PGP SIGNATURE-----

--5kCzT7+Dr0CeiCFv--

