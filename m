Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD318FD5F87
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 08:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5xUeBoBW+ZGY0tPjnIwZA7YbDVLWoQy/vmQ+CJGtpk=; b=Pdssc8ovkpOHRLY//t8f631PcU
	R7wG9KPSUZoByZVYsQA3E8wa+ysYcTot4y1C+FZx8jms6Mbx5AMKc1nmunVOLPC+4oFE4eH6mCZhq
	xXkVgWe32XhQ29VbV6MNm6jO1GeojLmNYELty9l+YQptlwZJuaAyxPQ5twZBRX7y33zdHxnzINAh5
	u/wDytWQiy/nMzCjA5nqHdlofBeC8lfif0n+aAbopEgaccxksAwENggrnYA2zEQFy0zzadL1hub75
	e+/uJjIfFI8mmfCQJRXNT89FJ8s336OI8WKFWQIWDaCIeaf7k4XVnyIgOsQq+uMTGZRDNHYp6e5Ck
	ry8hivyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOZf-00000008XkE-1tLO;
	Wed, 08 Apr 2026 08:47:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOZd-00000008Xjk-09aT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 08:47:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso31253405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775638063; x=1776242863; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5xUeBoBW+ZGY0tPjnIwZA7YbDVLWoQy/vmQ+CJGtpk=;
        b=ZHj/VFL/g4B2s4Vq3kv/Ni88nRglG2gvDwhjiVeqlPMYOh+CGKpZEImsfQgr8N74Ku
         lghS+hC90lMQFYKeWETnOj1fuoNZJkqViMLUXwJ5rs2Nhxw8cpLoGtGRe65Df1wTODyT
         UgEarlbYTTPa+9K/KfkoMOTV6kLTHIXzerDwCVW5VCRcXFPwbVbcmyU55OzSZPn4tckv
         e5fVdxQlJzlAFJM0sXUt37X2H+Vw8qmsI8rt/vfiT4uD190mudVXRYYx3avVdnaUEWUG
         lHXX6HNcuUcg2IOulkIuOrrpWp5vVZP8wFJnugfjiLPPhVv0N+rwMs3s91Ztmp/JFyQr
         ME+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638063; x=1776242863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5xUeBoBW+ZGY0tPjnIwZA7YbDVLWoQy/vmQ+CJGtpk=;
        b=SYSwul46ZtLM1+CELEue2qSiebVbfthWSH3oHNRxEUl0AY08upPZCy8kakOZwtlH7x
         dY0HOrqx01uthqfOasN2U6gflXvB50A9MNlqNCZTNyyxmVKQzoTMo6nMZTlFuP/WqBc3
         eEMp12djMPqW4P+7N/qPRM3UoJKwuiPziYiKG8PAnv1QGXDDwT+0GUaIdvsnLUQOCKM5
         ApIybqvU7/NB1G+V89bOrOloFnvbDl3mNUE3jDaAP1clGYhSOm8SgAMkXHlTsvfTDBnC
         o/J2hT4nl491Gd82N5dceaWn1UIglrs40Fpn22Ekj1pYBoPmbDHBXIP0P3fWfVAk+r02
         G37A==
X-Forwarded-Encrypted: i=1; AJvYcCX3adSm5mIMPPk/SpCekjjRqZ7nHZwRBJwmWLuI8KHSTcpvtUZgAXrPft84Z2ZNichDUq4SekzJ9R6NwvnxmsJn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1yfFoHO0RQ4pSB+VduBaFboev1oPo0hwL7Kz3H8YWiCi49rLG
	3cUfFxTaZgBUP3QOFMxEJCk2mxVvhtUnfao3kWwqTRjlwjuJYExbCrvjnU6Ux+xQXnU=
X-Gm-Gg: AeBDieum7H6SPvw400vgl2qx4wRHvulyIgK1Cbv084WlN04qP0aze2XyKwJ9z6Zj1rS
	wvQl/+ZftxoC71dEO4xXVb0juGOHBfbFCrDYSq4xAI9oYsyfLaXr/rzcCF+/ObUZvwMKoZ8ebpv
	Xwk6f2SSusRXZe6ZKYwUbknek09EqxEyNXGRr8aQzYbUVnFdLr437kJxejND7cmwu5yTm5bo1P8
	BPW1oUS4cG/xrOWButxv6/XH4PzC5HQZeUNHG1FYQsemO78jz18t0Xmi7/O4ewRHBedZD1TaHTj
	XGJE8OyGrptEq/6jK7QTuLvMPzuNtydTVwhrQJLamzxHn0eI17W6TgPgze6CGAHZcvnbVdnqdwT
	CI8AL/Vgl/ew1y3NyF6iRiPhUKne0UtrwSeOhEVqqxjEwV62PQ1PdYUIrEu5qlyDl4w8Hm2nLRm
	4O99xlLOitgBwwyT8lxdNI6ShWk+96
