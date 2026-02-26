Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41984FD8FD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rtJDN0QD5O7aAyBkCBa5nhSWzf8i+UFfCGfyhfbtmg=; b=TVgtNSJG1viswm9HQR5UF01XGA
	YVgrKpGpuDwyk3QWKYYibq2lfslJS5w8Smn5o1otK6s8DTaF72WFa87W3pdtMUrReT6Up1Tz9EgSP
	BjWQlIthh1ZKA7ubrmtSPDm/NzIVGkjGAidw8GEKAOLlkPVzq/VN1FC3MZWxVADL3UPIH3xDjwZDt
	dVRsulny1r8cq8MVnB/zsr/HsDnekdguEurU8xs3yishAGwJfXrDawnLbiB1+zCICyclm8LvdsPV8
	/Q+KWGlLb9eV8WuadmMcu58KuBYglfKThxoIdGxtdrgXK6iKkXl1A7t/KDpJGzcbmBUSGNb3qGD1y
	Zi3A1SFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvedS-00000006mnP-48Fd;
	Thu, 26 Feb 2026 16:54:47 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvedP-00000006mmz-3rOl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 16:54:45 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-126ea4e9697so9553c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 08:54:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772124883; cv=none;
        d=google.com; s=arc-20240605;
        b=TbqorYzijZ9L0Qj8GILlTFpGyrOSJcVF99ehYqMGwAyNdoQbV6mfDcH+YkEMOlMtHK
         JnMP/rqLiQ5VmgTXutUiFUs8WM3tI5qMxRGzkBeKT8nbQ+bUDInNnZ6odAukSUzapsRm
         mVaAIe7bInIShK9PFVXBvf8Gqfuwxw3XU3V6Bq0lT8SqCtGqpgIptDT3QWMoAv7WYTQt
         iehDzgv0wjQqiZq7CeGFbu8Ki/lfLF/dN5jVHSK4yMayGbS/Chsta6+eDyp9Pq1It01v
         JBQy4Nj60DAii4rkVX+bktupCVM5KRolqfoT7ja/FQUBrfaKydM+aNz4OhNHrMij312y
         KuYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4rtJDN0QD5O7aAyBkCBa5nhSWzf8i+UFfCGfyhfbtmg=;
        fh=Lk53iMy3lw1I3/beAX78Lj7hY8afDrptKSsxzYFbjlQ=;
        b=goODMllgJzi4nayv8MI6T/gykmqQHI+v9EU1Q4RKXgf/qAuxutcQuEWmY/q8SNS4Mf
         0aTgPjx0a7giwchT33sc2I3Oo1Galhf3T5ykrW3V8oNku5Jk/Vtsu6eZC2m5Ghtcvo81
         bEYNW5EXNu1ooubHOWy9jdQsNZ1xQJR6wXe1JdzbPIYMvVMCQ0KqvJtDZWLT8UqBl2HI
         fJIg892TdOhT09i+MphW7P8LAmdbjl/VGmjRfYSWxzWOs6G8tXPMvtiB1EoSywkABftQ
         8SMTplK/lf16WVKYfexYUG+nJgn3LIUS+bDJawZyKVwMrelrJl6Hbml8FYnFZXQgZjfd
         UViQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772124883; x=1772729683; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rtJDN0QD5O7aAyBkCBa5nhSWzf8i+UFfCGfyhfbtmg=;
        b=wSauR34zCwV5TgXTEoxpgK1HKBa5v4hcX4BLCJIJKf5BI39tyYlFSux0EQQO4qDwU4
         iDmhFkKBcgo3wNrGGXdWiHKXG8YuxsaxMQTFA3Dynnij1cyoAkgS65Z6LOjqSPV2KN+8
         Cntus9DwUNp+4XWXC4b3w2b9H1nkTol5Wd9SXGoHH+YU+dKeTrihsGSP4qlJbyA2u88t
         p4aSZwMSC15QtCs7skHmxBFsST6zB6jxmbF6uiTo3S/iKejqSnlwbfOBOfYPnvpR0luG
         cYHq83ltVjXvwCaRsYTuVw9rz7xK+4oqpP3Mbgrs/JsAFU4Us+OqXFfRulnfabJWe97F
         ZDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772124883; x=1772729683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4rtJDN0QD5O7aAyBkCBa5nhSWzf8i+UFfCGfyhfbtmg=;
        b=hl1wyDrP2G9mcXgs1gu6XcjbBuQVNViiV7cff8FZVxi/2J+1k1lhx57UglS2I4ktGd
         fmNTnqgANbod8M82KxA9gvakzLezHBeZsxg5gUzidke6pRA4wC3xt79/CwjO+7Nz+0SN
         rc3aD9pXmQiz3Tg7wkkoDUJB9UObK8jJCIoz5hiwbvu1P64DQNG4K7sQwArfpQpJAcx5
         PoEYGenoqlZxIw3YdgKEaj9Ac9Iqdw2jAZj8ID+S0ys9G7fUNJjYcQG0pN3v+MEIdBHU
         FjCwmaxB3ozlUPFISm2OOO/wE40LDaMWHvXxHxnJ2ytlOHNPCtam9Pl4UHhj0Yp+M2t5
         lL6w==
