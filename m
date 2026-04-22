Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE78F9EDDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 14:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXJWh3vYjJuI6lm6V1FLGF4/8JAJGPDUxrz4N7xwg9U=; b=BTtUyjm2ItdqUaBlvCVWRk9i3K
	cAziu+9RNOXuS3XGVIaJIuZF6D3ihQLYqOwWzmzS8TfdRmihx0+EHnW4q/1uzMKooSYMLqV8FQLTx
	FlYiUoSmnucQdBTfHOxhUxnbbNFqZSDdfnek6eqvEl+o/OHva9igjHHnfvYAOjkXQRxFudYrPkSQJ
	LoptwuxAWevPeNsz7ZHYuZR38uejXUFBI/+WNPuM5UR6K7mwWmey9v/KckXbUInlEtQhO4yyrXF13
	cbSRHU7UiHnVqv5nuIuaTP+ikWO5xEGZfY6voPpc8E8XZfczxe8V8A1JWLf6FCpGRCCdLqP7zD519
	1U1CUZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYnt-0000000ANhB-2ar9;
	Wed, 22 Apr 2026 14:43:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYnr-0000000ANgb-07cU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 14:43:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEFB31E8D;
	Wed, 22 Apr 2026 07:43:37 -0700 (PDT)
Received: from [10.1.34.169] (e121487-lin.cambridge.arm.com [10.1.34.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB7593FBF8;
	Wed, 22 Apr 2026 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776869023; bh=1ea+KwZfdTYpB3s5PNSAn6QddPSqeVxzm3nlqZsqNFI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=paWZYiw2PhHOSqkU0A/rB3nC5Dt+HYt9e+idu3uczE7pHOZ0RoFEnaE29XeSihj/V
	 83wVwnBqQ9XSPmQAqrokGBR6o5lqLOaBTXmw3Pn/ra3PqpvLUVoDkBR8LXJsWIrT+F
	 PnR2v6TSMG5D2Pzh38B2IP38ilXwu48gPz30xg6Q=
Message-ID: <fbd9268f-ace7-42d8-b920-8b6f9b97cf6d@arm.com>
Date: Wed, 22 Apr 2026 15:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: traps: Add a macro to simplify the condition codes
 check
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, kees@kernel.org, maz@kernel.org,
 ada.coupriediaz@arm.com, smostafa@google.com, leitao@debian.org,
 mrigendra.chaubey@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260320082846.1235016-1-ruanjinjie@huawei.com>
 <dd2f076b-976c-480d-8414-e6685cad40dd@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <dd2f076b-976c-480d-8414-e6685cad40dd@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_074347_203035_4C7E7A2E 
X-CRM114-Status: GOOD (  14.48  )
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

Hi Jinjie,

On 4/22/26 04:06, Jinjie Ruan wrote:
> 
> On 3/20/2026 4:28 PM, Jinjie Ruan wrote:
>> Add DEFINE_COND_CHECK macro to define the simple __check_* functions
>> to simplify the condition codes check.
>>
>> No functional changes.
> Gentle ping.
> 
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/kernel/traps.c | 59 ++++++++++-----------------------------
>>  1 file changed, 15 insertions(+), 44 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
>> index 914282016069..6216fe9e8e42 100644
>> --- a/arch/arm64/kernel/traps.c
>> +++ b/arch/arm64/kernel/traps.c
>> @@ -49,45 +49,21 @@
>>  #include <asm/system_misc.h>
>>  #include <asm/sysreg.h>
>>  
>> -static bool __kprobes __check_eq(unsigned long pstate)
>> -{
>> -	return (pstate & PSR_Z_BIT) != 0;
>> -}
>> -
>> -static bool __kprobes __check_ne(unsigned long pstate)
>> -{
>> -	return (pstate & PSR_Z_BIT) == 0;
>> -}
>> -
>> -static bool __kprobes __check_cs(unsigned long pstate)
>> -{
>> -	return (pstate & PSR_C_BIT) != 0;
>> -}
>> -
>> -static bool __kprobes __check_cc(unsigned long pstate)
>> -{
>> -	return (pstate & PSR_C_BIT) == 0;
>> -}
>> -
>> -static bool __kprobes __check_mi(unsigned long pstate)
>> -{
>> -	return (pstate & PSR_N_BIT) != 0;
>> -}
>> -
>> -static bool __kprobes __check_pl(unsigned long pstate)
>> -{
>> -	return (pstate & PSR_N_BIT) == 0;
>> -}
>> -
>> -static bool __kprobes __check_vs(unsigned long pstate)
>> -{
>> -	return (pstate & PSR_V_BIT) != 0;
>> -}
>> -
>> -static bool __kprobes __check_vc(unsigned long pstate)
>> -{
>> -	return (pstate & PSR_V_BIT) == 0;
>> -}
>> +#define DEFINE_COND_CHECK(name, flag, expected)			\
>> +static bool __kprobes __check_##name(unsigned long pstate)	\
>> +{								\
>> +	return ((pstate & (flag)) != 0) == (expected);		\
>> +}
>> +
>> +DEFINE_COND_CHECK(eq, PSR_Z_BIT, true)
>> +DEFINE_COND_CHECK(ne, PSR_Z_BIT, false)
>> +DEFINE_COND_CHECK(cs, PSR_C_BIT, true)
>> +DEFINE_COND_CHECK(cc, PSR_C_BIT, false)
>> +DEFINE_COND_CHECK(mi, PSR_N_BIT, true)
>> +DEFINE_COND_CHECK(pl, PSR_N_BIT, false)
>> +DEFINE_COND_CHECK(vs, PSR_V_BIT, true)
>> +DEFINE_COND_CHECK(vc, PSR_V_BIT, false)
>> +DEFINE_COND_CHECK(al, 0, false)		/* Always true */
>>  
>>  static bool __kprobes __check_hi(unsigned long pstate)
>>  {
>> @@ -131,11 +107,6 @@ static bool __kprobes __check_le(unsigned long pstate)
>>  	return (temp & PSR_N_BIT) != 0;
>>  }
>>  
>> -static bool __kprobes __check_al(unsigned long pstate)
>> -{
>> -	return true;
>> -}
>> -
>>  /*
>>   * Note that the ARMv8 ARM calls condition code 0b1111 "nv", but states that
>>   * it behaves identically to 0b1110 ("al").
> 

It looks like we now have a mix of checks implemented via macros
and others written out explicitly. The existing approach has the
advantage of being consistent and easy to follow, whereas
introducing macros here, even if it reduces some duplication,
adds a bit of cognitive overhead when reading the code.

This may come down to preference, but I think sticking to a
single, consistent style would make the code easier to scan and
maintain.

Just my 2p.

Cheers
Vladimir

