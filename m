Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B31C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 23:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzKschgZvZGUF+9ira6QlB794ZxUSF02QB3OINA6m74=; b=HSClk8RoylBwXL2CLRIISTkTY/
	rp6sgpVlxAILW6pf64QYNKLFoYcbpNVyrkWjOVqPKrqMXTVcEpiKpU73HCtwLRmzjCy7juWjWcty1
	MO3mv+Qtc8Ca2JkHzzltqZwg8m1/IZgmKDjmpqQsmnd7hSABbcqNQQz4BXEdrJLzGWvEZ4oP1xRTj
	LH/Gh9wNcJTm1WB6U4xs9sdsg7gOfa4zZGzWHP3Wz2kVbh9y8T/K8du+ct/nvt75hr6COUs3uCq9F
	99mG5xcZxykUJ56kw5SARFrVjkC03qzF1q+PP01h1iRZBtKIVDMGMMB1Y7LKcP99qubYlh8tQlC+m
	njpSCcFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYEq-0000000E7er-0YQV;
	Fri, 21 Aug 2026 23:01:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYEo-0000000E7el-2gKJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 23:01:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 02130438F5;
	Fri, 21 Aug 2026 23:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34A41F000E9;
	Fri, 21 Aug 2026 23:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787353285;
	bh=hzKschgZvZGUF+9ira6QlB794ZxUSF02QB3OINA6m74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FYZDHLdv2T49SIJc79K3OCHvMXN7BV0y4762ev5Ts0hcMOLFdsSlaquyA70X7Jgp8
	 uQTnZz4XLTvX+bLUhUdn4IGb0wmorlxDuaAlgDLR6Wgok/c6LuvvvCnfCTarRc1LNV
	 eLR8FQwjwvGzfPPE2O/+xQaiUCz8DtiIcgk2pD3Xmy1+36pPpLTpzHkgxFK3Eh3tzM
	 Gbe/y5X2Vm4RkPrLuQT4LWaRjbUYRu9OYga5R9ve84gzepx+56HDJe2jc8TVT/Vt9T
	 IEkhnfC5i5ck4OIWSj6/DUBF3Yn2EwKLUoQgJjzzJOOKcBbu0S6f3gtMiYl9qa3TJ6
	 eDAio2HmeO2tw==
Date: Sat, 22 Aug 2026 00:01:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Wei-Lin Chang <weilin.chang@arm.com>
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
Subject: Re: [PATCH v19 05/14] KVM: arm64: Set PSTATE.EXLOCK when entering an
 exception
Message-ID: <f46a292d-5d60-4117-a2db-c54e7acfd0f1@sirena.org.uk>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
 <20260812-arm64-gcs-v19-5-9105afd828ac@kernel.org>
 <wu4y6mfg7avc32gg55vkxy565errbecy6kgckmthrjvuben2sc@xmrqciocdmgb>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="47Ov55ow126IRHuo"
Content-Disposition: inline
In-Reply-To: <wu4y6mfg7avc32gg55vkxy565errbecy6kgckmthrjvuben2sc@xmrqciocdmgb>
X-Cookie: Package sold by weight, not volume.
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


--47Ov55ow126IRHuo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 03:15:26PM +0100, Wei-Lin Chang wrote:
> On Wed, Aug 12, 2026 at 08:12:04PM +0100, Mark Brown wrote:

> > +static unsigned long compute_exlock(struct kvm_vcpu *vcpu,
> > +				    unsigned long mode,
> > +				    unsigned long target_mode)
> > +{

> > +	/* When taking an exception to a higher EL EXLOCK is cleared. */
> > +	if ((mode | PSR_MODE_THREAD_BIT) != target_mode)
> > +		return 0;

> This is essentially doing an EL comparison, which is also done in
> kvm_check_illegal_exlock_return() later. Would it be clearer if we
> follow the EL comparison pattern there? exlock_el_from_spsr() can have
> more use too.

Yeah, I wasn't super happy there - it's partly a question of what's to
hand and already in use in each location.  The rest of this code is
using mode.  I think given your valid concerns about the naming around
parsing out the EL in kvm_check_illegal_exlock_return() it's easier to
go the other way, make that code look more like this and hence sidestep
the naming issue.

--47Ov55ow126IRHuo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqI2L8ACgkQJNaLcl1U
h9DSmwf/Ti0qrhR56sAQYWMszAac7N7dyJ3/ETOQS6tSsbmRY66niGgwbEcvnlmT
iO/PPDo/y69zkAb/VJI+/SwgyfEdUgsZ1EaoiU6svLwuuGCs5EAVZuKgRbJgUy6K
f5hqKyIKwydaHgcMm5lyGK830e1Wnd9Fs/huhmqm1L6/0XJzAo4qdXv8rwQRyAD/
fIsWz2zBB2eOw8hrICNHcsj9HUlwGb9GXIHi6OkLZUFvCI3S67LRMJB6RSP04erl
jZyM5Hm6qhCQoxlwVQvrrrnv7rrnUdbpsoHHAHymeTBfiRvEs5hPwv/elFOsaFGu
qg/SXCg5sZWsIWQtuQ3IO69sfo5bMQ==
=6Imv
-----END PGP SIGNATURE-----

--47Ov55ow126IRHuo--

