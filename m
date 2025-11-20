Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A89CF8863
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Pv7TznRoZvD45ayRdnXnvgz+g3Sc/UP6RMqqLLXWQo=; b=ajLN3KXfZ+5zM+5c4LYxOci/Eu
	IhKfwfXF0zAHS8BGpMiiOTd83C1udMDbIoNdn/UUHL3UlGactY9bSQIA+sR2F457sIoZSk0lsO/9u
	nbCnCskynqOx6VYtelWV9/gwV8/chgGLmmFfGVk+ZKwrcLLo2ZR9RLZ//mP2Lwhj0Y7/1K6Ltwcuy
	fRUzKItOcXM3olQI69vll6qt3y6rh7TI5U6Epm5ksMgG2EP/nYlmkLB/npt1rV8iulTCOUuuohQxG
	sqftsOO7PO+LUf3dl9RlI1G7sM8gOD+pzMudNm+S9Kgcvvz9ps7lA5ZUf/NtmeMIq46QDrYGwG4AU
	MknuqY3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5rv-00000006rZA-3PV1;
	Thu, 20 Nov 2025 14:42:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5rt-00000006rXi-2Usb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:42:43 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477a1c28778so11755405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 06:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763649759; x=1764254559; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Pv7TznRoZvD45ayRdnXnvgz+g3Sc/UP6RMqqLLXWQo=;
        b=JPU4v7821/NsBUYll5rn5c9jjy0kN9HAJaXAtjQ2KBFNtkkWcLg74/69W/URCrnShm
         yOque6ljD+atwRYtQ0gyZUEf+S4JRmLMVHVt09UzyTkm4ytMl08/WyrKPxHDmtH4FpCJ
         SLeQJU0Z18dbSedd4GhEMfXBqBmiAwcTDq9r0IfGBfB1MQTG7qerIrDBEshTFfQhESp/
         xvrbJaFdHzWlFvVRwobjaMUWTHMRj3l1h4+el7+TCQf+zm2Nk93mwkZWtJdFGgP4Eax0
         mFm4FzjSUC//7gmYYyk7jf+3Aov5T0QDoqHoQiaXqXfTCAy4Z3f+ZT2yRt/LVJGHX2x9
         lmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763649759; x=1764254559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Pv7TznRoZvD45ayRdnXnvgz+g3Sc/UP6RMqqLLXWQo=;
        b=QsD1YFIW1v5IwGjVw9mjsjQWcG7/4CWPujwqCIvMdbn9Fdedce0zZCc3oP3HV+tdis
         yJxhbefNiKX7mp4btsvU1scCnC/m7AzZdLL377Dxh9FJTXpqyjER5WjJYmR2nnFcwgFd
         X+G1hX65tP/N5NwNhRVi/FrEGNKhWIfFrTgdn1Kw9PtmDFxX39uWa3yvxRu+PBIHug9w
         1dBd5ALy9cB0uRuKmshnzqsyuGtGocdxPiBxN1WIVjOXLAHAs8NPChOe+nMYClyt7hXf
         vB5Gbm50FiMPyAKmDVhgfHQZ8RaR86Y++A5WAXEs9WOFS7t/NP3dfg9HCn/mLf153Nbl
         +BEw==
X-Forwarded-Encrypted: i=1; AJvYcCUPNE4uqqc2XEEvI/3X5f+DvsKnHTa1z5qEX4PY6pjIm5Sf50gyY1EteK79MVJaWThTA+LTtZ5wS++Uc46zczyu@lists.infradead.org
X-Gm-Message-State: AOJu0YwihFlOwymVTTJgF5lNfenDpra1VmSQXv5ZK6Nf+woOAHcDA7b+
	6G+c33drrGMmgUXI+juxDi+F0ZWo0bIbob5JFs7SYNonisZP1FHcljMihOUmuOimjfI=
X-Gm-Gg: ASbGnctlnfXdn6HrVx9TFWfxdDMsH6v4Z2hGh7ZHMQvjlBT/CpR0XlIOaRfHspfv+/E
	ViQ5GTDluQa97vbP0483QZFMC848ssrpb2uj3gENfuN8ij5EPLGgxoSxxRXUOkbCRfPgcrd0SjW
	mWVmJ3XdrxI+h4eU6RjsuK5mDKMDAcqERR0D6mIHHJcDJBlQv38pz95D9isboiUN3yH9EeCoD/u
	74r8KrmHmUftahqM7QGyLL5ZeV/5i6alyV3Mc9GXW6zjOtdVte7+0tV63BlnTZRzl7tp9Aoh/7B
	bBFvQJLMzUzwWWXT0qHxWg48zE14Pl/dpMC1keOClk7iIMMbAcahmtkCGou8+LF7VKXyP21jKJA
	K0+YH3FK1VveoMtYJ0Hnnamqw0emGUU1B6JcsaGF5yoq1Bpy7PcEh2vU5chZPNv3r5QCdTTEXut
	Qz5lvf6ikP3SzFPJ34
