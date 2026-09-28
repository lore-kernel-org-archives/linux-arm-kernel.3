Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647D4C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQVE+Yt78Z3pfyI+mWf7Zu1XcCvdZQxX7b3ZOkZzIX8=; b=VKcZK1u7EnMmHVBpyEK60FqH3W
	bDmRcgFVq+G1TnaxIsJORx6MvZCIYxPAiGOLDKTRp1oU5XrKf+LWnRp5lKW4ZfyZ079xmeOLFUgwY
	h4MnpGD8Gfu/as/BWsNXPu75MI2O+naaCETrN0GYLvLBoEBnsUX0UxFtGx9TSLW/UjZD7ov6QV7Sw
	pE3s3SCrUdgNCBuifeGEjKUfpAEjbPw15CpsDcVy6XBY45ENQ5U3bFnvBNanqUjRxyaDpncmgNwfK
	w+iwMaJd8UduVe/fqwEJXyuBN3q4nShSaqpOn7UiUkbBRJ5nahJ77Jr1G/dZaZ8M0yeOvsJD4ygDG
	w7GtCQog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBck-00000000gT9-3g01;
	Mon, 28 Sep 2026 13:42:30 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBch-00000000gS1-44bA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:42:29 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so5846205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790602946; cv=none;
        d=google.com; s=arc-20260327;
        b=heYdB2Po5VLhgdpYHAjw7usZe4Drkm6IuMY9ttn8vhu5XPH72IatJFBqUt5O1pt86m
         fF3xI+i8M5z4J1CBwjnuEf2r3s3dfhcAF2TQPPACDpOzHTHeiMhOeSx4uu+bNPhO0Vt1
         QnHM55tDWkbW+uZS4JOu0pZH+AtSzZjcUyHDMGOFjy+7uV0P57U/bRwPuB0/83xHnJB2
         R36D0+MWZgaDUv7pCO7zDyRGpjt9qywEKecApoDvgYjPH64E99ctZfVLL3mdiLpbRgE3
         /hW7ah+2cFqYeGL0kzNgWtbmiJPCSjDFm2n+k2Wn0exlxasW1W78f+DDHYEXMx+EPcHJ
         sECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BQVE+Yt78Z3pfyI+mWf7Zu1XcCvdZQxX7b3ZOkZzIX8=;
        fh=jXfACrMHaz7QYf8w8P+5UoK4b92cMPaGU2ol1PxR8r4=;
        b=FX/NB4z4SkTRMjC43sE9KJ6MWwef/vAbK0VGQzQ1kT2LUObsprEb28U+bR+j56s6lj
         UvqqzamVlVor+V4Oa28hfz5dE84q8tc4wjp85CtlgkKMzXJHfPAGqr6kVW/HjgbJF1Lp
         xY7ld4qFLNPcGJLuMh7Yov7rYTwc2SEar05Os63lKlJDSfI2iscA2hIevw8ddqhEIYeh
         MSOgn6h8vZoX1yhSS8ccDZgJFkBO8ypf/Sq1HYEhcSY/mkL3/dfTqSyEKx82xQmy+SPf
         mL6iRvqYjCmQqpavoyhwkHWT8c1O6oc6zX7VsU/K5xZpCH9+QR9E5PZGis+x+6msvbQS
         7BaQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790602946; x=1791207746; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BQVE+Yt78Z3pfyI+mWf7Zu1XcCvdZQxX7b3ZOkZzIX8=;
        b=niwhbwLTuW8Vl2Sy256EmciOoUdmdCQ17JiQHi3OSWaon68nxWL5roJhjwegVt4L//
         U+bh9iCdF7Z2GFjnabTs9ObzOiTpSvbLwWjnpBtnMIrwTqIfAXMYYRyxmf6rZitYal3R
         FrvD1OR+1REkHgDefeIh3QfFFggveaEvUHuBJKyh9DF1xYZNh9oIwxVxkpoK0h/YGR4T
         bfR30p5WtEE2BUu1IGKXyRQgtNf3Em7F6OtSfWIbJxMfduiH0YcNgxfhNkQlDl2EVfjl
         sdFPZn5Zt+kLHzrfJH5a4OzQhy1awjTJZvntdvVVidqZWeDfAkfA4gs/TO5yv58fM1U3
         bjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602946; x=1791207746;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQVE+Yt78Z3pfyI+mWf7Zu1XcCvdZQxX7b3ZOkZzIX8=;
        b=Mdjlz+PMBpVN5IJ6sItfVz5chk7Bds32JDwdDCNpRuElWNQUDGzFi3UqBf9HHAtSY8
         MGzF1W7ZF8aVGuKpraOv+A34SZRPqB8MM/NkwXb03jXi6q/tQQw2WwG0ABoCMLID9dWP
         EkZ/OKVT2j63DO7yUSmRKdT1Xv/B6BdnKNJxd+t4PMGKS/RTpehwwQUf6OB8QhNXtCkx
         2ht1eeCBL1cI5oYKWq+DfQq4cm7L/W8isUFSr8zAYmlWyWHE/m6Fr3fQ5wg0zaQge1EH
         YWFA7MKh3ZYsw4Uzk4wnYh200O1iqG3l/BodOOlr6nCKCHKyOAZF5GReC9/7bIQ30U6c
         S0qw==
