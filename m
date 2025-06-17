Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39167C71155
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 03:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bJLcDliW2oEXkgwVtekbLhDrVn7sZ0MvkZ1a8ih5GM=; b=foZzauKJ+0jQwB1kLetbIyQmuW
	peYsUKjMASq14/1Ko8k5K/uONDKHiwJOyKDJyXXPX5WD/e6iIld7ojcmu3QWZr02Vdmnmu7/3/uAe
	sEk83e6cRHL2Kj0DI0k8nM6UXbsbqWAQRyP6b1cp53K47oq2tJO0Lpw4Fy2DlWjFByk/53U4H4xBZ
	WVLEiyW3rZDBgbwqf1GtxPtPF9Fpwb2mtUr1SiCUFBcJYHxl5qUUnrP0UhYgGk6MZj/8D2HeQiKkO
	vxxxqqyuBG4adz7d8MJHhoDdq0vnV/geGFvOZQouTJYy+9HSifPdDlL0IlYTuItDrVHex7/MgzbYr
	EIgtAPEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRN1U-000000066aA-0Xsx;
	Tue, 17 Jun 2025 03:30:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRMz7-000000066Lk-1O63
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 03:27:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3EBCE5C5454;
	Tue, 17 Jun 2025 03:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384BDC4CEEA;
	Tue, 17 Jun 2025 03:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750130860;
	bh=p9lozJqVasI7Hf5gbpRsyMuAP/AKnTQ2rTPVzTMp/Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlEn4EuUiyvHT5r3KGOwbBww88XMxnyjpq9GCpOOIlxG137b+TAuYCeYh2kHdGYN9
	 7uLWsn69wJB/AMGKoyonVChKSIZFZ6mjpja6CKyRHJINMrEksBvGV5puzpzvUb7cFv
	 Gd8h6+xSpLvgBzkEn2ZPLULx5Px8pGie+p7hPsLpvSp2zojz3gfpHX7TBliU8d2tPx
	 tqfvy44EgJp3N7Vv3wlFRcFnbhcpCHRvVAySaSycWrph8u1QtOiJx38cziRy92Obxu
	 yrhtkwlwhVtD2mlQBhPG7aaZDTExTebi7N778WM/qFNKdaNyex5MSzQh+zVpMVLbvO
	 ap8wHmAdftDKg==
Date: Mon, 16 Jun 2025 20:27:10 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: Re: [PATCH] lib/crypto/poly1305: Fix arm64's poly1305_blocks_arch()
Message-ID: <20250617032710.GD8289@sol>
References: <20250616010654.367302-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616010654.367302-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_202741_464282_2B7863B2 
X-CRM114-Status: GOOD (  13.37  )
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

On Sun, Jun 15, 2025 at 06:06:54PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> For some reason arm64's Poly1305 code got changed to ignore the padbit
> argument.  As a result, the output is incorrect when the message length
> is not a multiple of 16 (which is not reached with the standard
> ChaCha20Poly1305, but bcachefs could reach this).  Fix this.
> 
> Fixes: a59e5468a921 ("crypto: arm64/poly1305 - Add block-only interface")
> Reported-by: Kent Overstreet <kent.overstreet@linux.dev>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/arm64/lib/crypto/poly1305-glue.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-fixes

- Eric

