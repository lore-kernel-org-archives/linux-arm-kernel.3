Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427DDC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 00:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gjw5PWt223rowDGBZCHjxly1p9HKhMMUyejuy/vZ6SQ=; b=f2XTVfDPPGaDvzs2ndAGAgcIGN
	rK2AXzGfBv8HXUebvPt7mTkmkt/8jfd3N22/gQ+6GT0b0vr6mE1P3+wcX7q4/8G4CZqkzTxlNl2JR
	6bq2dJd6dwZlrs0Tfu0w1x8gcxjJz80srvYAkDwhtF6YpvgIyxPu6f5qPltTxFtiO26JIC/NwmKYx
	kDOw4+GAtgf3U3Eitn8rjAazjr5RAolxm/QkRSh29jVlBFw4118vhnLU0hDhXqNlhP118TsKJdvpa
	5Jx9YuRGNk11Weg4P0ce34+uXUg6NvS4xLSl+PQ758N4R3IA4G2PYvE8QABdZJKyb0hqal+X6mwHv
	qgSufU3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnoLi-00000009IOu-1ZXz;
	Fri, 28 Feb 2025 00:35:30 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnoK9-00000009I9A-0l3r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 00:33:54 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id B650B210EAC1;
	Thu, 27 Feb 2025 16:33:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B650B210EAC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740702832;
	bh=Gjw5PWt223rowDGBZCHjxly1p9HKhMMUyejuy/vZ6SQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OhdMfpg6TnWLYiIbw4OJuQd8Wsm8rSa1YurhPYrpIe8O3euI5oQ5lJmeONznXNRxS
	 4OQzDNVRzOZ3uOPsAf+3/RyIwPBiVEdYCemBj0FQ3SG7WnpEI44kUMqPPyGKfKR8ig
	 Q/KV0deHXyad8Du90EGHDx5mjjnuwv4bfiN47SSE=
Message-ID: <b243fabe-cc96-46ea-9efc-68b0d5b379ef@linux.microsoft.com>
Date: Thu, 27 Feb 2025 16:33:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] hyperv: Introduce hv_recommend_using_aeoi()
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org,
 joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org,
 lenb@kernel.org, corbet@lwn.net
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-5-git-send-email-nunodasneves@linux.microsoft.com>
 <7749367d-d87d-43f0-8c24-cd08bb4ce1a8@linux.microsoft.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <7749367d-d87d-43f0-8c24-cd08bb4ce1a8@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_163353_271886_C7D72517 
X-CRM114-Status: GOOD (  16.74  )
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

On 2/27/2025 3:03 PM, Easwar Hariharan wrote:
> On 2/26/2025 3:07 PM, Nuno Das Neves wrote:
>> Factor out the check for enabling auto eoi, to be reused in root
>> partition code.
>>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>> ---
>>  drivers/hv/hv.c                | 12 +-----------
>>  include/asm-generic/mshyperv.h | 13 +++++++++++++
>>  2 files changed, 14 insertions(+), 11 deletions(-)
>>
> 
> <snip>
> 
>> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
>> index 258034dfd829..1f46d19a16aa 100644
>> --- a/include/asm-generic/mshyperv.h
>> +++ b/include/asm-generic/mshyperv.h
>> @@ -77,6 +77,19 @@ extern u64 hv_do_fast_hypercall16(u16 control, u64 input1, u64 input2);
>>  bool hv_isolation_type_snp(void);
>>  bool hv_isolation_type_tdx(void);
>>  
>> +/*
>> + * On architectures where Hyper-V doesn't support AEOI (e.g., ARM64),
>> + * it doesn't provide a recommendation flag and AEOI must be disabled.
>> + */
>> +static inline bool hv_recommend_using_aeoi(void)
>> +{
>> +#ifdef HV_DEPRECATING_AEOI_RECOMMENDED
>> +	return !(ms_hyperv.hints & HV_DEPRECATING_AEOI_RECOMMENDED);
>> +#else
>> +	return false;
>> +#endif
>> +}
>> +
> 
> I must be missing something very basic here, and if so, I apologize, and please enlighten me.
> 
> HV_DEPRECATING_AEOI_RECOMMENDED is defined as BIT(9) in include/hyperv/hvgdk_mini.h, and
> asm-generic/mshyperv.h includes that via include/hyperv/hvhdk.h.
> 
> If this is the case, when would HV_DEPRECATING_AEOI_RECOMMENDED ever be not defined?
> If it's always defined, do we need the #ifdef?
> 
HV_DEPRECATING_AEOI_RECOMMENDED is only defined on x86 (it used to live in x86 hyperv-tlfs.h).
It lives inside a #if defined(CONFIG_X86) block in hvgdk_mini.h. It is a bit confusing since
it is surrounded by other x86-only definitions which are prefixed with HV_X64_.

Thanks
Nuno

> Thanks,
> Easwar (he/him)