X-Google-Smtp-Source: AGHT+IH8NIXJxsYuZU1xz+adVmh3MdApnMN81fR/tx7NjCk4HEn80imm6rNP43gwBlJgqV2nyacdRw==
X-Received: by 2002:a05:600c:1c8d:b0:477:54cd:2029 with SMTP id 5b1f17b1804b1-477b857906emr40381285e9.4.1763649758984;
        Thu, 20 Nov 2025 06:42:38 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b8314279sm52911195e9.11.2025.11.20.06.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 06:42:37 -0800 (PST)
Message-ID: <26c00401-47d8-4c0a-8f3c-e5e888ff0440@linaro.org>
Date: Thu, 20 Nov 2025 14:42:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/13] coresight: Refactor
 etm4_config_timestamp_event()
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-3-82efd7b1a751@linaro.org>
 <CAJ9a7VhYaU=kAtvZtSnkj-9OicCWwqYQBX4Q3zDtCay-8=Y7Cg@mail.gmail.com>
 <4090a47c-2208-486b-bd96-47518d7aa90c@linaro.org>
 <CAJ9a7ViDnGa26qdAk1qWBugMVuGp_9w7NMAnMn4v3wf5HTp-Tw@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7ViDnGa26qdAk1qWBugMVuGp_9w7NMAnMn4v3wf5HTp-Tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_064241_853462_3E15A49D 
X-CRM114-Status: GOOD (  51.26  )
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



