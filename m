Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C447C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 20:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbAhr6fPGcBENjeomk3ETvZLQrm+55Psk62o0Fe4twI=; b=JW8Kx1jAi/nCvcaJG6pbbm2w1z
	6uiWYklT8LrXkjcMOc4T45/ojlIXmKrbzUkYuZ1Em8PKMB0XjgiTaU7pgYEL0XDci16N9K07UOSst
	H5bL/dMTF2N1K9kJSmXhapbWu7/PQYbz0+7pcA4B39I7+NfTTRpat2GM+wfpxMCUaxxqszg6Wh5MP
	wiuuEQYXvTcwR91hIw+gk+wDmFwOUXxIwr9GRBp2XinnNZ//gNSBx036bw7/P4N+HOq9US4BSqvm9
	vT5+w2JozY9tQ/yFhxYsa2I7snDrY2lY9bojRFXbeJK/uDA7EkTdM/S2K39GC3KGuzrinyWIz/Kn5
	YtHD+LlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRGKW-00000005T10-2YSr;
	Mon, 16 Jun 2025 20:21:20 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRGIH-00000005SbY-29hC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 20:19:02 +0000
Received: from [100.65.1.24] (unknown [20.236.11.42])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6B6D621176CE;
	Mon, 16 Jun 2025 13:19:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6B6D621176CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1750105140;
	bh=DbAhr6fPGcBENjeomk3ETvZLQrm+55Psk62o0Fe4twI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uy/ZSae8z9fTKK5NtdGhuaGY2Ohz7+rqLU5+RHq/3RsGfXiOSMdDW2+fwYU8EWAab
	 +tS5gDCkSpCxGo4eEaO5AGThhUg4+orlQGLpx6rM6jOJRsKPN6xN+b9aNw9vItrIts
	 cAjE46Kq8X99ud5PRLLhMSuuBmuOYLRVSs5VRoRg=
Message-ID: <92ea0ddb-3813-42f8-8191-1a1f8fae5220@linux.microsoft.com>
Date: Mon, 16 Jun 2025 13:18:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] Drivers: hv: Use nested hypercall for post message
 and signal event
To: Michael Kelley <mhklinux@outlook.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Cc: "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kw@linux.com"
 <kw@linux.com>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
 "mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>,
 "x86@kernel.org" <x86@kernel.org>
References: <1749599526-19963-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1749599526-19963-3-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB4157ECC740A762C9C3B9EA6AD475A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157ECC740A762C9C3B9EA6AD475A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_131901_604555_FE034709 
X-CRM114-Status: GOOD (  30.34  )
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

On 6/11/2025 4:06 PM, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Tuesday, June 10, 2025 4:52 PM
>>
>> When running nested, these hypercalls must be sent to the L0 hypervisor
>> or vmbus will fail.
> 
> s/vmbus/VMBus/
> 

Ack

>>
>> Add ARM64 stubs for the nested hypercall helpers to not break
>> compilation (nested is still only supported in x86).
>>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>> ---
>>  arch/arm64/include/asm/mshyperv.h | 10 ++++++++++
>>  drivers/hv/connection.c           |  3 +++
>>  drivers/hv/hv.c                   |  3 +++
>>  3 files changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/mshyperv.h
>> b/arch/arm64/include/asm/mshyperv.h
>> index b721d3134ab6..893d6a2e8dab 100644
>> --- a/arch/arm64/include/asm/mshyperv.h
>> +++ b/arch/arm64/include/asm/mshyperv.h
>> @@ -53,6 +53,16 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg)
>>  	return hv_get_msr(reg);
>>  }
>>
>> +static inline u64 hv_do_nested_hypercall(u64 control, void *input, void *output)
>> +{
>> +	return U64_MAX;
>> +}
>> +
>> +static inline u64 hv_do_fast_nested_hypercall8(u64 control, u64 input1)
>> +{
>> +	return U64_MAX;
>> +}
> 
> I think the definitions of hv_do_nested_hypercall() and
> hv_do_fast_nested_hypercall8() are architecture independent. All
> they do is add the HV_HYPERCALL_NESTED flag, which when
> implemented for ARM64, will presumably be the same flag as
> currently defined for x86.  As such, couldn't the definitions of
> hv_do_nested_hypercall() and hv_do_fast_nested_hypercall8()
> be moved to asm-generic/mshyperv.h? Then stubs would not
> be needed for ARM64. These two functions would never be
> called on ARM64 because hv_nested is never true on ARM64
> (at least for now), but the code would compile. And if either
> function was erroneously called on ARM64, presumably
> Hyper-V would return an error because HV_HYPERCALL_NESTED
> is set.
> 

