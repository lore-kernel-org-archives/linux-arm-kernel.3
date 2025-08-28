Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32416CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVod8/zo9mT8QT2vVdZTrOdt07Ijq3UUFtJYLqi4Twg=; b=bzyxVlv+cdzH0oq3ye1oz83aUm
	4iJ+UGj2pXdDJSjN0wxtswiQq0VBPVbORj9T6O8xlKxxTjo8HOLUC32jzexdVmWq5mmi2zOY2O/e/
	soUk3pQt5SQuXRv+QzdpAKDl3vQc7ynbAHvcPRiY1FJW/A2uZJ+X3q6QKHkUYwRnShoeLmgkwMVY3
	wXWOJQcieaMUa2HeN+O2qL8ToifxD1yld5YbTpMJKRWhShuGZMm9ubpemOoMRg3/NAZSUtwuKyXWg
	XHfHsvWjKaGkJRPD7+Rok5LzaCvoGpg2TsB09kTxkOA11mdrqQjq0CYI/bQgZj23LD5wIyh6oY0Wq
	NcXXVFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgPj-00000002VB2-16Te;
	Thu, 28 Aug 2025 17:27:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urdJO-00000001rEk-1ouj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 14:09:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDFA11688;
	Thu, 28 Aug 2025 07:08:58 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE0943F694;
	Thu, 28 Aug 2025 07:09:01 -0700 (PDT)
Date: Thu, 28 Aug 2025 15:08:45 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 01/33] cacheinfo: Expose the code to generate a cache-id
 from a device_node
Message-ID: <aLBi7dmFd7+Bqu/j@e133380.arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-2-james.morse@arm.com>
 <aK7h6seHNWs5rO9Q@e133380.arm.com>
 <17675117-79ef-42e3-9c21-4bc46e73d6b1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17675117-79ef-42e3-9c21-4bc46e73d6b1@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_070910_565476_B3903E75 
X-CRM114-Status: GOOD (  42.79  )
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

Hi James,

On Wed, Aug 27, 2025 at 06:11:25PM +0100, James Morse wrote:
> Hi Dave,
> 
> On 27/08/2025 11:46, Dave Martin wrote:
> > On Fri, Aug 22, 2025 at 03:29:42PM +0000, James Morse wrote:
> >> The MPAM driver identifies caches by id for use with resctrl. It
> >> needs to know the cache-id when probe-ing, but the value isn't set
> >> in cacheinfo until device_initcall().
> >>
> >> Expose the code that generates the cache-id. The parts of the MPAM
> >> driver that run early can use this to set up the resctrl structures
> >> before cacheinfo is ready in device_initcall().
> 
> > Why can't the MPAM driver just consume the precomputed cache-id
> > information?
> 
> Because it would need to wait until cacheinfo was ready, and it would still
> need a way of getting the cache-id for caches where all the CPUs are offline.
> 
> The resctrl glue code has a waitqueue to wait for device_initcall_sync(), but that is
> asynchronous to driver probing, its triggered by the schedule_work() from the cpuhp
> callbacks. This bit is about the driver's use, which just gets probed whenever the core
> code feels like it.
> 
> I toyed with always using cacheinfo for everything, and just waiting - but the MPAM driver
> already has to parse the PPTT to find the information it needs on ACPI platforms, so the
> wait would only happen on DT.
> 
> It seemed simpler to grab what the value would be, instead of waiting (or probe defer) -
> especially as this is also needed for caches where all the CPUs are offline.
> 
> (I'll add the offline-cpus angle to the commit message)

Ack

> > Possible reasons are that the MPAM driver probes too early,
> 
> yup,
> 
> > or that it
> > must parse the PPTT directly (which is true) and needs to label caches
> > consistently with the way the kernel does it.
> 
> It needs to match what will be exposed to user-space from cacheinfo.
> This isn't about the PPTT, its the value that is generated for DT systems.

Right -- confused myself there.  From the point of view of this series,
the usage scenario isn't clear at this point.

> The driver has to know if its ACPI or DT to call the appropriate thing to get cache-ids
> before cacheinfo is ready.

I see.  This might be worth stating in the commit message.

> >> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> >> index 613410705a47..f6289d142ba9 100644
> >> --- a/drivers/base/cacheinfo.c
> >> +++ b/drivers/base/cacheinfo.c
> >> @@ -207,11 +207,10 @@ static bool match_cache_node(struct device_node *cpu,
> >>  #define arch_compact_of_hwid(_x)	(_x)
> >>  #endif
> >>  
> >> -static void cache_of_set_id(struct cacheinfo *this_leaf,
> >> -			    struct device_node *cache_node)
> >> +unsigned long cache_of_calculate_id(struct device_node *cache_node)
> >>  {
> >>  	struct device_node *cpu;
> >> -	u32 min_id = ~0;
> >> +	unsigned long min_id = ~0UL;
> 
> > Why the change of type here?
> 
> This is a hang over from Rob's approach of making the cache-id 64 bit.

Ah, right.

(I have assumed that 0xffffffff is never going to clash with a valid
value.)

> > This does mean that 0xffffffff can now be generated as a valid cache-id,
> > but if that is necessary then this patch is also fixing a bug in the
> > code -- but the commit message doesn't say anything about that.
> > 
> > For a patch that is just exposing an internal result, it may be
> > better to keep the original type.  ~(u32)0 is already used as an
> > exceptional value.
> 
> Yup, I'll fix that.

OK -- it works either way, of course, but this should make the patch a
little less noisy.

Cheers
---Dave

