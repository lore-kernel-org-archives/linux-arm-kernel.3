Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4B5C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnoRC8MENm6FOG7GtLgXFwQMWUgLDKOzq6eHxm1QfVw=; b=3atfjeX9PwN9yR6cswMzzVzjkT
	ySrKmpt+fXm947uovtyZia6twXUE6vnb/xTHkhNP1FMg8Y8+pOs1YNJvtn/vc/Stdv3GkoJ4+ssWT
	DC09i7xS3SbGvNxVh2SwyG2zHMa3xAHLbKVkfTVoWax3ZqEwKscy8KUW2h9MdrUU5TJK6yNJRyllu
	HkdX1bNooirK+wbJfSra7TvLKo2g8XhpEx5wc/fQK5PoJf3AIBefEdpluZBeFkl4+d3vpkiZdgiPd
	pNhPqcg8SkT2rn/5nkV2+RxgZo0xlDlkbqfAifsU54GfO0EYeQYJvHXEdAvV/FzHlcg9RdrLNMQnn
	1h7wfxmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquR7-0000000HV5c-35FH;
	Mon, 03 Aug 2026 15:18:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquR6-0000000HV57-03Cf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:18:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B636418E1;
	Mon,  3 Aug 2026 15:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE3F1F000E9;
	Mon,  3 Aug 2026 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785770319;
	bh=rnoRC8MENm6FOG7GtLgXFwQMWUgLDKOzq6eHxm1QfVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zj8N5LncJ9Cjbu5XMUCTq1EhJhO/AiPzFyqHNFzurkJUr47GtQ8m3HDkp/l8XHzes
	 FGMJRMrN9FyA92yn+PFyKoqj/mrhsy/Iajaa5GNiDtTwOkiUJbwchR4AHQQWqVF3g5
	 en/QFdBK+yasIVGbbGNIhuA4rjEYaGmTmGtEq0KoTIYE9++darnOSgxgdJqiVQRHxo
	 DiOeV8Q7XFw5K2iBu12P22D/8JPKW3Z6qH5986svjYvLka7KFcv6a1pKcMwvH3QmOC
	 kc1uPhXrkHSJ3KbSByUeKoWyYAhkxPqmvrkkRB7xAv9tKVzeUSY1qW5ljgDEK0eI7N
	 NP/d/uEJF32mw==
Date: Mon, 3 Aug 2026 16:18:21 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, surenb@google.com, liam@infradead.org, vbabka@kernel.org, 
	shakeel.butt@linux.dev, david@kernel.org, linux-kernel@vger.kernel.org, 
	zhanghongru@xiaomi.com, willy@infradead.org, zhangbo56@xiaomi.com
Subject: Re: [RFC PATCH v1 1/2] x86/mm: use VMA lock for kernel faults on
 user addresses
Message-ID: <anCu3DOrXDeMrwi5@lucifer>
References: <20260802074018.73887-1-baohua@kernel.org>
 <20260802074018.73887-2-baohua@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802074018.73887-2-baohua@kernel.org>
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

On Sun, Aug 02, 2026 at 03:40:17PM +0800, Barry Song (Xiaomi) wrote:
> Use the VMA lock for kernel faults on user addresses. This also
> makes the existing code below meaningful:
>
>   /* Quick path to respond to signals */
>   if (fault_signal_pending(fault, regs)) {
>           if (!user_mode(regs))
>                   kernelmode_fixup_or_oops(regs, error_code, address,
>                                            SIGBUS, BUS_ADRERR,
>                                            ARCH_DEFAULT_PKEY);
>           return;
>   }

Hmm yeah :)

Bit weird it uses user_mode(regs) and the early exit uses the just-set
'flags & FAULT_FLAG_USER' too.

Some horrible duplication here too... the user_mod_regs() etc. code is just
duplicated in the mmap lock path.

I think you mentioned it on Suren/Dave's series but vma_start_read_unlocked()
would avoid all this and could lead to a nicely red patch.

>
> Right now, the code above is dead because !user_mode always
> takes the mmap_lock path.
>
> Co-developed-by: Bo Zhang <zhangbo56@xiaomi.com>
> Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  arch/x86/mm/fault.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> index 45b99c3b1442..c22b74e0eeaf 100644
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
> @@ -1328,9 +1328,6 @@ void do_user_addr_fault(struct pt_regs *regs,
>  	}
>  #endif
>
> -	if (!(flags & FAULT_FLAG_USER))
> -		goto lock_mmap;
> -

I'm not sure why kernel faults of userland memory were excluded initially
(Suren?)

Given that it's OK to take the mmap lock here and we're necessarily in process
context anyway surely it's OK to take the VMA lock?

It looks fine to me but want Suren's input.

Also given vma_start_read_unlocked() is coming maybe that's better for a
cleanup.

And finally - Willy is working on a grand clean up of this stuff _I think_ so
you probably should coordinate with him also?

>  	vma = lock_vma_under_rcu(mm, address);
>  	if (!vma)
>  		goto lock_mmap;
> --
> 2.39.3 (Apple Git-146)
>

--
Cheers, Lorenzo

