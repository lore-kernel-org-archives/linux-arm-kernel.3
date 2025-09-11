Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5340BCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OM7u0Uj1YJW3iv2n6lyWxvkWnG5a2qj+fgkKwtq326Q=; b=hF2mTy/f4y6UR6iGPcYfLJFD4u
	gJ9CznPyf5bWRSwJWM/2+Shu7PIhnUqDOP7wBNPJwEOCu7wCes5G0CQ/bThZSbfBjGIXhWFnDAKiV
	gkA0i38AF9VuBorVT5xV+xx0pdNtf5ukls0xgtTUHwEKQ+ibIo6oXI5c7dGP0o0g4lkcrbYWeaqaT
	EHBOwAtVS9ipPo4pP1V3FO1pY+8O+99AgLBbAdNt24Ok2JIusyHhaWPD2lRPzKisoPmP0t0M/7t8C
	ToOIwgaUzySrYEXAD7kcnt1OIp1WCKb+XCnzCDgl6Q+Rna0MOBXleG0WSYkwL+PScV7CgXwfeCnND
	xFt36nUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcAz-00000001eKC-3SUI;
	Thu, 11 Sep 2025 07:57:05 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcAw-00000001eGk-397k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 07:57:04 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-544cb520cbeso251271e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 00:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577421; x=1758182221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OM7u0Uj1YJW3iv2n6lyWxvkWnG5a2qj+fgkKwtq326Q=;
        b=Wz2CJszftK/tRycmpJ4eI/a11skehjka5Nn5jNQt2XL3X3MLOkS2BngKlmUFW30jNb
         BOxAw4ezSl4/E9oiWoTZZjgmvdhEYAkDCOsY/CDnvMQw6nxjsEycfjMtlF8YWzjkeUvr
         7M70x+bNJ+8KvQh5inYlAojGGfwMhZyXGY1QWooPQc1JtybFCS5FTjVN9FVcJxWJTPxg
         IYXwT3tf1aaJS4YaminCOy2Ri36kvt/XB0e3SYCTfockkPcf7Gl0BBcZFQEv9iggJUIB
         w5wO6tczxF1pEpe2J/30/l2R6JTRFMc1IrEYNHlb77JUQf/9fUoNbkdXNRNSx8ko5jZW
         /cug==
X-Forwarded-Encrypted: i=1; AJvYcCUDybw7LgKLZN5ep+hAyprS5hLf8DXtqOBwrF56KfAvNJY4fh2TslK8yxC7zzcIqJ4AGnZaWRuKZAmwMmdUWSDE@lists.infradead.org
X-Gm-Message-State: AOJu0YxNp9Fpe+CZbTUNFKk5S6d1/s3p1PhGdBB7N7xnjRxOTDuddti5
	BHe+4gutmMUQXs6Vo16ZMxPQfv9Uy3eTBPT58ItpHqdbYnXh/rtJi5ogEyrWS4E6
X-Gm-Gg: ASbGncvuX6o+8zC+QRp6LnAuaV+1ugiygEcB1Xwoo+TbQZ7LeDPGRYyJ3A2Apircs2a
	scoCyf5/k56k8JVXSM5AunbjE2ztiYwLQpd3qNsIGt5C99s45xWRM2TZBEcpdOyMBx6gdzmQBNg
	4mszSBODFZEhHpmlE6jSUkgLfm4iU1dbekSGdo+KUKfxCR7GVoUxSCMYeiyF6V0OxR33NYDBHsS
	MkolMOHUXw5sOGr8X8McCFOXURzy03NvYWQaDx7k81OruCvlvAlX4qpadrOEAp+ateiNxMOtXO3
	iNdQqXRlg5tDM1ZbHc552n63P7nEzEq3P93CuhyNUgryHezPP5yIutY08QFk/k996W+4h5Nt9TA
	QSmGHgfQaw5ZUJuOMnJgryNFyneAaRJ6t1zRU5ampFc8toTOtuv9UTB5J0HMP
X-Google-Smtp-Source: AGHT+IE8A9w2KpD5t7PvsXkjd3JFsF5Q7ZQ/wBAdzq4C8DEtYUlvTPetTGcAbTSlP5N1LQlwrCjVQQ==
X-Received: by 2002:a05:6122:3283:b0:529:2644:8c with SMTP id 71dfb90a1353d-5472abed77fmr6585689e0c.8.1757577421373;
        Thu, 11 Sep 2025 00:57:01 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d3f0769sm136398e0c.18.2025.09.11.00.57.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 00:57:01 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8b32453d838so260519241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 00:57:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3BCS85+uEGSIIIIdtufX4S2mrO51rsyGRsi4wUDIUrvV22N+3lH4UVBZIGQYawwIA4b7uYrZTtOJA87ybZrPL@lists.infradead.org
X-Received: by 2002:a05:6102:1612:b0:524:2917:61aa with SMTP id
 ada2fe7eead31-53d2490d7a8mr6761631137.32.1757577420966; Thu, 11 Sep 2025
 00:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250909111130.132976-1-ulf.hansson@linaro.org> <20250909111130.132976-4-ulf.hansson@linaro.org>
In-Reply-To: <20250909111130.132976-4-ulf.hansson@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 09:56:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWprnV+fAwFg0_zRbtq9JJj2UBLZK5tA4Rjv9L0qrc1XA@mail.gmail.com>
X-Gm-Features: AS18NWBIwzRqk9J7_ivbOFeNxxqUAVJ6xAfIH84kpYPPIAO0BE8jYNFp9s_zvpo
Message-ID: <CAMuHMdWprnV+fAwFg0_zRbtq9JJj2UBLZK5tA4Rjv9L0qrc1XA@mail.gmail.com>
Subject: Re: [PATCH 3/5] pmdomain: renesas: rcar-sysc: Don't keep unused PM
 domains powered-on
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org, 
	Stephen Boyd <sboyd@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Sebin Francis <sebin.francis@ti.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_005702_816712_E3571100 
X-CRM114-Status: GOOD (  23.68  )
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

On Tue, 9 Sept 2025 at 13:11, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> The recent changes to genpd makes a genpd OF provider that is powered-on at
> initialization to stay powered-on, until the ->sync_state() callback is
> invoked for it.
>
> This may not happen at all, if we wait for a consumer device to be probed,
> leading to wasting energy. There are ways to enforce the ->sync_state()
> callback to be invoked, through sysfs or via the probe-defer-timeout, but
> none of them in its current form are a good fit for rcar-sysc PM domains.
>
> Let's therefore opt-out from this behaviour of genpd for now, by using the
> GENPD_FLAG_NO_STAY_ON.
>
> Link: https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/pmdomain/renesas/rcar-sysc.c | 1 +

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
on R-Car M2-W (koelsch) and R-Car H3 ES2.0 (salvator-xs).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

