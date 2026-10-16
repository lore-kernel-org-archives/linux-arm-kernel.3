Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BF4CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 07:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNp2YJ+Y5SdErw6Ab/y3hbdW6rjh1/wNUfCJcAk2cKA=; b=YAwT4Q8bSAAySqg9UpU1UfNFfw
	MCG+i0mzoFcspx39EWJFCjzy2xaODz+EQdukPe7HnqmUaMnEHLE11vFS0pPfmwUThYR+R7jKMM/Ql
	t5FlDV7Dgs529u6FUUzPFR2nvNiIGRM3HUU4oOpIfmz62T9uQ8ls1q0RL/oDhFU+cU46SzLqQP/uE
	M4m9Ohvi9wI7xMda0eWyU9xOKAhCiQvSU6Nz0eHcw107W/ilO0+koQh+RUm+Nd8pzXspvYBavSmnG
	vGiUUXwug+j1tSn9tbI697nqUi0RKyfLDpTh0T9mhZTE00IWrnmpGYnGJ4snD+FvWDD4xI2CjGFpf
	tl7ySRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcMh-00000002EFP-3y3N;
	Fri, 16 Oct 2026 07:28:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcMg-00000002EEz-46A0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 07:28:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55D66405F5;
	Fri, 16 Oct 2026 07:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08EA31F000C4;
	Fri, 16 Oct 2026 07:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792135710;
	bh=pNp2YJ+Y5SdErw6Ab/y3hbdW6rjh1/wNUfCJcAk2cKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IUlNv2twofde6OmdwgX786C3KNvkem9kuBGw1lCo2lnm+eIpsdXcfaMLk+CreWsvW
	 DsgVgHoxzAyBif6qAgd5GW9/qD6lerklm9+LuLckfyfkfaBWr7uavBKIUBCuZlkhqR
	 hBsRvePQvTeLm/9poxnL+q2Eb40Tz1F2DHxxkI6i2Kxs+7WFY7FPUh5EGPnvBxmW6F
	 GMp9tiUS5RcE/lFpzc7HwdAlIjagFtlti4+slHwJrmwoSor0zWIyFdu0k6lV/gFp1J
	 JrVKetcWrXMSX1hCxSu3hdr4Ow+81BfRouH9LFuBYTnO918q870Zv0UBDp/mrSvSyF
	 IhW/+bjVhZYTg==
Date: Fri, 16 Oct 2026 00:28:28 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: vladimir@genproof.com
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/2] lib/crypto: chacha: Handle lengths of 2 GiB or more
 on 32-bit arm and MIPS
Message-ID: <20261016072828.GB3049@sol>
References: <20261014-libcrypto-chacha-32bit-2gib-v1-0-e0719ca0be89@genproof.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-libcrypto-chacha-32bit-2gib-v1-0-e0719ca0be89@genproof.com>
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

On Wed, Oct 14, 2026 at 08:34:20PM +0000, Vladimir Kukharenko via B4 Relay wrote:
> On 32-bit arm (the scalar code) and 32-bit MIPS, the ChaCha assembly
> treats the length as signed, so lengths of 2 GiB or more are still
> mishandled after "lib/crypto: chacha: Use size_t length", since size_t
> is 32 bits there.
> 
> Patch 1 makes the arm assembly use unsigned conditions.  The MIPS
> assembly relies on the sign of the remaining length, so patch 2 instead
> limits each call to 1 GiB from C.
> 
> This applies on top of
> https://lore.kernel.org/r/20261014152604.323310-1-ebiggers@kernel.org
> Feel free to fold these into your series instead.
> 
> Tested with the lib/crypto KUnit tests in QEMU on arm (Cortex-A7 and
> Cortex-A15) and 32-bit MIPS, plus a temporary 2 GiB test on the
> Cortex-A7 and QEMU user mode runs of the MIPS assembly.
> 
> An LLM review found these bugs; I used an LLM-based assistant to write
> the patches and reviewed its work.
> 
> ---

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

