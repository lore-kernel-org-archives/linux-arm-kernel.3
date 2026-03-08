Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F340EA8549
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 23:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KFC10ITsr40DiOwH2CX2jApiOfVeGNGtwwFTRVFwlU=; b=htoAptrUd0U4wVw3GtDbivZ89C
	6BssJvTTf9/BaVUVxHq2U+G8qF3+cC4zI7MHHQ5EbR8gLmXFaSGyalp7jPq6f23XNz88ALfk1zo1U
	ETKHtoAlWzwQwAYT26Iv1v1KXIc/LKuis9tritnGxSb74CAD+vdEczvJKa06oEgeAkVnytDc5Y1++
	n3J5cy/vMyfj7UXie5tDWfF05tNd0yjQ7jiU6XX3yDp1NivJFN1we6qlUy4KcHlTpYGhM6Jk2MST2
	1U03KVxHeG0KBZPkkb7xDVW3hbfAPIv/o3Wu0DBS4MetjuHZ3X3CZHuTcUnzN99/sdte64CJEWRRS
	17amu5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzNv5-00000006SHO-2cy8;
	Sun, 08 Mar 2026 23:52:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzNv2-00000006SH3-3cMA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 23:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8KFC10ITsr40DiOwH2CX2jApiOfVeGNGtwwFTRVFwlU=; b=KoCP4773ayjdP4D+ufEvjdLn5c
	5A5jIUrvGOB65Y9t1JM7K3iQc5FyfCaNnVFknEtPP7Us515SN8F0m9NXDmHZdC/yiRqLDYpjnJKY3
	OH4V8PGZ8L7GXaztPiKGiHFwwzLpjHIh7i/AAsq4vSDkRaAqFE0R8AwTzWdQsKrz1xZhSoBdNciGM
	z4IXFs7HKPvgE4O89AgfBnCjim0mxFUKKjrkuJ7vi2NEh1kb6QsE13zrXKvwjvfhPNvZ5f/GW6KBZ
	Trn/f74QcoupY5CRDA/zS6XdAsKmxDTbhQf8iWu5wlHZ3LEfH+yNjI/btBQB4u0ONFtSiS1Z3Bors
	UQ4kysiw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48294)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vzNun-00000000366-3rQO;
	Sun, 08 Mar 2026 23:52:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vzNul-000000003km-1qCt;
	Sun, 08 Mar 2026 23:52:03 +0000
Date: Sun, 8 Mar 2026 23:52:03 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maninder Singh <maninder1.s@samsung.com>
Cc: bigeasy@linutronix.de, peterz@infradead.org, kees@kernel.org,
	ardb@kernel.org, keithpac@amazon.com, linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm: get task_stack reference before dump_backtrace
Message-ID: <aa4Lo30Nq_t7qDqK@shell.armlinux.org.uk>
References: <CGME20260305070534epcas5p378bb22ef9f1a895d7736ed2272c19ec6@epcas5p3.samsung.com>
 <20260305070527.719073-1-maninder1.s@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305070527.719073-1-maninder1.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_165220_928928_EC49BFC0 
X-CRM114-Status: GOOD (  13.66  )
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

On Thu, Mar 05, 2026 at 12:35:27PM +0530, Maninder Singh wrote:
> With Support of THREAD_INFO_IN_TASK, stack of task can be
> freed earlier than task (even if task's reference is taken),
> and it needs separate reference with try_get_task_stack()
> before using the stack.
> Otherwise if someone calls show_stack() for task, it can oops
> the kernel like below: (Tried with normal race of show_stack when
> task still exists, but its stack is freed)

Looking at x86, it also has THREAD_INFO_IN_TASK, but I see nothing like
this in show_stack(). How come x86 isn't similarly buggy?

> 
> 8<--- cut here ---
> Unable to handle kernel paging request at virtual address f8aebec4 when read
> [f8aebec4] *pgd=83c2c811, *pte=00000000, *ppte=00000000
> Internal error: Oops: 7 [#1] SMP ARM
> ..
> CPU: 0 UID: 0 PID: 70 Comm: cat Not tainted 7.0.0-rc2-next-20260302+ #26 VOLUNTARY
> ..
> PC is at __read_once_word_nocheck+0x0/0x8
> LR is at unwind_frame+0x6b0/0xa90
> ...
> Call trace:
>  __read_once_word_nocheck from unwind_frame+0x6b0/0xa90
>  unwind_frame from unwind_backtrace+0x178/0x1e0
>  unwind_backtrace from show_stack+0x10/0x14
> ...

"otherwise if someone calls show_stack() for task" ... and the stack
trace given stops at show_stack() and doesn't show the "someone".

I'd like to know _how_ this happens, and why ARM64 and now 32-bit ARM
are different from x86.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

