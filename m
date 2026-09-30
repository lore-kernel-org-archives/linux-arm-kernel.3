Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F4BCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOjLsqSGM2oN3RTRBQIPFLkxVxj3HV06cDJEU9uJWvM=; b=0ZWPKBVEENUMVO+OgOXjZwchGx
	P8HSxE3lxreklYKagHh023T8fNoEiJrd/jK5gQo8330tbvUh5L+dC45QyqzKoZ6kP0QkLPZQM+0DD
	0tpklBQt4fWS4cQPvmPfWSDmll0hUcbKVp4ONrJKUa/lAPAxYZo+/90T6L6d8nYDsQiP4VVRcLYam
	/WqpaV9UQNc3ODg5tsIUjb6t8KiXHLHJ9ps1wTKDpCcZGiZ5GYQMY9oik7xKGYTFrvclHmONdTW0Z
	VOPfJf4eFhjeCKi3uBAL3aomAyI0IDcSG8LeYvB97e3S9J0trkAijIHQShHi4PrkdpVA/iOVQv1rV
	ikTNZboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBufR-00000006B4p-3jYC;
	Wed, 30 Sep 2026 13:48:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBufP-00000006B3o-0JEA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:48:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 322B4497;
	Wed, 30 Sep 2026 06:48:10 -0700 (PDT)
Received: from [10.57.9.178] (unknown [10.57.9.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5536E3F86F;
	Wed, 30 Sep 2026 06:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790776093; bh=Dar8iWrwueb30Qw0DVgkCFG8Xw/Wi7e1xUK/b2vhgNY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P/rjOi7t+k/Vlmjdkbj8VZh103tFHBdnH29u8r/ktKUZE6HldY7ZSHosJFFxFw0R/
	 KZrYI8/RjFSujvEr/HTCwn+onttP+dtwZ7e2dy5Ia5zfZ0lZpzd+0zmGCkZx1URcHi
	 rcQaIElaifsQfE8cqNnmtnE1MhR9TJJyH+FS5QT8=
Message-ID: <10412ef0-94f1-4be8-8fd8-d1e5daaf421d@arm.com>
Date: Wed, 30 Sep 2026 14:48:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 4/9] firmware: arm_rmm: Add support for SRO
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260929221623.1342076-1-suzuki.poulose@arm.com>
 <20260929221623.1342076-5-suzuki.poulose@arm.com> <ar0LQwXM5MEvFUWa@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ar0LQwXM5MEvFUWa@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_064815_241844_8CC8B46B 
X-CRM114-Status: GOOD (  14.76  )
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

On 30/09/2026 14:15, Catalin Marinas wrote:
> On Tue, Sep 29, 2026 at 11:16:18PM +0100, Suzuki K Poulose wrote:
>> +static int rmi_sro_donate_contig(struct rmi_sro_state *sro,
>> +				 unsigned long sro_handle,
>> +				 unsigned long donatereq,
>> +				 struct arm_smccc_1_2_regs *out_regs,
>> +				 gfp_t gfp)
>> +{
>> +	unsigned long block_size_fld = RMI_DONATE_BLOCK_SIZE(donatereq);
>> +	unsigned long block_size = rmi_addr_block_size_to_bytes(block_size_fld);
>> +	unsigned long count = RMI_DONATE_COUNT(donatereq);
>> +	unsigned long state = RMI_DONATE_STATE(donatereq);
>> +	unsigned long size = block_size * count;
>> +	unsigned long addr_range;
>> +	unsigned long donated_size;
>> +	int ret;
>> +	void *virt;
>> +	phys_addr_t phys;
>> +
>> +	/*
>> +	 * The RMM specification requires contiguous allocations are always a
>> +	 * power of 2
>> +	 */
>> +	if (WARN_ON_ONCE(!is_power_of_2(size)))
>> +		return -EINVAL;
>> +	/*
>> +	 * RMM clamps the Maximum value of RmiOpMemDonateReq:count to prevent
>> +	 * overflow in the RMI_ADDR_RANGE_COUNT field.
>> +	 */
>> +	if (WARN_ON_ONCE(count > (BIT(PAGE_SHIFT - 2) - 1)))
>> +		return -EINVAL;
> 
> Nit: it might be easier to read as FIELD_MAX(RMI_ADDR_RANGE_COUNT_MASK)
> as that's what we want to limit it to.

Thanks, that is neat. I will update this.

> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> (Sashiko seems to have more findings but the rest looks alright to me)

I have updated the code to address the issues.

Thanks Catalin.

Suzuki


