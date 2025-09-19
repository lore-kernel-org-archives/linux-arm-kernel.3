Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDD8CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 19:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umDLzibyRODn1on2clrmBiY/yeDt8Ko37tfA+DwYKlQ=; b=gAXHzBVR9otUUW0293sw4pdcPI
	R5KasE9Kgv7Ybk1+KXzYEaUlW7RF4MHb5zGkZ2Mb8dFivRcd8flXkUvLKqL9wwp6qcQstqV6sn5JJ
	XalZW01+yBjvCZSjkSjTQki1t7vYK+JzmicdJW1rv/wQdfi46HnE847Zl3tzcTsVieAuLWNlt0rq0
	cWHrlSeaJzrqndGubU69mjvvSQgkf6ItagoQT9eWlWndMsIcW7cQLaECwI7nkO9IJCgwf586cMvUE
	6jIbYgTz+0WBLoPqx4w5/spzz0U0krrlwyHNPuXkt87BkvFpqRCJ9leCs/avzDreeGOMu0bF7Jm46
	a9rx0P8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgqK-00000003uLV-2l2P;
	Fri, 19 Sep 2025 19:32:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgqJ-00000003uLN-08NM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 19:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BE4160140;
	Fri, 19 Sep 2025 19:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07598C4CEF0;
	Fri, 19 Sep 2025 19:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758310345;
	bh=Q4PEuEuP9alXqKgQvbxJXKjAtS2HMA+4AJTY/GWd7HI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pgi9APbbq/5rG7Ho2J+TZJGVkq0W10UPMkV2zbAclCur7Yzs+JdYB0hM6X2u2i3HP
	 IqxlioxzxNjshOFUgcQ6MMPJCvAm1L/aS8fva/rK3xgGEyv1evQY+lKGOv9iLfTJW+
	 PmodCLjEoKLgErL9k0J4bO/3yv1SSWkFe38PBY8G6v/Ti+XS6AvZMOGkuOveTF/61c
	 +ruGnQQS7vbuByVzAbe15qbNWNWgdpCd52SJWvCOW3mzTSbY8QTRmHjefxzkbfgJgQ
	 Lv2QGTOJ7yKk3E2GWAVY4O9sPkWiY8EzWq8ZEl0ONR5VpUjaXk5bhB2EMCTF9O+Vkp
	 8+PAuWAXcY94g==
Date: Fri, 19 Sep 2025 14:32:21 -0500
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/5] arm64: Move kernel mode FPSIMD buffer to the stack
Message-ID: <20250919193221.GB2249@quark>
References: <20250918063539.2640512-7-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918063539.2640512-7-ardb+git@google.com>
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

On Thu, Sep 18, 2025 at 08:35:40AM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Move the buffer for preserving/restoring the kernel mode FPSIMD state on a
> context switch out of struct thread_struct, and onto the stack, so that
> the memory cost is not imposed needlessly on all tasks in the system.
> 
> Patches #1 - #3 contains some prepwork so that patch #4 can tighten the
> rules around permitted usage patterns of kernel_neon_begin() and
> kernel_neon_end(). This permits #5 to provide a stack buffer to
> kernel_neon_begin() transparently, in a manner that ensures that it will
> remain available until after the associated call to kernel_neon_end()
> returns.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Mark Brown <broonie@kernel.org>
> 
> Ard Biesheuvel (5):
>   crypto/arm64: aes-ce-ccm - Avoid pointless yield of the NEON unit
>   crypto/arm64: sm4-ce-ccm - Avoid pointless yield of the NEON unit
>   crypto/arm64: sm4-ce-gcm - Avoid pointless yield of the NEON unit
>   arm64/fpsimd: Require kernel NEON begin/end calls from the same scope
>   arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack
> 
>  arch/arm64/crypto/aes-ce-ccm-glue.c |  5 +--
>  arch/arm64/crypto/sm4-ce-ccm-glue.c | 10 ++----
>  arch/arm64/crypto/sm4-ce-gcm-glue.c | 10 ++----
>  arch/arm64/include/asm/neon.h       |  7 ++--
>  arch/arm64/include/asm/processor.h  |  2 +-
>  arch/arm64/kernel/fpsimd.c          | 34 +++++++++++++-------
>  6 files changed, 34 insertions(+), 34 deletions(-)

This looks like the right decision: saving 528 bytes per task is
significant.  528 bytes is a lot to allocate on the stack too, but
functions that use the NEON registers are either leaf functions or very
close to being leaf functions, so it should be okay.

The implementation is a bit unusual, though:

   #define kernel_neon_begin()	do { __kernel_neon_begin(&(struct user_fpsimd_state){})
   #define kernel_neon_end()	__kernel_neon_end(); } while (0)

It works, but normally macros don't start or end code blocks behind the
scenes like this.  Perhaps it should be more like s390's
kernel_fpu_begin(), where the caller provides the buffer that the
registers are stored in?  

- Eric

