Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288EDC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MnOCOoccYNN9liJj+oDsXMNgtsf8zUHVcY4BoPfYKI=; b=vhm4ZeRjLeOKSnuMkhrzrCxNsL
	SEc8y4V8fHWvyM9cFybdkiyMnzqBHnZ2o8DcIGVhHeu13s8Ha6jmKxegv1NaXtURLU34nzraZuMe2
	gmKCFmjWFEPOs72BPPGDVvVUkcEDerVj0+lClGor/0O0lCCjrKePzNPDxcseCvrteqvxFExFa53gv
	ipp9paP9SqPCl6odg3bYD7WDoAGBYVtbFjqpRTe8F8cnrTld3xOPrmZxCgqsF1GMdPu6d5n8ahXao
	Qzvngn3kfyo6VV0a44g1OKgUCWPuGGXGmFYp9zBynGuwKIPRMjqHr1EAa+M5qVQWXI0cEVlbW9p5O
	nhpqnXBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UMz-00000002Hyw-2MPE;
	Fri, 04 Sep 2026 13:54:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UMy-00000002Hxm-0Vv2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:54:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A7AEB437CB;
	Fri,  4 Sep 2026 13:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5C51F00A3D;
	Fri,  4 Sep 2026 13:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788530055;
	bh=7MnOCOoccYNN9liJj+oDsXMNgtsf8zUHVcY4BoPfYKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mm9Z5z9yzbdEbPnHuhM4YdBzxDvSpMOpAViKv7ZilL88h+7bYAlw9C2LataeP+rsV
	 wEs5o9UpuY7q5lW0EkKcQ+SxXMDaW+E6LDbsLxQytYjCWJpi05nTq5lj4zIYT43DmV
	 iZImGxwyJYChrCuuccYOBMF0VAx5UtC9ynNXwraE0mvYuk12nWEgwUIDIPBhnFCT1S
	 re9GeK3EomXHmqMWg0lXfuHuxTA9Jrkl9bFlbt4wF9FrRp0ivEiuwo61krFVbDsCs5
	 koHpAkAC0WsBoW4xVE3VaPjCbuKpPIYJzhK1/lKI7ZmkNjbh9xIdgYiE3oAi93sXmy
	 2fj9OvzyRVePg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id CD82FD8C0E3; Fri, 04 Sep 2026 14:53:27 +0100 (BST)
Date: Fri, 4 Sep 2026 14:53:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Enable S1PIE for nVHE and hVHE
Message-ID: <aprNV2HLQL9ByIcy@sirena.org.uk>
References: <20260904-kvm-arm64-nvhe-pie-v1-0-29d59f245e6c@kernel.org>
 <20260904-kvm-arm64-nvhe-pie-v1-2-29d59f245e6c@kernel.org>
 <86pkyt4gvt.wl-maz@kernel.org>
 <eb788ad5-5bb3-4767-87b8-d35d9e3ab220@sirena.org.uk>
 <apqrky27mJmUV9UA@willie-the-truck>
 <05f1e2f4-173a-4226-8c98-1452c20f0a47@sirena.org.uk>
 <87y0dh40bv.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="21/OxgG6ehADjl2k"
Content-Disposition: inline
In-Reply-To: <87y0dh40bv.wl-maz@kernel.org>
X-Cookie: Orders subject to approval.
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


--21/OxgG6ehADjl2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 02:23:32PM +0100, Marc Zyngier wrote:

> KVM with E2H==0 has reached its architectural peak years ago. We're
> not adding anything to it anymore, and all new architectural bits
> require running with E2H==1.

OK, so you're OK with a hVHE only version of this then?

--21/OxgG6ehADjl2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqazVIACgkQJNaLcl1U
h9Biugf/eVNsyfMbo8kEv74/T0H2F1alqOYWFZhkSjSESmjQpgaVM6aBPxcpl5Vr
ISD4qEFjzVB6IkpZHkDHuI15y/5Psk/27dIuT8iU3yz0eMWv5nQkVDFSwVgj4x4i
GCpIKfx+VcMogifojtAxoKlXjIBYgjYGryM9LooxH4/Xea/J7dpEyMge+HDQhVtp
kJOy7mhpTdu9y+UFEj6g2PN5zSXJHzMbsWWcnbqF+Lp8O6m8NC1Z++4S7cLUaygF
tlW/Umd4bqA/1Rq3d4gTFoaHhhHs2Bnr+02vJ1dOBGW+8C0uK92MtFvEyUrritWu
qsHkzSB/NQQHri54914dhFyB3B+4kA==
=u0ZY
-----END PGP SIGNATURE-----

--21/OxgG6ehADjl2k--

