Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC501CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9qxQsG9bhG663V13OZkQLZ9IOuyo0Eme92TAG30jsE=; b=3guIx1uRw1lPxdbS026kU0mnhA
	m7ZiKgaQcKyCnnQNdS6dheVCetu8vBhsoOM6SiZYNmFss2jWp8OGcKj9L2O22azwvF0IfscnuAHgx
	4X/eyBoCxbEl8VV5GO0bcD2O31sTzoDprlGaYMZpyhEQTQ1k6dvhmGKN+9CzHBGm6/ginuBtEvFcj
	GhGIazkH9FdKWkG9NrUE6/brKE+u4PoddsUDZMYIsfGGXuMxPlqFKI/DQS9L3ILUfRVLJHUroa0ZF
	aYRZjy/8i0HG8I44W2SSDM5lvA5kWkP79DidzLth8btRqkPpDHsrGEuXK5WC09xcHsd83pWgsfVnf
	SuxMC/jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrux-00000007WBn-0Zax;
	Tue, 11 Nov 2025 17:12:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIruw-00000007WBc-1AeN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 17:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 676F860202;
	Tue, 11 Nov 2025 17:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F73C116D0;
	Tue, 11 Nov 2025 17:12:26 +0000 (UTC)
Date: Tue, 11 Nov 2025 17:12:23 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
	ebiggers@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <keescook@chromium.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 00/21] arm64: Move kernel mode FPSIMD buffer to the
 stack
Message-ID: <aRNudxVu_qNjk0I0@arm.com>
References: <20251031103858.529530-23-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
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

On Fri, Oct 31, 2025 at 11:38:59AM +0100, Ard Biesheuvel wrote:
> Ard Biesheuvel (21):
>   crypto/arm64: aes-ce-ccm - Avoid pointless yield of the NEON unit
>   crypto/arm64: sm4-ce-ccm - Avoid pointless yield of the NEON unit
>   crypto/arm64: sm4-ce-gcm - Avoid pointless yield of the NEON unit
>   arm64/simd: Add scoped guard API for kernel mode SIMD
>   ARM/simd: Add scoped guard API for kernel mode SIMD
>   crypto: aegis128-neon - Move to more abstract 'ksimd' guard API
>   raid6: Move to more abstract 'ksimd' guard API
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
>   net/mlx5: Switch to more abstract scoped ksimd guard API on arm64
>   arm64/fpu: Enforce task-context only for generic kernel mode FPU
>   arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack

For the series, especially the arm64 bits:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Since most of this is crypto library changes, I'm fine for it to go
upstream via your tree but please keep it on a stable branch in case we
need to solve any conflicts.

Thanks.

-- 
Catalin

