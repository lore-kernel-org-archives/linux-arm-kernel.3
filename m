Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828D3C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 10:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2P8F2GGLfkUFwRkVZ5dm2/U96V9+4Rkx3rPGsZzhfo=; b=JbW6DahEw7QvNkWi1e2UdB019S
	t93RXlv3wFXIfzPCZ+vS5IK0b26xjWhcZE6oNbXuyQw8zQWzTn9IL1QEX51IGnhsfapKTXisbrzFt
	BMLm8u9R2l9OwXkOrUtNhcRGqq3i0xVRhUIJMG9dkyr4bJl9JCLo5uukPNtxl1GagCtoMmifOa7FH
	VHj5Xw+47kghvT6EkBdvQqu/7SVrHvry/fyBOPRxuBCMNmNOc3bBekXjzIyd/AkAGfL+1XbsPXbey
	Wr0LgQNmvD6O6h1IMYw3vHkSR9vT+7dW5uonZoEBNkjgOXrt5djDovghSFndRWnmMsQtPEM8MCeO5
	b6f38dBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trxEj-00000005OKZ-1mTF;
	Tue, 11 Mar 2025 10:53:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trxD4-00000005O7w-3mMk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 10:51:44 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso2538486f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741690301; x=1742295101; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R2P8F2GGLfkUFwRkVZ5dm2/U96V9+4Rkx3rPGsZzhfo=;
        b=Hz7Qfq1OsxgGH+9LRUnjzEii+wYQdkIUaXncU2XHB/WyQukXy6EDe6zWPMLjN8/wgN
         YHFx6g7VXey33ZjrnwktXt2bYTkI/7Df43cQWRjX8TG77uwadE3Rjq6mDDuvJ6ZpJlfi
         IuKo0X83SOf20+ixarxtSmf1FWBISdf9mp6uQGDwCoorHEapRs78G8BDzcCRwRglgPHO
         zH0+YFlLb+DllatzbIF4XbzH/X3/PITIT7LP9EJ3KrYWU1KCImlTXYq1CWZiA9Y6Wcc4
         pdHwpJoDGNcg8smDs9/lR0vEL1+5+l3UIJsqO6LlW9/v7IVc9Gu8erhsgx4ae7/YFASt
         FY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741690301; x=1742295101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R2P8F2GGLfkUFwRkVZ5dm2/U96V9+4Rkx3rPGsZzhfo=;
        b=TDK3v5Wgao5MSJpU2aPlwlKKsmPF6yU/s6CWlqI/uzPjIkFbBtppHQFJC9ek5wqNm4
         3m2Q/TCAYV/GuQnJCqEptDedkGe//wVxlcaxit+9AHhPIqcV8Z2SgpTDdhBHzj0R8xZb
         TMRQ//P9Dw2jpFtVjRswwYHW95eQ3lS1CKfvX6wPQEXl5boou88NI9y+y0Ny2/MkgLnj
         hNA4dv9hyJEvxliRiWTapd/l/udhM0fNN9kFT+h4WseeV7JgAGRLRavbGgr4ndB1lX1s
         ueY74cR6+56AGeyD4Fs3+NC7XbghwHysTKpo96aPd+DuNmL+UJj6AX0TwpTp7fYsi1fw
         oEhA==
X-Forwarded-Encrypted: i=1; AJvYcCWadYa5d/CyQC4S7XshdBDrLk2Wfu0qsvt8ChAFgDqA+fpiddTgBmdVTscLGZicifwiKEYT7TrmWEYLXazm3v87@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlf1rESTaBRWBufBqCXHw9pksh5TyNNvoC2jAR6qAhiAK4bl37
	h78ZCzhGRHgHiV9+TA8SZsfybksiaH9oIbhKMSUbakompsE1kEnNvOpHPhsf3h8=
X-Gm-Gg: ASbGnctOX7CuNO4wz+x/YhOODgw2HAzQp9DF0foTGhN3DhbAKuNVNYBQHnzYSazrQXI
	ro5UWsgNVmvbVAtJXBL9M6l/4zv99DktZlELWKihbT4oWieHD2ABv7MLW/hNI1AcUHuJU3KslbG
	4Q+YpMKOwzRE2e4Rb7mgRS+597Vu68CeCRDCHgLGE8gArg4dVaylrGSMGaQvcgBn+Uucp9U4b0b
	kVldUb5gvYIKt5zLbXfKugHqFn9EkHd7gchak9Ewmgr8Y6YVdOSNXX85xDE48nQZjv5F/srGtiW
	sUavNKtPSsAcVW2RGTzKjOun0BPOZj8QnBbhzeSXe0FSLrb/Iij0
