Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FC6CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 10:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rz76Dd60dRCLEdbk6g0uD4CbDOYdGaypGdAXa1TRKaQ=; b=zxGkQSYNGwAC5tqxi7MQl42pMD
	IYIQKrdraeRXfDb7oa4cqfO5jKtIBYfG46PH0hFTK7n7wa/+G9+yJC5zi76RfIFn6VU67wO4s3T3j
	h4UD2cdf1/QhuHyjOrWNVIfH/ELJA9EKwvKJoIX9hWeDF10gGRCqr5Rf+3Nnfy8nxv5GuEVisRKAD
	Yin3vBCzITSIvN1YSPH1r9/M21DKILNGvRVSgDe6IGTqrG2gJh4lrnX1F/tuVX4NVMJmsQO+ji5V0
	YZRohejDtzLec/ZRTWmJjfjhg2V8vVuzGbHmz68Ovi7wDLZgZbVYvCKLxmW/3CHwfGiomUxb+B0/R
	o5GAej8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPIT5-00000001THk-3h9Z;
	Sat, 29 Nov 2025 10:46:19 +0000
Received: from mailtransmit05.runbox.com ([2a0c:5a00:149::26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPIT3-00000001THM-2ldZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 10:46:19 +0000
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight@runbox.com>)
	id 1vPISa-0019Z2-V7; Sat, 29 Nov 2025 11:45:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
	bh=rz76Dd60dRCLEdbk6g0uD4CbDOYdGaypGdAXa1TRKaQ=; b=m+/uBwielV5XAgVggL5ooFl1dH
	itFJp1+BXorKcECoZRk5oXzd1aG7xN+kSUQS1nk1Zwmeor28FFdDu2FbrgCdlsjsX+8aPKAgXXWjf
	DmpfLdV3Z5l860gBJtwQ9Rd0tHcGMxQ1eoC8DclO84CXSUU/4cj0y4Hw0LCwwSXFxRtVSAvO0TXPy
	4XodTjHH5cOefWS7PwgczvGxjTa36bKsJy8ZAcm2D1X20HEpS+DZxHaKnt/xTSZ+jPXYecLrJ59K5
	EK9PJ1G1v76UaTphXy2CENRP02whjL9REH3czcS9Msg1dPWzNfZcDxfJb7/AA2sgIxqMiuoaQtIHF
	r4CFeJbA==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight@runbox.com>)
	id 1vPISZ-0005kN-1q; Sat, 29 Nov 2025 11:45:47 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vPISJ-004Clu-SN; Sat, 29 Nov 2025 11:45:32 +0100
Date: Sat, 29 Nov 2025 10:45:28 +0000
From: david laight <david.laight@runbox.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, torvalds@linux-foundation.org,
 will@kernel.org, linux@armlinux.org.uk, bigeasy@linutronix.de,
 rmk+kernel@armlinux.org.uk, akpm@linux-foundation.org, brauner@kernel.org,
 catalin.marinas@arm.com, hch@lst.de, jack@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, pangliyuan1@huawei.com,
 wangkefeng.wang@huawei.com, wozizhi@huaweicloud.com, yangerkun@huawei.com,
 lilinjie8@huawei.com, liaohua4@huawei.com
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
Message-ID: <20251129104528.03aca5d3@pumpkin>
In-Reply-To: <20251129090813.GK3538@ZenIV>
References: <CAHk-=wjA20ear0hDOvUS7g5-A=YAUifphcf-iFJ1pach0=3ubw@mail.gmail.com>
	<20251129040817.65356-1-xieyuanbin1@huawei.com>
	<20251129090813.GK3538@ZenIV>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_024617_879910_8F186C0F 
X-CRM114-Status: GOOD (  25.48  )
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

On Sat, 29 Nov 2025 09:08:13 +0000
Al Viro <viro@zeniv.linux.org.uk> wrote:

> On Sat, Nov 29, 2025 at 12:08:17PM +0800, Xie Yuanbin wrote:
> 
> > I think the `user_mode(regs)` check is necessary because the label
> > no_context actually jumps to __do_kernel_fault(), whereas page fault
> > from user mode should jump to `__do_user_fault()`.
> > 
> > Alternatively, we would need to change `goto no_context` to
> > `goto bad_area`. Or perhaps I misunderstood something, please point it out.  
> 
> FWIW, goto bad_area has an obvious problem: uses of 'fault' value, which
> contains garbage.
> 
> The cause of problem is the heuristics in get_mmap_lock_carefully():
> 	if (regs && !user_mode(regs)) {
> 		unsigned long ip = exception_ip(regs);
> 		if (!search_exception_tables(ip))
> 			return false;
> 	}
> trylock has failed and we are trying to decide whether it's safe to block.
> The assumption (inherited from old logics in assorted page fault handlers)
> is "by that point we know that fault in kernel mode is either an oops
> or #PF on uaccess; in the latter case we should be OK with locking mm,
> in the former we should just get to oopsing without risking deadlocks".
> 
> load_unaligned_zeropad() is where that assumption breaks - there is
> an exception handler and it's not an uaccess attempt; the address is
> not going to match any VMA and we really don't want to do anything
> blocking.

Doesn't that also affect code that (ab)uses get_user() for kernel addresss?
For x86 even __get_kernel_nofault() does that.
In that case it hits a normal 'user fault' exception table entry rather
a 'special' one that could be marked as such.

> 
> Note that VMA lookup will return NULL there anyway - there won't be a VMA
> for that address.  What we get is exactly the same thing we'd get from
> do_bad_area(), whether we get a kernel or userland insn faulting.
> 
> The minimal fix would be something like
> 	if (unlikely(addr >= TASK_SIZE) && !(flags & FAULT_FLAG_USER))
> 		goto no_context;

Is there an issue with TASK_SIZE being process dependant?
Don't you want 'the bottom of kernel addresses' not 'the top of the current process'.

	David

> 
> right before
> 	if (!(flags & FAULT_FLAG_USER))
> 		goto lock_mmap;
> 
> in do_page_fault().  Alternatively,
> 	if (unlikely(addr >= TASK_SIZE)) {
> 		do_bad_area(addr, fsr, regs);
> 		return 0;
> 	}
> or
> 	if (unlikely(addr >= TASK_SIZE)) {
> 		fault = 0;
> 		code = SEGV_MAPERR;
> 		goto bad_area;
> 	}
> at the same place.  Incidentally, making do_bad_area() return 0 would
> seem to make all callers happier...
> 