X-Forwarded-Encrypted: i=1; AKwUvBzB4VgrxzYqNKfp6/oDqDlhlXDiYuIOFEkf0ej1cfosm2sWlOl4X0sEGEsUwrj2+LymPW4cH8l74Q6E9W0LyKG5@lists.infradead.org
X-Gm-Message-State: AFuF++mwSSVL8WKEOJj8dCJUtmlY11/Zet5QdgIqX5HdznxZx6klDhrL
	86K7IfbFu8echovf3yvqsk3ts8F8GmR88fvEoOw78igi1upkQv5+wMCszaED5xCUHRpr5tKLq80
	hziNMNtLlHOZOqhpjFXL14hukijariftIAQCpZJWXuw==
X-Gm-Gg: AYBFou3n9CPog72BmCdKWGQ2/u+0TJRlELX9gQ/p5oN74GEv+SMFq4iApAG58Na8jFe
	zHpSdAc3yh1l7AGo8zm6prg5hXUThBeCQJ+xjOs1wkDPaOS4fQ6cZDG7vG/R6BJKg6In7EmS9Wc
	3VVslNJinmMSXh0K1cet8f1BQe63EUJYD/B5ojd6PQUc7V9IGVOG6f/3UGV3QQEQ61fdvzqdVD1
	kewwAnW4NDGfuQRgsu/I3wYPeF5/SPJYYToaGjzR8njbMI5XR4ntrPbtG+h3hatZr2fBtS9S3DT
	5dR85KPudxUyBq8tGNLPcdPYanMC6u6mJX26sJC2MOMsHj0v879kx9QzFOleQun+GadU4QKjEsq
	yGeQmhaInZD16JqTJDFpUFN7+ftzSwHRZLyCloUfibcZSmZf4VDiwW6cq5OJzSepR1BI8MIeGgo
	413n3EtOXkbw==
X-Received: by 2002:a05:600c:46d4:b0:49f:ec98:f030 with SMTP id
 5b1f17b1804b1-49ff06f839dmr165880955e9.33.1790602945896; Mon, 28 Sep 2026
 06:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260928094739.2605-1-cp0613@linux.alibaba.com> <20260928094739.2605-2-cp0613@linux.alibaba.com>
In-Reply-To: <20260928094739.2605-2-cp0613@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Sep 2026 19:12:14 +0530
X-Gm-Features: AclHuK9NQvFd0dqx39FONs2gN8zrhWEmLq1wAOlPjaDEqyssj2Y5zQw81EJtk-A
Message-ID: <CAAhSdy2JhEoG2-hrtN63ZF3sj6Uyqrs8G4Gj+P3Ut2f5h+v4fg@mail.gmail.com>
Subject: Re: [PATCH 1/2] perf riscv: Implement rdtsc()
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: acme@kernel.org, peterz@infradead.org, mingo@redhat.com, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, john.g.garry@oracle.com, 
	will@kernel.org, mike.leach@arm.com, pjw@kernel.org, palmer@dabbelt.com, 
	guoren@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_064228_026776_DDE2D6BD 
X-CRM114-Status: GOOD (  21.72  )
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

On Mon, Sep 28, 2026 at 3:20=E2=80=AFPM Chen Pei <cp0613@linux.alibaba.com>=
 wrote:
>
> There is no riscv implementation of rdtsc(), so perf links against the
> weak stub in util/tsc.c and every caller reads a constant 0 that is
> indistinguishable from a real counter standing still.
>
> Implement rdtsc() over the time CSR with rdtime.  The time CSR is a TSC
> equivalent on riscv: it is readable from user mode, it ticks at a
> constant frequency, and it is the same counter that riscv's
> arch_perf_update_userpage() builds the user page conversion fields from,
> so the counter and perf time share a timebase.
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

LGTM from RISC-V perspective.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  tools/perf/arch/riscv/util/Build |  1 +
>  tools/perf/arch/riscv/util/tsc.c | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 tools/perf/arch/riscv/util/tsc.c
>
> diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/uti=
l/Build
> index 2328fb9a30a3..52cd6a481de8 100644
> --- a/tools/perf/arch/riscv/util/Build
> +++ b/tools/perf/arch/riscv/util/Build
> @@ -1 +1,2 @@
>  perf-util-y +=3D header.o
> +perf-util-y +=3D tsc.o
> diff --git a/tools/perf/arch/riscv/util/tsc.c b/tools/perf/arch/riscv/uti=
l/tsc.c
> new file mode 100644
> index 000000000000..7cc4710ac38c
> --- /dev/null
> +++ b/tools/perf/arch/riscv/util/tsc.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/types.h>
> +
> +#include "../../../util/tsc.h"
> +
> +u64 rdtsc(void)
> +{
> +       u64 val;
> +
> +       /*
> +        * The time CSR ticks at a constant frequency and is the same cou=
nter
> +        * the kernel feeds into the user page conversion fields through
> +        * sched_clock(), so it is a TSC equivalent here.
> +        */
> +       asm volatile("rdtime %0" : "=3Dr" (val));
> +
> +       return val;
> +}
> --
> 2.50.1
>
>

