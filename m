Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A69E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9P17ieee9B5SlwZSInMZgc5AL5v6w0qOBx6blK3MkC8=; b=C2T3txBW0H71R4hCVjKjJFMk7Y
	POg/8D5wKcGE4V78X00Evb4qb3j0wTf8IccLa/R3NDzQdlhfVFHBiUKdw+hGc8bHjeDWdbw17My11
	w4TREziteL5YiGQJ0lZrys2wPAQrPwO425C2hmfE7shqw6u6pV7TmnEBD5BHo2tFu0pxVbNkKWeco
	MEjVg5njgj8Tv2U72pASYOj7yUa6qBa7fGNjnPItVStg6ibGbIiPUC8Ca3s++yCFaZ7+3bG14NQtm
	suOCXEvTTwjHvCCbRx+tba3zbrABb4q6BrAq895LyU+oSDb434RRE6NS0CDxfmvAeke5G8BD4n6xj
	YK8/Icng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqzC-0000000GCvr-1BVm;
	Wed, 18 Dec 2024 10:08:58 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqy5-0000000GClo-283y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 10:07:50 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4363ae65100so38952215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 02:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734516468; x=1735121268; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9P17ieee9B5SlwZSInMZgc5AL5v6w0qOBx6blK3MkC8=;
        b=pr070Q8GfTro08iDYHU9eOq/9wv1uOrU/66kqKXoW+ztGLUpnb6YgY2qwKJ0Uq9Nxr
         oHObiuH4drzuNWOOSMA7Wgk0kyZcH80Ls5Up+semlXeja1ybmQBb9BbIaHKzV76seIwR
         XcVZiFFy/YarVoLFxmJc6r7J6KU0Zt2MTonHRsZjNTararrmHgXcawJ5Yx7SwWbfFSKK
         jV5pFDVDNMirHj2ZBlKQtUTBQ3+m+PqG68p+79JWTsx8d3s86OK/ETAmruoG3ZeEcShk
         LyRkLL2Z99CjH/QxatJvtBoPNhcmFhgaEyiKOP+l9wetztySPOmpoK7w7qzIblW76r4v
         lcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734516468; x=1735121268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9P17ieee9B5SlwZSInMZgc5AL5v6w0qOBx6blK3MkC8=;
        b=b6fxgGZNMo78CTD3MdXKbcnzS9oywYcnK2r9cTG1ZseJYOE6PGEaeF8ijSEl1mF1Xk
         rLRhdBS2w/YrCxJB0tga/7Huf6UiUQvWhwBBSzYowS4FU9oRwdaC8L/jUVQNSMUTQuue
         TfwYHbbtWnSqqmeoBlNqwSDBJSjdrkFBN8LDeXLzzHdWGs5zI0/2var0EpIXg0x7V7VZ
         hTr1+SvL5/+/IT1qIm+Te+of2aIAElcEnHtoDiBZTbMCUZUBkfxavGd3qojH0aySlsyX
         k3Hu3CM1ML63m0qd5z8DkIz0a6GNosk2ZJ1NB04Zn612J6ETYRS/5A7r74i/jeVvDLh2
         6TBw==
X-Gm-Message-State: AOJu0YxerggdakCCyJVwk94AMpkJBInJuZAFUXLJR06QWScz4FRMN3Bv
	/+qd3T8kxMnbeeipBMHLK/PuFf9cGkGASTREJyHKYtVfwS/rltE6tjRorwlwK64=
X-Gm-Gg: ASbGnct/U92X8+Bi2oOozaPOj2DF9ifxAHTCO9QPP5xUx/L7CAoVqSXfJOp/YpAUmUR
	D/X6CmoyVPka08CqPGu94V64+ZaCm03zXnVnFInTcPg/uCvabnQj3CGnv1gXYM8y+2tSDemXHsm
	KBUrG0GhKmsxCRBRNTjnCC9bp0DZPJmMprTKBf+cw0KNo52a5FtVzec/JIXbxO0k2G+T9/mQaId
	VJ/quP2vFg0ER9V1KHTWzW/CMW+wWcaPrKsd+gviy++cyTZ48/aeHp/IHXoemyfyP4=
