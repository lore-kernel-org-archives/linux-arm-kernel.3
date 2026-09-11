Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79456C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07MS2zE30cT4NfaNDrdHCbk+5KH+GYI5asiTMyHjN3g=; b=hGVuAGJ+74ctd4nRITE6FJj1ZS
	Qe3CxF1r28xdPd1NBZk0BgK6nGMy0XfCm5joW9j8+d9OUmAq8if8oAk9oaU9PwT5FsZLlYVVhAJcc
	wbw79XVbc6uyjnGTz2aNEHfwqiIzqt23V5+o7YkL5wdOy/39V34HA2ssLCOC/qWC5bRd7PMHUh0hv
	4rvHgiJx+XmW6JJU3AZDwg9bCNxckATKuZu4+h0KBay/1NVajhl6QSfn9c6Zi46CMwojrpyTpA8hw
	tqaXpvfTgguHmiNdgJXyE11f/jJWXaMws+k892HtW5eRDjIjsRtYTk7RZH35o4sfIu+XM/tURoB9v
	oFxWstvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52fV-0000000GyPi-09WF;
	Fri, 11 Sep 2026 14:55:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52fS-0000000GyNw-2ucy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:55:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 616D216A3;
	Fri, 11 Sep 2026 07:55:46 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB8653F7B4;
	Fri, 11 Sep 2026 07:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789138550; bh=zPZGk1vxERfRcanAsZShseukdti04juJdVA94TVfAWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fvHYyr/KUqnR0dTJ/eQnFEAFSi4QhvOoYyjPmKA21Vo0XlGXBR+ynNbQN8nsKJEky
	 5x41N4+6/ZAQS2iuSTVEdghlKTv+fzK1D7gWov9U8WCZ8Vzw3ahvwYWOyczOCTxHyv
	 CNxfUXXTjBI2UKTYIjF+j6ThNBOiNquQsehRJPvM=
Message-ID: <d8ab9189-7804-4e4a-a270-b4e3d61c4271@arm.com>
Date: Fri, 11 Sep 2026 15:55:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
 <20260904095000.1184861-7-aneesh.kumar@kernel.org>
 <178855077571.693280.17942746234757215326.b4-review@b4>
 <yq5atsnyeuz5.fsf@kernel.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <yq5atsnyeuz5.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_075554_819575_0B3D586A 
X-CRM114-Status: GOOD (  18.01  )
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

On 09/09/2026 08:37, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@nvidia.com> writes:
> 
>>> [ ... 42 lines skipped ... ]
>>> @@ -94,6 +95,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
>>>   		.requires_smc   = false,
>>>   		.device_name    = "arm-smccc-trng",
>>>   	},
>>> +	{
>>> +		.func_id        = SMC_RSI_ABI_VERSION,
>>> +		.requires_smc   = true,
>>> +		.device_name    = "arm-rsi",
>>> +	},
>>>   };
>>>   
>>>   static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
>>
>>     [Severity: High]
>>     When this new entry is probed by smccc_probe_smccc_device(), does
>>     arm_smccc_1_1_invoke() pass uninitialized registers to the firmware?
>>
>>     Looking at smccc_probe_smccc_device() during system initialization:
>>
>>     drivers/firmware/smccc/smccc.c:smccc_probe_smccc_device() {
>>         ...
>> 	   arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
>>         ...
>>     }
>>
>>     Since arm_smccc_1_1_invoke() is a variadic macro, providing only the func_id
>>     leaves x1/r1 uninitialized in the SMC inline assembly.
>>
>>     For SMC_RSI_ABI_VERSION, the RMM uses x1 as the requested interface revision
>>     to determine supported revisions.
>>
>>     Could this pass a garbage requested interface revision to the RMM,
>>     potentially causing probe failures or returning an unsupported boundary?
>>
>>     Could this also leak kernel register state to EL2?
>>
>> Sashiko still has this to say, I think it should pass 0 as the x1
>> 'requested version' instead of unpredictable garbage.
>>
> 
> To handle
> 
>> Could this also leak kernel register state to EL2?
>>
> 
> Should we instead do
> 
> 	arm_smccc_1_1_invoke(smccc_dev->func_id,
> 			     0, 0, 0, 0, 0, 0, 0, &res);

That looks safe to me.


> 	ret = res.a0;
> 
> There is no standard defining how the various SMCCC VERSION calls are
> expected to work. For example, ARM_SMCCC_TRNG_VERSION does not use x1,
> while SMC_RSI_ABI_VERSION does. Another VERSION call could use both x1
> and x2. The only consistent behavior is to return
> SMCCC_RET_NOT_SUPPORTED when the SMCCC function ID is not supported.

True, relying on "SMCCC_RET_NOT_SUPPORTED" => Function ID is not
supported is the safe way. If one of the parameters are not supported,
then the call should return INVALID_PARAMETER.

Cheers
Suzuki

> 
> -aneesh


