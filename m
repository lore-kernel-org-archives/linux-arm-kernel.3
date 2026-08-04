Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6E0C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 18:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsrewjxSSyqLQoF56zKc/HGwK9yvsx9HfDzcpzwEwNc=; b=orSWp4VqeMQ54YTtbxzM/GBFgD
	GKB4GRfiCmyNb9n0Bpu8bkUJNIKHH2foZYdDoJgPF4W8rEtBIsUuh+9dEzG2eq5bygNYL36yTN4va
	vn9OXa8QpehxgLryB+PzWKmv6a8OYsW6PR0jB1++C3lu+WFlBc4B/ZX2iFlZnKuXYx1j1TElWIeFE
	rp34sRAL5FDSpfjJudUz+6Q/Uxe62InFNY/lJXmA1SSMqBii8tPgEkX/mRaBOjMkqnH7zhq29zBUn
	ZKUj50re2IqmW7aYaw0NeLsC9WITnOWapz8+FKN9b7kJQa0RiKwZ+PpAjC9NTL7M/INpdHVWkJrHN
	NeGsLHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrK08-00000002d7U-21At;
	Tue, 04 Aug 2026 18:36:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrK06-00000002d73-3vEB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 18:36:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3382840DF5;
	Tue,  4 Aug 2026 18:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB851F000E9;
	Tue,  4 Aug 2026 18:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785868590;
	bh=MsrewjxSSyqLQoF56zKc/HGwK9yvsx9HfDzcpzwEwNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FNFv/4xn8rB3nhf7/Yzu0odlf/hsPD5HdeGDFTmzOG79lWWtydtYupWrQiraoPdpE
	 vVhOImYogC2W/V0osZXZQ1ee9d43vmPt50rCjU3JcjgYX+Vke9GfxaXl7qxvhXe8vv
	 yf9rFRo0gDEnpKw1k+WBFPLStpZYvVlrU9xhrMOfEpDAI4vZewidxdXa1su4CqHdXq
	 hHCt29rOTcpQVyfVESyQF71DQpudRgBelt92/Sxm5dvKoO08QnMKM7AbT/ZqrONWMs
	 bSoyLmu4qN9m6gQhxIrs/U90kuppnpoAQGQ0dDfm9f5gR+EcgBwEJToXR0N9WnHnmu
	 ibWUQVjrnOt6w==
Date: Tue, 4 Aug 2026 19:36:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: selftests: Check ID regs are immutable after
 a failed run
Message-ID: <537b173e-56d5-4e14-a7dc-18cc8884de8e@sirena.org.uk>
References: <20260804092421.1728880-1-fuad.tabba@linux.dev>
 <7e660a4c-af62-4751-a8cf-49151054f0df@sirena.org.uk>
 <CA+EHjTx9iLrnnaEVzV=3B+22bhh0DsPZRrBPvB6ZUT_CV5DvWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/eGGtsQu6VHOQjKh"
Content-Disposition: inline
In-Reply-To: <CA+EHjTx9iLrnnaEVzV=3B+22bhh0DsPZRrBPvB6ZUT_CV5DvWA@mail.gmail.com>
X-Cookie: Biz is better.
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


--/eGGtsQu6VHOQjKh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2026 at 07:30:44PM +0100, Fuad Tabba wrote:
> On Tue, 4 Aug 2026 at 19:14, Mark Brown <broonie@kernel.org> wrote:

> > > +     TEST_ASSERT(r < 0 && errno == EBUSY,
> > > +                 "ID reg write after failed first run: r=%d errno=%d",
> > > +                 r, errno);
> > > +     TEST_ASSERT_EQ(vcpu_get_reg(vcpu, reg), val);

> > > +     kvm_vm_free(vm);
> > > +     ksft_test_result_pass("%s\n", __func__);

> > Mixing TEST_ASSERT() and ksft_test_result_ in the same test program also
> > interacts really poorly with automation, TEST_ASSERT() just kills the

> Agreed, but it looks file-wide rather than specific to this test, so I
> would rather leave it to your series than convert one function. Happy
> to follow once that lands.

Unfortunately at the minute it's not even consistent within the program -
the MPAM tests in there do use ksft_ based reporting, while they do so
with inconsistent strings you at least get all the results out if it's
just them that blow up.

--/eGGtsQu6VHOQjKh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyMScACgkQJNaLcl1U
h9AAbgf/W+3LTMl/N5/eGuB3SteA/AMMoqc9R14TDJVBLdsyQ54rto/8rO1S6R2K
6z5XXdzQEyAUun4VTtWRdVNC4EBGCgFmx6iL0NIA7Mq/Hgg9Y5Kg4O9J+AZhUa7s
QkyroJpscInKTT2Z6AwulpLV1DGOuoaNsWykIUzLjTT3Fy1rzBh9gGSc4SkGOXjL
iZndvJCwijyJr0Co+C/6kXSffdmtoLXShJ0GQJTjgjDzlNo/Ofp9sQyY55n3+fxW
18Onf1DAZXOpaa+XZ+SxVFPasuCDoutSoPJgVPygau5lbWJkU2bLzX24FT5QHKK0
tkolz+CDfa4jgTcf0U5aMUw5ihJTfg==
=oRTP
-----END PGP SIGNATURE-----

--/eGGtsQu6VHOQjKh--

