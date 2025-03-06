Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BB7C28B24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXdvOxYwm7hM8qFWm7NtjTwP2ih4rX1mA4VgeFJOiEo=; b=Tll7OlC/Yj9Zd8EBkFuGPXsWd7
	Wam1QA+MBudBVeeOreIH3bd3ix6S/wJRe5nPmDdqk4w0tZOOld67e6GaFgxsgJh0RtesW2SVpZ8za
	geDE6pr631a4clKNSQqRYZITeT+Qo7YuR6N05Rq5W4PtpSzD1iyBReWxsAcWkw2iCLZBMmWkxP170
	ci+AjvP2+t5qzlTauWBqajdVkOvDGZMTKagFC/ngP1mwih0Fo1x4/aNVNc0ovEVP6WcjCNEwXN53i
	XKN3B7Oaa5xDFZH5KinpC6ZrfS7uj6rqBST8RjCW5mi6+SlDiHDKdw6RqDR8vetE/bC/HWaHSb2Xw
	gQZOVM3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDUn-0000000BN7Q-2KRC;
	Thu, 06 Mar 2025 15:50:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDRi-0000000BMes-49By
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 15:47:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FB111007;
	Thu,  6 Mar 2025 07:47:51 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3C213F66E;
	Thu,  6 Mar 2025 07:47:36 -0800 (PST)
Date: Thu, 6 Mar 2025 15:47:27 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Bug report] Memory leak in scmi_device_create
Message-ID: <Z8nDj129ZVeZBVSp@pluto>
References: <Z8g8vhS9rqQ_ez48@google.com>
 <Z8iFeEWq16pNQdMa@pluto>
 <Z8mCbc2Z2QGd3f8M@google.com>
 <Z8my4MZ-In0ibxVY@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8my4MZ-In0ibxVY@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_074739_279049_1817FED0 
X-CRM114-Status: GOOD (  32.90  )
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

