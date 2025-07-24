Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D113C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THb9OA/TiR1XzVuDY0Y6uYlj9r+f68Q+8bbXSQessY8=; b=V9d6EN7ZNQ+ENSOngSJePiA8sB
	CxCpYMs2h4nhk1hzVit7IQopfy6X0cVyFfPaeaYzX1hkAcoahn7EdHw1RNx0iRq/0/kI9SaiMEkyn
	2tFWuWLnfbnFuCPSrS52N+RRtGyNiwjr2+TGKDKuFDPceN8heke9bkYFbZI9HYpqt1zojFobk5kHS
	47TYmXDsX+jK1PmWv4Hl9nHYHFIsssAXIbfrCVnJwywnLkkz5qjTF9+wMc8BQuxHFBqixhFszngiG
	9PHdr2CNBAXJD96zWlggFfwatrM14d9uAn7v4rre4Z81W1YG9n+8Tg25lfSm+muDsVpoumj2bm3BD
	8pwB06Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrH-00000007qwJ-0tLn;
	Thu, 24 Jul 2025 15:27:47 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewQc-00000007edr-1Yjj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:12 +0000
Message-ID: <991cbb9a-a1b5-4ab8-9deb-9ecea203ce0f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753365364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=THb9OA/TiR1XzVuDY0Y6uYlj9r+f68Q+8bbXSQessY8=;
	b=xDuFrqtbleTFYgMfG/+dzmiNOf9WfMjEIQ+vyWpBK7H0ruFRSJm9fUTbxjbSvdfuMKPNup
	r1xVULgxavPiqQwoeGmwnAxOGIs91rie3H09SadgDcQYy9/1R/Wnlc/3Y3qQuo9RgbGV/3
	CY27SJIBzQmoYxre91whlvlQd+hSBpE=
Date: Thu, 24 Jul 2025 09:55:59 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net v2 1/4] auxiliary: Support hexadecimal ids
To: Leon Romanovsky <leon@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Dave Ertman <david.m.ertman@intel.com>,
 Saravana Kannan <saravanak@google.com>, linux-kernel@vger.kernel.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Ira Weiny <ira.weiny@intel.com>
References: <2025071637-doubling-subject-25de@gregkh>
 <719ff2ee-67e3-4df1-9cec-2d9587c681be@linux.dev>
 <2025071747-icing-issuing-b62a@gregkh>
 <5d8205e1-b384-446b-822a-b5737ea7bd6c@linux.dev>
 <2025071736-viscous-entertain-ff6c@gregkh>
 <03e04d98-e5eb-41c0-8407-23cccd578dbe@linux.dev>
 <2025071726-ramp-friend-a3e5@gregkh>
 <5ee4bac4-957b-481a-8608-15886da458c2@linux.dev>
 <20250720081705.GE402218@unreal>
 <e4b5e4fa-45c4-4b67-b8f1-7d9ff9f8654f@linux.dev>
 <20250723081356.GM402218@unreal>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250723081356.GM402218@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065610_560116_B3CA7C22 
X-CRM114-Status: GOOD (  17.01  )
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

On 7/23/25 04:13, Leon Romanovsky wrote:
> On Mon, Jul 21, 2025 at 10:29:32AM -0400, Sean Anderson wrote:
>> On 7/20/25 04:17, Leon Romanovsky wrote:
>> > On Thu, Jul 17, 2025 at 01:12:08PM -0400, Sean Anderson wrote:
>> >> On 7/17/25 12:33, Greg Kroah-Hartman wrote:
>> > 
>> > <...>
>> > 
>> >> Anyway, if you really think ids should be random or whatever, why not
>> >> just ida_alloc one in axiliary_device_init and ignore whatever's
>> >> provided? I'd say around half the auxiliary drivers just use 0 (or some
>> >> other constant), which is just as deterministic as using the device
>> >> address.
>> > 
>> > I would say that auxiliary bus is not right fit for such devices. This
>> > bus was introduced for more complex devices, like the one who has their
>> > own ida_alloc logic.
>> 
>> I'd say that around 2/3 of the auxiliary drivers that have non-constant
>> ids use ida_alloc solely for the auxiliary bus and for no other purpose.
>> I don't think that's the kind of complexity you're referring to.
>> 
>> >> Another third use ida_alloc (or xa_alloc) so all that could be
>> >> removed.
>> > 
>> > These ID numbers need to be per-device.
>> 
>> Why? They are arbitrary with no semantic meaning, right?
> 
> Yes, officially there is no meaning, and this is how we would like to
> keep it.
> 
> Right now, they are very correlated with with their respective PCI function number.
> Is it important? No, however it doesn't mean that we should proactively harm user
> experience just because we can do it.
> 
> [leonro@c ~]$ l /sys/bus/auxiliary/devices/
> ,,,
> rwxrwxrwx 1 root root 0 Jul 21 15:25 mlx5_core.rdma.0 -> ../../../devices/pci0000:00/0000:00:02.7/0000:0
> 8:00.0/mlx5_core.rdma.0
> lrwxrwxrwx 1 root root 0 Jul 21 15:25 mlx5_core.rdma.1 -> ../../../devices/pci0000:00/0000:00:02.7/0000:0
> 8:00.1/mlx5_core.rdma

Well, I would certainly like to have semantic meaning for ids. But apparently
that is only allowed if you can sneak it past the review process.

--Sean


