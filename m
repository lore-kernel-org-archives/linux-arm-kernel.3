Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC00606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VQ47HIuv;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VlnlOoUU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fv8sMlP8O3GHUSoY8MBfh8MY+kr37FDNK89rZQzSXdU=; b=VQ47HIuvUm1RJV
	/kWYIJctCtBMoC2aBTFTfJ4yDEr5sgA2l+wqiqGIeFAvuapFoekZyt2c3EXutMeJAqt7YAF03l9qL
	t1yO69nGinJcgteIirkLajdc5uIhmgJzF1g0llyzZboOsn/I0krfJPmuePr4pwsIlDR48xN/C3qkt
	wOPWuCNSuAadzMvUpfIR83UvETH8pIxIUbNTv7eOAq4fUht7lCYpUS9DSw8E57z0K6n9zO+7w9bI1
	iyVcy7ECszkjfALDcAWw71MCzfRGXyyKJY5PlgRiAgbt0KDP0GEi1lnDWhxJ2621CID/HDouJeH93
	6xjvb9bCGMLTZcfimzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdru-0000000F47U-2qzX;
	Sun, 01 Nov 2026 22:17:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrT-0000000F2Tq-0pil;
	Sun, 01 Nov 2026 22:17:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3C8F400B8;
	Sun,  1 Nov 2026 22:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A0F1F00A15;
	Sun,  1 Nov 2026 22:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571429;
	bh=Fv8sMlP8O3GHUSoY8MBfh8MY+kr37FDNK89rZQzSXdU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VlnlOoUUEu9V0plLi4Kke52P9Sf7LmnCXI3/r9nD/EkLF8dgcbn/b70x7s8xOpjzM
	 vBDpICruAngiVNvxs7IVSzf2GH3D+B5AcFg6C/1RMLmTfGWgGqs0LmJd92jQOeIJaF
	 wsK9MssC5+2tsvQklkL07S8F2Zzqk3PTJHN1zfusMqgsbvhB+jUERHRUHHZskloFPo
	 yl/WabE6HiCKHMwoMCYwf1B+T0vXDZWAeuYQt311a5PVRX3ugUcvRN0wyZzbvYibPV
	 2TlmBTOm6MSHm2nJI9gJKa3Redvt//yKNi/XBo/uFCvCdVwIZi6hXO14jaV0sdhUS0
	 kunSJJwhwyeCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA5B438003B8;
	Sun,  1 Nov 2026 22:17:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] lib/crypto: Use size_t lengths for Poly1305 and
 ChaCha
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357142829.2624073.2124484665042168888.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:08 +0000
References: <20261014152604.323310-1-ebiggers@kernel.org>
In-Reply-To: <20261014152604.323310-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
 ardb@kernel.org, Jason@zx2c4.com, herbert@gondor.apana.org.au,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 vladimir@genproof.com
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to riscv/linux.git (fixes)
by Eric Biggers <ebiggers@kernel.org>:

On Wed, 14 Oct 2026 17:26:02 +0200 you wrote:
> This series upgrades the Poly1305 and ChaCha functions to use size_t
> lengths, matching the rest of the crypto library.
> 
> It also fixes the (not currently reached) handling of lengths above
> S32_MAX bytes, and (not currently known to matter in practice) the
> assembly functions depending on unspecified high register bits.
> 
> [...]

Here is the summary with links:
  - [1/2] lib/crypto: poly1305: Use size_t length
    https://git.kernel.org/riscv/c/0b58c136c2f9
  - [2/2] lib/crypto: chacha: Use size_t length
    https://git.kernel.org/riscv/c/e42003dba6dd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



