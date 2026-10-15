Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9A9CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 01:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kb9X/vVPaBS5PmmJTv9N7AbomZftgYqIDYhNlvtwuqM=; b=fbBy13uJAQVcAYbowpdXsR5nBd
	dJB/v5gkWKbUH1lc6DZr0qMjpqfb3q4e7crvAZVjseZt9juZK4EK8Y6lWHQWB7biaFK/BveCS3ndZ
	kNJPIi1iBaVUiMcLsYsUS6v40P0QqKmqIg66jh7TvOZqWiST7KByBvD2oNZdV5kLzxGhEcYpIr7OB
	AXPweDiaMgfctGwF9n8lfkeoZ8fBKXcIja/wvz/qFu8sj2KmxLScemK26r3Bgkh3lVw7qo4ezPwtJ
	p+llOJgOxqPgmWe2kftuy3c8Os0f4iFHCnG/O7y6N7iJtd3Ki/geCr5822DJFjAKAVyNfxYudKJre
	s9rpCFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH9za-0000000GX1t-43ay;
	Thu, 15 Oct 2026 01:10:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH9zY-0000000GX1Y-3hKA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 01:10:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FDF14027C;
	Thu, 15 Oct 2026 01:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1093F1F000C5;
	Thu, 15 Oct 2026 01:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792026644;
	bh=Kb9X/vVPaBS5PmmJTv9N7AbomZftgYqIDYhNlvtwuqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SKZtaDe97GO/xuHcK3Cuu/Vhg5xDG7YB+bN7mTbhiCDKc2m9/TbXQLmBi/vR9eQkc
	 EisxrxD9TV3RXvoBWZLFYkxpZfcd4S+W9ujoCUGzhDoR1gxCSfwGte6q9e9CXf38uH
	 A2aMLoSFvSwA2/XEr/fOoM8pOJOQnGlPW4OF+ZRTgPGx3tOKPGHOwTYnLHEPRzwTvz
	 efKDWe+Dk7FhPRq4fZ7ApG6QeguE6hnMxhVzOFDHuzzGseDfnWrexeEDvcSDMgwM5/
	 iyOzpXvEuUZLOs/Ur/tDYRDfD9t+FY0WRn2TnxO1IGT9YrxYyj9K6w1OGoerDHHR7P
	 YkEnu72dy/rTg==
Date: Wed, 14 Oct 2026 18:10:43 -0700
From: Kees Cook <kees@kernel.org>
To: Iurii Trukhin <yuri@trukhin.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: raise default ARCH_MMAP_RND_BITS for 48-bit and
 52-bit VA
Message-ID: <202610141810.779BBFF@keescook>
References: <CAOx7e9Jm0N9O_ndL1UApMPrXUN=P4RiptSNibdDP+9prUsNPOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOx7e9Jm0N9O_ndL1UApMPrXUN=P4RiptSNibdDP+9prUsNPOw@mail.gmail.com>
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

On Wed, Oct 14, 2026 at 07:26:48PM -0500, Iurii Trukhin wrote:
> Since commit f101c5644771 ("arm64: Support ARM64_VA_BITS=52 when
> setting ARCH_MMAP_RND_BITS_MAX"), arm64 supports up to 33, 31, and 29
> bits of mmap ASLR entropy on 48-bit and 52-bit virtual address spaces
> for 4K, 16K, and 64K pages respectively. However, ARCH_MMAP_RND_BITS
> still defaults to ARCH_MMAP_RND_BITS_MIN (18, 16, and 14 bits), which
> was set in commit 8f0d3aa9de57 ("arm64: mm: support ARCH_MMAP_RND_BITS")
> when 39-bit VA was the 4K default.
> 
> Set the default ARCH_MMAP_RND_BITS for 48-bit and 52-bit VA to 28 (4K
> pages), 26 (16K pages), and 24 (64K pages), matching x86_64's 1 TiB
> randomization range (5 bits below ARCH_MMAP_RND_BITS_MAX) while keeping
> ARCH_MMAP_RND_BITS_MIN unchanged for smaller VA configurations.
> 
> Closes: https://github.com/KSPP/linux/issues/371
> Signed-off-by: Iurii Trukhin <yuri@trukhin.com>

Yes please. :)

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

