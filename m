Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD251C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dW0Bt6wVwx6uYNJdG4bnYanuxC0mWdhwlxmUwvkpPtI=; b=I5YMzUQkPDWJ4YwCVrWRbBQdxa
	Ai4pkaE6Lkp5c/9GaS1yIkBsteV1wKpb2EiU2qRgjXAAHCGqPAysLjP3Kw4oEV/ES4j3Xi67WHjYA
	fJxdcmcRA5Z9D07e6g4AF3fzBg0GOuYuqqzUa+Kes+J9rB5VLROZPo+HFmUxmpx3Mh8pu3Nf7c5xt
	M7o9TH+WW3MLaroAoiiUI8pCJnQLviyAb2DqoAuAO0Jw4f8gzBI1fBO97m4PYygvjfZqVGsrLkaql
	fpMkrUptNknMclg15qRaG8xLke3xLeT/uBn7mSwzrO5nh2BWthoj9/Kers9x7NkMTMeO4maMSE974
	IRwVDvuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qRQ-00000008Igd-1p0L;
	Tue, 08 Sep 2026 07:40:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qRO-00000008IgN-3YiH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:40:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C8D3B60A97;
	Tue,  8 Sep 2026 07:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FCE1F00A3A;
	Tue,  8 Sep 2026 07:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788853225;
	bh=dW0Bt6wVwx6uYNJdG4bnYanuxC0mWdhwlxmUwvkpPtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iVpMzVBVDpbbjmSmLjf9/u1y3Rr+zfuCTrDmGqoJwDmagIYgicropXMGIej4xSaxg
	 6cLeStx2+JupYI5v46SFH93vN1pLOaqi+71OxT+0bOJXF46WT8TIADUbfXr6wM0X6y
	 j1wQEMfYEqkJp0+VVHTg+hRXEBocWl2PZ2Gxdqa96QFMigsr2ZMs+aOiSh09Bl9Nce
	 OQjSjvU/RbtJveqJElRlq/Pv63+Uov2SfEkKZ+0O2mOCeEHPy0le7Mc8q36JU8dfL3
	 taQ9sUCphHLYu4/BTPtAXLlD5cjXs4iaTH5w84MhhGeyR7IHE6ys0J1mEfDUQfC1JJ
	 3Xxl0cUO8U+Uw==
Date: Tue, 8 Sep 2026 10:40:16 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/10] memblock: Introduce MEMBLOCK_LLMAP
Message-ID: <ap-74AkHSGXbFCF_@kernel.org>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-2-vdonnefort@google.com>
 <ap2_926WXr7uAYVX@kernel.org>
 <ap6I1FN_2ylRzFXH@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap6I1FN_2ylRzFXH@google.com>
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

On Mon, Sep 07, 2026 at 10:50:12AM +0100, Vincent Donnefort wrote:
> On Sun, Sep 06, 2026 at 10:33:11PM +0300, Mike Rapoport wrote:
> > On Wed, Sep 02, 2026 at 11:47:03AM +0100, Vincent Donnefort wrote:
> > > Keeping last-level mappings is interesting on some architectures as it
> > > allows mapping/unmapping pages from the kernel direct map without the
> > > risk of splitting blocks which, under the break-before-make rule, may
> > > trigger page-faults the kernel can't handle.
> > > 
> > > However, mapping the entire direct map at PTE-level is costly. So
> > > instead, create a new memblock flag MEMBLOCK_LLMAP to enable the system
> > 
> > I believe MEMBLOCK_PTE_MAP sounds more descriptive.
> 
> The idea was to have something close from NOMAP, to emphasis it is one or the
> other. But PTE_MAP sounds good too.

Could be PTEMAP if you prefer.
My point was that unlike PTE, "LL" is not perceived as last-level, it
should be looked up.
 
> > > to decide which region must be covered by mappings up to the last-level.
> > > 
> > > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> -- 
> Vincent

-- 
Sincerely yours,
Mike.

