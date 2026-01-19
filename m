Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC94CCF2F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXiM1Ldm8EEc6/BLfYACbiNHnSMaV8xvZKNGfWydJ6Y=; b=FND4iwXCm/vLiJQgMHyNTaVmXd
	AvGzUt2V8/P9QRWBvF3c6bxRactIM22GULbU71pyCmqr03Ydl84wzLyeGwldH/3zvuk0LTOJ4sT5R
	slyeYMzY74Rf0tBGTcEH3a2XJFBecsZc8bzhKHJDKUvw6D3c2oUMTY/pKknuci9vvYO6/nAIxSMND
	6RWf6/I0V5X0obidWs3PwTABcRYRSPk/bVZmI3wXqoRJbYzPmaoq3bVzCM+jeKxqprbF/sSfBbpAk
	m+3fkFpftueO1N0EyaTkqzl3qPNzhhpPnCi96Sk1SHWobq4Em6q84Ak5BjbreUDLZ5cZDKJB6QsxY
	xAuegjkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnrY-00000001vlO-2Tmi;
	Mon, 19 Jan 2026 11:56:04 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnrR-00000001vkB-1ePT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:56:03 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso8392592a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 03:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768823755; x=1769428555; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AXiM1Ldm8EEc6/BLfYACbiNHnSMaV8xvZKNGfWydJ6Y=;
        b=itG8IgvoLixtj95HsD3QSHAat+t1Ex55kzSI1P2qM/ZqZGHeu1iR+oROSZInVOWZv/
         MYlReMZrmJm0hGdoBcgVXGBoSd+9T/ZKMpABn6tnOhzcXnewBwhN+e6FcaUaVdE5PpaW
         Omd7h6Kzf2D276+i5tCDQxr6Bhv+7MLx90EiY9E7hs0Sr9JTQdqsufmVjSUerdTx4CRO
         HvG+7zzzzmNZULM2AXXyzOvUNSMkPgrvjiUw8bv9P+A96VJSez8Z1sriWmE9+MdiuNEd
         f4hxAd8TQI9rzVqplOaoXxcHgiPRMBp5zfQJk5+OIH9zHMIP6PyNxS52FV9ycw3n/WMy
         5qDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768823755; x=1769428555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXiM1Ldm8EEc6/BLfYACbiNHnSMaV8xvZKNGfWydJ6Y=;
        b=n3pTRKoZR1ecADotjjf5OYcV1KAQMAt+T01tb13yyLV2D7by2gvtEHXx04/gsaOmpn
         0/iwL/zv3vr/4v3rG15j/XMR/N+n3dXHAxx7tPtbKYzNMWUdGERfxa8gc5D1dvGFRqi+
         9dm8t5cwcLRc+8m6kRIm/y8nwiKMeo1sdLbqUwTqRfiMCX440HJWCgmDGDwfDADFYGkM
         MFEVgKMIoQN8Q1QaBsy46Cc6DN4qKWwC/p9PqVtsEvtnIiX3YjEnA8RQ6NEnUzRmU+Gd
         mGYMt5LXzjfEXIiNAnM56OmwDJad2PsFj6hHNMaaPgm8oLnsm2umH6ylJMjGTCwU3IA8
         YWwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+SH3Zr6DD+pAqVCqcwLzJzkSI8MoLNjNjU79dlBwuF7MXFndio2qtlZ8Hh/xps9Sx/5B26S3wbjCJegdWVe1z@lists.infradead.org
X-Gm-Message-State: AOJu0YwazhvJpttl1KMEINkbMM0uG9tZWHTruFof2PZdywPIa9IPpVwy
	IrxqgUDmgDN30ipuF0THFS23A3qtXw6yla3HJbxHAww+iyJIl4td7JmGunPn6kMc/D8=
