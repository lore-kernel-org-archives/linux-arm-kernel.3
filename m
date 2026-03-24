Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D79E9A779
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JA1qt91LfWyVDhYq+0YBbhyOyHkFNztXcUff8vKIvBE=; b=TCanAterSNx/iq7btxA6pFLRMo
	P2LhgmGthr11lX1rp7YKFTzoE5p7ii6+h8X9cab0mkvdQEbtvyJN3qL/zpYJBCSQfo5sFOARwnFmU
	L7HUjRglogRTcSGXzip2qKcoANvWhgkeEllWGTt7+u+w1lDFTJq0VxwYP5v4PiURYqTg519+10q0S
	iv45GCH/Z3DdOCskNPAnhx3dgGFzSECS2x9f+Vt9YoyiihfJKAaURBQNKaBens+ZlX9iDEPkXouCU
	2mwnq2dtI5/WcvZrJhMzdE/CwL93Gym/mRxxPaARou3m+ybnFknWVISbIRObsBqP5/Ig76b5Qa+pu
	LCrA3XQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51AS-00000001QeF-3UAh;
	Tue, 24 Mar 2026 12:47:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51AQ-00000001Qdp-38Id
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:47:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E87343F62;
	Tue, 24 Mar 2026 12:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C91BC19424;
	Tue, 24 Mar 2026 12:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774356450;
	bh=Hs5NN0Xw501p0mYPPTi5mdNMUytgK95JTGwv0k/Zx+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rw/d6G4Ezmrp/6pLXfqsGb8zsT2oIIOuHYmS1k5dR423pXOfKzc9+gX/F7EFKXdya
	 MNMl/hEf685MQw6FX0fmM8qVRqr9x7zeey0RVmZV0BTCVMyzHFxKMkpkTEcSeLd0Q9
	 6o+zauJhYa2bhFGbTi68F4/ucakqTDzOvty9LS0jowVgeblfddwHZX25iIK4NoSOF1
	 Ay2GqQlNuYlcUFWVOh6e0ZK2gMjr07eLw2YnVFkkWUFT3rv189Evft5bBZ1ogsyZXi
	 t6p6t4kAQRJnZY+Ld8vQ0hpJonJUNVR9y2IgdVvRsBDEFjPy5OWgchWzzUq2gcJSDS
	 1UXm/irWTzgzw==
Date: Tue, 24 Mar 2026 12:47:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>,
	"jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v7 12/41] KVM: arm64: gic-v5: Sanitize
 ID_AA64PFR2_EL1.GCIE
Message-ID: <638a3453-91c9-4a76-8241-25d5c27ca518@sirena.org.uk>
References: <20260319154937.3619520-1-sascha.bischoff@arm.com>
 <20260319154937.3619520-13-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E0V79KpFpV4nuoMQ"
Content-Disposition: inline
In-Reply-To: <20260319154937.3619520-13-sascha.bischoff@arm.com>
X-Cookie: Should I do my BOBBIE VINTON medley?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_054730_826179_1914E275 
X-CRM114-Status: GOOD (  12.11  )
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


--E0V79KpFpV4nuoMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 03:52:50PM +0000, Sascha Bischoff wrote:
> Add in a sanitization function for ID_AA64PFR2_EL1, preserving the
> already-present behaviour for the FPMR, MTEFAR, and MTESTOREONLY
> fields. Add sanitisation for the GCIE field, which is set to IMP if
> the host supports a GICv5 guest and NI, otherwise.

We're also seeing an issue with this in the aarch32_id_regs test:

# selftests: kvm: aarch32_id_regs
# Random seed: 0x6b8b4567
# ==== Test Assertion Failure ====
#   arm64/aarch32_id_regs.c:25: read_sysreg_s((((3) << 19) | ((0) << 16) | ((0) << 12) | ((1) << 8) | ((1) << 5))) == 0
#   pid=3111 tid=3111 errno=4 - Interrupted system call
# sh: 1: addr2line: not found
#   0x10000000 != 0x0 (read_sysreg_s((((3) << 19) | ((0) << 16) | ((0) << 12) | ((1) << 8) | ((1) << 5))) != 0)
not ok 9 selftests: kvm: aarch32_id_regs # exit=254

which for some reason only manifests on TX2 of the platforms I've seen.

Bisect log:

git bisect start
# status: waiting for both good and bad commits
# bad: [e3d585ed3ff891a00c2284fef4be9cf8581735ab] Merge branch kvm-arm64/vgic-v5-ppi into kvmarm-master/next
git bisect bad e3d585ed3ff891a00c2284fef4be9cf8581735ab
# status: waiting for good commit(s), bad commit known
# good: [f338e77383789c0cae23ca3d48adcc5e9e137e3c] Linux 7.0-rc4
git bisect good f338e77383789c0cae23ca3d48adcc5e9e137e3c
# bad: [0a9f38bf612b195e04236d366ed9f769ce14cc27] KVM: arm64: selftests: Introduce a minimal GICv5 PPI selftest
git bisect bad 0a9f38bf612b195e04236d366ed9f769ce14cc27
# bad: [4d591252bacb2d004b7c7f5db439bfa23b552ee7] KVM: arm64: gic-v5: Implement PPI interrupt injection
git bisect bad 4d591252bacb2d004b7c7f5db439bfa23b552ee7
# good: [da92ff15ca4c5b0f75ec1cb3d2e275db2ff2c810] KVM: arm64: gic-v5: Add Arm copyright header
git bisect good da92ff15ca4c5b0f75ec1cb3d2e275db2ff2c810
# bad: [070543a85adce329672012a1fe35fa48c76e02d5] KVM: arm64: gic-v5: Trap and emulate ICC_IDR0_EL1 accesses
git bisect bad 070543a85adce329672012a1fe35fa48c76e02d5
# bad: [a258a383b91774ac646517ec1003a442964d8946] KVM: arm64: gic-v5: Sanitize ID_AA64PFR2_EL1.GCIE
git bisect bad a258a383b91774ac646517ec1003a442964d8946
# good: [f656807150e3e1c6f76cab918e5adfad6d881d58] KVM: arm64: gic-v5: Detect implemented PPIs on boot
git bisect good f656807150e3e1c6f76cab918e5adfad6d881d58
# first bad commit: [a258a383b91774ac646517ec1003a442964d8946] KVM: arm64: gic-v5: Sanitize ID_AA64PFR2_EL1.GCIE

--E0V79KpFpV4nuoMQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnCh9sACgkQJNaLcl1U
h9DYIgf/SuArUXAvR0Exh14zdhXrCO8O+CXwvECOEycekzRm3hTdQJRvNCTvnCqE
yBHraxmR8jdNYvqUn06djFs123wiu1bwJqjk+eC/CFTqTTNe0LcW/vmexBTMxehg
8mH1Emm+3VGCM3PZhf/60jySeNIygDszCT4ox1GKsiZ8c8vk2unqcBBHkp5hNwlZ
ObRq3RJYU6zl/SC6TY0BOG1XhgVwtaAuqegoVN7jy1RLIIoesXUqmQj+XglPeqxS
m/NgqXRuBB4e2ZuXMDVNf93HtxYtFxm1D9qnufpBzlTWFzbtX6XGMAdG7gopjYfw
d3jkKW90HAa5sy77547VHa19kKQxnQ==
=DImS
-----END PGP SIGNATURE-----

--E0V79KpFpV4nuoMQ--

