Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2FDD2F327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTZrcIL3vRCuvAISqykYWzmhYYEBH7k57jgkKCR+8Yo=; b=2lLKpjy2RseLeXqAisY8bmmy7n
	gKBOb0f8gLBn46Oo3eSqRJbNYWjZtn2RZ368jAGysh628tJHZ9o1fH5l5SWU7jGp9YtydynRKRs8A
	SwaBNW3UVQxtoI7Wgm78nKTtNT5Bc2FoYznSOVCkz96dW8vY5w2SvQeaEdnHxJcq8ucrs7Ugfw9bx
	nVGbbq7CSBaUY9B6KK61kOPUVa4kfHuEWbkYGb5diyawOgsGJ/OcpI1HNoSvEvHllYlBxLoKNzr9c
	sKeUu+7No3BAnPul0eM2C0iHtGtaK8Z3TCfyEGXMP7zCqyQwJS3jRo5HnFqVYdCXvtsBul1XO99OZ
	kbU1SupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg7i-00000007Lcd-2xMg;
	Tue, 13 Jan 2026 15:15:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg7b-00000007Lby-2BSA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:15:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19BDB497;
	Tue, 13 Jan 2026 07:15:43 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFF8A3F632;
	Tue, 13 Jan 2026 07:15:44 -0800 (PST)
Message-ID: <5bd84ae7-b9ea-49a8-a2e7-1ccd09117126@arm.com>
Date: Tue, 13 Jan 2026 15:15:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/47] arm_mpam: resctrl: Wait for cacheinfo to be
 ready
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-27-ben.horgan@arm.com>
 <20260113150159.000053f7@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260113150159.000053f7@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_071552_940371_A3817F57 
X-CRM114-Status: GOOD (  13.30  )
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

Hi Jonathan,

On 1/13/26 15:01, Jonathan Cameron wrote:
> On Mon, 12 Jan 2026 16:58:53 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> In order to calculate the rmid realloc threshold the size of the cache
>> needs to be known. Cache domains will also be named after the cache id. So
>> that this information can be extracted from cacheinfo we need to wait for
>> it to be ready. The cacheinfo information is populated in device_initcall()
>> so we wait for that.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> [horgan: split out from another patch]
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> This is moved into it's own patch to allow all uses of cacheinfo to be
>> valid when they are introduced.
> 
> I don't mind the patch but I'm not entirely following this comment. Is
> the point that previously there was a sneaky user before this was added in
> the series?

Yes, arm_mpam: resctrl: Add support for 'MB' resource, accesses
cacheinfo so wanted to order this patch before that.

> 
> Anyhow, that's not in the patch itself so
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks,

Ben