X-Received: by 2002:a05:600c:4e0e:b0:482:f564:d613 with SMTP id 5b1f17b1804b1-488ca3983ebmr9645075e9.15.1775638062837;
        Wed, 08 Apr 2026 01:47:42 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm650337045e9.7.2026.04.08.01.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:47:42 -0700 (PDT)
Message-ID: <1b40ec9a-a003-4acc-9399-1a8d96fc4e42@linaro.org>
Date: Wed, 8 Apr 2026 09:47:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] perf arm_spe: Decode Arm N1 IMPDEF events
To: Ian Rogers <irogers@google.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Al Grant <al.grant@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
 <20260401-james-spe-impdef-decode-v1-3-ad0d372c220c@linaro.org>
 <CAP-5=fVcYOJ_3TWd6won5FVaH2MH6QwLhCoCRnNzzeE-9PgO1Q@mail.gmail.com>
 <ee012f48-5d08-4004-b9d0-bcac825cb50c@linaro.org>
 <CAP-5=fXNb50wXT3YH0i=-U8bXwizzH4bv8EL8mC9BMQE0Anp9Q@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fXNb50wXT3YH0i=-U8bXwizzH4bv8EL8mC9BMQE0Anp9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_014745_161125_98B7E886 
X-CRM114-Status: GOOD (  40.44  )
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



On 07/04/2026 7:26 pm, Ian Rogers wrote:
> On Tue, Apr 7, 2026 at 5:35 AM James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 02/04/2026 4:26 pm, Ian Rogers wrote:
>>> On Wed, Apr 1, 2026 at 7:26 AM James Clark <james.clark@linaro.org> wrote:
>>>>
>>>>   From the TRM [1], N1 has one IMPDEF event which isn't covered by the
>>>> common list. Add a framework so that more cores can be added in the
>>>> future and that the N1 IMPDEF event can be decoded. Also increase the
>>>> size of the buffer because we're adding more strings and if it gets
>>>> truncated it falls back to a hex dump only.
>>>>
>>>> [1]: https://developer.arm.com/documentation/100616/0401/Statistical-Profiling-Extension/implementation-defined-features-of-SPE
>>>> Suggested-by: Al Grant <al.grant@arm.com>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> ---
>>>>    tools/perf/util/arm-spe-decoder/Build              |  2 +
>>>>    .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 45 ++++++++++++++++++++--
>>>>    .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     |  5 ++-
>>>>    tools/perf/util/arm-spe.c                          | 13 ++++---
>>>>    4 files changed, 54 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/tools/perf/util/arm-spe-decoder/Build b/tools/perf/util/arm-spe-decoder/Build
>>>> index ab500e0efe24..97a298d1e279 100644
>>>> --- a/tools/perf/util/arm-spe-decoder/Build
>>>> +++ b/tools/perf/util/arm-spe-decoder/Build
>>>> @@ -1 +1,3 @@
>>>>    perf-util-y += arm-spe-pkt-decoder.o arm-spe-decoder.o
>>>> +
>>>> +CFLAGS_arm-spe-pkt-decoder.o += -I$(srctree)/tools/arch/arm64/include/ -I$(OUTPUT)arch/arm64/include/generated/
>>>> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
>>>> index c880b0dec3a1..42a7501d4dfe 100644
>>>> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
>>>> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
>>>> @@ -15,6 +15,8 @@
>>>>
>>>>    #include "arm-spe-pkt-decoder.h"
>>>>
>>>> +#include "../../arm64/include/asm/cputype.h"
>>>
>>> Sashiko spotted:
>>> https://sashiko.dev/#/patchset/20260401-james-spe-impdef-decode-v1-0-ad0d372c220c%40linaro.org
>>> """
>>> This isn't a bug, but does this include directive rely on accidental
>>> path normalization?
>>>
>>> The relative path ../../arm64/include/asm/cputype.h does not exist relative
>>> to arm-spe-pkt-decoder.c. It only compiles because the Build file adds
>>> -I$(srctree)/tools/arch/arm64/include/ to CFLAGS.
>>>
>>> Would it be cleaner to use #include <asm/cputype.h> to explicitly rely on
>>> the include path?
>>> [ ... ]
>>> """
>>> I wouldn't use <asm/cputype.h> due to cross-compilation and the like,
>>> instead just add the extra "../" into the include path.
>>>
>>
>> Do you mean change the #include to this?
>>
>>     #include "../../../arm64/include/asm/cputype.h"
>>
>> I still need to add:
>>
>>     CFLAGS_arm-spe-pkt-decoder.o += -I$(srctree)/tools/arch/arm64/include/
>>
>> To make the this include in cputype.h work:
>>
>>     #include <asm/sysreg.h>
>>
>> Which probably only works because there isn't a sysreg.h on other
>> architectures. But I'm not sure what the significance of ../../ vs
>> ../../../ is if either compile? arm-spe.c already does it with ../../
>> which is what I copied.
> 
> Hmm.. maybe the path should be
> "../../../arch/arm64/include/asm/cputype.h". The include preference is
> for a path relative to the source file and
> ../../arm64/include/asm/cputype.h doesn't exist. It is kind of horrid

