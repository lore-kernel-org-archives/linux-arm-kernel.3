Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984F4F54ACB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+H1RQt9nEFm1mW3pj/3FppU+zA1eZ4F6q95FB9cWR8I=; b=e0aw5TmmgF0y6VjbFqnWuIxjA3
	rwbAZ4emKnBI7A+DAn/EsA5aI9hEHRdgCMNk4QkhVFXcYzlOhoFF2lDEH6YN+I6wvkgro9mMB79sR
	yra4sSPyZUJVZQ8T8fufiRoliblZvkKLz69lcwAWXQ36q4w2w2aXySX1F+A+gM/cZr1oFU2lJ2TGL
	KtjdGEsxoh/DbCVmL8w+GHuVBbSozJf8PuVMjBakakkA5UvMqhp2I/t1E9KZAowCYHoWteCOYh8s8
	veEJgPgqjSOjs84+0pRb3PecUFsPmYm6HAKMbbnaa6KJBE3/Fd4fP6wP4Uq4PFKHvfIrDPBsiSscu
	m6AdLdng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w538w-00000001gqG-3Zwk;
	Tue, 24 Mar 2026 14:54:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w538v-00000001gq4-0eGT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 14:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BA0B600AC;
	Tue, 24 Mar 2026 14:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4C6C19424;
	Tue, 24 Mar 2026 14:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774364044;
	bh=+H1RQt9nEFm1mW3pj/3FppU+zA1eZ4F6q95FB9cWR8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BkfiHLJM5s81UYxIuCAfaj1IksuK9rnIWP+LpacEP5uJVh/LQcoMMg4k7V64C46GZ
	 e1+7qX//DfTBR0TFWWC9mOorVx5VQw2OEhefk4mVdz9696oTL+g2WtqTy4dRO3ePvq
	 HBJAG83ZpjtWReeqtxy6LUX4scRHqpUmvIisjHVyCmnaDGcjVC5dkwZha1wMGvqZCH
	 FRdpRZKQfkXHtQAK54NIoaZv56uify9FuBiTwWEluViSRMEZjGVlYZ79H7NnappQsr
	 UuOBGM4yhYUbpxFvi4f0+Zlm/Rt3GIJ+F+drFxjglJfc1LSQyiRNe8FOWIiW08ncX/
	 6VPCHLIAyRTQQ==
Date: Tue, 24 Mar 2026 14:53:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Sascha Bischoff <Sascha.Bischoff@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
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
Message-ID: <ebd9ebb4-06ac-41a1-af16-664a4eedf3fd@sirena.org.uk>
References: <20260319154937.3619520-1-sascha.bischoff@arm.com>
 <20260319154937.3619520-13-sascha.bischoff@arm.com>
 <638a3453-91c9-4a76-8241-25d5c27ca518@sirena.org.uk>
 <86se9p472z.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sWsDtecpd5ZuVCN+"
Content-Disposition: inline
In-Reply-To: <86se9p472z.wl-maz@kernel.org>
X-Cookie: Forest fires cause Smokey Bears.
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


--sWsDtecpd5ZuVCN+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 24, 2026 at 02:48:04PM +0000, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > We're also seeing an issue with this in the aarch32_id_regs test:

...

> > which for some reason only manifests on TX2 of the platforms I've
> > seen.

> Is your TX2 the only machine you have that is AArch64 only at all ELs?

Yes, that should be the case.

--sWsDtecpd5ZuVCN+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnCpYUACgkQJNaLcl1U
h9Bm3Af/QFizHYbTB/ryz4KjPxz66HDJQLTRF4ZCv9unqS36DteUBrzH+P1u9Dvs
RER8M4hbwORq3ev4XgGsh3NhIsgs0aeENgRBkp++ZbluNEFIYRfyINyR9KeAi7ZW
HNqFEbnEdVJsaWin8pO+TjA0e5mmHxqiI8fvDYw48BT6y8Y+cmAmeNTmM1tIKSCy
c8L1YsatMZ9z0X/VZTLuUHTHAvkc0NrH0WnjrnThxcJ2SIb9EDtYATHYTsxYnfs5
1y18PWomKuZT4BTUwJs4PEfvVfj4iwEjHol/VjXaiwkE6OyhgiSVmHa/22aZZ8EU
CXwCEHYHNuWRI1Zm3xWCAdNv/SOrlg==
=Nq5T
-----END PGP SIGNATURE-----

--sWsDtecpd5ZuVCN+--

