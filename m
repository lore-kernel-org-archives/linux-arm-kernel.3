Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B3DCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0BgRY9f7u4097H0/rvyPbVF0fTe0gNm9vyNBLjAJjM=; b=KfcGZcIaE0sDC8WstWMbL2OgZG
	UPRmsKscvURTHpgF6CeD8Zs2xS7+sJKul6WfC5UBaL32dI0bQSX38wFIGgXAdyRLN6PFFgVhVUU1q
	rpznoFWaPNcd4FD65O3fnj2DrFN2HCCrblXRm8Bk279lYE5x///ISt3i5v3TjRICyB9AR9r2b5kXL
	Pm2jH7RNr7MQ/1sIez8X2ORgDrWZbRyfLKTnXG4xUdFdbsHAW68wEeKp+jJ9TsQfXDeo36WYE2dmQ
	yqBkBb6Ls96SJe6giYPOZ0Q7dVIbGwtLF6NnTxw28v+WHeqS7bfUqk7Qp5aRyEGYp1Dv7lWBwVs6W
	fTzoiUgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGsi-00000009Eza-2uQY;
	Thu, 01 Oct 2026 13:31:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGsf-00000009Ez6-3hVe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:31:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E05E3497;
	Thu,  1 Oct 2026 06:31:19 -0700 (PDT)
Received: from [10.57.9.178] (unknown [10.57.9.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1339C3F86F;
	Thu,  1 Oct 2026 06:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790861483; bh=9JUs2LAw7B8Ji/NW+YFWdHTHNXeYLFb0WQgfRlzCUoY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q82XEx/SD1LWxYLGdZs4ctb0uFndIPn8h5YMgtGCxWt6Qv6ZOkaKRgvMYwrJzYXgV
	 OdEpEG0APgHLpsH4K5HmpWVb5Yvh9PwGO5ou0kicw9b6qL+9u9N6u9F0q5y6QU7r82
	 HAa/kgOIwvn0p4W6VQBErzSiux9Nk8M6jq0kGoYg=
Message-ID: <289cb9bc-f591-4f53-a710-c86159356213@arm.com>
Date: Thu, 1 Oct 2026 14:31:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 8/9] firmware: arm_rmm: Add wrappers for Realm related
 RMI commands
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
References: <20261001084555.1456543-1-suzuki.poulose@arm.com>
 <20261001084555.1456543-9-suzuki.poulose@arm.com> <ar5Y_pHBUQHbXr85@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ar5Y_pHBUQHbXr85@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_063126_017591_B0177596 
X-CRM114-Status: GOOD (  22.73  )
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

On 01/10/2026 13:58, Catalin Marinas wrote:
> On Thu, Oct 01, 2026 at 09:45:54AM +0100, Suzuki K Poulose wrote:
>> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
>> index 5d005054f3c6c..e3503aba646e2 100644
>> --- a/include/linux/arm-rmi-cmds.h
>> +++ b/include/linux/arm-rmi-cmds.h
>> @@ -53,6 +53,17 @@ static inline void rmi_smccc_invoke(struct arm_smccc_1_2_regs *regs)
>>   	}
>>   }
>>   
>> +/*
>> + * rmi_smccc_invoke_once: Invoke the RMI call and return the results. Do not
>> + * retry the command. Let the caller deal with RMI_BUSY or RMI_BLOCKED.
>> + */
>> +static inline void rmi_smccc_invoke_once(struct arm_smccc_1_2_regs *regs)
>> +{
>> +	struct arm_smccc_1_2_regs args = *regs;
>> +
>> +	arm_smccc_1_2_invoke(&args, regs);
>> +}
> 
> Nit: I don't think we need to copy to args since there's no retry here.
> 
> That said, the SMCCC call clobbers regs->a0. We should write a comment

Ack. I will add the comment, similar to what we have for rmi_smccc_invoke().

> in case the caller thinks it can just retry with the same regs.
> Alternatively, we could pass args and res structures separately.

I thought about it, but settled in for copying the arguments.

> 
>> +/**
>> + * rmi_rec_destroy() - Destroy a REC
>> + * @rec: PA of the target REC
>> + * @sro: Allocated SRO context to be used
>> + *
>> + * Destroys a REC. The REC must not be running.
>> + *
>> + * Return: 0 on success, positive RMI result code or negative Linux error code
>> + */
>> +static inline long rmi_rec_destroy(unsigned long rec,
>> +				   struct rmi_sro_state *sro)
>> +{
>> +	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_REC_DESTROY, rec);
>> +}
>> +
>> +/**
>> + * rmi_rec_enter() - Enter a REC
>> + * @rec: PA of the target REC
>> + * @run_ptr: PA of RecRun structure
>> + *
>> + * Starts (or continues) execution within a REC.
>> + *
>> + * Return: RMI return code
>> + */
>> +static inline long rmi_rec_enter(unsigned long rec, unsigned long run_ptr)
> 
> Nit: should probably be __always_inline. rmi_rec_destroy() and
> rmi_smccc_invoke_once() as well.

Ack.

> 
> Not for this series but something claude spotted in the integration
> branch - kvm_rec_enter() is noinstr. On this path, we end up in
> arm_smccc_1_1_get_conduit() which is not noinstr (again, that's for the
> other series; here just __always_inline should suffice).

Good point. I will address this in the other series. May be we can
always do SMC. We don't support CCA over pKVM yet. Even there, may
be SMC counduit is available ?

i.e., arm_smccc_1_2_smc() instead of arm_smccc_1_2_invoke()

> 
>> +{
>> +	struct arm_smccc_1_2_regs regs = {
>> +		SMC_RMI_REC_ENTER, rec, run_ptr,
>> +	};
>> +
>> +	rmi_smccc_invoke_once(&regs);
>> +	return regs.a0;
> 
> Should this use RMI_RESULT_STATUS(regs.a0)?

No. We should always return the full result.

> 
> The rest looks fine to me.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks Catalin

Suzuki


