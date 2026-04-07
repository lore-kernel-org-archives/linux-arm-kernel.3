Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12EDFF5130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 18:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLHmsMCJJe8XmVabY7ZwaMsB0JIhJoLXXK2dqS8qMgQ=; b=fPrdAyEC5HzaHFLrzuxTXlyMm8
	KEXXN52THyY9jvkqxdlAa3fh/j2hdDmQUpviqNK2HLd19msT3rsh8U3FNUAmN5Mvb2LLEtovP6sRh
	o57yQbcEYyg5ZTA5V1d3WpNFhyunhL7+q8YlyPl+fLHxvzdgZ+aU3pv3rMmpew2ntpqsTusriTE5E
	sBnwElLStVAoJYBv1ooZ6JjrHgSvIIRgltEJbDueiA1slr/InmKW5ofOX+R/EyPMiQaYdEbatKewK
	dgQcukVFCyrUciDpeGVMsUEn4reQkZlP8qiBKZ9X5uX0TP41awEM3VT14KTN0CT22abqTaGmBtQWU
	CGCZh4Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAB8o-00000006z62-2XFF;
	Tue, 07 Apr 2026 18:27:10 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAB8m-00000006z44-1Nqh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 18:27:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2b0b260d309so11395ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 11:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775586426; cv=none;
        d=google.com; s=arc-20240605;
        b=LE24pzF+/Unv4BAI4I/J9aKEj1Ee1Mr/SbUJgsV1QVxthnYo2aGFJXFO+5as84QXhl
         e0/HMibxfil4Yef1MHwBBJYj4/fQRuqD3F0udTCoqIdZDEekpxKU5RC3R/CRpUUXhsHf
         dXwc7NNIVw1hU9Cgg9HYVOXtlp0JhL2y7/JQLmGt9uHKU3TOgaT84jb//MW2pROs0aL/
         0JOLzUdQwAOTA8knDZzgSi+nsLXEwPqMuH3kMYtu3ZsDaPj5ZWPoNXvkRWAv3+b5xLUf
         A7hCab5F2efYyB+QwA5T/8OHRjwb9S1GkK9cvTebVCxHKJIxV18TG2BDIHH8Zs9fvM0Q
         NVIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QLHmsMCJJe8XmVabY7ZwaMsB0JIhJoLXXK2dqS8qMgQ=;
        fh=jpdbJCbnEaAyUse9H2kLJ9W6gWv+AIo8wbP+fW/E1kc=;
        b=ehiqqcO5jq4eKhqE2skNmew6ar8SNIyPKumAP+MLCwpm3Sz0FVBdtW4AK3tMkADCrB
         ygYs42hMsN7/sl8FZIHrknnROE/my/t9oD5cpYiq7DUSHt2UJxgYkiv5nLDs0zoDKJ4y
         u3mlUZPy2Ic+5ne37VW12t/vGSL4o84rQpIpnd89Xhm3i282JgRz/afBbqPEjFZxgZCc
         dLkRpa2gNmSMt4TzeXi8p+ZRnvODJUx44kO0tcbNIHsZ8GR9SLkoZLXgxt+aY8j78djZ
         5V6UJ0QSLQjLPPX5hw3cZ8kwvo11p4nwLH4Wnd6oO29dd4LbJJZeMlggQnBh50BTe8m5
         Jx4w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775586426; x=1776191226; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLHmsMCJJe8XmVabY7ZwaMsB0JIhJoLXXK2dqS8qMgQ=;
        b=hptBVPph+7wzcGsfnno/7k5IJKRdgsUP3H3jyZjp/LL0gJ+Q01B+zFzwJ19PAMvbXp
         izI3Y0XMQgjSO38HXgzVFbQz979foZLUcAit2zZml5j1vMJzRsybN+4v+fTRlvjnqMw8
         OTca1R8nHMopWrjpieg3YS1svyMazDNhWF0aBKCaF8HE+cfrP1UQ3YTNOHw4PUN56F3Z
         NrPJh+4XtpeAxLRDc3GUV5/IzXyyvo4NBsEc82MyjeqenjHN52rAVxTTsT42LoaInYJV
         hg4+LCNlq2Ekq8NXI3dyLTufSP4J3SiQOiBzofIibxTlsMM8vb4qKreGo7TLBA9QzxGS
         1qyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775586426; x=1776191226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QLHmsMCJJe8XmVabY7ZwaMsB0JIhJoLXXK2dqS8qMgQ=;
        b=C1v7yO2mur1Fg2sscypyv6kpRp5+XfKIWO4wFwfABs9UB9JT+f7R6cBxKKaBT+BSFa
         dmRi9S90pusuFD1VMIxFE+8F3/yjiIz/lUZjNxzMEsunGteGlTkdRElTiQce4VgcRopo
         x+OZJo0CczMW3+cq+ZeHuX7SC9e4XOShZztba7MkyshP7VMP8KDNHId7tGsOXkpkgatk
         TWZo+c97HtskB1KOPfPJPY3CGBv9WdYLXb3afmcPUhXZOKM9FIb93hlQJRM9Syv2NDiX
         8Vq6t/x2hQYyJbe3B5q+Pd61n+LrFEI0ejRC/KuvbffuYnyT0jrrWvUKmEJcv2jMSpXv
         b01Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+SO3Qi0gAWi6hmlkWdr3ckm5ox9c/kh8GLpt9SramCtP0Y+5R1UBGBVektxOebdBJ/J5MamQD7CRyCnYZ47Ww@lists.infradead.org
