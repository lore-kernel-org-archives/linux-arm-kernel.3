Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE0AC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cb55vnZF0tji/8Hh7HeRYE1TJ+5qLvHUb2TCyUud44s=; b=fPiTG2DGKRQTlqsmZDKMsFmcR3
	iUVap9boEokGkJnPTj2ExQm5zSeTcmEeHtZCNuhHp4tAeBhZZ0RUhavROGAi0JgK4dF1kA95pwumD
	G/yBKbDpuIJ9Gv+/68Zbo2tJDxOKiII+D+gnAwqldWXh08UdRz1rkhiUIeZeEOUyvovExC02j8YUD
	J1x2lyrIdwInHUCg0l/yfi1VQ/B1E3ERpd3pa5AL4AyZ8xAkjPiNtiKOriL91N5fxEoNKCTq5ePvG
	QSmX7VHRSaVvccNaXGvEyguk5ZumCex87M32GEkGnwlg1VqfmySuJa456Kp4nQqcAWVxofOaadG0z
	/htbFnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBakE-000000043wP-3497;
	Tue, 29 Sep 2026 16:31:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBakD-000000043w2-2WK2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:31:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C429E6022B;
	Tue, 29 Sep 2026 16:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B708C1F000FF;
	Tue, 29 Sep 2026 16:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790699512;
	bh=Cb55vnZF0tji/8Hh7HeRYE1TJ+5qLvHUb2TCyUud44s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PcS4VX9BuDADAWvHThcEJciJY8c5U2DPax2tVe8SdFV7Mkp31FoPXSqUD5dSSGefA
	 Bg/kOJTWfilZL/6bkjpnmj703FLEgDBc8kj4N/+wBXrKv9u2D0zlgMHTAus+zaiFZ4
	 Im2dFqcd0CruZgxVNOcr9CtWWhgN958brBYZbHscPIuBL+iCUH/eGKWGrPtHUlbyN/
	 D+C1Rma06ypZTSMlreRztrmzxiFSsybfJyQsdTJdnZ2ao9cYm15jEaMwUIFifLs3Oz
	 KmMsLcbbCxLP8BWls60LvMm8yljReK6pg03Aah04/NVAexiuccKepILidhuIR3x86/
	 /izHOM4pJBJXg==
Date: Tue, 29 Sep 2026 17:31:47 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 04/11] kselftest/arm64: Use exit_error() rather than
 SIGABRT in fp-stress
Message-ID: <arvmJ50r86WCk9RY@gremlin>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-4-31bce995b49b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-4-31bce995b49b@kernel.org>
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

On Tue, Sep 01, 2026 at 06:06:44PM +0100, Mark Brown wrote:
> The fp-stress test loads all deliver a SIGABRT to the process group to
> report some errors they detect. There is no particular reason to use
> this mechanism over exiting with an error code, the fp-stress harness does
> not care. In order to facilitate running as KVM guests replace this with
> use of the exit_error() function we added.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

LGTM, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/arm64/fp/fpsimd-test.S | 10 ++--------
>  tools/testing/selftests/arm64/fp/sve-test.S    | 10 ++--------
>  tools/testing/selftests/arm64/fp/za-test.S     | 10 ++--------
>  tools/testing/selftests/arm64/fp/zt-test.S     |  8 +-------
>  4 files changed, 7 insertions(+), 31 deletions(-)
>
> diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> index 5ee8ef51ea4e..fcbb3a872490 100644
> --- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
> +++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> @@ -176,7 +176,7 @@ function setsignal
>  	cbz	w0, 1f
>
>  	puts	"sigaction failure\n"
> -	b	.Labort
> +	b	exit_error
>
>  1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
>  	ret
> @@ -224,7 +224,7 @@ function _start
>  1:	puts	"Bad vector length: "
>  	mov	x0, x19
>  	bl	putdecn
> -	b	.Labort
> +	b	exit_error
>
>  2:	puts	"Vector length:\t"
>  	mov	x0, x19
> @@ -266,12 +266,6 @@ function _start
>
>  	add	x22, x22, #1
>  	b	.Ltest_loop
> -
> -.Labort:
> -	mov	x0, #0
> -	mov	x1, #SIGABRT
> -	mov	x8, #__NR_kill
> -	svc	#0
>  endfunction
>
>  function barf
> diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
> index 3447fe0e5554..26efdbdd88f9 100644
> --- a/tools/testing/selftests/arm64/fp/sve-test.S
> +++ b/tools/testing/selftests/arm64/fp/sve-test.S
> @@ -344,7 +344,7 @@ function setsignal
>  	cbz	w0, 1f
>
>  	puts	"sigaction failure\n"
> -	b	.Labort
> +	b	exit_error
>
>  1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
>  	ret
> @@ -397,7 +397,7 @@ function _start
>  1:	puts	"Bad vector length: "
>  	mov	x0, x19
>  	bl	putdecn
> -	b	.Labort
> +	b	exit_error
>
>  2:	puts	"Vector length:\t"
>  	mov	x0, x19
> @@ -474,12 +474,6 @@ function _start
>
>  	add	x22, x22, #1
>  	b	.Ltest_loop
> -
> -.Labort:
> -	mov	x0, #0
> -	mov	x1, #SIGABRT
> -	mov	x8, #__NR_kill
> -	svc	#0
>  endfunction
>
>  function barf
> diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
> index 33dc4ce8bfa1..7208bb2db9f1 100644
> --- a/tools/testing/selftests/arm64/fp/za-test.S
> +++ b/tools/testing/selftests/arm64/fp/za-test.S
> @@ -189,7 +189,7 @@ function setsignal
>  	cbz	w0, 1f
>
>  	puts	"sigaction failure\n"
> -	b	.Labort
> +	b	exit_error
>
>  1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
>  	ret
> @@ -240,7 +240,7 @@ function _start
>  1:	puts	"bad vector length: "
>  	mov	x0, x19
>  	bl	putdecn
> -	b	.Labort
> +	b	exit_error
>
>  2:	puts	"vector length:\t"
>  	mov	x0, x19
> @@ -288,12 +288,6 @@ function _start
>
>  	add	x22, x22, #1	// Everything still working
>  	b	.Ltest_loop
> -
> -.Labort:
> -	mov	x0, #0
> -	mov	x1, #SIGABRT
> -	mov	x8, #__NR_kill
> -	svc	#0
>  endfunction
>
>  function barf
> diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
> index c67242c2d5ab..c6cfbdeb2f0c 100644
> --- a/tools/testing/selftests/arm64/fp/zt-test.S
> +++ b/tools/testing/selftests/arm64/fp/zt-test.S
> @@ -158,7 +158,7 @@ function setsignal
>  	cbz	w0, 1f
>
>  	puts	"sigaction failure\n"
> -	b	.Labort
> +	b	exit_error
>
>  1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
>  	ret
> @@ -222,12 +222,6 @@ function _start
>
>  	add	x22, x22, #1	// Everything still working
>  	b	.Ltest_loop
> -
> -.Labort:
> -	mov	x0, #0
> -	mov	x1, #SIGABRT
> -	mov	x8, #__NR_kill
> -	svc	#0
>  endfunction
>
>  function barf
>
> --
> 2.47.3
>

--
Cheers, Lorenzo

