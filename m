Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0E9FD4F03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 16:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lPPNiqKmS/U0sQfGtK2TlP0c6RtZbL4EwKMWeUdyjc=; b=lLASltTf3R7uQcydWDNsVDDswQ
	ieknIxTYyGjphrJuQA2KKhotSg8QpA56DpSodFI65WjsgYbMxnEbm7JIj7HtQ7+YzzUqmflX29eMx
	su+4GW6Dk6cVgMBPcpN1DDxledeeOyINfmOL/5kn1IOcbWcVuek6e5Ixpx1FxF32xo2w1mrpeVBBq
	VGWxifERGcJQBeXubdL3XGPAGDbqbxg2cR7FnVu4VHhB3j0wxBGnLgwvdFx6t0SNWWHy1P0MPIsCo
	bgByCgJnu0XyKs7MPB4JXelzSzjDjGyqUG4bgzepcZQCJWOoU8P2fZjqWlPb12L7UKmBdBGQFVHbb
	pm4trWOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w008f-00000009vZw-1m4N;
	Tue, 10 Mar 2026 16:40:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w008c-00000009vZY-0URf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 16:40:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E02B1442C7;
	Tue, 10 Mar 2026 16:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E57C19425;
	Tue, 10 Mar 2026 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773160852;
	bh=2g+n9NhpHFHVcMxppYljVrkFGw5KHcpXiYAufvjJSgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmCWBRx8OIcJMMNv1edDx2mvbehcHUDBqElh2Z/hwNLqffQsGJKrN7YN3AsA5hmWP
	 oLejdyKYx8/Kdfb/Bh52xfuIKPgisrY91+1p/UMPGzRBnyirSeeueKriPnOb0AtQc+
	 wdxhXJZRd7v2ZfMDNJiP/ErhnZ23vPnqU7zJ+NHO8CwdKpyvJV9P7BhHJ7s94bllh7
	 WIKWX3X1m4YWB7N62B5sxL0uvYXHWV1NQi7JxihS/hyIQL6aBfgWUJwNu5k9eISFGC
	 D7fWQD6Taw3JSkHR/BBhqOpt291nzWOSbJQf5cGook0Sh6Hsa1v/HVj7Mts+rhBfZp
	 HNeaxxfbFHlfg==
Date: Tue, 10 Mar 2026 16:40:47 +0000
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] [RFC] iommu: io-pgtable-arm-v7s: avoid gcc-16.0.1
 section mismatch
Message-ID: <abBJj72kLQb0LRJB@willie-the-truck>
References: <20260203162406.2215716-1-arnd@kernel.org>
 <20260203162406.2215716-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203162406.2215716-2-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_094054_199588_31B09579 
X-CRM114-Status: GOOD (  15.84  )
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

On Tue, Feb 03, 2026 at 05:24:00PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-16 has gained some more advanced inlining techniques that enable
> it to inline the dummy_tlb_add_page() and dummy_tlb_flush() function
> pointers into a specialized version of __arm_v7s_unmap:
> 
> WARNING: modpost: vmlinux: section mismatch in reference: __arm_v7s_unmap+0x2cc (section: .text) -> dummy_tlb_add_page (section: .init.text)
> 
> From what I can tell, the transformation is correct, as this
> is only called when __arm_v7s_unmap() is called from
> arm_v7s_do_selftests(), which is also __init.
> 
> I have not come up with a good workaround, so this simply marks
> dummy_tlb_add_page() as not __init. Since there are currently only two
> files where this happens, that may be an easy way out.
> 
> If anyone has a better idea for how to deal with that, let me know!

Can we mark the dummy_* functions as 'noinline' instead? We shouldn't
have to keep the selftest code kicking around in memory after boot.

Will

