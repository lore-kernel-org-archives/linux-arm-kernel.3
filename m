Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1849AE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDlwyDroBq6zcVrCDpDlItZdzZfKhDPhfE9JnSAIaJU=; b=rvmwsdLELxS0+yRrEGeHVHjwk0
	bx3ABq2mDKv81UNAC33SI011EaWmjAVGSa83Aftdex1GP/ghU9QBRFGR3eGJTenl8knfGslt5RhrP
	bqd4Oz3cNeD8a3eBDNwpUk9082dV3rOAS93B/ZmtypWGFUdCbloMDqVj49uBgeeRFNbZAdo4JIStH
	kcR4LyE+wtckLjWuvM+wLfNurtq3YyzSFxLUYqi9SIynZzHOPPWBqgZbBHvvNQjyI61ouarVChdmy
	vUqhNh25Y5MTXgVz1z8IebRW0bQOWhocr7gTpLVYzSaQ4684dhlzMwCXnnP3dKCabk0l80HZkhl6L
	gcCj6QqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaxR-00000007HFx-3XuK;
	Mon, 09 Dec 2024 10:25:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaaM-00000007CFv-0QcM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:01:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-434ab938e37so26519725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 02:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733738508; x=1734343308; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wDlwyDroBq6zcVrCDpDlItZdzZfKhDPhfE9JnSAIaJU=;
        b=B3tXNND12VAiDvPP7P8g54P9dFKvNAlcoHQ9nMQIkiqCoRoBNgr2ZaXjIHhxui25kN
         Wf4D3yxwuVLWdF3+2x5E9E4cpIgW0h0geiLzJmkjpg79eS6GHiEY2ox4QehnDA8cFQTH
         MNlp7DZjwcHOFmE232LOGiCCMZSwL6J4uuPi0ANG5muSEECGWnVXnK6hMV2vveX+5FCA
         xB2zE/WdG1jQbAmNgPYBEltFb/BLC1HXMdj9kQv4N0W8bkLoTpHTVPnZEnGH4e8BsK6A
         jT5QPWri0AbKnEjsRk/6xY43VxoZZaHBqaba978QEeUJSuh1AC8/nmFFIxpUPFI55vC0
         4i3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733738508; x=1734343308;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wDlwyDroBq6zcVrCDpDlItZdzZfKhDPhfE9JnSAIaJU=;
        b=gaLbYNtIDJRKBgknaQ515UBXEhn9nhg6oMa8m8qJ4Znwlfq4n9mcAcqJaYm3ajiVp2
         WraY7WvrK36UClTNH/n6dWPDA4AHqNcP3pAGwEK0GaG6HxdWb5U98E1tgMg4Ud7uJyCM
         4NBVZM+O9cz76jkTeZW7lq7Hmpb83yzb/G5NVTH/1F2PQokpj7p8YXe8Hm49DVyUhSOw
         5dLjtWP0HAyY8V2451HCJBbFRrLe6cFDJb6FMdqdGs2sA0g7tEtlWGlAn+jxd0iBgYwu
         uEK5/SfgRcSteMeQKB5F4ABqlS4JRoMmtwrHOb52+64/z9WjiVJOJk4orJ8BYy0CrpVL
         gSyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyzHqzb7Z8MpiNx2wmNEjizjLl0/aJB28Qtf2/nu5X3mfX2Yu4L9EWx21ctNEyoFje6VOaRD/5paoLfkoYjkTT@lists.infradead.org
X-Gm-Message-State: AOJu0YzJC4eJ/PmQsJVnJ/oKNw2jQzKQo8+frFWWlD9FDTtVi6XtNpGA
	m6t0hTTMLGGzUoq0jUhz7Rdz1s8OArEGomqlbgG7siI14GvA5K61sBVL/0CX13Y=
X-Gm-Gg: ASbGncv7nUHTdNKQP31SPiVdLrdb1s5Dbws0O9GXY6hlR8+Kw9BF7Cpe1kCgMugmado
	Msb4JlTbFXxPkoVL5ekEkywIALRzHY8dpx1lB3MD8aXpfieORLb2A3wXVoGN7/CTSftIxqdfq6N
	HRSMu8WCSd19Qa2+g3VhKwz5+Y0nuNm3qZ6eXwZN/d9LX7CnjmypMzgw751k0B6ZURiGCBbqGje
	A5SLLkJuXUXCjk0kAHBi8YR3yiph+FIlV0GrfrpwahDy9uOHVZuSQ32ubO2kA==
X-Google-Smtp-Source: AGHT+IGwtp3FQpoGqZyO22hYjk1/F0qh54u6BpRMMDp3hLcMSs789LWDskm/IYygzHoEct0bsoKghQ==
X-Received: by 2002:a05:600c:1f8c:b0:434:a1e7:27b0 with SMTP id 5b1f17b1804b1-434ddeb5379mr84518625e9.11.1733738507736;
        Mon, 09 Dec 2024 02:01:47 -0800 (PST)
