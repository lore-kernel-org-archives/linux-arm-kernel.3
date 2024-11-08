Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E847BD64063
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JE0GSwlkYzghROMjefZUEg1S4zGrQPNPuyNiRYpsMGY=; b=OJ0gik/6XnYZc+0YExw+XtrNNx
	1PiQ0MVSmXY/z0CWeqr2Aq2vynFtRENqk+NKzSmROGAttQl4K96lQrIWYwvOL4JyVTNZNBjfaPWGc
	5pDa/EVdB1rtUcGKQCTJlxQ8zSBz+D+VdFXAqVSyic7FH1g06iI8hFEk7/r0cEAwos1rFyVE45jjY
	fCbI72+YdkbCJuWUPOVlQJVViiM5RFT+uCJ7WKqDhzLKk29l7ThsGRVrsUd3ealxmTTel8cqNE+IM
	C11lXcOjs6ZGCAqW3rJyNMFtBmrb2RW0p8Q2itftoRbgRvFkLcdjhXL+yjj9CeOcWolFc9o2f6RkG
	G9CxSnCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rto-0000000BDHW-2KsG;
	Fri, 08 Nov 2024 16:31:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Qty-0000000B1NZ-3xGT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:28:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD8BF5C5C73
	for <linux-arm-kernel@lists.infradead.org>; Fri,  8 Nov 2024 15:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D8FC4CECD;
	Fri,  8 Nov 2024 15:27:56 +0000 (UTC)
Date: Fri, 8 Nov 2024 15:27:54 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Fix build with stricter assemblers
Message-ID: <Zy4t-tHV18D6BrXJ@arm.com>
References: <20241108-arm64-selftest-asm-error-v1-1-7ce27b42a677@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-arm64-selftest-asm-error-v1-1-7ce27b42a677@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_072759_042524_753F04C0 
X-CRM114-Status: GOOD (  20.51  )
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

On Fri, Nov 08, 2024 at 03:20:46PM +0000, Mark Brown wrote:
> While some assemblers (including the LLVM assembler I mostly use) will
> happily accept SMSTART as an instruction by default others, specifically
> gas, require that any architecture extensions be explicitly enabled.
> The assembler SME test programs use manually encoded helpers for the new
> instructions but no SMSTART helper is defined, only SM and ZA specific
> variants.  Unfortunately the irritators that were just added use plain
> SMSTART so on stricter assemblers these fail to build:
> 
> za-test.S:160: Error: selected processor does not support `smstart'
> 
> Switch to using SMSTART ZA via the manually encoded smstart_za macro we
> already have defined.
> 
> Fixes: d65f27d240bb ("kselftest/arm64: Implement irritators for ZA and ZT")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/fp/za-test.S | 2 +-
>  tools/testing/selftests/arm64/fp/zt-test.S | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
> index 95fdc1c1f228221bc812087a528e4b7c99767bba..9c33e13e9dc4a6f084649fe7d0fb838d9171e3aa 100644
> --- a/tools/testing/selftests/arm64/fp/za-test.S
> +++ b/tools/testing/selftests/arm64/fp/za-test.S
> @@ -157,7 +157,7 @@ function irritator_handler
>  
>  	// This will reset ZA to all bits 0
>  	smstop
> -	smstart
> +	smstart_za

And is smstop ok for assemblers? I think I got the error first on
smstop with my toolchain.

-- 
Catalin

