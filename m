Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBED5FEC0ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 18:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ypStTJ7CiAGmDRziRUG/EYQwZPTjlxVm5e6SeBw5M8=; b=x1/xw3zZ7mAiDtYkwp2noJtPz4
	pFlbyZwSWUHY+2T5FM+dSPe5QOuuZZ1e+fv66JNPLJvs7mtUJBL5rtGeEp0WsX46VojwqZNWU7j0b
	94KmxN6z/jFi/CtW/dVxkqkaupm6Y4+bOIA5xtjQSs9oaR7PbEE4HmmKiqAIez5yxyOLoSXCRlbFv
	VTC5se5RbY+5v9L+QOPSxXFyFrUgmEsSLD5T+oIZ140dTiJerTZS39GQf174kfKW9Rc2mBL/Qs/EW
	piFmoyiIpM1t9P4lDllYTOFzGwGNWdy1eqJCJlkIm46PhcUbg8HkcZiDnw6MMc/FEoeyVg7Fztm/D
	8tdfkIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56Iq-000000022jk-23RC;
	Tue, 24 Mar 2026 18:16:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56Ip-000000022jZ-0ORx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 18:16:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 224DA600AC;
	Tue, 24 Mar 2026 18:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4209FC2BC87;
	Tue, 24 Mar 2026 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774376189;
	bh=/ypStTJ7CiAGmDRziRUG/EYQwZPTjlxVm5e6SeBw5M8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tbqXfTDdnLGmbaxrDp1vSCXsAKADjs+oRPf/RyU4V8803jSuLAGriWNCpc2ejpyIY
	 LjkahALqhZOvS14r4BPdBpNasv2znuWoA0xyslMOhThP8DmKScpf2+bxpQ5p/K+JZq
	 ysmETT0UKUMHpJj0nMBOnQTIbHx5kGVn1mNVCNMU/KoPw8TCEfU98ga3GZvsiHlkNR
	 h9A8tTzpn87Bv3eqalAkyQCy0wrWCW38nYwvEv3L0y6pF2sMt3rO7Ym8DrgXbBYvXt
	 Gk9R5v2tYcRiqEoXnEDxsxc0P+CZLQ/bzffeAa/yLvM320CnkKoMjJLr3z+MAfL054
	 L7+sd4W/j+ovw==
Date: Tue, 24 Mar 2026 18:16:23 +0000
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
Message-ID: <b3f9e10d-75f6-4da9-858c-3f85d2d7db57@sirena.org.uk>
References: <20260319154937.3619520-1-sascha.bischoff@arm.com>
 <20260319154937.3619520-13-sascha.bischoff@arm.com>
 <638a3453-91c9-4a76-8241-25d5c27ca518@sirena.org.uk>
 <86se9p472z.wl-maz@kernel.org>
 <ebd9ebb4-06ac-41a1-af16-664a4eedf3fd@sirena.org.uk>
 <86qzp945d1.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GbtyFO5MUSHSk1Kb"
Content-Disposition: inline
In-Reply-To: <86qzp945d1.wl-maz@kernel.org>
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


--GbtyFO5MUSHSk1Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 24, 2026 at 03:25:14PM +0000, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > > Is your TX2 the only machine you have that is AArch64 only at all ELs?

> > Yes, that should be the case.

> The hack below fixes it on my favourite Qualcomm box.

Confirmed on TX2:

Tested-by: Mark Brown <broonie@kernel.org>

--GbtyFO5MUSHSk1Kb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnC1PYACgkQJNaLcl1U
h9BYzgf+LFxJQeWg+73NmCmRJGV5mrNVAhnE6ndhSgdZo7SUugOdDP+kU1SyiQEl
PTmurB4rqTx512siq0ZuVjIeLhpVEEbBfMN+P7dASp5lswwGKACS5bursUDkXOpk
Ekn64HC1i6qb0dXH1sKM31khPXtc+j+HZUHpYJqkxCCzAPqGtFYhs9h9z+nqIsQD
73KAjEEunUGxVqecRCqTbtrh1iYHdQuNURbdidA+alFGXFJLlnVN7n1PRO3wJhnj
BYsqhwJExjwN2sd/84ucRtHSwF2If3xiwqcPLPBi7liYlcvWBApEQ5jyBlP8hdLk
IFoTX2g5bU15Cnql1zjDJGKfiM1NNg==
=A7dD
-----END PGP SIGNATURE-----

--GbtyFO5MUSHSk1Kb--

