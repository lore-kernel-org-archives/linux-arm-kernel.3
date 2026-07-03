Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BBDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 04:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHnUHC2loAUQOF3ipvuR0PiWOihZrdNJGJ573g3nQSk=; b=IuJxlaaPd0taSxEOsaH3mHNlqx
	zDLYex2iPk33BOTAa+Pm8cgt253J5b2CYgW8R59D9UK3mjDDNutTbOZt/m0AdKJaQ+l0XtH1qWgAv
	HsTErRn9mqiRBy9aqnOvczZ0EM+lXr3jrGVbNqGK9yFmqwXBuHmzPhdpU/vob4YfuLcqwR8yDKu3L
	xWi/72WtkQlQiplhZAxiX06+Qcy7N7tgD56KA0o29V4N2eCPogD1vSu30s4smn6K7Pwcv+818q1qX
	Oy24yuDr/yGWzIEBUou89l8FlSsQZgPdyeiJIJ2btKSdjU1P7F4b/SQjuG8meoEWJjOGZrY2QlEVG
	8UI+OuAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfVde-000000061MV-3aMe;
	Fri, 03 Jul 2026 04:36:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfVdc-000000061Lw-25Lq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 04:36:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 346B91CC4;
	Thu,  2 Jul 2026 21:36:20 -0700 (PDT)
Received: from [10.163.170.216] (unknown [10.163.170.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E5643F905;
	Thu,  2 Jul 2026 21:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783053384; bh=Huf4PlM1oSkcNi7ICVIfuvMLySVEdvCv0CiezIssnPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QZcCEpXeiPNKBiMjjywV9TaLIW4JKg5JaBiuwOf/3xvuLSmfFPNTJXKUFxRfTHxRn
	 KtyzZUCRHeqrj7YD9egmxo/I8i2VxHSNhJSLNxldk+bQoePMynJNPbPYLPsFRHmgSN
	 P8cFM1G7JNLYJ5i/7xp3yzOPcyCXtsIXgd74vl2o=
Message-ID: <f1441151-1da9-4b61-af52-42499496ec73@arm.com>
Date: Fri, 3 Jul 2026 10:06:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: cpufeature: Detect BBML3 based on MMFR2 ID
To: Mark Rutland <mark.rutland@arm.com>, Linu Cherian <linu.cherian@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260701094131.677636-1-linu.cherian@arm.com>
 <20260701094131.677636-3-linu.cherian@arm.com> <akZBOkMSH77C6MH5@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <akZBOkMSH77C6MH5@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_213628_633072_FE9FC6C5 
X-CRM114-Status: GOOD (  20.34  )
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



On 02/07/26 4:15 PM, Mark Rutland wrote:
> On Wed, Jul 01, 2026 at 03:11:28PM +0530, Linu Cherian wrote:
>> Add MMFR2 ID based BBML3 feature detection, so
>> that compliant cpus doesn't need to be added to the
>> midr list.
>>
>> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
>> ---
>>  arch/arm64/kernel/cpufeature.c | 14 +++++++-------
>>  arch/arm64/tools/sysreg        |  1 +
>>  2 files changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 9986eb7b379c..d754b1b7da77 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -2133,6 +2133,7 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
>>  
>>  bool cpu_supports_bbml3(void)
>>  {
>> +	u64 mmfr2;
>>  	/* CPUs that support BBML3 but dont advertise through MMFR2 ID */
>>  	static const struct midr_range supports_bbml3_list[] = {
>>  		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
>> @@ -2144,15 +2145,14 @@ bool cpu_supports_bbml3(void)
>>  		{}
>>  	};
>>  
>> -	if (!is_midr_in_range_list(supports_bbml3_list))
>> -		return false;
>> +	if (is_midr_in_range_list(supports_bbml3_list))
>> +		return true;
>>  
>> -	/*
>> -	 * We currently ignore the ID_AA64MMFR2_EL1 register, and only care
>> -	 * about whether the MIDR check passes.
>> -	 */
>> +	mmfr2 = __read_sysreg_by_encoding(SYS_ID_AA64MMFR2_EL1);
>> +	if (SYS_FIELD_GET(ID_AA64MMFR2_EL1, BBM, mmfr2) == ID_AA64MMFR2_EL1_BBM_3)
>> +		return true;
> 
> This needs to be '>=', so that if there's a future BBML4, we correctly
> detect that CPUs with BBML4 also have the BBML3 behaviour.

That's right.
> 
> It would also be better to check the ID field first, before falling back
> to the MIDR check. That way a reader can more clearly see that
> supports_bbml3_list catches older parts that don't advertised BBML3, and
> the comment above supports_bbml3_list would be clearer.

Flipping the check order makes things clearer.
> 
> With those changes, this looks sane to me.
> 
> Mark.
> 
>>  
>> -	return true;
>> +	return false;
>>  }
>>  
>>  static bool has_bbml3(const struct arm64_cpu_capabilities *caps, int scope)
>> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
>> index bc1788b1662b..082256ec3bf9 100644
>> --- a/arch/arm64/tools/sysreg
>> +++ b/arch/arm64/tools/sysreg
>> @@ -2259,6 +2259,7 @@ UnsignedEnum	55:52	BBM
>>  	0b0000	0
>>  	0b0001	1
>>  	0b0010	2
>> +	0b0011	3
>>  EndEnum
>>  UnsignedEnum	51:48	TTL
>>  	0b0000	NI
>> -- 
>> 2.43.0
>>

Please move above tools/sysreg change into a separate patch
as an update for existing ID_AA64MMFR2_EL1 definition.

