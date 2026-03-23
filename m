Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79BDF46111
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaglnuEKvmhDHVxPkEiCZE9yt7htk15R7I1mxN0lds0=; b=QXBaaOyexbM6TpeSRIHr/X3XB2
	VcDEjP7q/6h+2/F/B1sAXzKR+cOz4eBNqLYTmqHezI3y0uFDT7SIm/ftYuTaPltEpqMr1PdkRUAwj
	ziWnHcKgAWiBN+sQULV8HDRTXxEk1oZFvCcFKpOOPKPNfaaHSw9bknE3g34Oh+VrybTg6sb4aKnAc
	n25/w9JF7XEtJndv/kJOdsy7+NoEvFS31wSJwqbTLP5tTYwtxNXt5Xt5NjMgqdiO6xw1E+sCtL0re
	3wO3uNGoZfOFVNGRN90N5mE4VFs7jhz0l4UJnp6OGFvyI8XsTPdJZHatU+88lQ/Ce9nTKw8okThg1
	JK5a+W8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fTq-0000000GqIG-3LWS;
	Mon, 23 Mar 2026 13:38:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fTp-0000000GqHz-2mWm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:38:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FA57600C4;
	Mon, 23 Mar 2026 13:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D04FC4CEF7;
	Mon, 23 Mar 2026 13:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774273084;
	bh=USMzPIu1/1gwLcFqDyGpJPU6fyEk3mOxUeH0qtfA7+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OU6XHM0UffNDTEB4SvGp5qtXj77lQnim9j70B1Ao/FtqQGkpL+JILHVyU1MoPJY5a
	 gfpBJjq2mBHAPZq74NqdSN+wdgGM/f56FnhflLgMyj2EcFrPWRtCBQ7su1v/gh231I
	 9tfs/46j/7w1TUsxkZCCgEUXLBaWWHSBY5OSi6j1Y1v+D00Es5+/h29/vGfRvG5+U1
	 M+kpRsaJo6ZOmGg+X5uD+a2fXCSK69WJraAal7nkqdX+smv4l6dWcSQ37W+UoVqBrz
	 3kCBsVmPfJ5bGAOqihh/B0q9cWA9qaCxrfbs0dcySWU/bytIDRnhH7SLTgPn7Jgtdu
	 Enppi209j2aIQ==
Date: Mon, 23 Mar 2026 13:37:59 +0000
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
Message-ID: <3be4971e-31a4-4033-9583-88d7fc96104f@sirena.org.uk>
References: <20260319154937.3619520-1-sascha.bischoff@arm.com>
 <20260319154937.3619520-13-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MlKsc4YS4+0PkdYN"
Content-Disposition: inline
In-Reply-To: <20260319154937.3619520-13-sascha.bischoff@arm.com>
X-Cookie: You will triumph over your enemy.
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


--MlKsc4YS4+0PkdYN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 03:52:50PM +0000, Sascha Bischoff wrote:
> Add in a sanitization function for ID_AA64PFR2_EL1, preserving the
> already-present behaviour for the FPMR, MTEFAR, and MTESTOREONLY
> fields. Add sanitisation for the GCIE field, which is set to IMP if
> the host supports a GICv5 guest and NI, otherwise.

...

> All of this extra work is required to make sure that "legacy" GICv3
> guests based on QEMU transparently work on compatible GICv5 hosts
> without modification.

I'm seeing a regression in -next in set_id_regs on a range of platforms,
including physical ones like the Toradex Verdin AM62 and i.MX8MP-EVK,
with a GICv3:

# ok 105 # SKIP MTE capability not supported, nothing to test
# ==== Test Assertion Failure ====
#   arm64/set_id_regs.c:651: test_reg_vals[encoding_to_range_idx(uc.args[2])] == uc.args[3]
#   pid=3573 tid=3573 errno=4 - Interrupted system call
#      1	0x0000000000403047: test_guest_reg_read at set_id_regs.c:651
#      2	0x00000000004024cb: main at set_id_regs.c:805
#      3	0x0000ffff9e85251b: ?? ??:0
#      4	0x0000ffff9e8525fb: ?? ??:0
#      5	0x00000000004027af: _start at ??:?
#   0x1111 != 0x1001111 (test_reg_vals[encoding_to_range_idx(uc.args[2])] != uc.args[3])
not ok 20 selftests: kvm: set_id_regs # exit=254

Platforms without a GICv3 appear unaffected.

Full log:

   https://lava.sirena.org.uk/scheduler/job/2584795#L4111

bisect log:

# bad: [0ec822710d040a1e4a13be04494dc9f0462f8ba7] Merge branch 'for-linux-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [0e4f8f1a3d081e834be5fd0a62bdb2554fadd307] Merge tag 'parisc-for-7.0-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
# good: [09e70e4f119ff650d24c96161fd2f62ac7e424b0] regmap: Synchronize cache for the page selector
git bisect start '0ec822710d040a1e4a13be04494dc9f0462f8ba7' '0e4f8f1a3d081e834be5fd0a62bdb2554fadd307' '09e70e4f119ff650d24c96161fd2f62ac7e424b0'
# test job: [09e70e4f119ff650d24c96161fd2f62ac7e424b0] https://lava.sirena.org.uk/scheduler/job/2565604
# test job: [0ec822710d040a1e4a13be04494dc9f0462f8ba7] https://lava.sirena.org.uk/scheduler/job/2584795
# bad: [0ec822710d040a1e4a13be04494dc9f0462f8ba7] Merge branch 'for-linux-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect bad 0ec822710d040a1e4a13be04494dc9f0462f8ba7
# test job: [a5d4dfaac4b2810ec2be80d2a9a1facce7dc554d] https://lava.sirena.org.uk/scheduler/job/2584889
# good: [a5d4dfaac4b2810ec2be80d2a9a1facce7dc554d] Merge branch 'mtd/fixes' of https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
git bisect good a5d4dfaac4b2810ec2be80d2a9a1facce7dc554d
# test job: [d04c0e637ff3323b010804dbfe349fb9c1309253] https://lava.sirena.org.uk/scheduler/job/2585075
# bad: [d04c0e637ff3323b010804dbfe349fb9c1309253] Merge branch 'dma-mapping-fixes' of https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git
git bisect bad d04c0e637ff3323b010804dbfe349fb9c1309253
# test job: [e3d585ed3ff891a00c2284fef4be9cf8581735ab] https://lava.sirena.org.uk/scheduler/job/2585150
# bad: [e3d585ed3ff891a00c2284fef4be9cf8581735ab] Merge branch kvm-arm64/vgic-v5-ppi into kvmarm-master/next
git bisect bad e3d585ed3ff891a00c2284fef4be9cf8581735ab
# test job: [0a9f38bf612b195e04236d366ed9f769ce14cc27] https://lava.sirena.org.uk/scheduler/job/2585330
# bad: [0a9f38bf612b195e04236d366ed9f769ce14cc27] KVM: arm64: selftests: Introduce a minimal GICv5 PPI selftest
git bisect bad 0a9f38bf612b195e04236d366ed9f769ce14cc27
# test job: [4d591252bacb2d004b7c7f5db439bfa23b552ee7] https://lava.sirena.org.uk/scheduler/job/2585661
# bad: [4d591252bacb2d004b7c7f5db439bfa23b552ee7] KVM: arm64: gic-v5: Implement PPI interrupt injection
git bisect bad 4d591252bacb2d004b7c7f5db439bfa23b552ee7
# test job: [da92ff15ca4c5b0f75ec1cb3d2e275db2ff2c810] https://lava.sirena.org.uk/scheduler/job/2585906
# good: [da92ff15ca4c5b0f75ec1cb3d2e275db2ff2c810] KVM: arm64: gic-v5: Add Arm copyright header
git bisect good da92ff15ca4c5b0f75ec1cb3d2e275db2ff2c810
# test job: [070543a85adce329672012a1fe35fa48c76e02d5] https://lava.sirena.org.uk/scheduler/job/2586294
# bad: [070543a85adce329672012a1fe35fa48c76e02d5] KVM: arm64: gic-v5: Trap and emulate ICC_IDR0_EL1 accesses
git bisect bad 070543a85adce329672012a1fe35fa48c76e02d5
# test job: [a258a383b91774ac646517ec1003a442964d8946] https://lava.sirena.org.uk/scheduler/job/2586455
# bad: [a258a383b91774ac646517ec1003a442964d8946] KVM: arm64: gic-v5: Sanitize ID_AA64PFR2_EL1.GCIE
git bisect bad a258a383b91774ac646517ec1003a442964d8946
# test job: [f656807150e3e1c6f76cab918e5adfad6d881d58] https://lava.sirena.org.uk/scheduler/job/2586592
# good: [f656807150e3e1c6f76cab918e5adfad6d881d58] KVM: arm64: gic-v5: Detect implemented PPIs on boot
git bisect good f656807150e3e1c6f76cab918e5adfad6d881d58
# first bad commit: [a258a383b91774ac646517ec1003a442964d8946] KVM: arm64: gic-v5: Sanitize ID_AA64PFR2_EL1.GCIE

--MlKsc4YS4+0PkdYN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBQjYACgkQJNaLcl1U
h9DTIwf/W12+7bv3l6vdsZYzXz9UkyBV+fFwNob5fA9ESs077+n5J/rLY2sDZ9f4
5q9rL8PMztjFc01LhDZ20SS96O1fHDMG3zlM5cqT71ydvqYbXxDjeUGDJ2q04mM3
EpSZWfAePSmWXtfrKNpPyvv/tUixTjBx8L8njZN76ub+6j/G1/JmQLZPzK/p9HMZ
04F7t6TyjzyTc66+9MWhnOT0YuCoeW0F40l0DGmsCkS4UvUo4ZGWCOgH7dhxB7Sa
bIwBBg1uQ3slkJSZt4SDENiBbDKVvMrsKD5im8ne4vsZSlzhmxI2YX0RiKRdFtwq
Qv3jM/t8g0tmkeezGlCcrKRdh+1U4w==
=ZAl7
-----END PGP SIGNATURE-----

--MlKsc4YS4+0PkdYN--