Received: from [192.168.68.163] ([209.198.129.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f2b08972sm57369755e9.27.2024.12.09.02.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 02:01:47 -0800 (PST)
Message-ID: <ee89c235-a126-4874-994d-b2489eb1c00f@linaro.org>
Date: Mon, 9 Dec 2024 10:01:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf vendor events arm64: Add FUJITSU-MONAKA pmu event
To: Yoshihiro Furudera <fj5100bi@fujitsu.com>
References: <20241111064843.3003093-1-fj5100bi@fujitsu.com>
Content-Language: en-US
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>, Xu Yang <xu.yang_2@nxp.com>,
 Jing Zhang <renyu.zj@linux.alibaba.com>, Lucas Stach
 <l.stach@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akio Kakuno <fj3333bs@aa.jp.fujitsu.com>, nick.forrington@arm.com
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241111064843.3003093-1-fj5100bi@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_020150_958196_7495D555 
X-CRM114-Status: GOOD (  22.85  )
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



On 11/11/2024 6:48 am, Yoshihiro Furudera wrote:
>      Add pmu events for FUJITSU-MONAKA.
>      And, also updated common-and-microarch.json and recommended.json.
> 
>      FUJITSU-MONAKA Specification URL:
>      https://github.com/fujitsu/FUJITSU-MONAKA
> 
> Signed-off-by: Akio Kakuno <fj3333bs@aa.jp.fujitsu.com>
> Signed-off-by: Yoshihiro Furudera <fj5100bi@fujitsu.com>
> ---
> Changes in v2:
> - Change "SVE_INT64_DIV_SPEC" to "SVE_INT_DIV64_SPEC" in tools/perf/pmu-events/arch/arm64/fujitsu/monaka/sve.json.
> - Link to v1: https://lore.kernel.org/all/20241111024529.2985894-1-fj5100bi@fujitsu.com/
> 
>   .../arch/arm64/common-and-microarch.json      | 858 ++++++++++++++++++
>   .../fujitsu/monaka/cycle_accounting.json      | 146 +++
>   .../arch/arm64/fujitsu/monaka/energy.json     |  20 +
>   .../arch/arm64/fujitsu/monaka/exception.json  |  32 +
>   .../arm64/fujitsu/monaka/fp_operation.json    | 194 ++++
>   .../arch/arm64/fujitsu/monaka/gcycle.json     | 116 +++
>   .../arch/arm64/fujitsu/monaka/general.json    |   8 +
>   .../arch/arm64/fujitsu/monaka/hwpf.json       |  62 ++
>   .../arch/arm64/fujitsu/monaka/l1d_cache.json  | 101 +++
>   .../arch/arm64/fujitsu/monaka/l1i_cache.json  |  47 +
>   .../arch/arm64/fujitsu/monaka/l2_cache.json   | 146 +++
>   .../arch/arm64/fujitsu/monaka/l3_cache.json   | 185 ++++
>   .../arch/arm64/fujitsu/monaka/ll_cache.json   |   8 +
>   .../arch/arm64/fujitsu/monaka/memory.json     |   8 +
>   .../arch/arm64/fujitsu/monaka/pipeline.json   | 230 +++++
>   .../arch/arm64/fujitsu/monaka/retired.json    |  29 +
>   .../arm64/fujitsu/monaka/spec_operation.json  | 158 ++++
>   .../arch/arm64/fujitsu/monaka/stall.json      |  83 ++
>   .../arch/arm64/fujitsu/monaka/sve.json        | 146 +++
>   .../arch/arm64/fujitsu/monaka/tlb.json        | 404 +++++++++
>   .../arch/arm64/fujitsu/monaka/trace.json      |  20 +
>   tools/perf/pmu-events/arch/arm64/mapfile.csv  |   1 +
>   .../pmu-events/arch/arm64/recommended.json    |   6 +
>   23 files changed, 3008 insertions(+)
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/cycle_accounting.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/energy.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/exception.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/fp_operation.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/gcycle.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/general.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/hwpf.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/l1d_cache.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/l1i_cache.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/l2_cache.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/l3_cache.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/ll_cache.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/memory.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pipeline.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/retired.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/spec_operation.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/stall.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/sve.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/tlb.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/fujitsu/monaka/trace.json
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> index 492083b99256..50fc4b2df361 100644
> --- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> +++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> @@ -533,6 +533,12 @@
>           "EventName": "SVE_INST_SPEC",
>           "BriefDescription": "SVE operations speculatively executed"
>       },
> +    {
> +        "PublicDescription": "This event counts architecturally executed Advanced SIMD and SVE operations.",
> +        "EventCode": "0x8007",
> +        "EventName": "ASE_SVE_INST_SPEC",
> +        "BriefDescription": "This event counts architecturally executed Advanced SIMD and SVE operations."
> +    },

Hi Yoshihiro,

You don't need to duplicate the descriptions if they are the same. Just 
BriefDescription is enough and it will show for both normal and verbose 
mode.

Also in the common files, we're using the description strings from the 
Arm ARM. I noticed that the ones from your spec are slightly different. 
This is ok for now, but if we add any new Arm cores that use the same 
events this description may get overwritten. For example 
ASE_SVE_INST_SPEC in the Arm ARM is currently "Operation speculatively 
executed, Advanced SIMD or SVE".

If you have any actual relevant details that are different from the 
common string, you should put them in .../arch/arm64/fujitsu/monaka. But 
if you are ok with the potential overwrite (which looks like it should 
be ok) then you can leave them as is.

[...]

> diff --git a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/general.json b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/general.json
> new file mode 100644
> index 000000000000..80bf17fb8f4c
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/general.json
> @@ -0,0 +1,8 @@
> +[
> +    {
> +        "ArchStdEvent": "CPU_CYCLES"
> +    },

Other cores put CPU_CYCLES in bus.json. For user friendlyness I would 
put the common ones into the same existing groups. The same issue 
applies for some other common events.


Thanks
James


