Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7823CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCebIUvWdek9ffLsdYCTbu7+qSMezZEeZA0ykXUFeOs=; b=GoOUcT4KUGecGvaWU1XxQV666y
	nf49k/NuBCXypjKXtD95WU4O7iYUamPgpXtAiTnk/WJ8UKgNFHJrmtynKoc5mNancDb0Ieb92bURo
	FdYmBkY4jw7lEoi7c5Yyk7kGJrdc2HVaON1XucugZjttdDdhzWnkLAeXpHdFOkgf8IyC0YPeeiA13
	+Vr66zu2QDrV8XhV5gvIkIBVMgTvWYJ2hIS5PrCEbZamoJjdALDt8LDHlO1D1oZZkkiGd5z55vERt
	+T06CMoEXvfs5NqKsqXunvSw3KWgGR673NocKWv5b0WqZeUblGLZPFahbp2rXMEHfNXIYgGBslUqP
	cAychPSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNa0t-00000006DrP-2lqM;
	Thu, 14 May 2026 17:38:23 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNa0q-00000006DqE-3Tp8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:38:21 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-132cccd3d77so169c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 10:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778780300; cv=none;
        d=google.com; s=arc-20240605;
        b=b+2VRo9YSG6MkRB9nNINyhnZnTdgPs3dV8T2LuHiELGYEa3aLIt2MsEUPxK67xB1Mf
         7T3cNiDq17nxqKSrdbDEYY4JP9ygENqCZF5tk4N7Bh8HHR+IxHYekDxcwHkgC9ogzULV
         AiE7p6Ugf2mENcAhkzWvA62VTV+HVEc9nh3x9GmUU/FA2XBMlK39RR6hLP4t4sQ6BIIX
         Aez626UcKeZro1m0qxOVeq5ycuhkeMBgWx/1n4FbyndXg+mWNodPfIHRHBFFonmq8MrH
         8E7Tau5OfGXY0ab6m+Wp+bHMQQ+O9Eewno/yBkkoPoq/fV5hAc/D9tIRy9vUUcMVpTEc
         N1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MCebIUvWdek9ffLsdYCTbu7+qSMezZEeZA0ykXUFeOs=;
        fh=4zyWTORwg56X2nGaMpI3+q2smTvh/r8bwJ02tWQu5lk=;
        b=Xo7JKmJz8juH/ZdsieAVPN/g0skdrfmOn8AGmZtkO3PesO8Q+2scEj2Zj+2ikhvZlQ
         S0Q98qM3bnv+FQdd19oSNLETTEz4zKA7SAaQ2Nx8RUywwAdu7Oz0N845NnwTw9v637t9
         /u7SagMoBPalLNcjGJv5zQgbqg/fervTLLEgsUXSgalYFnB9x9VxRMUir6Jl30VcLBPo
         EqcvfKiW353/B3Wqy8Oqltp66S3kmS5JczIrVuSSmxOST55IBS5jwJ86jdgRHDAiOkfG
         vb+gqZ3d5CwzgBrseg//a/4UQh5GoynpAhdypg56qGJvsVQ7H1JyGk/udNO5BBHieHPL
         Yxlw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778780300; x=1779385100; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCebIUvWdek9ffLsdYCTbu7+qSMezZEeZA0ykXUFeOs=;
        b=F9VAx8Fpfdeeds/qj0kuWUkDmmmclccYUfMDIyhmL3kyj+FT7s/X2XLfGbNXe1/0ir
         Js1Dm6GNkjl+zqDaa/+jyM/sN9pT9f+3pUu9PZ/if//NR++prFvn3UetUsY/SpWkH7YU
         mwWw/oCOq9u9CNNDaghsCIofoAOxyL8ZU+Xh4nDdlJaQKRFqkLXaFI1TCp4os4MhY8JP
         PETG6ILE3xDqz5DMqIllf2iDPA/XC3hWR1c2VjnRIiYRUtOqzR1xm1pqxkvCzatHmoz4
         1bKxrKDMjWAsdOBbmXjxQHGFpv/+oL9pGKsQjdO0b2AeBzsSwaBaEqsFFPZInUWeUnwh
         jaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778780300; x=1779385100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MCebIUvWdek9ffLsdYCTbu7+qSMezZEeZA0ykXUFeOs=;
        b=JWqbCAKc15DNTV2bk3JgC8QSnvgozvIe992qHJgfmlxxgXLv7MADml7ju5TBt9YjNn
         8iT1ijaC4Zz20G8Kc2lvgXkCum+EWT2aiawO7LBrMjV2K1lyUvbQzdxflzP4E6NgKcfE
         EohsnHQuEA3xVQlS6v1i5ghZLKlkoqUBAJOI6nLnbwEyTSD+2Ev0nWumn91GQuLLmh7K
         9VC1JlPSJb2BxmvmFQSI0ZxKLuKiYdUwRhT08M3eZtR3SB3RU0aZDlsNjaAmeXAmxM1F
         e6OPKB/zJTzr/cwk2c6kynNNC4nUbRXL2kUIexGt+uTFi7vWr4wAfR0LCyBoMdvfnbM/
         xwiA==
