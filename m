Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B5BD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 14:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZiGM0rgOh8rCPA4Chxa2korgREX/RFMjcGVwmNVipY=; b=ZHJYA1firsJcBvtQao9mw/4CC3
	adTjT0Jt9Vk8DuCAf0rcbmc1Kr0M+uCuTX7Q7dVUh4KvEeYx7kHiUaGOqAKQFvGrOVQduV4W+L0Zs
	bQz9eY0jXwBZXE3x4ZeD/7P7gq3lMaS7gLDQxcgnT0pLCbHnoaIUVGyX5TAZaC1uUc0qZLmoaRHBh
	rNF8cFdeKQCmINZ/tZXg3SX0Jcc+7jpQUBJ7xE6YltqmjimEWcCNRKuUHhVM6X9MkeyNDblTxvdLn
	VhOu9i5hpd03h+kKhOSPx+C7ustI369tNTA7ajv9Ygb8uECgwd/ZqlsRd1GMTOPHwb7q+WXSKegtk
	zYcL3lgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdLJ-0000000GoIj-0Qwe;
	Thu, 27 Nov 2025 14:51:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdLH-0000000GoIL-1odo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 14:51:32 +0000
Date: Thu, 27 Nov 2025 15:51:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764255089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dZiGM0rgOh8rCPA4Chxa2korgREX/RFMjcGVwmNVipY=;
	b=hbwvzb365mil7ujSwC8oJpF8CtccBGMjUFmYcTY7jCpfPuJm1qBs5AaPCZPMADrLTWU3TA
	vn13NSp93U+rAvnpb7CJ0J+MVeIUYV+xdakfOm1+LMSRjb7xUMuysNXNhTsWsNcMQiPtCy
	mgyDlVsWbMeHTe0PUshZ5WZZiozDAxx4FSniJOK3nA7unx7A7VajLGUwsB5JV00+dV+U67
	UiuDXqGtIZWaUf7Govw33nazqzbo1QKrSKB2ROJ7mNru2DaY0svMNx441cxH6kdtMmp89s
	7AROEeoJjjKgBMjjOE8d7wS5gvIildHIZSqs4jTxKPt9HJQaFfYb+OOYc2OWfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764255089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dZiGM0rgOh8rCPA4Chxa2korgREX/RFMjcGVwmNVipY=;
	b=p9WbnQvb7y0LNdkXZr9Yzo0gHnHa6g+Z2WXDmZUBwgqVuoqJOXmUV0kOAeAdzwMXc7ytE7
	mse1wFdfR5DBq6Bg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: viro@zeniv.linux.org.uk, will@kernel.org, nico@fluxnic.net,
	rmk+kernel@armlinux.org.uk, linux@armlinux.org.uk,
	david.laight@runbox.com, rppt@kernel.org, vbabka@suse.cz,
	pfalcato@suse.de, brauner@kernel.org, lorenzo.stoakes@oracle.com,
	kuninori.morimoto.gx@renesas.com, tony@atomide.com, arnd@arndb.de,
	akpm@linux-foundation.org, punitagrawal@gmail.com, hch@lst.de,
	jack@suse.com, rjw@rjwysocki.net, marc.zyngier@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	wozizhi@huaweicloud.com, liaohua4@huawei.com, lilinjie8@huawei.com,
	pangliyuan1@huawei.com, wangkefeng.wang@huawei.com
Subject: Re: [RFC PATCH v2 1/2] ARM/mm/fault: always goto bad_area when
 handling with page faults of kernel address
Message-ID: <20251127145127.qUXs_UAE@linutronix.de>
References: <20251127140109.191657-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251127140109.191657-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_065131_638033_BF4BE829 
X-CRM114-Status: GOOD (  10.11  )
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

On 2025-11-27 22:01:08 [+0800], Xie Yuanbin wrote:
> --- a/arch/arm/mm/fault.c
> +++ b/arch/arm/mm/fault.c
> @@ -270,10 +270,15 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
>  	vm_flags_t vm_flags = VM_ACCESS_FLAGS;
>  
>  	if (kprobe_page_fault(regs, fsr))
>  		return 0;
>  
> +	if (unlikely(addr >= TASK_SIZE)) {
> +		fault = 0;
> +		code = SEGV_MAPERR;
> +		goto bad_area;
> +	}
>  
>  	/* Enable interrupts if they were enabled in the parent context. */
>  	if (interrupts_enabled(regs))
>  		local_irq_enable();

What is with the patch I sent wrong?

Sebastian

