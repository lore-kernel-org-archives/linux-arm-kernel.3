Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8052AC71150
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 00:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ijh1BxpBYDQZtN3vUO2sp1Ls9j9RTyfs4JXcOEIRzrs=; b=ur0s1jQqvULNBwCF40hiHt59iF
	G/j5Uck1xkfUDs2QMsQ2Ja/9lTv3HWyirOs/Ic6+dQSD+xb9wyrvj5KjT8ISDIE9tawx8ve4YYW30
	UrUpxsioh7Svm2Qc7gNdxJmYhPvjwsdQCA4EGsLaaP8vYGjXdCetOfUDQ3x6kHwiyafSVr1T7D6Lo
	7g9UDQgJfYUIDyaT/pSaWHzkPOPUcFjC5+ZIl5rybRXJMnAc/GXL5MO1bAMCB5bxQaS/LJZiZQALU
	5HLr9UsSDXRNsRlqSr3c6FOi6GSA9N2G3hH8+ykgIROOsXqz5Au+MIQpe5x5VnFQnM5OsrrfHi3G4
	msVikTYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsDg-0000000Ewnt-2T8l;
	Fri, 13 Jun 2025 00:24:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkgM-0000000DwFk-4BUH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 16:21:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21362629ED;
	Thu, 12 Jun 2025 16:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A41C4CEEA;
	Thu, 12 Jun 2025 16:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749745297;
	bh=b9Hf0WPhn4uw3DVMdJKhxVedk7FYy5EqXqMjYHx2F6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2tHT2pjNNFyGTI7QqFHYxO7jPygLm+ZPhIaIk6lAiIgNavT3XHHy22/3gYN1wOre
	 Pi3xQLnycnlxVyIANsgk9o5ZaHa80lN3u7tdLrgbGRNVfGnIUaGTJz8UB/Qzp+lss4
	 VALutvube9kFU1MjAlxyJdTs2nAo43jfUylbtZST1BKfjlm8ebuS/Ql2OV1XGXitMV
	 sgXFf1gf7uzGkdPNCjLxy6XBox/GtLISdMASHkBaPvDbzsAV/e3jJOVppnfPekR9aA
	 Z8LjtYm+IoaYdznsutv/8a9k7ifoZqw/ziDcAN2p5bpPn+lDphBhywT9T+hDLVyxsl
	 HwEaLBfujsu8Q==
Date: Thu, 12 Jun 2025 17:21:33 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/mm: Ensure lazy_mmu_mode never nests
Message-ID: <20250612162132.GB13202@willie-the-truck>
References: <20250606135654.178300-1-ryan.roberts@arm.com>
 <aEgeQCCzRt-B8_nW@arm.com>
 <3cad01ea-b704-4156-807e-7a83643917a8@arm.com>
 <aEhKSq0zVaUJkomX@arm.com>
 <b567a16a-8d80-4aab-84c2-21cbc6a6a35d@arm.com>
 <20250612145906.GB12912@willie-the-truck>
 <066fa735-98ad-45f4-9316-b983d2e5a3d3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <066fa735-98ad-45f4-9316-b983d2e5a3d3@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, Jun 12, 2025 at 05:00:51PM +0100, Ryan Roberts wrote:
> On 12/06/2025 15:59, Will Deacon wrote:
> > To be honest, I don't think the proposal in this series is really
> > improving what we have. Either we support nested lazy mode or we don't;
> > having __kernel_map_pages() mess around with the lazy mmu state because
> > it somehow knows that set_memory_valid() is going to use it is fragile
> > and ugly.
> > 
> > So I'm incined to leave the current code as-is, unless we can remove it
> > in favour of teaching the core code how to handle it instead.
> 
> Yeah fair enough. I'm not going to have time to do the proper nesting support
> thing. But I'll see if I can find someone internally that I might be able to
> convince. If not, we'll just leave as is.

Sounds fine by me, thanks Ryan.

Will

