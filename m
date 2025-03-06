Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C38C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9u/g5Sv9S270wjV6iCQUW19y+diRdBt2j8yIDmSJ5n8=; b=bKERdrZRopGOao5pHkJJY+4b0w
	vSvYbyxsen37W5jnFAhLRf3HsC3vR30pL6Bt33aaMkXXbIuK5C+LVGn+/KFGCZK46uL+rF7XQj4gh
	O+IJigdG9s+a1csY2PdubvVXpv4z45DRpap4UEspPk+A87/kGHWGLPtWs38ckRD7YzGq74O9thOf7
	XsTVNGIlN2s9RIU6Vi0kYuXWAmJZevAoO6/rGALYy8452EP13oZv28OclwWAHSX0+Rf3YRdLgDR1e
	03XGP08Wp8ORcN4fpwvaN0ruCXIPdZ+hUi+YNKXZbTL5f8IhpJeUg1zmgobbPx4XXoeoYBInsmcZY
	yvrEqlPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqC3x-0000000BBKf-2cTS;
	Thu, 06 Mar 2025 14:19:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAgM-0000000AyDE-4AmE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 12:50:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43E1E1007;
	Thu,  6 Mar 2025 04:50:47 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 392143F673;
	Thu,  6 Mar 2025 04:50:33 -0800 (PST)
Date: Thu, 6 Mar 2025 12:50:17 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Bug report] Memory leak in scmi_device_create
Message-ID: <Z8maCX5QJRqODl6u@pluto>
References: <Z8g8vhS9rqQ_ez48@google.com>
 <Z8iFeEWq16pNQdMa@pluto>
 <Z8mCbc2Z2QGd3f8M@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8mCbc2Z2QGd3f8M@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_045035_141485_4D8CBE4F 
X-CRM114-Status: GOOD (  32.45  )
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

On Thu, Mar 06, 2025 at 11:09:33AM +0000, Alice Ryhl wrote:
> On Wed, Mar 05, 2025 at 05:10:16PM +0000, Cristian Marussi wrote:
> > On Wed, Mar 05, 2025 at 11:59:58AM +0000, Alice Ryhl wrote:
> > > Dear SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE (SCPI/SCMI) Message
> > > Protocol drivers maintainers,
> > > 
> > > I flashed a v6.13-rc3 kernel onto a Rock5B board and noticed the
> > > following output in my terminal:
> > > 
> > > [  687.694465] kmemleak: 4 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
> > > 
> > > It seems that there is a memory leak for devices created with
> > > scmi_device_create.
> > > 
> > `
> > Hi Alice,
> > 
> > thanks for this report.
> > 
> > > This was with a kernel running v6.13-rc3, but as far as I can tell, no
> > > relevant changes have landed since v6.13-rc3. My tree *does* include
> > > commit 295416091e44 ("firmware: arm_scmi: Fix slab-use-after-free in
> > > scmi_bus_notifier()"). I've only seen this kmemleak report once, so it's
> > > not happening consistently.
> > > 
> > > See below for the full kmemleak report.
> > > 
> > > Alice
> > > 
> > > $ sudo cat /sys/kernel/debug/kmemleak
> > > unreferenced object 0xffffff8106c86000 (size 2048):
> > >   comm "swapper/0", pid 1, jiffies 4294893094
> > >   hex dump (first 32 bytes):
> > >     02 00 00 00 10 00 00 00 c0 01 bc 03 81 ff ff ff  ................
> > >     60 67 ba 03 81 ff ff ff 18 60 c8 06 81 ff ff ff  `g.......`......
> > >   backtrace (crc feae9680):
> > >     [<00000000197aa008>] kmemleak_alloc+0x34/0xa0
> > >     [<0000000056fe02c9>] __kmalloc_cache_noprof+0x1e0/0x450
> > >     [<00000000a8b3dfe1>] __scmi_device_create+0xb4/0x2b4
> > >     [<000000008714917b>] scmi_device_create+0x40/0x194
> > >     [<000000001818f3cf>] scmi_chan_setup+0x144/0x3b8
> > >     [<00000000970bad38>] scmi_probe+0x584/0xa78
> > >     [<000000002600d2fd>] platform_probe+0xbc/0xf0
> > >     [<00000000f6f556b4>] really_probe+0x1b8/0x520
> > >     [<00000000eed93d59>] __driver_probe_device+0xe0/0x1d8
> > >     [<00000000d613b754>] driver_probe_device+0x6c/0x208
> > >     [<00000000187a9170>] __driver_attach+0x168/0x328
> > >     [<00000000e3ff1834>] bus_for_each_dev+0x14c/0x178
> > >     [<00000000984a3176>] driver_attach+0x34/0x44
> > >     [<00000000fc35bf2a>] bus_add_driver+0x1bc/0x358
> > >     [<00000000747fce19>] driver_register+0xc0/0x1a0
> > >     [<0000000081cb8754>] __platform_driver_register+0x40/0x50
> > > unreferenced object 0xffffff8103bc01c0 (size 32):
> > 
> > I could not reproduce on my setup, even though I run a system with
> > all the existent SCMI protocols (and related drivers) enabled (and
> > so a lot of device creations) and a downstream test driver that causes
> > even more SCMI devices to be created/destroyed at load/unload.
> > 
> > Coming down the path from scmi_chan_setup(), it seems something around
> > transport devices creation, but it is not obvious to me where the leak
> > could hide....
> > 
> > ...any particular setup on your side ? ...using LKMs, loading/unloading,
> > any usage pattern that could help me reproduce ?
> 
> I looked into this a bit more, and actually it does happen consistently.
> It's just that kmemleak doesn't report it until 10 minutes after
> booting, so I did not notice it.
> 
> As for my setup, well, I boot the kernel over pxe and the rootfs is
> mounted over NFSv4. The memory leak happens even if I don't do anything
> at all - I just boot and wait. The device is a Radxa Rock5B.
> 
> Not sure what other information there is to give.
> 

My question as stated above was mainly to understand if the SCMI stack
was built-in or compiled as loadable modules (lsmod|grep -i scmi)...
...I am just to try to pin down a possible 'more-vulnerable' configuration..
..I could not see any report even triggering a kmemleak scan on v6.14-rc5
BUT I only tested with a fully built-in SCMI stack indeed as of now...so
the question.

> I tried again with v6.14-rc5, and I still got the leak:

Ok...thanks I will investigate with different configs.

Thanks,
Cristian

