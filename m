Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C500FCC6B3E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 15:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obs00e+wrJFs2sWumo70dIrKKwlJrD6vLf8ObLD+lkA=; b=3VCl5EBu2HdnfXCx5/l1hVi++R
	08ZYrnDNUiS91mc1dmaU6rXW1AcdMha6/VLsjFXSBp4IGFvZ4tYu7IZ/Mrb0+eGWkt2VqpLRu7Sfu
	4OMM7gwPE5OCts3g8vNX4xQjrN9CpsBrBfDx3X9DOnns3pasfSxBY1Vl5wx+OpEiBEFiWsOFW+ODu
	UEzWhASSsT1/6SUcFEldTZy2eNjErOsi0fbQc8zaO7e+hxoLDUqgkjylmWDaR7AXZhGFnpaF8NWC4
	wJqQv4paVlfia6jlg/kbYikWO0mYLFil7hUrvum2+VS38ohP1JcUCXPsL4ylvFsNZrRuCpVbI2nFd
	pVRdtHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Jwy-00000000RG8-0a4V;
	Thu, 02 Apr 2026 15:27:16 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Jwu-00000000RFG-2qnS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 15:27:14 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2b0c12be0ecso104365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 08:27:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775143632; cv=none;
        d=google.com; s=arc-20240605;
        b=OO0UVirTA8O3SyhS3ZCM2n1bWUvIX6NZ4RPgX0mErjwtDrlwugZJWmKtgdj8ox2+nT
         Xq2rYkKd+72D4gmtvkfpSw9JRa4waSze9Ok9HtZbQ2cYMkLucn7hofRu/D1kfnedAY2m
         8qqxnXrtplxf7kDIZA4Q9pEhXtLUPHa/7ir4l3du9rt/NTUsWCnS/68LLIRnp9I3G5xJ
         N3sAcv+z3FP9MEzPPBCHtp6yZu14rZWY7luWlnfaRrDWYLY1gPMX8Ju5j8IKcmpbO2sB
         sOFnymugsXu1x21b4PZuFvk3KI8rpCxJSzAUeDRPuNURpkiimzoR/91y0m2jEC6iko17
         epvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=obs00e+wrJFs2sWumo70dIrKKwlJrD6vLf8ObLD+lkA=;
        fh=81YiYHLekE2PEZ1OramBqZoWbkD9TzDpfezPi+pqI34=;
        b=ajzaI9h/CniS15Zd+7yK4QsiBe8Y5RVqTyaAlj70ksRsz0c8mDg7lFt5wvTNV9CTsc
         RZHswNz6+r0B2O6MfyEigAmRJbeZvIOfPFHKHEBTWCQtqRWgOOq+FKWoK/f3CR0Du1nq
         o53+1OEqt2x4tLeSqnsqY6yVZaI+/gl8XjZQGeqdZ7CkyTbLAtAUYhPDqJp6RyICAygQ
         udTusCqkenLhQb41DNEe5hr3Oiripn6OINU3kzAa0KjEQU8hkzN+NSHlIjMsEqV5laUX
         4OnVsS32RrgR36qEU7x0JHrK5p2SSpLqCIvVrq7thxAOXUi6Z3nRJttpzEWzvmzHR75w
         jktA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775143632; x=1775748432; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obs00e+wrJFs2sWumo70dIrKKwlJrD6vLf8ObLD+lkA=;
        b=DlkWAdkVMPYSXczYWKiIttT+2qoy1DfjxWqrBC5IG5jPx1LhKo8rWt201RCvg3QuZN
         +ZKK3b+RB+jQDfOGUn4g73WtwuJINSq4d5PKu0gKujqA4CGsF5EHiDjnYw3h0QOsqiJr
         n9m5PnFxjjrmRajZDTDftTqPysR2lpYa/Pbm3Nv0Vnl79itFV6FzAWz3fttSiguOANR4
         EFg7e8gwGr2GUVIzEys5M/cqkFyeBVEONBP46Watgheon9aAB9ElL++v91JxHc8egI2+
         tbazh/9l8W0HmJ5hzUsneKUrc/py245zLspa3j+ivjlcBaZPtPzV8d4KbSx5r/8iMRAa
         VG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775143632; x=1775748432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=obs00e+wrJFs2sWumo70dIrKKwlJrD6vLf8ObLD+lkA=;
        b=Dguze0EKMfraiNm51Il3YlRB15Zx43UOLF7fACc8w9i3aF5NquOZvScIXiuncgcwkg
         T82brY5EFinLrMUfznhdsZoUXFGxcOVg2IEf3u0wpA7Zif3klB0phSrhl73v7ALI/hHB
         4cMcfdycEdG/M/nL/gaXf9wTWfqv99s5eyZcZMLtmuZSS+4Bq3+5RdnUi+27r08SoA2S
         raKGua/Cjml7qQm2jdOcMTl7cpEmf9lX5j/d1fwatFuTjfcWn7axx2Ldf884GGgMc2Gc
         FkXFIN/4Xv1/W7ufa/FL8cKmf+4JTuZ1OivzM7wLgA1RIG8UdsxtwJnuipfxUyQXtvnR
         2IqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOAZ3ypJWlU611LveHwn0HdwHxcumGddIcJhRiTqRkeBRjSuyfPGLplG3gPsS5zNNq8kMB7W83tFBQtHCarNsX@lists.infradead.org
