Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588A2C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/ovB6qLqPcbU35wCDWCKviOzlbLO2oERbjs1l8pv6M=; b=G9G+e8rZ49juzv98Fp+jwNv6Ib
	5LUMg/MJQZK+JzFxkbopDwpSynaCcasPriNUT5Can/3GozRGvVkh+rGbeQHsc0eXeB8NHdiYMHhKt
	mrYWrDs1Tq9/5JSYBmGvqNrKL6oO5GlPguMuSBghXlktUEVVNftN7bHU6H88CZFqHtQQUNuIGGNpF
	eB0wS9euKkiF+G41MUMkH5/bawS7l1fvIHGk2GAg72HtcHXskJ/0Oi926XHIQGluE8YcDKJoDzfZf
	DgZSTHAmEq5Lby1cLnmuWwP7/kiImgZ8QSrWGk/AKXnUZcE22nEstqBSPHsGouDj7CmsXLtEiS729
	zhnAbIhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqsF-00000003M0e-1TW9;
	Mon, 07 Jul 2025 18:47:31 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqQx-00000003HJx-4BWE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 18:19:21 +0000
Received: from [100.65.225.228] (unknown [20.236.10.163])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9A63D201B1B2;
	Mon,  7 Jul 2025 11:19:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9A63D201B1B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1751912358;
	bh=Q/ovB6qLqPcbU35wCDWCKviOzlbLO2oERbjs1l8pv6M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CpyYx8G/9r/8bn4VodiaCI2P12/6dv11eleUchaoxBXdjDQ01msSZaylE/Bo6gGzz
	 6VeCoKMY9PpTKKgnOMalPuXtYyHSPzr0sYbhdR9bNt+aze5B+LdVt+3QsZxU67WTk+
	 MYhKF3msWtcsyCOQlunmo7uie2NVGJBdGfCKVaas=
Message-ID: <32b541e0-bc5f-485a-bfe4-190519b4c150@linux.microsoft.com>
Date: Mon, 7 Jul 2025 11:19:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] Drivers: hv: Use nested hypercall for post message
 and signal event
To: Michael Kelley <mhklinux@outlook.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "romank@linux.microsoft.com" <romank@linux.microsoft.com>
Cc: "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kw@linux.com"
 <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
 "mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>,
 "x86@kernel.org" <x86@kernel.org>
References: <1751582677-30930-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1751582677-30930-3-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB41576CBCA98ECA4C77BCC2D7D44FA@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB41576CBCA98ECA4C77BCC2D7D44FA@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_111920_090522_ABE0A3AD 
X-CRM114-Status: GOOD (  15.58  )
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

On 7/6/2025 8:13 PM, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Thursday, July 3, 2025 3:45 PM
>>
>> When running nested, these hypercalls must be sent to the L0 hypervisor
>> or VMBus will fail.
>>
>> Remove hv_do_nested_hypercall() and hv_do_fast_nested_hypercall8()
>> altogether and open-code these cases, since there are only 2 and all
>> they do is add the nested bit.
>>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>> Reviewed-by: Roman Kisel <romank@linux.microsoft.com>
>> ---
>>  arch/x86/include/asm/mshyperv.h | 20 --------------------
>>  drivers/hv/connection.c         |  7 +++++--
>>  drivers/hv/hv.c                 |  6 ++++--
>>  3 files changed, 9 insertions(+), 24 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
>> index 5ec92e3e2e37..e00a8431ef8e 100644
>> --- a/arch/x86/include/asm/mshyperv.h
>> +++ b/arch/x86/include/asm/mshyperv.h
>> @@ -111,12 +111,6 @@ static inline u64 hv_do_hypercall(u64 control, void *input,
>> void *output)
>>  	return hv_status;
>>  }
>>
>> -/* Hypercall to the L0 hypervisor */
>> -static inline u64 hv_do_nested_hypercall(u64 control, void *input, void *output)
>> -{
>> -	return hv_do_hypercall(control | HV_HYPERCALL_NESTED, input, output);
>> -}
>> -
>>  /* Fast hypercall with 8 bytes of input and no output */
>>  static inline u64 _hv_do_fast_hypercall8(u64 control, u64 input1)
>>  {
>> @@ -164,13 +158,6 @@ static inline u64 hv_do_fast_hypercall8(u16 code, u64 input1)
>>  	return _hv_do_fast_hypercall8(control, input1);
>>  }
>>
>> -static inline u64 hv_do_fast_nested_hypercall8(u16 code, u64 input1)
>> -{
>> -	u64 control = (u64)code | HV_HYPERCALL_FAST_BIT | HV_HYPERCALL_NESTED;
>> -
>> -	return _hv_do_fast_hypercall8(control, input1);
>> -}
>> -
>>  /* Fast hypercall with 16 bytes of input */
>>  static inline u64 _hv_do_fast_hypercall16(u64 control, u64 input1, u64 input2)
>>  {
>> @@ -222,13 +209,6 @@ static inline u64 hv_do_fast_hypercall16(u16 code, u64 input1, u64 input2)
>>  	return _hv_do_fast_hypercall16(control, input1, input2);
>>  }
>>
>> -static inline u64 hv_do_fast_nested_hypercall16(u16 code, u64 input1, u64 input2)
>> -{
>> -	u64 control = (u64)code | HV_HYPERCALL_FAST_BIT | HV_HYPERCALL_NESTED;
>> -
>> -	return _hv_do_fast_hypercall16(control, input1, input2);
>> -}
>> -
>>  extern struct hv_vp_assist_page **hv_vp_assist_page;
>>
>>  static inline struct hv_vp_assist_page *hv_get_vp_assist_page(unsigned int cpu)
>> diff --git a/drivers/hv/connection.c b/drivers/hv/connection.c
>> index be490c598785..47c93cee1ef6 100644
>> --- a/drivers/hv/connection.c
>> +++ b/drivers/hv/connection.c
>> @@ -518,8 +518,11 @@ void vmbus_set_event(struct vmbus_channel *channel)
>>  					 channel->sig_event, 0);
>>  		else
>>  			WARN_ON_ONCE(1);
>> -	} else {
>> -		hv_do_fast_hypercall8(HVCALL_SIGNAL_EVENT, channel->sig_event);
>> +	} else if (hv_nested) {
> 
> As coded, this won't make any hypercall for the non-nested case.
> The "else if (hv_nested)" should be just "else".

Ah, forgot to change this line. Thank you for catching it

Nuno

> 
> Michael
> 
>> +		u64 control = HVCALL_SIGNAL_EVENT;
>> +
>> +		control |= hv_nested ? HV_HYPERCALL_NESTED : 0;
>> +		hv_do_fast_hypercall8(control, channel->sig_event);
>>  	}
>>  }
>>  EXPORT_SYMBOL_GPL(vmbus_set_event);
>> diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
>> index 308c8f279df8..b14c5f9e0ef2 100644
>> --- a/drivers/hv/hv.c
>> +++ b/drivers/hv/hv.c
>> @@ -85,8 +85,10 @@ int hv_post_message(union hv_connection_id connection_id,
>>  		else
>>  			status = HV_STATUS_INVALID_PARAMETER;
>>  	} else {
>> -		status = hv_do_hypercall(HVCALL_POST_MESSAGE,
>> -					 aligned_msg, NULL);
>> +		u64 control = HVCALL_POST_MESSAGE;
>> +
>> +		control |= hv_nested ? HV_HYPERCALL_NESTED : 0;
>> +		status = hv_do_hypercall(control, aligned_msg, NULL);
>>  	}
>>
>>  	local_irq_restore(flags);
>> --
>> 2.34.1