On 20/11/2025 2:26 pm, Mike Leach wrote:
> HI James
> 
> On Thu, 20 Nov 2025 at 13:52, James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 20/11/2025 1:04 pm, Mike Leach wrote:
>>> Hi James
>>>
>>> On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>>>>
>>>> Remove some of the magic numbers and try to clarify some of the
>>>> documentation so it's clearer how this sets up the timestamp interval.
>>>>
>>>> Return errors directly instead of jumping to out and returning ret,
>>>> nothing needs to be cleaned up at the end and it only obscures the flow
>>>> and return value.
>>>>
>>>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> ---
>>>>    drivers/hwtracing/coresight/coresight-etm4x-core.c | 96 ++++++++++++++--------
>>>>    drivers/hwtracing/coresight/coresight-etm4x.h      | 23 ++++--
>>>>    2 files changed, 81 insertions(+), 38 deletions(-)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>>> index 560975b70474..5d21af346799 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>>> @@ -642,18 +642,33 @@ static void etm4_enable_sysfs_smp_call(void *info)
>>>>     * TRCRSCTLR1 (always true) used to get the counter to decrement.  From
>>>>     * there a resource selector is configured with the counter and the
>>>>     * timestamp control register to use the resource selector to trigger the
>>>> - * event that will insert a timestamp packet in the stream.
>>>> + * event that will insert a timestamp packet in the stream:
>>>> + *
>>>> + *  +--------------+
>>>> + *  | Resource 1   |   fixed "always-true" resource
>>>> + *  +--------------+
>>>> + *         |
>>>> + *  +------v-------+
>>>> + *  | Counter x    |   (reload to 1 on underflow)
>>>> + *  +--------------+
>>>> + *         |
>>>> + *  +------v--------------+
>>>> + *  | Resource Selector y |   (trigger on counter x == 0)
>>>> + *  +---------------------+
>>>> + *         |
>>>> + *  +------v---------------+
>>>> + *  | Timestamp Generator  |  (timestamp on resource y)
>>>> + *  +----------------------+
>>>>     */
>>>>    static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>>>    {
>>>> -       int ctridx, ret = -EINVAL;
>>>> -       int counter, rselector;
>>>> -       u32 val = 0;
>>>> +       int ctridx;
>>>> +       int rselector;
>>>>           struct etmv4_config *config = &drvdata->config;
>>>>
>>>>           /* No point in trying if we don't have at least one counter */
>>>>           if (!drvdata->nr_cntr)
>>>> -               goto out;
>>>> +               return -EINVAL;
>>>>
>>>>           /* Find a counter that hasn't been initialised */
>>>>           for (ctridx = 0; ctridx < drvdata->nr_cntr; ctridx++)
>>>> @@ -663,15 +678,19 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>>>           /* All the counters have been configured already, bail out */
>>>>           if (ctridx == drvdata->nr_cntr) {
>>>>                   pr_debug("%s: no available counter found\n", __func__);
>>>> -               ret = -ENOSPC;
>>>> -               goto out;
>>>> +               return -ENOSPC;
>>>>           }
>>>>
>>>>           /*
>>>> -        * Searching for an available resource selector to use, starting at
>>>> -        * '2' since every implementation has at least 2 resource selector.
>>>> -        * ETMIDR4 gives the number of resource selector _pairs_,
>>>> -        * hence multiply by 2.
>>>> +        * Searching for an available resource selector to use, starting at '2'
>>>> +        * since resource 0 is the fixed 'always returns false' resource and 1
>>>> +        * is the fixed 'always returns true' resource. See IHI0064H_b '7.3.64
>>>> +        * TRCRSCTLRn, Resource Selection Control Registers, n=2-31'. If there
>>>> +        * are no resources, there would also be no counters so wouldn't get
>>>> +        * here.
>>>> +        *
>>>> +        * ETMIDR4 gives the number of resource selector _pairs_, hence multiply
>>>> +        * by 2.
>>>>            */
>>>>           for (rselector = 2; rselector < drvdata->nr_resource * 2; rselector++)
>>>>                   if (!config->res_ctrl[rselector])
>>>> @@ -680,13 +699,9 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>>>           if (rselector == drvdata->nr_resource * 2) {
>>>>                   pr_debug("%s: no available resource selector found\n",
>>>>                            __func__);
>>>> -               ret = -ENOSPC;
>>>> -               goto out;
>>>> +               return -ENOSPC;
>>>>           }
>>>>
>>>> -       /* Remember what counter we used */
>>>> -       counter = 1 << ctridx;
>>>> -
>>>>           /*
>>>>            * Initialise original and reload counter value to the smallest
>>>>            * possible value in order to get as much precision as we can.
>>>> @@ -694,26 +709,41 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>>>           config->cntr_val[ctridx] = 1;
>>>>           config->cntrldvr[ctridx] = 1;
>>>>
>>>> -       /* Set the trace counter control register */
>>>> -       val =  0x1 << 16        |  /* Bit 16, reload counter automatically */
>>>> -              0x0 << 7         |  /* Select single resource selector */
>>>> -              0x1;                /* Resource selector 1, i.e always true */
>>>> -
>>>> -       config->cntr_ctrl[ctridx] = val;
>>>> -
>>>> -       val = 0x2 << 16         | /* Group 0b0010 - Counter and sequencers */
>>>> -             counter << 0;       /* Counter to use */
>>>> -
>>>> -       config->res_ctrl[rselector] = val;
>>>> +       /*
>>>> +        * Trace Counter Control Register TRCCNTCTLRn
>>>> +        *
>>>> +        * CNTCHAIN = 0, don't reload on the previous counter
>>>> +        * RLDSELF = true, reload counter automatically on underflow
>>>> +        * RLDTYPE = 0, one reload input resource
>>>
>>> These field descriptions should match the terminology in the spec -
>>> and this is not field in this register as defined in the spec - nor
>>> are the following really. The event format is generic - so need a
>>> event select macro, which is then applied to any register that needs
>>> it
>>>
>>>> +        * RLDSEL = RES_SEL_FALSE (0), reload on false resource (never reload)
>>>> +        * CNTTYPE = 0, one count input resource
>>>
>>>
>>>> +        * CNTSEL = RES_SEL_TRUE (1), count fixed 'always true' resource (always decrement)
>>>> +        */
>>
>> Hmmm not sure where they came from. I think I got stuck trying to decide
>> on which format to use because the ETM spec and Arm ARM are slightly
>> different. I tried to settle on the Arm ARM (because this code is also
>> for ETE, it's newer, and there was existing code that matched its style)
>> but didn't copy that properly either. It should be:
>>
>> CNTCHAIN
>> RLDSELF
>> RLDEVENT_TYPE
>> RLDEVENT_SEL
>> CNTEVENT_TYPE
>> CNTEVENT_SEL
>>
>> Some are correct but some need updating.
>>
>>>> +       config->cntr_ctrl[ctridx] = TRCCNTCTLRn_RLDSELF |
>>>> +                                   FIELD_PREP(TRCCNTCTLRn_RLDSEL_MASK, ETM_RES_SEL_FALSE) |
>>>> +                                   FIELD_PREP(TRCCNTCTLRn_CNTSEL_MASK, ETM_RES_SEL_TRUE);
>>>>
>>>
>>> So if we define generic event generators:-
>>>
>>> #define ETM4_SEL_RS_PAIR BIT(7)
>>> #defiine ETM4_RS_SEL_EVENT_SINGLE(rs_sel_idx) (GENMASK(4:0) & rs_sel_idx)
>>> #define ETM4_RS_SEL_EVENT_PAIR(rs_sel_pair_idx) ((GENMASK(3:0) &
>>> rs_sel_pair_idx) | ETM4_SEL_RS_PAIR)
>>>
>>> these are then reuseable for all registers that need the 8 bit event
>>> selectors, beyond just this register.
>>>
>>> Thus we now accurately define the fields in the TRCCNTCTLRn
>>>
>>> #define TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)
>>>
>>> and use
>>>
>>> FIELD_PREP(TRCCNTCTLRn_RLDEVENT_MASK,
>>> ETM4_RS_SEL_EVENT_SINGLE(ETM_RES_SEL_FALSE))
>>>
>>> etc.
>>>
>>>
>>
>> I'm not sure I agree with that, the Arm ARM has CNTEVENT_TYPE as a
>> regular bit in the TRCCNTCTLRn register so it should be set like any
> 
> Given that this is the ETMv4 driver I was looking at the ETMv4
> specification that defines an 8-bit event field. This might have
> changed for ETE
> 
>> other. Hiding it as a subfield of "EVENT" when it always exists and
>> always does the same thing was maybe seen as a bad decision which is why
>> it was updated?
>>
> 
> I think it is more a side effect of generating documentation from
> computer readable register definitions - which in my view results in
> far poorer documentation from a human readable/comprehension
> perspective.

