Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C7BC88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=baxl95sGyfKMK8UyakzdYNXGyvmi4FwumlfGC3Xl3AM=; b=2cMUmcEuv/jxgW
	dRZfRJUMZn9srFS2/I6hRIZW0gGMtOWC99PExZFVotdrnJNZommHMbdbrGoak2aczZYOgoAjEz8VF
	X/ypTaJTEyNpu8nVglY+JSuuLo0vCGz8zpq+CfVg2wRHLjyzEEHG57RWIc155DDB4B19q7vPwoHZV
	t1g+BM9/OS62HjCSd7kbdkuO4RNb0IicAxvsV17lojyToD0ttD2SX67o1uIOFTVm6Fq1aY3wpSk25
	soRMOPzG9YhdR042JQM63w3XCys7WCeilYJ3x30yfZXWzn1tzfGdk4XkuwzhDdv2oolY9QxtZB8/7
	J3qx5pFByywwrvu4tXMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yMw-0000000GMgF-3uLV;
	Fri, 11 Sep 2026 10:20:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yMo-0000000GMWV-25am
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:20:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14485153B;
	Fri, 11 Sep 2026 03:20:15 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4514A3F7B4;
	Fri, 11 Sep 2026 03:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789122018; bh=53Dh5QE6fSgJ74oMfOx/5be01PBtu9656F9us9fFU+8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mP6HeeHXPRZxEdHjOO8oTs+q6Smeu/t8MWvXsEgXSu3DgtgMx9L9ycv4wANLZlF5V
	 X7/U8jsObc/Im0hX6R4xmKeZ2Smvj9439ipAFwyFg4PNH+bV8pTpxA6Dg+MJFnoICr
	 JkHIYGnpxaazF5Qa5pHZ6gY9Bl/2EaLMR6x2MhtE=
Message-ID: <182bd070-d987-45f5-9dca-1a85b07abf2b@arm.com>
Date: Fri, 11 Sep 2026 11:20:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/21] arm64: ptrace: Always inline
 pt_regs_[read,write}_reg()
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20260908151741.394589-1-mark.rutland@arm.com>
 <20260908151741.394589-9-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260908151741.394589-9-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_032022_643111_E8AACEA1 
X-CRM114-Status: GOOD (  19.09  )
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
Cc: ryan.roberts@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 9/8/26 16:17, Mark Rutland wrote:
> In subsequent patches we'll want to use pt_regs_read_reg() and
> pt_regs_write_reg() in noinstr code.
> 
> To ensure noinstr safety, both functions must be inlined into their
> caller. As both functions are marked as 'inline' rather than
> '__always_inline', that's not strictly guaranteed, and the compiler is
> permitted to generate out-of-line copies.
> 
> Mark both functions as '__always_inline' to ensure this.
> 
> There should be no functional change as a result of this patch.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/ptrace.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index f7dc5fb9427d6..f635c3453a858 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -266,7 +266,8 @@ static inline u64 regs_get_register(struct pt_regs *regs, unsigned int offset)
>   * Read a register given an architectural register index r.
>   * This handles the common case where 31 means XZR, not SP.
>   */
> -static inline unsigned long pt_regs_read_reg(const struct pt_regs *regs, int r)
> +static __always_inline unsigned long
> +pt_regs_read_reg(const struct pt_regs *regs, int r)
>  {
>  	return (r == 31) ? 0 : regs->regs[r];
>  }
> @@ -275,8 +276,8 @@ static inline unsigned long pt_regs_read_reg(const struct pt_regs *regs, int r)
>   * Write a register given an architectural register index r.
>   * This handles the common case where 31 means XZR, not SP.
>   */
> -static inline void pt_regs_write_reg(struct pt_regs *regs, int r,
> -				     unsigned long val)
> +static __always_inline void
> +pt_regs_write_reg(struct pt_regs *regs, int r, unsigned long val)
>  {
>  	if (r != 31)
>  		regs->regs[r] = val;
> -- 2.30.2
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


