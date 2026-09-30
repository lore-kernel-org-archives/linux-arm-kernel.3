Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8C7CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mC7isSy5k1G+HLxQmq4Tce7LLbnhRrDW8CnE3gb+DJk=; b=pHmXolzsx35s4UQ6rp6LrlGMus
	CfW8FHw3ZOXT8zzvfOw0UrrCYaHrRMfSlWTbA3gpOFAlMleU9Oj7RyC6L6s4aXuu0hHkjyIlByMOd
	Seuifxpk77FvNYqd0EL8ZY6iNWgRi+ryYpERcRatze5CIOR8uITWpYD6UhR7+KgdaIswcr7yH4/y9
	J7avFH0OfHSMaZNqirZ7HxdfYq4A8G7Boqir7H2wbL9/L74bRgT1sPH/cEEoZQQ4+qOoqCOMdKk6W
	uxaJKbRWfKPHMd94LHAaGWsufkDGzyNn+zeXh5VfWyNQ4eDeydBziKF2yRUJ4/coik8SZk1YhcvQe
	KWdMqrqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwes-00000006bLa-2xqq;
	Wed, 30 Sep 2026 15:55:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwer-00000006bLP-1RJo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mC7isSy5k1G+HLxQmq4Tce7LLbnhRrDW8CnE3gb+DJk=; b=kHnY64WZUw8D9JN0WHhoUBK+Jl
	d+etuKgOw2rTfNnyya2L3eNGtbungfWYMUNNR9QQuqYrgSSkh7maNL0x1zERkN7DZsHEw0RdkINsr
	R70KlElxcbazQNJYiXRzNG7Q2bzTFwiCgTSRPknbyaPYmNr0TRua6M0fpY0DPfSJi9iz+/UrpmdcU
	kWGc1WbscsAaZSThL1/9vzi6XDevNek5JjXgZes7RTpgYqgg8fFAY8AjzRFAnB6pObcqhnC6qaRNO
	FDS4B2sX6YIxiSDnC3Gz6Eif0dYPtpqsG/1+KQURpSZ58mT4bVvwGAnAoKYs9qQ3tfzwCbdFxZcAx
	GCnvyuSA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBweo-0000000429a-1Wjy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:55:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A554C2F;
	Wed, 30 Sep 2026 08:55:39 -0700 (PDT)
Received: from [10.57.9.178] (unknown [10.57.9.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADFAF3F86F;
	Wed, 30 Sep 2026 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790783743; bh=Bc5mWey1FMzal2RQfaDFWEDiyRbRNQu+XKVSnU+udT4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pTyBwWCdjrYPTJJSYO92B4a1mS3MpLniYzgmdympuLvTm1K6xYAkgDEYfr1yvjVgt
	 q/y+ffzRccdbw11Z4sxKlJWU2Z8rQwyBLJiTwd+lucIgdcuxmmZI6Y/vMdyE6KYcHB
	 0dgbg4WFuEyRcOmFkUu0RPcCwQ1GUN6EPm+GPTis=
Message-ID: <210c0b27-c7cb-447a-b6ee-bf6b3fb63acc@arm.com>
Date: Wed, 30 Sep 2026 16:55:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 6/9] firmware: arm_rmm: Ensure the RMM has GPT entries
 for memory
Content-Language: en-GB
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 jonathan.cameron@oss.qualcomm.com
References: <20260929221623.1342076-1-suzuki.poulose@arm.com>
 <20260929221623.1342076-7-suzuki.poulose@arm.com>
 <20260930-judicious-loris-of-will-dea0a3@sudeepholla>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260930-judicious-loris-of-will-dea0a3@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_165546_816183_B52BF1B4 
X-CRM114-Status: GOOD (  27.78  )
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

Hi Sudeep

On 30/09/2026 15:44, Sudeep Holla wrote:
> On Tue, Sep 29, 2026 at 11:16:20PM +0100, Suzuki K Poulose wrote:
>> From: Steven Price <steven.price@arm.com>
>>
>> The RMM maintains the state of all the granules in the system to make
>> sure that the host is abiding by the rules. This state can be maintained
>> at different granularity, per page (TRACKING_FINE) or per region
>> (TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on the
>> underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region,
>> all pages in the region must be of the same state, this implies we need to
>> have "fine" tracking for DRAM, so that we can delegate individual pages.
>>
>> For now we only support a statically carved out memory for tracking
>> granules for the "fine" regions. This can be extended in the future to
>> allow modifying the tracking granularity and remove the need for a
>> static allocation by the firmware.
>>
>> Similarly, the firmware may create L0 GPT entries describing the total
>> address space. But if we change the "PAS" (Physical Address Space) of a
>> granule, then the firmware may need to create L1 tables to track the PAS
>> at a finer granularity. Linux therefore checks if the platform firmware
>> manages the PAR region. i.e., the firmware is in charge of managing the
>> L1 GPTs (creation and the required memory for the GPT tables - via static
>> carveouts) without host intervention. Support for dynamic GPT creation by
>> the host will be added later.
>>
>> If the firmware requires us to manage the tracking or GPT memory,
>> deactivate the RMM and reclaim any memory donated at RMM activation.
>>
>> Apply the same checks when hotplugged memory is brought online.
>>
...

>> ---
>>   drivers/firmware/arm_rmm/rmi.c | 247 ++++++++++++++++++++++++++++++++-
>>   include/linux/arm-rmi-cmds.h   |  18 +++
>>   2 files changed, 264 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
>> index d982cf158f8da..d4d098448e46e 100644
>> --- a/drivers/firmware/arm_rmm/rmi.c
>> +++ b/drivers/firmware/arm_rmm/rmi.c
> 
> [...]
> 
>> +static int rmi_verify_gpt_firmware_managed(phys_addr_t start, phys_addr_t end)
>> +{
>> +	unsigned long l0gpt_sz;
>> +	unsigned long next, par_state;
>> +
>> +	l0gpt_sz = 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
>> +					  rmi_feat_reg(1)));
>> +	start = ALIGN_DOWN(start, l0gpt_sz);
>> +	end = ALIGN(end, l0gpt_sz);
>> +
> 
> Is it guaranteed that end with not be = PASZ ? The spec says RMI_GPT_INFO
> will return RMI_GPT_INFO when top >= pasz. Unlike start, end for good
> reason is aligned up(ceil) instead of aligned down, but that also means
> end will become PASZ when we reach end of memory, no ?

Good point. The RMM spec needs to be fixed to make the condition

  top > pasz

as the top, is really the top the region and is not inclusive.

This is already a known issue, tracked by FENIMORE-1807. The proposed
fix is :

pre: UInt(top) > rmm.static.pasz


> 
> Sorry if I am missing something, trying to understand bits and piece of
> RME still, just getting started.

Thanks for looking !

Cheers
Suzuki

> 
>> +	while (start < end) {
>> +		long ret = rmi_gpt_info(start, end, &next, &par_state);
>> +
>> +		if (ret != RMI_SUCCESS) {
>> +			pr_err("RMI_GPT_INFO failed for %llx-%llx: (%ld)\n",
>> +				start, end, ret);
>> +			return -ENXIO;
>> +		}
>> +
>> +		if (WARN_ON(next <= start))
>> +			return -ENXIO;
>> +
>> +		if (par_state != RMI_GPT_PAR_PLAT) {
>> +			pr_err("GPT for the region is not managed by firmware %llx-%lx\n",
>> +				start, next);
>> +			return -ENODEV;
>> +		}
>> +		start = next;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
> 


