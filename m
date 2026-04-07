Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7A1FEEF29
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 12:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlLMdkxF2W1r/jVdkYBQ+fiAEAbN2x1XXxv6OXDhViE=; b=H+bQpN0qatLWP655zrnuIFklHc
	UbpcucmXtYwbWVTc4kSvpZFkcKI1+nQmfY3QtPI7lFBq8WNUF5/fzkTmp6sdeiTgvirAYHIpQ8XyA
	bOFqKzNB7w35VEKRQnlgi7C6lUIIx4G4yh1pF16FmK45V/krj181MmkCrvnl51UYXBQ3SvtpI+0g1
	EpcWdj4boY17h4I0E1bna5x4w+v42h2a3ra/h5KRUooWssZy2yp8MsInsyjXnSDFDWmSUbO1lgUxb
	Mwz2d9ZeSi8AZQOw/JXJbVxhPtdPmltKbAqn6mLBJ70qUh4Z40m3e1y8zsEzAtvP2xMyLvHUJpFhW
	ukslef6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5eN-00000006S3r-1ghZ;
	Tue, 07 Apr 2026 12:35:23 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5eK-00000006S35-3q3T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 12:35:22 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b9841aecf72so714189366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 05:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775565319; x=1776170119; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IlLMdkxF2W1r/jVdkYBQ+fiAEAbN2x1XXxv6OXDhViE=;
        b=IDxC7S+GsDFSciJuoZ8DOYu1v/CwjCPeQsQStQYGIpU7lRc5PpM9u6WwQvs91j//e9
         qo/sySYHInsEZpEqx3+/TRetF5g9QFEMt8qp6UsesJerxespYCyRjnS08DnmgQ2tIPU/
         XZt/is9V3gI9zclEdni0ZObw0wkH20VtM8jmnabUsIyrdtkOjKDvNiYxi/9FWQjr8zku
         +NZJeCZSVF6T6qWkdvpmZj3RBrTgerkUPsqj2icjmdyGrnw322/aidL5kx6cgoNV7Qcz
         hc1vAf0Zq4zAyryHyw8yGoF9pwAJfNAdv6zOrocpTFXXLQY0MLtqZ99jJLpQZ/lRhent
         vFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775565319; x=1776170119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlLMdkxF2W1r/jVdkYBQ+fiAEAbN2x1XXxv6OXDhViE=;
        b=iEJn/S8EcIYUW+FrpUiDJ81MeFYB7QlEKmfq/MN1pBdP1z9D+vPFlAFdzYAy0YVmYK
         vZ6Wf5z2yfhltr36giTqsH6zc+iNDIYeN4lvPZQ0EJA9a7hHo/o0gNuVwejte0pS3czb
         bNj5+RCE4jrbImKiV+T6GxT50vmNg/VgjwSi2nbJlCIx0767QFWojAYm9CJcAMzlfhY3
         joYam+spNSCBCkCxYfKc6S1YT7IJg/uNnOfwhsl+KDjg7K4Wni4n/fIqYohiB8w7lu1z
         Mas0P4uDzow0RFyO5ZZ0PgPoAwQe0NRitDbpX2LnVC1bIIHqb6iE9PXHxDD57CCy26OW
         vf8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3E3RE73i8TBxoqNuyc/1GpSINSKEvCgjSTchN8tEWTsCjxa5MUJsUOls6qLqOkPR2+mgZEUuVI2f4SAkuGQBF@lists.infradead.org
X-Gm-Message-State: AOJu0YzxFLJrdP4DDO55LtnfpP9hcsv4DqfQ5Qo/6w0o0613AIuDYEkf
	VtzRBjtfZV3pHTzj7L2E7AUhj4WEi+btqufwz7YEm3ktGe16IYbwalDSW1mgvfG90wg=
