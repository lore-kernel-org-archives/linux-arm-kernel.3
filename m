Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11755CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCgJo7Iim2r1QY3epPnNwQa02OhmB0pJps80hKObtxM=; b=ULMgX79yL/Pr9RMiZLBLjuzTMc
	2IbLsexvJ2mGNGt+4wVJsj8yB5nAYw8QpbSL+Dul8ol9l7hosUj1t4jEXlQVLhJUCyA/8jIV7VeD+
	yx9xfPi8XKEqK5k5TLf6eCS6YUjSqjlS+4tMiAMRAW5a5z00F7B9E4IkuVgbyUMiFaYAkyEaaNuTz
	HQ7hSZLZMjkaXsow5Akv4Oqhz7T2eD13LxaXgzlsq4UfwOgx9wXOJCUzS7GmOW0/3vfhTYamNMUsB
	DM/fDUOCLzHikMZVCtxEKG+wlWWNFlYl147NxnAO0cAj5rnEbKiQ1MzuSxYEA9xBEaWnsbcGxmsrn
	WqOueudQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBS9-0000000Gxd9-2qoq;
	Thu, 18 Sep 2025 10:01:25 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBS7-0000000Gxc9-2Qtb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:01:24 +0000
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-8e364003538so352334241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189682; x=1758794482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCgJo7Iim2r1QY3epPnNwQa02OhmB0pJps80hKObtxM=;
        b=ZehzTdsTl3C91jnAxIAIOQfi+jB9PjwWF6jEiqU35BPEuwpUMjqhD5vAgTo0FK2Pow
         gc1kJD3GX1TLtz7QcDfyCiKThqq6gvUpy7CT5+WZ+q/umgCx0o2eiXBNY93NqYSFOeeG
         5lRygZ6w6ex2v/JqROqaEfKzVlNWIgCZ7+4G+e7CE0Foop3MR6TR8pqaoPmRV4U+DRtd
         qv4bShPuBG14i5r71gbkU1ZgqQ9+OMDopdUZL47mz8YYogG3YojkjguZBhGRYK6CLc7d
         sDmSFiQtzkMcp+nkLB7sKHG5bTYl23blJwYx2b4fs0SSZv9BoPx5I5tnuSNVJnexdQpe
         j9cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS7HtYNMBRKxP1T3t+oz89GClaITFTQG4LmSfhtIVisI9PqG6T2CiSx5brW8Hh7MPQGiRA7x5P0C7UMGwLfymC@lists.infradead.org
X-Gm-Message-State: AOJu0YwSFwEHF2Nr/C2KirUZTz57l9732QyTF0mRzy6JAjiBxyEEloP1
	kNckyYtgYFtrdu3NsB8qMxGVrWKwgj4xX30/vXoY6GVHlpD/bw+/PybYxM18vHWp
X-Gm-Gg: ASbGncviYexn+BwB0SRsALa+gcx/JSdbXTegKJuHvJaElUcwX4yvyg04dMkd9pDzbg2
	z2CfuTCugPNDqpiRZhZBZ6qOAWR4dgB7OqGyLywkcCekiWwtCMhyuBfdkptmBWf3bqQ16+uC0z+
	xSaFR2nhY/8a8JtL07rhZejMMvz6ue7DloDV9gZNFkoqkhJp4+4PDDUJc+YFPZ0RLwVNqC3z3gz
	ygRi8+yrX2JzpfqE42tMqfn0aSFFtJVULUU1aCaCXhaHPJH8WiFpRFbhohAi4gszyP6lXGHza2x
	z5SPT/bVQliAJ+w91Fso5JJBhGdeO2UMX5g5N+mdWAhPkTEbnBV4sDaF/LCABmT/LvhedjootdG
	Tu+ifwpYKLT3xriOAxjrTMgIzbH+bR0qK8AbUq097hET2uysR1IHRfDKNmldeD6rMaFY0NVkJQ1
	FpJRs=
X-Google-Smtp-Source: AGHT+IG/JlgX/f0xngi/AFMalgQEECmUWNK3MigkZj3ubZOHxzyMEvc4LzBZ3TswhPtEJX0ypVESTQ==
X-Received: by 2002:a05:6102:8006:b0:522:826e:7bfe with SMTP id ada2fe7eead31-56d4d1eaa88mr1842430137.5.1758189682246;
        Thu, 18 Sep 2025 03:01:22 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-57a05ef52b3sm500545137.13.2025.09.18.03.01.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 03:01:22 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-52dd67b03c8so548810137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:01:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGJC+5RNe9/bhSm0KrGfn2vdt4Rnjvvic5THsaPohIEk603DEl1S+SrjKOCrsFENY21TMvD7COVWTLh9mADdCC@lists.infradead.org
X-Received: by 2002:a05:6102:4b04:b0:4e5:ac0f:582c with SMTP id
 ada2fe7eead31-56d51ca1fcdmr1779501137.13.1758189682008; Thu, 18 Sep 2025
 03:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com> <87cy7onul5.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cy7onul5.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Sep 2025 12:01:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8+V-EbrSFF_f-pAm95zZLtV8mMjOFAGX+af2JO9Q0LQ@mail.gmail.com>
X-Gm-Features: AS18NWABsRlKpDFFCpae_UW48HuvCqA9B-vtOkVv8ToG4xGXl4aYc_QckQPRgYY
Message-ID: <CAMuHMdU8+V-EbrSFF_f-pAm95zZLtV8mMjOFAGX+af2JO9Q0LQ@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] arm64: dts: renesas: R8A78000: Add initial
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
X-CRM114-CacheID: sfid-20250918_030123_625523_6E4EAAAC 
X-CRM114-Status: GOOD (  20.84  )
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

Thanks for your patch!

On Thu, 18 Sept 2025 at 08:27, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Hai Pham <hai.pham.ud@renesas.com>
>
> Add the initial support for Renesas X5H Ironhide board.
>
> Note: It is using "maxcpus" in bootargs to limit number of CPU, because
> SMP support is now under development. This limitation will be removed
> in the future.

You forgot to drop this paragraph.

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

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