X-Gm-Message-State: AOJu0Yw18gqKheNrmuFALeyMgZTkXQX8WcW7fUbhNISCb4wmda3EXSCN
	vveAWSTKIYSlc/KRZMaTtXsmBu61dYJqFISUQ1EvujQ7L7V63llAIt++qrU8tEqF91jEnKulksL
	enrO+jysOWOoovTuJfyE3Y6lsbtavjzwdrXmTtDIu
X-Gm-Gg: AeBDievPuDudaHS9TKNWfu6Cu7y2ZZPwyHPY1EGzY1qRxizDK6kToyuZmsVJCvE0ntw
	PBfrIP1xCE7GQ7ZCZluLfvUGq39iZtl15S09emRQe1RxOEWJQY39YtNDd+37EgIJlO+SwE8NLRf
	bpQMDClDMr5yJfPmImooJW75oFNZml/Hs5DWxmZu6m2yyoJvUArm6gkX12PWjllIEs0E73XJC1u
	eHRB86C6FhjyvO/haa/Bb3/0zpg6PxpL+A1tKVLLUYiQYisNxYjhXqqKqFdEwMAIHa/GLHmc+sO
	Hus9iTtSzLFjv0zfqQ3wwJ6nqqHugzuuGuW5
X-Received: by 2002:a17:902:f647:b0:2ae:80a3:98a9 with SMTP id
 d9443c01a7336-2b283fc0f40mr10621745ad.11.1775586425493; Tue, 07 Apr 2026
 11:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
 <20260401-james-spe-impdef-decode-v1-3-ad0d372c220c@linaro.org>
 <CAP-5=fVcYOJ_3TWd6won5FVaH2MH6QwLhCoCRnNzzeE-9PgO1Q@mail.gmail.com> <ee012f48-5d08-4004-b9d0-bcac825cb50c@linaro.org>
In-Reply-To: <ee012f48-5d08-4004-b9d0-bcac825cb50c@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 7 Apr 2026 11:26:53 -0700
X-Gm-Features: AQROBzCtdbFVyiAJhRZRvQJQgMdNiTWsARZ6zUAs6UuK9VaYot6HRhem4OrrgwU
Message-ID: <CAP-5=fXNb50wXT3YH0i=-U8bXwizzH4bv8EL8mC9BMQE0Anp9Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] perf arm_spe: Decode Arm N1 IMPDEF events
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_112708_385841_850744F4 
X-CRM114-Status: GOOD (  43.71  )
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

