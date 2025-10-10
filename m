Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FC0CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgCowuPslqaVlNhQk8Pl371r7rIiOmUmpilhy+zZV4g=; b=0Uq6jzYopoSie3bwL5mYVkrdZ8
	X/TmxdneNs1qdWkFLcC8koBtf6RRjOwQ0F0WzR1dmhPNcaBW6VALMrtYD1NsYnl42OFJu+Ahod9yx
	fWDnbSHdZzFMZl9eUQMO0jQZ+sKwuLCWpgL83u3u5sXnw0m2A3XY84sZujhHUcx8mVzxU9gaRi8Fn
	ATXhlLLErVpNb+vDVkvNC4QTkS3CrNVXqLT7GtbFr8ewRTr1m/kfSLJlBDw6GaQtNpFXyQneLA67w
	Yl4tXbzOwbAgpGxOIFOoGHfMH1Q7VX8Vb4mWZL8Op3HbCJRqm+3Nxk9qhEzXe9PcWLICuwtgFhj3r
	2RvMOmWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GP5-000000090w6-3c1U;
	Fri, 10 Oct 2025 16:55:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GP3-000000090ut-234k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:55:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D7E9153B;
	Fri, 10 Oct 2025 09:55:28 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75ED33F66E;
	Fri, 10 Oct 2025 09:55:29 -0700 (PDT)
Message-ID: <7d3110b6-5247-4054-9642-d4f68c159296@arm.com>
Date: Fri, 10 Oct 2025 17:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/29] ACPI / PPTT: Stop acpi_count_levels() expecting
 callers to clear levels
To: Fenghua Yu <fenghuay@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-3-james.morse@arm.com>
 <e05396d8-a3f1-476f-b217-0f0a74e9e08a@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <e05396d8-a3f1-476f-b217-0f0a74e9e08a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_095537_568793_BEBBA3AF 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

Hi Fenghua,

On 02/10/2025 04:55, Fenghua Yu wrote:
> On 9/10/25 13:42, James Morse wrote:
>> In acpi_count_levels(), the initial value of *levels passed by the
>> caller is really an implementation detail of acpi_count_levels(), so it
>> is unreasonable to expect the callers of this function to know what to
>> pass in for this parameter.  The only sensible initial value is 0,
>> which is what the only upstream caller (acpi_get_cache_info()) passes.
>>
>> Use a local variable for the starting cache level in acpi_count_levels(),
>> and pass the result back to the caller via the function return value.
>>
>> Gid rid of the levels parameter, which has no remaining purpose.
>>
>> Fix acpi_get_cache_info() to match.
>>
>> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> 
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>


Thanks!

James

