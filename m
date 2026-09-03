Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E020BC624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 20:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBZx/5TmNAnkduMjh1UcTzxesGmjDXOANosYgLsKvPE=; b=KBqfO2+GyOQ6RmGjopDRaliDcm
	oAMPA0eO5SDNR7FSeDa1QI4TboQzlxe4px0W87JtfCNkyinLoeFekdOOY4MaseG0x4O4vT7vSudPW
	PUhE6E33A0RWNf0IQG3A9OeXzaQGw/ondTSyYcZqlK7VJftsOqYqYGdKEbO4CyijGMm4kZ4hgAqEu
	oX2sA6l0G1tBS3bccDFIIimlGY+MCf5VHwLeaO5rkaooDdhQVcW5n1RlY6M6osYUd1jQo2tksLksX
	pQ1hnn1+dQxr/uT0qm/3lKlKbLkIFDpq9Sbkd+66jA1BzL5JN+seaPml2a8mtyyw6Yiwl8lLpi7q3
	iXKAKK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EQK-00000000aMZ-0J6H;
	Thu, 03 Sep 2026 20:52:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EQJ-00000000aMF-0RJX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 20:52:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EEE2F60A65;
	Thu,  3 Sep 2026 20:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9368D1F000E9;
	Thu,  3 Sep 2026 20:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788468757;
	bh=dBZx/5TmNAnkduMjh1UcTzxesGmjDXOANosYgLsKvPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nB/FEiJqkpHK1N3H92xfIy700HdmhJUQKLxIYwEYMsszR5vSt4VYdsw283/uEjlOg
	 RTv7cHY6OVkv1E/I/hf8ZQ/WDjjxLeTxEpu7PAcrB2WOkzpmUajGI33wy/Q08GJQmL
	 /zcUauYC5EuCNt0HJdxvSvNx5GnYU1G3wqzvOIgrW2v3Oe7B0qJ0hBAW0zFD8oSSDQ
	 MjTgNA+bEhfZclKvbpGERr2SzNiLvYBMPu/kJ5yib7YvBRwj46yoDCHpE1JSU8Uy3T
	 oEfQLqJkf+QG0mLj39lUhTXqe5TTJXK0uUtxkBzjih0oVJ0MLdaRpIkT0JdBRy8YKI
	 R0LlOPg/B0INQ==
Date: Thu, 3 Sep 2026 21:52:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 03/14] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <06c7edc2-d000-4fd6-9568-a692f61dbf90@sirena.org.uk>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
 <20260901-arm64-gcs-v20-3-f31750bdfadb@kernel.org>
 <aphSYqKrgUq5Qycu@LeoBrasDK>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R4LfhzhDcG0c3nsQ"
Content-Disposition: inline
In-Reply-To: <aphSYqKrgUq5Qycu@LeoBrasDK>
X-Cookie: One picture is worth 128K words.
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


--R4LfhzhDcG0c3nsQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2026 at 05:44:18PM +0100, Leonardo Bras wrote:

> Reading this patch, it feels like it should have been two different=20
> patches: one for adding the registers to kvm infra, and the other for=20
> loading/saving it in the code (with GCSEn). If you later decide to split=
=20
> it, feel free to add my R-b in both of them.

This seems to be a fairly standard idiom for KVM feature serieses, and
there is a competing series length concern.

--R4LfhzhDcG0c3nsQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqZ3g8ACgkQJNaLcl1U
h9Dm3gf/dktFZyCaPM2JTPMAToRowclYvGxtdCMiMDHpBMNRouJADsGcjPKIE/JV
eKzl4K6qmaVS3h9+/KQfh8n8rkk6cLBzTrsCw+Jt0UCmA3fzcfgfaDHKN5modVGC
rc7lOxVAzXAEQeJLBi/lzY9o04K5eBxOEiT0vFUu4KODs83al43Jsj4CP7T3QvBd
YPGgF7WREduHPBGd+2KJXoAUEv6gJEfz6yuqjM6NNOEhKUEqv2evqJz+HU3qpYEc
oOiyx1YggFsHUhcpB6XvxmGQMVrdPMbbIyECF/gbRSpJW+xI2yiNHeMpvJuMuPH6
ET5clDzcTa27EQCPCmaGCkRM3SEM+w==
=bULZ
-----END PGP SIGNATURE-----

--R4LfhzhDcG0c3nsQ--

