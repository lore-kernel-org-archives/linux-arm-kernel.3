Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14675C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 09:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0vprSm7UOHiqG2FrYoa9wbD3ONqT6FKCMoqyjM6UQI=; b=i5aTXo5j5UUqzupzgQykZCuG9f
	+cxkQt3delq5zpEvA9lopyzs7clQ1AjnGn5ornUOJ5zAVWjbkLO32rnPxpy9gvCyy06R1M51zwSQ6
	7kCasFhbDPmVLZX6vA3kh0xRewkGHKJOuIU2FfX4rRl0MlFM8z1VXF+NIOzsQYXK0vBhjESlc8u9J
	L0YIIXOpfnVDZV+IU76JX1E9vwTU8n1dQX+LC1T/YMkeSEfAQ1utVk8blBlZVU7G/VZmpw2KsUnoQ
	49KYiUHJXxMR9ssasMRuBj5adaiLh+3El9EBODPWVrEDJ/RHBB49fdK9g1lD/5IG74ztKOBIreHnH
	zx59qpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUCt-0000000DkN7-0YLn;
	Fri, 07 Mar 2025 09:41:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUBF-0000000DkHz-29s8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 09:39:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5C37150C;
	Fri,  7 Mar 2025 01:39:56 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE8603F66E;
	Fri,  7 Mar 2025 01:39:42 -0800 (PST)
Date: Fri, 7 Mar 2025 09:39:34 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Balance device refcount when
 destroying devices
Message-ID: <Z8q-1jOng_nYP445@pluto>
References: <20250306185447.2039336-1-cristian.marussi@arm.com>
 <Z8q9l0vDTLpbo8UR@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8q9l0vDTLpbo8UR@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_013945_597800_9AE3AE5E 
X-CRM114-Status: GOOD (  16.17  )
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

On Fri, Mar 07, 2025 at 09:34:15AM +0000, Alice Ryhl wrote:
> On Thu, Mar 06, 2025 at 06:54:47PM +0000, Cristian Marussi wrote:
> > Using device_find_child() to lookup the proper SCMI device to destroy
> > causes an unbalance in device refcount, since device_find_child() calls an
> > implicit get_device(): this, in turns, inhibits the call of the provided
> > release methods upon devices destruction.
> > 
> > As a consequence, one of the structures that is not freed properly upon
> > destruction is the internal struct device_private dev->p populated by the
> > drivers subsystem core.
> > 
> > KMemleak detects this situation since loading/unloding some SCMI driver
> > causes related devices to be created/destroyed without calling any
> > device_release method.
> > 
> > unreferenced object 0xffff00000f583800 (size 512):
> >   comm "insmod", pid 227, jiffies 4294912190
> >   hex dump (first 32 bytes):
> >     00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
> >     ff ff ff ff ff ff ff ff 60 36 1d 8a 00 80 ff ff  ........`6......
> >   backtrace (crc 114e2eed):
> >     kmemleak_alloc+0xbc/0xd8
> >     __kmalloc_cache_noprof+0x2dc/0x398
> >     device_add+0x954/0x12d0
> >     device_register+0x28/0x40
> >     __scmi_device_create.part.0+0x1bc/0x380
> >     scmi_device_create+0x2d0/0x390
> >     scmi_create_protocol_devices+0x74/0xf8
> >     scmi_device_request_notifier+0x1f8/0x2a8
> >     notifier_call_chain+0x110/0x3b0
> >     blocking_notifier_call_chain+0x70/0xb0
> >     scmi_driver_register+0x350/0x7f0
> >     0xffff80000a3b3038
> >     do_one_initcall+0x12c/0x730
> >     do_init_module+0x1dc/0x640
> >     load_module+0x4b20/0x5b70
> >     init_module_from_file+0xec/0x158
> > 
> > $ ./scripts/faddr2line ./vmlinux device_add+0x954/0x12d0
> > device_add+0x954/0x12d0:
> > kmalloc_noprof at include/linux/slab.h:901
> > (inlined by) kzalloc_noprof at include/linux/slab.h:1037
> > (inlined by) device_private_init at drivers/base/core.c:3510
> > (inlined by) device_add at drivers/base/core.c:3561
> > 
> > Balance device refcount by issuing a put_device() on devices found via
> > device_find_child().
> > 
> > Reported-by: Alice Ryhl <aliceryhl@google.com>
> > Closes: https://lore.kernel.org/linux-arm-kernel/Z8nK3uFkspy61yjP@arm.com/T/#mc1f73a0ea5e41014fa145147b7b839fc988ada8f
> > CC: Sudeep Holla <sudeep.holla@arm.com>
> > CC: Catalin Marinas <catalin.marinas@arm.com>
> > Fixes: d4f9dddd21f3 ("firmware: arm_scmi: Add dynamic scmi devices creation")
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> I was not able to reproduce the memory leak after applying this patch.
> 
> Tested-by: Alice Ryhl <aliceryhl@google.com>

Thanks a lot for testing (and for the report) !

Cristian


