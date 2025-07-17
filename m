Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6397BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 17:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EluqO2moZ07z54L0ghbT5HaZt1N6sU75p1MHiMf6X4=; b=2WoXl+n8oAvyThVlBVJXgWVBXb
	+nNrM8N55E3Oq/jb7oAsaah6ongwy5h3Uajnm6kE4sElbgrOogzLo6+q7ipc3iZYG6g7Adj8JLcPj
	4a4zOmX8O4Me6i1Dse1PxXKr+NrYbjct2kPinGmv7XqA+KCkebl2j/L1aprE4hCszXXCowSLprPvt
	io5qybLEfyAhZTcUIvuOb4SXd+Iozrh5/1EqVK2dfeFtEe+CV80WSlJXNy/omtQX948Q3YgOc2Xtn
	RwhZ07Or31Wax9cX2+GqDOwtbmBjpLj/WNCmysiVv9iZ7vXK/jUXgjVwfeNgVzfbonNiwqcYBk4aP
	v/w//bDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSC2-0000000AlZm-1Xdc;
	Thu, 17 Jul 2025 17:14:50 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucS9Y-0000000AlBD-2Sra
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 17:12:18 +0000
Message-ID: <5ee4bac4-957b-481a-8608-15886da458c2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752772333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EluqO2moZ07z54L0ghbT5HaZt1N6sU75p1MHiMf6X4=;
	b=ckjsxq98tfEm25Th4zH5CRqje3rC68aGTOC/Bz9djpqcTCgTf7FWRD/UptBN0Z8iycl2fz
	Urr+zWCtba04bzEP+CB2lSUU7vfWCQcHB1Q4/Eo5D2a1CgSN2dm79DE3nsMuIvl/8Oxqg7
	GOayi3n/u+4ztkqeCj69hLCLZkwdNdg=
Date: Thu, 17 Jul 2025 13:12:08 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net v2 1/4] auxiliary: Support hexadecimal ids
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Dave Ertman <david.m.ertman@intel.com>,
 Saravana Kannan <saravanak@google.com>, Leon Romanovsky <leon@kernel.org>,
 linux-kernel@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Ira Weiny <ira.weiny@intel.com>
References: <20250716000110.2267189-1-sean.anderson@linux.dev>
 <20250716000110.2267189-2-sean.anderson@linux.dev>
 <2025071637-doubling-subject-25de@gregkh>
 <719ff2ee-67e3-4df1-9cec-2d9587c681be@linux.dev>
 <2025071747-icing-issuing-b62a@gregkh>
 <5d8205e1-b384-446b-822a-b5737ea7bd6c@linux.dev>
 <2025071736-viscous-entertain-ff6c@gregkh>
 <03e04d98-e5eb-41c0-8407-23cccd578dbe@linux.dev>
 <2025071726-ramp-friend-a3e5@gregkh>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <2025071726-ramp-friend-a3e5@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_101217_272132_7C876470 
X-CRM114-Status: GOOD (  31.27  )
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

