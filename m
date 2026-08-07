Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59772C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 11:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JG2jI05ar/MM7M4/8n/Rsi41CrlyWkvtojkvlAY4aEg=; b=OiDeIZ/XaAskvFo1sSmUzViB9x
	Tb9Wz4xYeZWjzs3K+CV065fYqSkkqL64t0EitQDHbJ4q1L6HJ9gOyMf4HWjMv0X2zFwfJiiVjNL2G
	7dCi9WX0UtuBlL1a+wKM6MTxu5KuKUD4Q0tXjyeyf19iQz+ZkMKSvUYASTP1EwuH5am7pvHsUivcx
	mX5lez019SNB3JiQrSYcT8k9YExu6e9yETv2KggqtE/w4SD0AAf8y6byynMDRKjDJ/oLs91kl6gF/
	n8ySolAZRaA8tPFP6wKWtUnhhfXC1T2HELP2WOuJpUa6Zb4avTG/A4xINvizalgE6QA9wsukjv/1e
	QK6hFxiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIs1-00000007wbj-0sYw;
	Fri, 07 Aug 2026 11:36:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIrv-00000007wZR-0II8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 11:36:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60C401516;
	Fri,  7 Aug 2026 04:36:00 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFEDD3F86F;
	Fri,  7 Aug 2026 04:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786102564; bh=SdeLscMrhTxsnqVD2TP9vz+ha9ad8aAfyTCf0h1z0Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCsjEjjiVcPNUo2YG2yJKMdC3Xd4SP9J9kTKrRUNbd7WA0iUYdtK3fpyrALXR9fqB
	 bPA6jUXf2vgJoh8xF59v7914p8Zijoo6Wc3+VikJV12OelfBRnpyjXUpIikFiIwits
	 wLztaHh2rfF0WSRecapTIGzJxAauQAS4P4chCxX4=
Date: Fri, 7 Aug 2026 12:35:52 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 11/20] arm64: entry: sdei: Restore all clobberable GPRs
Message-ID: <anXDGLkN-DbQ5hga@J2N7QTR9R3>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
 <20260804170503.3513916-12-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804170503.3513916-12-mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_043607_151120_2D81C93C 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: vladimir.murzin@arm.com, ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Aug 04, 2026 at 06:04:54PM +0100, Mark Rutland wrote:
> Currently __sdei_asm_handler() avoids restoring x20 to x27, as these are
> not be clobbered by existing code. This is correct today, but it makes
> it awkward to rework __sdei_asm_handler(). Given the rarity of SDEI
> events, restoring x20 to x27 should not have a measurable impact.
> 
> Restore x20 to x27 when returning from an SDEI event handler. This will
> free up those GPRs for usage in __sdei_asm_handler() prior to return.

Sashiko noticed an error below that I'll fix for v3.

> -	/* restore regs >x17 that we clobbered */
> +	/* restore regs >x17 that firmware won't restore */
>  	mov	x4, x19         // keep x4 for __sdei_asm_exit_trampoline
> -	ldp	x28, x29, [x4, #SDEI_EVENT_INTREGS + 16 * 14]
>  	ldp	x18, x19, [x4, #SDEI_EVENT_INTREGS + 16 * 9]
> +	ldp	x20, x21, [x4, #SDEI_EVENT_INTREGS + 16 * 10]
> +	ldp	x22, x23, [x4, #SDEI_EVENT_INTREGS + 16 * 11]
> +	ldp	x24, x25, [x4, #SDEI_EVENT_INTREGS + 16 * 12]
> +	ldp	x22, x27, [x4, #SDEI_EVENT_INTREGS + 16 * 13]
                ^^^

That should be 'x26'.

Mark.

> +	ldp	x28, x29, [x4, #SDEI_EVENT_INTREGS + 16 * 14]
>  	ldp	lr, x1, [x4, #SDEI_EVENT_INTREGS + S_LR]
>  	mov	sp, x1
>  
> -- 
> 2.30.2
> 

