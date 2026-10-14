Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C327CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Lf0lQggRONexyHLo27fbzWTnjGbzE28f5/qQ3luTUQ=; b=U/1LHoDzDlS5re3/hLIpKSDSIW
	PJ0xgqykyKGiogVAL6M2RYQ3tnKpgVH5odjBEp3mpZqWnxLVGYKvA8U4iv6fBQ36sOnl+EW+wSKrL
	4omzg0oJU5oSqsbp/TuzNoEwYqmLKqypfA5ZTidCm+b+nnzMzbnXJjGbnfg6pTqad5O0xlRyvGW+Z
	kWfSMf3UcriACx3Jf3doLThrND4oW1IP9ETtM12f6wD4/S9vynG0vcuHjw7DWtXR3Af7opKfZ6+se
	D1rRlAHhibJImbYZ9cV6NMoGbqcdJouiMYgzHXXBJgKYnYSYVwcCgwVQxzm87/4WIL5wlIYk9EZFt
	Y6KkxrbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvzO-0000000FBBF-2dXZ;
	Wed, 14 Oct 2026 10:13:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvzJ-0000000FBAc-17h2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 10:13:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0315C153B;
	Wed, 14 Oct 2026 03:13:29 -0700 (PDT)
Received: from [10.57.9.28] (unknown [10.57.9.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B22E3F673;
	Wed, 14 Oct 2026 03:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791972812; bh=U0HDjjBQ1wZStGbPImReFidE4VOJi6igE3YQoFYCuS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GzIBGRC8wuOEsqZgPFOh5C1Hwiga39S2JNj6kDzRTPrTtTd9pdUSC5Qptl0M/6c8T
	 JG65pzO9uSv3RJAvLIvsRzfJgWS+4+MRONAV5O+4q/y8M2Cgr+B5UOLMhOQzNdA1Yo
	 9v0tcX0nmJ6r+R8s28aAyT4u9Zho2F359P+pimP0=
Message-ID: <c17df5ea-3f62-47f5-9de8-8ce3dc74eada@arm.com>
Date: Wed, 14 Oct 2026 11:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: rsi: Correct type of realm_config::hash_algo
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>,
 Kohei Enju <enju.kohei@fujitsu.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sami Mujawar <sami.mujawar@arm.com>, Steven Price <steven.price@arm.com>,
 "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
References: <20261014-cca-b4-rsi-fix-hash_algo-type-rebase-v2-1-6cb0ae13c8c1@fujitsu.com>
 <as9RFRuhlGL1mZbz@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <as9RFRuhlGL1mZbz@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_031333_412702_E3FE3B0E 
X-CRM114-Status: GOOD (  29.25  )
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

On 14/10/2026 10:53, Catalin Marinas wrote:
> Thanks for respinning.
> 
> On Wed, Oct 14, 2026 at 11:43:23AM +0900, Kohei Enju wrote:
>> The RMM specification defines RsiHashAlgorithm as an 8-bit type, but
>> realm_config::hash_algo is currently declared as unsigned long.
>>
>> There are currently no upstream users of this field, so the mismatch
>> does not cause an observable issue today. However, a proposed series
>> adding support for Realm measurement registers uses this field and
>> exposes a bug caused by the incorrect type.
> 
> It should be clear the bug is in the RMM implementation. The patch here
> is more like defensive programming when the RMM doesn't honour the
> interface and zero the unused bits. I can fix the text when applying.
> 
>> Change hash_algo to u8 to match the RMM specification while preserving
>> the size and layout of struct realm_config.
>>
>> Link: https://lore.kernel.org/all/20260413084957.327661-4-sami.mujawar@arm.com/
>> Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
>> ---
>> Changes in v2:
>> - Drop the inner union and padding around hash_algo (Catalin)
>> - Link to v1: https://patch.msgid.link/20260929-cca-b4-rsi-fix-hash_algo-type-rebase-v1-1-6932cf0aa605@fujitsu.com
> 
> In theory we could add a fixes tag for reference but not worth cc
> stable.
> 
> Fixes: b880a80011f5 ("arm64: rsi: Add RSI definitions")
> 
>> ---
>>   include/linux/arm-smccc-rsi.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
>> index fddb77986f70..cca881ddfdba 100644
>> --- a/include/linux/arm-smccc-rsi.h
>> +++ b/include/linux/arm-smccc-rsi.h
>> @@ -128,7 +128,7 @@ struct realm_config {
>>   	union {
>>   		struct {
>>   			unsigned long ipa_bits; /* Width of IPA in bits */
>> -			unsigned long hash_algo; /* Hash algorithm */
>> +			u8 hash_algo; /* Hash algorithm */
>>   		};
>>   		u8 pad[0x200];
>>   	};
> 
> Suzuki, are you ok with this patch?

Yep, looks good to me.

> 
> As a separate patch, we need to add some static_assert() for the offsets
> and the size of the realm_config structure. We do this in
> arm-smccc-rmi.h already.

I was going to suggest that and possibly rename the "pad" to sizers. For
now this is fine, but would be good to do that when we add the newer
  fields for RSI v2.0


> 
> There's a similar realm_params structure in arm-smccc-rmi.h but,
> IIUC, the hash_algo there is written by the kernel, so unsigned long is
> fine.

Correct. It is an input to the RMM.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Cheers
Suzuki>