Good point - letting the hypervisor return the error is fine.

>> +
>>  /* SMCCC hypercall parameters */
>>  #define HV_SMCCC_FUNC_NUMBER	1
>>  #define HV_FUNC_ID	ARM_SMCCC_CALL_VAL(			\
>> diff --git a/drivers/hv/connection.c b/drivers/hv/connection.c
>> index be490c598785..992022bc770c 100644
>> --- a/drivers/hv/connection.c
>> +++ b/drivers/hv/connection.c
>> @@ -518,6 +518,9 @@ void vmbus_set_event(struct vmbus_channel *channel)
>>  					 channel->sig_event, 0);
>>  		else
>>  			WARN_ON_ONCE(1);
>> +	} else if (hv_nested) {
>> +		hv_do_fast_nested_hypercall8(HVCALL_SIGNAL_EVENT,
>> +					     channel->sig_event);
>>  	} else {
>>  		hv_do_fast_hypercall8(HVCALL_SIGNAL_EVENT, channel->sig_event);
>>  	}
>> diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
>> index 308c8f279df8..99b73e779bf0 100644
>> --- a/drivers/hv/hv.c
>> +++ b/drivers/hv/hv.c
>> @@ -84,6 +84,9 @@ int hv_post_message(union hv_connection_id connection_id,
>>  						   sizeof(*aligned_msg));
>>  		else
>>  			status = HV_STATUS_INVALID_PARAMETER;
>> +	} else if (hv_nested) {
>> +		status = hv_do_nested_hypercall(HVCALL_POST_MESSAGE,
>> +						aligned_msg, NULL);
>>  	} else {
>>  		status = hv_do_hypercall(HVCALL_POST_MESSAGE,
>>  					 aligned_msg, NULL);
> 
> Are HVCALL_SIGNAL_EVENT and HVCALL_POST_MESSAGE the only two
> hypercalls that are ever expected to need a "nested" version? I'm
> wondering if the function hv_do_nested_hypercall() and
> hv_do_fast_nested_hypercall8() could be dropped entirely, and just
> pass the first argument to hv_do_hypercall() or hv_do_fast_hypercall8()
> as <hypercall_name> | HV_HYPERCALL_NESTED. For only two cases, a
> little bit of open coding might be preferable to the overhead of defining
> functions just to wrap the or'ing of HV_HYPERCALL_NESTED. 
> 
> The code above could then look like:
> 
> 	} else {
> 		u64 control = HVCALL_POST_MESSAGE;
> 
> 		control |= hv_nested ? HV_HYPERCALL_NESTED : 0;
> 		status = hv_do_hypercall(control, aligned_msg, NULL);
> 	}
> 
> Again, ARM64 is implicitly handled because hv_nested is never set.
> 
> This is just a suggestion. It's motivated by the fact that we already have
> three flavors of hypercall for HVCALL_SIGNAL_EVENT and
> HVCALL_POST_MESSAGE, and I was looking for a way to avoid adding
> a fourth flavor. But it's a marginal win, and if you prefer to keep the
> inline functions, I'm OK with that.
> 

I like the suggestion to open-code these cases.

There are several places we need to get/set nested MSRs, but as for hypercalls
it is just these 2, so far. When I consider it from that angle, it feels cleaner
to just open-code them, and remove the existing '_nested' versions of the
hypercall helpers for now.

Thanks
Nuno

> Michael


