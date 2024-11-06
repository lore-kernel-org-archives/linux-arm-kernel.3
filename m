Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8A1D44D57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+XD5b/j4l1LpXHRmFhTFlV/KR9kc7R6kxjEC02Xq5c=; b=gJSRRSVkLCYfvjtNpCm1Er4n2w
	75LZ3io4Z0jS2kHZAOvC5xpk+eqkWu799Rjywcqk9S58xHx7/dQmlJOYIECDVuAtEuOUWMPs3wQ4G
	t3KBm9cdMN/oTkIa2KggL56r4A0DRLUd7TLcSY3S2px3mYABernplllJxDX0QYR2wHTO8RzIjTey4
	dfZPlkg+kFLEsnnQnn2lqRxmOSNFq2SZ/i81Iibwn0ZktUBoMJ7EtaBMUyytjuAikTYzFqmcBm3A1
	nUEOQCfdKwm2faBQQEsBxUFmpIC2tscIuUdQnPct8Fjj8NJzklNT0f1CT5fCMKLVyPQjuz6kW8YsK
	1ioeqX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8f5c-00000003B5X-2sdM;
	Wed, 06 Nov 2024 12:24:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eDw-00000002vQI-29fI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:29:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E256B1063;
	Wed,  6 Nov 2024 03:29:49 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5E933F6A8;
	Wed,  6 Nov 2024 03:29:18 -0800 (PST)
Date: Wed, 6 Nov 2024 11:29:16 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] kselftest/arm64: Correct misleading comments on
 fp-stress irritators
Message-ID: <ZytTDJOfFaynG1rp@J2N7QTR9R3>
References: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
 <20241023-arm64-fp-stress-irritator-v1-1-a51af298d449@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-arm64-fp-stress-irritator-v1-1-a51af298d449@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_032920_619215_655A3D5D 
X-CRM114-Status: GOOD (  17.76  )
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

On Wed, Oct 23, 2024 at 09:38:29PM +0100, Mark Brown wrote:
> The comments in the handlers for the irritator signal in the test threads
> for fp-stress suggest that the irritator will corrupt the register state
> observed by the main thread but this is not the case, instead the FPSIMD
> and SVE irritators (which are the only ones that are implemented) modify
> the current register state which is expected to be overwritten on return
> from the handler by the saved register state. Update the comment to reflect
> what the handler is actually doing.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  tools/testing/selftests/arm64/fp/fpsimd-test.S | 3 +--
>  tools/testing/selftests/arm64/fp/sve-test.S    | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> index 8b960d01ed2e0ef516893b68794078ddf8c01e1f..bdfb7cf2e4ec175fda62c1c2f38c6ebb1a1c48bf 100644
> --- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
> +++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> @@ -134,8 +134,7 @@ function check_vreg
>  	b	memcmp
>  endfunction
>  
> -// Any SVE register modified here can cause corruption in the main
> -// thread -- but *only* the registers modified here.
> +// Modify live register state, the signal return will undo our changes
>  function irritator_handler
>  	// Increment the irritation signal count (x23):
>  	ldr	x0, [x2, #ucontext_regs + 8 * 23]
> diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
> index fff60e2a25addfd4850ef71aa3cf6535ac880ffd..e3c0d585684df29723a49265f3df6d23817498c7 100644
> --- a/tools/testing/selftests/arm64/fp/sve-test.S
> +++ b/tools/testing/selftests/arm64/fp/sve-test.S
> @@ -291,8 +291,7 @@ function check_ffr
>  #endif
>  endfunction
>  
> -// Any SVE register modified here can cause corruption in the main
> -// thread -- but *only* the registers modified here.
> +// Modify live register state, the signal return will undo our changes
>  function irritator_handler
>  	// Increment the irritation signal count (x23):
>  	ldr	x0, [x2, #ucontext_regs + 8 * 23]
> 
> -- 
> 2.39.2
> 

