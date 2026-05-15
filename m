Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E4BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 19:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYpIIZ9l/Mh5nFdtuzxg/eCZabaH9dxjddO1/8L86VA=; b=pD/pMpF5NuGR8EpgWEOkIj2Pga
	LpxfCtB3l28Tfz/7v1czb4PKWg64uYUg7Vh54fBCwNj7XSuptoyLTnbpplE0ou068/mlR+RKRIbRR
	+UKeAt893FqilfoQXfRZj+J9hDiWYXQuvQXufkKgHKoVriidPZbmnYuUZVAePxfLYh7PXYdAmok9H
	rjBYiIYNa6hQ41U0AprtehXEPfEYfUg4wdMvzpGQU1t7Be0i8gzE37AU/MaYQnNnG8MZQ5zLLk228
	lh6nGJOOLDFYZl7cj8L9jD93RZp7zQ0OHZzAYnTvHSOvN4BkGqKRS/XW6rSbxqZsDjMwQKN0h5Vpp
	n0Pl56IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyNE-00000009EcS-2m6J;
	Fri, 15 May 2026 19:39:04 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyNB-00000009EbD-0ySE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 19:39:02 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ba180a022dso6445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 12:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778873940; cv=none;
        d=google.com; s=arc-20240605;
        b=ixC6/1QBQIQVdztaKyEKnqdNm8YPUXbj5zCnb6K6AeDYVvT6ryu8is8Z8V8RQ8dR2R
         P2EsuN2yW6smQ+BgmtV2MYF/VkFLMV0srGu8jFDC2k49n4YegJ5sUoxuoLaDq9gKOs96
         nrUam9f+4fS8x7IjjjtvaNB1z480jsxFuvDCn5WJgH1Qe40Ec5TFripmQBLOcwUqNkOa
         Cn7DLY4OAb6WktMK/qPh/illCAH8RAra9VXkOygLwFQ9vMpJOlY1ooEqSK4Vo0ZTOnqx
         t3DjCDz+ELndps5kCoPv12Qk9OuRoYn8h8NQ1B8ZDmOEKBeEl4eKqVZgkX6akGfYm8+6
         n7eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IYpIIZ9l/Mh5nFdtuzxg/eCZabaH9dxjddO1/8L86VA=;
        fh=5lT1jt0H8oeiDYQDUjvTYonVU3495sJSEsv/juefXvI=;
        b=YFFR5ZhFjlsVJ+8V98dZDd6uHnzW7QwBe+vTWM9zWRYpd0qysDw2eOP1re/Xsq544K
         g03eXU3j8TkrjgZHhG62U5sA8xq2uoYFW9eAe+2KsATZWGSKOuZuQD3Pgw5H3b7TElvK
         bYSwtxNF0zWfOM/ZqL892BQzLbq+UKC2Dapyh9x0RImjqExvA/YabuGaKj6oGovKDXrI
         KlRODRGysg5u9LzXcz8DcdfI0qoMV9cg/ghUvzrK066ZdkcuTevj4IhS9WDz+KaL6Uey
         T2scT3JZF0PWPxTTY9QP4S+qZF0QO5jDobpIqDq2Mgu6N31X2ogdRyR9caYnRmuGDv8X
         5QEQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778873940; x=1779478740; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYpIIZ9l/Mh5nFdtuzxg/eCZabaH9dxjddO1/8L86VA=;
        b=N3PnoTEKObD21YKynAguLy0yF7jIP4Mg9SCglHt04GJw50wZL59Mn2octW37Q1U3On
         UgRAPLGPRK/Ymj9HREvkqxvDcW3gflQK7LmReuk6mkHYWEknzsn26bn08+65ukFI2qDT
         ni662FgVaNS7A3hA5iCyM77cejyShGUBg2+9Qmb+JYMGwEu0fnDpVOfeePUY3R+IePLK
         Fo1M5UloZqDeDXc64ZAGAlv30zU/G2nx+iMKg9lx/1q72eEV9/TuispH0/MBYXtizcU1
         KqpByMbIZoMULT4iqaREVFF6F7w/IXyRoZLwhXedLB5ysTufBpQey3OGauJwW+VoAzfk
         7FrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778873940; x=1779478740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IYpIIZ9l/Mh5nFdtuzxg/eCZabaH9dxjddO1/8L86VA=;
        b=Fv/SSnSFEZRjHt08WO21jmsOJZZTmbiuLuzZy2yx7JYnPriuhgAZsvdiOGJPc0n6Un
         KcutncLty6MeUmR43rI+56himareP+0cI17BhAgDsurRxD1AInuKVYQnnp/PvrN7YZQ2
         5fa9U6Yccf9wBcHaPFGlRTGDDLbTMBzmWNxyUjbEQL+BKJwbgp3CApFCfZAQPPd4H6a7
         /vGgCZPRJMbioPkj0nyRqK7y+oBLy7rF4owwJYsHI9VaXJEwTEBIidpAb+qsI3uvE7RW
         5MUVMvRt5Fh4E2vmZwD5nbaS0wH8Z8aoLbnVbXUux0GVkzmDbBm+P0K3lA98IOf9GtQy
         p4sw==