If that's wrong then it makes sense to get it fixed up in the Arm ARM 
first. And then once that's fixed we can update the driver. We're moving 
towards the sysreg-defs.h style, and even that can be auto generated 
with json so will give us the registers defined in this format.

I don't think the Arm ARM can ever be "wrong" because there's some other 
document that used to define something slightly differently.

> It is a common event format, and naming a bit that always appears and
> does the same thing with multiple different names is not more
> understandable.
> 
> 
>> Also IMO, beyond using labels instead of raw numbers, the code should
>> just show what's programmed into the register.
>> ETM4_RS_SEL_EVENT_SINGLE() would be one more macro to jump through to
>> see what's actually happening.
> 
> Except that if the macro is used consistently throughout the code, and
> you understand the event field format - then you only need to look it
> up once to understand what is happening everywhere it appears in the
> code.
> 
> Moreover, "TRCCNTCTLRn_RLDSEL_MASK GENMASK(12, 8)" is only actually
> valid if TRCCNTCTLRn_RLDTYPE is set to 0. If this bit is set to 1 then
> the correct mask is (11, 8) - you can have 0-31 single resources
> selected, but only 0-15 pairs.
> 

I'm wondering if this review is taking into context what the commit 
message says this change is doing. I'm trying to remove magic numbers 
from existing code in a single function, rather than re-write anything 
or make any new frameworks.

Of course we can always do more and start to validate and assert like 
Leo suggested, but that can be on top of this and is more of a 
functional change. I don't think it necessarily needs to block this 
change as it is now. Only the slightly off field names in the block 
comment make sense to update.

This has also been on the list for quite a while now and I'm starting to 
wonder if style changes at this stage are the most efficient way to go 
about tidying up.

> Regards
> 
> Mike

