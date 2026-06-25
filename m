Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF7ACDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 08:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOZszqMBrYS7JOlBZJmMDKPWZN1V0x6xdDNISbf7dUI=; b=24wsfYuuS3CCvtsi6pvQfZpDqz
	cVtE88KZ7LuL/jUgREeBbm8GHEBDT7d7zP85Po17dOn/hcHf6ZZ6KGMPrkq4mwXXJkf/PtTmAkPqd
	fgB45v1Nj6iRqo5ZPLKKSiSOONkkji0PFHAhu6PbbNLl0/1tlVr0I/qWKLbm9r8gDDT8Hs9eNFhH8
	GUfOHgME0v7VDG4UV5Cu6dXOAMFZE8+31Lu4W4Gldui8HyVsJhpIjF0es8cS2ohcOMAPUAMIOD41U
	IUh6Q+YVZCiElPmbpHQ3x+Z89OFsdEafUIsbV8DG5iB6jwRze9FvE5c0S1titYkIy7pgbMeBZRkCl
	x5e+3t6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfnF-00000008r0L-3Y0I;
	Thu, 25 Jun 2026 08:50:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfnD-00000008qzy-0Qc7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 08:50:40 +0000
Date: Thu, 25 Jun 2026 10:50:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782377435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FOZszqMBrYS7JOlBZJmMDKPWZN1V0x6xdDNISbf7dUI=;
	b=i8WCuLI9qFqXegYkEOURO5ezSHMFVd2u4lSi+b8c6fXZ0gU5E4N94KwqAhq2w2i28IiLEt
	cTkP9tj86wKyoOXdw6yUN/ImRtrhDFf8jNcVEF5gIFTtYeWVNF226lSsOKviohiDM/i9mE
	JdcYra9PgOBSodB5PO/lhDIxhJjpQ6odVSUZc7SqZMfemDC+e+0CxbKtwPBtM2vn+3N1gx
	rCzK9VhmUfXjKECBeIMvIeE0ZzBp0KqqElmo/B18E3N1kszzITwbijLltjq+zp79CgFf7J
	jT5nt7ANJr+Egu1bDlwpFDMQ530ktxR+TkhtbGK6piwfov/ZwAOfTr+Q7Updjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782377435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FOZszqMBrYS7JOlBZJmMDKPWZN1V0x6xdDNISbf7dUI=;
	b=Z22sVkALQHW/DiCA6kPcmCeR/Z6/CiYSX9STVgbCL1+GdnRphuBRSUKKp5Q3Vv0MHiqaUy
	nwMHDvrVIOXd4RBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux@armlinux.org.uk, clrkwllms@kernel.org, rostedt@goodmis.org,
	rmk+kernel@armlinux.org.uk, linusw@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, liaohua4@huawei.com,
	lilinjie8@huawei.com
Subject: Re: [PATCH] ARM: enable interrupts when arm_notify_die() is handling
 user mode errors
Message-ID: <20260625085034.tvyGSmaP@linutronix.de>
References: <20260625073522.182503-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625073522.182503-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_015039_282696_8913C027 
X-CRM114-Status: GOOD (  14.31  )
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

On 2026-06-25 15:35:22 [+0800], Xie Yuanbin wrote:
> For lastest linux-next kernel, with default multi_v7_defconfig, and
> setting CONFIG_PREEMPT_RT=y, CONFIG_DEBUG_ATOMIC_SLEEP=y, and
> CONFIG_PERF_EVENTS=n. When the user program executes bkpt
> instruction, the following WARN will be triggered:
> ```log
> [    3.677825] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> [    3.678002] in_atomic(): 0, irqs_disabled(): 128, non_block: 0, pid: 84, name: test
> [    3.678036] preempt_count: 0, expected: 0
> [    3.678078] RCU nest depth: 0, expected: 0
> [    3.678864] CPU: 0 UID: 0 PID: 84 Comm: test Tainted: G        W           7.1.0-next-20260623 #45 PREEMPT_RT
> [    3.679067] Tainted: [W]=WARN
> [    3.679088] Hardware name: Generic DT based system
> [    3.679198] Call trace:
> [    3.679695]  unwind_backtrace from show_stack+0x10/0x14
> [    3.680363]  show_stack from dump_stack_lvl+0x50/0x5c
> [    3.680377]  dump_stack_lvl from __might_resched+0x160/0x174
> [    3.680393]  __might_resched from rt_spin_lock+0x38/0x138
> [    3.680425]  rt_spin_lock from force_sig_info_to_task+0x1c/0x11c
> [    3.680438]  force_sig_info_to_task from force_sig_fault+0x44/0x64
> [    3.680450]  force_sig_fault from do_PrefetchAbort+0x94/0x9c
> [    3.680461]  do_PrefetchAbort from ret_from_exception+0x0/0x20
> [    3.680513] Exception stack(0xf0ab5fb0 to 0xf0ab5ff8)
> [    3.680653] 5fa0:                                     00000000 bed32e94 bed32e9c 00037954
> [    3.680672] 5fc0: 00000002 00000001 bed32e94 0009d590 00000000 bed32e9c 00000002 00000000
> [    3.680682] 5fe0: bed32d48 bed32d38 00037a00 00037958 60000010 ffffffff
> ```

I don't think this required information as it is obvious. At the very
least you could trim it the needed parts if considered needed.

> When PREEMPT_RT is enabled, force_sig_info() requires interrupts to be
> enabled. Enable interrupts when arm_notify_die() is handling user mode
> errors to fix the issue.
> 
> Fixes: c6e61c06d606 ("ARM: 9463/1: Allow to enable RT")
> 
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>

So I did test the 32bit case on arm64 while testing/ backporting the
breakpoint handling there but apparently did not try it on real
arm32.

For "asm("BKPT #0");" the SIGTRAP is not raised instead I get just
| 8<--- cut here ---
| Unhandled prefetch abort: debug event (0x222) at 0x00000000

on the kernel side and a "Bus error" on userland side.

So
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

for this but actual breakpoint handling might be broken or is it just
me? But then your stack trace looks like mine so :/

Sebastian