X-Gm-Gg: AY/fxX4yWetXuBBiFl8myQ3q0P9M/7us6zNAPvqs+in19Gy6s8BJ2Lgb49pn1OL5LBf
	37ImpvMSCmVXN2f73pDGyEFawYardvbOAGkmODS3MIjL93fac94IeaBRsrwEPzTviadVEHbOtFn
	SBYAAgm7JpY51iWsu/iKDIkSP8okhGYKYhxYhHAEjMGrC7+8EDCZWViIBA/XM8l+Tppxv4GV1xH
	7IC5vTKfD0XlWPaifwWIIb9QEGw/N5RP4gZ+oBURv1uKiTa6nGjlDD6I3aPZpIWQWLMjTeBEZcn
	75sz2zcYMY9NlnWor6d81bOu7ROZ65/9PLbsRblgQ4o4vU3Ly5QbWRaoSdmLDRNX5AkHjgttefh
	VODnbAaodcMcFIoRpcCqz561L3esdvpovf6vHUs8l1yeMrynTENECJb5kb0UHe5o73JQNsb3gcC
	Th1q6kGmg5vnjoJ0dxB1zYSbog/8w=
X-Received: by 2002:a05:6402:13c8:b0:649:6a2e:9bbb with SMTP id 4fb4d7f45d1cf-654524cf1bemr8705520a12.2.1768823755134;
        Mon, 19 Jan 2026 03:55:55 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8c82sm10269125a12.29.2026.01.19.03.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 03:55:54 -0800 (PST)
Message-ID: <3b06ea25-2516-406c-8b78-c359d3fb2aa6@linaro.org>
Date: Mon, 19 Jan 2026 11:55:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] perf cs-etm: Fix decoding for sparse CPU maps
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thomas Falcon <thomas.falcon@intel.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260119-james-perf-coresight-cpu-map-segfault-v2-0-56b956a629ee@linaro.org>
 <20260119-james-perf-coresight-cpu-map-segfault-v2-1-56b956a629ee@linaro.org>
 <20260119111509.GD1286628@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260119111509.GD1286628@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_035600_734376_F5546CBD 
X-CRM114-Status: GOOD (  29.79  )
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



