Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAF8C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 12:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8f4t4nt9rsCTVCnIU404yqWxVU1T55YRezryjfEQVE=; b=EeaEo/BECviTE5mtjU5AwYbvzX
	Kp5OXH68hq29r1s+85Sn09p5HPQJMbTP3v2JXcNvPgQfc5eR397DeZtofwbF+WLtPkd/RPh/IKneY
	Y/wzbJR4EfnuYNNLmip2s85Xen1JEyz7uO5s7uqMiFMDhhOyLA85PftYnyL1jG4so8DTbcHN9YCGF
	oou+0ohWEJ7cyqjru51yIqKxzBI92H5+Yh4HmkiiaZph35JJZknCG1+aORRoJr28ExW6hDsYWjVsO
	Itrz8EKbmiYtd6IdA/XNVt+Lux/EXAItDe2A0oF+E+ITcgyNDHAZuKuZF7TIvhKgCe6prCx6gnaya
	3vVkNjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u91Fz-00000003Uif-1ABz;
	Sun, 27 Apr 2025 12:37:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u91Dz-00000003UPZ-2gGh;
	Sun, 27 Apr 2025 12:35:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2469BA41B78;
	Sun, 27 Apr 2025 12:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C871EC4CEE3;
	Sun, 27 Apr 2025 12:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745757309;
	bh=+fG06d9jSSQdeLJWYT8qSWyP0TU2u5CifNzbFJ/XfgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/bC3K8gVx5897sx0m9B41J6wHjyFDFZgASHs9iyreaRRk2MKpyYUHIChH0IMZ+YE
	 CzZkzcFERGfABqvMeyokm38y2VZH1t5PXI3jqlNLj31O6QzfV4ZyHuWpQD5SufL8sh
	 rMNwaM4baXS3hhq65SxgADqCkLMyuW5V/NMVsX9ArKa0gLMzlxZ3ipvrpf8J83tU+o
	 uflwveBrQ+n/Bix3Mc+6fn73BsQynQkFCU+yjw5oweub/OLg/mgN4a2AvYIkGcsQxu
	 WG/oK62LsN1zFPX/8VNMqn7nvg/p7bTy/cbZYyeFB1PCxyrBqaBIAWTWK+La5mkmHu
	 OvCP4g5GpgVHQ==
Date: Sun, 27 Apr 2025 05:35:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [v2 PATCH 00/13] Architecture-optimized SHA-256 library API
Message-ID: <20250427123514.GA1161@quark>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1745734678.git.herbert@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_053511_745215_89587BD6 
X-CRM114-Status: GOOD (  12.15  )
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

On Sun, Apr 27, 2025 at 02:30:41PM +0800, Herbert Xu wrote:
> Changes in v2:
> - Rebase on top of lib partial block helper series.
> - Restore the block-only shash implementation of sha256.
> - Move the SIMD hardirq test out of the block functions so that
>   it is only done for the lib/crypto interface.
> - Split the lib/crypto sha256 module to break cycle in allmod build.
> 
> This is based on
> 
> 	https://patchwork.kernel.org/project/linux-crypto/list/?series=957415

Well, barely a day and you've already ruined my patch series.  Now instead of a
clean design where the crypto_shash API is built on top of the normal library
API (sha256_update() etc.), there's now a special low-level API
"sha256_choose_blocks()" just for shash that it's built on top of instead, for
no good reason.  You're also still pushing your broken BLOCK_HASH_UPDATE_BLOCKS
macro that doesn't work with size_t, and putting my name on your broken code
that uses it.

And yes, sorry about the allmodconfig build error.  It just means that the
generic code needs to be split into its own module, like how curve25519 works.
I'll post a new version with that fixed and your gratuitous changes undone.

- Eric

