Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF41CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejsSpIZwN3zZAh7urw29iiA/GFhtn6CB06LXQPnvnIU=; b=Q76m7L8+8iXwXpPJs1pAHzwSME
	q/WR9V+VCXOwRSn5zSAFYc0dgMcpnSS7FWCGPNRlcJt9GGelj4VFtF7CYgh0HRgK5sT9f+odXDFeH
	tkR2d1IW1NDRAMIyHaafKKMz7tyaAiCz3KPliZc5A1uIY3VsfzmckkY0C2HiwjAfO5s+l1GoNJE6H
	Azl89UEOQqxDkdQkIY7oSCQQNyIVsS8LGSQdfF2C2PxllCZnf9QMAC6hrFWsgQEcuTzes5ZKBSuAp
	Ub8Uuyd6RDQR/CEnrdh7ml9w3xt6SyKW7shAJbi9mgk0FPj9bXXmKICUr39XO+lB9SEC9nujjV3+m
	Czk9FRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgPk-00000002VDB-44R4;
	Thu, 28 Aug 2025 17:27:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urdKj-00000001rQC-0uE7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 14:10:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6FF31688;
	Thu, 28 Aug 2025 07:10:23 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95A893F694;
	Thu, 28 Aug 2025 07:10:26 -0700 (PDT)
Date: Thu, 28 Aug 2025 15:10:23 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	shameerali.kolothum.thodi@huawei.com,
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
Subject: Re: [PATCH 02/33] drivers: base: cacheinfo: Add helper to find the
 cache size from cpu+level
Message-ID: <aLBjTyTKk6Pod40v@e133380.arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-3-james.morse@arm.com>
 <aK7iDey7LATOXIUb@e133380.arm.com>
 <2ac66605-ee6a-495b-a0fb-910926abd8b0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ac66605-ee6a-495b-a0fb-910926abd8b0@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_071033_330245_7260D925 
X-CRM114-Status: GOOD (  28.87  )
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

On Wed, Aug 27, 2025 at 06:11:43PM +0100, James Morse wrote:
> Hi Dave,
> 
> On 27/08/2025 11:46, Dave Martin wrote:
> > Hi,
> > 
> > On Fri, Aug 22, 2025 at 03:29:43PM +0000, James Morse wrote:
> >> MPAM needs to know the size of a cache associated with a particular CPU.
> >> The DT/ACPI agnostic way of doing this is to ask cacheinfo.
> >>
> >> Add a helper to do this.
> 
> >> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> >> index 2dcbb69139e9..e12d6f2c6a57 100644
> >> --- a/include/linux/cacheinfo.h
> >> +++ b/include/linux/cacheinfo.h
> >> @@ -148,6 +148,21 @@ static inline int get_cpu_cacheinfo_id(int cpu, int level)
> >>  	return ci ? ci->id : -1;
> >>  }
> >>  
> >> +/**
> >> + * get_cpu_cacheinfo_size() - Get the size of the cache.
> >> + * @cpu:      The cpu that is associated with the cache.
> >> + * @level:    The level of the cache as seen by @cpu.
> >> + *
> >> + * Callers must hold the cpuhp lock.
> >> + * Returns the cache-size on success, or 0 for an error.
> >> + */
> > 
> > Nit: Maybe use the wording
> > 
> > 	cpuhp lock must be held.
> > 
> > in the kerneldoc here, to match the other helpers it sits alongside.
> > 
> > Otherwise, looks reasonable.
> 
> Sure,
> 
> 
> >> +static inline unsigned int get_cpu_cacheinfo_size(int cpu, int level)
> >> +{
> >> +	struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, level);
> >> +
> >> +	return ci ? ci->size : 0;
> >> +}
> >> +
> > 
> > Orphaned function?
> > 
> > Can fs/resctrl/rdtgroup.c:rdtgroup_cbm_to_size() be ported to use this?
> > If so, this wouldn't just be dead code in this series.
> 
> Ah - I thought the MPAM driver was pulling this value in, but its the resctrl glue code.
> I was trying to reduce the number of trees this touches - its probably best to kick this
> into the next series that adds the resctrl code as its pretty trivial.
> 
> 
> Thanks,
> 
> James

Sure, that also works.

Cheers
---Dave

