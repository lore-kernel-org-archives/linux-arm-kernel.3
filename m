Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E31DD6409F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 09:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reyxjbWnqQbkZ/PY9ifbYGWOG1VNVTq6TpSbrTRbFzs=; b=FgET8K4fH1Q4Wj8NPjY73DH6gW
	/A3iUsSAKQnydKzg+0hzL2oSKv9tFSJ1f1apjc8r5Gg67Is7dJ76H9jovKX/cgFBXHDZKOQBax9Ds
	AE5Fk2417Yzp/NgX7gC8jXHcZN6xMrLAFIZ2N0wPoeNF3kAo5NOvR3zJ0W8AA+c+/7qelrEFa9brb
	nDi8NxkHcM7zn0PaI8JxHCFwTBQLa3ONJba2PzOIb6JY0FCWe+X0uu8icnUxnb+MFeAJLjVvnfR0N
	oxcRHo5gjflOVuxI0i50+T8MOHSyMIz+28eXw5J70it1XLyyIeefVid9G/uqbVpwIT1RVcA7SviMl
	wgXMKAVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnry-00000006PnR-34F5;
	Wed, 17 Dec 2025 09:30:54 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnrv-00000006Pmx-386O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 09:30:53 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-644f90587e5so9405072a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 01:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765963850; x=1766568650; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=reyxjbWnqQbkZ/PY9ifbYGWOG1VNVTq6TpSbrTRbFzs=;
        b=pJV4Tlyi21ya+RpqB4UjNtSbKkRO04qyj2wsc81g0fedSScCtvqzag8DFeu5mVx06g
         PdbLBnhBaiQ8fWein8Gf7DgPXztNHPnvZ2nhWXgyXit2/tz03AOky96hNcGYXzBQl/om
         kr6Tgu21LoE4IbtqEutwEjASdpGzelKEO24MGJpWt4KWU7DYj425BXaQyI8eaxFh8Biv
         twHtaHeQ/KPsM6zWcg5bEMJ7DO8v5gyfWmKjuq++6iQG/zegCDbCihdcHKHPVGsz6Qez
         VEok5X9T0QeHe0FrlGuGtN89rvw8fIF7GSlNXzPbn4SgGZC2sAGTOh2U2FiwBEzd1M9U
         ouew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765963850; x=1766568650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=reyxjbWnqQbkZ/PY9ifbYGWOG1VNVTq6TpSbrTRbFzs=;
        b=dOJQVrYKi/P6W8ueysFog/k+veXPVkljqbyXVLNfIM5fpQSvD1ZFXEq1AzX/r0V6RZ
         X6K+P33zwMKgFF6E2uQ9h1TgNrJGN+cWSrHuTQO0b538NXWaV3K40uoVoBgI6G/cYgVj
         r26nVAKOa2vK6YA2qKiZ6yJdxj0jw4oncK8NkX5YbKXsliRJpATsVBxRvdXWMGTP/H43
         HQFl2x18RsSFu+RO6mdvti8dITc9lg/1VpG/R/QZKXTD5lLshOEZUlb0vGfmiEoEJeZz
         slwIjPul64fXpRutcdXHNbu3SOr877/pa4u4DFab61tRfBc6oYljw50A2QLQ9BC7PcmB
         DdSg==
X-Forwarded-Encrypted: i=1; AJvYcCURB5atOROxX6qK1cTxfzgNxZtWpcNGnAQUWB60dRdfz8Q7CrxTxVgEPiiyTKA7UwFr2gP4D5qe0DxYxv8e7zso@lists.infradead.org
X-Gm-Message-State: AOJu0YzGUpWOJVx+Cycu/uzUp7EWVnNGxRP+4DTIvqbYTZFKd6BcfawW
	JNOi6kupGQdEDf/Q9cJG2pME9hDdKKRZK0tlTnQMiiUupxfhPJhGOd9UTkis+K0fnQs=
X-Gm-Gg: AY/fxX7DlEh/2eONpcB6gYVNYC4BsB5CaeLCPOZn43147w0oIKbKK5dIvhpujeYoQhd
	fYNBdmBw6B2PjwcL2d8FUli0ytdsqU6vr7rtbcIkr7Zl2PEMuor4Tr4TBosEUyzPTo7oU8W5FZL
	JQstrS8LdzWAJzQwtB56+Cz3il2O4H1gBUeRqiixTATmOlILK70/Ggib+4NtL0hWI3LbiQDZa/9
	W5QLY6cgRzUP5BburRezqRfWBXxPEgQpbROI20M4skKFOQu9qtwt43zOkNyovIg6Dqi0ydarj6w
	dDmLxM0eq/AOqUbvInxuLzQ5AVnMMAaPu7+Vp0aKBdqBziKnti9OulGlDrJPUDfvLiyQMOmTSEJ
	CmxoHXF2yj+ciWo8OmggAYKz1cSahc4ANqYDTIB5mq8WNLZdRB8S2oTXzyEYtIhnsijbLnTPEMu
	fsKl8p9ebp4aVDH0hOzUPf
