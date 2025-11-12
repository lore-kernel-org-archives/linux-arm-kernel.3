Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05EBCD3429
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 17:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQ95Sr3gpMiwt9z0wYsMzPQV0Mjy0oLHRg69HSV0O+4=; b=GhiMqv5w6pwhneRqw1gthZhGxZ
	bPDPNNNPjTZYBdY3HZiLgqqmfxgRcsjMRgDy/d7QstIkZ5v4DYEjkfLPEMZSewipeCCU3cEjNqU9+
	cnQHNAxPGqVF2daG6HdD9ObtUlq6KyoHq+kS5K7rGLPbPq+zikZpmJ7Yben7bAqtC/6eWvTXItayU
	1Hdn9Y7zJnMfYlbJX4nfAqqlpgTqtGeQTJaqdCu2kNyfbU6Rj78cKPcdLW5hTK6pyGGqmry8gw5pi
	BN+ijierOiS2xRi4SSSlXCU5um3NlgFz2Lfqmr3Ngk/KM9mP/+1x7Dihy9g0GZu8r+K+X+A3A3kZp
	36x7wuxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEWy-00000009EvC-464v;
	Wed, 12 Nov 2025 17:21:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEWw-00000009EuW-3oNq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 17:21:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 715731515;
	Wed, 12 Nov 2025 09:21:05 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D85D3F66E;
	Wed, 12 Nov 2025 09:21:08 -0800 (PST)
Message-ID: <4d68d1b7-e3c9-4692-aba8-4361156e8b80@arm.com>
Date: Wed, 12 Nov 2025 17:21:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/33] arm_mpam: Add the class and component structures
 for firmware described ris
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: james.morse@arm.com, amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com,
 guohanjun@huawei.com, jeremy.linton@arm.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-12-ben.horgan@arm.com>
 <20251110171041.00000a0d@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251110171041.00000a0d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_092115_082839_DDF992BB 
X-CRM114-Status: GOOD (  16.08  )
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

On 11/10/25 17:10, Jonathan Cameron wrote:
> On Fri,  7 Nov 2025 12:34:28 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> From: James Morse <james.morse@arm.com>
>>
>> An MSC is a container of resources, each identified by their RIS index.
>> Some RIS are described by firmware to provide their position in the system.
>> Others are discovered when the driver probes the hardware.
>>
>> To configure a resource it needs to be found by its class, e.g. 'L2'.
>> There are two kinds of grouping, a class is a set of components, which
>> are visible to user-space as there are likely to be multiple instances
>> of the L2 cache. (e.g. one per cluster or package)
>>
>> Add support for creating and destroying structures to allow a hierarchy
>> of resources to be created.
>>
>> CC: Ben Horgan <ben.horgan@arm.com>
> Hi Ben,
> 
> Remember to clear out CC'ing yourself.
> 
>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Tested-by: Peter Newman <peternewman@google.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes since v3:
>> Jonathan:
>> Code reordering.
> 
> I'm guessing I may have sent things in a slightly less than ideal directly.
> 
> Why can't we have ordering as follows (with no forwards declarations)
> 
> mpam_class_alloc()
> mpam_class_destroy()
> //maybe other mpam_class stuff here
> mpam_component_alloc()
> mpam_component_destroy() - needs mpam_class_destroy()
> //maybe other mpam_component stuff here
> mpam_vmsc_alloc()
> mpam_vmsc_destroy() - needs mpam_component_destroy()
> //other mpam_vmsc here

This works and then I need to add mpam_ris_get_affinity() as
mpam_ris_create_locked() depends on it.

I also add the helper functions it depends on
mpam_get_cpumask_from_cache_id() and get_cpumask_from_node_id().

> mpam_ris_create_locked() - needs all the destroys.
> mpam_ris_destroy() - needs mpam vmsc_destroy()

> 
> I may well have missed a more complex dependency chain.
> 
> Other than that, LGTM. Given any change in ordering can be trivially verified
> by building it and Gavin's comments seem simple to resolve.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks,

Ben