On Tue, Apr 7, 2026 at 5:35=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
>
>
> On 02/04/2026 4:26 pm, Ian Rogers wrote:
> > On Wed, Apr 1, 2026 at 7:26=E2=80=AFAM James Clark <james.clark@linaro.=
org> wrote:
> >>
> >>  From the TRM [1], N1 has one IMPDEF event which isn't covered by the
> >> common list. Add a framework so that more cores can be added in the
> >> future and that the N1 IMPDEF event can be decoded. Also increase the
> >> size of the buffer because we're adding more strings and if it gets
> >> truncated it falls back to a hex dump only.
> >>
> >> [1]: https://developer.arm.com/documentation/100616/0401/Statistical-P=
rofiling-Extension/implementation-defined-features-of-SPE
> >> Suggested-by: Al Grant <al.grant@arm.com>
> >> Signed-off-by: James Clark <james.clark@linaro.org>
> >> ---
> >>   tools/perf/util/arm-spe-decoder/Build              |  2 +
> >>   .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 45 ++++++++++++=
++++++++--
> >>   .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     |  5 ++-
> >>   tools/perf/util/arm-spe.c                          | 13 ++++---
> >>   4 files changed, 54 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/tools/perf/util/arm-spe-decoder/Build b/tools/perf/util/a=
rm-spe-decoder/Build
> >> index ab500e0efe24..97a298d1e279 100644
> >> --- a/tools/perf/util/arm-spe-decoder/Build
> >> +++ b/tools/perf/util/arm-spe-decoder/Build
> >> @@ -1 +1,3 @@
> >>   perf-util-y +=3D arm-spe-pkt-decoder.o arm-spe-decoder.o
> >> +
> >> +CFLAGS_arm-spe-pkt-decoder.o +=3D -I$(srctree)/tools/arch/arm64/inclu=
de/ -I$(OUTPUT)arch/arm64/include/generated/
> >> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/t=
ools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> >> index c880b0dec3a1..42a7501d4dfe 100644
> >> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> >> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> >> @@ -15,6 +15,8 @@
> >>
> >>   #include "arm-spe-pkt-decoder.h"
> >>
> >> +#include "../../arm64/include/asm/cputype.h"
> >
> > Sashiko spotted:
> > https://sashiko.dev/#/patchset/20260401-james-spe-impdef-decode-v1-0-ad=
0d372c220c%40linaro.org
> > """
> > This isn't a bug, but does this include directive rely on accidental
> > path normalization?
> >
> > The relative path ../../arm64/include/asm/cputype.h does not exist rela=
tive
> > to arm-spe-pkt-decoder.c. It only compiles because the Build file adds
> > -I$(srctree)/tools/arch/arm64/include/ to CFLAGS.
> >
> > Would it be cleaner to use #include <asm/cputype.h> to explicitly rely =
on
> > the include path?
> > [ ... ]
> > """
> > I wouldn't use <asm/cputype.h> due to cross-compilation and the like,
> > instead just add the extra "../" into the include path.
> >
>
> Do you mean change the #include to this?
>
>    #include "../../../arm64/include/asm/cputype.h"
>
> I still need to add:
>
>    CFLAGS_arm-spe-pkt-decoder.o +=3D -I$(srctree)/tools/arch/arm64/includ=
e/
>
> To make the this include in cputype.h work:
>
>    #include <asm/sysreg.h>
>
> Which probably only works because there isn't a sysreg.h on other
> architectures. But I'm not sure what the significance of ../../ vs
> ../../../ is if either compile? arm-spe.c already does it with ../../
> which is what I copied.

Hmm.. maybe the path should be
"../../../arch/arm64/include/asm/cputype.h". The include preference is
for a path relative to the source file and
../../arm64/include/asm/cputype.h doesn't exist. It is kind of horrid
to add an include path and then use a relative path to escape into a
higher-level directory. arm-spe.c is a little different as it is one
directory higher in the directory layout.

Thanks,
Ian

