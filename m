Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C915FCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 10:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+N8nwhp2ksCBATTBgDUrbzFAvExrUr7ic1VBwQK9ofc=; b=xPaZh1EUuYsMw7eDHAWFFEKnAs
	W/fZwVqvLDkqEeUtPrF1zvqfz1Ei2WW+7P5NkAxYieUQZfUFwZ8hCpGJS7Lh6Z4GiIUgke+k2Cli3
	AT6aXv0gw31+CunvDyBgQNeQEH1y/sEbSun0nze77Dt7pxDKyTIkduOkUAyB+2BColUWMQx8Aqo7Y
	+ztZz8ZNB/10EAC+EOB/JJYBrRvQRyDRD13zP046mCrQYXO5N1ZNJVFqdzDKrumN1MG2dvzIOpMPh
	aJa9pfrsWQtaQgOZ7aTQPYQW1W3SU/jZBS0SCEemVzdbBFyTgF4fbD8YDnK2EcmgN/ZwIBveCtOzV
	vtYbrWIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSRN-0000000Gw7C-0xUY;
	Mon, 25 May 2026 10:21:45 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSRJ-0000000Gw6G-0AII
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 10:21:43 +0000
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-57747a2bf20so2860213e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 03:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779704499; x=1780309299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N8nwhp2ksCBATTBgDUrbzFAvExrUr7ic1VBwQK9ofc=;
        b=TICPkk2ABrRV+ezF5HKZxatW3Dwb0ei0rMZKEyto4uhUoUNU54MHZJtlw6ncAWOPy2
         /QWTBh9/1Yuh4BGEsQqxzJ8l7XnerWnmbIkrKPn6jjuJ0PD1f/FwAp3N+T1asq9N6pS6
         jQBGtoGB8kYrgm4xFpbfxmST4Zv+ORKtusC1WbFSuxQsFjt3x+/x/9O/kv2a5iyhQRoR
         SGgGBL5eTd8f/RDyB+vvrXSoKLTDGJO5rzlvvuh7CfRX0TKv8vDRFY0MjR0knsal4C7C
         F113AObzSnqetVcbd++eYhJpsFH/ql/U3J7I//Y060PAPDfruSu6yM3tsnWxqd2XzT1I
         L9pg==
X-Gm-Message-State: AOJu0Yx7XbRXstfHeuUY0SFBAfkacw85QN3A4f91eY7J8zqgfnUMsAWt
	ufqgFGJwpO/RrGeeLbxw1C1j1oEaFycEqB4xlLeqm26W55aUflarXABHnIy+yqiD
X-Gm-Gg: Acq92OH5+jIZEsL8PUEOad4vKOF3+ZEdCKot+gGgfTxHeT9VT/Hcd0DEux7AjKApF0P
	Zo0NPw/uqRw4R1nqWFIQ+CCZ+nlh5NVxU+nznj1rgePfBL2lmXSvtsUnBUm2HmOU0xGE+Rtxp2Q
	v0Z/U80y+rwWNplFn1FVr9dU3OsOV4sy0496dLnD5t26hZIu+t1qBq5NU1FbQoswXWSgMn0De6u
	ouWqxG7+nyLcG26fK3PGmCTM4VI6Pc+s9TGnrWeySbC/dUAlH88MtISxA4TXPBUmIli5HeJ6fEB
	4BidYW6tHLCDf5NiQ+5sfYlmWbseKPMvK7EaJGev+KfMMqW8jpGqp2MXZkWSVaZRB8j4WDwrH5d
	PScaT1u+NeLO0H5vnEDKKXPSni5dLH/doIhF00easvEPhnu6sTA8RVz/EnFrINmWYXAX9viENDp
	mOvtPM+76qZtO0fSMHkav7F83z285hYIta2YHKLUpUU5B0ugG9di+ORzdnTuOrUbcx
X-Received: by 2002:a05:6122:3482:b0:56f:1ea2:8609 with SMTP id 71dfb90a1353d-5865e4a448emr6630202e0c.3.1779704498556;
        Mon, 25 May 2026 03:21:38 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f915c4f1sm11206735e0c.17.2026.05.25.03.21.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 03:21:37 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-57513ac61f0so2976106e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 03:21:36 -0700 (PDT)
X-Received: by 2002:a05:6122:2215:b0:56c:ce8a:b07a with SMTP id
 71dfb90a1353d-58660d810c9mr6371489e0c.7.1779704495972; Mon, 25 May 2026
 03:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
 <20260522172000.15096-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260522172000.15096-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 May 2026 12:21:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrdPrtE-8ytaBA5oYsFa_1EyVgQTWM_9qFszwEf_u6FQ@mail.gmail.com>
X-Gm-Features: AVHnY4JxX69tsdj1KyIPYumyrvTwDTMHhV4blwWLghLppzdyXfjGAG938kQSX7s
Message-ID: <CAMuHMdXrdPrtE-8ytaBA5oYsFa_1EyVgQTWM_9qFszwEf_u6FQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779md: Add support for R-Car
 M3Le R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_032141_087226_D8456232 
X-CRM114-Status: GOOD (  24.04  )
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

On Fri, 22 May 2026 at 19:20, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Geist board based on the Renesas R-Car R8A779MD (M3Le)
> SoC, a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V3: - Drop pwm2 and pwm2_pins
>     - Follow KSZ9031RNX tSR for reset assert time,
>       FIGURE 7-5 Note 2 for reset post-deassert time
>     - Add RB from Geert

Thanks, will queue in renesas-devel for v7.2...

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
> @@ -0,0 +1,720 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the Geist board with R-Car M3Le
> + *
> + * Copyright (C) 2025-2026 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "r8a779md.dtsi"
> +
> +/ {
> +       model = "Renesas Geist board based on r8a779md";
> +       compatible = "renesas,geist", "renesas,r8a779md", "renesas,r8a77965";
> +
> +       aliases {
> +               serial0 = &scif2;
> +               serial1 = &hscif1;
> +               ethernet0 = &avb;
> +               mmc0 = &sdhi2;
> +               mmc1 = &sdhi0;
> +       };
> +
> +       chosen {
> +               bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
> +               stdout-path = "serial0:115200n8";
> +       };

... with the chosen node moved to its final alphabetical sorting position.

> +
> +       audio_clkout: audio-clkout {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

