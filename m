Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA66C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 16:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bzKSGrhyOoLt0Kx60uLjktSA1PTjmxFM+e27mk4UbU=; b=4EN3BEui0szOxwuU0rDmPrblkY
	ocWLaROHkQ9JXbm40M6Jl+N1dwl2/PfVKh2THiAiuafqbCs6hMRaZm0M5kGEIVw5QIbiQacYpd0rf
	UVHzRVUlF3LIpRpSJfPS53MrppClbFw8iRkGY3Bc6Xj/YOS99S+Iz1ZpHQCBwVeOOBPWGzBlSmeA3
	AlmUER6kh7Z9Hs/oPfcyMEbw53YEJ9CoxUVVEu33gwA6yL/yz+t6tU29jVVLU6dxG4+tmjM8FbHd3
	6Ay3qvHrLvbvvPmpF9cibGL6SS+MW7UZGZkVzPHrTXZcnCgKX00JDPBidK6ybtN7podJDPTqehgZi
	pLGm2S3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRk3-0000000AgbM-3x7W;
	Thu, 17 Jul 2025 16:45:56 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR5q-0000000AZrN-377J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 16:04:24 +0000
Message-ID: <5d8205e1-b384-446b-822a-b5737ea7bd6c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752768260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8bzKSGrhyOoLt0Kx60uLjktSA1PTjmxFM+e27mk4UbU=;
	b=GKhYxmFruq5OeEbVxVgjGE0ISMtNy3g1vP6GEHXIPucWPjMz/zHVYN176TP4e0y7r5Z3fu
	yo0lI5uISo1gkGUU/b4/4eibmyPnZ2HLVysU3xkXKBMbdHbjvKM09gL+SMNQ7LT72cU547
	414aq6tz4PRX4sxbPrdtoGKP+pPVVfM=
Date: Thu, 17 Jul 2025 12:04:15 -0400
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <2025071747-icing-issuing-b62a@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_090422_927672_8C6CA934 
X-CRM114-Status: GOOD (  19.57  )
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

On 7/17/25 11:59, Greg Kroah-Hartman wrote:
> On Thu, Jul 17, 2025 at 11:49:37AM -0400, Sean Anderson wrote:
>> On 7/16/25 01:09, Greg Kroah-Hartman wrote:
>> > On Tue, Jul 15, 2025 at 08:01:07PM -0400, Sean Anderson wrote:
>> >> Support creating auxiliary devices with the id included as part of the
>> >> name. This allows for hexadecimal ids, which may be more appropriate for
>> >> auxiliary devices created as children of memory-mapped devices. If an
>> >> auxiliary device's id is set to AUXILIARY_DEVID_NONE, the name must
>> >> be of the form "name.id".
>> >> 
>> >> With this patch, dmesg logs from an auxiliary device might look something
>> >> like
>> >> 
>> >> [    4.781268] xilinx_axienet 80200000.ethernet: autodetected 64-bit DMA range
>> >> [   21.889563] xilinx_emac.mac xilinx_emac.mac.80200000 net4: renamed from eth0
>> >> [   32.296965] xilinx_emac.mac xilinx_emac.mac.80200000 net4: PHY [axienet-80200000:05] driver [RTL8211F Gigabit Ethernet] (irq=70)
>> >> [   32.313456] xilinx_emac.mac xilinx_emac.mac.80200000 net4: configuring for inband/sgmii link mode
>> >> [   65.095419] xilinx_emac.mac xilinx_emac.mac.80200000 net4: Link is Up - 1Gbps/Full - flow control rx/tx
>> >> 
>> >> this is especially useful when compared to what might happen if there is
>> >> an error before userspace has the chance to assign a name to the netdev:
>> >> 
>> >> [    4.947215] xilinx_emac.mac xilinx_emac.mac.1 (unnamed net_device) (uninitialized): incorrect link mode  for in-band status
>> >> 
>> >> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> >> ---
>> >> 
>> >> Changes in v2:
>> >> - Add example log output to commit message
>> > 
>> > I rejected v1, why is this being sent again?
>> 
>> You asked for explanation, I provided it. I specifically pointed out why
>> I wanted to do things this way. But I got no response. So here in v2.
> 
> Again, I said, "do not do that, this is not how ids work in the driver
> model", and you tried to show lots of reasons why you wanted to do it
> this way despite me saying so.
> 
> So again, no, sorry, this isn't ok.  Don't attempt to encode information
> in a device id like you are trying to do here, that's not what a device
> id is for at all.  I need to go dig up my old patch that made all device
> ids random numbers just to see what foolish assumptions busses and
> userspace tools are making....

But it *is* how ids work in platform devices. And because my auxiliary
devices are created by a platform device, it is guaranteed that the
platform device id is unique and that it will also be unique for
auxiliary devices. So there is no assumption here about the uniqueness
of any given id.

--Sean

