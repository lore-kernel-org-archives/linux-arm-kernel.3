Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6F2F9EDF3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 14:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7x8NcCz4D4k8BoARMFXUaAiQFS57TSC8jfPtJn+E3P4=; b=SZBM8ACDDu4OdToaGDxoWWbZwn
	TLYMfbJwUjR3lvFcjmN0+GaBJorqybVJA+RezFyWDPdU0dV6sGkZWB/teVSeas5XGznrmgJhHxxWx
	NSy3RlUZrm4aJDNdcYD+t98LPxlpIAent9kxRiPIqBJ4EWWB4x+QyaF3sn9Npaj4WfQzFWdedB4G6
	opG4J14ULFR7jEtcsk//OA232UZSELO9Ia3uILvvxmLRn7JtrSrCYSUil56GgKQFiASsuuDf9mhtR
	D6YVUV0gheNA+20hL0xCIlInyWPKkjYaWBkia5xEjftLkzlxfsJLf52P3cD2PhX+0eji9DFF5httc
	X/8B6cDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYyy-0000000AON9-0iQA;
	Wed, 22 Apr 2026 14:55:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYyw-0000000AOLh-1CeY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 14:55:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BBC21FC4;
	Wed, 22 Apr 2026 07:55:04 -0700 (PDT)
Received: from [10.57.63.98] (unknown [10.57.63.98])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11BF33FE87;
	Wed, 22 Apr 2026 07:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776869709; bh=wJB1LFrB+6P6GUuEZG1cJk09ntt3ZtX4VBvKoiziV80=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JBVyTXlyA0MOQUTKYlz3n9cWumPLYHdJa0eN95ySt03/esN0IUlkcZNndcqtI2ku+
	 awm6imBU+4GxwbUdan20Skrc47sQU8i80ATkV+PddD32eQXbbScdBWgf93zO7McgMl
	 o4+GqLtTo3xcIMglkkN6+XCpFmpAdQcsimhtCsgA=
Message-ID: <693f4d7c-46f4-409b-8944-a8c9e4b5e073@arm.com>
Date: Wed, 22 Apr 2026 16:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: signal: Preserve POR_EL0 if poe_context is
 missing
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>,
 Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
References: <20260421144252.1440365-1-kevin.brodsky@arm.com>
 <20260421144252.1440365-2-kevin.brodsky@arm.com>
 <aei87MmXaEdg8YOf@willie-the-truck>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <aei87MmXaEdg8YOf@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_075514_375683_51FCCCE1 
X-CRM114-Status: GOOD (  16.34  )
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

On 22/04/2026 14:19, Will Deacon wrote:
>> @@ -74,8 +76,12 @@ struct rt_sigframe_user_layout {
>>   * This state needs to be carefully managed to ensure that it doesn't cause
>>   * uaccess to fail when setting up the signal frame, and the signal handler
>>   * itself also expects a well-defined state when entered.
>> + *
>> + * The valid_fields member is a bitfield (see UA_STATE_HAS_*), specifying which
>> + * of the remaining fields is valid (has been set to a value).
>>   */
>>  struct user_access_state {
>> +	unsigned int valid_fields;
>>  	u64 por_el0;
>>  };
> Do you think it would be worth adding some accessors to make it easier
> to keep the flags in sync? For example:
>
> /* Stores por_el0 into uas->por_el0 and sets UA_STATE_HAS_POR_EL0 */
> void set_ua_state_por_el0(struct user_access_state *uas, u64 por_el0);
>
> /*
>  * If UA_STATE_HAS_POR_EL0, *por_el0 = uas->por_el0 and return 0.
>  * Otherwise, return -ENOENT.
>  */
> int get_ua_state_por_el0(struct user_access_state *uas, u64 *por_el0);
>
> WDYT?

I did get a feeling having helpers would be a good idea. I wonder if
getters/setters aren't a bit overkill though, as they make accesses to
the struct more cumbersome and we'd need a pair for every member (unless
we use some macro magic). Maybe it would be sufficient to have say
ua_state_has_field(POR_EL0) to check if the bit is set, and
ua_state_set_field_valid(POR_EL0) to set the bit?

>> @@ -1095,7 +1104,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
>>  {
>>  	struct pt_regs *regs = current_pt_regs();
>>  	struct rt_sigframe __user *frame;
>> -	struct user_access_state ua_state;
>> +	struct user_access_state ua_state = {0};
> nit: {} should do (no need for the '0'). Same in setup_rt_frame().

Will change it, I have some vague recollection that GCC and Clang
disagreed about the meaning of {}... but that's probably fixed nowadays.

Thanks for the review!

- Kevin

