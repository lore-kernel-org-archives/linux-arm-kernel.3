Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1745C44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOvOB8pIvE3bMR4eqh6BMH0CqqAl676IHewqOrjLT8M=; b=3GwuKaHsE02xUX2cx1TfrcxXmd
	d+uEBHcQixvYcdwu5oY7D1VSCHQaigZ3Sku+tI5b7/MEd0E3PGrqwdY82z8fWlKyEodzx68xtL+QL
	vVJRhM3+7knj3BxTG1EGnCJ+xbojBX9NpjISnfKhv2NrWmjpGEGaErSPgnQKnX8nMojXdXCc7a8RM
	PC6L0hsqObh5BXygTQ6qo+cg2yIRGYhx8jGEubcvZxUdQyqwCxK9eBDoxne56C1Lm9Fnnoc+jrx2D
	b5Q74dQy1kk+qOFG56eHPDkVWuIZunrcD6TWyZsHJ9A+hc78WiEyCGYJaoljQ6hjcj6jkVTAaZqEw
	AVI+9zJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlQoo-00000004zwX-05zQ;
	Sun, 19 Jul 2026 12:40:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlQom-00000004zwG-469C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 12:40:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A25640618;
	Sun, 19 Jul 2026 12:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5611F000E9;
	Sun, 19 Jul 2026 12:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784464828;
	bh=YOvOB8pIvE3bMR4eqh6BMH0CqqAl676IHewqOrjLT8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JQ6dzc9QYPamUTpUaOaGouWGchnGCu20cdv0d+AyLEkXf3ewVclThnMK0IZuBjccO
	 LuJqE3WfClBs9/2lkIvk/lIVONDGui/UjZcgbW1hvO1onjvJYgLAM0Up4bvIImtuP4
	 LID8WR17HyqbW7r15tlenPh0Uz/lyzeC2KnUUmessRhDB3kHnDtFv2HeeBkpu6WSgz
	 mdfFHC+EbeCbi9vAnFMWeLtCxW6kVCVKUsDerkcC5T8y9tS9jI2AQsMrCSyjpw2pxm
	 lJZ7LhM9YJiuLpO2At8IOi2N8UQGILSqTodkl+LFDoBEwkmy9+Sv9OogHxghMr3UVg
	 7RaAu0g0tN8BQ==
Date: Sun, 19 Jul 2026 13:40:21 +0100
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
Message-ID: <18229974-b26d-4eed-82f7-7af7e1c26634@sirena.org.uk>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
 <20260709-kvm-arm64-sme-v12-2-d0301d79ef58@kernel.org>
 <ali39DG6qie7XTuD@J2N7QTR9R3.cambridge.arm.com>
 <15a9ae14-395d-472a-a5be-9e46524fb493@sirena.org.uk>
 <3c76650f-ddda-47ae-a676-86016d8e39a6@sirena.org.uk>
 <CA+EHjTw9rGvQyev-4i7zkO5bPPZKGYn858485dCs8iHmCi0t3w@mail.gmail.com>
 <43f21c65-c5ba-44a3-9741-548390df369b@sirena.org.uk>
 <87a4rnqsuu.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OIicqM3g5+ivtiDy"
Content-Disposition: inline
In-Reply-To: <87a4rnqsuu.wl-maz@kernel.org>
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


--OIicqM3g5+ivtiDy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 19, 2026 at 09:35:53AM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > I've gone and implemented the first which will suppress the isb() for
> > current host kernel SME usage, the second two are starting to get more
> > fiddly than seems sensible to do right now.

> I really wish you didn't optimise anything at all at this stage.

> "Optimisation" is exactly what got us into so much trouble over the
> past two years, and I really don't want SME in KVM to follow the same
> trajectory.

> So leave this is a straight ISB, no optimisation. Once you come back
> with actual data showing that this is a terrible bottleneck affecting
> real workloads on real HW, we'll look at it. But until then, please
> keep it as stupid as possible.

I've already left the KVM hypervisor code like that - I only updated the
code here in the main kernel since that keeps the end effect for
existing systems and workloads the same.  I am aware that there has been
a great deal of attention paid to the barriers we have in the context
switch path so I am concerned that other people might have a different
view on adding one.

--OIicqM3g5+ivtiDy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpcxbQACgkQJNaLcl1U
h9DuzAf7BxGM4X6minFYapCsREk9SxuGWXgUZbzaq6n4+zLM/myAGA2hw1BwzRdB
Qv2Iin/BHgelt7fpfJUK+OKlWIfzdPFnUtSytVdER5XMXnEPmwx2bw45YMuwxB4O
anFUbDn7Q013adk1AEy/WAfmNNBooAzV0VB9OmKPqGvyZx92907MoOk8QzMDY40+
Hy0AXBkhXOwXq+MinOQlq+PA40qXfCk1cawPFrmDzWeiDZkDvcAHnS83+nX3v7Hw
izYjvCfY9adu+r7owVAKcP2FVWeoMJ0TFh48efIZmck4HsJmqtiekbGkyXr3Eq60
+Rl8dz5E1e1gxRadq/4qNcvgKUeCkg==
=354Q
-----END PGP SIGNATURE-----

--OIicqM3g5+ivtiDy--