X-Forwarded-Encrypted: i=1; AJvYcCWp1hDbLNX3UJvwoiPuRVxPG4+g1zQooWj5h9AyccWdaqFUZZcQka9ZYIOfzDxB6jsOAUh8iWt8ae+m0XqrEWW+@lists.infradead.org
X-Gm-Message-State: AOJu0YxneCxW1HAC4dMLboYMifjWl7iCKNIaxlthIksVA0GHR+OdwjnP
	aZNBs5YEvkWkP2uVvgcoizgbdEfI0PE9cPKbCCgv7GuMJ8I4SjGRIz6udG19C8xISU4OuCX9x8M
	j5X2dBKiWTYmab1wyIobu7RXGgywnZAGpaUChLLCV
X-Gm-Gg: ATEYQzwd7IalbimqnPVzNNVYZ1Obw68/Z4nzZQg19g1LK32Q8G1vUSir9CKcS2W0yGU
	N6PZjIfD0Em7lyojkrAwQ6pgOjiMUFXBjMG2f1i6HAZkz+DRJiBCdCINZlsy+X681m0eOzF+wAw
	ozxXxk5nIAemM9NsAXr1FZAa2vOJWo/2zvZpYqtK7ghRCYsB88Y9EUO9p77JS0fwZPEXmzfImZ2
	EDYITGId/6Qw5oqnbeo8i3uhHwbZ1XKyz26CvuW2XG+hUZ59eKgY5wzxY0eJjonDxu9l76bY57L
	GkxE3j3F1etyH9huDskfCDw7JkV//YTPyH69
X-Received: by 2002:a05:7022:a93:b0:11a:b4dc:7773 with SMTP id
 a92af1059eb24-12788f9e86dmr202866c88.12.1772124882303; Thu, 26 Feb 2026
 08:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20260226045301.459948-1-irogers@google.com> <20260226045301.459948-7-irogers@google.com>
 <fd7649cf-d436-47ab-a7b9-eb5e915fce05@linux.intel.com>
In-Reply-To: <fd7649cf-d436-47ab-a7b9-eb5e915fce05@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 26 Feb 2026 08:54:30 -0800
X-Gm-Features: AaiRm53pNUx05GWj0EESJ8Q5p1ojVkmfoDxCXb6YAlNkCCXM_Kl_64KH1H56iQs
Message-ID: <CAP-5=fUMXAd5m95qUEe9NoTr8Q655U5050SdG70Gw+P_vvwfig@mail.gmail.com>
Subject: Re: [PATCH v1 07/10] perf vendor events intel: Update lunarlake
 events from 1.18 to 1.20
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_085444_017755_74ADFFF8 
X-CRM114-Status: GOOD (  20.61  )
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

On Wed, Feb 25, 2026 at 11:20=E2=80=AFPM Mi, Dapeng <dapeng1.mi@linux.intel=
.com> wrote:
>
> It seems a typo in the shortlog, it should be meteorlake instead of
> lunarlake. :)

You're right, wil fix in v2.

Thanks,
Ian

