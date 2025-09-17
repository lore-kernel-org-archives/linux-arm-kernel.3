Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6007ACAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05Xx0KU64Po07Lz8pcNMpuzAdK+HLbLydsRr28mrazU=; b=vtAY6Rwql8T6v7vWVtTXROkhQH
	QPky0wVpkvHyD7MUoGO4L7htNhnts3oCGmDzT0aVP4BirJClOPrxVM2vqXEaxuByPrOq/YNKdPd7W
	FyGW3a6GCgZjO7iYGh5KqyAk4qukX50cMKyZ2TG6ExiUqpDAW4wY/Sxyg/zpHRfQdFm8QTEiIGtyU
	VT43ia3pEBPc6za6kOiVqMpXYbvi1FYR2KKlmy4vvF72RkBPFjESWr2AC55YTRtgdNGFX5Mrs9qJm
	/Mu51usLWBoV0mf1RRi5Xb11RAxLH0QQIJiMVqyxKlguTRVURatKi8UPSTVXibU9Tk6zzWtYu7f7T
	HTR0M53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytkL-0000000CXth-1z7D;
	Wed, 17 Sep 2025 15:07:01 +0000
Received: from mail-pf1-f180.google.com ([209.85.210.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytkI-0000000CXrs-2r0J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:06:59 +0000
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7741991159bso8520204b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758121617; x=1758726417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05Xx0KU64Po07Lz8pcNMpuzAdK+HLbLydsRr28mrazU=;
        b=cUHOfSRAMOzd9dXWHG0uZ0Rwgiyz18nHRkd0fifYssVsmrWNgAl+q8qD4BKrLkqSTn
         H8HbFaSOPie08WQOIWNg7iuwMxA70EBqNSL1PfbElOO0Tcv5oOWuQqjZCo5EUsRWJeKz
         z8MuHBJXAsbK+umzvtsurW36y+3qXjiWM0MmznbKVPcZiLK2fHOtrAhgVRiT7rTBlas/
         kSSHBGb/M/ZxZabgVUNwZdQUpbRfC9NrFk/+2E2SL0vCdLr33X5iiLWRHw8E/K4UPoLO
         wlLB7VSyRaCJpOVIOexbelE7Cob0uVtSaDLWlIKRWQuCY78Mi47xlB8Vc8LkhYo46eoH
         BIoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOwCtVjBOn1lBwP7UICCEYicsHxu6AjS+Iuc+DtkMjZZ8+7qcH3r17bGtBepsl16xpnr4MtJbkvhSK3Rgz7dfc@lists.infradead.org
X-Gm-Message-State: AOJu0YxtCxJwRWw8oI8l/NJinS7jfePWwOCLNCoRy1uy6SzlsyAiy1nW
	KaA/csXMUl4GWdy1qFGw98ukZMjcS0clPMdxWVvYCNJ+jhC/8L+LieWXTOVQidxVtLY=
X-Gm-Gg: ASbGncsA+RD0iCNH52eXJvMUlBatgrJEkfyz/ImY99P/39jNQXhvusS0Ach+I6UK8sV
	2yHXdvb+55zVDMw3w5ZRm260Oaw6K8/8KNqDC957DkW5piyk3y0xZ7rR9sRD73+k6wt6TiKAwpA
	pt6FYtswcIdj6Dy+ktxuSBUY9Di27ngh1b//Y5xKDxsFRlnm2QfbXEpizGcaWH75UB06mEEkHGn
	2CqkdaNOUcOfJOmG/PvaGNmprkUlxNP2EKSfD+2DvSTPWd9AJVx1nKEUbBc0BhN8yqomt5Kdl92
	67yr6voTMV0wlWFJtFf5x0OkpJvg0CGnTohYj6dJWapR0vogpXOITC0+ZsX3S6S8FrlgAa5eWT2
	9DJGY6khHTMKq//HhQ4dpIbX7Okqg3dS70g9v9D/JG48RTI6U1Y9gW3vHMLsBa+TO
X-Google-Smtp-Source: AGHT+IE2YzUd5v7C4RkYKp6km5pDDdcgqwxjMI1d6SSLq6qHK7bkn+P5iDpxFffzXzpyZ2iyI9jJgw==
X-Received: by 2002:a17:903:1a83:b0:24f:dbe7:73a2 with SMTP id d9443c01a7336-268137f7cdcmr32384435ad.31.1758121617304;
        Wed, 17 Sep 2025 08:06:57 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com. [209.85.214.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2681625e8desm20084875ad.82.2025.09.17.08.06.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:06:57 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2445826fd9dso81115185ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:06:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1keiej7dqY4P89+1NBeqmEkNNA/kkJtQ3xk1aM1kIdNxuzHS6gEtvdln8mSrs6q8u9+g/jdwnYpdd+SXQIB41@lists.infradead.org
X-Received: by 2002:a05:6122:829c:b0:539:3bb5:e4c8 with SMTP id
 71dfb90a1353d-54a60a7a014mr768825e0c.12.1758121126748; Wed, 17 Sep 2025
 07:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com> <875xdhabml.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875xdhabml.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Sep 2025 16:58:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=oJqJhXOm6w_65dJHRD3VZyJZUWfHzot5EuZtRB2tZw@mail.gmail.com>
X-Gm-Features: AS18NWDSUjkX-aOCFteBo5qpdwwTSUCRiYts8nug9t_TpQbYuJMfunN09RrdfOE
Message-ID: <CAMuHMdX=oJqJhXOm6w_65dJHRD3VZyJZUWfHzot5EuZtRB2tZw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: renesas: R8A78000: Add initial
 Ironhide support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang, Kan" <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>, 
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Leo Yan <leo.yan@linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Namhyung Kim <namhyung@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, 
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Will Deacon <will@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_080658_715629_71EB208B 
X-CRM114-Status: GOOD (  27.76  )
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

Hi Morimoto-san,

On Wed, 17 Sept 2025 at 07:31, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Hai Pham <hai.pham.ud@renesas.com>
>
> Add the initial support for Renesas X5H Ironhide board.
>
> Note: It is using "maxcpus" in bootargs to limit number of CPU, because
> SMP support is now under development. This limitation will be removed
> in the future.
>
> [Kuninori: tidyup for upstreaming]
>
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
> Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the Ironhide board
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r8a78000.dtsi"
> +
> +/ {
> +       model = "Renesas Ironhide board based on r8a78000";
> +       compatible = "renesas,ironhide", "renesas,r8a78000";
> +
> +       aliases {
> +               serial0 = &hscif0;
> +       };
> +
> +       chosen {
> +               /*
> +                * REMOVE-ME
> +                *
> +                * It works 1 CPU core only for now. This limitation will be
> +                * removed in future.
> +                */
> +               bootargs = "maxcpus=1";

I still don't fully understand why this is needed: without that line,
Ironhide boots fine, and only a single CPU is enabled.
None of the cpu node have an enable-method, so Linux does not try to
enable secondary CPUs anyway.  Even with the enable-method re-added
(like in your v2), Linux cannot enable secondary CPUs, as there is no
PSCI node.

What am I missing?

> +               stdout-path = "serial0:1843200n8";
> +       };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

