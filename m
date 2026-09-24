Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEDAC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3IgF5jnBwJEWSoRVndkNGl07ltIBAagfxke/etF3U4=; b=hjhra07YCXPtIE0POxOpcHRgln
	nDNC4w62BH4cZTX1ITNoJRt82Xsp74y9yDTs6BINLx11Pb1yTT/N6Ty7iTcFFD/Zqs+Ta0TkvwkNX
	2SBwSHLMwG1P1IEH+kBuiLWP9z5NI3Cki2yC8YxSj579IraArltGZHLf4OMn3PoKmK+Oj3c7gIWaC
	6e9NapyRkklV1UDmcxrY6uUAGOt61WjjO8vOqBbZ3x4Bo9McOCmXiLisJD8lf6bQ+6B87hkc9EcUS
	GbCjaH7mijxhWe6qTMCEOVmEe8TZ6PQ9f+fxNf0JhkHkPvJOA4XFZ93jg0k+4SnDvWIz7pBwJqDGV
	sFclt1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sFs-0000000CK8F-3I5L;
	Thu, 24 Sep 2026 22:49:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sFq-0000000CK7L-3Js2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:49:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A19B1E5E;
	Thu, 24 Sep 2026 15:49:21 -0700 (PDT)
Received: from [10.57.10.88] (unknown [10.57.10.88])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2E7A3F86F;
	Thu, 24 Sep 2026 15:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790290165; bh=es2JFGtR/yGRJZPfDOKoMKeZJ3W57laY+q8VEqDYDKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EgkJpaNpSmKXCQ7tSyUqJJ7TLOE57d/HFEXpQhNyzI0wo5deOqfhQRez3T70N3pTT
	 Bix9JXOFUrFnJqAyocfD2lZW/1u7kChbRXcFip0wNl3WwyEsoQQLRce9coPL6yn+pv
	 PAC8ZXm7duNeciCJy6fg7vaGlHZ3BNokFcM/J0kU=
Message-ID: <f317970f-a114-4353-a253-174fa449dde1@arm.com>
Date: Thu, 24 Sep 2026 23:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 1/7] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
Content-Language: en-GB
To: Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org,
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
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-2-suzuki.poulose@arm.com>
 <CAEvNRgH8Hwt6_VaFxJVvytZ4La1R7bUN2emc37_fWecF9j2-YA@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CAEvNRgH8Hwt6_VaFxJVvytZ4La1R7bUN2emc37_fWecF9j2-YA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_154926_909924_F83BFB59 
X-CRM114-Status: GOOD (  12.51  )
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

On 24/09/2026 18:05, Ackerley Tng wrote:
> Suzuki K Poulose <suzuki.poulose@arm.com> writes:
> 
>>
>> [...snip...]
>>
>> +
>> +/*
>> + * Note many of these fields are smaller than u64 but all fields have u64
>> + * alignment, so use u64 to ensure correct alignment.
>> + */
>> +struct rmm_config {
>> +	union { /* 0x0 */
>> +		struct {
>> +			u64 tracking_region_size;
>> +			u64 rmi_granule_size;
>> +		};
>> +		u8 sizer[SZ_4K];
>> +	};
>> +};
>> +
>> +static_assert(sizeof(struct rmm_config) == SZ_4K);

...

>> +struct realm_params {
>> +	union { /* 0x0 */
>> +		struct {
>> +			u64 flags0;
>> +			u64 s2sz;
>> +			u64 sve_vl;
>> +			u64 num_bps;
>> +			u64 num_wps;
>> +			u64 pmu_num_ctrs;
>> +			u64 hash_algo;
>> +			u64 num_aux_planes;
>> +		};
>> +		u8 padding0[0x400];
> 
> The union + sizer concept is cool. Technically this one isn't a padding,
> it's also a sizer? (same for the other structs below.

Yep, you're right. I have changed all in the file to sizer.

> 
>> +	};

...

>> +};
>> +
>> +static_assert(sizeof(struct realm_params) == SZ_4K);
>> +
> 
> Does declaring this struct as packed matter? I guess the static_assert()
> has the same effect.
> 

I guess it doesn't, the fields are naturally aligned for the offset.
That said, I have added static_assert() for starting offsets for a
a group of related fields to match the spec.

e.g;

static_assert(offsetof(struct realm_params, rpv) == 0x400);
static_assert(offsetof(struct realm_params, rtt_base) == 0x808);
static_assert(offsetof(struct realm_params, aux_rtt_base) == 0xf80);



Thanks for the review !

Suzuki

>>
>> [...snip...]
>>


