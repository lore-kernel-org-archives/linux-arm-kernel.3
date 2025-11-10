Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCDCCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AH9aLYZMmMNSPDznwqaMZKfB31ogwjVJstDoX/hlzHU=; b=AAhqlvNKFEOZ5B68be0UxbnRbI
	5b1kd+eJmsoOXWzsax/AkEaZhNx2JTgo3YzXSzHH/ckx3mkk4VLs6mKq3yA3MSzkXNbILPub3a2y4
	LLAkD+vCC+wAdtUmteS7dPrgUgAEosEvLhRNuKbiJQZ4wbfUOMPpuKCaB0cVaK8J/RIPgZQfPUhtu
	6gLHuSOZzlASd3qb2vr+GkMk8gubQ0q3yjWUfBhlxnH0grE0n2MrdWrQcqI0u/1WGhJyUFK77kJQO
	6JfT2LQtMkogcJ4evGLYuES5C1KpiJHpCKg/Q/dpPPUpEMItpZwRMQeb41VZXkVRwo/YH6SqyZyb0
	f0r8xvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVZK-00000005tOa-1Qro;
	Mon, 10 Nov 2025 17:20:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVZJ-00000005tOU-2CBz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:20:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21F11601D2;
	Mon, 10 Nov 2025 17:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77769C19425;
	Mon, 10 Nov 2025 17:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762795239;
	bh=me6n6FjNH5PUu5+Jq5h9LLQT7A7eQf9qsR5sK2e3W/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hbris9J72y9lCN1y6TBrpBKmdp9WH5v1/hEHp9Fwx0jmdj0+RmLyv8+JVG8O1iSYV
	 JveYr9YC5UcNBOsp6CGHsFduHNYpmMQKftwDQFNUlbs7JvCvVyTfmp0xDOEQ7VNouP
	 PwIZNxFux3oUui+zAcCG/tID5r4+fm24GEtPY6cXocjaEplFg0e9+nCxQaZuSxCVRH
	 O+2b5ehZnZzk4A1ddBjX0KS7nzDbGRNVHzICQzirQLjuYut46qJiSrkITi4zE/bdgi
	 rG6ad9iRL/ZLO1SCYaSTcvMdBj4DkkJuYZMfrIVajSAxRBBN82IokKQNJ6FfQYqXyN
	 a5nUpedO1mhrA==
Date: Mon, 10 Nov 2025 17:20:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v2 3/3] KVM: arm64: Limit clearing of
 ID_{AA64PFR0,PFR1}_EL1.GIC to userspace irqchip
Message-ID: <aRIe5I5TCnvHt9oM@finisterre.sirena.org.uk>
References: <20251030122707.2033690-1-maz@kernel.org>
 <20251030122707.2033690-4-maz@kernel.org>
 <aRHf6x5umkTYhYJ3@finisterre.sirena.org.uk>
 <865xbiuj6e.wl-maz@kernel.org>
 <aRHzf5wgJg5vSoKo@finisterre.sirena.org.uk>
 <864ir2ufke.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HOGTRvsQdiipdvmF"
Content-Disposition: inline
In-Reply-To: <864ir2ufke.wl-maz@kernel.org>
X-Cookie: You dialed 5483.
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


--HOGTRvsQdiipdvmF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 10, 2025 at 02:29:05PM +0000, Marc Zyngier wrote:

> Yeah, I just found out by exhuming the dusty dregs. As it turns out,
> this catches a pre-existing bug that wasn't noticed until we moved
> over to the standard accessors rather than bypassing them.

> The hack below fixes it for me on XGene.

Yes, that seems to work for me too on the boards I tried.  Thanks!

--HOGTRvsQdiipdvmF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkSHt8ACgkQJNaLcl1U
h9CiAgf9FSF7G/oQEtNSUVbFMyHeGGb3mZUjyQIQ7gpouZT33sKNzEmd7S91E5vQ
k8wsplgA3HTBwkoT9AzCuWZJ8+Vgt4aja2ZMLXwsIcNJewmOQnhDr7BUMKxx57q7
gew2x/GbJJkFpO6r41FyR4rGrSnr0gxD+gTOa80KjRBBAcmbRYgyfofzpHGFARkF
AO2VsTyjQfpfOLwdREYBg5G2uMv/iRBl3RBIwHwaz2c9KpB/uy1j/ym4l6HJvOT0
Fsg9utR2voNS/oNwbZpOva2YpTrns5L4TLM+lScsT88+YfKj0ZGr0dSw4+e3+ikT
k35PPosh5/Q456zHpAKncMSkgLouMw==
=+I2+
-----END PGP SIGNATURE-----

--HOGTRvsQdiipdvmF--

