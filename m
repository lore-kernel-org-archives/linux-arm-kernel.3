Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870FBD29C3D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTBglWBnTynV6ai1tS9WQOcWN4D6jkFL54SYLkFOA+g=; b=0VqRkaZgjb7MZJsAxTEumxy3gM
	058+j0jOoHiS8PNebkWCynj9hQJwE1FaSV7BuPP7vYcHNtS4DHpNHochxcvjzPnT5ZN3bo2TU++78
	RO2BCtDv9dEnhh8O1Q3qMvEaBkD7bRbr+qs+v+gz4VlQz6Te2sif2lT2/8bQ5uswUrgbyJkbbLkXJ
	u8vf/WQ+B+3PLF7U6s5TwE+7lW1mjFDpDZxDGErQvrCLbLB29Gsx5rdzhN2b0oQFwVofajmjj8SLJ
	to3tdZC6swdwjZcDzxr/G8r6+1bY8fleL4nG3JRKqyn8XCpqvO+NOv+cJ3BKXElXifAkdnVo4jkgE
	sb84JC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrd8-00000002P8p-35MN;
	Mon, 19 Jan 2026 15:57:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrd6-00000002P7z-4Bu0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:57:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F66B600C3;
	Mon, 19 Jan 2026 15:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A002EC116C6;
	Mon, 19 Jan 2026 15:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768838243;
	bh=bEBSCZfXLR1tJf1vwoAqITNqg+ipt9Ps9iqCK6K38wU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/vIYDzJ2uTrb2kbHa5FfDunUeBlmLEU0PhnTOPodO4bYqwWwlCiUTlpv+80WfWJE
	 bon8nQLNe5/SVPp8zumiJiuIkFH9371fc3BqrS4WlvBjS9HpQEiYwArT/7hKvIA96P
	 mPfUUBxcgFIaPk7pIdu4badTWfKPkkqwn7eVsHo4loM16n+/E6BTmxBjtuWqYBNBuq
	 ++s+W/ZXUqHX79XVEvxb0znwB1Ehhbwe234Zas1r2hFcGNzTHdlHHvAmDyMkll/bkn
	 7v9M9QTsm0cJspiTgu4gU7vzhTnEm1oQDLIgRmBdb0fBvqFQAnZ5md3wsyNdJCi7ap
	 w6PCbttDE3tQg==
Date: Mon, 19 Jan 2026 15:57:16 +0000
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, yangyicong@hisilicon.com,
	scott@os.amperecomputing.com, joey.gouly@arm.com,
	yuzenghui@huawei.com, pbonzini@redhat.com, shuah@kernel.org,
	mark.rutland@arm.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 RESEND 5/9] arm64: futex: refactor futex atomic
 operation
Message-ID: <aW5UXFz-TykfkGpV@willie-the-truck>
References: <20251214112248.901769-1-yeoreum.yun@arm.com>
 <20251214112248.901769-6-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214112248.901769-6-yeoreum.yun@arm.com>
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

On Sun, Dec 14, 2025 at 11:22:44AM +0000, Yeoreum Yun wrote:
> Refactor futex atomic operations using ll/sc method with
> clearing PSTATE.PAN to prepare to apply FEAT_LSUI on them.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> ---
>  arch/arm64/include/asm/futex.h | 128 +++++++++++++++++++++------------
>  1 file changed, 82 insertions(+), 46 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
> index bc06691d2062..f8cb674bdb3f 100644
> --- a/arch/arm64/include/asm/futex.h
> +++ b/arch/arm64/include/asm/futex.h
> @@ -7,17 +7,21 @@
> 
>  #include <linux/futex.h>
>  #include <linux/uaccess.h>
> +#include <linux/stringify.h>
> 
>  #include <asm/errno.h>
> 
>  #define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
> 
> -#define __futex_atomic_op(insn, ret, oldval, uaddr, tmp, oparg)		\
> -do {									\
> +#define LLSC_FUTEX_ATOMIC_OP(op, insn)					\
> +static __always_inline int						\
> +__llsc_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
> +{									\
>  	unsigned int loops = FUTEX_MAX_LOOPS;				\
> +	int ret, oldval, tmp;						\
>  									\
>  	uaccess_enable_privileged();					\
> -	asm volatile(							\
> +	asm volatile("// __llsc_futex_atomic_" #op "\n"			\
>  "	prfm	pstl1strm, %2\n"					\
>  "1:	ldxr	%w1, %2\n"						\
>  	insn "\n"							\
> @@ -35,45 +39,103 @@ do {									\
>  	: "r" (oparg), "Ir" (-EAGAIN)					\
>  	: "memory");							\
>  	uaccess_disable_privileged();					\
> -} while (0)
> +									\
> +	if (!ret)							\
> +		*oval = oldval;						\
> +									\
> +	return ret;							\
> +}
> +
> +LLSC_FUTEX_ATOMIC_OP(add, "add	%w3, %w1, %w5")
> +LLSC_FUTEX_ATOMIC_OP(or,  "orr	%w3, %w1, %w5")
> +LLSC_FUTEX_ATOMIC_OP(and, "and	%w3, %w1, %w5")
> +LLSC_FUTEX_ATOMIC_OP(eor, "eor	%w3, %w1, %w5")
> +LLSC_FUTEX_ATOMIC_OP(set, "mov	%w3, %w5")

Since you're reworking this code, how about we take the opportunity to
use named arguments instead of the numbers?

Will