On Thu, Mar 06, 2025 at 02:36:16PM +0000, Catalin Marinas wrote:
> On Thu, Mar 06, 2025 at 11:09:33AM +0000, Alice Ryhl wrote:
> > On Wed, Mar 05, 2025 at 05:10:16PM +0000, Cristian Marussi wrote:
> > > On Wed, Mar 05, 2025 at 11:59:58AM +0000, Alice Ryhl wrote:
> > > > This was with a kernel running v6.13-rc3, but as far as I can tell, no
> > > > relevant changes have landed since v6.13-rc3. My tree *does* include
> > > > commit 295416091e44 ("firmware: arm_scmi: Fix slab-use-after-free in
> > > > scmi_bus_notifier()"). I've only seen this kmemleak report once, so it's
> > > > not happening consistently.
> > > > 
> > > > See below for the full kmemleak report.
> > > > 
> > > > Alice
> > > > 
> > > > $ sudo cat /sys/kernel/debug/kmemleak
> > > > unreferenced object 0xffffff8106c86000 (size 2048):
> > > >   comm "swapper/0", pid 1, jiffies 4294893094
> > > >   hex dump (first 32 bytes):
> > > >     02 00 00 00 10 00 00 00 c0 01 bc 03 81 ff ff ff  ................
> > > >     60 67 ba 03 81 ff ff ff 18 60 c8 06 81 ff ff ff  `g.......`......
> > > >   backtrace (crc feae9680):
> > > >     [<00000000197aa008>] kmemleak_alloc+0x34/0xa0
> > > >     [<0000000056fe02c9>] __kmalloc_cache_noprof+0x1e0/0x450
> > > >     [<00000000a8b3dfe1>] __scmi_device_create+0xb4/0x2b4
> > > >     [<000000008714917b>] scmi_device_create+0x40/0x194
> > > >     [<000000001818f3cf>] scmi_chan_setup+0x144/0x3b8
> > > >     [<00000000970bad38>] scmi_probe+0x584/0xa78
> > > >     [<000000002600d2fd>] platform_probe+0xbc/0xf0
> > > >     [<00000000f6f556b4>] really_probe+0x1b8/0x520
> > > >     [<00000000eed93d59>] __driver_probe_device+0xe0/0x1d8
> > > >     [<00000000d613b754>] driver_probe_device+0x6c/0x208
> > > >     [<00000000187a9170>] __driver_attach+0x168/0x328
> > > >     [<00000000e3ff1834>] bus_for_each_dev+0x14c/0x178
> > > >     [<00000000984a3176>] driver_attach+0x34/0x44
> > > >     [<00000000fc35bf2a>] bus_add_driver+0x1bc/0x358
> > > >     [<00000000747fce19>] driver_register+0xc0/0x1a0
> > > >     [<0000000081cb8754>] __platform_driver_register+0x40/0x50
> > > > unreferenced object 0xffffff8103bc01c0 (size 32):
> > > 
> > > I could not reproduce on my setup, even though I run a system with
> > > all the existent SCMI protocols (and related drivers) enabled (and
> > > so a lot of device creations) and a downstream test driver that causes
> > > even more SCMI devices to be created/destroyed at load/unload.
> > > 
> > > Coming down the path from scmi_chan_setup(), it seems something around
> > > transport devices creation, but it is not obvious to me where the leak
> > > could hide....
> > > 
> > > ...any particular setup on your side ? ...using LKMs, loading/unloading,
> > > any usage pattern that could help me reproduce ?
> > 
> > I looked into this a bit more, and actually it does happen consistently.
> > It's just that kmemleak doesn't report it until 10 minutes after
> > booting, so I did not notice it.
> 
> You can force the scanning with:
> 
>   echo scan > /sys/kernel/debug/kmemleak
> 
> Just do it a couple of times after boot, no need to wait 10 min for the
> default background scanning.
> 
> > user@rk3588-ci:~$ sudo cat /sys/kernel/debug/kmemleak
> > unreferenced object 0xffffff81068c0000 (size 2048):
> >   comm "swapper/0", pid 1, jiffies 4294893128
> >   hex dump (first 32 bytes):
> >     02 00 00 00 10 00 00 00 40 a3 7a 03 81 ff ff ff  ........@.z.....
> >     60 c8 79 03 81 ff ff ff 18 00 8c 06 81 ff ff ff  `.y.............
> >   backtrace (crc 60df30fb):
> >     kmemleak_alloc+0x34/0xa0
> >     __kmalloc_cache_noprof+0x1e0/0x450
> >     __scmi_device_create+0xb4/0x2b4
> 
> Is this the kzalloc() for sizeof(*scmi_dev)? It's surprisingly large, I
> thought it would go for the kmalloc-1k slab as struct device is below
> this side, at least for my builds. Anyway...
> 
> >     scmi_device_create+0x40/0x194
> >     scmi_chan_setup+0x144/0x3b8
> >     scmi_probe+0x51c/0x9fc
> >     platform_probe+0xbc/0xf0
> >     really_probe+0x1b8/0x520
> >     __driver_probe_device+0xe0/0x1d8
> >     driver_probe_device+0x6c/0x208
> >     __driver_attach+0x168/0x328
> >     bus_for_each_dev+0x14c/0x178
> >     driver_attach+0x34/0x44
> >     bus_add_driver+0x1bc/0x358
> >     driver_register+0xc0/0x1a0
> >     __platform_driver_register+0x40/0x50
> > unreferenced object 0xffffff81037aa340 (size 32):
> >   comm "swapper/0", pid 1, jiffies 4294893128
> >   hex dump (first 32 bytes):
> >     5f 5f 73 63 6d 69 5f 74 72 61 6e 73 70 6f 72 74  __scmi_transport
> >     5f 64 65 76 69 63 65 5f 72 78 5f 31 30 00 ff ff  _device_rx_10...
> >   backtrace (crc 8dab7ca7):
> >     kmemleak_alloc+0x34/0xa0
> >     __kmalloc_node_track_caller_noprof+0x234/0x528
> >     kstrdup+0x48/0x80
> >     kstrdup_const+0x30/0x3c
> 
> These are referenced from the main structure above, so they'd be
> reported as leaks as well.
> 
> This loop in scmi_device_create() looks strange:
> 
> 	list_for_each_entry(rdev, phead, node) {
> 		struct scmi_device *sdev;
> 
> 		sdev = __scmi_device_create(np, parent,
> 					    rdev->id_table->protocol_id,
> 					    rdev->id_table->name);
> 		/* Report errors and carry on... */
> 		if (sdev)
> 			scmi_dev = sdev;
> 		else
> 			pr_err("(%s) Failed to create device for protocol 0x%x (%s)\n",
> 			       of_node_full_name(parent->of_node),
> 			       rdev->id_table->protocol_id,
> 			       rdev->id_table->name);
> 	}
> 
> We can override scmi_dev a few times in the loop and lose the previous
> sdev allocations. Is this intended?

Yes...it is weird..but by design I would say :P ...

...because this is called to instantiate one single device OR instantiate at
once all the multiple devices needed for a protocol: in this latter case it
returns just one of the created devices to signal success or NULL if all the
devices' creation failed....we dont need to keep the allocated devices references
anyway here since on success those devices are now referenced and kept on the
SCMI bus, so they can be searched/scanned/destroyed from there.

But maybe this is the crux of the matter, or what fools kmemleak...I
will try to reproduce again.

Thanks,
Cristian

