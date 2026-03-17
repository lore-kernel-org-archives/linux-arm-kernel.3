Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774D9F3383D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrM1dZaDUTVl4/JXFyuHCBOawOyBf912x/nVczXv2gQ=; b=abfuzr31V27p33pVXQKhPWSjFm
	h5gZbV36g5OUQ7mD4BtBgYdLPgYyhgZ1DFxyprgYbWxaTWWduRUy8Dn3M+48Ylyp7pc3cAoQbZ7Er
	W9xBnEFAK+QcF5Tp1i841CWJokTLyxsyEI1S9KV3D9Gd6es3dPmfwm0WGj3EVXrcWLhIeb5XdhNo6
	IJVvDgcLJE5/r9FvG5T1OnNSloQoH6TuAc5tx1TUIQMaCkAQwStsQktQVfrVLeUXTtXiWGQtVNRUT
	9st2iEwWvAVJKOK4dNMxcK2ovEZTtKSzNdTSqF7W4Qbt6OykgNfXN6TzyfYZIx+qQ2bCI7nE6ZvBw
	8Ky9JwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Vfp-00000006eXg-0vrj;
	Tue, 17 Mar 2026 14:45:33 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Vfm-00000006eWz-48R0;
	Tue, 17 Mar 2026 14:45:31 +0000
Date: Tue, 17 Mar 2026 07:45:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] lib/crypto: arm64: Drop checks for
 CONFIG_KERNEL_MODE_NEON
Message-ID: <ablpCtKCV5goM_AD@infradead.org>
References: <20260314175049.26931-1-ebiggers@kernel.org>
 <38a37b02-602a-42a4-8974-b8a6cd750c3e@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38a37b02-602a-42a4-8974-b8a6cd750c3e@app.fastmail.com>
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

On Tue, Mar 17, 2026 at 12:09:34PM +0100, Ard Biesheuvel wrote:
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> 
> Actually, we should just get rid of CONFIG_KERNEL_MODE_NEON entirely on arm64, although there is some code shared with ARM that would still need some checks. But anything that is arm64-only should never look at this at all.

I'll also drop it from the XOR series.

Talking about which (sorry for highjacking this thread), arm32 and arm64
have completely different neon XOR implementations, where arm32 uses
#pragma GCC optimize "tree-vectorize" or clang auto-vectorization of
the generic C implementation, and arm64 uses intrinsics.  Is there any
chance those could share a single implementation?


