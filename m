Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A682C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 17:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfL/HNxPZCLighxAwrw1wsptNcWt6XOYvY2PuLqLacw=; b=uwSv/rYTrYk1SnW/nZz0vuq06G
	sllhVC6J1vuXzZ+Rhr8MNssdQ6gkuJvnHvYF04wnPzXITNQWjdMdqYEM/ViGHDddI3KLHbbXOhXJv
	LzhzW6zGs8Oo92KWN6VH+9HpHfemCY5asxU2xbuE8DqQegRSFAkJzt2F7qVTA/C/H92PB0AuA2u/G
	Et+6V4XYen8X4BZZ+8vBfLglN/in4/DPeaaxiWPwSKcrd656SYnx1YzyF39l2Ns+JzwkqKr7KXPkH
	DutMvVgYCu0XXbkY5msYh7v0s0RUoWJYBhvlmjKrX+FNmmsZtWPnuwiY+jSFlTUFnodxjtfSzOX9h
	dNhSRpqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsJK-00000008lwa-0jiO;
	Wed, 05 Mar 2025 17:13:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsGL-00000008lZx-3YbF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 17:10:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF9EEFEC;
	Wed,  5 Mar 2025 09:10:39 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD4223F66E;
	Wed,  5 Mar 2025 09:10:25 -0800 (PST)
Date: Wed, 5 Mar 2025 17:10:16 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Bug report] Memory leak in scmi_device_create
Message-ID: <Z8iFeEWq16pNQdMa@pluto>
References: <Z8g8vhS9rqQ_ez48@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8g8vhS9rqQ_ez48@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_091029_928861_A66DBD68 
X-CRM114-Status: GOOD (  17.49  )
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

On Wed, Mar 05, 2025 at 11:59:58AM +0000, Alice Ryhl wrote:
> Dear SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE (SCPI/SCMI) Message
> Protocol drivers maintainers,
> 
> I flashed a v6.13-rc3 kernel onto a Rock5B board and noticed the
> following output in my terminal:
> 
> [  687.694465] kmemleak: 4 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
> 
> It seems that there is a memory leak for devices created with
> scmi_device_create.
> 
`
Hi Alice,

thanks for this report.

> This was with a kernel running v6.13-rc3, but as far as I can tell, no
> relevant changes have landed since v6.13-rc3. My tree *does* include
> commit 295416091e44 ("firmware: arm_scmi: Fix slab-use-after-free in
> scmi_bus_notifier()"). I've only seen this kmemleak report once, so it's
> not happening consistently.
> 
> See below for the full kmemleak report.
> 
> Alice
> 
> $ sudo cat /sys/kernel/debug/kmemleak
> unreferenced object 0xffffff8106c86000 (size 2048):
>   comm "swapper/0", pid 1, jiffies 4294893094
>   hex dump (first 32 bytes):
>     02 00 00 00 10 00 00 00 c0 01 bc 03 81 ff ff ff  ................
>     60 67 ba 03 81 ff ff ff 18 60 c8 06 81 ff ff ff  `g.......`......
>   backtrace (crc feae9680):
>     [<00000000197aa008>] kmemleak_alloc+0x34/0xa0
>     [<0000000056fe02c9>] __kmalloc_cache_noprof+0x1e0/0x450
>     [<00000000a8b3dfe1>] __scmi_device_create+0xb4/0x2b4
>     [<000000008714917b>] scmi_device_create+0x40/0x194
>     [<000000001818f3cf>] scmi_chan_setup+0x144/0x3b8
>     [<00000000970bad38>] scmi_probe+0x584/0xa78
>     [<000000002600d2fd>] platform_probe+0xbc/0xf0
>     [<00000000f6f556b4>] really_probe+0x1b8/0x520
>     [<00000000eed93d59>] __driver_probe_device+0xe0/0x1d8
>     [<00000000d613b754>] driver_probe_device+0x6c/0x208
>     [<00000000187a9170>] __driver_attach+0x168/0x328
>     [<00000000e3ff1834>] bus_for_each_dev+0x14c/0x178
>     [<00000000984a3176>] driver_attach+0x34/0x44
>     [<00000000fc35bf2a>] bus_add_driver+0x1bc/0x358
>     [<00000000747fce19>] driver_register+0xc0/0x1a0
>     [<0000000081cb8754>] __platform_driver_register+0x40/0x50
> unreferenced object 0xffffff8103bc01c0 (size 32):

I could not reproduce on my setup, even though I run a system with
all the existent SCMI protocols (and related drivers) enabled (and
so a lot of device creations) and a downstream test driver that causes
even more SCMI devices to be created/destroyed at load/unload.

Coming down the path from scmi_chan_setup(), it seems something around
transport devices creation, but it is not obvious to me where the leak
could hide....

...any particular setup on your side ? ...using LKMs, loading/unloading,
any usage pattern that could help me reproduce ?

Thanks,
Cristian