X-Gm-Gg: AeBDiete0ZcIMH1HDzDR7xLx9VyHsuDxJpDimfsPUHGRigk4pzEv+TouR8Qvw6Som2n
	Ci+4hDbAnKoTmC2X+s2J7ZPBGEUKxbnpfmbU7GvUw8xSPc2E2LX31gyxwHyBdz1xUrQMCFlnehn
	SXp7xatQL8Ah6BbQdZzH2uqMXDdEkAsvMS3spn2oJrmg+qnWsHFKpLqMgDDN9MY+MtmL8kHAvRd
	4+o3Z7MaXZoO822Yd2TsYyOTYFyKI+pokuY5uMMBbdGZxj3RXw1b1Cq6WJ/+9vJO9yo/Z/+0hGQ
	fp1pEfWTmC2ArFwsZrxo1lom0KSwATr6dP35cvCCht8Z2/x5aYNf+qjSecnF4Z3J7VhIRVceNdc
	ut3Z70R+nrYVBxNcs3Jl9IfO+O9Dx3oo5gGBA00wUbIY7iyY1wb4RODjc6PS+YCjmk0r4rOR2Uv
	5TAULjsAJZEb/Bfp8fLWeKq586Q/Hm
X-Received: by 2002:a17:907:3cd4:b0:b97:a086:ac9d with SMTP id a640c23a62f3a-b9c67b3de18mr815577566b.43.1775565318453;
        Tue, 07 Apr 2026 05:35:18 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff17basm554144066b.50.2026.04.07.05.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 05:35:17 -0700 (PDT)
Message-ID: <ee012f48-5d08-4004-b9d0-bcac825cb50c@linaro.org>
Date: Tue, 7 Apr 2026 13:35:16 +0100
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fVcYOJ_3TWd6won5FVaH2MH6QwLhCoCRnNzzeE-9PgO1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_053521_042378_5D3BBB60 
X-CRM114-Status: GOOD (  41.77  )
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



On 02/04/2026 4:26 pm, Ian Rogers wrote:
> On Wed, Apr 1, 2026 at 7:26 AM James Clark <james.clark@linaro.org> wrote:
>>
>>  From the TRM [1], N1 has one IMPDEF event which isn't covered by the
>> common list. Add a framework so that more cores can be added in the
>> future and that the N1 IMPDEF event can be decoded. Also increase the
>> size of the buffer because we're adding more strings and if it gets
>> truncated it falls back to a hex dump only.
>>
>> [1]: https://developer.arm.com/documentation/100616/0401/Statistical-Profiling-Extension/implementation-defined-features-of-SPE
>> Suggested-by: Al Grant <al.grant@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   tools/perf/util/arm-spe-decoder/Build              |  2 +
>>   .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 45 ++++++++++++++++++++--
>>   .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     |  5 ++-
>>   tools/perf/util/arm-spe.c                          | 13 ++++---
>>   4 files changed, 54 insertions(+), 11 deletions(-)
>>
>> diff --git a/tools/perf/util/arm-spe-decoder/Build b/tools/perf/util/arm-spe-decoder/Build
>> index ab500e0efe24..97a298d1e279 100644
>> --- a/tools/perf/util/arm-spe-decoder/Build
>> +++ b/tools/perf/util/arm-spe-decoder/Build
>> @@ -1 +1,3 @@
>>   perf-util-y += arm-spe-pkt-decoder.o arm-spe-decoder.o
>> +
>> +CFLAGS_arm-spe-pkt-decoder.o += -I$(srctree)/tools/arch/arm64/include/ -I$(OUTPUT)arch/arm64/include/generated/
>> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
>> index c880b0dec3a1..42a7501d4dfe 100644
>> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
>> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
>> @@ -15,6 +15,8 @@
>>
>>   #include "arm-spe-pkt-decoder.h"
>>
>> +#include "../../arm64/include/asm/cputype.h"
> 
> Sashiko spotted:
> https://sashiko.dev/#/patchset/20260401-james-spe-impdef-decode-v1-0-ad0d372c220c%40linaro.org
> """
> This isn't a bug, but does this include directive rely on accidental
> path normalization?
> 
> The relative path ../../arm64/include/asm/cputype.h does not exist relative
> to arm-spe-pkt-decoder.c. It only compiles because the Build file adds
> -I$(srctree)/tools/arch/arm64/include/ to CFLAGS.
> 
> Would it be cleaner to use #include <asm/cputype.h> to explicitly rely on
> the include path?
> [ ... ]
> """
> I wouldn't use <asm/cputype.h> due to cross-compilation and the like,
> instead just add the extra "../" into the include path.
> 

