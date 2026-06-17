Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E15DCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 17:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbfT4p8yU7ZrJ4sRwz2av7CZIwruqT0NN3US4mW4m7I=; b=DUZJQNeSLycFIeWWju9bkX7Qrq
	Wr7PYygf/Nax28koymcTkRX1rlQeqz3J1GcEPCbBksa+GTCdwBkfFQCnRlFyokkuEi/s127W7/tfK
	r/x3CzctxW1iRtK5VCcw8DS3y1S8n7TQkCZHVGPqIZijaUZuHZtY4Qf8J2ytDNuIxs1/P7FD1vtbS
	UOA1TiYbtWUxNY8F/ggyGYKNHtCzlup1EcBbbRJHxxSSaNqHax5lcd81ZkhGxLVMuejaJcJmPdQlY
	dF1WuUxRaz2wUqRkn7qa59Svo3QWFGeYD9J4rGKoq0sUcUqhQvXHxGCw9PldLBNo6MggEyT4Dyekd
	Pxdzh98Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZuAt-000000007MN-1q9d;
	Wed, 17 Jun 2026 17:35:39 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZuAr-000000007M0-0wej
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 17:35:38 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4631679f204so455253f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 10:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781717735; x=1782322535; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZbfT4p8yU7ZrJ4sRwz2av7CZIwruqT0NN3US4mW4m7I=;
        b=SxINl6yQbmG80u1ype7E+NJKxqhL7jxHa05tzGn+vlOSwlwAf1Off/cezYhy5KgSu4
         lGD8A09WfsIx3ddpO1HX6HzcNQsAC8Es31Zo385/5ANbUpl6Od9KH303UJr1x8IwbEZq
         2c2Co1R1XjCwx8hnbrk9zua7MjvI47PNIfgvGZP7TtnwfTJ9KvXj0IilsH49JZoz3WLa
         M/y5IjNV4wbgf/Y17n8648Pxnahx49v6uK32wokb2xXDfotSDwfRulYcXbolFyrNETN0
         PgBEgY0M7QOXBUrh6rVCpho7NQ1DXx8venAkBtCJE7vLa+O/8luj/R5WbNpMPuvaaxWV
         gc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781717735; x=1782322535;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbfT4p8yU7ZrJ4sRwz2av7CZIwruqT0NN3US4mW4m7I=;
        b=e63nQR7VROHawmdXv09sEYmQUOqb5otKDH6ERL0En9inqkEeRpuHZKfT1gWVW4AlB7
         kkFlUX+XMlAK76kOo7aiU3wpoyNmuPL3x0X3iXV8SybpULXl1sb+sXH3VdL2T4VfdRpL
         /mFv1HBQEvXgXdMhFAr1Z6stDjZPNS/shWD/axv9KI6/xA+Q4USqGpN8t+nYFwrzg9Io
         AFjEAEv7zJ0kQqm6iLN/5Q/iQC8ccvh5geNDQBdNwVdsSOOEHsZqKD0Z5yXsvaVwTAmr
         RYpS5Rz8ykwrCZ/qOBS44/aN96YE9BOqSfBekJ5JrE167evB3j1NPflACth9jNObwbBw
         Lovw==
X-Gm-Message-State: AOJu0Yy/biNyEU7cMmFfFmx/Cr4Vv7ynNE6YucXi8ewUYKZBso9FUsu9
	U42O9b3E9oNWHz0AdcILSQEjXVw/jy2Fc2g9FWPd99XjRVvcDHkET0mixx7VAVoAsvY=
X-Gm-Gg: Acq92OFpZ9XmViO2F1oRkIbIYghuM4BXsZTUUBUSvoBmsn1nsA4b6NFV1Ycun9NsR7O
	jUdQHObAQzeEcaoDTppBqvHtjsMEURqcU/6BeF0gdHeWO0OxGv4GX4RYkx0eVpC3kV+t6xtlTu9
	rXiFh+fc7WH+wBuv88DDALgEaDGJv6+TkFCXan4PQ5MmZ72xs3jl+iw2f0t4kjat0y/4OtgaBN4
	jJam6T8Dm9ivLZZ44ezzALcCnHDTCFJzHP5OAAbggRHjdt/K2FjdkQzrTzw8eVwGmb8omhmjMnd
	jTmnd/k+eft7fUg/c+p+TtgLY/OvJlxS6QjS0+aobzPubyzdfBweBII0oSdwBQswOwJ0WGuizQ8
	TgUA+Fbz/JEAgCXUGKCxvR7j5U8VWLGBX/iS6jX3/gyE/pRZdtR/g1UwTQSAmX34cUoIzJU9XWv
	bMx5CIsTtm1iz+Qk3BKw==
