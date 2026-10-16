Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5F8CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 07:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxKxHO2MCyzxbgYAzs8LlnDp9zqcep7qEmycS6UkohI=; b=4TaesIER8qWP25LWbPiir/OP1c
	XnF3YdV36hy1SZZOUM1H7yyEApGb4dKrpCsStlwWeUCMxe4gFvug15KnKk9YcU1DHLzIxm+Ym2vyG
	XyD98ini7bQrA+BxnY6xDjKQI+gyaVash/HgXbhbdwA4ba5hunqTkzOzhgqX5lIUuPl/HAiK+g9+U
	YVWL1hmwYTcvri/QEZwn9/8+OhtrTVCLWDOabMaEI/UHtNGZQbcEZjbFll42GsQ8mKj5meq2pMCnh
	AJBum9t+mJnCsbe8nG6mVM0+kDSclCx0sV8zapijz+MPjpI9e0T9Z+98CGdbw6BtJfgZzapRNeiMD
	JXTMveXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcMO-00000002EBB-35Uv;
	Fri, 16 Oct 2026 07:28:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcMN-00000002EAx-3k8P;
	Fri, 16 Oct 2026 07:28:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42DB141A8F;
	Fri, 16 Oct 2026 07:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49991F000C4;
	Fri, 16 Oct 2026 07:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792135691;
	bh=cxKxHO2MCyzxbgYAzs8LlnDp9zqcep7qEmycS6UkohI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZTt0AcQ3YuGFOHgTRdduzRZUPs4E63uas086PQN5dE8SweHEvqrG7JMSyn73Q3HJ5
	 sckJ1vYU/xT32subvoCoj8Tgfh2q3PbjOY1uNh4pV9yLcHBPT7iwQGZQC/KZIrrmro
	 u0EQPoVySrIJIAmzAArWed6ou5ZuqJb2ht7Dqs/JVL/9o3ijTYg6toTYYmV6sRrO7X
	 iNs7B5pPp8pFIzEtX0aW7OszmysgSP4RyGnC2FGHgpESD9Er4YmvCniA3yROyUvXJQ
	 bbIGcy7riKMy7zVpuaNJgsYvVsGF48XkHfL2HlmDW6eJBd00PEW3lMK5JwTEIjyHmI
	 wECA8NMDh+qfw==
Date: Fri, 16 Oct 2026 00:28:09 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kukharenko <vladimir@genproof.com>
Subject: Re: [PATCH 0/2] lib/crypto: Use size_t lengths for Poly1305 and
 ChaCha
Message-ID: <20261016072809.GA3049@sol>
References: <20261014152604.323310-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014152604.323310-1-ebiggers@kernel.org>
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

On Wed, Oct 14, 2026 at 05:26:02PM +0200, Eric Biggers wrote:
> This series upgrades the Poly1305 and ChaCha functions to use size_t
> lengths, matching the rest of the crypto library.
> 
> It also fixes the (not currently reached) handling of lengths above
> S32_MAX bytes, and (not currently known to matter in practice) the
> assembly functions depending on unspecified high register bits.
> 
> This more comprehensively addresses the issues identified in
> https://lore.kernel.org/r/20261012-libcrypto-4gib-lengths-v1-0-ea566c129a2e@genproof.com
> 
> This series is targeting libcrypto-next.
> 
> Eric Biggers (2):
>   lib/crypto: poly1305: Use size_t length
>   lib/crypto: chacha: Use size_t length

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