Do you mean change the #include to this?

   #include "../../../arm64/include/asm/cputype.h"

I still need to add:

   CFLAGS_arm-spe-pkt-decoder.o += -I$(srctree)/tools/arch/arm64/include/

To make the this include in cputype.h work:

   #include <asm/sysreg.h>

Which probably only works because there isn't a sysreg.h on other 
architectures. But I'm not sure what the significance of ../../ vs 
../../../ is if either compile? arm-spe.c already does it with ../../ 
which is what I copied.

>> +
>>   static const char * const arm_spe_packet_name[] = {
>>          [ARM_SPE_PAD]           = "PAD",
>>          [ARM_SPE_END]           = "END",
>> @@ -307,6 +309,11 @@ static const struct ev_string common_ev_strings[] = {
>>          { .event = 0, .desc = NULL },
>>   };
>>
>> +static const struct ev_string n1_event_strings[] = {
>> +       { .event = 12, .desc = "LATE-PREFETCH" },
>> +       { .event = 0, .desc = NULL },
>> +};
>> +
>>   static u64 print_event_list(int *err, char **buf, size_t *buf_len,
>>                              const struct ev_string *ev_strings, u64 payload)
>>   {
>> @@ -318,14 +325,44 @@ static u64 print_event_list(int *err, char **buf, size_t *buf_len,
>>          return payload;
>>   }
>>
>> +struct event_print_handle {
>> +       const struct midr_range *midr_ranges;
>> +       const struct ev_string *ev_strings;
>> +};
>> +
>> +#define EV_PRINT(range, strings)                       \
>> +       {                                       \
>> +               .midr_ranges = range,           \
>> +               .ev_strings = strings,  \
>> +       }
>> +
>> +static const struct midr_range n1_event_encoding_cpus[] = {
>> +       MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
>> +       {},
>> +};
>> +
>> +static const struct event_print_handle event_print_handles[] = {
>> +       EV_PRINT(n1_event_encoding_cpus, n1_event_strings),
>> +};
>> +
>>   static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
>> -                                 char *buf, size_t buf_len)
>> +                                 char *buf, size_t buf_len, u64 midr)
>>   {
>>          u64 payload = packet->payload;
>>          int err = 0;
>>
>>          arm_spe_pkt_out_string(&err, &buf, &buf_len, "EV");
>> -       print_event_list(&err, &buf, &buf_len, common_ev_strings, payload);
>> +       payload = print_event_list(&err, &buf, &buf_len, common_ev_strings,
>> +                                  payload);
>> +
>> +       /* Try to decode IMPDEF bits for known CPUs */
>> +       for (unsigned int i = 0; i < ARRAY_SIZE(event_print_handles); i++) {
>> +               if (is_midr_in_range_list(midr,
>> +                                         event_print_handles[i].midr_ranges))
>> +                       payload = print_event_list(&err, &buf, &buf_len,
>> +                                                  event_print_handles[i].ev_strings,
>> +                                                  payload);
>> +       }
>>
>>          return err;
>>   }
>> @@ -506,7 +543,7 @@ static int arm_spe_pkt_desc_counter(const struct arm_spe_pkt *packet,
>>   }
>>
>>   int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf,
>> -                    size_t buf_len)
>> +                    size_t buf_len, u64 midr)
>>   {
>>          int idx = packet->index;
>>          unsigned long long payload = packet->payload;
>> @@ -522,7 +559,7 @@ int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf,
>>                  arm_spe_pkt_out_string(&err, &buf, &blen, "%s", name);
>>                  break;
>>          case ARM_SPE_EVENTS:
>> -               err = arm_spe_pkt_desc_event(packet, buf, buf_len);
>> +               err = arm_spe_pkt_desc_event(packet, buf, buf_len, midr);
>>                  break;
>>          case ARM_SPE_OP_TYPE:
>>                  err = arm_spe_pkt_desc_op_type(packet, buf, buf_len);
>> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
>> index adf4cde320aa..17b067fe3c87 100644
>> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
>> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
>> @@ -11,7 +11,7 @@
>>   #include <stddef.h>
>>   #include <stdint.h>
>>
>> -#define ARM_SPE_PKT_DESC_MAX           256
>> +#define ARM_SPE_PKT_DESC_MAX           512
>>
>>   #define ARM_SPE_NEED_MORE_BYTES                -1
>>   #define ARM_SPE_BAD_PACKET             -2
>> @@ -186,5 +186,6 @@ const char *arm_spe_pkt_name(enum arm_spe_pkt_type);
>>   int arm_spe_get_packet(const unsigned char *buf, size_t len,
>>                         struct arm_spe_pkt *packet);
>>
>> -int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf, size_t len);
>> +int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf, size_t len,
>> +                    u64 midr);
>>   #endif
>> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
>> index 7447b000f9cd..46f0309c092b 100644
>> --- a/tools/perf/util/arm-spe.c
>> +++ b/tools/perf/util/arm-spe.c
>> @@ -135,7 +135,7 @@ struct data_source_handle {
>>          }
>>
>>   static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
>> -                        unsigned char *buf, size_t len)
>> +                        unsigned char *buf, size_t len, u64 midr)
>>   {
>>          struct arm_spe_pkt packet;
>>          size_t pos = 0;
>> @@ -161,7 +161,7 @@ static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
>>                          color_fprintf(stdout, color, "   ");
>>                  if (ret > 0) {
>>                          ret = arm_spe_pkt_desc(&packet, desc,
>> -                                              ARM_SPE_PKT_DESC_MAX);
>> +                                              ARM_SPE_PKT_DESC_MAX, midr);
>>                          if (!ret)
>>                                  color_fprintf(stdout, color, " %s\n", desc);
>>                  } else {
>> @@ -174,10 +174,10 @@ static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
>>   }
>>
>>   static void arm_spe_dump_event(struct arm_spe *spe, unsigned char *buf,
>> -                              size_t len)
>> +                              size_t len, u64 midr)
>>   {
>>          printf(".\n");
>> -       arm_spe_dump(spe, buf, len);
>> +       arm_spe_dump(spe, buf, len, midr);
>>   }
>>
>>   static int arm_spe_get_trace(struct arm_spe_buffer *b, void *data)
>> @@ -1469,8 +1469,11 @@ static int arm_spe_process_auxtrace_event(struct perf_session *session,
>>                  /* Dump here now we have copied a piped trace out of the pipe */
>>                  if (dump_trace) {
>>                          if (auxtrace_buffer__get_data(buffer, fd)) {
>> +                               u64 midr = 0;
>> +
>> +                               arm_spe__get_midr(spe, buffer->cpu.cpu, &midr);
> 
> Sashiko claims to have spotted an issue here:
> """
> Is it possible for arm_spe__get_midr() to cause a segmentation fault here?
> 
> If the trace is from an older recording (metadata version 1) and the
> environment lacks a CPUID string (such as during cross-architecture
> analysis), perf_env__cpuid() returns NULL.
> 
> It appears arm_spe__get_midr() then passes this NULL pointer to
> strtol(cpuid, NULL, 16), which leads to undefined behavior.
> """
> 
> But this feels like, if this happens you're already having a bad time
> and these changes aren't necessarily making things worse.
> 
> Thanks,
> Ian
> 

Yeah I think it might be possible so I can add an error instead of a 
segfault. I'll check the rest of the Sashiko comments too.

>>                                  arm_spe_dump_event(spe, buffer->data,
>> -                                               buffer->size);
>> +                                               buffer->size, midr);
>>                                  auxtrace_buffer__put_data(buffer);
>>                          }
>>                  }
>>
>> --
>> 2.34.1
>>


