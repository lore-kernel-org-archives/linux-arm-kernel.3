Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18156C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9H82NLQBdMpqPgxDAoF5zCET/a423kRXf21LCJulRs=; b=pJJXwDZTeKqhAQPNiUR07KfjkW
	WNqOYV8jDcJQYxdAB1cqpL8Oqf33sqQ22Dxib3bvT8br8jEXEri1xm5fckI2MPCj/rj2pE/uxvUa1
	cJC/YSosE2Q6JqvutX3/XlP0PYLzzffDnNaZCVorkJ5QzUWfkHd/ZakmQyPf5DDY9j9pQp6OJy/+a
	aFFg9ZJJJXdqVonGCvUKC+HC1aXzNpERFW8Q3Up27x/fr6/9//D9+f0fTN27DaYn1c/gppDJ3zsKX
	dNTpz8hS1jQEyg4Rn/hZDfTboRPQ2IjsuM8bqdy1pVLZ3DTemYyJkCf3FDjK9D7WVgt6kXi4VaUn1
	fAQyzvrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UAh-00000002GKj-2R7B;
	Fri, 04 Sep 2026 13:41:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UAg-00000002GK8-1tBW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:41:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A07A4108E;
	Fri,  4 Sep 2026 13:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98CFC1F00AC4;
	Fri,  4 Sep 2026 13:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529294;
	bh=C9H82NLQBdMpqPgxDAoF5zCET/a423kRXf21LCJulRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ko25YKjlQVWRGSmrZmVyXO3hq/59IgraPpdP2jNoHi5AsmfPHPRExitu14lEH3Chp
	 2QhblnqmgnKtkIJbK/fUtxLZSvHu2nC9OP4md1em96SHt4bKUIAuaHl8jG1btxJanR
	 9t6zGWmmnK2YM5+dFziQQ0LK+gCSN3yauhDzGKwYONvMYhtm/YJ+hhlHX9m+dJpxEd
	 IuYmYJ8TAHi07ipx8abm5f/XPztbpmp9yuTkYla8X4Sdq2yiVuNYxyMDK1PEeMEQPt
	 rqHdVbDa1Hl1r+x/0mNHtNv4AUhtloOnsU75YFcWNr9fyyrVU/9OigeAWE8nv8aY22
	 NvLEpiwkGGmGA==
Date: Fri, 4 Sep 2026 14:41:28 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Enable S1PIE for nVHE and hVHE
Message-ID: <aprKiP2YlBuBwDU8@willie-the-truck>
References: <20260904-kvm-arm64-nvhe-pie-v1-0-29d59f245e6c@kernel.org>
 <20260904-kvm-arm64-nvhe-pie-v1-2-29d59f245e6c@kernel.org>
 <86pkyt4gvt.wl-maz@kernel.org>
 <eb788ad5-5bb3-4767-87b8-d35d9e3ab220@sirena.org.uk>
 <apqrky27mJmUV9UA@willie-the-truck>
 <05f1e2f4-173a-4226-8c98-1452c20f0a47@sirena.org.uk>
 <CA+EHjTx87SnshzrUF69hGTSA9JmjW9oKbx+GbKjx5W+gnWYRgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTx87SnshzrUF69hGTSA9JmjW9oKbx+GbKjx5W+gnWYRgg@mail.gmail.com>
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

On Fri, Sep 04, 2026 at 01:20:44PM +0100, Fuad Tabba wrote:
> On Fri, 4 Sept 2026 at 12:48, Mark Brown <broonie@kernel.org> wrote:
> >
> > On Fri, Sep 04, 2026 at 12:29:23PM +0100, Will Deacon wrote:
> > > On Fri, Sep 04, 2026 at 11:33:24AM +0100, Mark Brown wrote:
> >
> > > > What about pKVM, my understanding was that that is very much an ongoing
> > > > concern and uses the nVHE hypervisor?  My expectation was that this
> > > > would only ever get used in hVHE configurations when people enable pKVM
> > > > on modern hardware, actual nVHE mode was mostly just carried along with
> > > > that.
> >
> > > pKVM uses hVHE wherever it can nowadays, so I'm fine with only supporting
> > > S1PIE on hVHE and VHE configurations if that's easier to maintain. We
> > > just need to make sure that the failure mode for nVHE results in the
> > > feature being gracefully disabled, rather than e.g. crashing or quietly
> > > doing the wrong thing.
> >
> > I figure that if we're supporting hVHE it will end up less complicated
> > to also enable nVHE, it reduces the potential for having bad or missing
> > fallback paths for features downstream of S1POE.  It's not like it's a
> > huge extra bit of code and it seems likely to save hassle down the line.
> 
> For pKVM there's no fallback path to get wrong: any CPU with S1PIE has
> VHE, so pKVM runs hVHE on it, and a CPU without VHE has no S1PIE to
> disable. I couldn't construct the protected nVHE plus S1PIE case under
> QEMU at all.

I can't remember the exact incantation, but there's definitely a way to
force pKVM + nVHE on VHE-capable hardware on the cmdline. So we should
just make sure that doesn't go horribly wrong!

Will