X-Gm-Message-State: AOJu0YyS3tbfGzotv6g/pc0yT75RC9c2N5C+eWVsbi+DqxAn/ts3U5/d
	KqCfR9ZUpkRTDja6gjtGSLfY4vRQZtcsNT7Xzzk4G9E+vOHgcAxcI2Ozsg6luTn8ViJW5o4B62u
	r5icc7od9LIoJFqBoLunPNIoaPzgIK3OE9P6X2bve
X-Gm-Gg: AeBDietXSzfM41T0TpfDkLImoW4Vy4SPA/FsOFg3/G/AkAcHsREf+VF+gRC+xv9k31a
	4MK7TQR9XZ460zH0sp4TwznCBC9puHVXIcCHDa/DQE6M0LF9m9B++lU69gs45h4Qfk9ovXaBUdX
	2C3WV/m7BalM0CKTOcBiqwwz6qyduEdps9LeR0xUW7xi11NLmLtELwDb0ma6eewyhXyrMtkV0bB
	Ot1r9BpcMQYMIyBoXctHtAdqYM0xFOUg2JBPevBaUwutuZsHDN09HECPmkypLB9OS0arP+Zkw+6
	ClSWam0JYlB189FwZPR40uJ1hA0vrN8rrkjf
X-Received: by 2002:a17:902:e74e:b0:2ae:575b:2345 with SMTP id
 d9443c01a7336-2b2784835cemr2064795ad.9.1775143630848; Thu, 02 Apr 2026
 08:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org> <20260401-james-spe-impdef-decode-v1-3-ad0d372c220c@linaro.org>
In-Reply-To: <20260401-james-spe-impdef-decode-v1-3-ad0d372c220c@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 2 Apr 2026 08:26:59 -0700
X-Gm-Features: AQROBzAMz7khfd74Y0zsjFeuyutU7U6Voo59fVJW6yu6K4lYUjWspkQFbEqalcU
Message-ID: <CAP-5=fVcYOJ_3TWd6won5FVaH2MH6QwLhCoCRnNzzeE-9PgO1Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260402_082712_758645_71D9BB29 
X-CRM114-Status: GOOD (  34.74  )
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

On Wed, Apr 1, 2026 at 7:26=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
> From the TRM [1], N1 has one IMPDEF event which isn't covered by the
> common list. Add a framework so that more cores can be added in the
> future and that the N1 IMPDEF event can be decoded. Also increase the
> size of the buffer because we're adding more strings and if it gets
> truncated it falls back to a hex dump only.
>
> [1]: https://developer.arm.com/documentation/100616/0401/Statistical-Prof=
iling-Extension/implementation-defined-features-of-SPE
> Suggested-by: Al Grant <al.grant@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/util/arm-spe-decoder/Build              |  2 +
>  .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 45 ++++++++++++++++=
++++--
>  .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     |  5 ++-
>  tools/perf/util/arm-spe.c                          | 13 ++++---
>  4 files changed, 54 insertions(+), 11 deletions(-)
>
> diff --git a/tools/perf/util/arm-spe-decoder/Build b/tools/perf/util/arm-=
spe-decoder/Build
> index ab500e0efe24..97a298d1e279 100644
> --- a/tools/perf/util/arm-spe-decoder/Build
> +++ b/tools/perf/util/arm-spe-decoder/Build
> @@ -1 +1,3 @@
>  perf-util-y +=3D arm-spe-pkt-decoder.o arm-spe-decoder.o
> +
> +CFLAGS_arm-spe-pkt-decoder.o +=3D -I$(srctree)/tools/arch/arm64/include/=
 -I$(OUTPUT)arch/arm64/include/generated/
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tool=
s/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> index c880b0dec3a1..42a7501d4dfe 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> @@ -15,6 +15,8 @@
>
>  #include "arm-spe-pkt-decoder.h"
>
> +#include "../../arm64/include/asm/cputype.h"

