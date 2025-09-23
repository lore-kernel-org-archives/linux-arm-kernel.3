Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84997CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 10:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMJpKY/Cj+ACMNVpm46wsoR8zwa0GtjagFA47V0lplU=; b=g63jhVUhu5ZJ5cFQfTvJNhO2F8
	2dWuAQa5zGXNKaiZ637MvtYt+A40C94CB8Ua3tzKkTec2CQ63h1kNxbiy5OrBTCIu8cQnVESzrlkQ
	2z3yBJxyDyGHFd3P/2t6BeqwcUMpP9vJjgZ0kSGJqSxQbs/ys5waAEwL1m9wGZk7YLsXorqFCzQkH
	iDopTrV2aaG1WA9XGjtC2LaBl1Nd44/vrwOCLYzDRNTQWp7O4c6VwSu3zDM0u6pEVjMv09tFvUJKV
	au04Yd5pQBeoFy5AoSeaEOgNS2y5yYZuEKPeqYXD5NuA4OJeKtUTBWOHoxBrb7x2HSpeGH3n+f2BC
	PbC1G8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zsn-0000000D17e-2VQo;
	Tue, 23 Sep 2025 10:04:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zsm-0000000D17K-0mHM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 10:04:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 810CB60203;
	Tue, 23 Sep 2025 10:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79888C4CEF5;
	Tue, 23 Sep 2025 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758621863;
	bh=x2LYV/7wKU5QkUB56BnmVKNlh727nQKS7JPhtdAs07I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fuz064OrvosVWnmWruuyFoxsZhObK32ph886Kb/wE/2T5IpnirTeBLdS2yaFKA6Kr
	 q1Gxc9JojmJ/lYDoJXprAD1D2roMHYl1Nc2g2mGWnWc/WnxRUqAi7RV68HVDUNHD9R
	 tmz4I+DvBWJheVD2a5RMlRdUYfxT9EmTHklqRs9/mvwg4aQb6psTtN8a3+wXuoe+QA
	 sSRMaXY+YDTNiQpFXW2pbvsOabw1p9adPtm2dWSUQ9Mqvlb2B+CFQOhe3gVa9PQj7M
	 Y8T3Y+o8Ow2iN2A1e3shbSKTuqHb7YEVXJPdRUm6bET6iaxbPFCSjIwn28FyGKqBYj
	 KsHcBjMqGEfJg==
Date: Tue, 23 Sep 2025 11:04:17 +0100
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, maz@kernel.org,
	broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
	wangkefeng.wang@huawei.com, baohua@kernel.org,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com,
	yangyicong@hisilicon.com, linuxarm@huawei.com, yangyccccc@gmail.com
Subject: Re: [PATCH RFC 2/2] arm64: atomics: add optimization support for
 implementations using near atomics
Message-ID: <aNJwoSZiZLNeTKOJ@willie-the-truck>
References: <20250919091747.3702-1-yangyicong@huawei.com>
 <20250919091747.3702-3-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919091747.3702-3-yangyicong@huawei.com>
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

On Fri, Sep 19, 2025 at 05:17:47PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Atomic operations can be implemented in the CPU (near atomics) or
> in the interconnect or at the Subordinate holding the data (far
> atomics) [1]. The former one can be further optimized by prefetching
> the destination prior to the atomic operations, similar to the
> optimization for LL/SC operations mentioned in
> commit 0ea366f5e1b6 ("arm64: atomics: prefetch the destination word for write prior to stxr")

Sorry, but I'm strongly against this. The CPU needs to do better if
the system is configured for near atomics.

Will

