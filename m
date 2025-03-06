Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6934C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 18:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUxV5oF7R5zWqAG2FezlM43TbgWBmnhL4GfIJEQo8fY=; b=YLFISfmmTwt7DJRYbvtGp5tnl4
	0GUweNsPUD8esxqe3PEmXZbblLaEN4ipRuPeFkpgA/6BWsdTEWSbSxRipNMofBWSbdJni+izKAgOR
	1iXPwtQZBIvvd9mN9kLOn5MBv16B7E2UqxrsXJIOoYY1m9lli3R9KgqvFB+KKZNW4mvsvzSMOEXMz
	tSE7b6k7F8TcdW+VkqjSDhmRhlQijbfFjJhQ6CfjZGGGVsDOioZUP5iIYYldDl2qx9zaXVSr8HL15
	RxJWrk8V4dXJwZ1sUu37wTyEfUY/va6whTCX3/jJW8VAiWDwIrMRzLA9EBccEzjWn6+UNFu0YjdDo
	vtNCdtMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGFH-0000000Bu8D-2Yqz;
	Thu, 06 Mar 2025 18:46:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGCI-0000000BtlT-13Yk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 18:43:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59F68169E;
	Thu,  6 Mar 2025 10:44:03 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE5EE3F673;
	Thu,  6 Mar 2025 10:43:48 -0800 (PST)
Date: Thu, 6 Mar 2025 18:43:45 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Bug report] Memory leak in scmi_device_create
Message-ID: <Z8ns4T6pas9DEy8B@pluto>
References: <Z8g8vhS9rqQ_ez48@google.com>
 <Z8iFeEWq16pNQdMa@pluto>
 <Z8mCbc2Z2QGd3f8M@google.com>
 <Z8my4MZ-In0ibxVY@arm.com>
 <Z8nDj129ZVeZBVSp@pluto>
 <Z8nK3uFkspy61yjP@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8nK3uFkspy61yjP@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_104354_489136_66E04936 
X-CRM114-Status: GOOD (  28.38  )
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

On Thu, Mar 06, 2025 at 04:18:38PM +0000, Catalin Marinas wrote:
> On Thu, Mar 06, 2025 at 03:47:27PM +0000, Cristian Marussi wrote:
> > On Thu, Mar 06, 2025 at 02:36:16PM +0000, Catalin Marinas wrote:
> > > This loop in scmi_device_create() looks strange:
> > > 
> > > 	list_for_each_entry(rdev, phead, node) {
> > > 		struct scmi_device *sdev;
> > > 
> > > 		sdev = __scmi_device_create(np, parent,
> > > 					    rdev->id_table->protocol_id,
> > > 					    rdev->id_table->name);
> > > 		/* Report errors and carry on... */
> > > 		if (sdev)
> > > 			scmi_dev = sdev;
> > > 		else
> > > 			pr_err("(%s) Failed to create device for protocol 0x%x (%s)\n",
> > > 			       of_node_full_name(parent->of_node),
> > > 			       rdev->id_table->protocol_id,
> > > 			       rdev->id_table->name);
> > > 	}
> > > 
> > > We can override scmi_dev a few times in the loop and lose the previous
> > > sdev allocations. Is this intended?
> > 
> > Yes...it is weird..but by design I would say :P ...
> > 
> > ...because this is called to instantiate one single device OR instantiate at
> > once all the multiple devices needed for a protocol: in this latter case it
> > returns just one of the created devices to signal success or NULL if all the
> > devices' creation failed....we dont need to keep the allocated devices references
> > anyway here since on success those devices are now referenced and kept on the
> > SCMI bus, so they can be searched/scanned/destroyed from there.
> 
> Not sure why the pointer isn't found, device_add() should link it with
> the parent. Unless something else fails, the parent is freed and the
> linked devices unreachable. I'm not familiar at all with this code, I
> just saw kmemleak and thought of replying.
> 
> The loop is still weird, scmi_chan_setup() seems to use the pointer to
> scmi_device for something more meaningful than a pass/fail check. Also
> the overall result is based only on what the last __scmi_device_create()
> return value was, irrespective of the previous iterations of the loop.
> You do have a pr_err() but no early bailing out of the loop on failure.
> I'm curious if there are any SCMI errors in the Alice's kernel log.
> 

Yes, the weirdness comes from the fact such function is used alternatively
to create a single named device (and make some use of it, like in
scmi_chan_setup) OR to create a bunch of devices for the same protocol
when no specific device is asked for (name==NULL)...anyway the case at
hand that kmemleak complains about does NOT pass through that weird loop...

...good news is, I was able to reproduce a similar report consistently
with a load/unload/load sequence....the culprit is that when looking for
a device to destroy on unload, the SCMI bus uses device_find_child()
and that bumps the device refcnt implicitly...as a result when the device
is destroyed the refcnt is NEVER found as zero and so NO device_release
is ever called...this results in dev->p private_data to be never released
and that is what kmemleak spotted (at the start of teh chain):


unreferenced object 0xffff00000f583800 (size 512):
      comm "insmod", pid 227, jiffies 4294912190
      hex dump (first 32 bytes):
        00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
        ff ff ff ff ff ff ff ff 60 36 1d 8a 00 80 ff ff  ........`6......
      backtrace (crc 114e2eed):
        kmemleak_alloc+0xbc/0xd8
        __kmalloc_cache_noprof+0x2dc/0x398
        device_add+0x954/0x12d0
        device_register+0x28/0x40
        __scmi_device_create.part.0+0x1bc/0x380
        scmi_device_create+0x2d0/0x390
        scmi_create_protocol_devices+0x74/0xf8
        scmi_device_request_notifier+0x1f8/0x2a8
        notifier_call_chain+0x110/0x3b0
        blocking_notifier_call_chain+0x70/0xb0
        scmi_driver_register+0x350/0x7f0
        0xffff80000a3b3038
        do_one_initcall+0x12c/0x730
        do_init_module+0x1dc/0x640
        load_module+0x4b20/0x5b70
        init_module_from_file+0xec/0x158
    
    $ ./scripts/faddr2line ./vmlinux device_add+0x954/0x12d0
    device_add+0x954/0x12d0:
    kmalloc_noprof at include/linux/slab.h:901
    (inlined by) kzalloc_noprof at include/linux/slab.h:1037
    (inlined by) device_private_init at drivers/base/core.c:3510
    (inlined by) device_add at drivers/base/core.c:3561

I am posting a fix.

Thanks for the report and the help.
Any feedback and testing is much welcomed :D

Cristian

