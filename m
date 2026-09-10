Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2D5C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaH94r2pnTGyhZ2s2DCtMt9jAIlcwDGgoPae43u3KbI=; b=mAk9ocHDaW5iPREbTRIZSJSIkp
	4GmZWmoIg/6Tq6PWjwBSkALN2pvgtURB/n9oIxgiYQ0S8RfpzCsOC+JRY8ak1md/QV/T757vuxKfS
	G2FNWvcrswKFAoaIIP3EYXOCSt+bM5xW7cr20w3/8+qFLP8tuUAaZ1tufpUdQnKqdmBTf5MTAgE4N
	u4328xnOxT1FpgWVfr0Hspeeh5WhhHUJU5mGo92OXx3Jh6dpFlWN+jjXa9Yh5LymS1CiZBl7IgQjI
	AXTm1hPlNUhZ/V1zxoUACmrQBLqOA8eNq67e2sdLoSwIxGWHm2HmyMde4YOxkHsEbIuNOEogqUd2V
	h0BJvStA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fYK-0000000EbEf-3cVq;
	Thu, 10 Sep 2026 14:15:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fYJ-0000000EbEB-2Lq3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:14:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E16BD6020A;
	Thu, 10 Sep 2026 14:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0281F000FF;
	Thu, 10 Sep 2026 14:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049698;
	bh=aaH94r2pnTGyhZ2s2DCtMt9jAIlcwDGgoPae43u3KbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=niPBdpixKg9E9hqQj+GTyb42eVqDLarLNBGOOajS0BYsqMl6xxrV2LQ5OtyQkYEEY
	 4Ta6rgMg8Ik1nw2cS2V9VsO7QgTwjlx1i4ayNDlfGFs/bNK3XrVMHw3tWLqgN5Z6CZ
	 Ppw5qTar0i9NxUqC6AfaeVbUB3jrkFhpWKisjhC4wLIWyVIrh64Q45UnHydlWziIuF
	 vtoq/d6Dc85jiyZCOPKYlntu0vzvT2gHx5+AdagFeOKbE7M1eGVJ8OaE+8h78vy/J6
	 SPMM4iZHxysLD5C06I907FHrcU+orF4ce+WOOTLOEU2biAyop0fu6zOGBmYejd3o+C
	 6U0FlgGyyTocw==
Date: Thu, 10 Sep 2026 09:14:56 -0500
From: Eric Biggers <ebiggers@kernel.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Joachim Vandersmissen <joachim@jvdsn.com>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
Message-ID: <20260910141456.GA1936@quark>
References: <20260303060509.246038-1-git@jvdsn.com>
 <abTuFto8Tc3mhRRe@gondor.apana.org.au>
 <64592fee-1956-4a70-a751-9ac3335cfc27@jvdsn.com>
 <9926908a-5f08-43ba-99dd-b83c7067d52b@redhat.com>
 <83d09aa1-729a-47a2-a8e9-381c74e92f42@jvdsn.com>
 <48f12b65-428d-4809-9735-18876b09e759@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48f12b65-428d-4809-9735-18876b09e759@redhat.com>
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

On Thu, Sep 10, 2026 at 10:57:32AM +0200, Thomas Huth wrote:
> On 10/09/2026 05.24, Joachim Vandersmissen wrote:
> > Hi Thomas,
> > 
> > On 9/9/26 9:36 AM, Thomas Huth wrote:
> > > On 15/03/2026 01.43, Joachim Vandersmissen wrote:
> > > > Hi Herbert,
> > > > 
> > > > I don't think this one can be applied yet since dm-integrity
> > > > still uses xxhash64 through the crypto API. This would break
> > > > fips=1 systems that use it.
> > > 
> > > Out of curiosity: Wouldn't such a system be FIPS-incompliant anyway?
> > > If xxhash64 isn't FIPS-compliant, nobody should use it for
> > > dm-integrity there, right? So I doubt that there are any systems out
> > > there that use fips=1 and use xxhash64 at the same time?
> > 
> > There is a risk that users may not know that xxhash64 is not FIPS
> > compliant and would still use it. Especially considering it was marked
> > as "fips_allowed = 1" for a while.
> 
> So isn't that a very bad situation? They think they are FIPS compliant, but
> actually they are not since they use an unapproved algorithm by accident.
> Maybe it would be better to include this patch so that they are aware of the
> mistake? If there is really somebody running into this issue, they could
> boot once with fips=0, fix their system, reboot again with fips=1 and
> finally be really compliant. Sounds like the better solution to me. WDYT?

As described in the dm-integrity documentation, dm-integrity supports
non-cryptographic checksums for protection from accidental corruption.
That use case is no different from any other use case of a checksum.

It's also no different from using crc32 or crc32c, which similarly have
fips_allowed=1 and this patch completely ignores.

The solution is not banning checksums or making any other code change,
but rather just doing what it seems everyone has already been doing:
documenting in their FIPS security policy that checksums are only for
use cases that are not "security functions".

- Eric

