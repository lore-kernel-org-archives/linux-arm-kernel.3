Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8437ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBJ6vcTtfE1YmoDuXYa1AOQlGCz+ieglKWUrFAIfy/E=; b=XtySrKUWh2BCbq4kcYR6gC1zbh
	T3hzV9P+Iy7JfsYzp4RdIRWVi32+wlDVkPql58DQibbh5ep/co+wyeBaFGvkOTFfYJ2kwCBT8/ps5
	sUS0yGtlMY1/GJTfqg8x4ueGZFZCa9LetJwgTfeXle3cM9FSpxl6vnwNyvxiOYa1gKzDtp1cVnOgs
	1HStfsnE0An4W9v1C2pv39WtHy5IxHZdgDUhQK1ozi2RBGUdSfzTJoDM5PBE+kcyiPMQKlpzeiHqU
	10oIxrAS+kOx2WSEslNvh56YSAkv8mm9ZOboeF2RoixZWQD/39vboR8HTgScTcE/IjTTjY2ErgbwZ
	INKo7+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEIf-0000000FGM5-1o9R;
	Wed, 27 Aug 2025 11:26:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDfV-0000000F6yE-3pbp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:46:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 517931688;
	Wed, 27 Aug 2025 03:46:07 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB74E3F738;
	Wed, 27 Aug 2025 03:46:09 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:46:02 +0100
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
Subject: Re: [PATCH 01/33] cacheinfo: Expose the code to generate a cache-id
 from a device_node
Message-ID: <aK7h6seHNWs5rO9Q@e133380.arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-2-james.morse@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822153048.2287-2-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_034618_036270_391151CD 
X-CRM114-Status: GOOD (  24.85  )
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

On Fri, Aug 22, 2025 at 03:29:42PM +0000, James Morse wrote:
> The MPAM driver identifies caches by id for use with resctrl. It
> needs to know the cache-id when probe-ing, but the value isn't set
> in cacheinfo until device_initcall().
> 
> Expose the code that generates the cache-id. The parts of the MPAM
> driver that run early can use this to set up the resctrl structures
> before cacheinfo is ready in device_initcall().

Why can't the MPAM driver just consume the precomputed cache-id
information?

Possible reasons are that the MPAM driver probes too early, or that it
must parse the PPTT directly (which is true) and needs to label caches
consistently with the way the kernel does it.

> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since v1:
>  * Renamed cache_of_get_id() cache_of_calculate_id().
> ---
>  drivers/base/cacheinfo.c  | 19 +++++++++++++------
>  include/linux/cacheinfo.h |  1 +
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index 613410705a47..f6289d142ba9 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -207,11 +207,10 @@ static bool match_cache_node(struct device_node *cpu,
>  #define arch_compact_of_hwid(_x)	(_x)
>  #endif
>  
> -static void cache_of_set_id(struct cacheinfo *this_leaf,
> -			    struct device_node *cache_node)
> +unsigned long cache_of_calculate_id(struct device_node *cache_node)
>  {
>  	struct device_node *cpu;
> -	u32 min_id = ~0;
> +	unsigned long min_id = ~0UL;

Why the change of type here?

This does mean that 0xffffffff can now be generated as a valid cache-id,
but if that is necessary then this patch is also fixing a bug in the
code -- but the commit message doesn't say anything about that.

For a patch that is just exposing an internal result, it may be
better to keep the original type.  ~(u32)0 is already used as an
exceptional value.

[...]

Otherwise, this looks reasonable to me.

Cheers
---Dave

