Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FC8CD98D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4o0ryZTMkuy62CEXa12XiKN4UsmvuV0qmwiIssY1rc=; b=R/Js2DFmItUZ0LCG+xtZDKxFUp
	eWmgLWwhsR2djf+CuKjFvr09/zItA7+wFAP9BelbB8PQFJc3ZofROauz0OXuZOBNmoqKVouHd4IX0
	YztHy+guRLV99OSVHNT7RhLQFibSP+LYeaJp3I8lF/+pkGWsf7oV2q4tSxsjNruqps5AZS6ur/jsM
	abvl4MA7TtYObGWmx8kzMRmqjYBwm5BWGPwGXFugcgneyPt5zkX88Z3DAD5TOu3BB29zmFSnXcxcA
	qPqfWIf5n6o4j15MZ/NJN58HU03XRJJbEoXZVi9lSN8zciqNTpqn2Huk3t3jeGgf/VAsGSPBEOvyk
	PC6n7zSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJceW-0000000AyP3-1dC9;
	Thu, 13 Nov 2025 19:06:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJceU-0000000AyOm-3ALH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 19:06:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D108E60225;
	Thu, 13 Nov 2025 19:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB13C19421;
	Thu, 13 Nov 2025 19:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763060797;
	bh=c4o0ryZTMkuy62CEXa12XiKN4UsmvuV0qmwiIssY1rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FBF1FrJsur20m/Sikm1MD0deGRjb2V1j7lLOlUSAewPjJ91BsoD2M1dS392jnYW22
	 tpB8BSWlGdYSTpz3aleB9TbWGT4BXJFvy9iZ5KRcqX9/nf+xEYtpZ+X0T+jr/WuVEq
	 ScEGsNK9XKfCkXjK15/58K3vufm+oGxVlWGmUVuTK9KacRCyHD+O/Q7DBf3z3Hi0wM
	 4VG7cQIAlgOXgKAn3wHvfZLqWKbGeUCA1u+gNwn2EdiDt71J8ujBOt6BzsUhK7py92
	 Y3UJgmmunkGGlOrNy95Qt6B9lZc7XVO1cNKDZW++wySH8oL/iB6xr3gj7402pCa3Ir
	 c/V8fuAVoBcvA==
Date: Thu, 13 Nov 2025 19:06:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v2 05/45] KVM: arm64: GICv3: Detect and work around the
 lack of ICV_DIR_EL1 trapping
Message-ID: <7ea5c49d-b093-475e-9f27-ad92dcc4b560@sirena.org.uk>
References: <20251109171619.1507205-1-maz@kernel.org>
 <20251109171619.1507205-6-maz@kernel.org>
 <7ae5874e-366f-4abd-9142-ffbe21fed3a8@sirena.org.uk>
 <86ikfdu7cu.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IqwhI93WVr97nscY"
Content-Disposition: inline
In-Reply-To: <86ikfdu7cu.wl-maz@kernel.org>
X-Cookie: An idle mind is worth two in the bush.
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


--IqwhI93WVr97nscY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 13, 2025 at 06:15:29PM +0000, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > The arch_timer case bisects to this patch in -next, regular nVHE mode
> > runs this test happily.

> My hunch is that we're missing something like the hack below, but I
> haven't tried it yet.

> I'll probably get to it tomorrow.

That still fails FWIW.

--IqwhI93WVr97nscY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkWLDcACgkQJNaLcl1U
h9CHwAf/T+DZlAAEflS6H6jO+BA36LhxPkjMUd+GbOOat4+PEXU0sJf3AtFWB2WK
aIQlFqC7YpzBL7UxoqajhZzrGK26TZFr3hyuVCL9wo5gRhqSPbH2JVTyqQ6I5rrE
gF9vdJdeWmLYVdEOj+UAtnFwNqqZdm3hiSZaAANBxcr1C6C9u7OUlZhxlKMYGUkf
PzQpwZzBudtqiRHCo2uRLEeNQffLLhO/MmQJeLo1r/BGAf9LHNLZ/Jj+YpUkyjHp
zuUYITl4AfLiyyzcuLSi0CzEawlU6OLLHf+cdaryobUa+DzIIsXzcYr2orVum7Xl
6Mkc3eWj3QdABeeu4lRGQ7fTyD7b8g==
=Moc7
-----END PGP SIGNATURE-----

--IqwhI93WVr97nscY--

