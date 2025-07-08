Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827E6C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYsOmVCrkNRoREOOjbb2rRRmP/C/3L8xBNtyBGbEt5M=; b=PV22HDcB1kneJsiaIvBAoqsZWh
	GBtFFQEYw75mGR/6Uuvrl13tDJe7uuJMc06Z6dKw2pIq3suSqcJfrUNzC5RMEIp01L3YJhHLG/CNA
	0hbQNCK0dKRcM8F/ochDI9Sf8OwsFWguVQN03rXlxBRi1C/UTJ+6Awa4XEuu0QNmcHy32rPJOV0PX
	zwV2aP7I9ETjygTyOB2wPAYxhO7sB6CwZlg2gUJLtricNzaTCjP8sBGJKDe77asHqI17eUtaon/cj
	hmGodiIDIQSPNrkICKNC7NcS0YgTTVxIeSr2tZWlE6eKOBn8YDnpUXFvmEubZ6QHTHh6jEhjlq2DF
	hibJ1QEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5DN-000000050mm-1uSU;
	Tue, 08 Jul 2025 10:06:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4q2-00000004v4i-2Srm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 09:42:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59DDF153B;
	Tue,  8 Jul 2025 02:41:57 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB3413F77D;
	Tue,  8 Jul 2025 02:42:07 -0700 (PDT)
Message-ID: <03a76e9a-86ac-4791-9f0a-494b28c07fcc@arm.com>
Date: Tue, 8 Jul 2025 10:42:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] bitfield: Ensure the return value of
 type##_replace_bits() is checked
To: Yury Norov <yury.norov@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, james.morse@arm.com
References: <20250703135729.1807517-1-ben.horgan@arm.com>
 <20250703135729.1807517-3-ben.horgan@arm.com> <aGv2WoAtxnEgqV4y@yury>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <aGv2WoAtxnEgqV4y@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_024210_672365_127423DE 
X-CRM114-Status: GOOD (  18.54  )
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

Hi Yury,

On 7/7/25 17:31, Yury Norov wrote:
> Hi Ben,
> 
> On Thu, Jul 03, 2025 at 02:57:29PM +0100, Ben Horgan wrote:
>> As type##_replace_bits() has no side effects it is only useful if its
>> return value is checked. Add __must_check to enforce this usage. To have
>> the bits replaced in-place typep##_replace_bits() can be used instead.
>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>   include/linux/bitfield.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
>> index 6d9a53db54b6..39333b80d22b 100644
>> --- a/include/linux/bitfield.h
>> +++ b/include/linux/bitfield.h
>> @@ -195,8 +195,8 @@ static __always_inline __##type type##_encode_bits(base v, base field)	\
>>   		__field_overflow();					\
>>   	return to((v & field_mask(field)) * field_multiplier(field));	\
>>   }									\
>> -static __always_inline __##type type##_replace_bits(__##type old,	\
>> -					base val, base field)		\
>> +static __always_inline __##type __must_check type##_replace_bits(__##type old,	\
>> +							base val, base field)	\
>>   {									\
>>   	return (old & ~to(field)) | type##_encode_bits(val, field);	\
>>   }									\
> 
> So, would it make sense to mark _encode_bits() and _get_bits() as
> __must_check as well? At least from the point of unification, it
> would.
Could do. It seems less important as there are no obvious foot-guns that 
these would guards against. Would you like me to add this in a v2?
> 
> How would we move this - with my bitmap-for next or with arm branch?

I'm not familiar with the branch machinery so can't comment on this.
> 
> Thanks,
> Yury
> 

Thanks,

Ben