>>
>>>> -       val = 0x0 << 7          | /* Select single resource selector */
>>>> -             rselector;          /* Resource selector */
>>>> +       /*
>>>> +        * Resource Selection Control Register TRCRSCTLRn
>>>> +        *
>>>> +        * PAIRINV = 0, INV = 0, don't invert
>>>> +        * GROUP = 2, SELECT = ctridx, trigger when counter 'ctridx' reaches 0
>>>> +        *
>>>> +        * Multiple counters can be selected, and each bit signifies a counter,
>>>> +        * so set bit 'ctridx' to select our counter.
>>>> +        */
>>>> +       config->res_ctrl[rselector] = FIELD_PREP(TRCRSCTLRn_GROUP_MASK, 2) |
>>>> +                                     FIELD_PREP(TRCRSCTLRn_SELECT_MASK, 1 << ctridx);
>>>>
>>>> -       config->ts_ctrl = val;
>>>> +       /*
>>>> +        * Global Timestamp Control Register TRCTSCTLR
>>>> +        *
>>>> +        * TYPE = 0, one input resource
>>>> +        * SEL = rselector, generate timestamp on resource 'rselector'
>>>> +        */
>>>> +       config->ts_ctrl = FIELD_PREP(TRCTSCTLR_SEL_MASK, rselector);
>>>>
>>>
>>> FIELD_PREP(TRCTSCTLR_EVENT_MASK, ETM4_RS_SEL_EVENT_SINGLE(rselector))
>>>
>>>
>>>> -       ret = 0;
>>>> -out:
>>>> -       return ret;
>>>> +       return 0;
>>>>    }
>>>>
>>>>    static int etm4_parse_event_config(struct coresight_device *csdev,
>>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
>>>> index d178d79d9827..b319335e9bc3 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
>>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
>>>> @@ -225,6 +225,19 @@
>>>>    #define TRCRSCTLRn_GROUP_MASK                  GENMASK(19, 16)
>>>>    #define TRCRSCTLRn_SELECT_MASK                 GENMASK(15, 0)
>>>>
>>>> +#define TRCCNTCTLRn_CNTCHAIN                   BIT(17)
>>>> +#define TRCCNTCTLRn_RLDSELF                    BIT(16)
>>>> +#define TRCCNTCTLRn_RLDTYPE                    BIT(15)
>>>> +#define TRCCNTCTLRn_RLDSEL_MASK                        GENMASK(12, 8)
>>> per spec this should be
>>> TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)
>>>
>>>> +#define TRCCNTCTLRn_CNTTYPE_MASK               BIT(7)
>>>> +#define TRCCNTCTLRn_CNTSEL_MASK                        GENMASK(4, 0)
>>>
>>> per spec this should be
>>> TRCCNTCTLRn_CNTEVENT_MASK  GENMASK(7, 0)
>>>
>>>
>>>> +
>>>> +#define TRCTSCTLR_TYPE                         BIT(7)
>>>> +#define TRCTSCTLR_SEL_MASK                     GENMASK(4, 0)
>>>
>>> TRCTSCTLR_EVENT_MASK GENMASK(7:0)
>>>
>>>> +
>>>> +#define ETM_RES_SEL_FALSE 0 /* Fixed function 'always false' resource selector */
>>>> +#define ETM_RES_SEL_TRUE  1 /* Fixed function 'always true' resource selector */
>>>> +
>>>>    /*
>>>>     * System instructions to access ETM registers.
>>>>     * See ETMv4.4 spec ARM IHI0064F section 4.3.6 System instructions
>>>> @@ -824,7 +837,7 @@ struct etmv4_config {
>>>>           u32                             eventctrl0;
>>>>           u32                             eventctrl1;
>>>>           u32                             stall_ctrl;
>>>> -       u32                             ts_ctrl;
>>>> +       u32                             ts_ctrl; /* TRCTSCTLR */
>>>>           u32                             ccctlr;
>>>>           u32                             bb_ctrl;
>>>>           u32                             vinst_ctrl;
>>>> @@ -837,11 +850,11 @@ struct etmv4_config {
>>>>           u32                             seq_rst;
>>>>           u32                             seq_state;
>>>>           u8                              cntr_idx;
>>>> -       u32                             cntrldvr[ETMv4_MAX_CNTR];
>>>> -       u32                             cntr_ctrl[ETMv4_MAX_CNTR];
>>>> -       u32                             cntr_val[ETMv4_MAX_CNTR];
>>>> +       u32                             cntrldvr[ETMv4_MAX_CNTR]; /* TRCCNTRLDVRn */
>>>> +       u32                             cntr_ctrl[ETMv4_MAX_CNTR];  /* TRCCNTCTLRn */
>>>> +       u32                             cntr_val[ETMv4_MAX_CNTR]; /* TRCCNTVRn */
>>>>           u8                              res_idx;
>>>> -       u32                             res_ctrl[ETM_MAX_RES_SEL];
>>>> +       u32                             res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
>>>>           u8                              ss_idx;
>>>>           u32                             ss_ctrl[ETM_MAX_SS_CMP];
>>>>           u32                             ss_status[ETM_MAX_SS_CMP];
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>> Regards
>>>
>>> Mike
>>>
>>
> 
> 


