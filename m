Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA2DC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 14:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeaUpCTCFQmCQ0AZdlEaFJmJbZGiq6ZZxGY5U6H8N6A=; b=pVhNrOSWI/vbw0/vyaY1Rcclys
	OW6ASRTfOk9cCLJ41PnQiEe/t2Azt+CBBzNXCbXmofXyLRru0AlSW3KI+ToyKX8XKALy7Gq7xPyHl
	N0QKqJpJbSQJJOA8G3OWn0G000M1CEHFwT2rFtTOSO5obCfUJ3S0vOpCIppTGKB3TIlLPNWGL7HD0
	xlvWDR7wSVcXlNOEiJ1LDZTLrx1VjSBkW5QZ2+QOfy1Dveq8ZKlCExWQvB0uqw+A5EylVXk9FcRbk
	C7mtwNfErEI+Z5eNLfsffYVId72MF19jH01PuvPFgaQkxRwBir54VJiLpq2bB08ifw1Zq2amKSBgh
	tTevq8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfJzr-00000000g2k-0aAV;
	Tue, 04 Feb 2025 14:33:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfJyV-00000000ftm-2J8E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 14:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E525AA42782;
	Tue,  4 Feb 2025 14:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB569C4CEDF;
	Tue,  4 Feb 2025 14:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738679545;
	bh=Euhfoq6TLskk749URRaDQVtHzdaHQ0kVMWrkuF1TOiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MStt8VdEbhnU3lJQFNILR4VHWyYCuJCm/CRHQGsd39ojT6M3neKzZAU5x+6waMIpX
	 ecqofxDZdaGWtspwyR78ggfxGeB2pxuRDTdGXjahJYO4XHLEmn2+2ZL5p5XPAIeW9r
	 //plznm4yIY6evAtoLr/RPWdE75UACnXobpuSNXWNICLTuiuCQLilPGJjDG5LMam9d
	 PQU1Ec/3jmiZxhzml730YJ6RjktXP1Wl+6/xqwMbOcQVYVR6fZGstE9Fc4kWjduehs
	 9MgOpBvSk4fsfEYag1G8/7I6mVmz+qPEoAuMTVbYM8UZLoUU7StbrNeJZbT++siohr
	 60L14ebr+U70w==
Date: Tue, 4 Feb 2025 14:32:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: uJap072421@linux.dev, Quentin Perret <qperret@google.com>,
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/18] KVM: arm64: Introduce __pkvm_vcpu_{load,put}()
Message-ID: <5b73e1ac-a48d-4064-a095-26cd9662f0c1@sirena.org.uk>
References: <20241218194059.3670226-1-qperret@google.com>
 <20241218194059.3670226-10-qperret@google.com>
 <5ca7588c-7bf2-4352-8661-e4a56a9cd9aa@sirena.org.uk>
 <Z6FO04PZtY8fsJhq@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hZGwqvAiR40zlt9m"
Content-Disposition: inline
In-Reply-To: <Z6FO04PZtY8fsJhq@linux.dev>
X-Cookie: Spelling is a lossed art.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_063227_651155_36871CDB 
X-CRM114-Status: GOOD (  13.09  )
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


--hZGwqvAiR40zlt9m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2025 at 03:19:03PM -0800, Oliver Upton wrote:
> On Mon, Feb 03, 2025 at 07:50:44PM +0000, Mark Brown wrote:

> > Current mainline crashes when running the arch_timer_edge_cases selftest
> > in pKVM mode on a LibreTech Le Potato board, with a bisection pointing
> > at this change.  The system dies like this:
> >=20
> > # selftests: kvm: arch_timer_edge_cases
> > [  130.599140] kvm [4518]: nVHE hyp panic at: [<ffff800081102b58>] __kv=
m_nvhe___vgic_v3_restore_vmcr_aprs+0x8/0x84!

> Thanks, fix posted here [*], although as a consequence this machine will
> stop running KVM in protected mode (which was never meant to work in the
> first place).

Yeah, I wasn't clear if this was something that was intended to work or
not - it's all in a constant state of flux.

--hZGwqvAiR40zlt9m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeiJPMACgkQJNaLcl1U
h9BDAAf+JAMcfN7yntUjtlLw50z/v5lCegG7EiTtVEvT8kwLbYGS7ld2HEzfNFiK
rTlpfALF2b81GimdH35TTPRl1FFgPygwCt4j8N1GcXiFif47Q1a3TRwNjb+wJUH1
Dm/iTV7HxZk7fPqefyEGirTNt6e4f2hkso3/XHVRCsn3BKhPYU2OAUj0CFqzrrd2
SdGFMZJnRe8QewuZ3g4EpCg9UvuZXjG8Af7u4WrYw+DAceX8dC+Eajct50FX9p5l
fDoUDAacSMXph9h8tu/dHxpKLNym8nExy1zpuUXu2U4Ckzr4x37HgyqZ1AZOYrij
hH1WYyL88f6C8+HLlWIotC0pRHV8Nw==
=H6/6
-----END PGP SIGNATURE-----

--hZGwqvAiR40zlt9m--

