Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D654CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwfaiIviYhAwPFxC0YiWKeO93qdMZ+KlmuO1DQFzdcg=; b=W1jVzX/IG7aOmqFmgiaPyEKoHW
	ovSq5493Kuty1eCwABmv736e09s4yuQBFoYbwkF+2wWSbiFQtIMASRn3PAeKfnU5UTOkFHalG5V/j
	S0bSdJsteBTCFjI/il15h5C18GRuK8bHdB+NkXPOyY2AZWPGrJKcdbIu5BsZpdvHVsEevVCWHMlEX
	3INmA1pkqDCltVcWMlmXMXdfLkpWmMsF5IfewXIYhn3TswTniOYMdgranRfl7de5FEq+GmEq2zCYh
	hxDs/DD3SwykjxDFaSjVEU7z6bLbJUt+C10S83VbWjvHYrIp6z+nrs9eG8+iYdXDwv6QAfdtDwdGy
	WHn2aFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBagJ-000000042w9-2H7G;
	Tue, 29 Sep 2026 16:27:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBagI-000000042vI-0Vuk
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 16:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qwfaiIviYhAwPFxC0YiWKeO93qdMZ+KlmuO1DQFzdcg=; b=AeTu/YKgI3LElJNgzSaoQinAe1
	ZebXf8AMKw+j8EPqiacJvEFenJYICJLKtmJE73SdJAjnVfYSp2zS3T9lSM+lbcDBon6HLF8ywRcV4
	GIe7ll2FbYrkAWtbDmPYPMRcE50FRxA+L0+rPda3O21bJwQhJFF6jzvF29v3ykoZ33DEUqDkIAGXT
	GifK636RgxSWu+WPQCZnx2FPUoNpQm4IyVZyTeapk0y3SU0le7UzFOpxG6dKT4HLEHmQYoAC3fV7j
	qXyWIgHPTiRQkLKNzSwUx48YXh6rThcTBF7WkNlXXefAKeNQ074t31h6U1pHPKSNeUpnxzsYxrM1t
	aK4tamiQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBag6-00000002qc2-3M1a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:27:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E3ED1516;
	Tue, 29 Sep 2026 09:27:31 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42EF53F85F;
	Tue, 29 Sep 2026 09:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790699255; bh=f+toKPxTkGskuYP4BIAoBwY0gM1JTizLIKbQIY6XvLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfLzuTyaXU010of07I75FH3lL4Coynai8PZ2wFNavd8Ces8RJ4ImO/+ytxcQJq88z
	 kuxsp2k8s137nhkan9jywVpwOu0ATqD1Q1VAAcKeUA6QJxhLh8KCpZ3cP4ilakLqjE
	 qe5mTt/LJzYFTDqH/oywNbKlACZMMCcMQV21rpQg=
Date: Tue, 29 Sep 2026 17:27:28 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/11] kselftest/arm64: Move exit calls out of fp-stress
 loads
Message-ID: <arvm8O6kL1I9Plrw@J2N7QTR9R3.cambridge.arm.com>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-3-31bce995b49b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-3-31bce995b49b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_172740_150182_91C280EC 
X-CRM114-Status: GOOD (  18.89  )
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

On Tue, Sep 01, 2026 at 06:06:43PM +0100, Mark Brown wrote:
> When they detect corruption the fp-stress test loads print load specific
> diagnostics and exits with a failure status.  In preparation for
> building versions intended to run as KVM guests factor the exits into
> asm-utils-linux.S.
> 
> No functional change.

This is a good cleanup, but I do think it'd be worth noting that some of
the existing asm was wrong and worked by coincidence.

I did mention that in the patches I linked you to a while back:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=922d15ef46cb486a79f168949e103f6df26f4fba

Mark.

> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/fp/asm-utils-linux.S | 8 ++++++++
>  tools/testing/selftests/arm64/fp/fpsimd-test.S     | 4 +---
>  tools/testing/selftests/arm64/fp/sve-test.S        | 8 ++------
>  tools/testing/selftests/arm64/fp/za-test.S         | 8 ++------
>  tools/testing/selftests/arm64/fp/zt-test.S         | 4 +---
>  5 files changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/tools/testing/selftests/arm64/fp/asm-utils-linux.S b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
> index 3effeb1fbf50..9cd31dc47709 100644
> --- a/tools/testing/selftests/arm64/fp/asm-utils-linux.S
> +++ b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
> @@ -84,3 +84,11 @@ function tickle_handler
>  	ret
>  endfunction
>  .globl	tickle_handler
> +
> +// Terminate the program, reporting failure.  Does not return.
> +function exit_error
> +	mov	x0, #1
> +	mov	x8, #__NR_exit
> +	svc	#0
> +endfunction
> +.globl	exit_error
> diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> index 9db7b5419397..5ee8ef51ea4e 100644
> --- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
> +++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> @@ -298,7 +298,5 @@ function barf
>  	bl	dumphex
>  	puts	"]\n"
>  
> -	mov	x8, #__NR_exit
> -	mov	x1, #1
> -	svc	#0
> +	b	exit_error
>  endfunction
> diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
> index 2aadb5c3c0f3..3447fe0e5554 100644
> --- a/tools/testing/selftests/arm64/fp/sve-test.S
> +++ b/tools/testing/selftests/arm64/fp/sve-test.S
> @@ -543,9 +543,7 @@ function vl_barf
>  	mov	x0, x10
>  	bl	putdecn
>  
> -	mov	x8, #__NR_exit
> -	mov	x1, #1
> -	svc	#0
> +	b	exit_error
>  endfunction
>  
>  function svcr_barf
> @@ -555,7 +553,5 @@ function svcr_barf
>  	mov	x0, x10
>  	bl	putdecn
>  
> -	mov	x8, #__NR_exit
> -	mov	x1, #1
> -	svc	#0
> +	b	exit_error
>  endfunction
> diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
> index 84e63e510f23..33dc4ce8bfa1 100644
> --- a/tools/testing/selftests/arm64/fp/za-test.S
> +++ b/tools/testing/selftests/arm64/fp/za-test.S
> @@ -354,9 +354,7 @@ function vl_barf
>  	mov	x0, x10
>  	bl	putdecn
>  
> -	mov	x8, #__NR_exit
> -	mov	x1, #1
> -	svc	#0
> +	b	exit_error
>  endfunction
>  
>  function svcr_barf
> @@ -366,7 +364,5 @@ function svcr_barf
>  	mov	x0, x10
>  	bl	putdecn
>  
> -	mov	x8, #__NR_exit
> -	mov	x1, #1
> -	svc	#0
> +	b	exit_error
>  endfunction
> diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
> index afcadb5aff23..c67242c2d5ab 100644
> --- a/tools/testing/selftests/arm64/fp/zt-test.S
> +++ b/tools/testing/selftests/arm64/fp/zt-test.S
> @@ -284,7 +284,5 @@ function svcr_barf
>  	mov	x0, x10
>  	bl	putdecn
>  
> -	mov	x8, #__NR_exit
> -	mov	x1, #1
> -	svc	#0
> +	b	exit_error
>  endfunction
> 
> -- 
> 2.47.3
> 

