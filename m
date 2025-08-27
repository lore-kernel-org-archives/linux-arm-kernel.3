Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3FFCA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 20:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pftUlAVcKP90AT4zovg58Sx7Y/o9FhsrDItBLoCgNro=; b=BEawcLWkMh134kA45k4aOPIUkk
	cywyGESOodG6vDciw05Clbi4t7R0mxxIITdWcBOeUEhD7AjnkRHJa7nmfpsBpiMNaK/67cpBiGnSt
	LXy0FSBcsN3avo/NvBDDrj5AFWYqIpkPwCVLZUmWL6Tym/UcSOG6bd7jC8BYSoLyTo+l2JewkIIyl
	3885QPtVDM8kOBd4VCF77LHJkYYX7XFni3uGZtqUGTUcKtlbcsYLur8aIAzcOPZJRS0PR+I/SZuWJ
	KcKRJ6CtT2oB54QcW72PPBGWDWTtGMhujM+rswrvcAU90kQ2hCcFdDmIqxt48A8LNE5AwiGV42v5x
	PMglx14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urMgz-0000000Gk3x-2aVJ;
	Wed, 27 Aug 2025 20:24:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJgX-0000000GH50-0ByP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 17:11:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5932C2720;
	Wed, 27 Aug 2025 10:11:36 -0700 (PDT)
Received: from [10.1.196.42] (eglon.cambridge.arm.com [10.1.196.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5161E3F694;
	Wed, 27 Aug 2025 10:11:38 -0700 (PDT)
Message-ID: <9fde0d3c-52e7-4545-a273-4b37b865997c@arm.com>
Date: Wed, 27 Aug 2025 18:11:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/33] drivers: base: cacheinfo: Add helper to find the
 cache size from cpu+level
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-3-james.morse@arm.com>
 <172e9dd6-3b25-4fdf-943e-2bd559117519@kernel.org>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <172e9dd6-3b25-4fdf-943e-2bd559117519@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_101145_134260_C1994FC5 
X-CRM114-Status: GOOD (  11.49  )
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

Hi Krzysztof,

On 24/08/2025 18:25, Krzysztof Kozlowski wrote:
> On 22/08/2025 17:29, James Morse wrote:
>> MPAM needs to know the size of a cache associated with a particular CPU.
>> The DT/ACPI agnostic way of doing this is to ask cacheinfo.
>>
>> Add a helper to do this.

>> ---
>> Changes since v1:
> 
> You marked this as v1.

Oops - that should say RFC. I'll fix all those.


>>  * Converted to kdoc.
>>  * Simplified helper to use get_cpu_cacheinfo_level().

> Please use consistent subject prefixes. Look at previous patch subject
> prefix.

Presumably the previous patch in my series - this is a side effect of multiple branches
that were written at different times getting combined! I'll change it to 'cacheinfo:' as
that seems to be the most popular recently.


Thanks,

James

