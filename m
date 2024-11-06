Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02A4D44D55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jq7eq6J687ITHpMVh8ENY+vCfx80uGExjZvkf0oO6UU=; b=zlLQO6jOIHAC6QU3T1PId0I5sb
	wEIrXFkSxjR84/ZIJJ+vJP6/1RZgDNvO+VnsXLBcb2EUXnSUGh8NzszSNIU1dsup4oIL4+qtZDbA1
	inWHm+CYIM+OX9gludYukwECmoGYJq8bkJu9RstegRwg04bYVb8agCe00I/5KRU4nzFq7YbAymIqx
	g0m7Wpzciwwxsi4DH5cFY/V+J/lWspkV+axJOrvFpcJlfiWard/Ft9WzP8T7Az6UXYZobcXEC0RJw
	L+afUuWhRfH66J81rziyBnUkrF17wU2G41LZnZRJxnLJBA2CPWvdhaKEM12OLLXnldEFt/ZmShMGK
	R/6GtP6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8el7-000000035dZ-3oE0;
	Wed, 06 Nov 2024 12:03:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eFu-00000002vmL-1PVZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:31:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA94F1063;
	Wed,  6 Nov 2024 03:31:51 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8209C3F6A8;
	Wed,  6 Nov 2024 03:31:20 -0800 (PST)
Date: Wed, 6 Nov 2024 11:31:17 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] kselftest/arm64: Implement irritators for ZA and ZT
Message-ID: <ZytThS7U3u-uqkSC@J2N7QTR9R3>
References: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
 <20241023-arm64-fp-stress-irritator-v1-4-a51af298d449@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-arm64-fp-stress-irritator-v1-4-a51af298d449@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_033122_454146_CDB8682D 
X-CRM114-Status: GOOD (  18.33  )
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

On Wed, Oct 23, 2024 at 09:38:32PM +0100, Mark Brown wrote:
> Currently we don't use the irritator signal in our floating point stress
> tests so when we added ZA and ZT stress tests we didn't actually bother
> implementing any actual action in the handlers, we just counted the signal
> deliveries. In preparation for using the irritators let's implement them,
> just trivially SMSTOP and SMSTART to reset all bits in the register to 0.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  tools/testing/selftests/arm64/fp/za-test.S | 12 ++++--------
>  tools/testing/selftests/arm64/fp/zt-test.S | 12 ++++--------
>  2 files changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
> index 1ee0ec36766d2bef92aff50a002813e76e22963c..f902e6ef9077bfa34fa7f85ce572ce3df4346789 100644
> --- a/tools/testing/selftests/arm64/fp/za-test.S
> +++ b/tools/testing/selftests/arm64/fp/za-test.S
> @@ -148,20 +148,16 @@ function check_za
>  	b	memcmp
>  endfunction
>  
> -// Any SME register modified here can cause corruption in the main
> -// thread -- but *only* the locations modified here.
> +// Modify the live SME register state, signal return will undo our changes
>  function irritator_handler
>  	// Increment the irritation signal count (x23):
>  	ldr	x0, [x2, #ucontext_regs + 8 * 23]
>  	add	x0, x0, #1
>  	str	x0, [x2, #ucontext_regs + 8 * 23]
>  
> -	// Corrupt some random ZA data
> -#if 0
> -	movi	v0.8b, #1
> -	movi	v9.16b, #2
> -	movi	v31.8b, #3
> -#endif
> +	// This will reset ZA to all bits 0
> +	smstop
> +	smstart
>  
>  	ret
>  endfunction
> diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
> index ade9c98abcdafc2755ef4796670566d99e919e5c..c96cb7c2ad4b406c54099fe3f73917259bd947e4 100644
> --- a/tools/testing/selftests/arm64/fp/zt-test.S
> +++ b/tools/testing/selftests/arm64/fp/zt-test.S
> @@ -117,20 +117,16 @@ function check_zt
>  	b	memcmp
>  endfunction
>  
> -// Any SME register modified here can cause corruption in the main
> -// thread -- but *only* the locations modified here.
> +// Modify the live SME register state, signal return will undo our changes
>  function irritator_handler
>  	// Increment the irritation signal count (x23):
>  	ldr	x0, [x2, #ucontext_regs + 8 * 23]
>  	add	x0, x0, #1
>  	str	x0, [x2, #ucontext_regs + 8 * 23]
>  
> -	// Corrupt some random ZT data
> -#if 0
> -	movi	v0.8b, #1
> -	movi	v9.16b, #2
> -	movi	v31.8b, #3
> -#endif
> +	// This will reset ZT to all bits 0
> +	smstop
> +	smstart
>  
>  	ret
>  endfunction
> 
> -- 
> 2.39.2
> 