X-Google-Smtp-Source: AGHT+IEJJPzNgLfcptl57EHHb0UnEGh9dFS0tVqdsWVTsz37qYMFtHuocJnwj7Ln7c4mEz9FzGnpLQ==
X-Received: by 2002:a5d:47c1:0:b0:390:f6aa:4e77 with SMTP id ffacd0b85a97d-39132d3a8f5mr14219936f8f.15.1741690301180;
        Tue, 11 Mar 2025 03:51:41 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.65.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfde7sm18093077f8f.32.2025.03.11.03.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 03:51:40 -0700 (PDT)
Message-ID: <898f1265-522f-44aa-a7da-879870b18807@linaro.org>
Date: Tue, 11 Mar 2025 10:51:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: docs: Remove target sink from examples
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, yeoreum.yun@arm.com,
 Mike Leach <mike.leach@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Leo Yan <leo.yan@linux.dev>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241210144933.295798-1-james.clark@linaro.org>
 <20250311102200.GJ9682@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250311102200.GJ9682@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_035142_949167_185C2C49 
X-CRM114-Status: GOOD (  32.31  )
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



On 11/03/2025 10:22 am, Leo Yan wrote:
> On Tue, Dec 10, 2024 at 02:49:28PM +0000, James Clark wrote:
>>
>> Previously the sink had to be specified, but now it auto selects one by
>> default. Including a sink in the examples causes issues when copy
>> pasting the command because it might not work if that sink isn't
>> present. Remove the sink from all the basic examples and create a new
>> section specifically about overriding the default one.
>>
>> Make the text a but more concise now that it's in the advanced section,
>> and similarly for removing the old kernel advice.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   Documentation/trace/coresight/coresight.rst   | 41 ++++++++-----------
>>   .../userspace-api/perf_ring_buffer.rst        |  4 +-
>>   2 files changed, 18 insertions(+), 27 deletions(-)
>>
>> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
>> index d4f93d6a2d63..806699871b80 100644
>> --- a/Documentation/trace/coresight/coresight.rst
>> +++ b/Documentation/trace/coresight/coresight.rst
>> @@ -462,44 +462,35 @@ queried by the perf command line tool:
>>
>>                  cs_etm//                                    [Kernel PMU event]
>>
>> -       linaro@linaro-nano:~$
>> -
>>   Regardless of the number of tracers available in a system (usually equal to the
>>   amount of processor cores), the "cs_etm" PMU will be listed only once.
>>
>>   A Coresight PMU works the same way as any other PMU, i.e the name of the PMU is
>> -listed along with configuration options within forward slashes '/'.  Since a
>> -Coresight system will typically have more than one sink, the name of the sink to
>> -work with needs to be specified as an event option.
>> -On newer kernels the available sinks are listed in sysFS under
>> +provided along with configuration options within forward slashes '/' (see
>> +`Config option formats`_).
>> +
>> +Advanced Perf framework usage
>> +-----------------------------
>> +
>> +Sink selection
>> +~~~~~~~~~~~~~~
>> +
>> +An appropriate sink will be selected automatically for use with Perf, but since
>> +there will typically be more than one sink, the name of the sink to use may be
>> +specified as a special config option prefixed with '@'.
>> +
>> +The available sinks are listed in sysFS under
>>   ($SYSFS)/bus/event_source/devices/cs_etm/sinks/::
>>
>>          root@localhost:/sys/bus/event_source/devices/cs_etm/sinks# ls
>>          tmc_etf0  tmc_etr0  tpiu0
> 
> Just a minor comment.  To reflect the latest hardware, it is good to
> mention the TRBE case, users should not and cannot specify TRBE as the

Is that strictly true? From looking at the code I think you could pick 
one TRBE sink as long as you are only tracing from a single ETM. 
Although yeah it would be pointless.

> sink name.  The driver will give priority for TRBE by default unless
> users specify other sink types.
> 

