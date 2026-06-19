Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2800CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 14:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TaNC8PwShAg/Y23wQIo10NUlbBBENkZTNBcIkvdsHk=; b=wIfiW8GKUYHk11ItkLY7uVx1KH
	sOpd3KLtfBYO7/hfEukk9ObNE48tbTnxB4MLSE3mVQxINy9KF+zHMfajcwbkkGRkRIxXhziWkOsk1
	Xl6W6OY3jPBEdxGsXW4Lfe5gZZwPjZht2T+Q15Qs+m1pSRqm7QcEk/IiXJ/HuDqUVERubeFrv1s5+
	QZp6UilRKqPFaz14x4lKppL9uVgQeBrrwMqWtIowBCsikMhgy1FXGwbV7PwxDxF4VDP9lDcuij9rf
	L5rrvOW/A51dB9MCzUTiKyirmIGcGHdqPKffj6P+3LCMVKar5Q40fB7E+5leACC8sLV54SKDb4IWc
	zO6Jg7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waaZo-00000002b7I-1NFY;
	Fri, 19 Jun 2026 14:52:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waaZk-00000002b6X-2vmg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 14:52:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95A82271B;
	Fri, 19 Jun 2026 07:51:58 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B62113F62B;
	Fri, 19 Jun 2026 07:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781880723; bh=o74Z7lzmdb3tZMq3rKrq8P/G+kE+9UZ+rHVzDHLEoww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CjKGAOwrernM+IUWBXUFDnRsYTfdi6734XxMTQRlEqo4tP2FZHJxF9LCYprHmSjqU
	 JisEMsD73msFl3j/unAoFZodpdOAGq+YUSIBARhIM4pFp26ESLRNlj8TbLRm7POzJU
	 JxNTwedp6ds3I61cQyDqg5eoYcAr0UL92T3UQXpk=
Date: Fri, 19 Jun 2026 15:51:55 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Martin <dave.martin@arm.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] arm64: uapi: Use __u128 instead of __uint128_t in UAPI
 headers
Message-ID: <ajVXi6uUcEAkyDFJ@J2N7QTR9R3.cambridge.arm.com>
References: <20260619130835.5678-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619130835.5678-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_075208_911309_0C8F52C7 
X-CRM114-Status: GOOD (  25.61  )
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

On Fri, Jun 19, 2026 at 02:08:34PM +0100, Will Deacon wrote:
> The arm64 UAPI exposes '__uint128_t' types in the members of
> 'struct user_fpsimd_state', 'struct user_pac_address_keys' and in the
> signal frame via 'struct fpsimd_context'. Since the alignment of such
> a type appears to be non-portable (16 bytes on arm64, 8 bytes on s390),
> prefer the '__u128' typedef from uapi/linux/types.h, which makes the
> alignment explicit and allows the definitions to be reused by other
> host architectures.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> Cc: Steffen Eiden <seiden@linux.ibm.com>
> Cc: Andreas Grapentin <gra@linux.ibm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dave Martin <dave.martin@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
> 
> This aims to help a little with the s390/arm64 KVM series at:
> 
> https://lore.kernel.org/r/20260529155050.2902245-1-seiden@linux.ibm.com
> 
> by allowing the relevant parts of the arm64 UAPI to be used directly by
> s390 rather than copied and modified.
> 
> I think it's a straightforward change, but the only thing that makes me
> pause for thought is whether there are toolchains out there which accept
> __uint128_t but not __int128. Then again, if that crops up as an issue
> we can probably just tweak the typedef we have in uapi/linux/types.h.

That's all fine to me in concept, so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

A few places in arch/arm64/kernel/fpsimd.c and
arch/arm64/kernel/ptrace.c use __uint128_t to match the uapi headers.
For consistency (and to avoid people accidentally using __uint128_t in
future), I reckon it would be good to fix those up to match, but that
can be a follow-up.

Mark.

>  arch/arm64/include/uapi/asm/ptrace.h     | 12 ++++++------
>  arch/arm64/include/uapi/asm/sigcontext.h |  6 +++---
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
> index 6fed93fb2536..15649a253a57 100644
> --- a/arch/arm64/include/uapi/asm/ptrace.h
> +++ b/arch/arm64/include/uapi/asm/ptrace.h
> @@ -93,7 +93,7 @@ struct user_pt_regs {
>  };
>  
>  struct user_fpsimd_state {
> -	__uint128_t	vregs[32];
> +	__u128		vregs[32];
>  	__u32		fpsr;
>  	__u32		fpcr;
>  	__u32		__reserved[2];
> @@ -258,14 +258,14 @@ struct user_pac_mask {
>  /* pointer authentication keys (NT_ARM_PACA_KEYS, NT_ARM_PACG_KEYS) */
>  
>  struct user_pac_address_keys {
> -	__uint128_t	apiakey;
> -	__uint128_t	apibkey;
> -	__uint128_t	apdakey;
> -	__uint128_t	apdbkey;
> +	__u128	apiakey;
> +	__u128	apibkey;
> +	__u128	apdakey;
> +	__u128	apdbkey;
>  };
>  
>  struct user_pac_generic_keys {
> -	__uint128_t	apgakey;
> +	__u128	apgakey;
>  };
>  
>  /* ZA state (NT_ARM_ZA) */
> diff --git a/arch/arm64/include/uapi/asm/sigcontext.h b/arch/arm64/include/uapi/asm/sigcontext.h
> index e29bf3e2d0cc..d250ca7a1d46 100644
> --- a/arch/arm64/include/uapi/asm/sigcontext.h
> +++ b/arch/arm64/include/uapi/asm/sigcontext.h
> @@ -78,7 +78,7 @@ struct fpsimd_context {
>  	struct _aarch64_ctx head;
>  	__u32 fpsr;
>  	__u32 fpcr;
> -	__uint128_t vregs[32];
> +	__u128 vregs[32];
>  };
>  
>  /*
> @@ -266,8 +266,8 @@ struct gcs_context {
>   *	-	----				-----------
>   *	REGS					the entire SVE context
>   *
> - *	ZREGS	__uint128_t[SVE_NUM_ZREGS][vq]	all Z-registers
> - *	ZREG	__uint128_t[vq]			individual Z-register Zn
> + *	ZREGS	__u128[SVE_NUM_ZREGS][vq]	all Z-registers
> + *	ZREG	__u128[vq]			individual Z-register Zn
>   *
>   *	PREGS	uint16_t[SVE_NUM_PREGS][vq]	all P-registers
>   *	PREG	uint16_t[vq]			individual P-register Pn
> -- 
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
> 