X-Forwarded-Encrypted: i=1; AFNElJ8vA+E5VOzS/Wz1DUEEICLgAMqDP3GQ/dIHmSlZlj2Cu0caSOrCiGmHG8doAeOxG7nuWFfqEC58545fJvqJMS17@lists.infradead.org
X-Gm-Message-State: AOJu0YwvqHA/crZkWOs6zbh044RAdb6dJtueZxb+NCp6JJKEw+yhoJNT
	Mf7w8GGlgUcUneGA3Ut/x8kegK0gIfrcVvIBWILHNg/OouEw/HwWFizbcDNSO64CYkoo4W8l3e/
	fgYhWifS326NJvduLdx5WQkg0JVVCbuOnioNTIcea
X-Gm-Gg: Acq92OEGoqX401W/dZ0GO4Nl2fQWyZxlyYRRKDJhlbj2loXLdynbQB/YbCfXMGTeANa
	9T1vxTuBa6z/Y1kOYEFQL5dNm8jNmgHO6QldEZhSN02wFX9pPVVMRYEDUDrNXkauJ6qkzp1Otj/
	nZM5mff0j1h0vKqIvv4AQ1nz7Md+QgykbqXfx9ZZkFD7eLHDRpaGntxQvxRLMrcWUm2ZeEZyH12
	jPtQJtmTb6xl10ebfQPuphLxzWQOpCQW1y56Yw0g9mGKKhBl4mlReiKf8bqvbgLUCapaGwUcbj6
	Zfzx7FxXNzgExgs3ukw=
X-Received: by 2002:a17:902:d502:b0:2bd:bbe:e3a3 with SMTP id
 d9443c01a7336-2bda0d8369amr548535ad.10.1778873939803; Fri, 15 May 2026
 12:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260413024805.1316480-1-irogers@google.com> <20260513233151.572332-1-irogers@google.com>
 <20260513233151.572332-5-irogers@google.com> <agdyluuau3wPQOtX@x1>
In-Reply-To: <agdyluuau3wPQOtX@x1>
From: Ian Rogers <irogers@google.com>
Date: Fri, 15 May 2026 12:38:48 -0700
X-Gm-Features: AVHnY4Lb9u9dPRlfZ_lWNCr7BMoBHYS17-9qKyqj0HY7xDzks8g3D3teRStrsVs
Message-ID: <CAP-5=fUeGOSH1LO1oSbWnpmXfv_RzxfFE+YCQ07PC19gLHDEsA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] perf unwind-libunwind: Make libunwind register
 reading cross platform
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, namhyung@kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Li Guan <guanli.oerv@isrc.iscas.ac.cn>, 
	9erthalion6@gmail.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	howardchu95@gmail.com, john.g.garry@oracle.com, jolsa@kernel.org, 
	leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_123901_282414_7E469B1C 
