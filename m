Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F4FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpK4VCXxOfi2NsgnoYaHvYKbtIJiOdgK8j0XiL9E3ag=; b=OZDbkR067/fCyIYAtHEszrj42Q
	RF1y8D6pVAvgMOJQ6jMRR0Z7fmMGktMBb+bN+S7fosT3bHQAuqhaiehoOQ8Vm1MjwefEZCmbWGq1i
	E8yFIf1UakUw54p4pIPaXNiMs39CGmffn8863SdIWH1+cbH6/zKx+rqE4k1wnH78PVwbvQ9dECuIB
	MJLV6PKsBqqhVX8jilVi5ViYOwd/E6Hx4lJSOh9uMYvwkM25NwEwwhU0yXny7IBLwmPr29EpkVEZa
	M6lY6BPAnVavPhpKQGj6l5WGAMflotBJU7czLCg9QLYZrNldO6tPSIXsYlGO22IUTdYtT0NZoMm4Z
	JVlHrTBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZH9-0000000HGJU-26ea;
	Tue, 30 Jun 2026 14:17:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZH7-0000000HGJN-2QBs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 14:17:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B070E601C1;
	Tue, 30 Jun 2026 14:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749B61F00A3A;
	Tue, 30 Jun 2026 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782829040;
	bh=OpK4VCXxOfi2NsgnoYaHvYKbtIJiOdgK8j0XiL9E3ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=clWEcGmNF63o9sOxWnH5qazA03avsmWr+SnkHLK13JF6pV0jeRIdWPjNFAIUp5QeJ
	 nugKWFJbl0XPR4FwsMi6UTmo91gYvstXD7sQMr6LhHE7x8D/NSmyaC41eOT+28mItS
	 FRCHdNz79S+ZPu+9SeBVZ0w8N5B9Bklvr7Vjo97JRg3zKoxCUvzzaE0Silomr7b1gb
	 UPUP4YVuFx38GGlwmfssibjcxJmhnlSATSwVlKRlB84tRJuKFSaHDMcGIKiLcHdQ1t
	 sU2UiJ9XptJ/6cu1UEI+WkLvkLzbdcmJBewYtFibfUtE6t1XaSsI793SwhuW03vDh3
	 q+6aGRIwNPm2Q==
Date: Tue, 30 Jun 2026 15:17:15 +0100
From: Will Deacon <will@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v4 2/2] arm64: io: apply the device store-release
 workaround once per block write
Message-ID: <akPP62P_mKN21GTv@willie-the-truck>
References: <20260625182425.3194066-1-sdonthineni@nvidia.com>
 <20260625182425.3194066-3-sdonthineni@nvidia.com>
 <97b62a6f-a514-46bb-9ee8-81f563220f6a@arm.com>
 <d75592c9-5292-4704-b024-6450ea0e8278@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d75592c9-5292-4704-b024-6450ea0e8278@nvidia.com>
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

On Mon, Jun 29, 2026 at 06:09:11PM -0500, Shanker Donthineni wrote:
> On 6/29/2026 5:48 AM, Vladimir Murzin wrote:
> > > +                          : "memory");
> > > +             src += sizeof(u64);
> > > +             dst += sizeof(u64);
> > > +             count -= sizeof(u64);
> > > +     }
> > > +     while (count) {
> > > +             asm volatile("strb %w0, [%1]"
> > > +                          : : "rZ"(*(const u8 *)src), "r"(dst) : "memory");
> > > +             src++;
> > > +             dst++;
> > > +             count--;
> > > +     }
> > > +
> > > +     iomem_block_store_barrier();
> > It is perhaps a matter of taste, but having the inline assembly
> > here (and in memset_io()) might make the code clearer. To a
> > casual reader, it would be obvious that the barrier is not
> > guaranteed and is only applicable to ARM64_WORKAROUND_DEVICE_STORE_RELEASE,
> > without having to jump back and forth through the code.
> > 
> > Obliviously maintainers might have different preference ;)

Oblivious maintainer here :)

> Regarding the barrier, iomem_block_store_barrier() is declared
> static __always_inline, so it does not add a function call. The nop/dmb
> osh alternative is emitted directly in each caller. I used the helper to
> avoid duplicating the alternative sequence.
> 
> I understand that placing the assembly directly in both functions could
> make its conditional nature more obvious. I do not have a strong preference
> and am happy to follow Will’s and Catalin’s preference here.

I agree with Vladimir that it would be clearer to inline the conditional
barrier.

It would be even better if we could avoid having to duplicate this code
to start with, but I can't immediately think of a better alternative.

Will

