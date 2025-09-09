Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D69CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UVamhSqzwJY1xwizjBZRhuRrWruFu7DBQa/xASKhxs=; b=twSfWtCjS2/tY1o3920uZeXxnY
	JJ2ngvSeMT7Caa/viTEJrzbMv/xd1xVywi6CuwKPuKJWtkM6oEe10hEnebXrPP4mmQZk4bmXo4IAT
	BJT+W/oL/SYfwKip3JKK8JL10PlFkRTCUhwj1CApkG7IeS6+mYjo7HG5mfsETeRym57Wa3zyW219j
	AKjuk5kDuutkRXHOj4oalZiMcCqPSubrKNspkOx1atb/8i0orMAKXQZS/B+Dv7unts34A/xu5skN1
	An6rgl1li0BlEDB9Mzcpxp/es0g0fsPsRx6kwEZy1aJN8COClrdVUq2+kCDvIxN45lfgnLai59/tE
	luCvtZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Tv-00000008CHb-237p;
	Tue, 09 Sep 2025 15:42:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvFk-00000006FAg-3n9p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:07:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4797113E;
	Tue,  9 Sep 2025 03:06:58 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36B533F66E;
	Tue,  9 Sep 2025 03:07:01 -0700 (PDT)
Date: Tue, 9 Sep 2025 11:06:52 +0100
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
Subject: Re: [PATCH 04/33] ACPI / PPTT: Stop acpi_count_levels() expecting
 callers to clear levels
Message-ID: <aL/8PIcebYGoB/g6@e133380.arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-5-james.morse@arm.com>
 <aK7iyf/6iVOuVhTr@e133380.arm.com>
 <1914b7f0-10e6-4cf4-ad53-5ae03c69964d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1914b7f0-10e6-4cf4-ad53-5ae03c69964d@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_030709_331897_05F14778 
X-CRM114-Status: GOOD (  29.44  )
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

On Thu, Aug 28, 2025 at 04:57:15PM +0100, James Morse wrote:
> Hi Dave,
> 
> On 27/08/2025 11:49, Dave Martin wrote:
> > On Fri, Aug 22, 2025 at 03:29:45PM +0000, James Morse wrote:
> >> acpi_count_levels() passes the number of levels back via a pointer argument.
> >> It also passes this to acpi_find_cache_level() as the starting_level, and
> >> preserves this value as it walks up the cpu_node tree counting the levels.
> >>
> >> This means the caller must initialise 'levels' due to acpi_count_levels()
> >> internals. The only caller acpi_get_cache_info() happens to have already
> >> initialised levels to zero, which acpi_count_levels() depends on to get the
> >> correct result.
> >>
> >> Two results are passed back from acpi_count_levels(), unlike split_levels,
> >> levels is not optional.
> >>
> >> Split these two results up. The mandatory 'levels' is always returned,
> >> which hides the internal details from the caller, and avoids having
> >> duplicated initialisation in all callers. split_levels remains an
> >> optional argument passed back.
> > 
> > Nit: I found all this a bit hard to follow.
> > 
> > This seems to boil down to:
> > 
> > --8<--
> > 
> > In acpi_count_levels(), the initial value of *levels passed by the
> > caller is really an implementation detail of acpi_count_levels(), so it
> > is unreasonable to expect the callers of this function to know what to
> > pass in for this parameter.  The only sensible initial value is 0,
> > which is what the only upstream caller (acpi_get_cache_info()) passes.
> > 
> > Use a local variable for the starting cache level in acpi_count_levels(),
> > and pass the result back to the caller via the function return value.
> > 
> > Gid rid of the levels parameter, which has no remaining purpose.
> > 
> > Fix acpi_get_cache_info() to match.
> > 
> > -->8--
> 
> I've taken this instead,

OK

[...]

> >> @@ -731,7 +735,7 @@ int acpi_get_cache_info(unsigned int cpu, unsigned int *levels,
> >>  	if (!cpu_node)
> >>  		return -ENOENT;
> >>  
> >> -	acpi_count_levels(table, cpu_node, levels, split_levels);
> >> +	*levels = acpi_count_levels(table, cpu_node, split_levels);
> >>  
> >>  	pr_debug("Cache Setup: last_level=%d split_levels=%d\n",
> >>  		 *levels, split_levels ? *split_levels : -1);
> > 
> > Otherwise, looks reasonable to me.
> > 
> > (But see my comments on the next patches re whether we really need this.)
> 
> It was enough fun to debug that I'd like to save anyone else the trouble!

Fair enough.

Cheers
---Dave

