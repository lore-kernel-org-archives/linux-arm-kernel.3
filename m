Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1302FC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 16:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUI8HSQOXw19CzEPGprG8sSdxiuNnVK73lzrGltq7Hg=; b=t6gctclTjnwCbbMZ1l593q45zw
	9DufvR2cI/gFQuBM+e+ltPEUOmnEYy1MtDxis3l6q1gs+/78YXTlk0KIg3PGndhM+TPofiP0XNxyX
	EG9g0yYlp4WdqHRCx+h56oRMRVrDN4icCFJpJxomoyUoomJAXxg1VEWT4BDPWBDVF9LvHVOzEuup0
	IOvsnx9+52kWjcfzYtpUyGmSDqV22o0OXkS5YqNlQ40aYVfi9xwMuS8SBp9dj+nIT/PBqG1Kt+Zzz
	tmf7fXjMatEFJIl1mmsAA9atwy+GfIJyvxvpyBB1ag1nMbn+tajiHQtkeiNdSbdR0wVtHjVqbD7Dv
	t8azs7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlUC0-000000059we-0cpz;
	Sun, 19 Jul 2026 16:16:40 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlUBx-000000059w6-23Pm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 16:16:39 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id D2C601D0008A;
	Sun, 19 Jul 2026 12:16:33 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Sun, 19 Jul 2026 12:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784477793;
	 x=1784564193; bh=gUI8HSQOXw19CzEPGprG8sSdxiuNnVK73lzrGltq7Hg=; b=
	KzDXjZfrgAUl2dEnS+vRuOSZS2ScnRK3O3VDLx8AkyDaxd7/8hXJ8nVdyQ1ovfpQ
	IZd1GerY8DD19fG3B8CwdyQxlztkZDlZeWBeOmgM2Y5AKsynbnztbYOpKYe0SAbv
	HTmcP1DOjfeYh7qgp+Gj6mFtCG/PABgKkXTzp4HDnqIZGIq2qUuJcK6QWgtYiqOd
	OgwypOKkdOPjO9UmFR7Vhyu+XFoTz04td0e6xElef5XsScNvGYoSaXm+I0XT67F6
	uzqxi9CRHNgq3OO89qQq2013KhPH6fmkCe+ehTgcZ2iXmD2kvyjl/ESIcLd8+EQ3
	bXR9/MVitfpxnXWkceeTMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784477793; x=
	1784564193; bh=gUI8HSQOXw19CzEPGprG8sSdxiuNnVK73lzrGltq7Hg=; b=p
	fGox4F7LtzBaRhltglocYc2n8QSaZ3HQExqQ4BzEZRbmcD34sfqCYjnn2UckP+4Q
	IKJvI0xEvA9aqq0XgrjsxEZhWvc24DgzLxLyXsKEaLszDoK+zKgr3Sf0umL3e4gG
	tSve268bCrJcYNgQ5J880v5zovjlvxGKG4UQMQcbXNDhg+LUynp7LYPxSgvQXRY5
	Hef7gIJrHoVX96Vhs+l0DXPAuxRWDsWfEQfaLiu9+fTvInr9mKKyQvzslli/4lw6
	sy2gQmqgJxiNv9ykZNXkKZeJ0FpZFkfdM4ZYJfONU0tnagbygeZmYH8lc8nzWSSF
	FYmn8nN9JnKeLXgj1a3eg==
X-ME-Sender: <xms:YfhcamL5gP77W5b5EtW--sUoHioqCmwJUZEWkMmr5N_8bUF5F6o8Hw>
    <xme:Yfhcao8O3_pUc1hV_UhdNpqSrJjI4PsI9zGqSYhgtSMOuFGIMJ_nptmDYLfunt9R1
    7OPMVVEW5i7OCJUW82YLWq81TW3MLIXusaYksPz-qfqL7TP_p0W7pA>