X-Google-Smtp-Source: AGHT+IHC2RZ1yHVWgEcKRYnXsTSt7w3TIR3YVn7d27iergCOQv1IMX81+xjenYwudQOzwGcr5LlErg==
X-Received: by 2002:a05:600c:3b14:b0:434:fec5:4ed1 with SMTP id 5b1f17b1804b1-436553fe571mr14370955e9.26.1734516467662;
        Wed, 18 Dec 2024 02:07:47 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80613a9sm13518151f8f.101.2024.12.18.02.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 02:07:47 -0800 (PST)
Message-ID: <8c15786c-47b6-47ff-b1dc-ecbf32d582fb@linaro.org>
Date: Wed, 18 Dec 2024 10:07:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] perf docs: arm_spe: Document new discard mode
To: Ian Rogers <irogers@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 John Garry <john.g.garry@oracle.com>, Mike Leach <mike.leach@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Graham Woodward <graham.woodward@arm.com>,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org
References: <20241217115610.371755-1-james.clark@linaro.org>
 <20241217115610.371755-6-james.clark@linaro.org>
 <CAP-5=fU7RNzvzxBcAQy3RT9Ge3YtqPhDonupNWS7Wgb8HGQkGg@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fU7RNzvzxBcAQy3RT9Ge3YtqPhDonupNWS7Wgb8HGQkGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_020749_568192_0A59F998 
X-CRM114-Status: GOOD (  22.98  )
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



On 18/12/2024 12:54 am, Ian Rogers wrote:
> On Tue, Dec 17, 2024 at 3:56 AM James Clark <james.clark@linaro.org> wrote:
>>
>> Document the flag, hint what it's used for and give an example with
>> other useful options to get minimal output.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   tools/perf/Documentation/perf-arm-spe.txt | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/tools/perf/Documentation/perf-arm-spe.txt b/tools/perf/Documentation/perf-arm-spe.txt
>> index de2b0b479249..588eead438bc 100644
>> --- a/tools/perf/Documentation/perf-arm-spe.txt
>> +++ b/tools/perf/Documentation/perf-arm-spe.txt
>> @@ -150,6 +150,7 @@ arm_spe/load_filter=1,min_latency=10/'
>>     pct_enable=1        - collect physical timestamp instead of virtual timestamp (PMSCR.PCT) - requires privilege
>>     store_filter=1      - collect stores only (PMSFCR.ST)
>>     ts_enable=1         - enable timestamping with value of generic timer (PMSCR.TS)
>> +  discard=1           - enable SPE PMU events but don't collect sample data - see 'Discard mode' (PMBLIMITR.FM = DISCARD)
>>
>>   +++*+++ Latency is the total latency from the point at which sampling started on that instruction, rather
>>   than only the execution latency.
>> @@ -220,6 +221,16 @@ Common errors
>>
>>      Increase sampling interval (see above)
>>
>> +Discard mode
>> +~~~~~~~~~~~~
>> +
>> +SPE PMU events can be used without the overhead of collecting sample data if
>> +discard mode is supported (optional from Armv8.6). First run a system wide SPE
>> +session (or on the core of interest) using options to minimize output. Then run
>> +perf stat:
>> +
>> +  perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/null &
>> +  perf stat -e SAMPLE_FEED_LD
> 
> Perhaps clarify this should be an ARM SPE event? It seems strange to
> have one perf command affect a later one, the purpose of things like
> event multiplexing is to hide the hardware limits. I'd prefer if the
> last bit was like:
> ```
> Then run perf stat with an SPE event on the same PMU:
> 
> perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/null &
> perf stat -e arm_spe/SAMPLE_FEED_LD/
> ``
> 
> Thanks,
> Ian

Hi Ian,

Confusingly this isn't an SPE event, it is a normal PMU event. The fact 
that one Perf command affects the other is because these events only 
count when SPE is enabled. When it's enabled it has an effect on a 
per-core level which is why in the example I made it simpler by enabling 
SPE system wide.

SPE is an exclusive PMU like Coresight and some others so it can't be 
affected by multiplexing or anything like that. The SAMPLE_FEED_LD PMU 
would be, but as long as SPE stays enabled it will count the right thing 
regardless of multiplexing.

THanks
James