IMO mentioning TRBE would be overly wordy and not really add anything. 
Removing the sink from all the base examples is exactly to make TRBE 
work without going into detail about why. And the advanced section 
doesn't mention TRBE because manually picking it is never right.

> Otherwise, this is a good polish for me.
> 
> Thanks,
> Leo
> 
>> -On older kernels, this may need to be found from the list of coresight devices,
>> -available under ($SYSFS)/bus/coresight/devices/::
>> -
>> -       root:~# ls /sys/bus/coresight/devices/
>> -        etm0     etm1     etm2         etm3  etm4      etm5      funnel0
>> -        funnel1  funnel2  replicator0  stm0  tmc_etf0  tmc_etr0  tpiu0
>>          root@linaro-nano:~# perf record -e cs_etm/@tmc_etr0/u --per-thread program
>>
>> -As mentioned above in section "Device Naming scheme", the names of the devices could
>> -look different from what is used in the example above. One must use the device names
>> -as it appears under the sysFS.
>> -
>> -The syntax within the forward slashes '/' is important.  The '@' character
>> -tells the parser that a sink is about to be specified and that this is the sink
>> -to use for the trace session.
>> -
>>   More information on the above and other example on how to use Coresight with
>>   the perf tools can be found in the "HOWTO.md" file of the openCSD gitHub
>>   repository [#third]_.
>>
>> -Advanced perf framework usage
>> ------------------------------
>> -
>>   AutoFDO analysis using the perf tools
>>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> @@ -508,7 +499,7 @@ perf can be used to record and analyze trace of programs.
>>   Execution can be recorded using 'perf record' with the cs_etm event,
>>   specifying the name of the sink to record to, e.g::
>>
>> -    perf record -e cs_etm/@tmc_etr0/u --per-thread
>> +    perf record -e cs_etm//u --per-thread
>>
>>   The 'perf report' and 'perf script' commands can be used to analyze execution,
>>   synthesizing instruction and branch events from the instruction trace.
>> @@ -572,7 +563,7 @@ sort example is from the AutoFDO tutorial (https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgcc.gnu.org%2Fwiki%2FAutoFDO%2FTuto&data=05%7C02%7Cleo.yan%40arm.com%7C0d4875673b894a332a5508dd192a1f35%7Cf34e597957d94aaaad4db122a662184d%7C0%7C0%7C638694390923618348%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=vX1RVi4hA2gEqrVk9lvMV8UFVDzvClvUN7yILwv0788%3D&reserved=0
>>          Bubble sorting array of 30000 elements
>>          5910 ms
>>
>> -       $ perf record -e cs_etm/@tmc_etr0/u --per-thread taskset -c 2 ./sort
>> +       $ perf record -e cs_etm//u --per-thread taskset -c 2 ./sort
>>          Bubble sorting array of 30000 elements
>>          12543 ms
>>          [ perf record: Woken up 35 times to write data ]
>> diff --git a/Documentation/userspace-api/perf_ring_buffer.rst b/Documentation/userspace-api/perf_ring_buffer.rst
>> index bde9d8cbc106..dc71544532ce 100644
>> --- a/Documentation/userspace-api/perf_ring_buffer.rst
>> +++ b/Documentation/userspace-api/perf_ring_buffer.rst
>> @@ -627,7 +627,7 @@ regular ring buffer.
>>   AUX events and AUX trace data are two different things.  Let's see an
>>   example::
>>
>> -        perf record -a -e cycles -e cs_etm/@tmc_etr0/ -- sleep 2
>> +        perf record -a -e cycles -e cs_etm// -- sleep 2
>>
>>   The above command enables two events: one is the event *cycles* from PMU
>>   and another is the AUX event *cs_etm* from Arm CoreSight, both are saved
>> @@ -766,7 +766,7 @@ only record AUX trace data at a specific time point which users are
>>   interested in.  E.g. below gives an example of how to take snapshots
>>   with 1 second interval with Arm CoreSight::
>>
>> -  perf record -e cs_etm/@tmc_etr0/u -S -a program &
>> +  perf record -e cs_etm//u -S -a program &
>>     PERFPID=$!
>>     while true; do
>>         kill -USR2 $PERFPID
>> --
>> 2.34.1
>>
>> _______________________________________________
>> CoreSight mailing list -- coresight@lists.linaro.org
>> To unsubscribe send an email to coresight-leave@lists.linaro.org


