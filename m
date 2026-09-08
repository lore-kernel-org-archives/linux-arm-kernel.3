Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C312C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 10:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BUq9DqNfvFJpJpxO4ESAHte1Bx4yrvo0vCrnSZ9Wno=; b=rvlhHLNkpfJsgTvUiC67jZ7d7/
	xapOWi3mWGxeOnIcmDtxUlHmPWw5k3cdoWu4vYQtLn+yTTUKL+TsWCtXreafKvil6fiy3qUBL3bqF
	iP3I1MzCkR6H9Im7r97X1Z6/tHTGTwdMUyB2gyM6bdUNXbX5aINWYrjhxb47Rk0Z1nnZjD3IG64qB
	T0xmncsOxkKC+K4Ri9ODAy9lAwl70CcfGxuOmwguau0cq8vSTPy0r5bxLjzP5Sc3tm9kDRfQm93DV
	B7WjY6sXmfKtRxA7YUNkAEyubW2dusiA/95bXCaekONC4RUi+C15lEbmWza5osA2oug1zRlTWY6dL
	N4JsDgvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3stv-00000008kHP-10D4;
	Tue, 08 Sep 2026 10:18:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3stt-00000008kH5-0p1j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 10:18:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C2D5601DB;
	Tue,  8 Sep 2026 10:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798C01F00A3A;
	Tue,  8 Sep 2026 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788862680;
	bh=1BUq9DqNfvFJpJpxO4ESAHte1Bx4yrvo0vCrnSZ9Wno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MwavFRK/ztSyhXEhkjmbGgqiZw9sxr6mV1TbmhsRFf12TB/TYGglIbkUGeV7tUtxg
	 F148rzwylaMteqXTQlfgqCpYKWA3xLRuiSk/6ZuEdUVkyxHT5HaPDlNP0bbVm6Mp4p
	 FjSWVQUHDyaswMIHtvx1lOd10oe48Ss+ENBMUdnmWGrLP856Z/MdRVE992y9WKpPde
	 +MjO72CMnbl+RMjRI6UWUrE7V/VLv19l77g/zVYAe07/V28dqEfQXF1MRWhBgAn38K
	 WdW1TZooWTeccR2yS/OgrcO2v9FkbaEz0BGcv51hlHvuCPSmslvFgE1NzbkgrltoCJ
	 qqFQ5EJFaso2A==
Date: Tue, 8 Sep 2026 13:17:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, catalin.marinas@arm.com,
	will@kernel.org, akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com,
	sumit.garg@kernel.org, ardb@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/10] memblock: Introduce MEMBLOCK_LLMAP
Message-ID: <ap_gztTqHQv_GD35@kernel.org>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-2-vdonnefort@google.com>
 <ap2_926WXr7uAYVX@kernel.org>
 <ap6I1FN_2ylRzFXH@google.com>
 <ap-74AkHSGXbFCF_@kernel.org>
 <ap_RRSM7RBONvHaR@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_RRSM7RBONvHaR@orome>
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

On Tue, Sep 08, 2026 at 11:18:53AM +0200, Thierry Reding wrote:
> On Tue, Sep 08, 2026 at 10:40:16AM +0300, Mike Rapoport wrote:
> > On Mon, Sep 07, 2026 at 10:50:12AM +0100, Vincent Donnefort wrote:
> > > On Sun, Sep 06, 2026 at 10:33:11PM +0300, Mike Rapoport wrote:
> > > > On Wed, Sep 02, 2026 at 11:47:03AM +0100, Vincent Donnefort wrote:
> > > > > Keeping last-level mappings is interesting on some architectures as it
> > > > > allows mapping/unmapping pages from the kernel direct map without the
> > > > > risk of splitting blocks which, under the break-before-make rule, may
> > > > > trigger page-faults the kernel can't handle.
> > > > > 
> > > > > However, mapping the entire direct map at PTE-level is costly. So
> > > > > instead, create a new memblock flag MEMBLOCK_LLMAP to enable the system
> > > > 
> > > > I believe MEMBLOCK_PTE_MAP sounds more descriptive.
> > > 
> > > The idea was to have something close from NOMAP, to emphasis it is one or the
> > > other. But PTE_MAP sounds good too.
> > 
> > Could be PTEMAP if you prefer.
> > My point was that unlike PTE, "LL" is not perceived as last-level, it
> > should be looked up.
> 
> We were discussing the concept of enabling entire block mappings to be
> removed at once from the linear map, so at that point "PTE"MAP may no
> longer be accurate.
> 
> I imagine that in some scenarios we might be able to go to PUD mappings
> for something like VPR (say systems with a fair amount of system memory
> and we want to carve out 4 GiB for VPR, split into four 1 GiB chunks).

_LEAFMAP then? ;-)
 
> Thierry



-- 
Sincerely yours,
Mike.