Sashiko spotted:
https://sashiko.dev/#/patchset/20260401-james-spe-impdef-decode-v1-0-ad0d37=
2c220c%40linaro.org
"""
This isn't a bug, but does this include directive rely on accidental
path normalization?

The relative path ../../arm64/include/asm/cputype.h does not exist relative
to arm-spe-pkt-decoder.c. It only compiles because the Build file adds
-I$(srctree)/tools/arch/arm64/include/ to CFLAGS.

Would it be cleaner to use #include <asm/cputype.h> to explicitly rely on
the include path?
[ ... ]
"""
I wouldn't use <asm/cputype.h> due to cross-compilation and the like,
instead just add the extra "../" into the include path.

> +
>  static const char * const arm_spe_packet_name[] =3D {
>         [ARM_SPE_PAD]           =3D "PAD",
>         [ARM_SPE_END]           =3D "END",
> @@ -307,6 +309,11 @@ static const struct ev_string common_ev_strings[] =
=3D {
>         { .event =3D 0, .desc =3D NULL },
>  };
>
> +static const struct ev_string n1_event_strings[] =3D {
> +       { .event =3D 12, .desc =3D "LATE-PREFETCH" },
> +       { .event =3D 0, .desc =3D NULL },
> +};
> +
>  static u64 print_event_list(int *err, char **buf, size_t *buf_len,
>                             const struct ev_string *ev_strings, u64 paylo=
ad)
>  {
> @@ -318,14 +325,44 @@ static u64 print_event_list(int *err, char **buf, s=
ize_t *buf_len,
>         return payload;
>  }
>
> +struct event_print_handle {
> +       const struct midr_range *midr_ranges;
> +       const struct ev_string *ev_strings;
> +};
> +
> +#define EV_PRINT(range, strings)                       \
> +       {                                       \
> +               .midr_ranges =3D range,           \
> +               .ev_strings =3D strings,  \
> +       }
> +
> +static const struct midr_range n1_event_encoding_cpus[] =3D {
> +       MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
> +       {},
> +};
> +
> +static const struct event_print_handle event_print_handles[] =3D {
> +       EV_PRINT(n1_event_encoding_cpus, n1_event_strings),
> +};
> +
>  static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
> -                                 char *buf, size_t buf_len)
> +                                 char *buf, size_t buf_len, u64 midr)
>  {
>         u64 payload =3D packet->payload;
>         int err =3D 0;
>
>         arm_spe_pkt_out_string(&err, &buf, &buf_len, "EV");
> -       print_event_list(&err, &buf, &buf_len, common_ev_strings, payload=
);
> +       payload =3D print_event_list(&err, &buf, &buf_len, common_ev_stri=
ngs,
> +                                  payload);
> +
> +       /* Try to decode IMPDEF bits for known CPUs */
> +       for (unsigned int i =3D 0; i < ARRAY_SIZE(event_print_handles); i=
++) {
> +               if (is_midr_in_range_list(midr,
> +                                         event_print_handles[i].midr_ran=
ges))
> +                       payload =3D print_event_list(&err, &buf, &buf_len=
,
> +                                                  event_print_handles[i]=
.ev_strings,
> +                                                  payload);
> +       }
>
>         return err;
>  }
> @@ -506,7 +543,7 @@ static int arm_spe_pkt_desc_counter(const struct arm_=
spe_pkt *packet,
>  }
>
>  int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf,
> -                    size_t buf_len)
> +                    size_t buf_len, u64 midr)
>  {
>         int idx =3D packet->index;
>         unsigned long long payload =3D packet->payload;
> @@ -522,7 +559,7 @@ int arm_spe_pkt_desc(const struct arm_spe_pkt *packet=
, char *buf,
>                 arm_spe_pkt_out_string(&err, &buf, &blen, "%s", name);
>                 break;
>         case ARM_SPE_EVENTS:
> -               err =3D arm_spe_pkt_desc_event(packet, buf, buf_len);
> +               err =3D arm_spe_pkt_desc_event(packet, buf, buf_len, midr=
);
>                 break;
>         case ARM_SPE_OP_TYPE:
>                 err =3D arm_spe_pkt_desc_op_type(packet, buf, buf_len);
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tool=
s/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
> index adf4cde320aa..17b067fe3c87 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
> @@ -11,7 +11,7 @@
>  #include <stddef.h>
>  #include <stdint.h>
>
> -#define ARM_SPE_PKT_DESC_MAX           256
> +#define ARM_SPE_PKT_DESC_MAX           512
>
>  #define ARM_SPE_NEED_MORE_BYTES                -1
>  #define ARM_SPE_BAD_PACKET             -2
> @@ -186,5 +186,6 @@ const char *arm_spe_pkt_name(enum arm_spe_pkt_type);
>  int arm_spe_get_packet(const unsigned char *buf, size_t len,
>                        struct arm_spe_pkt *packet);
>
> -int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf, size_t=
 len);
> +int arm_spe_pkt_desc(const struct arm_spe_pkt *packet, char *buf, size_t=
 len,
> +                    u64 midr);
>  #endif
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 7447b000f9cd..46f0309c092b 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -135,7 +135,7 @@ struct data_source_handle {
>         }
>
>  static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
> -                        unsigned char *buf, size_t len)
> +                        unsigned char *buf, size_t len, u64 midr)
>  {
>         struct arm_spe_pkt packet;
>         size_t pos =3D 0;
> @@ -161,7 +161,7 @@ static void arm_spe_dump(struct arm_spe *spe __maybe_=
unused,
>                         color_fprintf(stdout, color, "   ");
>                 if (ret > 0) {
>                         ret =3D arm_spe_pkt_desc(&packet, desc,
> -                                              ARM_SPE_PKT_DESC_MAX);
> +                                              ARM_SPE_PKT_DESC_MAX, midr=
);
>                         if (!ret)
>                                 color_fprintf(stdout, color, " %s\n", des=
c);
>                 } else {
> @@ -174,10 +174,10 @@ static void arm_spe_dump(struct arm_spe *spe __mayb=
e_unused,
>  }
>
>  static void arm_spe_dump_event(struct arm_spe *spe, unsigned char *buf,
> -                              size_t len)
> +                              size_t len, u64 midr)
>  {
>         printf(".\n");
> -       arm_spe_dump(spe, buf, len);
> +       arm_spe_dump(spe, buf, len, midr);
>  }
>
>  static int arm_spe_get_trace(struct arm_spe_buffer *b, void *data)
> @@ -1469,8 +1469,11 @@ static int arm_spe_process_auxtrace_event(struct p=
erf_session *session,
>                 /* Dump here now we have copied a piped trace out of the =
pipe */
>                 if (dump_trace) {
>                         if (auxtrace_buffer__get_data(buffer, fd)) {
> +                               u64 midr =3D 0;
> +
> +                               arm_spe__get_midr(spe, buffer->cpu.cpu, &=
midr);

Sashiko claims to have spotted an issue here:
"""
Is it possible for arm_spe__get_midr() to cause a segmentation fault here?

If the trace is from an older recording (metadata version 1) and the
environment lacks a CPUID string (such as during cross-architecture
analysis), perf_env__cpuid() returns NULL.

It appears arm_spe__get_midr() then passes this NULL pointer to
strtol(cpuid, NULL, 16), which leads to undefined behavior.
"""

But this feels like, if this happens you're already having a bad time
and these changes aren't necessarily making things worse.

Thanks,
Ian

>                                 arm_spe_dump_event(spe, buffer->data,
> -                                               buffer->size);
> +                                               buffer->size, midr);
>                                 auxtrace_buffer__put_data(buffer);
>                         }
>                 }
>
> --
> 2.34.1
>

