Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBF6C02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7DoRoSQhfGEEiwrOmrkb3fYiMDiOc3RYtmBjR6uEQY=; b=MO3/MVzqKpY3RKv00zeck0NGoX
	9bEOrGxJ3awF4EMWxgFVfbA3VhNfuOv6eRTD8WtkosXi/A1W7f3AOtXD/kkt0wHNcXJviQFBG/T8h
	lx4xfjC+F7M5OgtWI7YSCuj68WRrKtvhuEhEQXBv9zdYRy1ap2hVfDA6TZwJNkBhtQRnznKMjTPkP
	xN5q5cbQrYY/B9qM9TT4Yt4nzNv1KVt2n9pkzPeLNfOGE6qzE+ZCLsEHVaTsXia1cv7WDeMEvuQN2
	ordJbKZ3jLOebwv4KwXxZLxPcBMfdrUVeiZEyRgm+TjgGy20/fuxGuqvB6ZqQGnCXFZlY42xPKtBo
	mLQQNC3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMj2-00000005j75-2XIm;
	Mon, 13 Jan 2025 15:51:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXM2M-00000005YNS-09XC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:07:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C46E0A40C72;
	Mon, 13 Jan 2025 15:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7123C4CED6;
	Mon, 13 Jan 2025 15:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780848;
	bh=oi6ab4XbpzTbc1+7t7QB9hXM8i6N02vrJ4FXa3pV+hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EzyQJyi9R/9hVcyvFqkltzhelPri5SRJlX5xK/GsdadHsGHy6z6r+wcQUsDeH/BHL
	 4pcIYDHSJqxLxsTeaj8GXbDxU2m1zcxj71cqt0xQ13xFueay0+PH7rWdBi2bgLEccE
	 XJkXsiVza9TkZs0C6ibyIYWdHZ6H5l2ayPHEoE5+/1VlbbqVINM2rwCnvPTX/r8fOE
	 oEwtZHKWjcDmYxEJj5yN+YmNrmND1Nip98WxsBQeoREkKkT8x1yQGU+iNIDbUrGlc1
	 WMFX0z9ZFKPpyv3G3PWr+cdrqoXmVGyoyh3NMhzV02OMzbwRhFSCSIwD1U6WVERwaB
	 mWZAbuvY3KbGA==
Date: Mon, 13 Jan 2025 15:07:21 +0000
From: Mark Brown <broonie@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: maz@kernel.org, kvmarm@lists.linux.dev, oliver.upton@linux.dev,
	suzuki.poulose@arm.com, coresight@lists.linaro.org,
	James Clark <james.clark@arm.com>, Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>, Shiqi Liu <shiqiliu@hust.edu.cn>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: [PATCH v9 2/7] tools: arm64: Update sysreg.h header files
Message-ID: <1dad2a07-6aa2-4ddb-a337-ca3bba560f92@sirena.org.uk>
References: <20250106142446.628923-1-james.clark@linaro.org>
 <20250106142446.628923-3-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="whoHAOHtY/l4dkaU"
Content-Disposition: inline
In-Reply-To: <20250106142446.628923-3-james.clark@linaro.org>
X-Cookie: Marriage is the sole cause of divorce.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_070730_135112_AF4EF377 
X-CRM114-Status: GOOD (  14.27  )
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


--whoHAOHtY/l4dkaU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2025 at 02:24:37PM +0000, James Clark wrote:
> From: James Clark <james.clark@arm.com>
>=20
> Created with the following:
>=20
>   cp include/linux/kasan-tags.h tools/include/linux/
>   cp arch/arm64/include/asm/sysreg.h tools/arch/arm64/include/asm/
>=20
> Update the tools copy of sysreg.h so that the next commit to add a new
> register doesn't have unrelated changes in it. Because the new version
> of sysreg.h includes kasan-tags.h, that file also now needs to be copied
> into tools.

This breaks the build of the KVM selftests:

aarch64/aarch32_id_regs.c:150:16: error: use of undeclared identifier 'ID_A=
A64PFR0_EL1_ELx_64BIT_ONLY'
  150 |         return el0 =3D=3D ID_AA64PFR0_EL1_ELx_64BIT_ONLY;
      |                       ^
1 warning and 1 error generated.

since it's pulled over the changes in 056600ff7330 ("arm64/cpufeature:
Replace custom macros with fields from ID_AA64PFR0_EL1") but not updated
the test to reflect this.

--whoHAOHtY/l4dkaU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeFLCkACgkQJNaLcl1U
h9B6Qwf/QPeV8LvvKgGAErZB3th7rCS0P+WFRYom7XPEzXTvxrJkMpfproE/YfIe
yb8cRX+Wm65xgxozRV7WfJBq19dyU+TirkCiY4DFTF7uuOHr61tbkDzRP+/Y4VnT
HM/92xixwLioSy4xt6byM8GbaPzDi5uNS841VPbG8hzayntBbt17TgsPq7KAzNCh
F2v4Mxr7OoQlL7xLa6C47AOSvb3tekvB3Yy22IKm2IK+TBSotrwDrxnmH8iNtwUv
PsUYYM0iQr6RixcpqymDN+fZ+VGXZ+jR8/vCBPv9KWqSkLUnj9Dtu/Hw45oaqsAT
HDflGT7KLQF8JB/nIGGEeRsIUSkK9g==
=01JN
-----END PGP SIGNATURE-----

--whoHAOHtY/l4dkaU--

