Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A00ECCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 20:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cW5dsmot/FHOfmFl0NZngLfpsUPiJwk/x+XGomm7S+U=; b=wcbUsNlo16gUwvyKwRR1wbU13z
	XEaGMTZXKUdlceKz6UaagS+8FrDGUBwmXOJZyRDBUyMotNSVE32GiS3YSFKCQIfuOeSbyb31NnN5Y
	UeOj7eWSPBdu7CxMuG5oQBsSOfReyqzjryJTGqtygXs+YqsumUs2zvR8fDhGSqHBuyglzBpQXKXKb
	BoPAHnfO9eeuJOmr0nxbFH6VDpDXu21J9U5AxrtcCxILGNfWK/3ZxknagynPEcJHmtNDWKrHGUFWT
	QYplroArAEzHB64h6lYfOUmbLwEU6oKFf1SZDM5789kPW4coNiqWRLrOeiZpO6PPik+UBANyltnUK
	7Vas5Xrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mOd-0000000D5f7-2LP6;
	Fri, 03 Oct 2025 20:28:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mOb-0000000D5eg-065R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 20:28:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EADCA458F5;
	Fri,  3 Oct 2025 20:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7BDC4CEF5;
	Fri,  3 Oct 2025 20:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759523331;
	bh=7TtwZs3DmPv30Yl96eKnE5YiLSOUEgOMMAjocXogTbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qYX27rqcewLkT6w2pLiIvL0EQzeFeY/384GYHpgexiBTUOZFYHb09BJpvY3jncXuv
	 96vD/f8crQ5hRQJRG7GDd9m5SVBEqMmecn0GWI8gU6Bu06Jr9Qj9Et7Q4DVBHupWLR
	 GFQzSKbc50bm7YwGqZdK7pTrzzOBy1ue78pCDcGpKHlOn9uK39AS40cMIlDnZv/V/O
	 miHZbq2WyJJACCOjQLaTD82hpqmDxcRrD4qzasI1o71o6Lli4ST6W8rH2IQ5sUEgWv
	 3+/2C10wgEJlU77l3M8s6iNuhfAcrqaoaORmTJSkqECviX5xe4LqjitXtbc94ZMoja
	 +eFvQwPW4sjMA==
Date: Fri, 3 Oct 2025 13:28:49 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
	linux@armlinux.org.uk, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 00/20] arm64: Move kernel mode FPSIMD buffer to the
 stack
Message-ID: <20251003202849.GB24598@quark>
References: <20251001210201.838686-22-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_132853_102797_5A80552B 
X-CRM114-Status: GOOD (  17.82  )
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

On Wed, Oct 01, 2025 at 11:02:02PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Move the buffer for preserving/restoring the kernel mode FPSIMD state on a
> context switch out of struct thread_struct, and onto the stack, so that
> the memory cost is not imposed needlessly on all tasks in the system.
> 
> Changes since v1:
> - Add a patch reverting the arm64 support for the generic
>   kernel_fpu_begin()/end() API, which is problematic on arm64.
> 
> - Introduce a new 'ksimd' scoped guard that encapsulates the calls the
>   kernel_neon_begin() and kernel_neon_end() at a higher level of
>   abstraction. This makes it straight-forward to plumb in the stack
>   buffer without complicating the callers.
> 
> - Move all kernel mode NEON users on arm64 (and some on ARM) over to the
>   new API.
> 
> - Add Mark's ack to patches #6 - #8
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Eric Biggers <ebiggers@kernel.org>
> 
> Ard Biesheuvel (20):
>   arm64: Revert support for generic kernel mode FPU
>   arm64/simd: Add scoped guard API for kernel mode SIMD
>   ARM/simd: Add scoped guard API for kernel mode SIMD
>   crypto: aegis128-neon - Move to more abstract 'ksimd' guard API
>   raid6: Move to more abstract 'ksimd' guard API
>   crypto/arm64: aes-ce-ccm - Avoid pointless yield of the NEON unit
>   crypto/arm64: sm4-ce-ccm - Avoid pointless yield of the NEON unit
>   crypto/arm64: sm4-ce-gcm - Avoid pointless yield of the NEON unit
>   lib/crc: Switch ARM and arm64 to 'ksimd' scoped guard API
>   lib/crypto: Switch ARM and arm64 to 'ksimd' scoped guard API
>   crypto/arm64: aes-ccm - Switch to 'ksimd' scoped guard API
>   crypto/arm64: aes-blk - Switch to 'ksimd' scoped guard API
>   crypto/arm64: aes-gcm - Switch to 'ksimd' scoped guard API
>   crypto/arm64: nhpoly1305 - Switch to 'ksimd' scoped guard API
>   crypto/arm64: polyval - Switch to 'ksimd' scoped guard API
>   crypto/arm64: sha3 - Switch to 'ksimd' scoped guard API
>   crypto/arm64: sm3 - Switch to 'ksimd' scoped guard API
>   crypto/arm64: sm4 - Switch to 'ksimd' scoped guard API
>   arm64/xorblocks:  Switch to 'ksimd' scoped guard API
>   arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack

Reviewed-by: Eric Biggers <ebiggers@kernel.org>

- Eric

