Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6804CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 10:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1FWUIy12ESADGq4B/o282N3x/QgWaUFK1UozSJnDAM=; b=yJZ3v9Zogw+6IomXmn3bO9EyQM
	UAlkGwvKNwiL/kueYcwiGHARvru6zeCIu6Kwrvv1J0Tfs1FGcQFl5IapmCqauL26zCutIBPj+u7iO
	bgfc5UmcHezsHYoo9sf4zEIP949iTqRW7Rh36l03KPDxIJ7wcJMtTPtNFwyshMDuRBYXsBigIutYH
	tVR2yWjVN7EhpIEuGLamNyxavVuCz/BbhTzi9o88+Aa2MkvHlWLdRbPBqc9dJtvfW/ucUv8pLYWcD
	mYtIRaPcNa5n6e3YAKpck2KOb8t5hx+MjGQczJSXRIujq/TpPQN3Q9ddqCxbhDO1B4E/P7Jeo2pIp
	g3nQHqZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySuj-00000007WnK-2nwH;
	Tue, 16 Sep 2025 10:27:57 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySuh-00000007Wlv-26ZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 10:27:56 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-74381e2079fso6283702a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 03:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758018474; x=1758623274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1FWUIy12ESADGq4B/o282N3x/QgWaUFK1UozSJnDAM=;
        b=Cs999dl5YjcxJhRLykUlPXk31qkHEUvOf70zjLr5JXVKQHhV8wit6wWc7etgB0qTrw
         vBt2/Y9uUk6Uv4IP/zHj85mnmNkcuPj00ZqaonggG2C+HAgYpDCC1O+DxEPlZGmBBaFD
         RF8IE8erOtSKgvSMGmWX84jeVVABovbCfbFIVyvLyE1pwdaQHFnQfL7UBVqeTMDYMLm4
         g1blGVm5VAVmioEX2EVfo6Emsx27K7yOXlNz219WGas8ucTUF+A/G37yJSpLaO/BX9sL
         MMsGAKNexrEGlcTnqQTv4AmEDuCAqOIyKUv+sdrtFdDv9QX6ifbN3/yQLuLf+CLP0Vwk
         b6JA==
X-Forwarded-Encrypted: i=1; AJvYcCVWBwRIyRQ77irj3Mvn3F0DIKVWcOUbmBDmKfriHabQEEIZNj37TlZyvLPiH5amChw/4RJZLxc4UtdS7xIagtIE@lists.infradead.org
X-Gm-Message-State: AOJu0YzWHsQdT7SMUlFnuVZE8M9GfXVrZCgapZ5VLfJDEQ8Dz0ifVbC9
	nlKqzNCwBrlWRvxwFRcMHeMf8DiZuN3vWcUTeRM3nzw+vsPhrT+lJmyyUXTAY1OC
X-Gm-Gg: ASbGncs+E43OWHVfssrBlgkeAomillbzw1pP0pY83S+BcIbxd7cMmRX6/w3QCMxDdKk
	09qQixJ6x3W7V7RgYyOV+QQYVsQR1Oord9tRoEykgxUNzBo5QuCkfUfjYr7G6PAiuuJa6S0BY1F
	bx+klkv2C3/SQXHHjR8p84O3kFa4u9W0qUfajxti6Enrx9lYzVnw1LUmKSw2U7yrJGwQw79n4Hl
	UmTWRBc4QBiJw+vRCC4Rla0enPhljmofeML4/lGA76sn9/CcRO6yEIWJVga8sPRotbe4IoBuoOS
	VuHGbqPji70K+xI93Iiai0VIGK5dlX1RZwQ29fJuv+gX7HrC4vo9U8ZCpEBESRHeqZvwGQZxS68
	whPetdBaWXjHGRgXXK9g7ewOqJM34K7HWlG/juA28AcoHvi6u9swqPTFE9D/O
X-Google-Smtp-Source: AGHT+IEbucCojl2nl7Ha3MyPNJ0ZzcqDMPbDydQ0NplCSCrtNbmnx3ogFhqgerbLnPkPQ5u2COZSeg==
X-Received: by 2002:a05:6830:2814:b0:745:a385:4561 with SMTP id 46e09a7af769-75355bb9a46mr7443958a34.31.1758018474028;
        Tue, 16 Sep 2025 03:27:54 -0700 (PDT)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com. [209.85.160.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-75763558c88sm2148560a34.23.2025.09.16.03.27.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 03:27:53 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-33158d9dfc6so2154935fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 03:27:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVARgsj8mO3Ckqlk39XibJDb1ZDN0fVdKTS/Jfpma+b5Xq7baQDER3N2N+P/s7jiPkYQq0NXQPZucyX3MNYZonA@lists.infradead.org
X-Received: by 2002:a05:6102:3ec6:b0:529:ee6c:6760 with SMTP id
 ada2fe7eead31-556091886d7mr5576842137.7.1758018092612; Tue, 16 Sep 2025
 03:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com> <87o6rbi0jy.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o6rbi0jy.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Sep 2025 12:21:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKhw3t6oJhWrdFCkpaXKL5EXxBAPtqiYSDPv5aDNiFkA@mail.gmail.com>
X-Gm-Features: AS18NWA-CCVGKbHBzPrL9HA4tPoq9LGRxBm1encbDpHU-DmGUfLkgrDyZx8KuHI
Message-ID: <CAMuHMdVKhw3t6oJhWrdFCkpaXKL5EXxBAPtqiYSDPv5aDNiFkA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] dt-bindings: arm: cpus: Add Cortex-A720AE
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang, Kan" <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ian Rogers <irogers@google.com>, 
	Ingo Molnar <mingo@redhat.com>, James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
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
X-CRM114-CacheID: sfid-20250916_032755_547786_2BCBE868 
X-CRM114-Status: GOOD (  19.70  )
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

On Tue, 16 Sept 2025 at 04:38, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Renesas R-Car Gen5 X5H uses Cortex-A720AE. Add compatibility for it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -148,6 +148,7 @@ properties:
>        - arm,cortex-a710
>        - arm,cortex-a715
>        - arm,cortex-a720
> +      - arm,cortex-a720ae
>        - arm,cortex-a725
>        - arm,cortex-m0
>        - arm,cortex-m0+

Already added in commit 0f356eb097c31471 ("dt-bindings: arm:
Add Cortex-A320/A520AE/A720AE cores and PMU") in dt-rh/for-next
(next-20250905 and later).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