X-Google-Smtp-Source: AGHT+IHo8MFKKOZcL4dFoI0ohz3Jq9DYwnbOFUbkPu3ssXHjV+PQjNsSYu4MEOkNhQs6nFW7YSQgzA==
X-Received: by 2002:a05:6402:26cf:b0:649:6c78:dc48 with SMTP id 4fb4d7f45d1cf-6499b1e1a0fmr16912267a12.26.1765963849665;
        Wed, 17 Dec 2025 01:30:49 -0800 (PST)
Received: from [192.168.0.108] ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f4ea39csm1870183a12.6.2025.12.17.01.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 01:30:49 -0800 (PST)
Message-ID: <58d9f452-c075-4499-8975-387f3cdb052a@linaro.org>
Date: Wed, 17 Dec 2025 11:30:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] perf evsel: Add a helper to get the value of a
 config field
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org>
 <20251212-james-perf-config-bits-v3-5-aa36a4846776@linaro.org>
 <CAP-5=fUbr56hFd7e7yt33-gnhEGGa72GLmShQ5bCHxQjFAbFCQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fUbr56hFd7e7yt33-gnhEGGa72GLmShQ5bCHxQjFAbFCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_013051_883616_A079045F 
X-CRM114-Status: GOOD (  29.20  )
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



On 16/12/2025 22:44, Ian Rogers wrote:
> On Fri, Dec 12, 2025 at 7:32 AM James Clark <james.clark@linaro.org> wrote:
>>
>> This will be used by aux PMUs to read an already written value for
>> configuring their events and for also testing.
>>
>> Its helper pmu_format_unpack() does the opposite of the existing
>> pmu_format_value() so rename that one to pmu_format_pack() so it's clear
>> how they are related.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   tools/perf/util/evsel.h |  2 ++
>>   tools/perf/util/pmu.c   | 77 ++++++++++++++++++++++++++++++++++++++++++-------
>>   2 files changed, 68 insertions(+), 11 deletions(-)
>>
>> diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
>> index a08130ff2e47a887b19f6c47bfa9f51e0c40d226..092904a61ec7afdc59253f9b78a9fe8b7cb5bfa7 100644
>> --- a/tools/perf/util/evsel.h
>> +++ b/tools/perf/util/evsel.h
>> @@ -575,6 +575,8 @@ void evsel__uniquify_counter(struct evsel *counter);
>>          ((((src) >> (pos)) & ((1ull << (size)) - 1)) << (63 - ((pos) + (size) - 1)))
>>
>>   u64 evsel__bitfield_swap_branch_flags(u64 value);
>> +int evsel__get_config_val(struct perf_pmu *pmu, struct evsel *evsel,
>> +                         const char *config_name, u64 *val);
>>   void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
>>                                  const char *config_name, u64 val);
>>
>> diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
>> index 514cba91f5d99b399d2d6a1e350971660c54a9fc..ef7358ad1fb955f29f2e68b3d0ce711754e4d67c 100644
>> --- a/tools/perf/util/pmu.c
>> +++ b/tools/perf/util/pmu.c
>> @@ -144,8 +144,8 @@ struct perf_pmu_format {
>>   };
>>
>>   static int pmu_aliases_parse(struct perf_pmu *pmu);
>> -static void pmu_format_value(unsigned long *format, __u64 value, __u64 *v,
>> -                            bool zero);
>> +static void pmu_format_pack(unsigned long *format, __u64 value, __u64 *v,
>> +                           bool zero);
>>   static struct perf_pmu_format *pmu_find_format(const struct list_head *formats,
>>                                                 const char *name);
>>
>> @@ -1377,6 +1377,61 @@ bool evsel__is_aux_event(const struct evsel *evsel)
>>          return pmu && pmu->auxtrace;
>>   }
>>
>> +/*
>> + * Unpacks a raw config[n] value using the sparse bitfield that defines a
>> + * format attr. For example "config1:1,6-7,44" defines a 4 bit value across non
>> + * contiguous bits and this function returns those 4 bits as a value.
>> + */
>> +static u64 pmu_format_unpack(u64 format, u64 config_val)
>> +{
>> +       int val_bit = 0;
>> +       u64 res = 0;
>> +       int fmt_bit;
>> +
>> +       for_each_set_bit(fmt_bit, &format, PERF_PMU_FORMAT_BITS) {
>> +               if (test_bit(fmt_bit, &config_val))
>> +                       res |= BIT_ULL(val_bit);
>> +
>> +               val_bit++;
>> +       }
>> +       return res;
>> +}
>> +
>> +int evsel__get_config_val(struct perf_pmu *pmu, struct evsel *evsel,
>> +                         const char *config_name, u64 *val)
> 
> nits:
> This is an evsel__ function but the evsel is the 2nd argument not the first.
> Why pass the PMU and not just read evsel->pmu (or better evsel__find_pmu) ?

That makes sense, I can do that.

> Why not place this in evsel.c to match the header file declaration?

