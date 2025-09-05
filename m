Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A696CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90lcV3pTdhO6gX6pQoYlhvAqHg4jcw7Qz2AzOMDouFU=; b=kHTXb7rBwbHIx38X8/Hs0V9hoK
	axcOi4smX5OW2TBx6T69EJs1h7dGD2x0J9BXSROWnMmjcG1uO9Dc6YncfN58bXNc2QDhN1zH89Suh
	QPm70qijSerJIOSQETi/g10cG/T3uBkTwpfT5pBwPJdz42lM8N+IXJTk+kNL+AkNWZOHH5rT+67oy
	o0PI9PJ42W9CSyOQuc5ia6zDaDjkl2eKmnv4graqQAAt2EpObbdwH+cB6z+Jrtk/D6UwifAg6teE2
	lcym6OTJDGwtyVjYSh0lYVf8iUO2bm5lDRjajq6EcYaW0LUKXzK+EIuLsAEyVBI4fea2Lf0RVnTjR
	bnh3e7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVF-00000005Qz0-337T;
	Sat, 06 Sep 2025 00:10:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZAE-000000033hK-0CQF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 16:19:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA7DF152B;
	Fri,  5 Sep 2025 09:19:38 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 654D73F63F;
	Fri,  5 Sep 2025 09:19:41 -0700 (PDT)
Date: Fri, 5 Sep 2025 17:19:34 +0100
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
Subject: Re: [PATCH 02/33] drivers: base: cacheinfo: Add helper to find the
 cache size from cpu+level
Message-ID: <aLsNljxM+DN7kmC7@e133380.arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-3-james.morse@arm.com>
 <aK7iDey7LATOXIUb@e133380.arm.com>
 <2ac66605-ee6a-495b-a0fb-910926abd8b0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ac66605-ee6a-495b-a0fb-910926abd8b0@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_091950_129750_411B77EB 
X-CRM114-Status: GOOD (  22.28  )
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

[...]

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
> 

Fair enough.

Cheers
---Dave

