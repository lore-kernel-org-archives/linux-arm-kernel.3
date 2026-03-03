Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C7AEC1423
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 10:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnBOzFJcfXoWhFGXXIv8+0FYSpLPtwiqAebZRn6kZlI=; b=a+uoTn2NpdToGzgUqDdIJQykNB
	f9q6Jzyz5MvAQWTU1GFp9gjs9ko4WPjFuGY3Na0IeyXO1gHWLrMFQwT8uNhm7tJgQtrHwvxofTrUN
	mdXAnL5THQug2IH3b+j7NI0G2jQtNmCLavDZL25c6M7MUChmfvy/8hGMfyZfWAuhhE2GXE5FwuEaB
	0F7K90w9F/5vwCRUN5qvpDCXcXiGZB0k0E7CquEoW/lr52QHw8OQcHIgFhNqCKTnjOfMRwVnQkVVC
	0lK1yyW/yJzLyp30OhDYGMqYXIDBLJzO0QVIyZj29nNovoAOUJ+5J8ZDkRe01NWbIO5eylMbm8Z15
	6opZLg9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxN93-0000000Eyzp-2oS5;
	Tue, 03 Mar 2026 10:38:29 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxN92-0000000EyzT-0FTm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 10:38:29 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-437711e9195so4259392f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 02:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772534306; x=1773139106; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rnBOzFJcfXoWhFGXXIv8+0FYSpLPtwiqAebZRn6kZlI=;
        b=zNnhpL4fzbnj6XbMOtenpuP6ztaePCYaX6btryE/7pD6x/huIC7bka8BgM4DSycuAO
         CkKAeYwbiZo6pIYeDTMQMCclnEcDUhZD3mbilcIdHpSps3b1irlxQyL1eD9hh48/krgR
         bzzVIwxfIEUpUUUks9+pILL+6uDCrruy34HcEcrAKFBPpu2dCz0huswemlRM92INGs8q
         dZuo2jDyZwk93r6ZCPUWi6NW3j+YR0Cj8k/rSSzEHZ3Lg0psNGAymAAVLATqiCBWmHpJ
         KdxtVU3IEsNmCYTYwSp6vPYqj/0/9iwdJxPVaGl+4FuscUWmFZbQT5zw5xUEu+wi7TUd
         iiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772534306; x=1773139106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rnBOzFJcfXoWhFGXXIv8+0FYSpLPtwiqAebZRn6kZlI=;
        b=BuS5kGXQC/CaCQ7t5Tv5hiFgd8Fai/6IFykHHu8DcFwfnvOYkkr9O8zFAxbLiMA3xI
         TE6kNbXA3naeCNweLwjLM6MfcvsBJznLhIVx96MpgAf5k4mzUmLdCgPKLB8aTVBDrtDR
         xLqDCDsjq9Cw/4D9cBcwK7iO8/Y/Bpvr8V5/N8/FoF2/1GZt7s7aTbkMZAE1sUOEPsCT
         Esv3+7/jioPPIevd9W2L03ywUHUwScRB04FRfpTqpEp9EumfWt6UJ9eoqx8vejFDrHVd
         jsxuB5l9DtohSRvyDfIbf0Is4BFhp92zMNOtxYdJ+jKffcSX2nI8wKmuO3MXHPA0YUNH
         bz9w==
X-Forwarded-Encrypted: i=1; AJvYcCW5J/ESYDkykHJljbaoqMTepMNCB+fkRGYoQIc6NHhIjgP69Ca/2TIdGIK0HBbHQ/vv150HjO+JSp52XuxMJpGv@lists.infradead.org
X-Gm-Message-State: AOJu0YzD0NrpfVE2PzrqgW68invfdAb+BB+XAJIb+muNCe2Fj2vp5Pyk
	bbT6EoWVnz5FaFutyD1Sz4ktislobe2xfkM8PIadDpL1dvenJzRyg5S9fpANYEQmNjtyK9678+u
	BMuqSDOw=
X-Gm-Gg: ATEYQzxRUtKAFxXTVDRQRGYnyjUNiBoYGDNDDXaS03BR2MK7jDZPMdfEoKWxPJd2NO1
	RpTQ9FAvhQs1hZeCVSM2sWsHq4L0xO8CKWDhWjwFO41o+rxK/2uMd8R/cI0LKV4Kt9pPBM3QSqV
	ZSj6MrJKlyS6uWzADqvzZOFF6V/Yqhq2QB10rGJ+el22wbT2k3BTbmmF6LbYCNAAnF0hwhjbtZK
	4QpGC3L/GFxU/TQqHYvX0gKaxrilMp2dJ6+0afCaVkgcg9NHfh34I9YhPchQiEf2sdx3OrcGLeH
	0GtmV4ATdoafBmj4FLv8UEWslhtQD/xnkgzW1X/y0TczJcL28Ks++lGmWqHk251QUoaNgYwlvC9
	Ysgv9O0MjfS3teSvctjxGhVrlBZbh4TIl+F9HDxB8NCmwAAgRCHZO6Cfek5Kl++Z7j7DHbDIZ4v
	7gFQtMP5rMdiISPrvdiTO6FF667Y5v8P3PSKdlwf8=
