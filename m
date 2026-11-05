Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AC7606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vzn+trmK;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nifLGVmn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=42B23m+JIdyvXG0sW7UzXbkef8/A6+4jMboFfV5//zI=; b=Vzn+trmKCg97DOsujROzklMW2L
	k7CzxU7TEADq03XFRf+AYnd4pUJgYe1QbkMbgzi8wAm4E8Gpip6HCztzA6KFpz/ij5QSsPNmlAPTY
	3H/c1PdyiZq+WNfmPj/Eab3Vm5/7SBu7vFgbfV3XbVEAnK6C9cWZhMF7fDkrgK61iig+/haXxvNDE
	HByIUeAROzpabpx+5k9A9ZPK3YWidHISMvlf2i/pihtcOBMjvOrqXjgFU8tIu75qXumwleQO8l1ww
	5DTegubRONteTW+mibEV76gV2Fmh/tIDC4K2jfkXpbHHdhGJGZtnPWhgv8Dp8BZkYZZppjlS5AeVC
	gEZQ9CIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2Ld-0000000A9vL-0fbi;
	Thu, 05 Nov 2026 18:38:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2LV-0000000A9tm-1B3R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:38:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCC64168F;
	Thu,  5 Nov 2026 10:37:49 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D67BD3F632;
	Thu,  5 Nov 2026 10:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793903872; bh=9Qhj0s746e4V1R4BU+HoKxTE/pluQc6iZNeXaD38eeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nifLGVmnqXYcirsAZF6IszdTwzH5oMaXh0Z+dSQ4QKp9pkzRNqjBRKUBp/25yWrCP
	 xU8XxQQj3RD6yqa54ohcJh44ntqKmEEcuQXhu0YHvBCN4CC/iPNCv97/T6KqwD1+Wf
	 0l8BtR9y/1prJ4J5hTD5yWGu2QSD3R6G3rPp7qo0=
Date: Thu, 5 Nov 2026 18:37:46 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kiryl Shutsemau <kirill@shutemov.name>
Subject: Re: [PATCH v2 1/2] arm64: sdei: Run the event handler on the kernel
 vectors
Message-ID: <auzM-l40BLsT3clg@arm.com>
References: <20261105120835.3321912-1-kirill@shutemov.name>
 <20261105120835.3321912-2-kirill@shutemov.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105120835.3321912-2-kirill@shutemov.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_103757_388836_DE83F100 
X-CRM114-Status: GOOD (  19.35  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, "Kiryl Shutsemau \(Meta\)" <kas@kernel.org>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Usama Arif <usama.arif@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org, Breno Leitao <leitao@debian.org>, mrigendrachaubey <mrigendra.chaubey@gmail.com>, Will Deacon <will@kernel.org>, Linus Walleij <linusw@kernel.org>, Dawei Li <dawei.li@linux.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 12:08:33PM +0000, Kiryl Shutsemau wrote:
> @@ -1065,10 +1067,27 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
>  	else if (cpu_has_pan())
>  		set_pstate_pan(0);
>  
> +	/*
> +	 * With KPTI, VBAR_EL1 holds the trampoline vectors from the return to
> +	 * EL0 until the next exception from EL0 maps the kernel. They only
> +	 * handle exceptions from EL0: an exception taken here would run their
> +	 * empty current-EL half and never come back. Switch to the kernel
> +	 * vectors. The IRQ-like resume keeps using the interrupted VBAR, so it
> +	 * still goes through the trampoline.
> +	 */
> +	vbar = read_sysreg(vbar_el1);
> +	if (arm64_kernel_unmapped_at_el0() &&
> +	    vbar == (unsigned long)__this_cpu_read(this_cpu_vector)) {
> +		write_sysreg((unsigned long)vectors, vbar_el1);
> +		isb();
> +	}

Sashiko had a comment that the above should be raw_cpu_read() since with
preempt debugging and pseudo-NMIs, irqs_disabled() is false here and the
check in __this_cpu_read() will warn.

Thinking about it, further down on the irqentry_nmi_enter() ->
lockdep_hardirqs_off() we'll hit the irqs_disabled() issue again. We
could just do a raw_local_irq_save/restore() around this function.
Unnecessary for DAIF but useful with pseudo-NMIs.

Alternatively, __sdei_asm_handler() could save/restore PMR and change
the priorities similar to the kernel_entry code. Actually, this may be
better since do_sdei_event() also checks regs_irqs_disabled() and we
don't have any regs->pmr populated.

Worth a separate patch to fix SDEI handling with pseudo-NMI on and no
changes to __this_cpu_read() above needed. So, for this patch:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

(I'll probably queue it for -rc but waiting to see if there are more
comments)

-- 
Catalin

