Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5964DCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ha9ptpjY0tGaI39EISSBFYG7MHwjMbquj/Z2uD+N5cw=; b=FSVH7eHxphSdkCAsxVs8/Hs4k5
	MLIQq7JYv564Mg771Gc3zwUjLjr+LmjbLaRT7WNUHkmVzDLA0NQ5J8Pk3l+Q3iQZ9XyHj40jkT1Rp
	xt0Y6d6GHY8ASV0Xk52V636JKMsZ0k84Z5/e+6E+MUU+IYXnaYVRZ01vrbUpOqLmC/yxe9W0MZSDF
	ZqNfJcnFQoKlHyhiqzK35gDCIOJ4wrIvUuZ3a3HLZRQhvWsiK9XAZtWfVt6PCPWbMuUS71UYS6lSw
	EXg+7xEAHaUDP8WN7G8KeTnB62c0mMtDKenDOK7HzONsySTmwEIu7zty6+srfd12CqPxTkPqhKOCC
	2gNdVSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Uq-00000008DC5-1Bfh;
	Tue, 09 Sep 2025 15:43:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvMs-00000006IqZ-3APa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:14:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BEA6113E;
	Tue,  9 Sep 2025 03:14:21 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 013613F66E;
	Tue,  9 Sep 2025 03:14:23 -0700 (PDT)
Date: Tue, 9 Sep 2025 11:14:20 +0100
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
Subject: Re: [PATCH 06/33] ACPI / PPTT: Add a helper to fill a cpumask from a
 cache_id
Message-ID: <aL/9/KSH35ou8Mgj@e133380.arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-7-james.morse@arm.com>
 <aK7ju2caTjqf1+VN@e133380.arm.com>
 <2e4c3c00-b248-421e-8ff1-d24b7b03be1a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e4c3c00-b248-421e-8ff1-d24b7b03be1a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_031430_967859_04283800 
X-CRM114-Status: GOOD (  41.59  )
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

Hi,

On Thu, Aug 28, 2025 at 04:58:16PM +0100, James Morse wrote:
> Hi Dave,
> 
> On 27/08/2025 11:53, Dave Martin wrote:
> > On Fri, Aug 22, 2025 at 03:29:47PM +0000, James Morse wrote:
> >> MPAM identifies CPUs by the cache_id in the PPTT cache structure.
> >>
> >> The driver needs to know which CPUs are associated with the cache,
> >> the CPUs may not all be online, so cacheinfo does not have the
> >> information.
> > 
> > Nit: cacheinfo lacking the information is not a consequence of the
> > driver needing it.
> > 
> > Maybe split the sentence:
> > 
> > -> "[...] associated with the cache. The CPUs may not [...]"
> 
> Sure,

OK

> >> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> >> index 660457644a5b..cb93a9a7f9b6 100644
> >> --- a/drivers/acpi/pptt.c
> >> +++ b/drivers/acpi/pptt.c
> >> @@ -971,3 +971,65 @@ int find_acpi_cache_level_from_id(u32 cache_id)

[...]

> >> + * acpi_pptt_get_cpumask_from_cache_id() - Get the cpus associated with the
> >> + *					   specified cache
> >> + * @cache_id: The id field of the unified cache
> >> + * @cpus: Where to build the cpumask
> >> + *
> >> + * Determine which CPUs are below this cache in the PPTT. This allows the property
> >> + * to be found even if the CPUs are offline.
> >> + *
> >> + * The PPTT table must be rev 3 or later,
> >> + *
> >> + * Return: -ENOENT if the PPTT doesn't exist, or the cache cannot be found.
> >> + * Otherwise returns 0 and sets the cpus in the provided cpumask.
> >> + */
> >> +int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus)
> >> +{

[...]

> >> +	/*
> >> +	 * If we found the cache first, we'd still need to walk from each cpu.
> >> +	 */
> >> +	for_each_possible_cpu(cpu) {

[...]

> > Again, it feels like we are repeating the same walk multiple times to
> > determine how deep the table is (on which point the table is self-
> > describing anyway), and then again to derive some static property, and
> > then we are then doing all of that work multiple times to derive
> > different static properties, etc.
> > 
> > Can we not just walk over the tables once and stash the derived
> > properties somewhere?
> 
> That is possible - but its a more invasive change to the PPTT parsing code.
> Before the introduction of the leaf flag, the search for a processor also included a
> search to check if the discovered node was a leaf.
> 
> I think this is trading time - walking over the table multiple times, against the memory
> you'd need to de-serialise the tree to find the necessary properties quickly. I think the
> reason Jeremy L went this way was because there may never be another request into this
> code, so being ready with a quick answer was a waste of memory.
> 
> MPAM doesn't change this - all these things are done up front during driver probing, and
> the values are cached by the driver.

I guess that's true.

> > I'm still getting my head around this parsing code, so I'm not saying
> > that the approach is incorrect here -- just wondering whether there is
> > a way to make it simpler.
> 
> It's walked at boot, and on cpu-hotplug. Neither are particularly performance critical.

Do we do this only for unknown late secondaries (e.g., that haven't
previously come online?)  I haven't gone to track this down but, if not,
this cuts across the assertion that "there may never be another request
into this code".

cpu hotlug is slow in practice, but gratuitous cost on this path should
still be avoided where feasible.

> I agree that as platforms get bigger, there will be a tipping point ... I don't think
> anyone has complained yet!

Ack -- when in ACPI, do as the ACPI folks do, I guess.

Cheers
---Dave

