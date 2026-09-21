Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E527C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ddZlDOihzWi5JQs6xZrb8PiUllm3prjv4IIJMCF7rU=; b=LnPbksu3HdKOcvYxvXjW4Yypo/
	dKYSGLvs2wyf9qlRkZLVTq5YdP4WWOLHdeg57ux29JrTOuDpzolu4TD44e0ASGh2jKlXISFWPjYjA
	MfBcfkgNg/+HxQ6NItJ/9kKt/in6kTCNXam3Il1L79aCRACQxnHEQlA6xBEoYM4kj7yTNR1B7zGhA
	O/is7BdAaUkwFJRdeVtGxA7aHSMIomNYPzpwtpxtePIJU4DSYFpnkGY55d6BCY3vLqMdnHiAgcWU+
	iG+N3mLQ9DOaShGXgPBie5ZNpRK7eH9Q/6k6nbqXgQTYKub0P3rVxRuLzO+zWtc7wwchJrK2JgUc8
	9qXt4H1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aMz-00000001WXm-0FXh;
	Mon, 21 Sep 2026 09:31:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aMw-00000001WWJ-0PPr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:31:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA1671476;
	Mon, 21 Sep 2026 02:31:21 -0700 (PDT)
Received: from [10.0.128.141] (unknown [10.0.128.141])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 212273F86F;
	Mon, 21 Sep 2026 02:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789983085; bh=24Mm5RiGha3l54zH1CVhHiOwalFID0+iPqIF5C+fNUI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NlPTk3IOOSsU1M/dT49gvNYmCWXKsvQ/WcsM659NIijSSpRguujMnVpDoOuq6shKE
	 7DxMyAxCc5D5YQFjP7czzHDDYXW7THjKQTx6S8nzWP7dGNXhgrEvbqOjRS9cMUTu5z
	 uVZnNOzinMOlHUVdslBh/XV4hQOVfTeDE9Qi7OTo=
Message-ID: <b84f786e-69d8-4e03-a1ad-15b697bbaab1@arm.com>
Date: Mon, 21 Sep 2026 10:31:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
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
 <20260912083611.2513845-4-suzuki.poulose@arm.com>
 <178978126541.2352296.3884730681319176394.b4-review@b4>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <178978126541.2352296.3884730681319176394.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_023126_404425_D013181B 
X-CRM114-Status: GOOD (  14.34  )
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
>> RMM v2.0 brings the ability to set the RMM's granule size. Check the
>> feature registers and configure the RMM so that it matches the host's
>> page size. This means that operations can be done with a granularity
>> equal to PAGE_SIZE.
>>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> One trivial but looks like it is getting quite a few changes from
> Gavin's comments so no tags yet.

...

>> +
>> +	config = (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
>> +	if (!config) {
>> +		pr_err("Unable to allocate memory for RMM config\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	config->rmi_granule_size = granule_size;
>> +
>> +	/*
>> +	 * For now we set the tracking_region_size to 0 which is the only option
>> +	 * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 16KB/64KB).
>> +	 * TODO: Support other tracking sizes via Kconfig option for other
>> +	 * PAGE_SIZES
>> +	 */
>> +	config->tracking_region_size = 0;
>> +
>> +	ret = rmi_rmm_config_set(virt_to_phys(config));
>> +	if (ret) {
>> +		pr_err("RMM config set failed (%d)\n", ret);
>> +		ret = -EINVAL;
>> +	}
>> +
>> +	free_page((unsigned long)config);
> 
> Maybe some __free() magic is applicable here - would let you just
> return in the error path above making for tidier flow and get
> rid of need to assign ret above.

Ack

Cheers
Suzuki>


