Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42536C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOmxR3NasFLONDD4Kvo0UbW3qzmEdzYFcLqLATAQS6M=; b=QLerv4peozAbC0/ONGDATZtsmt
	fpQGba9BASVNLGJqlc/7LMaNquSsIT9K+3sUvAiFbG7E4GV7EYnBPrUTwXG04edhJK8G8K7EZISMV
	teNQZy5DPn7Z1yh1NNkMwufn6dmYr6fxn43p5qZndS1NkWqq2AAwU+6A30RMgVOecA5oW+qHhjlak
	05QOnHkiqWfWxiuuBnWxuFgrySsVU0Q8MDLyEKLWZd+D0IO4nW17Zn1b6ppF6JtZ0xzVpdw5+shxG
	p0S9tKuM7gwu0Xv7jd50JrlJd7sMqJp+/Y8KkMGf4sXPx5EH08jIwTKcF7HXhEc8ezxZya2KqXE+a
	J4urDRiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowp-0000000EYBE-30A9;
	Thu, 12 Jun 2025 20:54:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjhp-0000000Dl4u-0Q1q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:19:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1CAF4A79D;
	Thu, 12 Jun 2025 15:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28CFC4CEEA;
	Thu, 12 Jun 2025 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749741544;
	bh=ph4NrsjjtamLfSRGSV8IrWFOeVnkUjNMXGKpS7G1gOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KxnDutY6UJEe6l2TzebzS3WVZS27DCvR2GXMecLqwD6dU1rOKbP6mMgNjjTFDEQ8r
	 mietXp/OMOfHCfBPBIDifj860usNRyGuFVBXTXYg0NWuEcEQ4GKNKfKZS/iAVLutrL
	 ENCgfSxNVkJyhwkitubz6H9t//6MbpbXfZkz34NvZlr4FcJIH0YPHihmt6D0XL0Rb3
	 nWDdL5JO3AlpOMVa15tcXaAKEJG3YWYnE3fUqqhPHR+d9759WY4X3RMy6IbAvTItzu
	 Dk/1VGJP79u6HvSRfd3hpUbYBE5sR+Y4CnS8mkitcdMYNEQZJGzTm+YYp4DqXAr/0m
	 +mqRWtxhFhypQ==
Date: Thu, 12 Jun 2025 16:18:59 +0100
From: Will Deacon <will@kernel.org>
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Song Liu <song@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Subject: Re: [PATCH v7] arm64/module: Use text-poke API for late relocations.
Message-ID: <20250612151859.GD12912@willie-the-truck>
References: <20250603223417.3700218-1-dylanbhatch@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603223417.3700218-1-dylanbhatch@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_081905_157731_3084683E 
X-CRM114-Status: GOOD (  12.36  )
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

On Tue, Jun 03, 2025 at 10:34:17PM +0000, Dylan Hatch wrote:
> To enable late module patching, livepatch modules need to be able to
> apply some of their relocations well after being loaded. In this
> scenario however, the livepatch module text and data is already RX-only,
> so special treatment is needed to make the late relocations possible. To
> do this, use the text-poking API for these late relocations.
> 
> This patch is partially based off commit 88fc078a7a8f6 ("x86/module: Use
> text_poke() for late relocations").
> 
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> Acked-by: Song Liu <song@kernel.org>
> ---
>  arch/arm64/kernel/module.c | 101 +++++++++++++++++++++----------------
>  1 file changed, 57 insertions(+), 44 deletions(-)

Thanks for sticking with this, Dylan:

Acked-by: Will Deacon <will@kernel.org>

Catalin, I assume you'll pick this up for 6.17.

Cheers,

Will

