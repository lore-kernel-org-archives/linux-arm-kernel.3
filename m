Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862B5C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 12:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icRL48a7sVyjHVFwn1f2bfTzasP2dnwXxav7dJKrdGA=; b=p/kKqz8RkmgQrhVgiRCWceO0jx
	3vn9PSRObL/TJ3nLmnsfC3C/HorYilSWnebYNwFB6BvI2QHsTDtE8WvTZ8RmA+um08z636tDynl9W
	BoWMfimBFpa8CnUFXeZ7pxwglVEfX9e1IIqTQuAXRZq+/aTnhwpv6Rt2+pK+ebg+cjShuECyDTMWr
	ixave87HgyAg46bUI3wv0u3aKl1exWXLZ6gWXihCKBjtaRFiL0xsX88LcrudGY/R6mppShoK6l2d/
	8NEm1VQNeLsiygkeMMO7WM+Z11UVR0UXULZ95kmgQMhtA7aOR7QZXu0J7nWwYBaQnZMx00kebPf+C
	eH3yTmyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HPg-0000000BfGA-15Va;
	Wed, 09 Sep 2026 12:28:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HPe-0000000BfG4-3ktr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 12:28:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C10342D6A;
	Wed,  9 Sep 2026 12:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318B61F00A3D;
	Wed,  9 Sep 2026 12:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788956906;
	bh=icRL48a7sVyjHVFwn1f2bfTzasP2dnwXxav7dJKrdGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=juoso7fuBHmCJy6DvLNE6IH8N7Q9D4BB3u2CM86KtVBxuzM2aNxgvcD6f0NmqNKaW
	 FjlT8FOCUkCSJhjlqY/FGe69xRnKULAgm9PofCauvMHEDVXxpr8DcqouA9foO4Qc3Y
	 DINuMqgFlz+rFbtCKXe97fkRJRBhWdqxjP9W/hwxlxcx7IeACTMKQ2KCidoTFWB9fU
	 WcXwSSTvbW1YX3YPAYAsU4PnkWVs0mgaYhx43Uvg4urNYsooOOFe1sQaN1GJ5JgTRt
	 sfGnYKyZeeP1zjMNrGXvYyliWHvojnh1Bn3gXB97u2KjLLOxgP8P0nNdJ+8gwY53Bu
	 ZVXEbzMT9c9yA==
Date: Wed, 9 Sep 2026 13:28:20 +0100
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 12/14] arm64: image: Remove endianness handling for
 generating image header
Message-ID: <aqFQ5PacgD8RaryX@willie-the-truck>
References: <20260907163726.17104-1-will@kernel.org>
 <20260907163726.17104-13-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907163726.17104-13-will@kernel.org>
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

On Mon, Sep 07, 2026 at 05:37:23PM +0100, Will Deacon wrote:
> Since big-endian support for arm64 depends on BROKEN, we don't need to
> bother jumping through hoops to generate a little-endian kernel image
> header for a big-endian target. We can just ignore the possibility
> instead.
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Marc Zyngier <maz@kernel.org>
> Acked-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/assembler.h | 11 -----------
>  arch/arm64/kernel/head.S           |  4 ++--
>  arch/arm64/kernel/image.h          | 24 ++----------------------
>  3 files changed, 4 insertions(+), 35 deletions(-)

I think this is another patch I should drop from the series.

I was under the wrong impression that we were using two 32-bit words for
symbol addresses because of endianness quirks in the linker, but digging
into the original rationale from Ard [1], this is more fundamental to
the way in which the PIE toolchain handles ABS64 symbol relocations.

Will

[1] https://lore.kernel.org/all/CAKv+Gu8vdk-9N_VVG6XWYLp1SM9ynfcsbxwk2xx1mXYq7qN0Cg@mail.gmail.com/