On 7/17/25 12:33, Greg Kroah-Hartman wrote:
> On Thu, Jul 17, 2025 at 12:27:44PM -0400, Sean Anderson wrote:
>> On 7/17/25 12:21, Greg Kroah-Hartman wrote:
>> > On Thu, Jul 17, 2025 at 12:04:15PM -0400, Sean Anderson wrote:
>> >> On 7/17/25 11:59, Greg Kroah-Hartman wrote:
>> >> > On Thu, Jul 17, 2025 at 11:49:37AM -0400, Sean Anderson wrote:
>> >> >> On 7/16/25 01:09, Greg Kroah-Hartman wrote:
>> >> >> > On Tue, Jul 15, 2025 at 08:01:07PM -0400, Sean Anderson wrote:
>> >> >> >> Support creating auxiliary devices with the id included as part of the
>> >> >> >> name. This allows for hexadecimal ids, which may be more appropriate for
>> >> >> >> auxiliary devices created as children of memory-mapped devices. If an
>> >> >> >> auxiliary device's id is set to AUXILIARY_DEVID_NONE, the name must
>> >> >> >> be of the form "name.id".
>> >> >> >> 
>> >> >> >> With this patch, dmesg logs from an auxiliary device might look something
>> >> >> >> like
>> >> >> >> 
>> >> >> >> [    4.781268] xilinx_axienet 80200000.ethernet: autodetected 64-bit DMA range
>> >> >> >> [   21.889563] xilinx_emac.mac xilinx_emac.mac.80200000 net4: renamed from eth0
>> >> >> >> [   32.296965] xilinx_emac.mac xilinx_emac.mac.80200000 net4: PHY [axienet-80200000:05] driver [RTL8211F Gigabit Ethernet] (irq=70)
>> >> >> >> [   32.313456] xilinx_emac.mac xilinx_emac.mac.80200000 net4: configuring for inband/sgmii link mode
>> >> >> >> [   65.095419] xilinx_emac.mac xilinx_emac.mac.80200000 net4: Link is Up - 1Gbps/Full - flow control rx/tx
>> >> >> >> 
>> >> >> >> this is especially useful when compared to what might happen if there is
>> >> >> >> an error before userspace has the chance to assign a name to the netdev:
>> >> >> >> 
>> >> >> >> [    4.947215] xilinx_emac.mac xilinx_emac.mac.1 (unnamed net_device) (uninitialized): incorrect link mode  for in-band status
>> >> >> >> 
>> >> >> >> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> >> >> >> ---
>> >> >> >> 
>> >> >> >> Changes in v2:
>> >> >> >> - Add example log output to commit message
>> >> >> > 
>> >> >> > I rejected v1, why is this being sent again?
>> >> >> 
>> >> >> You asked for explanation, I provided it. I specifically pointed out why
>> >> >> I wanted to do things this way. But I got no response. So here in v2.
>> >> > 
>> >> > Again, I said, "do not do that, this is not how ids work in the driver
>> >> > model", and you tried to show lots of reasons why you wanted to do it
>> >> > this way despite me saying so.
>> >> > 
>> >> > So again, no, sorry, this isn't ok.  Don't attempt to encode information
>> >> > in a device id like you are trying to do here, that's not what a device
>> >> > id is for at all.  I need to go dig up my old patch that made all device
>> >> > ids random numbers just to see what foolish assumptions busses and
>> >> > userspace tools are making....
>> >> 
>> >> But it *is* how ids work in platform devices.
>> > 
>> > No one should ever use platform devices/bus as an excuse to do anything,
>> > it's "wrong" in so many ways, but needs to be because of special
>> > reasons.  No other bus should work like that, sorry.
>> > 
>> >> And because my auxiliary
>> >> devices are created by a platform device, it is guaranteed that the
>> >> platform device id is unique and that it will also be unique for
>> >> auxiliary devices. So there is no assumption here about the uniqueness
>> >> of any given id.
>> > 
>> > Then perhaps use the faux device api instead?
>> 
>> There's *another* pseudo bus? OK the reason why is that faux was added
>> four months ago and there is nothing under Documentation for it. So I
>> had no idea it existed. I will have a look, but perhaps you should write
>> up some documentation about why someone might want to use a "faux" bus
>> over the auxiliary bus or MFD.
> 
> "faux" is for when platform devices were being abused because someone
> just wanted a device in the device tree, and did not use any of the
> platform device resources.

OK, well that's not this. These are real devices and there may be more
than one per system. Actually, that's the primary problem I wanted to
address with this patch: you can't create more than one device with
devm_auxiliary_device_create because they will have the same id (0).

Anyway, if you really think ids should be random or whatever, why not
just ida_alloc one in axiliary_device_init and ignore whatever's
provided? I'd say around half the auxiliary drivers just use 0 (or some
other constant), which is just as deterministic as using the device
address. Another third use ida_alloc (or xa_alloc) so all that could be
removed. And the remainder just use an address of some kind (which ends
up be formatted as decimal).

--Sean