X-CRM114-Status: GOOD (  22.03  )
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

On Fri, May 15, 2026 at 12:23=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Wed, May 13, 2026 at 04:31:48PM -0700, Ian Rogers wrote:
> > --- /dev/null
> > +++ b/tools/perf/util/libunwind-arch/libunwind-ppc32.c
> > @@ -0,0 +1,31 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +#include "libunwind-arch.h"
> > +#include "../debug.h"
> > +#include "../../../arch/powerpc/include/uapi/asm/perf_regs.h"
> > +#include <linux/compiler.h>
> > +#include <errno.h>
> > +
> > +#ifdef HAVE_LIBUNWIND_PPC32_SUPPORT
> > +#include <libunwind-ppc32.h>
> > +#endif
> > +
> > +int __get_perf_regnum_for_unw_regnum_ppc32(int unw_regnum __maybe_unus=
ed)
> > +{
> > +#ifndef HAVE_LIBUNWIND_PPC32_SUPPORT
> > +     return -EINVAL;
> > +#else
> > +     switch (unw_regnum) {
> > +     case UNW_PPC32_R0 ... UNW_PPC32_R31:
> > +             return unw_regnum - UNW_PPC32_R0 + PERF_REG_POWERPC_R0;
> > +     case UNW_PPC32_LR:
> > +             return PERF_REG_POWERPC_LINK;
> > +     case UNW_PPC32_CTR:
> > +             return PERF_REG_POWERPC_CTR;
> > +     case UNW_PPC32_XER:
> > +             return PERF_REG_POWERPC_XER;
> > +     default:
> > +             pr_err("unwind: invalid reg id %d\n", unw_regnum);
> > +             return -EINVAL;
> > +     }
> > +#endif // HAVE_LIBUNWIND_PPC32_SUPPORT
>
> To address this local sashiko comment:
>
> ------------------------------------------------------------
> Is the instruction pointer (NIP) intentionally omitted from this switch
> statement?
>
> When libunwind attempts to read the instruction pointer, will access_reg(=
)
> hit the default case here and return -EINVAL, causing stack unwinding
> to fail on 32-bit PowerPC architectures?
> For comparison, the 64-bit implementation in libunwind-ppc64.c correctly
> maps UNW_PPC64_NIP to PERF_REG_POWERPC_NIP.
> ------------------------------------------------------------
>
> I ammended this patch with:
>
> =E2=AC=A2 [acme@toolbx perf-tools-next]$ vim tools/perf/util/libunwind-ar=
ch/libunwind-ppc32.c
> =E2=AC=A2 [acme@toolbx perf-tools-next]$ git diff
> diff --git a/tools/perf/util/libunwind-arch/libunwind-ppc32.c b/tools/per=
f/util/libunwind-arch/libunwind-ppc32.c
> index bcdeed34d0a81b8d..976a160304073582 100644
> --- a/tools/perf/util/libunwind-arch/libunwind-ppc32.c
> +++ b/tools/perf/util/libunwind-arch/libunwind-ppc32.c
> @@ -23,6 +23,8 @@ int __get_perf_regnum_for_unw_regnum_ppc32(int unw_regn=
um __maybe_unused)
>                 return PERF_REG_POWERPC_CTR;
>         case UNW_PPC32_XER:
>                 return PERF_REG_POWERPC_XER;
> +       case UNW_PPC32_NIP:
> +               return PERF_REG_POWERPC_NIP;
>         default:
>                 pr_err("unwind: invalid reg id %d\n", unw_regnum);
>                 return -EINVAL;
> =E2=AC=A2 [acme@toolbx perf-tools-next]$
>
> Ok? It was the only issue found in this patch.

Looks good, the NIP is in the original code that I copied, so I don't
understand how I lost this, but good catch!

Thanks,
Ian

> - Arnaldo

