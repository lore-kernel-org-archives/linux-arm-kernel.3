Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9B2D3900B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 18:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEuJXJ2URoPc4TljZ3LWG+cbp2uSGV41RD+NDGAlbTo=; b=D5dr3zyOAVP4BpK/BJbUpBcC0a
	SjJ9+8NikKKgbe232kmiSjvZC82atbrKPuqccK838ytjU4mlNPRCB2NBoCRy+8BTU95TVuzWGUJBY
	AzB9E/mt4t3DhboSvAivfefZCmpFEpSOYChYXxoF0nHBGEx5mIA/e4opeqworsjVAKA5LvlQq+2j+
	/sqDFpzDtG94G05lLMLT7M1KIKfzKpvrcEfMO66puQMWUPvCG9zEBCrBnrwsxAqHl1Zpn3Uk0fnc2
	3Gh+D9ue3LbWez3zwgkWuQGt2FTH3g7WfBqPsB67eRKgWzw26sBiUeGuJ9xy42I1SSPCKduGF9qCe
	I/nNA1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5v9-0000000ANVs-3DT0;
	Wed, 14 Jan 2026 18:48:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5v7-0000000ANVQ-3z0z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 18:48:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EFFF76001A;
	Wed, 14 Jan 2026 18:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C58C4CEF7;
	Wed, 14 Jan 2026 18:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768416520;
	bh=8KBWIbkpJwQyTeH+b5e850ZKQFUEMxvg18f8SI8BdoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/3YuIa8oSi/xC/GW3dpb1lZoupC4+ZqSiMYqsiRYtEJqPu5VpCncmLyynSJcab6m
	 lBJCYevFVEIqegwtLZxHvJqoCjsSXqVVmVsUGI2i5/xAgIiynXIiqV3aVETrQ8pzsj
	 j/r3LUKh0rJQ7on5AQeo4bk0Y9Xj1uCAYfpwyc9l9iKtksfZ0yQ/yrGOwPx+9pRZO+
	 FlEG6BL+gLBeSR4cWfZovOpnukvKBAAhf14aDSHc0HB+ZCwyzzyOikgCTwD7+I5dJw
	 RenN+N1iQg2SsDCExcca65J2x4S77imYS+qqfgCjzcZzgOuVQUnogF40oQgmb+PTt6
	 U6IahqNfIZSFA==
Date: Wed, 14 Jan 2026 18:48:34 +0000
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
Subject: Re: [PATCH v9 26/30] KVM: arm64: Provide interface for configuring
 and enabling SME for guests
Message-ID: <3be5b6a7-3b26-4899-8313-c849c28300ca@sirena.org.uk>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-26-8be3867cb883@kernel.org>
 <CA+EHjTxFfY_XkEQrNvme94uHoxQLWEaX1q1MikbcmwmUMq=NwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oq+yxN5i7kBipvCG"
Content-Disposition: inline
In-Reply-To: <CA+EHjTxFfY_XkEQrNvme94uHoxQLWEaX1q1MikbcmwmUMq=NwA@mail.gmail.com>
X-Cookie: Absence makes the heart grow frantic.
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


--oq+yxN5i7kBipvCG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 13, 2026 at 02:40:58PM +0000, Fuad Tabba wrote:
> On Tue, 23 Dec 2025 at 01:23, Mark Brown <broonie@kernel.org> wrote:

> > Due to the overlap with sizing the SVE state we finalise both SVE and
> > SME with a single finalization, preventing any further changes to the
> > SVE and SME configuration once KVM_ARM_VCPU_VEC (an alias for _VCPU_SVE)
> > has been finalised. This is not a thing of great elegance but it ensures

> With KVM_ARM_VCPU_VEC being an alias for KVM_ARM_VCPU_SVE, wouldn't
> kvm_arm_vcpu_finalize() fail for guests that have only SME enabled but
> not SVE?

If one of the extensions hasn't been enabled then the goal is that
finalizing should lock in the current state and prevent enabling it in
future but you should be able to finalize.  The check for vcpu_has_sve()
which blocks finialization is changed to vcpu_has_vec() which is true if
either SVE or SME is enabled.

We should, however, ensure that the VL of disabled vector types isn't
taken into account when allocating state in order to avoid wasting
memory - I'll update for that.

--oq+yxN5i7kBipvCG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmln5QEACgkQJNaLcl1U
h9Afugf/W7S3f9Opih1jYVPqRq1ITFPwn4oIVQt8vWQtOp6phpgeaEbVAIaBYQIe
eD4G1cgA3KXUU+K2fKQo2Ar61nctTEgEr+58MPeuamj4Z1hB2a3Vy5hTGB5LyIv9
U1EE5voSYFgHHl9+EZafvLf6DuTiPu6MksgwgBDiYvXF+sxtbZSKMHRPMVSYw8BQ
CEtdcOsodX04euF5khtGm1eSiHeJKuUAaPAEuqMYrFbMSzUHm6MZWm9rWP9JV1Po
p57BJt8/aUj19+5Q0LS6gnK/ozmrxfxf12t+3HXTcVxD79OOh1Tzw9DxwLDQVhnA
PbSht5ECwKz//OhF0SUzlplD7m5Wwg==
=bu0G
-----END PGP SIGNATURE-----

--oq+yxN5i7kBipvCG--

