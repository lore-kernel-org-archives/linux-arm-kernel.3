Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C26C9EC92
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9ZCaGoKwyBW2hQ00UZFSK4WgVEJPrp64Jz55a44CNo=; b=Sl/c2fgfi3hgwaJt7Rw/CFJM0a
	+r7WVXow8UqazwJ+VDbaOsVZm3aDx/n753JbcJdgNqNorRKiorQ73u4+TLszTbyY8V9dbGNaXgNz1
	azXi9CG2FBVxM08pmMZBWxAyflVqIS8F4rOgO3mxPAs/bZxfc9R4QPd6TfqBDTdYWQFSTjg9/A8O/
	Lt3zqf7BHOWlDT8FSm3CKMOCnTBpJXh1mQ38+Yw+1eIkMillTNgOEWdlcJj+JqUV+bS9sNMY3HdPe
	uortRFoezPuRRLojUviBVDt2jcHVLeNGdNsSCw0sRlStmXhDoEgxm2NnRxH5jR5jXrEgYcLSIebGY
	BMhspJjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHxE-00000005PAC-19fi;
	Mon, 12 Jan 2026 13:27:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHxB-00000005P9o-2uHs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 13:27:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5FE340956;
	Mon, 12 Jan 2026 13:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969DAC16AAE;
	Mon, 12 Jan 2026 13:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768224448;
	bh=L2Nn/rFs+RlJ6rgf4HFcLnQumCrLx6SGdVUMvPTDb4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TFq+3KXlA78iDGw1F5Bajo8t7XjXnnc4kzGGXyNlI0xIeCfSDq34uE+qXmjcE/tTf
	 WB9FpTPU28Wvsu6BxY+OGuD3KZsDXLTxwfaNSt4sTtaOtKkqgT8aMDtTWGV4xXYnNR
	 +k90qD5gvoqlG1sxaghZ+wIPVHrCu3U/HOGM00CkjLSpIqhm9/+zBFmqLPOmfhnZxf
	 Ls62qcIDfD7JuPO1Poc8MuSqDbTUiOtiiTiqCzxXUDfnhu6cq40YLNNhG8oTXv3pV2
	 vap+a0YG6Cxtug5VvVQGqPCzQnBd1/fbodfp0JFxi212YMLHz35ScbAVTR/mDOn95t
	 BF0kpa9ahS1sA==
Date: Mon, 12 Jan 2026 13:27:21 +0000
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
Subject: Re: [PATCH v9 14/30] KVM: arm64: Implement SME vector length
 configuration
Message-ID: <96efc90e-bf1f-4b87-ab7b-0e24970eb967@sirena.org.uk>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-14-8be3867cb883@kernel.org>
 <CA+EHjTw-6-BFcr60+tgDzOE-OfcetD7yQtbNMkqr7BgiMXfeJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RBS2qpD2qI92kXAR"
Content-Disposition: inline
In-Reply-To: <CA+EHjTw-6-BFcr60+tgDzOE-OfcetD7yQtbNMkqr7BgiMXfeJA@mail.gmail.com>
X-Cookie: Surprise due today.  Also the rent.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_052729_782823_822553C0 
X-CRM114-Status: GOOD (  17.25  )
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


--RBS2qpD2qI92kXAR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 09, 2026 at 03:59:00PM +0000, Fuad Tabba wrote:
> On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:

> > +
> > +#define vcpu_cur_sve_vl(vcpu) (vcpu_in_streaming_mode(vcpu) ? \
> > +                              vcpu_sme_max_vl(vcpu) : vcpu_sve_max_vl(vcpu))

> nit: This isn't really the current VL, but the current max VL. That
> said, I don't think 'cur_max` is a better name. Maybe a comment or
> something?

It is the current VL for the hypervisor and what we present to
userspace, EL1 can reduce the VL that it sees to something lower if the
hardware supports that but as far as the hypervisor is concerned the VL
is always whatever is configured at EL2.  We can obviously infer what
the guest is doing internally but we never really interact with it.  The
existing code doesn't really have a concept of current VL since with SVE
only the hypervisor set VL is always the SVE VL, it often refers to the
maximum VL when it means the VL the hypervisor works with.

> > +       if (WARN_ON(vcpu->arch.sve_state || vcpu->arch.sme_state))
> > +               return -EINVAL;
> > +

> Can this ever happen? kvm_arm_vcpu_vec_finalized() is checked above,
> and vcpu->arch.{sve,sme}_state are only assigned in
> kvm_vcpu_finalize_vec() immediately before setting the finalized flag.

I don't expect it to, hence why it's a WARN_ON.

--RBS2qpD2qI92kXAR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlk9rgACgkQJNaLcl1U
h9A2Dwf/azWkcrVrUODdNtqy170zbkUyq/kjAmL6y71Ep+9LW2Dwr9LGdow7/YUY
L23/xb3tTdT1jBA+vncQEbaotf1dKG0f7n2z7+f4AR/C8d8tFcPLsiDlk1W7axjl
6trxwIzWJ9ALOdJJ1ZAV906PWNnauRMZJ4S4d6J8B6GYM/g6hos1Zob4HUSTWNr0
YrtZWIUlcPX4b86MKLocEvm8TbgNmpH2/roaXKxnonYU4ZpiHpWsMOjGxkcWe5cM
CRPF7d8g56cHcCLQg1K2TYwGeVdpvfnahrQ4fhYa0/asAxpy+i3TXUlWQaymDCAQ
rnNgtS6mcPyMYMmARC9h+Bn0JnCubg==
=5u+f
-----END PGP SIGNATURE-----

--RBS2qpD2qI92kXAR--

