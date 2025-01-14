Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23314C02187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVZSoZ211DW8CFWLznFiOSuiDKHQ8UbRtvnQP+bD+h8=; b=sAQir0nb6x5W/Xe0paP6gULirU
	d/uZzs07l+PY7ucN95nHHoxpskLbm3/EGViiiqkPPmvZTzlqGXG47/y+gCjQHUeoTS7dcNm4q015t
	ADtoLycxcyAZSpht1X0WOGH6VrJ2FnJcQVgY/x4lvzCgFLzrTnPksPOz/DtYHFiCbt7jAq/XZ9k5K
	XYALmnmySkvGKf3J7PdIHaxqdrJaY0H0OLkuofQkGjRjzvNDhqdHFYQethx8dRa9KiKJGyyux4B93
	6ewgWeQcxyNn6tno+uK6dW0FdeegJbA6+KhVHb+Khk2MmhQsXw7DwtpPD43xFjc6J6wsPAYHUA1I1
	mavsz5/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnsV-00000009jJb-3PZH;
	Tue, 14 Jan 2025 20:51:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmqx-00000009ZVD-3RoC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 19:45:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69BC85C056D;
	Tue, 14 Jan 2025 19:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC25C4CEDD;
	Tue, 14 Jan 2025 19:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736883930;
	bh=2ml/TIaI6G15M5AEJ90KaNKUGMB1AieEtHjJb/6pMnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2SpaxeRNWMFa+VKE8DpGNH7vsi78nICaF/074HAST+1I7jjpxZEoKQszs+TcqIff
	 m1358f50vtFtpLSMmiPZxb1R7u0YO+128bvzOdJEFRw9Ur7/3OWRYwO9FvUnXXNYkF
	 qJ551HEpnp2Z9nE0C3OAK4OC8NOa+D/OjfHwz6csjt0rvRF+CIXP+1kID/PlfRZtRF
	 ZEPa5GfPWGBlC/jaH3cP7Phl6ee2JcshkuBsF+lus/R3PumhHXCoz+MK5BJqs2BTeV
	 lHZFvXUb4T0nF2dUmnxS6ZHWPtlNsm//drzA0JKYDrUxDSONbD3acVhEbwTI1cN2vE
	 UgEn+W0GhItug==
Date: Tue, 14 Jan 2025 19:45:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, James Clark <james.clark@linaro.org>,
	kvmarm@lists.linux.dev, oliver.upton@linux.dev,
	suzuki.poulose@arm.com, coresight@lists.linaro.org,
	James Clark <james.clark@arm.com>, Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>, James Morse <james.morse@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 04/10] arm64/sysreg: Add a comment that the sysreg
 file should be sorted
Message-ID: <883e4173-d11c-48ba-88fb-13302ccd6834@sirena.org.uk>
References: <20250107113252.260631-1-james.clark@linaro.org>
 <20250107113252.260631-5-james.clark@linaro.org>
 <87frloqjso.wl-maz@kernel.org>
 <760969b6-18b7-42ac-9524-2f1f845b3703@linaro.org>
 <86jzaywtea.wl-maz@kernel.org>
 <CAL_JsqJFgunOVqpXnj+0HQ_HYbbVrtjCTJ25KzJHhjay-0i5tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NBHLGodB6XJd8ngr"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJFgunOVqpXnj+0HQ_HYbbVrtjCTJ25KzJHhjay-0i5tQ@mail.gmail.com>
X-Cookie: Sauron is alive in Argentina!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_114531_906166_3113E21B 
X-CRM114-Status: GOOD (  13.95  )
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


--NBHLGodB6XJd8ngr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 12:16:27PM -0600, Rob Herring wrote:
> On Mon, Jan 13, 2025 at 10:49=E2=80=AFAM Marc Zyngier <maz@kernel.org> wr=
ote:

> > The better option would be to add the comment *and* sort the file.
> > Leading by example has some value, it seems.

> IME, it's better if documentation just states what the tools enforce.

> Can't we add something like this to the header generation:

> $ grep '^Sysreg\s' arch/arm64/tools/sysreg | sort -n -k3 -k4 -k5 -k6 -k7 =
-c
> sort: -:22: disorder: Sysreg ID_MMFR4_EL1       3       0       0
>  2       6

Sounds good to me.

--NBHLGodB6XJd8ngr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeGvtMACgkQJNaLcl1U
h9DQDwf2J2bZkmKraJMzR/mJKrMXvtfn14Ugf+UdML9Wb+rdDmyG6OQrrgb1XkAO
hlP/cC1bA+npKb1pjREfCgRVAbHtX9sO0/mOFtL9dANnO1SzDyXZRtCJA58ZSmJX
bKuWj/bGWrI8aakHAVb+pE96b7vhrf8Cn2NkCfFw3FW6uxzt/lqBNF89vrQqyo1n
GaJr4vSxwqhSuouPIElFkVH0I2j2mDJcdgrCWDsxF7EyaB4xfVQvd/yqs7lUZltE
OOPftckHf/nl8gxKE1yTTM9caTxaH8SO58UUVhGfw2ARhNqlogNdiUWj97i9ly57
e0kGQuJNyy24hhbl39VtP8NtMsUs
=ARhY
-----END PGP SIGNATURE-----

--NBHLGodB6XJd8ngr--

