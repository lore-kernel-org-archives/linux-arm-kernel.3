Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6A6FCB637
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/IKRdm+GldUorSznXccnc5QXQfjeEvPOMr4pTKR9ho=; b=l8g446l7jWUJIc4q4eNsrFT670
	Fksy4To5JXReRDp1l5yLVQjzLKryU6+S5gyQRq9vY9qV5nNx8poJXhWZO3deJTPOMaoRn4TwimIvL
	LacRgDUJFAx6x9Mj42a2z6lfynqnxlHed1jPcfdm1/qwf1NJGZVnhi62T8sSRE98ZlgMK6IahyYvb
	38KVxeKdMPUjia199Ecs4xa4Si/0ntyToHdg/SHPZXaEQt+pdgG7m41Sfcu9/r46jpRZozEXtmv/0
	+b6lw09ke8kN/UWkeWvfL4fEEZBL0X8HHwHRmaHqgMy0DTFuA+4g34hFn8pd2X05OVaCuQJ8+R9iX
	wP3chiRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYfZ-00000004CXk-2jTH;
	Fri, 06 Mar 2026 17:08:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYfW-00000004CXK-30yY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:08:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DFD343946;
	Fri,  6 Mar 2026 17:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0DEC4CEF7;
	Fri,  6 Mar 2026 17:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772816933;
	bh=TDFTh7YVO4kn+0E0wS0GDUsWeU0kWry6Q+J9Kpv0oXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DyKrolLdqXUStW84WIm2omddYdbUXF+hGZtK802uuQypZj1wK/EQXcD6t3YN99hvd
	 wjQuiJ1h0mQajkmgMTAycWV/OYevREL7m7TewO+3Aw7mb7QAPC7xSDQr9vjHyoAhXm
	 dtHZ9YZ56LQf/Xy0j5LkYgFHhUVwzLBMN3+UvCUZpo1iFnAe9Eh2SHiiBnH+goT3R8
	 mVU24ant/W0ho0G+f1Q8chjXCYsXdmbgmGsj8rUHYLrvr9dFWuhQfBWL6yIDjvUIjR
	 3ZQ+oNTbXT+ZbXeAiqWvGFXq0v5Sz4SobWdEfxLoFD3vLlmQ7qes11wXgJMWIxWoRY
	 m0DkJUN9Q2WvA==
Date: Fri, 6 Mar 2026 17:08:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v9 00/30] KVM: arm64: Implement support for SME
Message-ID: <db2acbaa-704f-42f3-9fa8-aedd769f03e6@sirena.org.uk>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <CA+EHjTxOKDZ+gc9Ru=HpcRb8O-AvRm9UJaWM1fZeoqSz0bLK=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZcTNpR9PUgKwPiHw"
Content-Disposition: inline
In-Reply-To: <CA+EHjTxOKDZ+gc9Ru=HpcRb8O-AvRm9UJaWM1fZeoqSz0bLK=g@mail.gmail.com>
X-Cookie: A nuclear war can ruin your whole day.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_090854_802433_BAF9AF6D 
X-CRM114-Status: GOOD (  14.84  )
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


--ZcTNpR9PUgKwPiHw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 13, 2026 at 02:58:37PM +0000, Fuad Tabba wrote:

> Looking at copy_sve_reg_indices(), there's a special case for
> KVM_REG_ARM64_SVE_VLS, which forces it to appear before the other SVE
> registers. So I wonder if we need to do something at the level of
> kvm_arm_copy_reg_indices(), or do some sort of post-processing to the
> list, to avoid this problem.

I did look at this, however I didn't see anything that seemed tasetful
to implement and as I look at it more I'm not sure any naive VMM is
going to have a good time with this ABI, the fact that registers can get
hotplugged depending on the current mode creates all kinds of fun.  I
left things alone for now, I'll take another look and see if I come up
with better ideas.

--ZcTNpR9PUgKwPiHw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmrCh0ACgkQJNaLcl1U
h9Dn8Qf42GYB6VRVYWWy74gXH5yYwfw/Dpc+vc4pcS+Zlnn3oXmF2ou3o843wN81
+yjHL5yhHYBPUskqw6skN6Cw6rRlIHcN/ETVWdhwxAQzYpwNb2RFFJsO6uRQfIrH
o9Iwp8jI0A+QdVTo63Aek8dSpgYjQ9q+6ZKBktHL2HxZcfJ1kLYr9FLuBiR2SWJF
VTTBBywafr8rIXGJAuNJjUynKVczfgUioBByqZy7IvbNX1ddjGXlW41a9ua4IkpG
64kQ5vTKOR9g9XfIOJKEJE0edOqYSFRo55vCVbYUIN/uvNUuot9RP3OfkXsXk9qJ
7KyDFAU8Cb8fWNfplV7oyEtVjMG8
=avJ6
-----END PGP SIGNATURE-----

--ZcTNpR9PUgKwPiHw--

