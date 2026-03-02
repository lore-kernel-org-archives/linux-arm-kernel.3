Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4433E9B35E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0zLKLtB5A7zru2ahcIUFI/0NS64SB8AC7f0H7kN8aQ=; b=1CnsTa/7d1j3S5XrZtcXmK0mDU
	dgdtuDU/KZybjZBRsuLki3FhsgG8b41R3uMYFdY8Y5/fqhlAOC3DzGBAboWTmCe9G8C1xtWlCPRl3
	FUHWX+9/U0f+oB/L/JTPkrjqI62rMBUTKtquvF84m+vlat3MzJ3mwg3FDcPrrXrleyiOKOJtvwhxd
	ZTSAQNYrj9HOJfpwx6eGgquBUfsiyC3as4mirqFOsgXZU7pa0HAmBrCQ+54ESp1vP82cNmGewzcOo
	l4IegfE4RfTtdo13RT3feeygAKZ28jWcHqa4CLSmPFcf4uuHDwIee0qwOuZaAtktkYuyCB86B5E2h
	g9ny8mQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0km-0000000CjNt-0wmk;
	Mon, 02 Mar 2026 10:43:56 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0kk-0000000CjNP-1O39
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:43:55 +0000
Date: Mon, 2 Mar 2026 11:43:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772448232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n0zLKLtB5A7zru2ahcIUFI/0NS64SB8AC7f0H7kN8aQ=;
	b=POieAP56h6+EUimzNHr1QIXuhdRMFHnsWSD9O7dhECwq6nKFsDhzAzUpqHBqjz8t0ziLVj
	ye3qvNWHsYvVxYLD4xcKeUad1ZCDGNMuaeprWloJyzSTLkelFvaDN560AhA/6wFapZyy4H
	0P+v5rt8EDBgikY4QdAmh0K35fOJu27mh+DwoblNtsSaAQVyX0gej07v2PkIlM1nDbXMze
	qrnQLkJCiUPfZO59LYc2Mgg4WLa3G8Z/gqiWv3d1USbieAXLciHwTYm9HWBQF2JlUJCGHo
	T6Xx/e0zdHEdu6a7oc56sURg7cQsbmWuMy87ullACwz2E2YyMdq28Y7mdFEKCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772448232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n0zLKLtB5A7zru2ahcIUFI/0NS64SB8AC7f0H7kN8aQ=;
	b=EZUWSgnMd/Mkt//b0cYqq7JbPWZYKwsKHKmTMXm8JVUnVvnTUAX/Q8/2b+2S+vYyoBK8It
	OhAsdi09nhhhXnAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/6] ARM: move vmalloc() lazy-page table population
Message-ID: <20260302104351.yyWvNCTb@linutronix.de>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
 <E1vvzcX-0000000Awo0-2KBN@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <E1vvzcX-0000000Awo0-2KBN@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_024354_510024_9F5F5F07 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

On 2026-02-27 15:19:13 [+0000], Russell King (Oracle) wrote:
> Split the vmalloc() lazy-page table population from
> do_translation_fault() into a new vmalloc_fault() function.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> --- a/arch/arm/mm/fault.c
> +++ b/arch/arm/mm/fault.c
> @@ -261,6 +261,70 @@ static inline bool ttbr0_usermode_access_allowed(struct pt_regs *regs)
>  }
>  #endif
>  
> +/*
> + * Handle a vmalloc fault, copying the non-leaf page table entries from
> + * init_mm.pgd. Any kernel context can trigger this, so we must not sleep
> + * or enable interrupts. Having two CPUs execute this for the same page is

"unconditionally enable interrupts."? It wouldn't be wrong to enable
them if the calling context had them enabled, right?

> + * no problem, we'll just copy the same data twice.
> + *
> + * Returns false on failure.
> + */
> +static bool __kprobes __maybe_unused vmalloc_fault(unsigned long addr)

Maybe handle_vmalloc_fault().

> +{

Sebastian