> >> +
> >>   static const char * const arm_spe_packet_name[] =3D {
> >>          [ARM_SPE_PAD]           =3D "PAD",
> >>          [ARM_SPE_END]           =3D "END",
> >> @@ -307,6 +309,11 @@ static const struct ev_string common_ev_strings[]=
 =3D {
> >>          { .event =3D 0, .desc =3D NULL },
> >>   };
> >>
> >> +static const struct ev_string n1_event_strings[] =3D {
> >> +       { .event =3D 12, .desc =3D "LATE-PREFETCH" },
> >> +       { .event =3D 0, .desc =3D NULL },
> >> +};
> >> +
> >>   static u64 print_event_list(int *err, char **buf, size_t *buf_len,
> >>                              const struct ev_string *ev_strings, u64 p=
ayload)
> >>   {
> >> @@ -318,14 +325,44 @@ static u64 print_event_list(int *err, char **buf=
, size_t *buf_len,
> >>          return payload;
> >>   }
> >>
> >> +struct event_print_handle {
> >> +       const struct midr_range *midr_ranges;
> >> +       const struct ev_string *ev_strings;
> >> +};
> >> +
> >> +#define EV_PRINT(range, strings)                       \
> >> +       {                                       \
> >> +               .midr_ranges =3D range,           \
> >> +               .ev_strings =3D strings,  \
> >> +       }
> >> +
> >> +static const struct midr_range n1_event_encoding_cpus[] =3D {
> >> +       MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
> >> +       {},
> >> +};
> >> +
> >> +static const struct event_print_handle event_print_handles[] =3D {
> >> +       EV_PRINT(n1_event_encoding_cpus, n1_event_strings),
> >> +};
> >> +
> >>   static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
> >> -                                 char *buf, size_t buf_len)
> >> +                                 char *buf, size_t buf_len, u64 midr)
> >>   {
> >>          u64 payload =3D packet->payload;
> >>          int err =3D 0;
> >>
> >>          arm_spe_pkt_out_string(&err, &buf, &buf_len, "EV");
> >> -       print_event_list(&err, &buf, &buf_len, common_ev_strings, payl=
oad);
> >> +       payload =3D print_event_list(&err, &buf, &buf_len, common_ev_s=
trings,
> >> +                                  payload);
> >> +
> >> +       /* Try to decode IMPDEF bits for known CPUs */
> >> +       for (unsigned int i =3D 0; i < ARRAY_SIZE(event_print_handles)=
; i++) {
> >> +               if (is_midr_in_range_list(midr,
> >> +                                         event_print_handles[i].midr_=
ranges))
> >> +                       payload =3D print_event_list(&err, &buf, &buf_=
len,
> >> +                                                  event_print_handles=
[i].ev_strings,
> >> +                                                  payload);
> >> +       }
> >>
> >>          return err;
> >>   }
> >> @@ -506,7 +543,7 @@ static int arm_spe_pkt_desc_counter(const struct a=
rm_spe_pkt *packet,
> >>   }
> >>
> >>   int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf,
> >> -                    size_t buf_len)
> >> +                    size_t buf_len, u64 midr)
> >>   {
> >>          int idx =3D packet->index;
> >>          unsigned long long payload =3D packet->payload;
> >> @@ -522,7 +559,7 @@ int arm_spe_pkt_desc(const struct arm_spe_pkt *pac=
ket, char *buf,
> >>                  arm_spe_pkt_out_string(&err, &buf, &blen, "%s", name)=
;
> >>                  break;
> >>          case ARM_SPE_EVENTS:
> >> -               err =3D arm_spe_pkt_desc_event(packet, buf, buf_len);
> >> +               err =3D arm_spe_pkt_desc_event(packet, buf, buf_len, m=
idr);
> >>                  break;
> >>          case ARM_SPE_OP_TYPE:
> >>                  err =3D arm_spe_pkt_desc_op_type(packet, buf, buf_len=
);
> >> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/t=
ools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
> >> index adf4cde320aa..17b067fe3c87 100644
> >> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
> >> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
> >> @@ -11,7 +11,7 @@
> >>   #include <stddef.h>
> >>   #include <stdint.h>
> >>
> >> -#define ARM_SPE_PKT_DESC_MAX           256
> >> +#define ARM_SPE_PKT_DESC_MAX           512
> >>
> >>   #define ARM_SPE_NEED_MORE_BYTES                -1
> >>   #define ARM_SPE_BAD_PACKET             -2
> >> @@ -186,5 +186,6 @@ const char *arm_spe_pkt_name(enum arm_spe_pkt_type=
);
> >>   int arm_spe_get_packet(const unsigned char *buf, size_t len,
> >>                         struct arm_spe_pkt *packet);
> >>
> >> -int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf, siz=
e_t len);
> >> +int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf, siz=
e_t len,
> >> +                    u64 midr);
> >>   #endif
> >> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> >> index 7447b000f9cd..46f0309c092b 100644
> >> --- a/tools/perf/util/arm-spe.c
> >> +++ b/tools/perf/util/arm-spe.c
> >> @@ -135,7 +135,7 @@ struct data_source_handle {
> >>          }
> >>
> >>   static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
> >> -                        unsigned char *buf, size_t len)
> >> +                        unsigned char *buf, size_t len, u64 midr)
> >>   {
> >>          struct arm_spe_pkt packet;
> >>          size_t pos =3D 0;
> >> @@ -161,7 +161,7 @@ static void arm_spe_dump(struct arm_spe *spe __may=
be_unused,
> >>                          color_fprintf(stdout, color, "   ");
> >>                  if (ret > 0) {
> >>                          ret =3D arm_spe_pkt_desc(&packet, desc,
> >> -                                              ARM_SPE_PKT_DESC_MAX);
> >> +                                              ARM_SPE_PKT_DESC_MAX, m=
idr);
> >>                          if (!ret)
> >>                                  color_fprintf(stdout, color, " %s\n",=
 desc);
> >>                  } else {
> >> @@ -174,10 +174,10 @@ static void arm_spe_dump(struct arm_spe *spe __m=
aybe_unused,
> >>   }
> >>
> >>   static void arm_spe_dump_event(struct arm_spe *spe, unsigned char *b=
uf,
> >> -                              size_t len)
> >> +                              size_t len, u64 midr)
> >>   {
> >>          printf(".\n");
> >> -       arm_spe_dump(spe, buf, len);
> >> +       arm_spe_dump(spe, buf, len, midr);
> >>   }
> >>
> >>   static int arm_spe_get_trace(struct arm_spe_buffer *b, void *data)
> >> @@ -1469,8 +1469,11 @@ static int arm_spe_process_auxtrace_event(struc=
t perf_session *session,
> >>                  /* Dump here now we have copied a piped trace out of =
the pipe */
> >>                  if (dump_trace) {
> >>                          if (auxtrace_buffer__get_data(buffer, fd)) {
> >> +                               u64 midr =3D 0;
> >> +
> >> +                               arm_spe__get_midr(spe, buffer->cpu.cpu=
, &midr);
> >
> > Sashiko claims to have spotted an issue here:
> > """
> > Is it possible for arm_spe__get_midr() to cause a segmentation fault he=
re?
> >
> > If the trace is from an older recording (metadata version 1) and the
> > environment lacks a CPUID string (such as during cross-architecture
> > analysis), perf_env__cpuid() returns NULL.
> >
> > It appears arm_spe__get_midr() then passes this NULL pointer to
> > strtol(cpuid, NULL, 16), which leads to undefined behavior.
> > """
> >
> > But this feels like, if this happens you're already having a bad time
> > and these changes aren't necessarily making things worse.
> >
> > Thanks,
> > Ian
> >
>
> Yeah I think it might be possible so I can add an error instead of a
> segfault. I'll check the rest of the Sashiko comments too.
>
> >>                                  arm_spe_dump_event(spe, buffer->data,
> >> -                                               buffer->size);
> >> +                                               buffer->size, midr);
> >>                                  auxtrace_buffer__put_data(buffer);
> >>                          }
> >>                  }
> >>
> >> --
> >> 2.34.1
> >>
>