X-Received: by 2002:a05:6000:2c10:b0:439:b744:c5fa with SMTP id ffacd0b85a97d-439b744c836mr12755157f8f.30.1772534305718;
        Tue, 03 Mar 2026 02:38:25 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm33905284f8f.7.2026.03.03.02.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:38:25 -0800 (PST)
Message-ID: <197f3d1e-5d1e-4b2d-a12b-782287eecc43@linaro.org>
Date: Tue, 3 Mar 2026 10:38:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] perf arm64: Send pointer auth masks to ring buffer
To: Jakub Brnak <jbrnak@redhat.com>, James Clark <james.clark@arm.com>,
 Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, acme@kernel.org, Andrew Kilroy <andrew.kilroy@arm.com>,
 Vince Weaver <vincent.weaver@maine.edu>, Mark Rutland
 <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 kristina.martsenko@arm.com
References: <20221020101921.1219533-1-james.clark@arm.com>
 <20221020101921.1219533-2-james.clark@arm.com>
 <Y1F8DUWaWhlh/phL@hirez.programming.kicks-ass.net>
 <4e50b890-0588-1551-fb7c-6cd8191d1054@arm.com>
 <Y1q914IVy6XgE1xq@hirez.programming.kicks-ass.net>
 <133c2f4b-1ca5-2d0c-f4f4-e01ff5e028c8@arm.com>
 <aaW7s-ISz1QGpmqB@jbrnak-thinkpadx1carbongen9.tpbc.csb>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aaW7s-ISz1QGpmqB@jbrnak-thinkpadx1carbongen9.tpbc.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_023828_141413_6D5341BE 
X-CRM114-Status: GOOD (  27.67  )
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



On 02/03/2026 4:33 pm, Jakub Brnak wrote:
> On Mon, Oct 31, 2022 at 01:48:56PM +0000, James Clark wrote:
>>
>>
>> On 27/10/2022 18:20, Peter Zijlstra wrote:
>>> On Tue, Oct 25, 2022 at 04:28:12PM +0100, James Clark wrote:
>>>
>>>>> Why do we want the same mask repeated over and over with each sample;
>>>>> should this not be part of the address space (side-band) data?
>>>>
>>>> You are probably right that it could be done that way. The reason that
>>>> we did it this way was to be consistent with ptrace feature [1] where it
>>>> is delivered to userspace on a per-process basis. And there is also a
>>>> prctl for the enabled key types [2] which can be changed dynamically.
>>>> Particularly for the last reason is why it was done per sample.
>>>>
>>>> Having said that, the enabled keys field is not used by perf, only the
>>>> mask is used, so I can drop the per sample data until enabled keys is
>>>> needed, which may be never.
>>>>
>>>> I'm going to assume that perf shouldn't use ptrace because of
>>>> permissions and conflicts with debuggers, so I could put the mask
>>>> somewhere like PERF_RECORD_FORK instead of per sample.
>>>
>>> Yeah, or create an new RECORD type which you can also send around at
>>> prctl() time.
>>>
>>> The only thing that's needed on top of that is exposing the mask
>>> somewhere in /proc for existing tasks; which is what perf also uses to
>>> syntesize RECORD_MMAP events on startup etc..
>>>
>>
>> Hmm ok, in that case I can just add the /proc interface for now because
>> the mask won't change and we can add the new record type at the point
>> it's needed in the future.
>>
>> Thanks for the feedback.
> 
> Hi all,
> 
> Does anyone know how this issue was eventually resolved?
> Specifically, is the mask for the pointer authentication bits
> currently exposed and stored somewhere in perf.data so it can be
> used when running perf report?
> 
> Thanks,
> Jakub
> 
> 

Hi Jakub,

No we never finished this, you're actually the first person to mention 
it. Can you give a bit more detail about your use case? Maybe we can dig 
out the old branches and work on it again.

For a summary of the current status, frame pointer unwinds in the kernel 
are working with pointer auth because the kernel strips them.

We patched libunwind for support on commit f67ef2867bc5 ("Unwind with 
pointer authentication on arm64"). And libdw on commit 0af6c7289c22 
(libdwfl, aarch64: Demangle return addresses using a PAC mask). These 
two were to support dwarf unwinding, but the kernel changes to expose 
the mask and Perf changes to pass it to the unwinders were never finished.

Thanks
James


