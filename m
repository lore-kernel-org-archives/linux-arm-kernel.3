Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD052D340BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EoqZJbxGiyM8QC16Ea78T0gDAzuyRWpmVpSIjUw7tIg=; b=yqfFHp8+bosLx7sAaTq04a+Qi7
	IbmjyEialvHsXG4awfpgVtNDJMwxSANo4iRFwZw0u1uhPZrNwCuKv1Wtf42+dxf9NdaCspuRM45Cy
	HuFDZ4G9xiLSgPJI3jkXvLCggJOZEz9NDFoyObrDeWIPEsRj6YajmYqQ1W4ZEEs1clcAvj8wn5MHa
	/zKaLSdYCT72p2WsRdY05zcQzA0h9R3PeRNisKM5lJn7jcpiYgSI4ILcZEik6WnQtqs4J72Dv6RCi
	P2B94ECy85XZLg2UbGNM0XaHQDmtObcIP18BJ4pUzAqHX5q/w7THvrhp7qaHhe6dND26bhrtrzcYx
	KB78xLEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkmLJ-0000000Eglu-18aj;
	Tue, 27 Jan 2026 16:55:05 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkmLE-0000000Egk8-1Zcf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 16:55:03 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a0d06cfa93so89595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 08:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769532899; cv=none;
        d=google.com; s=arc-20240605;
        b=EOQp8UYzMRwk9QNL8TowxGXYngewPJ3Dg7U7umvrsol5OyWjKv/7J5/Z/WQeL2zDwR
         Q8x4DXIZ6kTTLVrUoHtZgXnvun6AKZa/NFFX0SY1ECstsjfKNixGgzLSfwyYJPcVD5Fg
         6t2Ino2Z1FA5r6BOVwifi0iLEFu4Nfcer4JVLJ6qA9eVQWdiNPpCZPKziLJ06suc1rE0
         eVKYDHx48pBuW3Mv460D7GfQxiZ1B6pT7XykaBoYa/hf1cuxtnhQrRxxG24uru78ic2E
         M9n0pVY9gcsXtoJyyY5m4Hk5A8HABmYEYy/21VUU/ePAcCS9T9ZjoanzFbRG8kzfH/0w
         21bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EoqZJbxGiyM8QC16Ea78T0gDAzuyRWpmVpSIjUw7tIg=;
        fh=niC99dbisqNRyxhwtpWquQcO2g0bt/qWEJLmRB3mkx0=;
        b=V0h/DmqukUN0WwB7iyQwOrj0X7hY4V3F88gFOZlBc5BON+D9kaQA/QOfZYmFuEWE3/
         zEePU+BMKZl+aBcw7jpOaUReUY/rcak/7TqSYF52piqIGyVM3IYYWKAxXTVO4inBjEaK
         /JhAyi3B8peEaxWU4+MclMuloUoyeEPP+Ea/3ZaNlElmYOy2Wc1n2aQhD2M58A50BPhf
         FMDsp+O3GDCVk5DozzWzoQ4XzkvXyeSxAIGfLplfXSkgbQBs8xPTbddQfcEE5FNzW8Yn
         2JM434c6bLZZBaGoqMQnJDUVYYTWj+vCFWqpDAWcq/1Qpuc36igww/EeGUtkz0/aCJhB
         HM3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769532899; x=1770137699; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoqZJbxGiyM8QC16Ea78T0gDAzuyRWpmVpSIjUw7tIg=;
        b=vngxuKgM2Rxl9NGAFOw/cZwyTYZTW2ArcbqrWpRgDcZzub/5VOuXe9nFMuPKcP5m4M
         FhhVApZxK2t7eJyjhadfVkrdBMVm+cZW7nVOteuln+/+BTOmQxqpVqa9hmZrQ8i3NIIO
         Kuy0oC3bC71H5FDkYM4i21nZ/5G4ECQReKvyp4aLv2hhsQfQDqHRT96zxB+RseTVtHnL
         t2G2MaLi103ckzIRY+wbBmPWgJwU8CTC5lV5dN8JXHZIf8i7KKcciO1ihv6Nwq6/g5W7
         tBCRLdmNK2vXBzp4IyRAezv9hv9oWhCauw6yQVe3Zm4dE24uDOin2pkoMkkzr6jeihYv
         bRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532899; x=1770137699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EoqZJbxGiyM8QC16Ea78T0gDAzuyRWpmVpSIjUw7tIg=;
        b=iy4BPKOtAWunnqtvilbAOoATt7WaNDkPz4Q4ImalshMw1KT7lJuLd+8QZ9H2TTqxTG
         Aq0hbAROYzHJbny5MH9/+44EZ3UhIannLCMKKIYCtTj3sMhrUbKcRYI43j6h/IPkkSC5
         AgkFZncCbxV5MviI/shSUz8q4jXJRoZhEcViCdXy2aXLabyAt/Jd5m6zmkiabvLKjWNG
         KAKRiwF0ociqWfr40gdBdOgdLO3A3cAgmtR8o2iI9RaiTKp3wNjSDFTS8DrBQaXeFF5s
         7oABWPcK/KL4yVBUscx1bzawiK8xSwyXpsYfEuTxwJhuI7vMyZyWF8KpbRvBjIl1no/K
         ZE9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzmAkRzwUe/WIeLMBZccuKbOWny/IuYRh0nVil93fKSKbZXdj3LNs1ocHFc9mhzkJT0SqjptudSgK0D81uTTt7@lists.infradead.org
X-Gm-Message-State: AOJu0YzQFIETZiRe7S8AbxFWdyMJOk32vA3xftIbAEbsEnKjR+xyu44K
	VwbXUuCEkvE80lq2ZIqgBBHalBKcBkkyh6LBcdDgOCFXEsVxrSUrViOoEsqfuHo3f5PqnG0UiYV
	HpBwcpkJk4M1oVNd6GD350wvxcNlIKfDG09Txpd9K
X-Gm-Gg: AZuq6aIPUU7d5Ab4sV9+Um4EUGZwL+bole9A8coqSIo74ZOp5jX3SpzSvzJvmSuh8lE
	3FOFDek/lKvySn8qDPZryG130IowEF6CVyfftepW5oc1doxap5gwK0+BGE4MQn+IsqV5sdgaTLs
	rfY9F+zwIHxyawxEiy5yVO4ruG89mrSbU9/QpvPJaw9g4Q56Shb2YMn+0inJqsfygimduSdakRU
	VKKXLZ12aUieUlJ0gxjA0JH2BB+P5aJcHuZUdaAg+CyPTF8tUHX84iCwJ8ex04ESxPzFffu+Gui
	sFaUCa8wjKbClroITd05XhzU
X-Received: by 2002:a17:903:94e:b0:291:6858:ee60 with SMTP id
 d9443c01a7336-2a8708e0198mr2329855ad.4.1769532898820; Tue, 27 Jan 2026
 08:54:58 -0800 (PST)