X-Forwarded-Encrypted: i=1; AFNElJ/ePmBVWisNxPPF0CuO0kX/Zguu2RmLMUexafl2n39w4KfFhoQS5jHvGXT7vbvjtlGKNjeq97JuLalJrm+1kifF@lists.infradead.org
X-Gm-Message-State: AOJu0YyI/ghx2BHpNnb5SgJXo6wOYC9xP1dGM3c+31ZEQHzeWle4HoTr
	DYrrNhF91lvOo/RbBLXETB+IxCCexCgLNUaUdyryAabVRNC0DXAMZENR39biUsbGXCP6/ZU4Ki0
	crf2Q0Xy8Te7+SJepYxmWLyyS+EbTLm3HpDzwLR6C
X-Gm-Gg: Acq92OF2xf5PfoNhGLLVFR1ZyupbxNw6HDBFH/IZ5Cblo/uYJmxKF85Gc02CnEagiog
	yfR0ZWP368TzsDxfn+toUjH0TQ1pldBYm7abFsWn+zgc2lc35IgBZF6CImXOAjuM/M8GI+SLbs9
	UOgqYecEt9aS25Fri1A9nFFGT6aq+afTN580m+gwX6qi9tHgA1krcmJ/25sXOspsPwxyXN8hKKp
	7L/eBCSCZ8QFHxd3fkg/e+/K3zKls53r35V4F7RU8g3yAks/dXRRbqsYI4vzv+/odLl6gsJWck9
	XdEWlRQp4833M6mj0cY7v9Hw4CVZsoM2WA++FGdTXDCrMGg=
X-Received: by 2002:a05:7022:45a7:b0:133:3bc1:bf2e with SMTP id
 a92af1059eb24-1350451547amr5152c88.5.1778780299123; Thu, 14 May 2026 10:38:19
 -0700 (PDT)
MIME-Version: 1.0
References: <20260507170622.611933-1-irogers@google.com> <20260512054140.3427725-1-irogers@google.com>
In-Reply-To: <20260512054140.3427725-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 14 May 2026 10:38:07 -0700
X-Gm-Features: AVHnY4I4k6mz_Wz1zIKPWAsdKjgNaTco1O5-EZ3IibJ6wzdRapr07F3AxY1iqt8
Message-ID: <CAP-5=fU7Y5b2KERuYJuKBK0nqD6GAo_r_QhxesbVw6T3bqrgQQ@mail.gmail.com>
Subject: Re: [PATCH v2] perf record: Refactor ARM64 leaf caller setup out of arch
To: acme@kernel.org, james.clark@linaro.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alexander.shishkin@linux.intel.com, 
	dapeng1.mi@linux.intel.com, john.g.garry@oracle.com, jolsa@kernel.org, 
	leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mark.rutland@arm.com, mike.leach@arm.com, mingo@redhat.com, 
	peterz@infradead.org, shimin.guo@skydio.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_103820_875676_2A93E0C0 
X-CRM114-Status: GOOD (  21.80  )
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

On Mon, May 11, 2026 at 10:41=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> Code in tools/perf/arch causes portability issues/opaqueness and LTO
> issues due to the use of weak symbols. Move the adding of LR to the
> sample_user_regs into arm64-frame-pointer-unwind-support.c conditional
> on EM_HOST =3D=3D EM_AARCH64 (false on all non-ARM64 builds). This also
> better encapsulates the use of the sampled registers by
> get_leaf_frame_caller_aarch64 and the set up by the new
> add_leaf_frame_caller_opts_aarch64, exposing opportunities for
> possibly sampling PC and SP to help the unwinder.
>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Ian Rogers <irogers@google.com>

Ping.

Thanks,
Ian

