Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2464ECD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 00:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wPNvfsFNOnOsNMxXlTV245nONsZ9h4j0XOxl9tMZk8=; b=Ywc5gzGnbiG8pZFhcq66r4Kp/h
	bwBN9lI5Ob4AcDnUH9S2FET0axJ97bnHW0mGzFQBy3zPgn4dyyYsRwyy/1ZXUQOCZkJwgj8xv/h0n
	Z9qermiT5P70Z2iP4/wCUfgBR1BbtXjvTi/Gx2XVvAnvLOLxYOezr1kqOAoDD38dqn/uYkfuQC3pR
	CItH2wAkaEWsrkqQ5VY4PBBXLBoOrwuilZ10DEa0cITyhWfu99/7G55AXoq+ohmkC05RhngJZ8twJ
	jvjOVq5P/etnTEEsikJxxbvIMN0s44XuC2fc4nfvQSxrc7tOUxZM8bXilGygPZ1MQBtIY/+81+HG/
	5yRXfqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLVmm-00000007qGv-3FJL;
	Sat, 09 May 2026 00:43:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLVml-00000007qGb-10CD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 00:43:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E5BE6024D;
	Sat,  9 May 2026 00:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACB7C2BCB0;
	Sat,  9 May 2026 00:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778287393;
	bh=HPCGeWyV6//s0b3Spt2whRmbIin4/wMGdnJC6EtPgXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZjWqzNitIkSeOGo4WRNu/w9z+vgSqlbADIoSx7PDzKzecBFtpDT2JcKd0ksqbgls
	 R6pqVA1CpIsVuP03HMl5zgg5fNJvr6rS8ikj2NjCc7F6WB0gSuWuBBYNPoNMvc7y8n
	 yQhW9MYU56QproObHId9FHbepRnbHAmG99n6XgIwaPf24u3XrjOPJYHmeJXYZ0z9tK
	 sEuFzD2xU+WR6i+be+TkWG14VpejDBfjXZnbv09SGEt658yidXez3la3b5tpJU8M5W
	 TKAnGN0i9Q9K1M59XsqQFCsQytfyLxBf0CCgYBwOH306Vr9PN7iALYf6CG8VHmT+SV
	 PKnA0Qm574Wrg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5B9BE1AC5896; Sat, 09 May 2026 01:43:11 +0100 (BST)
Date: Sat, 9 May 2026 09:43:11 +0900
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 01/30] arm64/sysreg: Update SMIDR_EL1 to DDI0601
 2025-06
Message-ID: <af6DH_j7pyEm4HyI@sirena.co.uk>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-1-43f7683a0fb7@kernel.org>
 <af4ZYVFsbYlEfdOu@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QBKsP9LRgF0qgj1C"
Content-Disposition: inline
In-Reply-To: <af4ZYVFsbYlEfdOu@J2N7QTR9R3>
X-Cookie: Truckers welcome.
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


--QBKsP9LRgF0qgj1C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 08, 2026 at 06:12:01PM +0100, Mark Rutland wrote:
> On Fri, Mar 06, 2026 at 05:00:53PM +0000, Mark Brown wrote:

> > Update the definition of SMIDR_EL1 in the sysreg definition to reflect the
> > information in DD0601 2025-06. This includes somewhat more generic ways of
> > describing the sharing of SMCUs, more information on supported priorities
> > and provides additional resolution for describing affinity groups.

> FWIW, these are all in ARM DDI 0487 M.b:

>   https://developer.arm.com/documentation/ddi0487/mb/

> Is anything later in the series going to depend on these fields, or
> would everything behave correctly with the existing RES0 field
> definitions?

We're exposing the affinity fields so there's a build time issue.

> > +Field	55:52	HIP

> Reading the ARM ARM, HIP is arguably a backwards-incompatible change.

Yes, I belive people are aware.

> Do we expect to expose that to VMs, or just hide priorities entirely? I
> suspect we probably want to require that the guest sees
> SMIDR_EL1.SMPS==0, and not care about any of that.

Currently we're not exposing priority support to guests so we don't need
to worry about it yet.

--QBKsP9LRgF0qgj1C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn+gx4ACgkQJNaLcl1U
h9DG9wf/atoXOD+Q4rBXZr/5pU35q0IY0RT80qYAD286LVTpuZzb4OEYmgficcC1
5YV6dn24FMPHx6UaFRfPwUwmpCcaBuO178qwscXpiqYpstrydR+RidVwPsZQOkcg
8Ywr4fiHu1gGJhcQnPiWsdBn1BUexLlPUTrQh6vImj72qKbY90oFWWOwNHsozRVi
FCSgFQIAu+fadSMVPalMQ6oLvMAPgDOR1Ftf2tXqsT/mq1R4o8OVodUhvEDUPzAp
XP1i04j7KwajjAa2KCzkFkQAP2s1fEtoA5TAIdsuZysuE0S7tCjG+/u8owxMM/cC
nO2dCJ6SojWEo41t+pH9V5nD+k0P4w==
=0S3n
-----END PGP SIGNATURE-----

--QBKsP9LRgF0qgj1C--

