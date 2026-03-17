Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A58FED9EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 16:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkfocY0RvAp8VLBBiNpSb5x2UGuioYu71nL5b1bhHs4=; b=wVJrasGsfaQPNpE6B61BycLnYR
	0P6CNy42zbKj5QsHCMvAXhFEMICOnkEJSNLfsgLs0LfbnIAcB8xT6ougtur8bpPSK1Sb/onM5Npw1
	IcLfxDar4GxzNVdLcpgHNV2ySUJy9jFvkSHvtdSv8DOyMo9NTT7PFOJNZIQXnHyIxzTQkfVWlZ2fV
	ijkhcBgNGU2v6of7nDzgmAAScH39tqDJhUTNM3GZJBBTk1+9skcGpyfsleoIohXgAvMhL/Y+4Oxsg
	ITQ1GMKgZ5dSyHkzfPMy9xElNqYKkSm78N9+7lz3PKR2nJTfGScf8mhrujeOOhWp9kyvdU6SnDDhl
	ItI5AJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XTo-00000006qne-2Jfq;
	Tue, 17 Mar 2026 16:41:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XTl-00000006qm0-1u1u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 16:41:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D35D160128;
	Tue, 17 Mar 2026 16:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4EFC2BC86;
	Tue, 17 Mar 2026 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773765672;
	bh=UXz9k9VacabS+9Bo/BKg4HLMwnU4iYW2qe69lmOgkWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vFYKatUqNCjLiyvVwY3IdzCctHgHNpYSdIRzHjHzhN2vmsk/hsUbBAfmxQdocVw5s
	 vK08CW78J4QahmBUwMmSW4SHBrphHksMkFc37FJQkQ9YIKdxSseEQQ7eLJ0YKZW3NG
	 XZPmRcTQgp6c/3A/Mmj6NCY91TpxCgIDO1BJ7J7QsdSItIO8Tcp3hS5yJGKUiUALta
	 cUXM01vwgklwbRzLTl3fz+m7P7TZ2pSYqHVLe8ntdXBNakl5ZnynpRJqFoAkQKPkSU
	 CXZl0ZuO35BaPpRuNvwWbVTNtI6GDVU7m+nFd/kseWtCaPu00KeminWOaqhRF7tlwF
	 Yumy2M2vy3SlQ==
Date: Tue, 17 Mar 2026 09:40:12 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] lib/crypto: arm64: Drop checks for
 CONFIG_KERNEL_MODE_NEON
Message-ID: <20260317164012.GD6226@sol>
References: <20260314175049.26931-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314175049.26931-1-ebiggers@kernel.org>
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

On Sat, Mar 14, 2026 at 10:50:49AM -0700, Eric Biggers wrote:
> CONFIG_KERNEL_MODE_NEON is always enabled on arm64, and it always has
> been since its introduction in 2013.  Given that and the fact that the
> usefulness of kernel-mode NEON has only been increasing over time,
> checking for this option in arm64-specific code is unnecessary.  Remove
> these checks from lib/crypto/ to simplify the code and prevent any
> future bugs where e.g. code gets disabled due to a typo in this logic.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
> 
> This patch is targeting libcrypto-next
> (https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next)

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

