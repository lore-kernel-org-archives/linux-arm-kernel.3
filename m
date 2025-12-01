Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7467CD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 13:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJP1CphtVFSgNIZU1NL+eU+k3JeTHzGDRtTV12rYQ8o=; b=T1sblH6PlhFufb5GfrA1kA3LQJ
	1tWeV0LK5aqt3eo+73MERmSgnwFlDgzl6/kCaoQ7K+J3HK83PnrbhyuHTHh+vG0KHYIJGWWVbSnl0
	A1Otsa9yPK8Yei9YW+vHszb0RqC7kwhAGm5OQhnM8Tj5Dtdvk02d7NJ4W8Uy3vklWgMGC+3/+bJl8
	8CKxuoZgSknZKo6wk4gJryzVAp9aDKu3nVTXynxzQmi10tH1TJkO8cOGq8/bv+v7j+WvSRZr5oKCh
	p6P/NN0vWec2l953oxs5Ciks+z/z0jlKlSgH4buurGplwbiuTepX5Nge0yzKfTKloyZ7tug2qhzYs
	dpGcCsVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ43Q-000000041VU-0mEV;
	Mon, 01 Dec 2025 13:35:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3wz-00000003vmT-0Kqx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 13:28:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 119E16001D;
	Mon,  1 Dec 2025 13:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A75C4CEF1;
	Mon,  1 Dec 2025 13:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764595699;
	bh=FevHi0kLliUV5SQ+/ZO84hut8iMmC7m6mevvQPXJiHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GB4PdAEQpQKQuhcpxGteKkjdVYH9TyuUXh91JdQuQ/4eOSaS2YGYg8q65zNG0ksj3
	 4iUEy0Sx1XA6EcrsvEEFUEatwObl/Xb4VOs+L86Ygm1h9jfbIZJCen+EqrXkmpQq5t
	 vzD4d1lwJZVkBXeR8YPgRBOEnuKEzhMHebtHoUi8rgbvy6z9HzRJWNsxrHMf0OOPoB
	 QRJMGlCp7nwSLq51InSz1Ynj4rVUI69oirRNzlrghJAXSQ/uBjN8HHZrs29TWgZ9vU
	 f74tqNqWKXSMr8kOIGEZPP3OtZP0dyeYroa1jhuGK1jujZYk05YvwT+2gsPZXN9D+G
	 afF+kzb1yTDQw==
Date: Mon, 1 Dec 2025 13:28:13 +0000
From: Will Deacon <will@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Zizhi Wo <wozizhi@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>, jack@suse.com,
	brauner@kernel.org, hch@lst.de, akpm@linux-foundation.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	yangerkun@huawei.com, wangkefeng.wang@huawei.com,
	pangliyuan1@huawei.com, xieyuanbin1@huawei.com
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
Message-ID: <aS2X7cIiRnR26hyg@willie-the-truck>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <33ab4aef-020e-49e7-8539-31bf78dac61a@huaweicloud.com>
 <CAHk-=wh1Wfwt9OFB4AfBbjyeu4JVZuSWQ4A8OoT3W6x9btddfw@mail.gmail.com>
 <aSgut4QcBsbXDEo9@shell.armlinux.org.uk>
 <CAHk-=wh+cFLLi2x6u61pvL07phSyHPVBTo9Lac2uuqK4eRG_=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh+cFLLi2x6u61pvL07phSyHPVBTo9Lac2uuqK4eRG_=w@mail.gmail.com>
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

On Fri, Nov 28, 2025 at 09:06:50AM -0800, Linus Torvalds wrote:
> On Thu, 27 Nov 2025 at 02:58, Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > Ha!
> >
> > As said elsewhere, it looks like 32-bit ARM has been missing updates to
> > the fault handler since pre-git history - this was modelled in the dim
> > and distant i386 handling, and it just hasn't kept up.
> 
> I actually have this dim memory of having seen something along these
> lines before, and I just had never realized how it could happen,
> because that call to do_page_fault() in do_translation_fault()
> visually *looks* like the only call-site, and so that
> 
>         if (addr < TASK_SIZE)
>                 return do_page_fault(addr, fsr, regs);
> 
> looks like it does everything correctly. That "do_page_fault()"
> function is static to the arch/arm/mm/fault.c file, and that's the
> only place that appears to call it.
> 
> The operative word being "appears".
> 
> Becuse I had never before realized that that fault.c then also does that
> 
>   #include "fsr-2level.c"
> 
> and then that do_page_fault() function is exposed through those
> fsr_info[] operation arrays.
> 
> Anyway, I don't think that the ARM fault handling is all *that* bad.
> Sure, it might be worth double-checking, but it *has* been converted
> to the generic accounting helpers a few years ago and to the stack
> growing fixes.
> 
> I think the fix here may be as simple as this trivial patch:
> 
>   diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
>   index 2bc828a1940c..27024ec2d46d 100644
>   --- a/arch/arm/mm/fault.c
>   +++ b/arch/arm/mm/fault.c
>   @@ -277,6 +277,10 @@ do_page_fault(unsigned long addr, ...
>         if (interrupts_enabled(regs))
>                 local_irq_enable();
> 
>   +     /* non-user address faults never have context */
>   +     if (addr >= TASK_SIZE)
>   +             goto no_context;
>   +
>         /*
>          * If we're in an interrupt or have no user
>          * context, we must not take the fault..
> 
> but I really haven't thought much about it.

In the hack I posted [1], I deliberately avoided modifying
do_page_fault() as it's used on the permission fault path. With your
change above, I'm worried that userspace could simply try to access a
kernel address and that would lead to a panic.

Will

[1] https://lore.kernel.org/all/aShLKpTBr9akSuUG@willie-the-truck/

