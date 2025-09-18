Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A56CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thwzdmTgqO/aYIbO/EaYexBbO6rJAeT6rezea+eeFXA=; b=ZQXdyWbAeomH+XdeA9FGSosRsz
	UZJQfBQqljGvJxKALjtbH3gpWz7PhEsgMiKTum9yBypvFbDjvAg1jffeCbrJbOBfKZmEO/VxBSwMN
	1MVNz85PImiM8PSakx1lmLJEhZiUHwvxum8DXWHRNLxsJJtDa6ZwJIkTIkPygzJkgq6yemhsBzZ8/
	7uaMwa3JBLnb0mjS5+NSMzUTgAwQE0aVQ8S7PE9zvbi3dBHDnPlZxvJYYe1IISyMjeuYpbxsYqRGQ
	vpITPeK4X9AtMzuXlS7BK9iE04nbqOgXwwQUfqk5J9klFd+sJ6+77SrggGkMnn6IEl6UwEUjR+/Me
	Bdd6I+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzB0R-0000000Gt52-1M4p;
	Thu, 18 Sep 2025 09:32:47 +0000
Received: from mail-qv1-f42.google.com ([209.85.219.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzB0P-0000000Gt4f-16E4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 09:32:46 +0000
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-796d68804a0so1036296d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 02:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758187963; x=1758792763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thwzdmTgqO/aYIbO/EaYexBbO6rJAeT6rezea+eeFXA=;
        b=wAih32khMgTIliQnsuN1DBdkwljxj6IQmKaPZqYVOzvPeNdlgSQQOcLbbBBcPyF0ud
         KkztBB7QQNeAXnXd2EmN8+C0pEOs/HcdH/azClhIs48BHvWjPx+vAr6pjVcmOTpA3Mst
         8wtdpFlip4oggU8G46OdpcdDbo1Iwu+bfVOQ5N/5AZ21JdQ2KHWNEe9FR+bkUkUfARpH
         DDVZ2WaKHFGmVeDpOZ5jXVBbJtuNdgI/2KRg/UF5wkHaxYmmP6t5G+aV1f1tjPzTk11T
         17aiRtfQllaehWMP7tiqKddkKcT9dvGLzewhOOJebxIHi5A7BcIP/UAzIG9lh98J1tfb
         Uj1w==
X-Forwarded-Encrypted: i=1; AJvYcCUYoYFlEAXsxJCMxQhBB48Y6oUmErM2ikF8S8Ft0N79Im9oUlTuK9succPKXTGjSRA1l+4EboIdd2QAaA8z/2yO@lists.infradead.org
X-Gm-Message-State: AOJu0YyJOGkLsK/KajYgw/QhdrY2dM+bvY0pWPvENKQFSmKoXLY9hYZJ
	Aknm+aAjxlvQ0AQQ2dNmiT9a0ejx4rL+a4vqLY085mQMyYgi0lP1g9yQb/sMQ3eJ
X-Gm-Gg: ASbGncth+VynLOkdzNuMB7M8MyO1nIiKrmRS7pjkPgmTzSoU+BOeTNTfIEQCcYy/P6I
	rkhlpvv9A8PN5IXHGqboHlkfjJCU4X3JtG/0P9Zf8WwwVApvrBOMa8hCEk5lAh8PQsfraZ1OUCZ
	/CtIIrf5ij/R5YrQT7wLCtNddQ2brxuzd1+0W3dBjY0KRkWH79TwG5XYKCmj3WQl8RDB0OJITkx
	lcI+zD6Hr0IAjOEZT/VysBJ7jZmLLg9YCPoDGRvLyBPrPlfhTqMzRftEYRDHLuuDllTGfpuOH+l
	NI35HsF+hMZDfDcHIktCl8yCaOHg3sNPV1KfBVCR4NNSFOg2a2ljWhbE7wDuBy7hEU5p7tS+dFy
	bQHI4OL1eC1YKMIl7m3mPCKndRDVvf0nZfKogWpN48UyfIIZ/AfBJHDP64V4AKGIjtTVVJddq8R
	jPEEE=
X-Google-Smtp-Source: AGHT+IHaSVjEQAbFybXUWGFACdVeyID7mZM25oxpVXt8XGlNc6/hL2jgjNi1WDWDrCjkUbT+30iOTw==
X-Received: by 2002:a05:6214:d44:b0:78d:a7bc:51d4 with SMTP id 6a1803df08f44-78ece93dc73mr58158626d6.31.1758187963355;
        Thu, 18 Sep 2025 02:32:43 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-79351f75812sm10329766d6.36.2025.09.18.02.32.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 02:32:43 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-7946137e7a2so4901756d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 02:32:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8MBU0Wph5NNMxMsDGd0fCguxey/YBmiiJ6izzhbB/1EMrzath/D4GsgNLV0HBCVdADH81p5Bv7rms5ABO3zTa@lists.infradead.org
X-Received: by 2002:a05:6102:80a6:b0:51e:92cc:6e6a with SMTP id
 ada2fe7eead31-56d6d57bf75mr1452834137.33.1758187611708; Thu, 18 Sep 2025
 02:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com> <87jz1wnunm.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87jz1wnunm.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Sep 2025 11:26:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVfhMKrdnQCjf_Z90EnH_gb-RpdxPiVUjEe3C5ZyuTfUw@mail.gmail.com>
X-Gm-Features: AS18NWDTdMprA4ImYjVf-zjtYmKdsmDO9RIvez5aKcVZCW3WJ100X4TbNjepaRg
Message-ID: <CAMuHMdVfhMKrdnQCjf_Z90EnH_gb-RpdxPiVUjEe3C5ZyuTfUw@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: serial: sh-sci: don't required "power-domain"
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
X-CRM114-CacheID: sfid-20250918_023245_302302_C6DC4255 
X-CRM114-Status: GOOD (  22.58  )
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

On Thu, 18 Sept 2025 at 08:26, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> {H}SCIF is in the always-on power area. "power-domain" property is not
> mandatory. Remove it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> I'm not sure this is acceptable patch. This is optional patch.

(H)SCIF is indeed part of the always-on power area.  However, like
for many other modules, its power management is handled similarly
through a clock/module controller.  Hence it falls under the PM Domain
abstraction, and the power-domains property is justified.

What this power-domains property will point to on R-ar X5H is a
different question, as there are no DT bindings and no driver for the
clock/module controller yet...

> --- a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
> @@ -116,7 +116,6 @@ required:
>    - interrupts
>    - clocks
>    - clock-names
> -  - power-domains
>
>  if:
>    properties:

> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -168,7 +168,6 @@ required:
>    - interrupts
>    - clocks
>    - clock-names
> -  - power-domains
>
>  allOf:
>    - $ref: serial.yaml#

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

