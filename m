Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC4DC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZrePntlHVDK9rodlmxxLGUgDqQdmgMc0bpMFEHwxJ4=; b=HmQIcuHP/zeLWe1P0jvk+D28o0
	B/rO/QHMbPOnobQ3qrHHSukvmCFm4BIhbnsMrLAX+MoHimHqHfnizUWW878IhmhPECBXMJN3ItgDQ
	ipJymNW1/rQyUyvfkDCTL0JC2jlFlgw3InAD5Ll2AJ0URzcVPgfy1HvTGQtuFwQL4yY/QVnu5ByQK
	YwGaYfgyvgVW7B+lOLe4v9iYnRPH8F4uye8HW0QzTK6j6DupQq+hOHw0OtV1BlAu6rPuzNlB/d6re
	vorQnyrjv98sHQkYmh0k6qyCEl3aVw6wt3HLYLwvWW08Q4be5VF4Jk4fED3KwCUBJxZ6Vbewo97JR
	k+qSVCrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3alE-000000075tD-0FLv;
	Mon, 07 Sep 2026 14:55:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3alD-000000075t2-0fqu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 14:55:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A2BA60D86;
	Mon,  7 Sep 2026 14:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1881F00A3A;
	Mon,  7 Sep 2026 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788792950;
	bh=jZrePntlHVDK9rodlmxxLGUgDqQdmgMc0bpMFEHwxJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GeB0F78rB6Y8pThJerenvvl44gFR6MWAitakMRGR8hHx3fAJn/RYT1io+zjG+kLV7
	 QFLgkRNYf/Dolcv3sEpveUNbfVk9ubRQCaIVvZoV84Tekx87cV4Yt+/4sWLzmDKWRc
	 y/etunm7qrGurs7vSFyLpC8LzsavBs4ZRO+7f0A1hDGYSi07b/r0tfWr8Bss6++GQ+
	 7BazWC7NDYoxrKRO7e9pIFMXkQaLkwgLt4uGx0QIjTjWg345+vBehr+ksPLoOKiYNQ
	 FbE06SF1xNCqx7/3XznXY0zkmsNjxaC/pE8nvtxdOqJJbSSDCTqz7UCXDYCduKY57W
	 +VS1d0RYeYukQ==
Date: Mon, 7 Sep 2026 15:55:43 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leonardo Bras <leo.bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 03/14] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <1effee02-41f0-4680-9a6f-9b9f12459ec1@sirena.org.uk>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
 <20260901-arm64-gcs-v20-3-f31750bdfadb@kernel.org>
 <apmfx08vccSd2MXw@gremlin>
 <d2659ac3-2f00-4fc4-8f9e-0585691a4ba2@sirena.org.uk>
 <apqA_SuoA6-TyHsS@gremlin>
 <apszJZ17KUvd6BJ7@sirena.co.uk>
 <ap7GPxGs3nhT70sS@gremlin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ii74x8XOAcc6drmt"
Content-Disposition: inline
In-Reply-To: <ap7GPxGs3nhT70sS@gremlin>
X-Cookie: Who's on first?
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


--ii74x8XOAcc6drmt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2026 at 03:14:34PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Fri, Sep 04, 2026 at 10:07:49PM +0100, Mark Brown wrote:
> > On Fri, Sep 04, 2026 at 09:54:51AM +0100, Lorenzo Stoakes (ARM) wrote:

> > I think the best thing overall would be to leave the runtime paths as
> > they are and refuse to run with an architecturally invalid setup, that
> > would avoid bloating the fast path.

> Ack, it'd be nice to not have to worry about that.

> Presumably we definitely want an oops on a GCS violation in general?

Yes, the guest is going to want GCS exceptions delivering if they've
enabled them and something triggers them.  It might also be relying on
the GCS for stack traces even if nothing triggers any GCS related fault.

--ii74x8XOAcc6drmt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqe0G8ACgkQJNaLcl1U
h9AMhwf/ZEOA93+3vTR1PmXwHKzlv94Ja4BeBP/DlIKj2/RESX9cBT1C074Ii+JE
6SpAj8Gm8mWroTcAFXodksUYQmNAlviEbpV+wmiPn8mRO3HaIagbvAvGbiQYRVEP
mlcbLjt8qbCHmjiAkfL2JG2q4I7wvKhOHiQr3uRGaFuX+oAW8KRkesDw4ukC8GX8
NaxmBY8DL33LFkIQTCYlyqF68vFM55S+UD+SxrOPpswmpptwu8+WuKG4WLpkQk5S
EvjhRC2jwkT9746QCpt1Xyrilc05Xv1dkDTAa8GLHcfLwHwjkKivXcdXNFw8uLwV
9xLwVcyB8p0TztiucJK0FzKKU7/RzQ==
=KAik
-----END PGP SIGNATURE-----

--ii74x8XOAcc6drmt--

