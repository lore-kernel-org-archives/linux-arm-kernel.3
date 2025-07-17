Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE2FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 16:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4syOVCkiT0TF/OduqBiNQX0q7I+0Zz06JfQJwWaPDM=; b=krDOn95mQRI2dERRIL7d4DIXiL
	rPWJU98r7aS8rjQqgRp8jTCSbC9pMIyfmbrCvqhk/uprWTFtwASrwaa9bqyKHJ0ngBaSR37WFTdtq
	9tVojIG6H+T7NId1NlCgPc3vTLL9LgFLj2BYQVHk5nPRDTuSazaNjTWKvBbx4/5syNM9Muwl0nG4i
	iaCPCUCl1pvkGt5bOAx0aJau751hcRrt7YNhpt51r1NyuFcLKL4iLo2RUg07wbsfydT+Zw0QQjxLr
	0LGjDbEQ9NDRPwj/jMDhJBO+lyIniY06kI5vlCA0NmW1M9oIF/6XWwlNczDKvTkJ7dpWoCLj8JLoY
	fQTAMQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRXx-0000000Af1W-3yyz;
	Thu, 17 Jul 2025 16:33:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRMv-0000000AcqU-3FDe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 16:22:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7263A418CE;
	Thu, 17 Jul 2025 16:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC639C4CEE3;
	Thu, 17 Jul 2025 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752769321;
	bh=mdENDvIIGpzFKmMKjGR3YOrxLip3diwkL5qZ2b2U3+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eVy7uHZTR6yb9U4wQpRg+geTzky+/6LySc/HdgbLDYeFGOaBEUgA7oEDO51U5Ea7R
	 ZTYiP/tkiJ5HCJD0Ymakrt5JyYRk4Tfl4u2dLP6bXpH/yMzeQa4Ltq5Msh+JSYtsuv
	 QT55dSGm4ZZ1r4x5yWxJ5vPUVDfElLWtKZQiYyeg=
Date: Thu, 17 Jul 2025 18:21:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Dave Ertman <david.m.ertman@intel.com>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH net v2 1/4] auxiliary: Support hexadecimal ids
Message-ID: <2025071736-viscous-entertain-ff6c@gregkh>
References: <20250716000110.2267189-1-sean.anderson@linux.dev>
 <20250716000110.2267189-2-sean.anderson@linux.dev>
 <2025071637-doubling-subject-25de@gregkh>
 <719ff2ee-67e3-4df1-9cec-2d9587c681be@linux.dev>
 <2025071747-icing-issuing-b62a@gregkh>
 <5d8205e1-b384-446b-822a-b5737ea7bd6c@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d8205e1-b384-446b-822a-b5737ea7bd6c@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_092201_898141_EE2CCC78 
X-CRM114-Status: GOOD (  29.85  )
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

On Thu, Jul 17, 2025 at 12:04:15PM -0400, Sean Anderson wrote:
> On 7/17/25 11:59, Greg Kroah-Hartman wrote:
> > On Thu, Jul 17, 2025 at 11:49:37AM -0400, Sean Anderson wrote:
> >> On 7/16/25 01:09, Greg Kroah-Hartman wrote:
> >> > On Tue, Jul 15, 2025 at 08:01:07PM -0400, Sean Anderson wrote:
> >> >> Support creating auxiliary devices with the id included as part of the
> >> >> name. This allows for hexadecimal ids, which may be more appropriate for
> >> >> auxiliary devices created as children of memory-mapped devices. If an
> >> >> auxiliary device's id is set to AUXILIARY_DEVID_NONE, the name must
> >> >> be of the form "name.id".
> >> >> 
> >> >> With this patch, dmesg logs from an auxiliary device might look something
> >> >> like
> >> >> 
> >> >> [    4.781268] xilinx_axienet 80200000.ethernet: autodetected 64-bit DMA range
> >> >> [   21.889563] xilinx_emac.mac xilinx_emac.mac.80200000 net4: renamed from eth0
> >> >> [   32.296965] xilinx_emac.mac xilinx_emac.mac.80200000 net4: PHY [axienet-80200000:05] driver [RTL8211F Gigabit Ethernet] (irq=70)
> >> >> [   32.313456] xilinx_emac.mac xilinx_emac.mac.80200000 net4: configuring for inband/sgmii link mode
> >> >> [   65.095419] xilinx_emac.mac xilinx_emac.mac.80200000 net4: Link is Up - 1Gbps/Full - flow control rx/tx
> >> >> 
> >> >> this is especially useful when compared to what might happen if there is
> >> >> an error before userspace has the chance to assign a name to the netdev:
> >> >> 
> >> >> [    4.947215] xilinx_emac.mac xilinx_emac.mac.1 (unnamed net_device) (uninitialized): incorrect link mode  for in-band status
> >> >> 
> >> >> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> >> >> ---
> >> >> 
> >> >> Changes in v2:
> >> >> - Add example log output to commit message
> >> > 
> >> > I rejected v1, why is this being sent again?
> >> 
> >> You asked for explanation, I provided it. I specifically pointed out why
> >> I wanted to do things this way. But I got no response. So here in v2.
> > 
> > Again, I said, "do not do that, this is not how ids work in the driver
> > model", and you tried to show lots of reasons why you wanted to do it
> > this way despite me saying so.
> > 
> > So again, no, sorry, this isn't ok.  Don't attempt to encode information
> > in a device id like you are trying to do here, that's not what a device
> > id is for at all.  I need to go dig up my old patch that made all device
> > ids random numbers just to see what foolish assumptions busses and
> > userspace tools are making....
> 
> But it *is* how ids work in platform devices.

No one should ever use platform devices/bus as an excuse to do anything,
it's "wrong" in so many ways, but needs to be because of special
reasons.  No other bus should work like that, sorry.

> And because my auxiliary
> devices are created by a platform device, it is guaranteed that the
> platform device id is unique and that it will also be unique for
> auxiliary devices. So there is no assumption here about the uniqueness
> of any given id.

Then perhaps use the faux device api instead?

thanks,

greg k-h