> ---
>  tools/perf/arch/arm64/util/Build                     |  1 -
>  tools/perf/arch/arm64/util/machine.c                 | 12 ------------
>  tools/perf/builtin-record.c                          | 11 +++++------
>  tools/perf/util/arm64-frame-pointer-unwind-support.c |  6 ++++++
>  tools/perf/util/arm64-frame-pointer-unwind-support.h |  2 ++
>  tools/perf/util/callchain.h                          |  2 --
>  6 files changed, 13 insertions(+), 21 deletions(-)
>  delete mode 100644 tools/perf/arch/arm64/util/machine.c
>
> diff --git a/tools/perf/arch/arm64/util/Build b/tools/perf/arch/arm64/uti=
l/Build
> index 4e06a08d281a..638aa6948ab5 100644
> --- a/tools/perf/arch/arm64/util/Build
> +++ b/tools/perf/arch/arm64/util/Build
> @@ -5,7 +5,6 @@ perf-util-y +=3D ../../arm/util/pmu.o
>  perf-util-y +=3D arm-spe.o
>  perf-util-y +=3D header.o
>  perf-util-y +=3D hisi-ptt.o
> -perf-util-y +=3D machine.o
>  perf-util-y +=3D mem-events.o
>  perf-util-y +=3D pmu.o
>  perf-util-y +=3D tsc.o
> diff --git a/tools/perf/arch/arm64/util/machine.c b/tools/perf/arch/arm64=
/util/machine.c
> deleted file mode 100644
> index 80fb13c958d9..000000000000
> --- a/tools/perf/arch/arm64/util/machine.c
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -
> -#include "callchain.h" // prototype of arch__add_leaf_frame_record_opts
> -#include "perf_regs.h"
> -#include "record.h"
> -
> -#define SMPL_REG_MASK(b) (1ULL << (b))
> -
> -void arch__add_leaf_frame_record_opts(struct record_opts *opts)
> -{
> -       opts->sample_user_regs |=3D SMPL_REG_MASK(PERF_REG_ARM64_LR);
> -}
> diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
> index 4a5eba498c02..272bba7f4b9e 100644
> --- a/tools/perf/builtin-record.c
> +++ b/tools/perf/builtin-record.c
> @@ -14,6 +14,7 @@
>  #include "util/parse-events.h"
>  #include "util/config.h"
>
> +#include "util/arm64-frame-pointer-unwind-support.h"
>  #include "util/callchain.h"
>  #include "util/cgroup.h"
>  #include "util/header.h"
> @@ -3230,10 +3231,6 @@ static int record__parse_off_cpu_thresh(const stru=
ct option *opt,
>         return 0;
>  }
>
> -void __weak arch__add_leaf_frame_record_opts(struct record_opts *opts __=
maybe_unused)
> -{
> -}
> -
>  static int parse_control_option(const struct option *opt,
>                                 const char *str,
>                                 int unset __maybe_unused)
> @@ -4319,8 +4316,10 @@ int cmd_record(int argc, const char **argv)
>
>         evlist__warn_user_requested_cpus(rec->evlist, rec->opts.target.cp=
u_list);
>
> -       if (callchain_param.enabled && callchain_param.record_mode =3D=3D=
 CALLCHAIN_FP)
> -               arch__add_leaf_frame_record_opts(&rec->opts);
> +       if (callchain_param.enabled && callchain_param.record_mode =3D=3D=
 CALLCHAIN_FP) {
> +               if (EM_HOST =3D=3D EM_AARCH64)
> +                       add_leaf_frame_caller_opts_aarch64(&rec->opts);
> +       }
>
>         err =3D -ENOMEM;
>         if (evlist__create_maps(rec->evlist, &rec->opts.target) < 0) {
> diff --git a/tools/perf/util/arm64-frame-pointer-unwind-support.c b/tools=
/perf/util/arm64-frame-pointer-unwind-support.c
> index 858ce2b01812..3af8c7a466e0 100644
> --- a/tools/perf/util/arm64-frame-pointer-unwind-support.c
> +++ b/tools/perf/util/arm64-frame-pointer-unwind-support.c
> @@ -2,6 +2,7 @@
>  #include "arm64-frame-pointer-unwind-support.h"
>  #include "callchain.h"
>  #include "event.h"
> +#include "record.h"
>  #include "unwind.h"
>  #include <string.h>
>
> @@ -16,6 +17,11 @@ struct entries {
>
>  #define SMPL_REG_MASK(b) (1ULL << (b))
>
> +void add_leaf_frame_caller_opts_aarch64(struct record_opts *opts)
> +{
> +       opts->sample_user_regs |=3D SMPL_REG_MASK(PERF_REG_ARM64_LR);
> +}
> +
>  static bool get_leaf_frame_caller_enabled(struct perf_sample *sample)
>  {
>         struct regs_dump *regs;
> diff --git a/tools/perf/util/arm64-frame-pointer-unwind-support.h b/tools=
/perf/util/arm64-frame-pointer-unwind-support.h
> index 42d3a45490f5..ba35b295bfcd 100644
> --- a/tools/perf/util/arm64-frame-pointer-unwind-support.h
> +++ b/tools/perf/util/arm64-frame-pointer-unwind-support.h
> @@ -5,8 +5,10 @@
>  #include <linux/types.h>
>
>  struct perf_sample;
> +struct record_opts;
>  struct thread;
>
> +void add_leaf_frame_caller_opts_aarch64(struct record_opts *opts);
>  u64 get_leaf_frame_caller_aarch64(struct perf_sample *sample, struct thr=
ead *thread, int user_idx);
>
>  #endif /* __PERF_ARM_FRAME_POINTER_UNWIND_SUPPORT_H */
> diff --git a/tools/perf/util/callchain.h b/tools/perf/util/callchain.h
> index 06d463ccc7a0..b7702d65ad60 100644
> --- a/tools/perf/util/callchain.h
> +++ b/tools/perf/util/callchain.h
> @@ -277,8 +277,6 @@ static inline int arch_skip_callchain_idx(struct thre=
ad *thread __maybe_unused,
>  }
>  #endif
>
> -void arch__add_leaf_frame_record_opts(struct record_opts *opts);
> -
>  char *callchain_list__sym_name(struct callchain_list *cl,
>                                char *bf, size_t bfsize, bool show_dso);
>  char *callchain_node__scnprintf_value(struct callchain_node *node,
> --
> 2.54.0.563.g4f69b47b94-goog
>