X-ME-Proxy-Cause: dmFkZTFZIUlrs9grJOP06jOOFcoKJfWGUmI+xcYEiHT2X0/Yq5Uc1CZHrWm6uAvYf8eyky
    ILq8pHiuNd5DlTAMqquKf6pBfFJRrz0JdkjQJdUKU2a/sk15Z8mEsnyrf4UuG068H2uayW
    jTmQV6pE1tbK3u6aTNt+AjMoMFc7+bBip33x4T/Zpq0VwpAzXvfMepJ78YhZfEPT6TY5nK
    UvRqB+kTH8Srlk3Rlh3K7cGiUhIuet4s9FiVQ+aPtispo9FhX7VtW5coD9f51JlJJ1PVms
    RBa7PQ8UntvhBS9uBT8tkIUEH/43MZs5VandMnOrBMRS2a2C4aPc080lC7FfFpWVlqFUUr
    H0+i0Dej4u7LwrGD8mbDsd8aqmIyy3NIs8yycQObnFwtL4cs+fDdNXLHKckx36srmbICq0
    0KvlG6L/GJUXFil4e0QpBGWeNJ79oxX3GZ7zPykfroXW3ba2Je+aZHpTOK0H7w0ocx5JGe
    wUWIQxs4Hj3XfbS+kqZ5s3xQcZUivyHdlmFAn+gBD4uPH+8rqwLgiyK4jwe+C0gjz1LTYo
    eNz4YyLM6nTj/Wyce5G5NRU1XH6GanhyXnJiWJp1pK7kSK8xnPjceSTSN9QXeGEOJu6H9Q
    THSU4ZgF8SLuKtGNvIu1fTleo5LfrtFeisT+088KU9xRkTxnTNhuJxtyGh9Q
X-ME-Proxy: <xmx:Yfhcam9q4ygoHsMT5eRhCff3fZfa2JF0rwm2K5ecLBHAurVXaUw87A>
    <xmx:YfhcaqZMORLks6V5zc4XLFnymNVSU73OwBri7fy8g60jCnXBV_ZU7A>
    <xmx:Yfhcal0hDiMPWepO8AkE1DrPJrEmjwPd5dzuRPkG0K-5SXSzAwL_XQ>
    <xmx:YfhcalYyp-oiFPXhzgAClejWD-Jqye54OCwW4EBkl6roK-DJc_-msw>
    <xmx:YfhcakHrlrT1xoapI4m5ir4xQhUadEksdz6p4bzhd5zwODxZShVFbgEy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5B922182007E; Sun, 19 Jul 2026 12:16:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A1Km0dGv5oGo
Date: Sun, 19 Jul 2026 18:15:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: linux-rt-devel@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Message-Id: <c919c86b-2e12-487a-8b25-66540bca0ecf@app.fastmail.com>
In-Reply-To: <20260718214515.11275-1-kmehltretter@gmail.com>
References: <20260718214515.11275-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] ARM: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_091637_788987_07BDBA2E 
X-CRM114-Status: GOOD (  13.79  )
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

On Sat, Jul 18, 2026, at 23:45, Karl Mehltretter wrote:
> Commit c6e61c06d606 ("ARM: 9463/1: Allow to enable RT") enabled PREEMPT_RT
> on ARM but did not select HAVE_POSIX_CPU_TIMERS_TASK_WORK. This leaves
> CONFIG_POSIX_CPU_TIMERS_TASK_WORK disabled, so CPU timers expire in hard
> IRQ context.
>
> On PREEMPT_RT this makes run_posix_cpu_timers() take the sleeping
> sighand->siglock:
>
>   BUG: sleeping function called from invalid context at spinlock_rt.c:48
>     rt_spin_lock from lock_task_sighand
>     lock_task_sighand from run_posix_cpu_timers
>     run_posix_cpu_timers from update_process_times
>
> ARM handles TIF_NOTIFY_RESUME on all return-to-user paths, including v7-M.
> ARM32 KVM host support was removed by commit 541ad0150ca4 ("arm: Remove
> 32bit KVM host support"), so the select need not be conditional on KVM.
>
> Select it to defer POSIX CPU timer expiry to task context.
>
> Reproduced with setrlimit(RLIMIT_CPU, ...) and a busy loop. The same path
> is used by setitimer(ITIMER_PROF or ITIMER_VIRTUAL) and POSIX CPU timers
> created with timer_create().
>
> Fixes: c6e61c06d606 ("ARM: 9463/1: Allow to enable RT")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Indeed selecting HAVE_POSIX_CPU_TIMERS_TASK_WORK was previously
part of the RT patch [1] set but got lost during one of the
updates before the patch got merged.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> Found with a self-hosted syzkaller instance patched to fuzz kernels on
> QEMU's versatilepb machine (ARM926EJ-S, ARMv5TE). Runtime-tested before
> and after the change on that setup

Good to hear that this configuration works with your patch,
I don't think many people have tested ARMv5 RT recently.

    Arnd

[1] https://lore.kernel.org/all/20251030152253.tK-rY89Y@linutronix.de/

