Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49246C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=718dnt4uE2YDpDnoBsWO1q6YxBs35DF+ceNTbs3YqR0=; b=Ocdr93OoDDZau0yf6kW50pVcMg
	TkiM1ZnmJxrkqtl03UOKBsUTEGvY3F1cTSr9tCxMnyv6YOnr+uMHgpvgsMXaPIuxZ2CQrzFjIh5rn
	ryD7a8/OU8urhnRrzUUM14moyErb0ELTNl4C2qWd6vBwu9yF5u7NqMojjIny0H9MVVsytLr/GV1N4
	mMe5wHGYLfdFr5vOGyQx5xKenfNRIIOTWlMjzPDwMpgLqlzwVVH8B3dp+ALQjEwDbDq5gVYtf5URb
	mWg+YmYw+vUFErmJYgR6cuaLissKnynSZ02XUkh8vKwsZztmHTWQC0WZTi9kwdRR80G1r/pXJmsQ2
	p1YYvtyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7RX-0000000DgQb-42XP;
	Fri, 25 Sep 2026 15:02:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7RW-0000000DgPm-0azz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 15:02:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C359C1688;
	Fri, 25 Sep 2026 08:02:25 -0700 (PDT)
Received: from [10.57.10.17] (unknown [10.57.10.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 223813F85F;
	Fri, 25 Sep 2026 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790348549; bh=85LE8mJXVs6JArsgWcvXfC7Xtvt9iQDJisLQSCB8z5M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H5MONHZCwvGc1eZswUFSIojrHQj6YlW7HZ5fNwn+jQVdGMqH/vBhYivsTR+JAtuyG
	 Z/4jawUWYLuSRUIzDSPuriwInkylUHXsMJhTc4Rj+oQV87AUNcaPhHFRAvPX5/iJGO
	 ZBeCQ+HGppvRK0/Wh/iPt2aKQErK4VUKtP3RuAS4=
Message-ID: <a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com>
Date: Fri, 25 Sep 2026 16:02:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 5/7] firmware: arm_rmm: Activate the RMM
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
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-6-suzuki.poulose@arm.com> <arZmXFw5Jw2IbAmA@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <arZmXFw5Jw2IbAmA@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_080230_277420_03160394 
X-CRM114-Status: GOOD (  23.22  )
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

On 25/09/2026 13:17, Catalin Marinas wrote:
> On Thu, Sep 24, 2026 at 02:51:59PM +0100, Suzuki K Poulose wrote:
>> From: Steven Price <steven.price@arm.com>
>>
>> Activate the RMM after the basic configuration. This is a memory
>> transferring stateful operation.
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>> Changes since v17:
>>   * Inline RMM_ACTIVATE command and remove the definitions from arm-rmi-cmds.h
>>   * Use scope-based cleanup to free sro object
>> Changes since v16:
>>   * Split into a new patch
>> ---
>>   drivers/firmware/arm_rmm/rmi.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
>> index 035f21d3f26b6..0859f256e192b 100644
>> --- a/drivers/firmware/arm_rmm/rmi.c
>> +++ b/drivers/firmware/arm_rmm/rmi.c
>> @@ -834,7 +834,18 @@ static int __init arm64_init_rmi(void)
>>   	if (ret)
>>   		return ret;
>>   
>> -	return 0;
>> +	/* Activate the RMM */
>> +	struct rmi_sro_state *sro __free(kfree) = kmalloc_obj(*sro);
>> +	if (!sro)
>> +		return -ENOMEM;
>> +
>> +	ret = rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_ACTIVATE);
>> +	if (ret) {
>> +		pr_err("RMM activate failed (%d)\n", ret);
>> +		ret = ret < 0 ? ret : -ENXIO;
>> +	}
>> +
>> +	return ret;
> 
> It was raised earlier this year [1] but I'm not sure it concluded. How
> do we handle kexec and kdump? I think RMI_RMM_DEACTIVATE only succeeds
> if nothing is delegated, so it would need all realms torn down first. If
> that's not feasible, we could at least block (non-crash) kexec like pKVM
> does.

You are right, we can't DEACTIVATE until all granules have been
"undelegated" back. Not just the Realms, but also the GPTs/Tracking
Metadata etc would need to be reclaimed (when we get to support
dynamic GPT/Tracking metadata). For now, we should block the kexec.
> 
> Kdump gets even more interesting if it starts accessing delegated pages
> and getting GPF.
> 
> [1] https://lore.kernel.org/r/CABpDEukEO4Y_fg8fv5Nr1_Pw_qOK=2UmioXk=WyPEzoEprPcGA@mail.gmail.com

Kdump may be a bit more easier, as the kdump kernel is supposed to use
the "reserved" region and vmcore access could handle the GPF and
provide "0"s to the reader ? May be this is one case where the
host needs to be able to handle GPFs.

Cheers
Suzuki

> 