On 19/01/2026 11:15 am, Leo Yan wrote:
> On Mon, Jan 19, 2026 at 10:18:35AM +0000, Coresight ML wrote:
>> The ETM decoder incorrectly assumed that auxtrace queue indices were
>> equivalent to CPU number. This assumption is used for inserting records
>> into the queue, and for fetching queues when given a CPU number. This
>> assumption held when Perf always opened a dummy event on every CPU, even
>> if the user provided a subset of CPUs on the commandline, resulting in
>> the indices aligning.
>>
>> For example:
>>
>>    # event : name = cs_etm//u, , id = { 2451, 2452 }, type = 11 (cs_etm), size = 136, config = 0x4010, { sample_period, samp>
>>    # event : name = dummy:u, , id = { 2453, 2454, 2455, 2456 }, type = 1 (PERF_TYPE_SOFTWARE), size = 136, config = 0x9 (PER>
>>
>>    0 0 0x200 [0xd0]: PERF_RECORD_ID_INDEX nr: 6
>>    ... id: 2451  idx: 2  cpu: 2  tid: -1
>>    ... id: 2452  idx: 3  cpu: 3  tid: -1
>>    ... id: 2453  idx: 0  cpu: 0  tid: -1
>>    ... id: 2454  idx: 1  cpu: 1  tid: -1
>>    ... id: 2455  idx: 2  cpu: 2  tid: -1
>>    ... id: 2456  idx: 3  cpu: 3  tid: -1
>>
>> Since commit 811082e4b668 ("perf parse-events: Support user CPUs mixed
>> with threads/processes") the dummy event no longer behaves in this way,
>> making the ETM event indices start from 0 on the first CPU recorded
>> regardless of its ID:
>>
>>    # event : name = cs_etm//u, , id = { 771, 772 }, type = 11 (cs_etm), size = 144, config = 0x4010, { sample_period, sample>
>>    # event : name = dummy:u, , id = { 773, 774 }, type = 1 (PERF_TYPE_SOFTWARE), size = 144, config = 0x9 (PERF_COUNT_SW_DUM>
>>
>>    0 0 0x200 [0x90]: PERF_RECORD_ID_INDEX nr: 4
>>    ... id: 771  idx: 0  cpu: 2  tid: -1
>>    ... id: 772  idx: 1  cpu: 3  tid: -1
>>    ... id: 773  idx: 0  cpu: 2  tid: -1
>>    ... id: 774  idx: 1  cpu: 3  tid: -1
> 
> Seems to me that this patch works around the issue by using the CPU ID
> instead, but event->auxtrace.idx is broken.
> 
> Should we store the correct index in event->auxtrace.idx (e.g., in the
> __perf_event__synthesize_id_index()) ?
> 
> Thanks,
> Leo
> 

I don't think it's a workaround, I think it should have been written 
this way in the first place.

Idx is just what it says it is, it's the position in the array. If there 
are only two events then they are idx 0 and 1, but CPU can be anything. 
If ETM didn't open a dummy event at the same time then I think it always 
would have behaved like that.

>> This causes the following segfault when decoding:
>>
>>    $ perf record -e cs_etm//u -C 2,3 -- true
>>    $ perf report
>>
>>    perf: Segmentation fault
>>    -------- backtrace --------
>>    #0 0xaaaabf9fd020 in ui__signal_backtrace setup.c:110
>>    #1 0xffffab5c7930 in __kernel_rt_sigreturn [vdso][930]
>>    #2 0xaaaabfb68d30 in cs_etm_decoder__reset cs-etm-decoder.c:85
>>    #3 0xaaaabfb65930 in cs_etm__get_data_block cs-etm.c:2032
>>    #4 0xaaaabfb666fc in cs_etm__run_per_cpu_timeless_decoder cs-etm.c:2551
>>    #5 0xaaaabfb6692c in (cs_etm__process_timeless_queues cs-etm.c:2612
>>    #6 0xaaaabfb63390 in cs_etm__flush_events cs-etm.c:921
>>    #7 0xaaaabfb324c0 in auxtrace__flush_events auxtrace.c:2915
>>    #8 0xaaaabfaac378 in __perf_session__process_events session.c:2285
>>    #9 0xaaaabfaacc9c in perf_session__process_events session.c:2442
>>    #10 0xaaaabf8d3d90 in __cmd_report builtin-report.c:1085
>>    #11 0xaaaabf8d6944 in cmd_report builtin-report.c:1866
>>    #12 0xaaaabf95ebfc in run_builtin perf.c:351
>>    #13 0xaaaabf95eeb0 in handle_internal_command perf.c:404
>>    #14 0xaaaabf95f068 in run_argv perf.c:451
>>    #15 0xaaaabf95f390 in main perf.c:558
>>    #16 0xffffaab97400 in __libc_start_call_main libc_start_call_main.h:74
>>    #17 0xffffaab974d8 in __libc_start_main@@GLIBC_2.34 libc-start.c:128
>>    #18 0xaaaabf8aa8f0 in _start perf[7a8f0]
>>
>> Fix it by inserting into the queues based on CPU number, rather than
>> using the index.
>>
>> Fixes: 811082e4b668 ("perf parse-events: Support user CPUs mixed with threads/processes")
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   tools/perf/util/cs-etm.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
>> index 25d56e0f1c07..12b55c2bc2ca 100644
>> --- a/tools/perf/util/cs-etm.c
>> +++ b/tools/perf/util/cs-etm.c
>> @@ -3086,7 +3086,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
>>   
>>   	if (aux_offset >= auxtrace_event->offset &&
>>   	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
>> -		struct cs_etm_queue *etmq = etm->queues.queue_array[auxtrace_event->idx].priv;
>> +		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, auxtrace_event->cpu);
>>   
>>   		/*
>>   		 * If this AUX event was inside this buffer somewhere, create a new auxtrace event
>> @@ -3095,6 +3095,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
>>   		auxtrace_fragment.auxtrace = *auxtrace_event;
>>   		auxtrace_fragment.auxtrace.size = aux_size;
>>   		auxtrace_fragment.auxtrace.offset = aux_offset;
>> +		auxtrace_fragment.auxtrace.idx = etmq->queue_nr;
>>   		file_offset += aux_offset - auxtrace_event->offset + auxtrace_event->header.size;
>>   
>>   		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64
>>
>> -- 
>> 2.34.1
>>
>> _______________________________________________
>> CoreSight mailing list -- coresight@lists.linaro.org
>> To unsubscribe send an email to coresight-leave@lists.linaro.org