Up 3 dirs from arm-spe-pkt-decoder.c would be 
"tools/arm64/include/asm/cputype.h" which doesn't exist either unless 
I'm missing something?

If get the compiler to print the path it uses with 3 then it would use 
the x86 uapi include path which doesn't seem any less weird to me:

  ...
  In file included from util/arm-spe-decoder/arm-spe-pkt-decoder.c:19:

  linux/tools/arch/x86/include/uapi/../../../arm64/include/asm/cputype.h:254:10:


> to add an include path and then use a relative path to escape into a
> higher-level directory. arm-spe.c is a little different as it is one
> directory higher in the directory layout.
> 

It is one folder higher, but arm-spe.c still relies on adding a special 
include path to CFLAGS_arm-spe.o to make it work. It's not including a 
real path relative to the source either.

Yeah it's a bit horrible but I don't think the asm/ thing combined with 
copying headers from the kernel to tools expected to handle the case 
where we would want to use asm/ stuff for a different arch than the 
compile one. It might not be normal to use relative include paths to 
escape to higher directories, but it's not a normal situation either. I 
think it's a special case for a special scenario. I'm not sure of a 
better way, but this is working for now.

> Thanks,
> Ian
> 
>>>> +
>>>>    static const char * const arm_spe_packet_name[] = {
>>>>           [ARM_SPE_PAD]           = "PAD",
>>>>           [ARM_SPE_END]           = "END",
>>>> @@ -307,6 +309,11 @@ static const struct ev_string common_ev_strings[] = {
>>>>           { .event = 0, .desc = NULL },
>>>>    };
>>>>
>>>> +static const struct ev_string n1_event_strings[] = {
>>>> +       { .event = 12, .desc = "LATE-PREFETCH" },
>>>> +       { .event = 0, .desc = NULL },
>>>> +};
>>>> +
>>>>    static u64 print_event_list(int *err, char **buf, size_t *buf_len,
>>>>                               const struct ev_string *ev_strings, u64 payload)
>>>>    {
>>>> @@ -318,14 +325,44 @@ static u64 print_event_list(int *err, char **buf, size_t *buf_len,
>>>>           return payload;
>>>>    }
>>>>
>>>> +struct event_print_handle {
>>>> +       const struct midr_range *midr_ranges;
>>>> +       const struct ev_string *ev_strings;
>>>> +};
>>>> +
>>>> +#define EV_PRINT(range, strings)                       \
>>>> +       {                                       \
>>>> +               .midr_ranges = range,           \
>>>> +               .ev_strings = strings,  \
>>>> +       }
>>>> +
>>>> +static const struct midr_range n1_event_encoding_cpus[] = {
>>>> +       MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
>>>> +       {},
>>>> +};
>>>> +
>>>> +static const struct event_print_handle event_print_handles[] = {
>>>> +       EV_PRINT(n1_event_encoding_cpus, n1_event_strings),
>>>> +};
>>>> +
>>>>    static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
>>>> -                                 char *buf, size_t buf_len)
>>>> +                                 char *buf, size_t buf_len, u64 midr)
>>>>    {
>>>>           u64 payload = packet->payload;
>>>>           int err = 0;
>>>>
>>>>           arm_spe_pkt_out_string(&err, &buf, &buf_len, "EV");
>>>> -       print_event_list(&err, &buf, &buf_len, common_ev_strings, payload);
>>>> +       payload = print_event_list(&err, &buf, &buf_len, common_ev_strings,
>>>> +                                  payload);
>>>> +
>>>> +       /* Try to decode IMPDEF bits for known CPUs */
>>>> +       for (unsigned int i = 0; i < ARRAY_SIZE(event_print_handles); i++) {
>>>> +               if (is_midr_in_range_list(midr,
>>>> +                                         event_print_handles[i].midr_ranges))
>>>> +                       payload = print_event_list(&err, &buf, &buf_len,
>>>> +                                                  event_print_handles[i].ev_strings,
>>>> +                                                  payload);
>>>> +       }
>>>>
>>>>           return err;
>>>>    }
>>>> @@ -506,7 +543,7 @@ static int arm_spe_pkt_desc_counter(const struct arm_spe_pkt *packet,
>>>>    }
>>>>
>>>>    int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf,
>>>> -                    size_t buf_len)
>>>> +                    size_t buf_len, u64 midr)
>>>>    {
>>>>           int idx = packet->index;
>>>>           unsigned long long payload = packet->payload;
>>>> @@ -522,7 +559,7 @@ int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf,
>>>>                   arm_spe_pkt_out_string(&err, &buf, &blen, "%s", name);
>>>>                   break;
>>>>           case ARM_SPE_EVENTS:
>>>> -               err = arm_spe_pkt_desc_event(packet, buf, buf_len);
>>>> +               err = arm_spe_pkt_desc_event(packet, buf, buf_len, midr);
>>>>                   break;
>>>>           case ARM_SPE_OP_TYPE:
>>>>                   err = arm_spe_pkt_desc_op_type(packet, buf, buf_len);
>>>> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
>>>> index adf4cde320aa..17b067fe3c87 100644
>>>> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
>>>> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
>>>> @@ -11,7 +11,7 @@
>>>>    #include <stddef.h>
>>>>    #include <stdint.h>
>>>>
>>>> -#define ARM_SPE_PKT_DESC_MAX           256
>>>> +#define ARM_SPE_PKT_DESC_MAX           512
>>>>
>>>>    #define ARM_SPE_NEED_MORE_BYTES                -1
>>>>    #define ARM_SPE_BAD_PACKET             -2
>>>> @@ -186,5 +186,6 @@ const char *arm_spe_pkt_name(enum arm_spe_pkt_type);
>>>>    int arm_spe_get_packet(const unsigned char *buf, size_t len,
>>>>                          struct arm_spe_pkt *packet);
>>>>
>>>> -int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf, size_t len);
>>>> +int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf, size_t len,
>>>> +                    u64 midr);
>>>>    #endif
>>>> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
>>>> index 7447b000f9cd..46f0309c092b 100644
>>>> --- a/tools/perf/util/arm-spe.c
>>>> +++ b/tools/perf/util/arm-spe.c
>>>> @@ -135,7 +135,7 @@ struct data_source_handle {
>>>>           }
>>>>
>>>>    static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
>>>> -                        unsigned char *buf, size_t len)
>>>> +                        unsigned char *buf, size_t len, u64 midr)
>>>>    {
>>>>           struct arm_spe_pkt packet;
>>>>           size_t pos = 0;
>>>> @@ -161,7 +161,7 @@ static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
>>>>                           color_fprintf(stdout, color, "   ");
>>>>                   if (ret > 0) {
>>>>                           ret = arm_spe_pkt_desc(&packet, desc,
>>>> -                                              ARM_SPE_PKT_DESC_MAX);
>>>> +                                              ARM_SPE_PKT_DESC_MAX, midr);
>>>>                           if (!ret)
>>>>                                   color_fprintf(stdout, color, " %s\n", desc);
>>>>                   } else {
>>>> @@ -174,10 +174,10 @@ static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
>>>>    }
>>>>
>>>>    static void arm_spe_dump_event(struct arm_spe *spe, unsigned char *buf,
>>>> -                              size_t len)
>>>> +                              size_t len, u64 midr)
>>>>    {
>>>>           printf(".\n");
>>>> -       arm_spe_dump(spe, buf, len);
>>>> +       arm_spe_dump(spe, buf, len, midr);
>>>>    }
>>>>
>>>>    static int arm_spe_get_trace(struct arm_spe_buffer *b, void *data)
>>>> @@ -1469,8 +1469,11 @@ static int arm_spe_process_auxtrace_event(struct perf_session *session,
>>>>                   /* Dump here now we have copied a piped trace out of the pipe */
>>>>                   if (dump_trace) {
>>>>                           if (auxtrace_buffer__get_data(buffer, fd)) {
>>>> +                               u64 midr = 0;
>>>> +
>>>> +                               arm_spe__get_midr(spe, buffer->cpu.cpu, &midr);
>>>
>>> Sashiko claims to have spotted an issue here:
>>> """
>>> Is it possible for arm_spe__get_midr() to cause a segmentation fault here?
>>>
>>> If the trace is from an older recording (metadata version 1) and the
>>> environment lacks a CPUID string (such as during cross-architecture
>>> analysis), perf_env__cpuid() returns NULL.
>>>
>>> It appears arm_spe__get_midr() then passes this NULL pointer to
>>> strtol(cpuid, NULL, 16), which leads to undefined behavior.
>>> """
>>>
>>> But this feels like, if this happens you're already having a bad time
>>> and these changes aren't necessarily making things worse.
>>>
>>> Thanks,
>>> Ian
>>>
>>
>> Yeah I think it might be possible so I can add an error instead of a
>> segfault. I'll check the rest of the Sashiko comments too.
>>
>>>>                                   arm_spe_dump_event(spe, buffer->data,
>>>> -                                               buffer->size);
>>>> +                                               buffer->size, midr);
>>>>                                   auxtrace_buffer__put_data(buffer);
>>>>                           }
>>>>                   }
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>


