Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBCFC44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PE3gaGsNLQ/wJ/jx4xmXlbU0Ll5weYz4ZF4wxRh4WY=; b=OJIfhSy518maMih3LBukQhhpS8
	p3b/Db3wkNM/BY3SySE5VRbp/ZvsbddtUnP4otnjdX9Qc5cbjm38eT8H8eEWhXSo5bCZw2ox/mzcb
	nIeDHpygxH50EBmxKqpZOqi4sWjonWpc/x7QbjcIU/L3X+kQiBtM81x+DwCN+q3TiWrn/90upy+oB
	7oC9GijNoTHoDfyKxd79bxVbMCLs01t4OUtI+QtIsGQhoJj6SL4V16cyXeSmAoqIEaUHleVB0eQRt
	iUy8pv+H+BsRzkOTFQ39Mbc1kndlJUCpjLsNz8T4Nk8VTSN9dSAd/+V+jBKb6eDMyzdTq3kee2ZLG
	zYf4EzPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGkL-00000009PYw-1F0Y;
	Mon, 13 Jul 2026 13:30:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGkJ-00000009PYi-490r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:30:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC42F4028D;
	Mon, 13 Jul 2026 13:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812431F00A3F;
	Mon, 13 Jul 2026 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783949455;
	bh=2PE3gaGsNLQ/wJ/jx4xmXlbU0Ll5weYz4ZF4wxRh4WY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ikTp/ZDJbKzZqXWQdgJFs4mxUmOx5W44no98j831xxLyCdzKqQoLZo0aubu7A6s4I
	 pHh+efGT9meohmhUvaKUh/9NhBL49M6U1IfTZLuCDURT9zO31YfLr2SBN3ScUD26+W
	 VkCFEJFSu9obPyRdJSJ72kzy/VLeOvMf10vfXZpbaCI3wSnfxgcpW76ZRvh3kS/ZHD
	 Yv06UQBSZoTyN/qEb0fEQmSroyWlJiM4/+bIXwhSR1jQarFKw3ksg2oLI+HqyPRfF2
	 CvzHlCEH2mrN/QQRWwvlsrczJMPg7BKTRAWndik19UrgS416WGQAAxpSqCM1/v4tJg
	 yEau/1bCMbsqg==
Date: Mon, 13 Jul 2026 14:30:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 22/29] KVM: arm64: Context switch SME state for guests
Message-ID: <8db1cdd1-5294-4166-99f4-340d124d72c0@sirena.org.uk>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
 <20260709-kvm-arm64-sme-v12-22-d0301d79ef58@kernel.org>
 <CA+EHjTx6P_Wz8=+3fanry_Cs6sqyTD8Swz61WZah46u6-UXP5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v9CtVmyreETBkO2w"
Content-Disposition: inline
In-Reply-To: <CA+EHjTx6P_Wz8=+3fanry_Cs6sqyTD8Swz61WZah46u6-UXP5w@mail.gmail.com>
X-Cookie: Courage is grace under pressure.
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


--v9CtVmyreETBkO2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2026 at 03:40:34PM +0100, Fuad Tabba wrote:

> For a nested guest this folds in the LEN restriction from the guest
> hypervisor's SMCR_EL2 just above, but not FA64/EZT0. vcpu_has_fa64()
> and vcpu_has_sme2() are VM-level capabilities (kvm_has_fa64/sme2 on
> vcpu->kvm), so an L1 that clears SMCR_EL2.FA64 or .EZT0 to deny them to
> L2 is overridden here: the physical SMCR_EL2 gets the bits set from the
> VM cap regardless.

Doh, of course.  I've fixed this locally.

> > @@ -128,7 +220,7 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hy=
p_vcpu)
> >  {
> >         struct kvm_vcpu *host_vcpu =3D hyp_vcpu->host_vcpu;
> >
> > -       fpsimd_sve_flush();
> > +       fpsimd_sve_flush(host_vcpu);
>=20
> sync_hyp_vcpu() runs fpsimd_sve_sync() on &hyp_vcpu->vcpu, but flush
> passes host_vcpu, so the two sides operate on different vCPUs. That
> asymmetry alone looks wrong: flush and sync should cover the same
> state.
>=20
> Concretely it means kvm_sme_configure_traps() programs a protected
> guest's SVCR/SMCR from host-owned values, so the host can e.g. set
> SVCR.SM and fault the guest. Keying flush off &hyp_vcpu->vcpu like
> sync fixes both.

Thanks for spotting that, I've updated locally.

BTW it'd be really helpful to delete unneeded context when replying

--v9CtVmyreETBkO2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpU6IcACgkQJNaLcl1U
h9AaOAf+KDIg9SieNgLHu8cIPChCdW1/JE5Q90xi5O9YT1F33j626OleMhM1VngO
WHezCRNFf8cg4aTf93obOsz6F6jnWTTZaK82gt6bRu3udlizG+33O7jnsnLFd589
SMe5MOi6iwIgvK0yl8Tf4GAxXgJxMNb/vzvY9hfmke/jCDLYT7BF31PeQMwfDTgq
pKvDiG9o4dUBK4pNzzKuyqaOxHbKmRBlI2+oYON8XCsp7k6PvWSxwnQcPS2WqoyD
h9pAC1jb/eUt/5pQtbQOv1a0O+9QPeVg2CywPMriMQhSZERveEm4vNP+n4EmfEfH
aDQwImKDchI/GbVfMboiAWDd+dLhrw==
=X8+a
-----END PGP SIGNATURE-----

--v9CtVmyreETBkO2w--

