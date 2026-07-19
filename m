Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CB5C44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 12:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dz6nstKPpdzr3m3YV5N5XtGEglEWs9DHWHKhwuF1feU=; b=Yb2ZyMKlTo+P1BLf/IZMmOl2lC
	EFPjihncD4zlqlGc5U3clYQWcGoLl5FO13lgMbmfFgtb0f4i4UlDJJ2OGuRNF09GfMVwhFyjBATQZ
	NAlbtePEvVdde8Jcg4TlfsziKf0nR00CzDMN0V5mvpj7Ho6kDixz8bjDS4NKAVOeQ4hj1bFZNIPw4
	ZLR6EwrzPR/ff+XFd5EebMk8gWlFkK8gEV4qgtnlvf4J1+tKxkq4qpS0xXC5TxPRgwlapMYw48sdR
	rdJ1TiFVO/Ck4jDMAMQWYDT6p/+OoxrrX0DHHWa5VXIRDIN2mW9Tgp/1eURtiH1wv+Q5BIxXHR4yJ
	OPJmt0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlR7G-000000050xB-2HGg;
	Sun, 19 Jul 2026 12:59:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlR7E-000000050x4-2Kkd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 12:59:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F154B40238;
	Sun, 19 Jul 2026 12:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBBB1F000E9;
	Sun, 19 Jul 2026 12:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784465971;
	bh=dz6nstKPpdzr3m3YV5N5XtGEglEWs9DHWHKhwuF1feU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RMvdkFlpGDTGUknV5qMv7bvE17VSPmAKTlGBUF0dGAFTJIm5YEMiHRqDBCQodxSTY
	 Ge9fz3IG2p0LxJTSK4uvO9VLO6lxN9I70ZNr31wO8qXETMT7OK6O8mjwj7gxC5H5Aa
	 ewZJvnjGNPAZL9onmVrfy8cENJCMslHIdl+eM6QVFGhkQSwKCyZSTlY25S4ltfuh0P
	 Kv+mAVZazCnspK3pbXmA3iCAqR8+wEd0HAJlUkfnPPYL3D6hA8HBRc0oR91uWmdD+Q
	 n2D0/dLV9W+Ualim3Ug8bC9mPBH3yO+XeTq+BG9fS7qDxo6NwPxPQ+6bf2ob3AI5YZ
	 FHoaByhPLJAMQ==
Date: Sun, 19 Jul 2026 13:59:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 02/29] arm64/fpsimd: Update FA64 and ZT0 enables when
 loading SME state
Message-ID: <df08b81a-13b6-4273-88e7-0627063d4e9c@sirena.org.uk>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
 <20260709-kvm-arm64-sme-v12-2-d0301d79ef58@kernel.org>
 <ali39DG6qie7XTuD@J2N7QTR9R3.cambridge.arm.com>
 <15a9ae14-395d-472a-a5be-9e46524fb493@sirena.org.uk>
 <3c76650f-ddda-47ae-a676-86016d8e39a6@sirena.org.uk>
 <CA+EHjTw9rGvQyev-4i7zkO5bPPZKGYn858485dCs8iHmCi0t3w@mail.gmail.com>
 <43f21c65-c5ba-44a3-9741-548390df369b@sirena.org.uk>
 <87a4rnqsuu.wl-maz@kernel.org>
 <18229974-b26d-4eed-82f7-7af7e1c26634@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cL9XJNQtGuI5OnYK"
Content-Disposition: inline
In-Reply-To: <18229974-b26d-4eed-82f7-7af7e1c26634@sirena.org.uk>
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


--cL9XJNQtGuI5OnYK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 19, 2026 at 01:40:28PM +0100, Mark Brown wrote:
> On Sun, Jul 19, 2026 at 09:35:53AM +0100, Marc Zyngier wrote:

> > So leave this is a straight ISB, no optimisation. Once you come back
> > with actual data showing that this is a terrible bottleneck affecting
> > real workloads on real HW, we'll look at it. But until then, please
> > keep it as stupid as possible.

> I've already left the KVM hypervisor code like that - I only updated the
> code here in the main kernel since that keeps the end effect for
> existing systems and workloads the same.  I am aware that there has been
> a great deal of attention paid to the barriers we have in the context
> switch path so I am concerned that other people might have a different
> view on adding one.

It does also look odd do a conditional update of SMCR_EL1 and then
unconditionally add a barrier after it, even if the conditional
update suppressed the write.

--cL9XJNQtGuI5OnYK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpcyiwACgkQJNaLcl1U
h9BpXwf+JYCe7VHaj7TfzZjCVUNf+N0uc2PbXDf9kiTps6TxEHMS/Lt7w8P5oqs3
RDVLBZIPc43UyiYr27EH+NxHBS/jOGSdzNHCjkN4TN6hg+IEE08yL7RbnSH85hzX
+iXiGHYKj6uzU0VxOCmw48BLoe1wkh4iToQT+ffGDaAd1yxraMDKWk1gom8j6Eaa
Br6L+q2EfnbvuqtpZWEQ1WPGuRrcrcnTyrkEz2eQbNNAyMD1boHr9LHNeCRFoJSn
2nDxtRYj6T2Vocmt59QX4JajZwM9fbfsZOR5NszhGW7Tm1EqgxbVg439ieY+ryMw
AXrrkxhculDDRGWss27Ds2c+Cu+6ww==
=CtjM
-----END PGP SIGNATURE-----

--cL9XJNQtGuI5OnYK--

