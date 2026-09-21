Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E622BC982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUcNbkjRdF64WLe/tyh5JW/TouZMllc/6J6VIKn9JeI=; b=n2NyqWWboJGgQM5P/18W4/wDXr
	4XJU/mYthMYeEbD9lyArWfNqooU0C2CZd5SEjc2J0IJRdkybuzgIw8laxGzifZpqBXUa5A5FDwTQS
	okogZR2kk/+PNosJIRrrccQCNEBzvEjxB2NGDKh6PPuLS1AYw+TdGm3VQN3lgM8BVFvUs0VU2qcnN
	7uJ66B67oxHD50/gGZAU2949HnLRZl/OKhppxYhR0hHO7Dbyu1xH5GFRN+OO8QuV5CO3sShyfr2hO
	T5N7j45X8Gq3FJN3tekW2xd+GlazjuqHsJiNhdGgqDOtTo/vxJPDbjum149SCG/3hUmKiKtX0AvE7
	nwnBJttQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZxN-00000001ReL-1zCK;
	Mon, 21 Sep 2026 09:05:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZxL-00000001RdV-10my
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:05:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEA5B1D15;
	Mon, 21 Sep 2026 02:04:54 -0700 (PDT)
Received: from [10.0.128.141] (unknown [10.0.128.141])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22CA23F86F;
	Mon, 21 Sep 2026 02:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789981498; bh=UE/X0gcMPeiPPSKCeX1gWcGjezEgz5neWZ7i4wm/qgo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qh7mVIMImrIyA1UX15dpadr1LMV3Kze+0L28tCkv4dH36w/Hz6pKo+WJZ1W8FVRo+
	 xeEolfEH3D0mZpSL2zzQiFX012Z6mt4274rlFjgoixZGWkKDIVtYHwWY8sdSZN+L+R
	 hQDlfTbxahWEb4hVwqB7ZYrSkcL0cL9cxwfbbXoA=
Message-ID: <5318f467-317b-4d67-a39b-39e5ce1d860c@arm.com>
Date: Mon, 21 Sep 2026 10:04:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 5/7] firmware: arm_rmm: Activate the RMM
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-6-suzuki.poulose@arm.com>
 <178978126542.2352296.10527413259157627665.b4-review@b4>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <178978126542.2352296.10527413259157627665.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_020459_384350_A3062A47 
X-CRM114-Status: GOOD (  22.58  )
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

On 19/09/2026 02:27, Jonathan Cameron wrote:
>> Activate the RMM after the basic configuration. This is a memory transferring,
>> stateful operation.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> With the declaration moved as per standard way of dealing with __free
> magic (there are docs in cleanup.h on this)
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 
>> ---
>> Changes since v17:
>>   * Inline RMM_ACTIVATE command and remove the definitions from arm-rmi-cmds.h
>>   * Use scope-based cleanup to free sro object
>> Changes since v16:
>>   * Split into a new patch
>> ---
>>   drivers/firmware/arm_rmm/rmi.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
>> index 4f9898ece754..ecc89e91d264 100644
>> --- a/drivers/firmware/arm_rmm/rmi.c
>> +++ b/drivers/firmware/arm_rmm/rmi.c
>> @@ -762,6 +762,7 @@ static int rmi_configure(void)
>>   static int __init arm64_init_rmi(void)
>>   {
>>   	int ret;
>> +	struct rmi_sro_state *sro __free(kfree) = NULL;
>>
> Read the guidance in cleanup.h
> 
> This is a path to a potentially grumpy Linus.  He's made the sensible
> point a number of times that putting the declaration of the destructor
> anywhere that isn't right next to the contstructor is a recipe for
> hard to read code and odd bugs (this one isn't buggy,
> but the principle is more general and the readability thing does hold!)

Ack

> 
>>   	/* Continue without realm support if we can't agree on a version */
>>   	ret = rmi_check_version();
>> @@ -776,7 +777,18 @@ static int __init arm64_init_rmi(void)
>>   	if (ret)
>>   		return ret;
>>   
>> -	return 0;
>> +	/* Activate the RMM */
>> +	sro = kmalloc_obj(*sro);
> 
> struct rmi_sro_state *sro __free(kfree) = kmalloc_obj(*sro);

Thanks

> 
>> +	if (!sro)
>> +		return -ENOMEM;
>> +
>> +	ret = rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_ACTIVATE);
>> +	if (ret) {
>> +		pr_err("RMM activate failed\n");
>> +		ret = ret < 0 ? ret : -ENXIO;
>    		return ret < 0 ? ...
>> +	}
> 
> return 0;
> Perhaps to make it more obvious that any non 0 return means error?

We want to differentiate between the linux errnos vs RMM errors 
(positive). I will rework this to address the RMI_BLOCKED comment
from Sudeep.

Cheers
Suzuki


> 
> Doesn't really matter
> 


