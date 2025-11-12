Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB29CD3425
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 16:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxxDtzAcmuYEBgaIh3Mi/KNpmyQajzI4sW2U+Yzf7Lc=; b=pTfhFGd3SA2ZWZ8rf65Q1mbcoz
	tvnlxgVYTgsjE4+wCMYGRPbOO/ztwhHZ4tFEU93iDvOLxBRHreaHDFNtF/XCH+8Sq7CX8NIGhSjjD
	Kms75R6a6w1b++z1NFcKVSX/oboCxxJI7ox3A3ZrZ3U0B9eA9wOy9EFPJe0q26Qa9OCUzpjgtm420
	rpP6rN+Z0GeaUXKoeK5qWj//pDGnOZYjfXrV3uJS53hThigZnF/l+caULZEzCNk5aspe9j61NO3WR
	AGRLX13u3SxPKKBdUzSm9KBh+nQclgWnUveZIgzslYDbX7OUZGDEyvSVZjArAVosqxNUGtWvkg5uH
	BPsoa62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJE1q-00000009Ch3-3oTe;
	Wed, 12 Nov 2025 16:49:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJE1p-00000009Cgh-04RD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 16:49:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCC38497;
	Wed, 12 Nov 2025 08:48:53 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B08343F63F;
	Wed, 12 Nov 2025 08:48:56 -0800 (PST)
Message-ID: <365d8625-17fc-41f1-b7ab-d7ef3ab06b92@arm.com>
Date: Wed, 12 Nov 2025 16:48:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/33] arm_mpam: Add the class and component structures
 for firmware described ris
From: Ben Horgan <ben.horgan@arm.com>
To: Gavin Shan <gshan@redhat.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-12-ben.horgan@arm.com>
 <2c81664f-45c0-43e4-91e9-79d0c84376b6@redhat.com>
 <3350b73e-1021-4091-87f1-4b946da22f4e@arm.com>
Content-Language: en-US
In-Reply-To: <3350b73e-1021-4091-87f1-4b946da22f4e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_084905_131177_05C5A6BD 
X-CRM114-Status: GOOD (  11.54  )
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

Hi Gavin,

I was a bit hasty on one of those changes.

On 11/12/25 16:39, Ben Horgan wrote:
> Hi Gavin,
> 
> On 11/9/25 00:07, Gavin Shan wrote:
>> Hi Ben,
>>
>> On 11/7/25 10:34 PM, Ben Horgan wrote:
>>> From: James Morse <james.morse@arm.com>
>>>
>>> An MSC is a container of resources, each identified by their RIS index.
>>> Some RIS are described by firmware to provide their position in the
>>> system.
>>> Others are discovered when the driver probes the hardware.
>>>
>>> To configure a resource it needs to be found by its class, e.g. 'L2'.
>>> There are two kinds of grouping, a class is a set of components, which
>>> are visible to user-space as there are likely to be multiple instances
>>> of the L2 cache. (e.g. one per cluster or package)
>>>
>>> Add support for creating and destroying structures to allow a hierarchy
>>> of resources to be created.
>>>
>>> CC: Ben Horgan <ben.horgan@arm.com>
>>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
>>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>>> Tested-by: Peter Newman <peternewman@google.com>
>>> Signed-off-by: James Morse <james.morse@arm.com>
>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

>> This function is only used in mpam_devices.c and won't be exposed in the
>> future, we can make it 'static' and 'inline'.
> 
> Done

Gets used later in mpam_resctl.c so I'll keep as is.

Thanks,

Ben


