Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C634EC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZU2Tllhge3GRSK8tec+GugxhBLtD4rsLH6Rvm35CiNI=; b=H6hKif8Z3IvESbVl95EGU7XUey
	dwQwXpP36EbarwPdCo9BTd2E6IpyJx9YKUoDOTo93dZNughbDHBgroJ8HFtKkulyKoZ/FM+9x4VMw
	6dJSn7+f7ffLA7dY8Oz8vs8vUQVoscFIemHqPSW8Fy6uYDElHZhDYkXTF0CuGAPqhpVRzGQdIIV18
	/E5lyG0Uj2yFpRt4QBaf14L7wNFafWapzz0XrvUy6cKdxSFe9fdmfRZLCha/EJ9M8rZz7GMPjc86n
	WwAtIS3Om0S14+PjgHNRc5tPMhDrpuxAmzcflSC5Up0oQHLqiAUZPW4J2pUP1Q5x8fqFUsaTFkiNE
	kpt7Ll3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBagr-00000004348-2yL0;
	Tue, 29 Sep 2026 16:28:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBagm-0000000432d-2XzO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:28:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB8EE1516;
	Tue, 29 Sep 2026 09:28:13 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D13F3F85F;
	Tue, 29 Sep 2026 09:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790699297; bh=oRtOh33Fesqsuut+x1rNUXPIlp0nseB6LrUdXjuiRLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLQfaulU0csNG4XSuuPMVX0sXYZcXQ+mm4Xg0cHYi6yvmJvMHlVlEqdR2aMMidlyN
	 Hd3VWaDL5422G1rUM//uLmMXWjsmi1BShVtOUMM8kT37owJfBiv6NZ3fu3oLuFfZZw
	 Zr+44rsBk4SoIczcvrlWBqY0pYjdtsi5lWOa+aZQ=
Date: Tue, 29 Sep 2026 17:28:13 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 04/11] kselftest/arm64: Use exit_error() rather than
 SIGABRT in fp-stress
Message-ID: <arvnHYROxZ6rbUMv@J2N7QTR9R3.cambridge.arm.com>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-4-31bce995b49b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-4-31bce995b49b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_092820_763385_47BC5883 
X-CRM114-Status: GOOD (  17.88  )
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
> not care.

That's not quite true; sending a SIGABRT to the entire process group
will kill the harness and other tests, resulting in lost output.

I mentioned that in the patches I linked you to a while back:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=922d15ef46cb486a79f168949e103f6df26f4fba

That aside, this is a good cleanup.

Mark.

> In order to facilitate running as KVM guests replace this with
> use of the exit_error() function we added.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
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

