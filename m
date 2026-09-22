Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D54C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1uzJEWCuEihIVg1G0qTrtMfOkB5irmZnb+n7xMYoe4=; b=b08fhR70SBYkdoQQ3cSadUaAe6
	+KeA+A/yLgttdbuS5yZqb6hV7Zk3PPiw1WiRAIefdCkHcZapQOT0Qd6Ku17TdKsv0b10uF47er2w0
	f7e2+LQTvd1E3KAaaTRuT7IM27uTrugVNJlX41SegbkGSF5o0/HK0BNvDukgu3IZJcO0ofVKacyLw
	WGRJjieAgSiFwRyrwo3kRokVr0sx4/PZDA2zL7QqwdLgwNNRX1Ii0mylW+3bX0JSp5w4Y0MIUxu+8
	P1KNWVfBwy118UrDns6k4aiZwHJffyeyNY02MjTjc+2xHBafTZz1NzJ8mQWlwyCyMmk6je0sgsxqQ
	hW/4A2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9146-00000005ckZ-1vAK;
	Tue, 22 Sep 2026 14:01:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9144-00000005ck9-2SG1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:01:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 127A91570;
	Tue, 22 Sep 2026 07:01:38 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 864723F86F;
	Tue, 22 Sep 2026 07:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790085701; bh=kQrht+5sI9bASKFlgpONBOF4Z/HtyTurJ4XjvrOEmpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rs8NKWS15R7YDJBqLdcql2VJ8gnH2hZtsm3BC9gVnm5NqpVaHL049U42TsDGlCToN
	 Xk1jKhjiibZToljgHzBtgaw6dhPmL4WtsEyWV4J3xygPezkGvHi7j8sQj6Zp+8uqoX
	 LMEhl4/fm57xGK74ixP6dYwvETofqqR+oHzt11Tg=
Date: Tue, 22 Sep 2026 15:01:37 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 21/21] arm64: Rename 'overflow_stack' and
 OVERFLOW_STACK_SIZE
Message-ID: <arKKQe9bVo7_HC0d@arm.com>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-22-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918161407.2300-22-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_070144_668360_5930C36C 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 05:14:05PM +0100, Will Deacon wrote:
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 9d734cd09f62..7e9b26cf1bdc 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -327,43 +327,43 @@ static void debug_exception_exit(struct pt_regs *regs)
>  }
>  NOKPROBE_SYMBOL(debug_exception_exit);
>  
> -static void noinstr el1h_64_check_overflow_stack(struct pt_regs *regs)
> +static void noinstr el1h_64_check_exception_stack(struct pt_regs *regs)
>  {
>  	unsigned long sp = kernel_stack_pointer(regs) - sizeof(*regs);
> -	unsigned long ovf_stack = (unsigned long)this_cpu_ptr(overflow_stack);
> +	unsigned long exc_stack = (unsigned long)this_cpu_ptr(kernel_exception_stack);
>  
>  	/*
> -	 * We're in big trouble if we've overflowed the overflow stack
> +	 * We're in big trouble if we've overflowed the exception stack
>  	 * so perform a best-effort check before we proceed. If our SP
> -	 * is outside of the overflow stack for this CPU then presumably
> +	 * is outside of the exceptoin stack for this CPU then presumably
			     ^^^^^^^^^
Nit: "exception"

-- 
Catalin