MIME-Version: 1.0
References: <20260127070259.2720468-1-dapeng1.mi@linux.intel.com> <20260127070259.2720468-4-dapeng1.mi@linux.intel.com>
In-Reply-To: <20260127070259.2720468-4-dapeng1.mi@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 27 Jan 2026 08:54:47 -0800
X-Gm-Features: AZwV_QjQK2UL4a6GggSJc5VtmWg4tjgQHMP67eBZAqC_BYj0oWpDnEbqBx5PWDg
Message-ID: <CAP-5=fUT3zyVW96Gd4j6jvRhM1OrMvP=-qDp_cLRMgXmoujfgQ@mail.gmail.com>
Subject: Re: [Patch v2 3/3] perf regs: Remove __weak attributive
 arch_sdt_arg_parse_op() function
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Zide Chen <zide.chen@intel.com>, Falcon Thomas <thomas.falcon@intel.com>, 
	Dapeng Mi <dapeng1.mi@intel.com>, Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_085500_483769_E1B1613A 
X-CRM114-Status: GOOD (  24.60  )
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

On Mon, Jan 26, 2026 at 11:06=E2=80=AFPM Dapeng Mi <dapeng1.mi@linux.intel.=
com> wrote:
>
> In line with the previous patch, the __weak arch_sdt_arg_parse_op()
> function is removed. Architectural-specific implementations in the arch/
> directory are now converted into sub-functions within the
> util/perf-regs-arch/ directory. The perf_sdt_arg_parse_op() function
> will call these sub-functions based on the EM_HOST.
>
> This change enables cross-architecture calls to arch_sdt_arg_parse_op().
>
> No functional changes are intended.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> ---
>  tools/perf/arch/arm64/util/Build              |   1 -
>  tools/perf/arch/arm64/util/perf_regs.c        | 105 --------
>  tools/perf/arch/powerpc/util/Build            |   1 -
>  tools/perf/arch/powerpc/util/perf_regs.c      | 125 ----------
>  tools/perf/arch/x86/util/Build                |   1 -
>  tools/perf/arch/x86/util/perf_regs.c          | 235 ------------------
>  .../util/perf-regs-arch/perf_regs_aarch64.c   |  86 +++++++
>  .../util/perf-regs-arch/perf_regs_powerpc.c   | 106 ++++++++
>  .../perf/util/perf-regs-arch/perf_regs_x86.c  | 221 ++++++++++++++++
>  tools/perf/util/perf_regs.c                   |  23 +-
>  tools/perf/util/perf_regs.h                   |   5 +-
>  tools/perf/util/probe-file.c                  |   3 +-
>  12 files changed, 439 insertions(+), 473 deletions(-)
>  delete mode 100644 tools/perf/arch/arm64/util/perf_regs.c
>  delete mode 100644 tools/perf/arch/powerpc/util/perf_regs.c
>  delete mode 100644 tools/perf/arch/x86/util/perf_regs.c
>
> diff --git a/tools/perf/arch/arm64/util/Build b/tools/perf/arch/arm64/uti=
l/Build
> index 0177af19cc00..bc12c35d06c8 100644
> --- a/tools/perf/arch/arm64/util/Build
> +++ b/tools/perf/arch/arm64/util/Build
> @@ -8,6 +8,5 @@ perf-util-y +=3D header.o
>  perf-util-y +=3D hisi-ptt.o
>  perf-util-y +=3D machine.o
>  perf-util-y +=3D mem-events.o
> -perf-util-y +=3D perf_regs.o
>  perf-util-y +=3D pmu.o
>  perf-util-y +=3D tsc.o
> diff --git a/tools/perf/arch/arm64/util/perf_regs.c b/tools/perf/arch/arm=
64/util/perf_regs.c
> deleted file mode 100644
> index 47f58eaba032..000000000000
> --- a/tools/perf/arch/arm64/util/perf_regs.c
> +++ /dev/null
> @@ -1,105 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <errno.h>
> -#include <regex.h>
> -#include <string.h>
> -#include <sys/auxv.h>
> -#include <linux/kernel.h>
> -#include <linux/zalloc.h>
> -
> -#include "perf_regs.h"
> -#include "../../../perf-sys.h"
> -#include "../../../util/debug.h"
> -#include "../../../util/event.h"
> -#include "../../../util/perf_regs.h"
> -
> -#define SMPL_REG_MASK(b) (1ULL << (b))
> -
> -#ifndef HWCAP_SVE
> -#define HWCAP_SVE      (1 << 22)
> -#endif
> -
> -/* %xNUM */
> -#define SDT_OP_REGEX1  "^(x[1-2]?[0-9]|3[0-1])$"
> -
> -/* [sp], [sp, NUM] */
> -#define SDT_OP_REGEX2  "^\\[sp(, )?([0-9]+)?\\]$"
> -
> -static regex_t sdt_op_regex1, sdt_op_regex2;
> -
> -static int sdt_init_op_regex(void)
> -{
> -       static int initialized;
> -       int ret =3D 0;
> -
> -       if (initialized)
> -               return 0;
> -
> -       ret =3D regcomp(&sdt_op_regex1, SDT_OP_REGEX1, REG_EXTENDED);
> -       if (ret)
> -               goto error;
> -
> -       ret =3D regcomp(&sdt_op_regex2, SDT_OP_REGEX2, REG_EXTENDED);
> -       if (ret)
> -               goto free_regex1;
> -
> -       initialized =3D 1;
> -       return 0;
> -
> -free_regex1:
> -       regfree(&sdt_op_regex1);
> -error:
> -       pr_debug4("Regex compilation error.\n");
> -       return ret;
> -}
> -
> -/*
> - * SDT marker arguments on Arm64 uses %xREG or [sp, NUM], currently
> - * support these two formats.
> - */
> -int arch_sdt_arg_parse_op(char *old_op, char **new_op)
> -{
> -       int ret, new_len;
> -       regmatch_t rm[5];
> -
> -       ret =3D sdt_init_op_regex();
> -       if (ret < 0)
> -               return ret;
> -
> -       if (!regexec(&sdt_op_regex1, old_op, 3, rm, 0)) {
> -               /* Extract xNUM */
> -               new_len =3D 2;    /* % NULL */
> -               new_len +=3D (int)(rm[1].rm_eo - rm[1].rm_so);
> -
> -               *new_op =3D zalloc(new_len);
> -               if (!*new_op)
> -                       return -ENOMEM;
> -
> -               scnprintf(*new_op, new_len, "%%%.*s",
> -                       (int)(rm[1].rm_eo - rm[1].rm_so), old_op + rm[1].=
rm_so);
> -       } else if (!regexec(&sdt_op_regex2, old_op, 5, rm, 0)) {
> -               /* [sp], [sp, NUM] or [sp,NUM] */
> -               new_len =3D 7;    /* + ( % s p ) NULL */
> -
> -               /* If the argument is [sp], need to fill offset '0' */
> -               if (rm[2].rm_so =3D=3D -1)
> -                       new_len +=3D 1;
> -               else
> -                       new_len +=3D (int)(rm[2].rm_eo - rm[2].rm_so);
> -
> -               *new_op =3D zalloc(new_len);
> -               if (!*new_op)
> -                       return -ENOMEM;
> -
> -               if (rm[2].rm_so =3D=3D -1)
> -                       scnprintf(*new_op, new_len, "+0(%%sp)");
> -               else
> -                       scnprintf(*new_op, new_len, "+%.*s(%%sp)",
> -                                 (int)(rm[2].rm_eo - rm[2].rm_so),
> -                                 old_op + rm[2].rm_so);
> -       } else {
> -               pr_debug4("Skipping unsupported SDT argument: %s\n", old_=
op);
> -               return SDT_ARG_SKIP;
> -       }
> -
> -       return SDT_ARG_VALID;
> -}
> diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/powerpc=
/util/Build
> index 5fd28ec713a4..43c3e7c450a3 100644
> --- a/tools/perf/arch/powerpc/util/Build
> +++ b/tools/perf/arch/powerpc/util/Build
> @@ -1,6 +1,5 @@
>  perf-util-y +=3D header.o
>  perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
> -perf-util-y +=3D perf_regs.o
>  perf-util-y +=3D mem-events.o
>  perf-util-y +=3D pmu.o
>  perf-util-y +=3D sym-handling.o
> diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/p=
owerpc/util/perf_regs.c
> deleted file mode 100644
> index 93f929fc32e3..000000000000
> --- a/tools/perf/arch/powerpc/util/perf_regs.c
> +++ /dev/null
> @@ -1,125 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <errno.h>
> -#include <string.h>
> -#include <regex.h>
> -#include <linux/zalloc.h>
> -
> -#include "perf_regs.h"
> -#include "../../../util/perf_regs.h"
> -#include "../../../util/debug.h"
> -#include "../../../util/event.h"
> -#include "../../../util/header.h"
> -#include "../../../perf-sys.h"
> -#include "utils_header.h"
> -
> -#include <linux/kernel.h>
> -
> -#define PVR_POWER9             0x004E
> -#define PVR_POWER10            0x0080
> -#define PVR_POWER11            0x0082
> -
> -/* REG or %rREG */
> -#define SDT_OP_REGEX1  "^(%r)?([1-2]?[0-9]|3[0-1])$"
> -
> -/* -NUM(REG) or NUM(REG) or -NUM(%rREG) or NUM(%rREG) */
> -#define SDT_OP_REGEX2  "^(\\-)?([0-9]+)\\((%r)?([1-2]?[0-9]|3[0-1])\\)$"
> -
> -static regex_t sdt_op_regex1, sdt_op_regex2;
> -
> -static int sdt_init_op_regex(void)
> -{
> -       static int initialized;
> -       int ret =3D 0;
> -
> -       if (initialized)
> -               return 0;
> -
> -       ret =3D regcomp(&sdt_op_regex1, SDT_OP_REGEX1, REG_EXTENDED);
> -       if (ret)
> -               goto error;
> -
> -       ret =3D regcomp(&sdt_op_regex2, SDT_OP_REGEX2, REG_EXTENDED);
> -       if (ret)
> -               goto free_regex1;
> -
> -       initialized =3D 1;
> -       return 0;
> -
> -free_regex1:
> -       regfree(&sdt_op_regex1);
> -error:
> -       pr_debug4("Regex compilation error.\n");
> -       return ret;
> -}
> -
> -/*
> - * Parse OP and convert it into uprobe format, which is, +/-NUM(%gprREG)=
.
> - * Possible variants of OP are:
> - *     Format          Example
> - *     -------------------------
> - *     NUM(REG)        48(18)
> - *     -NUM(REG)       -48(18)
> - *     NUM(%rREG)      48(%r18)
> - *     -NUM(%rREG)     -48(%r18)
> - *     REG             18
> - *     %rREG           %r18
> - *     iNUM            i0
> - *     i-NUM           i-1
> - *
> - * SDT marker arguments on Powerpc uses %rREG form with -mregnames flag
> - * and REG form with -mno-regnames. Here REG is general purpose register=
,
> - * which is in 0 to 31 range.
> - */
> -int arch_sdt_arg_parse_op(char *old_op, char **new_op)
> -{
> -       int ret, new_len;
> -       regmatch_t rm[5];
> -       char prefix;
> -
> -       /* Constant argument. Uprobe does not support it */
> -       if (old_op[0] =3D=3D 'i') {
> -               pr_debug4("Skipping unsupported SDT argument: %s\n", old_=
op);
> -               return SDT_ARG_SKIP;
> -       }
> -
> -       ret =3D sdt_init_op_regex();
> -       if (ret < 0)
> -               return ret;
> -
> -       if (!regexec(&sdt_op_regex1, old_op, 3, rm, 0)) {
> -               /* REG or %rREG --> %gprREG */
> -
> -               new_len =3D 5;    /* % g p r NULL */
> -               new_len +=3D (int)(rm[2].rm_eo - rm[2].rm_so);
> -
> -               *new_op =3D zalloc(new_len);
> -               if (!*new_op)
> -                       return -ENOMEM;
> -
> -               scnprintf(*new_op, new_len, "%%gpr%.*s",
> -                       (int)(rm[2].rm_eo - rm[2].rm_so), old_op + rm[2].=
rm_so);
> -       } else if (!regexec(&sdt_op_regex2, old_op, 5, rm, 0)) {
> -               /*
> -                * -NUM(REG) or NUM(REG) or -NUM(%rREG) or NUM(%rREG) -->
> -                *      +/-NUM(%gprREG)
> -                */
> -               prefix =3D (rm[1].rm_so =3D=3D -1) ? '+' : '-';
> -
> -               new_len =3D 8;    /* +/- ( % g p r ) NULL */
> -               new_len +=3D (int)(rm[2].rm_eo - rm[2].rm_so);
> -               new_len +=3D (int)(rm[4].rm_eo - rm[4].rm_so);
> -
> -               *new_op =3D zalloc(new_len);
> -               if (!*new_op)
> -                       return -ENOMEM;
> -
> -               scnprintf(*new_op, new_len, "%c%.*s(%%gpr%.*s)", prefix,
> -                       (int)(rm[2].rm_eo - rm[2].rm_so), old_op + rm[2].=
rm_so,
> -                       (int)(rm[4].rm_eo - rm[4].rm_so), old_op + rm[4].=
rm_so);
> -       } else {
> -               pr_debug4("Skipping unsupported SDT argument: %s\n", old_=
op);
> -               return SDT_ARG_SKIP;
> -       }
> -
> -       return SDT_ARG_VALID;
> -}
> diff --git a/tools/perf/arch/x86/util/Build b/tools/perf/arch/x86/util/Bu=
ild
> index fad256252bb9..b7b401cfbd45 100644
> --- a/tools/perf/arch/x86/util/Build
> +++ b/tools/perf/arch/x86/util/Build
> @@ -2,7 +2,6 @@ perf-util-y +=3D header.o
>  perf-util-y +=3D tsc.o
>  perf-util-y +=3D pmu.o
>  perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
> -perf-util-y +=3D perf_regs.o
>  perf-util-y +=3D topdown.o
>  perf-util-y +=3D machine.o
>  perf-util-y +=3D event.o
> diff --git a/tools/perf/arch/x86/util/perf_regs.c b/tools/perf/arch/x86/u=
til/perf_regs.c
> deleted file mode 100644
> index 41141cebe226..000000000000
> --- a/tools/perf/arch/x86/util/perf_regs.c
> +++ /dev/null
> @@ -1,235 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <errno.h>
> -#include <string.h>
> -#include <regex.h>
> -#include <linux/kernel.h>
> -#include <linux/zalloc.h>
> -
> -#include "perf_regs.h"
> -#include "../../../perf-sys.h"
> -#include "../../../util/perf_regs.h"
> -#include "../../../util/debug.h"
> -#include "../../../util/event.h"
> -#include "../../../util/pmu.h"
> -#include "../../../util/pmus.h"
> -
> -struct sdt_name_reg {
> -       const char *sdt_name;
> -       const char *uprobe_name;
> -};
> -#define SDT_NAME_REG(n, m) {.sdt_name =3D "%" #n, .uprobe_name =3D "%" #=
m}
> -#define SDT_NAME_REG_END {.sdt_name =3D NULL, .uprobe_name =3D NULL}
> -
> -static const struct sdt_name_reg sdt_reg_tbl[] =3D {
> -       SDT_NAME_REG(eax, ax),
> -       SDT_NAME_REG(rax, ax),
> -       SDT_NAME_REG(al,  ax),
> -       SDT_NAME_REG(ah,  ax),
> -       SDT_NAME_REG(ebx, bx),
> -       SDT_NAME_REG(rbx, bx),
> -       SDT_NAME_REG(bl,  bx),
> -       SDT_NAME_REG(bh,  bx),
> -       SDT_NAME_REG(ecx, cx),
> -       SDT_NAME_REG(rcx, cx),
> -       SDT_NAME_REG(cl,  cx),
> -       SDT_NAME_REG(ch,  cx),
> -       SDT_NAME_REG(edx, dx),
> -       SDT_NAME_REG(rdx, dx),
> -       SDT_NAME_REG(dl,  dx),
> -       SDT_NAME_REG(dh,  dx),
> -       SDT_NAME_REG(esi, si),
> -       SDT_NAME_REG(rsi, si),
> -       SDT_NAME_REG(sil, si),
> -       SDT_NAME_REG(edi, di),
> -       SDT_NAME_REG(rdi, di),
> -       SDT_NAME_REG(dil, di),
> -       SDT_NAME_REG(ebp, bp),
> -       SDT_NAME_REG(rbp, bp),
> -       SDT_NAME_REG(bpl, bp),
> -       SDT_NAME_REG(rsp, sp),
> -       SDT_NAME_REG(esp, sp),
> -       SDT_NAME_REG(spl, sp),
> -
> -       /* rNN registers */
> -       SDT_NAME_REG(r8b,  r8),
> -       SDT_NAME_REG(r8w,  r8),
> -       SDT_NAME_REG(r8d,  r8),
> -       SDT_NAME_REG(r9b,  r9),
> -       SDT_NAME_REG(r9w,  r9),
> -       SDT_NAME_REG(r9d,  r9),
> -       SDT_NAME_REG(r10b, r10),
> -       SDT_NAME_REG(r10w, r10),
> -       SDT_NAME_REG(r10d, r10),
> -       SDT_NAME_REG(r11b, r11),
> -       SDT_NAME_REG(r11w, r11),
> -       SDT_NAME_REG(r11d, r11),
> -       SDT_NAME_REG(r12b, r12),
> -       SDT_NAME_REG(r12w, r12),
> -       SDT_NAME_REG(r12d, r12),
> -       SDT_NAME_REG(r13b, r13),
> -       SDT_NAME_REG(r13w, r13),
> -       SDT_NAME_REG(r13d, r13),
> -       SDT_NAME_REG(r14b, r14),
> -       SDT_NAME_REG(r14w, r14),
> -       SDT_NAME_REG(r14d, r14),
> -       SDT_NAME_REG(r15b, r15),
> -       SDT_NAME_REG(r15w, r15),
> -       SDT_NAME_REG(r15d, r15),
> -       SDT_NAME_REG_END,
> -};
> -
> -/*
> - * Perf only supports OP which is in  +/-NUM(REG)  form.
> - * Here plus-minus sign, NUM and parenthesis are optional,
> - * only REG is mandatory.
> - *
> - * SDT events also supports indirect addressing mode with a
> - * symbol as offset, scaled mode and constants in OP. But
> - * perf does not support them yet. Below are few examples.
> - *
> - * OP with scaled mode:
> - *     (%rax,%rsi,8)
> - *     10(%ras,%rsi,8)
> - *
> - * OP with indirect addressing mode:
> - *     check_action(%rip)
> - *     mp_+52(%rip)
> - *     44+mp_(%rip)
> - *
> - * OP with constant values:
> - *     $0
> - *     $123
> - *     $-1
> - */
> -#define SDT_OP_REGEX  "^([+\\-]?)([0-9]*)(\\(?)(%[a-z][a-z0-9]+)(\\)?)$"
> -
> -static regex_t sdt_op_regex;
> -
> -static int sdt_init_op_regex(void)
> -{
> -       static int initialized;
> -       int ret =3D 0;
> -
> -       if (initialized)
> -               return 0;
> -
> -       ret =3D regcomp(&sdt_op_regex, SDT_OP_REGEX, REG_EXTENDED);
> -       if (ret < 0) {
> -               pr_debug4("Regex compilation error.\n");
> -               return ret;
> -       }
> -
> -       initialized =3D 1;
> -       return 0;
> -}
> -
> -/*
> - * Max x86 register name length is 5(ex: %r15d). So, 6th char
> - * should always contain NULL. This helps to find register name
> - * length using strlen, instead of maintaining one more variable.
> - */
> -#define SDT_REG_NAME_SIZE  6
> -
> -/*
> - * The uprobe parser does not support all gas register names;
> - * so, we have to replace them (ex. for x86_64: %rax -> %ax).
> - * Note: If register does not require renaming, just copy
> - * paste as it is, but don't leave it empty.
> - */
> -static void sdt_rename_register(char *sdt_reg, int sdt_len, char *uprobe=
_reg)
> -{
> -       int i =3D 0;
> -
> -       for (i =3D 0; sdt_reg_tbl[i].sdt_name !=3D NULL; i++) {
> -               if (!strncmp(sdt_reg_tbl[i].sdt_name, sdt_reg, sdt_len)) =
{
> -                       strcpy(uprobe_reg, sdt_reg_tbl[i].uprobe_name);
> -                       return;
> -               }
> -       }
> -
> -       strncpy(uprobe_reg, sdt_reg, sdt_len);
> -}
> -
> -int arch_sdt_arg_parse_op(char *old_op, char **new_op)
> -{
> -       char new_reg[SDT_REG_NAME_SIZE] =3D {0};
> -       int new_len =3D 0, ret;
> -       /*
> -        * rm[0]:  +/-NUM(REG)
> -        * rm[1]:  +/-
> -        * rm[2]:  NUM
> -        * rm[3]:  (
> -        * rm[4]:  REG
> -        * rm[5]:  )
> -        */
> -       regmatch_t rm[6];
> -       /*
> -        * Max prefix length is 2 as it may contains sign(+/-)
> -        * and displacement 0 (Both sign and displacement 0 are
> -        * optional so it may be empty). Use one more character
> -        * to hold last NULL so that strlen can be used to find
> -        * prefix length, instead of maintaining one more variable.
> -        */
> -       char prefix[3] =3D {0};
> -
> -       ret =3D sdt_init_op_regex();
> -       if (ret < 0)
> -               return ret;
> -
> -       /*
> -        * If unsupported OR does not match with regex OR
> -        * register name too long, skip it.
> -        */
> -       if (strchr(old_op, ',') || strchr(old_op, '$') ||
> -           regexec(&sdt_op_regex, old_op, 6, rm, 0)   ||
> -           rm[4].rm_eo - rm[4].rm_so > SDT_REG_NAME_SIZE) {
> -               pr_debug4("Skipping unsupported SDT argument: %s\n", old_=
op);
> -               return SDT_ARG_SKIP;
> -       }
> -
> -       /*
> -        * Prepare prefix.
> -        * If SDT OP has parenthesis but does not provide
> -        * displacement, add 0 for displacement.
> -        *     SDT         Uprobe     Prefix
> -        *     -----------------------------
> -        *     +24(%rdi)   +24(%di)   +
> -        *     24(%rdi)    +24(%di)   +
> -        *     %rdi        %di
> -        *     (%rdi)      +0(%di)    +0
> -        *     -80(%rbx)   -80(%bx)   -
> -        */
> -       if (rm[3].rm_so !=3D rm[3].rm_eo) {
> -               if (rm[1].rm_so !=3D rm[1].rm_eo)
> -                       prefix[0] =3D *(old_op + rm[1].rm_so);
> -               else if (rm[2].rm_so !=3D rm[2].rm_eo)
> -                       prefix[0] =3D '+';
> -               else
> -                       scnprintf(prefix, sizeof(prefix), "+0");
> -       }
> -
> -       /* Rename register */
> -       sdt_rename_register(old_op + rm[4].rm_so, rm[4].rm_eo - rm[4].rm_=
so,
> -                           new_reg);
> -
> -       /* Prepare final OP which should be valid for uprobe_events */
> -       new_len =3D strlen(prefix)              +
> -                 (rm[2].rm_eo - rm[2].rm_so) +
> -                 (rm[3].rm_eo - rm[3].rm_so) +
> -                 strlen(new_reg)             +
> -                 (rm[5].rm_eo - rm[5].rm_so) +
> -                 1;                                    /* NULL */
> -
> -       *new_op =3D zalloc(new_len);
> -       if (!*new_op)
> -               return -ENOMEM;
> -
> -       scnprintf(*new_op, new_len, "%.*s%.*s%.*s%.*s%.*s",
> -                 strlen(prefix), prefix,
> -                 (int)(rm[2].rm_eo - rm[2].rm_so), old_op + rm[2].rm_so,
> -                 (int)(rm[3].rm_eo - rm[3].rm_so), old_op + rm[3].rm_so,
> -                 strlen(new_reg), new_reg,
> -                 (int)(rm[5].rm_eo - rm[5].rm_so), old_op + rm[5].rm_so)=
;
> -
> -       return SDT_ARG_VALID;
> -}
> diff --git a/tools/perf/util/perf-regs-arch/perf_regs_aarch64.c b/tools/p=
erf/util/perf-regs-arch/perf_regs_aarch64.c
> index 21a432671f04..1b536c60ceb4 100644
> --- a/tools/perf/util/perf-regs-arch/perf_regs_aarch64.c
> +++ b/tools/perf/util/perf-regs-arch/perf_regs_aarch64.c
> @@ -18,6 +18,92 @@
>  #define HWCAP_SVE      (1 << 22)
>  #endif
>
> +/* %xNUM */
> +#define SDT_OP_REGEX1  "^(x[1-2]?[0-9]|3[0-1])$"
> +
> +/* [sp], [sp, NUM] */
> +#define SDT_OP_REGEX2  "^\\[sp(, )?([0-9]+)?\\]$"
> +
> +static regex_t sdt_op_regex1, sdt_op_regex2;
> +
> +static int sdt_init_op_regex(void)
> +{
> +       static int initialized;
> +       int ret =3D 0;
> +
> +       if (initialized)
> +               return 0;
> +
> +       ret =3D regcomp(&sdt_op_regex1, SDT_OP_REGEX1, REG_EXTENDED);
> +       if (ret)
> +               goto error;
> +
> +       ret =3D regcomp(&sdt_op_regex2, SDT_OP_REGEX2, REG_EXTENDED);
> +       if (ret)
> +               goto free_regex1;
> +
> +       initialized =3D 1;
> +       return 0;
> +
> +free_regex1:
> +       regfree(&sdt_op_regex1);
> +error:
> +       pr_debug4("Regex compilation error.\n");
> +       return ret;
> +}
> +
> +/*
> + * SDT marker arguments on Arm64 uses %xREG or [sp, NUM], currently
> + * support these two formats.
> + */
> +int __perf_sdt_arg_parse_op_arm64(char *old_op, char **new_op)
> +{
> +       int ret, new_len;
> +       regmatch_t rm[5];
> +
> +       ret =3D sdt_init_op_regex();
> +       if (ret < 0)
> +               return ret;
> +
> +       if (!regexec(&sdt_op_regex1, old_op, 3, rm, 0)) {
> +               /* Extract xNUM */
> +               new_len =3D 2;    /* % NULL */
> +               new_len +=3D (int)(rm[1].rm_eo - rm[1].rm_so);
> +
> +               *new_op =3D zalloc(new_len);
> +               if (!*new_op)
> +                       return -ENOMEM;
> +
> +               scnprintf(*new_op, new_len, "%%%.*s",
> +                       (int)(rm[1].rm_eo - rm[1].rm_so), old_op + rm[1].=
rm_so);
> +       } else if (!regexec(&sdt_op_regex2, old_op, 5, rm, 0)) {
> +               /* [sp], [sp, NUM] or [sp,NUM] */
> +               new_len =3D 7;    /* + ( % s p ) NULL */
> +
> +               /* If the argument is [sp], need to fill offset '0' */
> +               if (rm[2].rm_so =3D=3D -1)
> +                       new_len +=3D 1;
> +               else
> +                       new_len +=3D (int)(rm[2].rm_eo - rm[2].rm_so);
> +
> +               *new_op =3D zalloc(new_len);
> +               if (!*new_op)
> +                       return -ENOMEM;
> +
> +               if (rm[2].rm_so =3D=3D -1)
> +                       scnprintf(*new_op, new_len, "+0(%%sp)");
> +               else
> +                       scnprintf(*new_op, new_len, "+%.*s(%%sp)",
> +                                 (int)(rm[2].rm_eo - rm[2].rm_so),
> +                                 old_op + rm[2].rm_so);
> +       } else {
> +               pr_debug4("Skipping unsupported SDT argument: %s\n", old_=
op);
> +               return SDT_ARG_SKIP;
> +       }
> +
> +       return SDT_ARG_VALID;
> +}
> +
>  uint64_t __perf_reg_mask_arm64(bool intr)
>  {
>         struct perf_event_attr attr =3D {
> diff --git a/tools/perf/util/perf-regs-arch/perf_regs_powerpc.c b/tools/p=
erf/util/perf-regs-arch/perf_regs_powerpc.c
> index 5211cc0c4e81..eb21a214990f 100644
> --- a/tools/perf/util/perf-regs-arch/perf_regs_powerpc.c
> +++ b/tools/perf/util/perf-regs-arch/perf_regs_powerpc.c
> @@ -19,6 +19,112 @@
>  #define PVR_POWER10            0x0080
>  #define PVR_POWER11            0x0082
>
> +/* REG or %rREG */
> +#define SDT_OP_REGEX1  "^(%r)?([1-2]?[0-9]|3[0-1])$"
> +
> +/* -NUM(REG) or NUM(REG) or -NUM(%rREG) or NUM(%rREG) */
> +#define SDT_OP_REGEX2  "^(\\-)?([0-9]+)\\((%r)?([1-2]?[0-9]|3[0-1])\\)$"
> +
> +static regex_t sdt_op_regex1, sdt_op_regex2;
> +
> +static int sdt_init_op_regex(void)
> +{
> +       static int initialized;
> +       int ret =3D 0;
> +
> +       if (initialized)
> +               return 0;
> +
> +       ret =3D regcomp(&sdt_op_regex1, SDT_OP_REGEX1, REG_EXTENDED);
> +       if (ret)
> +               goto error;
> +
> +       ret =3D regcomp(&sdt_op_regex2, SDT_OP_REGEX2, REG_EXTENDED);
> +       if (ret)
> +               goto free_regex1;
> +
> +       initialized =3D 1;
> +       return 0;
> +
> +free_regex1:
> +       regfree(&sdt_op_regex1);
> +error:
> +       pr_debug4("Regex compilation error.\n");
> +       return ret;
> +}
> +
> +/*
> + * Parse OP and convert it into uprobe format, which is, +/-NUM(%gprREG)=
.
> + * Possible variants of OP are:
> + *     Format          Example
> + *     -------------------------
> + *     NUM(REG)        48(18)
> + *     -NUM(REG)       -48(18)
> + *     NUM(%rREG)      48(%r18)
> + *     -NUM(%rREG)     -48(%r18)
> + *     REG             18
> + *     %rREG           %r18
> + *     iNUM            i0
> + *     i-NUM           i-1
> + *
> + * SDT marker arguments on Powerpc uses %rREG form with -mregnames flag
> + * and REG form with -mno-regnames. Here REG is general purpose register=
,
> + * which is in 0 to 31 range.

This powerpc comment looks a lot like ...

> + */
> +int __perf_sdt_arg_parse_op_powerpc(char *old_op, char **new_op)
> +{
> +       int ret, new_len;
> +       regmatch_t rm[5];
> +       char prefix;
> +
> +       /* Constant argument. Uprobe does not support it */
> +       if (old_op[0] =3D=3D 'i') {
> +               pr_debug4("Skipping unsupported SDT argument: %s\n", old_=
op);
> +               return SDT_ARG_SKIP;
> +       }
> +
> +       ret =3D sdt_init_op_regex();
> +       if (ret < 0)
> +               return ret;
> +
> +       if (!regexec(&sdt_op_regex1, old_op, 3, rm, 0)) {
> +               /* REG or %rREG --> %gprREG */
> +
> +               new_len =3D 5;    /* % g p r NULL */
> +               new_len +=3D (int)(rm[2].rm_eo - rm[2].rm_so);
> +
> +               *new_op =3D zalloc(new_len);
> +               if (!*new_op)
> +                       return -ENOMEM;
> +
> +               scnprintf(*new_op, new_len, "%%gpr%.*s",
> +                       (int)(rm[2].rm_eo - rm[2].rm_so), old_op + rm[2].=
rm_so);
> +       } else if (!regexec(&sdt_op_regex2, old_op, 5, rm, 0)) {
> +               /*
> +                * -NUM(REG) or NUM(REG) or -NUM(%rREG) or NUM(%rREG) -->
> +                *      +/-NUM(%gprREG)
> +                */
> +               prefix =3D (rm[1].rm_so =3D=3D -1) ? '+' : '-';
> +
> +               new_len =3D 8;    /* +/- ( % g p r ) NULL */
> +               new_len +=3D (int)(rm[2].rm_eo - rm[2].rm_so);
> +               new_len +=3D (int)(rm[4].rm_eo - rm[4].rm_so);
> +
> +               *new_op =3D zalloc(new_len);
> +               if (!*new_op)
> +                       return -ENOMEM;
> +
> +               scnprintf(*new_op, new_len, "%c%.*s(%%gpr%.*s)", prefix,
> +                       (int)(rm[2].rm_eo - rm[2].rm_so), old_op + rm[2].=
rm_so,
> +                       (int)(rm[4].rm_eo - rm[4].rm_so), old_op + rm[4].=
rm_so);
> +       } else {
> +               pr_debug4("Skipping unsupported SDT argument: %s\n", old_=
op);
> +               return SDT_ARG_SKIP;
> +       }
> +
> +       return SDT_ARG_VALID;
> +}
> +
>  #if defined(__powerpc64__) && defined(__powerpc__)
>  uint64_t __perf_reg_mask_powerpc(bool intr)
>  {
> diff --git a/tools/perf/util/perf-regs-arch/perf_regs_x86.c b/tools/perf/=
util/perf-regs-arch/perf_regs_x86.c
> index d319106dc7b2..47de64d45168 100644
> --- a/tools/perf/util/perf-regs-arch/perf_regs_x86.c
> +++ b/tools/perf/util/perf-regs-arch/perf_regs_x86.c
> @@ -14,6 +14,227 @@
>  #include "../../perf-sys.h"
>  #include "../../arch/x86/include/perf_regs.h"
>
> +struct sdt_name_reg {
> +       const char *sdt_name;
> +       const char *uprobe_name;
> +};
> +#define SDT_NAME_REG(n, m) {.sdt_name =3D "%" #n, .uprobe_name =3D "%" #=
m}
> +#define SDT_NAME_REG_END {.sdt_name =3D NULL, .uprobe_name =3D NULL}
> +
> +static const struct sdt_name_reg sdt_reg_tbl[] =3D {
> +       SDT_NAME_REG(eax, ax),
> +       SDT_NAME_REG(rax, ax),
> +       SDT_NAME_REG(al,  ax),
> +       SDT_NAME_REG(ah,  ax),
> +       SDT_NAME_REG(ebx, bx),
> +       SDT_NAME_REG(rbx, bx),
> +       SDT_NAME_REG(bl,  bx),
> +       SDT_NAME_REG(bh,  bx),
> +       SDT_NAME_REG(ecx, cx),
> +       SDT_NAME_REG(rcx, cx),
> +       SDT_NAME_REG(cl,  cx),
> +       SDT_NAME_REG(ch,  cx),
> +       SDT_NAME_REG(edx, dx),
> +       SDT_NAME_REG(rdx, dx),
> +       SDT_NAME_REG(dl,  dx),
> +       SDT_NAME_REG(dh,  dx),
> +       SDT_NAME_REG(esi, si),
> +       SDT_NAME_REG(rsi, si),
> +       SDT_NAME_REG(sil, si),
> +       SDT_NAME_REG(edi, di),
> +       SDT_NAME_REG(rdi, di),
> +       SDT_NAME_REG(dil, di),
> +       SDT_NAME_REG(ebp, bp),
> +       SDT_NAME_REG(rbp, bp),
> +       SDT_NAME_REG(bpl, bp),
> +       SDT_NAME_REG(rsp, sp),
> +       SDT_NAME_REG(esp, sp),
> +       SDT_NAME_REG(spl, sp),
> +
> +       /* rNN registers */
> +       SDT_NAME_REG(r8b,  r8),
> +       SDT_NAME_REG(r8w,  r8),
> +       SDT_NAME_REG(r8d,  r8),
> +       SDT_NAME_REG(r9b,  r9),
> +       SDT_NAME_REG(r9w,  r9),
> +       SDT_NAME_REG(r9d,  r9),
> +       SDT_NAME_REG(r10b, r10),
> +       SDT_NAME_REG(r10w, r10),
> +       SDT_NAME_REG(r10d, r10),
> +       SDT_NAME_REG(r11b, r11),
> +       SDT_NAME_REG(r11w, r11),
> +       SDT_NAME_REG(r11d, r11),
> +       SDT_NAME_REG(r12b, r12),
> +       SDT_NAME_REG(r12w, r12),
> +       SDT_NAME_REG(r12d, r12),
> +       SDT_NAME_REG(r13b, r13),
> +       SDT_NAME_REG(r13w, r13),
> +       SDT_NAME_REG(r13d, r13),
> +       SDT_NAME_REG(r14b, r14),
> +       SDT_NAME_REG(r14w, r14),
> +       SDT_NAME_REG(r14d, r14),
> +       SDT_NAME_REG(r15b, r15),
> +       SDT_NAME_REG(r15w, r15),
> +       SDT_NAME_REG(r15d, r15),
> +       SDT_NAME_REG_END,
> +};
> +
> +/*
> + * Perf only supports OP which is in  +/-NUM(REG)  form.
> + * Here plus-minus sign, NUM and parenthesis are optional,
> + * only REG is mandatory.
> + *
> + * SDT events also supports indirect addressing mode with a
> + * symbol as offset, scaled mode and constants in OP. But
> + * perf does not support them yet. Below are few examples.
> + *
> + * OP with scaled mode:
> + *     (%rax,%rsi,8)
> + *     10(%ras,%rsi,8)
> + *
> + * OP with indirect addressing mode:
> + *     check_action(%rip)
> + *     mp_+52(%rip)
> + *     44+mp_(%rip)
> + *
> + * OP with constant values:
> + *     $0
> + *     $123
> + *     $-1
> + */
> +#define SDT_OP_REGEX  "^([+\\-]?)([0-9]*)(\\(?)(%[a-z][a-z0-9]+)(\\)?)$"
> +
> +static regex_t sdt_op_regex;
> +
> +static int sdt_init_op_regex(void)
> +{
> +       static int initialized;
> +       int ret =3D 0;
> +
> +       if (initialized)
> +               return 0;
> +
> +       ret =3D regcomp(&sdt_op_regex, SDT_OP_REGEX, REG_EXTENDED);
> +       if (ret < 0) {
> +               pr_debug4("Regex compilation error.\n");
> +               return ret;
> +       }
> +
> +       initialized =3D 1;
> +       return 0;
> +}
> +
> +/*
> + * Max x86 register name length is 5(ex: %r15d). So, 6th char
> + * should always contain NULL. This helps to find register name
> + * length using strlen, instead of maintaining one more variable.
> + */
> +#define SDT_REG_NAME_SIZE  6
> +
> +/*
> + * The uprobe parser does not support all gas register names;
> + * so, we have to replace them (ex. for x86_64: %rax -> %ax).
> + * Note: If register does not require renaming, just copy
> + * paste as it is, but don't leave it empty.
> + */
> +static void sdt_rename_register(char *sdt_reg, int sdt_len, char *uprobe=
_reg)
> +{
> +       int i =3D 0;
> +
> +       for (i =3D 0; sdt_reg_tbl[i].sdt_name !=3D NULL; i++) {
> +               if (!strncmp(sdt_reg_tbl[i].sdt_name, sdt_reg, sdt_len)) =
{
> +                       strcpy(uprobe_reg, sdt_reg_tbl[i].uprobe_name);
> +                       return;
> +               }
> +       }
> +
> +       strncpy(uprobe_reg, sdt_reg, sdt_len);
> +}
> +
> +int __perf_sdt_arg_parse_op_x86(char *old_op, char **new_op)
> +{
> +       char new_reg[SDT_REG_NAME_SIZE] =3D {0};
> +       int new_len =3D 0, ret;
> +       /*
> +        * rm[0]:  +/-NUM(REG)
> +        * rm[1]:  +/-
> +        * rm[2]:  NUM
> +        * rm[3]:  (
> +        * rm[4]:  REG
> +        * rm[5]:  )
> +        */
> +       regmatch_t rm[6];
> +       /*
> +        * Max prefix length is 2 as it may contains sign(+/-)
> +        * and displacement 0 (Both sign and displacement 0 are
> +        * optional so it may be empty). Use one more character
> +        * to hold last NULL so that strlen can be used to find
> +        * prefix length, instead of maintaining one more variable.
> +        */
> +       char prefix[3] =3D {0};
> +
> +       ret =3D sdt_init_op_regex();
> +       if (ret < 0)
> +               return ret;
> +
> +       /*
> +        * If unsupported OR does not match with regex OR
> +        * register name too long, skip it.
> +        */
> +       if (strchr(old_op, ',') || strchr(old_op, '$') ||
> +           regexec(&sdt_op_regex, old_op, 6, rm, 0)   ||
> +           rm[4].rm_eo - rm[4].rm_so > SDT_REG_NAME_SIZE) {
> +               pr_debug4("Skipping unsupported SDT argument: %s\n", old_=
op);
> +               return SDT_ARG_SKIP;
> +       }
> +
> +       /*
> +        * Prepare prefix.
> +        * If SDT OP has parenthesis but does not provide
> +        * displacement, add 0 for displacement.
> +        *     SDT         Uprobe     Prefix
> +        *     -----------------------------
> +        *     +24(%rdi)   +24(%di)   +
> +        *     24(%rdi)    +24(%di)   +
> +        *     %rdi        %di
> +        *     (%rdi)      +0(%di)    +0
> +        *     -80(%rbx)   -80(%bx)   -
> +        */

... this x86 comment. I wonder if we had standard functions like
sdt_reg_name or uprobe_reg_name, similar to  perf_reg_name, and maybe
that perf_reg_name was the default when an ELF machine isn't
implemented, whether we could make this code shared and support more
than just arm64, powerpc and x86.

Again this is likely follow up clean up.

> +       if (rm[3].rm_so !=3D rm[3].rm_eo) {
> +               if (rm[1].rm_so !=3D rm[1].rm_eo)
> +                       prefix[0] =3D *(old_op + rm[1].rm_so);
> +               else if (rm[2].rm_so !=3D rm[2].rm_eo)
> +                       prefix[0] =3D '+';
> +               else
> +                       scnprintf(prefix, sizeof(prefix), "+0");
> +       }
> +
> +       /* Rename register */
> +       sdt_rename_register(old_op + rm[4].rm_so, rm[4].rm_eo - rm[4].rm_=
so,
> +                           new_reg);
> +
> +       /* Prepare final OP which should be valid for uprobe_events */
> +       new_len =3D strlen(prefix)              +
> +                 (rm[2].rm_eo - rm[2].rm_so) +
> +                 (rm[3].rm_eo - rm[3].rm_so) +
> +                 strlen(new_reg)             +
> +                 (rm[5].rm_eo - rm[5].rm_so) +
> +                 1;                                    /* NULL */
> +
> +       *new_op =3D zalloc(new_len);
> +       if (!*new_op)
> +               return -ENOMEM;
> +
> +       scnprintf(*new_op, new_len, "%.*s%.*s%.*s%.*s%.*s",
> +                 strlen(prefix), prefix,
> +                 (int)(rm[2].rm_eo - rm[2].rm_so), old_op + rm[2].rm_so,
> +                 (int)(rm[3].rm_eo - rm[3].rm_so), old_op + rm[3].rm_so,
> +                 strlen(new_reg), new_reg,
> +                 (int)(rm[5].rm_eo - rm[5].rm_so), old_op + rm[5].rm_so)=
;
> +
> +       return SDT_ARG_VALID;
> +}
> +
>  uint64_t __perf_reg_mask_x86(bool intr)
>  {
>         struct perf_event_attr attr =3D {
> diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
> index 900929cff4b5..4082e8da9633 100644
> --- a/tools/perf/util/perf_regs.c
> +++ b/tools/perf/util/perf_regs.c
> @@ -7,10 +7,27 @@
>  #include "debug.h"
>  #include "dwarf-regs.h"
>
> -int __weak arch_sdt_arg_parse_op(char *old_op __maybe_unused,
> -                                char **new_op __maybe_unused)
> +int perf_sdt_arg_parse_op(uint16_t e_machine, char *old_op, char **new_o=
p)
>  {
> -       return SDT_ARG_SKIP;
> +       int ret =3D SDT_ARG_SKIP;
> +
> +       switch (e_machine) {
> +       case EM_AARCH64:
> +               ret =3D __perf_sdt_arg_parse_op_arm64(old_op, new_op);
> +               break;
> +       case EM_PPC:
> +       case EM_PPC64:
> +               ret =3D __perf_sdt_arg_parse_op_powerpc(old_op, new_op);
> +               break;
> +       case EM_386:
> +       case EM_X86_64:
> +               ret =3D __perf_sdt_arg_parse_op_x86(old_op, new_op);
> +               break;
> +       default:

I think there should be at least a debug warning here.

Thanks!
Ian

> +               break;
> +       }
> +
> +       return ret;
>  }
>
>  uint64_t perf_intr_reg_mask(uint16_t e_machine)
> diff --git a/tools/perf/util/perf_regs.h b/tools/perf/util/perf_regs.h
> index 8531584bc1b1..77c0b517b94a 100644
> --- a/tools/perf/util/perf_regs.h
> +++ b/tools/perf/util/perf_regs.h
> @@ -12,7 +12,7 @@ enum {
>         SDT_ARG_SKIP,
>  };
>
> -int arch_sdt_arg_parse_op(char *old_op, char **new_op);
> +int perf_sdt_arg_parse_op(uint16_t e_machine, char *old_op, char **new_o=
p);
>  uint64_t perf_intr_reg_mask(uint16_t e_machine);
>  uint64_t perf_user_reg_mask(uint16_t e_machine);
>
> @@ -21,6 +21,7 @@ int perf_reg_value(u64 *valp, struct regs_dump *regs, i=
nt id);
>  uint64_t perf_arch_reg_ip(uint16_t e_machine);
>  uint64_t perf_arch_reg_sp(uint16_t e_machine);
>
> +int __perf_sdt_arg_parse_op_arm64(char *old_op, char **new_op);
>  uint64_t __perf_reg_mask_arm64(bool intr);
>  const char *__perf_reg_name_arm64(int id);
>  uint64_t __perf_reg_ip_arm64(void);
> @@ -46,6 +47,7 @@ const char *__perf_reg_name_mips(int id);
>  uint64_t __perf_reg_ip_mips(void);
>  uint64_t __perf_reg_sp_mips(void);
>
> +int __perf_sdt_arg_parse_op_powerpc(char *old_op, char **new_op);
>  uint64_t __perf_reg_mask_powerpc(bool intr);
>  const char *__perf_reg_name_powerpc(int id);
>  uint64_t __perf_reg_ip_powerpc(void);
> @@ -61,6 +63,7 @@ const char *__perf_reg_name_s390(int id);
>  uint64_t __perf_reg_ip_s390(void);
>  uint64_t __perf_reg_sp_s390(void);
>
> +int __perf_sdt_arg_parse_op_x86(char *old_op, char **new_op);
>  uint64_t __perf_reg_mask_x86(bool intr);
>  const char *__perf_reg_name_x86(int id);
>  uint64_t __perf_reg_ip_x86(void);
> diff --git a/tools/perf/util/probe-file.c b/tools/perf/util/probe-file.c
> index 5069fb61f48c..f78c3bc3d601 100644
> --- a/tools/perf/util/probe-file.c
> +++ b/tools/perf/util/probe-file.c
> @@ -28,6 +28,7 @@
>  #include "session.h"
>  #include "perf_regs.h"
>  #include "string2.h"
> +#include "dwarf-regs.h"
>
>  /* 4096 - 2 ('\n' + '\0') */
>  #define MAX_CMDLEN 4094
> @@ -784,7 +785,7 @@ static int synthesize_sdt_probe_arg(struct strbuf *bu=
f, int i, const char *arg)
>                 op =3D desc;
>         }
>
> -       ret =3D arch_sdt_arg_parse_op(op, &new_op);
> +       ret =3D perf_sdt_arg_parse_op(EM_HOST, op, &new_op);
>
>         if (ret < 0)
>                 goto error;
> --
> 2.34.1
>

