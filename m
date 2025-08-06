Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCC1C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 22:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glTBN0gK8JzuKNFmUVBerpGSAN/NNkoZdW5K4p+ABi4=; b=oI9p6s1q5DebZVVYue6NKwUXGK
	gUQgSqPD0Q7nfr3Elct/ArAMLDQsWjLnjKzQOqiOSx32ZY5hEz6EJ5H6vtF5TWTI80F0m+hWIzBEe
	Hl7WxAzjOvhBGGqTMr68x7ZnoIh5rDjwKvtf1VttTXA0AM37WOAG+UsnlhET7EeD/FpCHz8dN5x5e
	y2vy37/iLhhuKHvEAjFMBp9VoHxAOL5q9uFZy65gV2S1J0jxK3217mSbZ06Lrdo3rYJ4UjraEArNZ
	4Uou6MlagOIiZRlqVxFlFuv6JJHJlj7zp+zyC0AmY0xw5keYdCsUqY10PEni/SSpX99Gc9Om77UAL
	uqKwsavw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmch-0000000GjA1-3DAr;
	Wed, 06 Aug 2025 22:28:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmaB-0000000GivU-3uWw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 22:26:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6024F60203;
	Wed,  6 Aug 2025 22:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487F9C4CEE7;
	Wed,  6 Aug 2025 22:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754519163;
	bh=wSP/FnjATYBkD9tjSijm87GKcLGQ9Dv8hJCzfo90h/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZVZtpHcJ84kPEusQRbGh0yw0RjPpg0xx99EEBSWIBT7fatVExcSR13RCFr0P/Am9
	 f2rvIpIy9szjA5QOgilFY47ledEhI6DZBUnBeVsHIa6foNSKny7oPvL/byTHW/fhTr
	 UnwXixzezWxz5XRhtEWzuk1Ypp9tdH5bYTc9opJToSJ/fx2bbRqIebIzkKbNENvG1W
	 NJsvHnXcqdajLfRfpjWXrBzmSSTm5hIwNg4NCzwwUmkZyCA8zHEis15KZ4E///gMeC
	 XEO+0WBvsRRHw7PazG7Z22ryiE+ERSdb085I8LV78NiNdQmClZ/9uAxCOAHac92DHo
	 97Th+tup2Yegw==
Date: Wed, 6 Aug 2025 15:25:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Tom Rix <trix@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 6.1.y] KVM: arm64: sys_regs: disable
 -Wuninitialized-const-pointer warning
Message-ID: <20250806222557.GA1654483@ax162>
References: <20250728-stable-disable-unit-ptr-warn-v1-1-958be9b66520@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728-stable-disable-unit-ptr-warn-v1-1-958be9b66520@google.com>
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

On Mon, Jul 28, 2025 at 02:07:36PM -0700, Justin Stitt wrote:
> A new warning in Clang 22 [1] complains that @clidr passed to
> get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> doesn't really care since it casts away the const-ness anyways -- it is
> a false positive.
> 
> |  ../arch/arm64/kvm/sys_regs.c:2978:23: warning: variable 'clidr' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
> |   2978 |         get_clidr_el1(NULL, &clidr); /* Ugly... */
> |        |                              ^~~~~
> 
> Disable this warning for sys_regs.o with an iron fist as it doesn't make
> sense to waste maintainer's time or potentially break builds by
> backporting large changelists from 6.2+.
> 
> This patch isn't needed for anything past 6.1 as this code section was
> reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
> configuration").
> 
> Cc: stable@vger.kernel.org
> Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
> Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---

Yes, I think this is an appropriate way to address this for stable.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm64/kvm/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> index 5e33c2d4645a..5fdb5331bfad 100644
> --- a/arch/arm64/kvm/Makefile
> +++ b/arch/arm64/kvm/Makefile
> @@ -24,6 +24,9 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
>  
>  kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
>  
> +# Work around a false positive Clang 22 -Wuninitialized-const-pointer warning
> +CFLAGS_sys_regs.o := $(call cc-disable-warning, uninitialized-const-pointer)
> +
>  always-y := hyp_constants.h hyp-constants.s
>  
>  define rule_gen_hyp_constants
> 
> ---
> base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
> change-id: 20250728-stable-disable-unit-ptr-warn-281fee82539c
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 

