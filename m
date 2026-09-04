Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E0BC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 21:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLLN6D/aLaiSZCc6VRO4G+fmb2F/w3i1SeqpgrJDHo4=; b=i+iI3vohR2guG4czzluuf+759p
	J4z4oNuppeO+6GDNvUWbddB0bvpvtuQBktk99iIQtsU+STzRXBmT0JCfU1yZqkyV29k0hsggSga1h
	seQ0HhbqRWikUyvUnyJ2FHZscoRY54l/d7jsnjTto/Kks1Ac0JZZ0PWiHhNDe5+8W1CvycDILoT0c
	Ls+NuD7oaVATFVCJRV+UcGhr2xrpw6oNVLUBfnJMjDDHjCytSdOYM8H8VrhDfMhy4P1tzWXXMe0mN
	QeL1Hvf5lmfYT8OJQA3K+O70xskXCmM92w7UoHKghs4jMjga8PM62IWFcrQ7fslR4Uribcc7h4RKY
	8V66WW2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bu0-00000003MMO-1U5y;
	Fri, 04 Sep 2026 21:56:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2btz-00000003MM9-0KMp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 21:56:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0BD740AF6;
	Fri,  4 Sep 2026 21:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2201F00A3D;
	Fri,  4 Sep 2026 21:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788559010;
	bh=WLLN6D/aLaiSZCc6VRO4G+fmb2F/w3i1SeqpgrJDHo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RbHCANIivrUJeL+oLXqYTr+R4r3BsqdM4cQvevCYwT6Dx7hhRQHEHuxPhEGrzY8Dc
	 93YNYH2AahXbS2hroX7eS4yqeIyySc5cq+STIsNypvImYjwxw+dGXsELvtimyuL3sf
	 MGiGdlE1MZPDGo129o2qeReweS2riv51lC9YBXs/xgw1lRrAdMTMYheHdKdtPLwtCi
	 DE0DNyXJJBHHOeuBboM7SwnWn9AS+YeWeqvy+b+zppTFa/pbyK6mIu+qp5r/5LUq0e
	 WH9h7w+zBBOfDbeaMJbvDG31qh4E1s4THHW8iZgBuey2+RCgsZeZfaFEDtWExZbzdz
	 3zz/va3OKRI+A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 44EAA1AC52F1; Fri, 04 Sep 2026 22:56:48 +0100 (BST)
Date: Fri, 4 Sep 2026 22:56:48 +0100
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
Subject: Re: [PATCH v20 06/14] KVM: arm64: Validate GCS exception lock when
 emulating ERET
Message-ID: <aps-oNeG3RjzqHQs@sirena.co.uk>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
 <20260901-arm64-gcs-v20-6-f31750bdfadb@kernel.org>
 <apmUQETDlhTIuJIY@LeoBrasDK>
 <2dfd8a6c-42c2-466c-b3d6-2313466fc3d5@sirena.org.uk>
 <aprEsh-xogu8zFnK@LeoBrasDK>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TZSwDlEzCnBqnKB1"
Content-Disposition: inline
In-Reply-To: <aprEsh-xogu8zFnK@LeoBrasDK>
X-Cookie: My vaseline is RUNNING...
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


--TZSwDlEzCnBqnKB1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2026 at 02:16:34PM +0100, Leonardo Bras wrote:
> On Thu, Sep 03, 2026 at 08:22:44PM +0100, Mark Brown wrote:
> > On Thu, Sep 03, 2026 at 04:37:37PM +0100, Leonardo Bras wrote:

> > > > +	if (kvm_check_illegal_exlock_return(vcpu, spsr))
> > > > +		return false;

> > > >  	/* If ERETAx fails, take the slow path */
> > > >  	if (esr_iss_is_eretax(esr)) {
> > > >  		if (!(vcpu_has_ptrauth(vcpu) && kvm_auth_eretax(vcpu, &elr)))

=2E..

> > We need this because ERETs from vEL2 are handled in software, modulo the
> > NV3 fast path mentioned at the top of the function.

> Oh, and this is done in __fixup_guest_exit() because vEL2 is not a=20
> nested guest. It would be it's guests' exit that would be dealt in=20
> fixup_nv_guest_exit().

> Is this correct?

Well, it's as much because that is the point where we handle the EC
specifics.  __fixup_guest_exit() does general handling of guest exits
that applies to all ECs and then dispatches to an EC specific handler,
it is common code with nVHE.  When we have NV then fixup_nv_guest_exit()
is run beforehand to do extra handling that applies to all ECs in the NV
case, but any EC specifics for NV still go in the relevant EC specific
handler.

--TZSwDlEzCnBqnKB1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqbPp8ACgkQJNaLcl1U
h9DFBwf8D5V/G8mDF5LtW3QQNUxhO8RJk17+tPVKa2yUGPdsVLrSA7bw5X/vbgDg
WS485cIPTSH/+3VE9pa/EbV3gQps9QWT4FUIyMNEPS1Uk4M1VYYzRnXUd8vN7E7n
9ZSEkjKz+O1MXm198k5LeY3vrLTDSH2ACHa+cIkp1Mf0eqV5cahEjEZYw0A0HL22
5hYMKI69FWMHCU/Xu+KaNRuLmqA76LyzFWNCXAAuI9E4gM3Y4DVzmj0fwcAADwwP
RRcvCAIazVSryyiTq2LnpE42nRWNAbTM6AUbwWEnvsrs01HU3YABGNkKZW04ilMu
LMPVCobegoaSeXNobAfZsKW92a3nSA==
=kVDG
-----END PGP SIGNATURE-----

--TZSwDlEzCnBqnKB1--