>
> On 2/26/2026 12:52 PM, Ian Rogers wrote:
> > The updated events were published in:
> > https://github.com/intel/perfmon/commit/2eebd8e2612a0655e82b88e1d2fab96=
0315c025b
> > https://github.com/intel/perfmon/commit/81c4ce2c16f05b839d2c40e8cf183ed=
110357b73
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/pmu-events/arch/x86/mapfile.csv    |  2 +-
> >  .../pmu-events/arch/x86/meteorlake/cache.json | 67 ++++++++++++++++---
> >  .../arch/x86/meteorlake/frontend.json         | 18 +++++
> >  .../arch/x86/meteorlake/pipeline.json         | 46 +++++++++++--
> >  4 files changed, 116 insertions(+), 17 deletions(-)
> >
> > diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pm=
u-events/arch/x86/mapfile.csv
> > index a2dde3faad5e..8d8fd8b08166 100644
> > --- a/tools/perf/pmu-events/arch/x86/mapfile.csv
> > +++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
> > @@ -23,7 +23,7 @@ GenuineIntel-6-3E,v24,ivytown,core
> >  GenuineIntel-6-2D,v24,jaketown,core
> >  GenuineIntel-6-(57|85),v16,knightslanding,core
> >  GenuineIntel-6-BD,v1.21,lunarlake,core
> > -GenuineIntel-6-(AA|AC|B5),v1.18,meteorlake,core
> > +GenuineIntel-6-(AA|AC|B5),v1.20,meteorlake,core
> >  GenuineIntel-6-1[AEF],v4,nehalemep,core
> >  GenuineIntel-6-2E,v4,nehalemex,core
> >  GenuineIntel-6-CC,v1.02,pantherlake,core
> > diff --git a/tools/perf/pmu-events/arch/x86/meteorlake/cache.json b/too=
ls/perf/pmu-events/arch/x86/meteorlake/cache.json
> > index d3fc04b2ffbd..4c1220c19456 100644
> > --- a/tools/perf/pmu-events/arch/x86/meteorlake/cache.json
> > +++ b/tools/perf/pmu-events/arch/x86/meteorlake/cache.json
> > @@ -513,6 +513,15 @@
> >          "UMask": "0x6",
> >          "Unit": "cpu_atom"
> >      },
> > +    {
> > +        "BriefDescription": "Counts the number of unhalted cycles when=
 the core is stalled due to an ICACHE or ITLB miss which hit in the LLC, no=
 snoop was required. LLC provides the data. If the core has access to an L3=
 cache, an LLC hit refers to an L3 cache hit, otherwise it counts zeros.",
> > +        "Counter": "0,1,2,3,4,5,6,7",
> > +        "EventCode": "0x35",
> > +        "EventName": "MEM_BOUND_STALLS_IFETCH.LLC_HIT_NOSNOOP",
> > +        "SampleAfterValue": "1000003",
> > +        "UMask": "0x2",
> > +        "Unit": "cpu_atom"
> > +    },
> >      {
> >          "BriefDescription": "Counts the number of unhalted cycles when=
 the core is stalled due to an ICACHE or ITLB miss which missed all the cac=
hes. If the core has access to an L3 cache, an LLC miss refers to an L3 cac=
he miss, otherwise it is an L2 cache miss.",
> >          "Counter": "0,1,2,3,4,5,6,7",
> > @@ -522,6 +531,15 @@
> >          "UMask": "0x78",
> >          "Unit": "cpu_atom"
> >      },
> > +    {
> > +        "BriefDescription": "Counts the number of unhalted cycles when=
 the core is stalled due to an ICACHE or ITLB miss which missed all the cac=
hes. DRAM, MMIO or other LOCAL memory type provides the data. If the core h=
as access to an L3 cache, an LLC miss refers to an L3 cache miss, otherwise=
 it is an L2 cache miss.",
> > +        "Counter": "0,1,2,3,4,5,6,7",
> > +        "EventCode": "0x35",
> > +        "EventName": "MEM_BOUND_STALLS_IFETCH.LLC_MISS_LOCALMEM",
> > +        "SampleAfterValue": "1000003",
> > +        "UMask": "0x50",
> > +        "Unit": "cpu_atom"
> > +    },
> >      {
> >          "BriefDescription": "Counts the number of unhalted cycles when=
 the core is stalled due to an L1 demand load miss.",
> >          "Counter": "0,1,2,3,4,5,6,7",
> > @@ -559,6 +577,24 @@
> >          "UMask": "0x6",
> >          "Unit": "cpu_atom"
> >      },
> > +    {
> > +        "BriefDescription": "Counts the number of unhalted cycles when=
 the core is stalled due to a demand load miss which hit in the LLC, no sno=
op was required. LLC provides the data. If the core has access to an L3 cac=
he, an LLC hit refers to an L3 cache hit, otherwise it counts zeros.",
> > +        "Counter": "0,1,2,3,4,5,6,7",
> > +        "EventCode": "0x34",
> > +        "EventName": "MEM_BOUND_STALLS_LOAD.LLC_HIT_NOSNOOP",
> > +        "SampleAfterValue": "1000003",
> > +        "UMask": "0x2",
> > +        "Unit": "cpu_atom"
> > +    },
> > +    {
> > +        "BriefDescription": "Counts the number of unhalted cycles when=
 the core is stalled due to a demand load miss which hit in the LLC, a snoo=
p was required, the snoop misses or the snoop hits but NO_FWD. LLC provides=
 the data. If the core has access to an L3 cache, an LLC hit refers to an L=
3 cache hit, otherwise it counts zeros.",
> > +        "Counter": "0,1,2,3,4,5,6,7",
> > +        "EventCode": "0x34",
> > +        "EventName": "MEM_BOUND_STALLS_LOAD.LLC_HIT_SNOOP",
> > +        "SampleAfterValue": "1000003",
> > +        "UMask": "0x4",
> > +        "Unit": "cpu_atom"
> > +    },
> >      {
> >          "BriefDescription": "Counts the number of unhalted cycles when=
 the core is stalled due to a demand load miss which missed all the local c=
aches. If the core has access to an L3 cache, an LLC miss refers to an L3 c=
ache miss, otherwise it is an L2 cache miss.",
> >          "Counter": "0,1,2,3,4,5,6,7",
> > @@ -568,6 +604,15 @@
> >          "UMask": "0x78",
> >          "Unit": "cpu_atom"
> >      },
> > +    {
> > +        "BriefDescription": "Counts the number of unhalted cycles when=
 the core is stalled to a demand load miss and the data was provided from a=
n unknown source. If the core has access to an L3 cache, an LLC miss refers=
 to an L3 cache miss, otherwise it is an L2 cache miss.",
> > +        "Counter": "0,1,2,3,4,5,6,7",
> > +        "EventCode": "0x34",
> > +        "EventName": "MEM_BOUND_STALLS_LOAD.LLC_MISS_LOCALMEM",
> > +        "SampleAfterValue": "1000003",
> > +        "UMask": "0x50",
> > +        "Unit": "cpu_atom"
> > +    },
> >      {
> >          "BriefDescription": "Counts the number of unhalted cycles when=
 the core is stalled to a store buffer full condition",
> >          "Counter": "0,1,2,3,4,5,6,7",
> > @@ -969,7 +1014,7 @@
> >          "Unit": "cpu_atom"
> >      },
> >      {
> > -        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESH=
OLD - Only counts with PEBS enabled.",
> > +        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold of 1024. Only counts with PEBS enabl=
ed.",
> >          "Counter": "0,1",
> >          "Data_LA": "1",
> >          "EventCode": "0xd0",
> > @@ -981,7 +1026,7 @@
> >          "Unit": "cpu_atom"
> >      },
> >      {
> > -        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESH=
OLD - Only counts with PEBS enabled.",
> > +        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold of 128. Only counts with PEBS enable=
d.",
> >          "Counter": "0,1",
> >          "Data_LA": "1",
> >          "EventCode": "0xd0",
> > @@ -993,7 +1038,7 @@
> >          "Unit": "cpu_atom"
> >      },
> >      {
> > -        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESH=
OLD - Only counts with PEBS enabled.",
> > +        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold of 16. Only counts with PEBS enabled=
.",
> >          "Counter": "0,1",
> >          "Data_LA": "1",
> >          "EventCode": "0xd0",
> > @@ -1005,7 +1050,7 @@
> >          "Unit": "cpu_atom"
> >      },
> >      {
> > -        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESH=
OLD - Only counts with PEBS enabled.",
> > +        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold of 2048. Only counts with PEBS enabl=
ed.",
> >          "Counter": "0,1",
> >          "Data_LA": "1",
> >          "EventCode": "0xd0",
> > @@ -1017,7 +1062,7 @@
> >          "Unit": "cpu_atom"
> >      },
> >      {
> > -        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESH=
OLD - Only counts with PEBS enabled.",
> > +        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold of 256. Only counts with PEBS enable=
d.",
> >          "Counter": "0,1",
> >          "Data_LA": "1",
> >          "EventCode": "0xd0",
> > @@ -1029,7 +1074,7 @@
> >          "Unit": "cpu_atom"
> >      },
> >      {
> > -        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESH=
OLD - Only counts with PEBS enabled.",
> > +        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold of 32. Only counts with PEBS enabled=
.",
> >          "Counter": "0,1",
> >          "Data_LA": "1",
> >          "EventCode": "0xd0",
> > @@ -1041,7 +1086,7 @@
> >          "Unit": "cpu_atom"
> >      },
> >      {
> > -        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESH=
OLD - Only counts with PEBS enabled.",
> > +        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold of 4. Only counts with PEBS enabled.=
",
> >          "Counter": "0,1",
> >          "Data_LA": "1",
> >          "EventCode": "0xd0",
> > @@ -1053,7 +1098,7 @@
> >          "Unit": "cpu_atom"
> >      },
> >      {
> > -        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESH=
OLD - Only counts with PEBS enabled.",
> > +        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold of 512. Only counts with PEBS enable=
d.",
> >          "Counter": "0,1",
> >          "Data_LA": "1",
> >          "EventCode": "0xd0",
> > @@ -1065,7 +1110,7 @@
> >          "Unit": "cpu_atom"
> >      },
> >      {
> > -        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESH=
OLD - Only counts with PEBS enabled.",
> > +        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold of 64. Only counts with PEBS enabled=
.",
> >          "Counter": "0,1",
> >          "Data_LA": "1",
> >          "EventCode": "0xd0",
> > @@ -1077,7 +1122,7 @@
> >          "Unit": "cpu_atom"
> >      },
> >      {
> > -        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold defined in MEC_CR_PEBS_LD_LAT_THRESH=
OLD - Only counts with PEBS enabled.",
> > +        "BriefDescription": "Counts the number of tagged load uops ret=
ired that exceed the latency threshold of 8. Only counts with PEBS enabled.=
",
> >          "Counter": "0,1",
> >          "Data_LA": "1",
> >          "EventCode": "0xd0",
> > @@ -1159,7 +1204,7 @@
> >          "Unit": "cpu_atom"
> >      },
> >      {
> > -        "BriefDescription": "Counts the number of  stores uops retired=
 same as MEM_UOPS_RETIRED.ALL_STORES",
> > +        "BriefDescription": "Counts the number of stores uops retired.=
",
> >          "Counter": "0,1,2,3,4,5,6,7",
> >          "Data_LA": "1",
> >          "EventCode": "0xd0",
> > diff --git a/tools/perf/pmu-events/arch/x86/meteorlake/frontend.json b/=
tools/perf/pmu-events/arch/x86/meteorlake/frontend.json
> > index 6484834b1127..dcf8c8e720f3 100644
> > --- a/tools/perf/pmu-events/arch/x86/meteorlake/frontend.json
> > +++ b/tools/perf/pmu-events/arch/x86/meteorlake/frontend.json
> > @@ -430,6 +430,24 @@
> >          "UMask": "0x4",
> >          "Unit": "cpu_core"
> >      },
> > +    {
> > +        "BriefDescription": "ICACHE_TAG.STALLS_INUSE",
> > +        "Counter": "0,1,2,3",
> > +        "EventCode": "0x83",
> > +        "EventName": "ICACHE_TAG.STALLS_INUSE",
> > +        "SampleAfterValue": "200003",
> > +        "UMask": "0x10",
> > +        "Unit": "cpu_core"
> > +    },
> > +    {
> > +        "BriefDescription": "ICACHE_TAG.STALLS_ISB",
> > +        "Counter": "0,1,2,3",
> > +        "EventCode": "0x83",
> > +        "EventName": "ICACHE_TAG.STALLS_ISB",
> > +        "SampleAfterValue": "200003",
> > +        "UMask": "0x8",
> > +        "Unit": "cpu_core"
> > +    },
> >      {
> >          "BriefDescription": "Cycles Decode Stream Buffer (DSB) is deli=
vering any Uop",
> >          "Counter": "0,1,2,3",
> > diff --git a/tools/perf/pmu-events/arch/x86/meteorlake/pipeline.json b/=
tools/perf/pmu-events/arch/x86/meteorlake/pipeline.json
> > index bfdaabe9377d..7662846745bd 100644
> > --- a/tools/perf/pmu-events/arch/x86/meteorlake/pipeline.json
> > +++ b/tools/perf/pmu-events/arch/x86/meteorlake/pipeline.json
> > @@ -517,7 +517,7 @@
> >          "Unit": "cpu_core"
> >      },
> >      {
> > -        "BriefDescription": "Fixed Counter: Counts the number of unhal=
ted core clock cycles",
> > +        "BriefDescription": "Fixed Counter: Counts the number of unhal=
ted core clock cycles. [This event is alias to CPU_CLK_UNHALTED.THREAD]",
> >          "Counter": "Fixed counter 1",
> >          "EventName": "CPU_CLK_UNHALTED.CORE",
> >          "SampleAfterValue": "2000003",
> > @@ -583,7 +583,7 @@
> >          "Unit": "cpu_core"
> >      },
> >      {
> > -        "BriefDescription": "Fixed Counter: Counts the number of unhal=
ted reference clock cycles",
> > +        "BriefDescription": "Fixed Counter: Counts the number of unhal=
ted reference clock cycles.",
> >          "Counter": "Fixed counter 2",
> >          "EventName": "CPU_CLK_UNHALTED.REF_TSC",
> >          "SampleAfterValue": "2000003",
> > @@ -620,7 +620,7 @@
> >          "Unit": "cpu_core"
> >      },
> >      {
> > -        "BriefDescription": "Fixed Counter: Counts the number of unhal=
ted core clock cycles",
> > +        "BriefDescription": "Fixed Counter: Counts the number of unhal=
ted core clock cycles. [This event is alias to CPU_CLK_UNHALTED.CORE]",
> >          "Counter": "Fixed counter 1",
> >          "EventName": "CPU_CLK_UNHALTED.THREAD",
> >          "SampleAfterValue": "2000003",
> > @@ -804,10 +804,10 @@
> >          "Unit": "cpu_core"
> >      },
> >      {
> > -        "BriefDescription": "Fixed Counter: Counts the number of instr=
uctions retired",
> > +        "BriefDescription": "Fixed Counter: Counts the number of instr=
uctions retired.",
> >          "Counter": "Fixed counter 0",
> >          "EventName": "INST_RETIRED.ANY",
> > -        "PublicDescription": "Fixed Counter: Counts the number of inst=
ructions retired Available PDIST counters: 32",
> > +        "PublicDescription": "Fixed Counter: Counts the number of inst=
ructions retired. Available PDIST counters: 32",
> >          "SampleAfterValue": "2000003",
> >          "UMask": "0x1",
> >          "Unit": "cpu_atom"
> > @@ -1207,6 +1207,42 @@
> >          "UMask": "0x20",
> >          "Unit": "cpu_core"
> >      },
> > +    {
> > +        "BriefDescription": "Counts the number of CLFLUSH, CLWB, and C=
LDEMOTE instructions retired.",
> > +        "Counter": "0,1,2,3,4,5,6,7",
> > +        "EventCode": "0xe0",
> > +        "EventName": "MISC_RETIRED1.CL_INST",
> > +        "SampleAfterValue": "1000003",
> > +        "UMask": "0xff",
> > +        "Unit": "cpu_atom"
> > +    },
> > +    {
> > +        "BriefDescription": "Counts the number of LFENCE instructions =
retired.",
> > +        "Counter": "0,1,2,3,4,5,6,7",
> > +        "EventCode": "0xe0",
> > +        "EventName": "MISC_RETIRED1.LFENCE",
> > +        "SampleAfterValue": "1000003",
> > +        "UMask": "0x2",
> > +        "Unit": "cpu_atom"
> > +    },
> > +    {
> > +        "BriefDescription": "Counts the number of accesses to KeyLocke=
r cache.",
> > +        "Counter": "0,1,2,3,4,5,6,7",
> > +        "EventCode": "0xe1",
> > +        "EventName": "MISC_RETIRED2.KEYLOCKER_ACCESS",
> > +        "SampleAfterValue": "1000003",
> > +        "UMask": "0x10",
> > +        "Unit": "cpu_atom"
> > +    },
> > +    {
> > +        "BriefDescription": "Counts the number of misses to KeyLocker =
cache.",
> > +        "Counter": "0,1,2,3,4,5,6,7",
> > +        "EventCode": "0xe1",
> > +        "EventName": "MISC_RETIRED2.KEYLOCKER_MISS",
> > +        "SampleAfterValue": "1000003",
> > +        "UMask": "0x11",
> > +        "Unit": "cpu_atom"
> > +    },
> >      {
> >          "BriefDescription": "Cycles stalled due to no store buffers av=
ailable. (not including draining form sync).",
> >          "Counter": "0,1,2,3,4,5,6,7",

