Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A37CA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 12:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9wmObUeeCYyJLXTNKt/zlM/Q/fcV3Ae1XIUkXv83js=; b=3rd/LdCmuNuDRMyc6n4FncCk9D
	03iqF0lmatdDtpYhMR2PeW08fb4F9kvuMK9krO0OlMJeupakkUaEUbYK7EWcuukelCr7jF96wayMC
	5ynJWLCaierDaxh4OkINzIm1+aDSI3uanzYhx0BTgHBng2cvpcHA+gj13rWhfxtaqodsM85QgZ841
	dHmaKsMkdIIq2upqEEUN05k6L8d7gW1YUJkz/qG5PIEKIpA5TQH/rIjN+LWBPtdlA5GJSzUEwawO5
	O/JcEsiMxcN75gmibsewJq7ns/nbK7yaRFl/7GqbKxeQoE7tWskAX2VV3C9LGEMlBln+/UwKdEHuB
	pF84pw/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtj1-000000063Lv-3brP;
	Wed, 30 Sep 2026 12:47:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtiy-000000063LT-2OV1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 12:47:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8397C497;
	Wed, 30 Sep 2026 05:47:46 -0700 (PDT)
Received: from [10.57.9.178] (unknown [10.57.9.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DBD33F85F;
	Wed, 30 Sep 2026 05:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790772469; bh=XSxUOWy6/i2pHRQoyR+pRBw8GLAglNiW8ucXPa+ua2g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sPjyAGULKD9PkR/+zPN+CoAKsJcaKiFs97aaVMAEhj+whK/A2nwHAqZsBENcqUCWu
	 ee5jHrvUlzYiKD35l0dRchtPoFvUbg61JriWBcZK4Vv7ktDlVpXveN0+sYo+2pDal2
	 lMaPN0u/BqkAjoWLofB/apY/534GPeErbDxXtl2g=
Message-ID: <fee0d1b7-8569-4235-b200-03490b78637e@arm.com>
Date: Wed, 30 Sep 2026 13:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 9/9] firmware: arm_rmm: hotplug: Skip memory added to
 ZONE_MOVABLE
Content-Language: en-GB
To: "David Hildenbrand (Arm)" <david@kernel.org>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 gshan@redhat.com, joey.gouly@arm.com, tabba@google.com,
 yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com,
 jonathan.cameron@oss.qualcomm.com
References: <20260929221623.1342076-1-suzuki.poulose@arm.com>
 <20260929221623.1342076-10-suzuki.poulose@arm.com>
 <4d3be415-6d51-46f7-81ca-ab2dcf0f0f74@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <4d3be415-6d51-46f7-81ca-ab2dcf0f0f74@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_054752_755139_4810EDE1 
X-CRM114-Status: GOOD (  18.60  )
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

On 30/09/2026 13:22, David Hildenbrand (Arm) wrote:
> On 9/30/26 00:16, Suzuki K Poulose wrote:
>> If the hotadded memory is in ZONE_MOVABLE, we could allow that to proceed
>> without the RMM having fine grained tracking, as we won't allocate pages
>> from there for guest-memfd or kernel allocation
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: David Hildenbrand (Arm) <david@kernel.org>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>> Changes since v19:
>>   - New patch in v20, keeping this at the tail to allow for the rest of the
>>     series to proceed, while this patch gets discussed.
>> ---
>>   drivers/firmware/arm_rmm/rmi.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
>> index d4d098448e46e..ef0a171ba9677 100644
>> --- a/drivers/firmware/arm_rmm/rmi.c
>> +++ b/drivers/firmware/arm_rmm/rmi.c
>> @@ -1043,6 +1043,18 @@ static int rmi_memory_notifier(struct notifier_block *nb,
>>   	start = PFN_PHYS(arg->start_pfn);
>>   	end = PFN_PHYS(arg->start_pfn + arg->nr_pages);
>>   
>> +	/*
>> +	 * If the hotplugged memory region is in ZONE_MOVABLE, neither the
>> +	 * guest-memfd nor the kernel allocations can come from there. So we are
>> +	 * fine to skip this.
>> +	 * For boot time memory, we don't allow this discount, as the
>> +	 * decision to move boot memory pages to ZONE_MOVABLE is purely
>> +	 * a kernel choice and the firmware must have decided what it covers.
>> +	 */
>> +	if (page_zonenum(pfn_to_page(arg->start_pfn)) == ZONE_MOVABLE &&
>> +	    page_zonenum(pfn_to_page(arg->start_pfn + arg->nr_pages - 1)) == ZONE_MOVABLE)
>> +		return NOTIFY_DONE;
>> +
> 
> is_zone_movable_page(pfn_to_page(start_pfn)
> 
> as used by virtio-mem should be sufficient. Checking only the start pfn is
> sufficient.

Thanks David, I will update it.

Cheers
Suzuki

> 


