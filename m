Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC3ECA5FFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 20:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUnV9JAcHoN5H2N+plEZDdGhHCgYWgcBirI9D6UT2K8=; b=oi/Iq6T1O5Xp8gSGBlFMs/zy+/
	8AXagsrwhIOv5MVOcCVZeHi4CREm7Z72m6B/75j01vDkbBhIgq2b6ASkmKPzlCMGl4tSS+rIE7dOk
	72eiwefuwpP6idGlIAf0Mtf3pHoUwvDyZ2VbxX5nwd+uCJws9jtx+gze0W+xqGn/O7AWGgIIqJWf/
	HvdqvZJ6cZ/BdMQQ1CFT62XKbx7R5DdzMTwKRucimTZRnnsOCAtpK5H7YwxpkdVly+/TFJj6x454I
	YWSyKQXUQe2VnDVU9Cdva8us9Y3aOfHNVIIprSBnh89xQWzAY3Af88BSBw3PSpg33Ke/8ZyqTYhKc
	CaUjPCVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvqx-00000002piP-1Zs2;
	Mon, 19 Jan 2026 20:27:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvqu-00000002pi2-2mr1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 20:27:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5D20497;
	Mon, 19 Jan 2026 12:27:48 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7690B3F694;
	Mon, 19 Jan 2026 12:27:50 -0800 (PST)
Message-ID: <a25b6768-2423-48d8-aabf-fc902199ffbc@arm.com>
Date: Mon, 19 Jan 2026 20:27:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/47] arm_mpam: resctrl: Pre-allocate free running
 monitors
To: Gavin Shan <gshan@redhat.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-31-ben.horgan@arm.com>
 <5e20890a-f1f0-4a54-894b-a0e170a8a5f8@redhat.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <5e20890a-f1f0-4a54-894b-a0e170a8a5f8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_122756_807885_05640C5B 
X-CRM114-Status: GOOD (  12.47  )
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

On 1/19/26 11:57, Gavin Shan wrote:
> Hi Ben,
> 
> On 1/13/26 12:58 AM, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> When there are enough monitors, the resctrl mbm local and total files can
>> be exposed. These need all the monitors that resctrl may use to be
>> allocated up front.
>>
>> Add helpers to do this.
>>
>> If a different candidate class is discovered, the old array should be
>> free'd and the allocated monitors returned to the driver.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

>> +
>> +static int *__alloc_mbwu_array(struct mpam_class *class, u16
>> num_mbwu_mon)
>> +{
>> +    int err;
>> +    size_t array_size = num_mbwu_mon * sizeof(int);
>> +    int *array __free(kfree) = kmalloc(array_size, GFP_KERNEL);
>> +
> 
> A warning reported by checkpatch.pl as below.
> 
> WARNING: Missing a blank line after declarations
> #84: FILE: drivers/resctrl/mpam_resctrl.c:607:
> +    size_t array_size = num_mbwu_mon * sizeof(int);
> +    int *array __free(kfree) = kmalloc(array_size, GFP_KERNEL);
> 

Similarly to the other blank line checkpatch.pl warning I expect this is
to do with how it handles the __free() annotation. I'm not intending to
change this code unless there is some style guideline that I've missed
or other reason to do so.

Thanks,

Ben