This was for consistency with evsel__set_config_if_unset() that Arnaldo 
moved to pmu.c because of an issue with the Python bindings [1]. That 
doesn't seem to be an issue any more so I could move both to evsel.c. 
That would require making the following things public:

   struct perf_pmu_format
   pmu_format_pack()
   pmu_format_unpack()
   pmu_find_format()

Probably not the end of the world though?

[1]: https://lore.kernel.org/all/ZEbAS2yx2fguW60w@kernel.org/

> The evsel could be likely be const.
> 

Will do

> Thanks,
> Ian
> 
>> +{
>> +       struct perf_pmu_format *format = pmu_find_format(&pmu->format, config_name);
>> +       u64 bits = perf_pmu__format_bits(pmu, config_name);
>> +
>> +       if (!format || !bits) {
>> +               pr_err("Unknown/empty format name: %s\n", config_name);
>> +               *val = 0;
>> +               return -EINVAL;
>> +       }
>> +
>> +       switch (format->value) {
>> +       case PERF_PMU_FORMAT_VALUE_CONFIG:
>> +               *val = pmu_format_unpack(bits, evsel->core.attr.config);
>> +               return 0;
>> +       case PERF_PMU_FORMAT_VALUE_CONFIG1:
>> +               *val = pmu_format_unpack(bits, evsel->core.attr.config1);
>> +               return 0;
>> +       case PERF_PMU_FORMAT_VALUE_CONFIG2:
>> +               *val = pmu_format_unpack(bits, evsel->core.attr.config2);
>> +               return 0;
>> +       case PERF_PMU_FORMAT_VALUE_CONFIG3:
>> +               *val = pmu_format_unpack(bits, evsel->core.attr.config3);
>> +               return 0;
>> +       case PERF_PMU_FORMAT_VALUE_CONFIG4:
>> +               *val = pmu_format_unpack(bits, evsel->core.attr.config4);
>> +               return 0;
>> +       default:
>> +               pr_err("Unknown format value: %d\n", format->value);
>> +               *val = 0;
>> +               return -EINVAL;
>> +       }
>> +}
>> +
>>   /*
>>    * Set @config_name to @val as long as the user hasn't already set or cleared it
>>    * by passing a config term on the command line.
>> @@ -1432,7 +1487,7 @@ void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
>>                  return;
>>
>>          /* Otherwise replace it */
>> -       pmu_format_value(&bits, val, vp, /*zero=*/true);
>> +       pmu_format_pack(&bits, val, vp, /*zero=*/true);
>>   }
>>
>>   static struct perf_pmu_format *
>> @@ -1477,8 +1532,8 @@ int perf_pmu__format_type(struct perf_pmu *pmu, const char *name)
>>    * Sets value based on the format definition (format parameter)
>>    * and unformatted value (value parameter).
>>    */
>> -static void pmu_format_value(unsigned long *format, __u64 value, __u64 *v,
>> -                            bool zero)
>> +static void pmu_format_pack(unsigned long *format, __u64 value, __u64 *v,
>> +                           bool zero)
>>   {
>>          unsigned long fbit, vbit;
>>
>> @@ -1595,23 +1650,23 @@ static int pmu_config_term(const struct perf_pmu *pmu,
>>                  switch (term->type_term) {
>>                  case PARSE_EVENTS__TERM_TYPE_CONFIG:
>>                          assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
>> -                       pmu_format_value(bits, term->val.num, &attr->config, zero);
>> +                       pmu_format_pack(bits, term->val.num, &attr->config, zero);
>>                          break;
>>                  case PARSE_EVENTS__TERM_TYPE_CONFIG1:
>>                          assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
>> -                       pmu_format_value(bits, term->val.num, &attr->config1, zero);
>> +                       pmu_format_pack(bits, term->val.num, &attr->config1, zero);
>>                          break;
>>                  case PARSE_EVENTS__TERM_TYPE_CONFIG2:
>>                          assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
>> -                       pmu_format_value(bits, term->val.num, &attr->config2, zero);
>> +                       pmu_format_pack(bits, term->val.num, &attr->config2, zero);
>>                          break;
>>                  case PARSE_EVENTS__TERM_TYPE_CONFIG3:
>>                          assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
>> -                       pmu_format_value(bits, term->val.num, &attr->config3, zero);
>> +                       pmu_format_pack(bits, term->val.num, &attr->config3, zero);
>>                          break;
>>                  case PARSE_EVENTS__TERM_TYPE_CONFIG4:
>>                          assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
>> -                       pmu_format_value(bits, term->val.num, &attr->config4, zero);
>> +                       pmu_format_pack(bits, term->val.num, &attr->config4, zero);
>>                          break;
>>                  case PARSE_EVENTS__TERM_TYPE_LEGACY_HARDWARE_CONFIG:
>>                          assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
>> @@ -1749,7 +1804,7 @@ static int pmu_config_term(const struct perf_pmu *pmu,
>>                   */
>>          }
>>
>> -       pmu_format_value(format->bits, val, vp, zero);
>> +       pmu_format_pack(format->bits, val, vp, zero);
>>          return 0;
>>   }
>>
>>
>> --
>> 2.34.1
>>