X-Received: by 2002:a05:600c:6089:b0:490:5000:917 with SMTP id 5b1f17b1804b1-4923815425fmr6793785e9.1.1781717735275;
        Wed, 17 Jun 2026 10:35:35 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923687d2casm30255415e9.0.2026.06.17.10.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 10:35:34 -0700 (PDT)
Message-ID: <41a05d00-a870-490e-beed-5c4eff46db38@linaro.org>
Date: Wed, 17 Jun 2026 18:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 9/9] perf test: Add Arm CoreSight callchain test
To: Leo Yan <leo.yan@arm.com>
References: <20260616-b4-arm_cs_callchain_support_v1-v9-0-f8fad931c413@arm.com>
 <20260616-b4-arm_cs_callchain_support_v1-v9-9-f8fad931c413@arm.com>
 <6855d77f-d2f4-4dab-8481-a8c586e4872b@linaro.org>
 <20260617123322.GD31870@e132581.arm.com>
 <20260617150828.GE31870@e132581.arm.com>
Content-Language: en-US
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo
 <acme@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Paschalis Mpeis <paschalis.mpeis@arm.com>, Amir Ayupov <aaupov@fb.com>
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260617150828.GE31870@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_103537_301862_5792B541 
X-CRM114-Status: GOOD (  19.98  )
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



On 17/06/2026 4:08 pm, Leo Yan wrote:
> On Wed, Jun 17, 2026 at 01:33:22PM +0100, Coresight ML wrote:
>> On Wed, Jun 17, 2026 at 11:03:07AM +0100, James Clark wrote:
>>
>> [...]
>>
>>>> +	# It is safe to use 'i3i' with a three-instruction interval, since the
>>>> +	# workload is compiled with -O0.
>>>> +	perf script --itrace=g16i3il64 -i "$data" > "$script"
>>>
>>> Is there a reason we don't generate callstacks on branch samples and use
>>> --itrace=g16bl64? That removes the magic number 3 and reduces the output
>>> file size and test runtime a bit.
>>
>> I checked Intel-PT which does not generate callchain and branch stack for
>> branch samples. I just keep cs-etm aligned.
>>
>> I can add callstack / branch stack for branch samples.
> 
> Tried a bit for this.
> 
> The branch stack is skipped due the check:
> 
>    if (is_bts_event(attr)) {
>            perf_sample__fprintf_bts(sample, evsel, thread, al, addr_al, machine, fp);
>            return;
>    }
> 
> For the callstack attached to branch samples, the output seems not
> directive:
> 
>    callchain_test    4372 [003] 75596.459422:          1 branches:
>              aaaaabdb0794 print+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>              aaaaabdb0798 print+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>              aaaaabdb07b0 foo+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>              aaaaabdb07c8 main+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>              ffff9a10225c __libc_start_call_main+0x7c (/usr/lib/aarch64-linux-gnu/libc.so.6)
>              ffff9a10233c call_init+0x9c (inlined)
>              ffff9a10233c __libc_start_main_impl+0x9c (inlined)
>              aaaaabdb0670 _start+0x30 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>              ffff9a2206a0 __libc_early_init+0x100 (/usr/lib/aarch64-linux-gnu/libc.so.6)
>   =>     aaaaabdb0768 do_svc+0x0 (/home/kernel/leoy/test_cs_callchain/callchain_test)
> 
> It is hard to digest the log as it separates branch from address
> (aaaaabdb0794 print+0x8) and to address (aaaaabdb0768 do_svc+0x0),
> and put the callchain in the middle of from and to ranges.
> 
> Given this is not enabled by other hardware trace (e.g., Intel-PT),
> and we need to change the common code to make it better, I'd first
> enable callchain/branch stack for instruction samples. Let's see if
> further requirement after get this done.
> 
> Thanks,
> Leo

Yep that sounds ok to me

