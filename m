Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EAFD6B6A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EC2kAOyhBeu2A9ruzL2chXlQlK+zyVVG5peyIKTpvEg=; b=E2jN28z4De2e9Z/7terNtKLCD1
	3PGGscNCU7Lrad+tyjelxzGzitiztWeYXEMO4F17FGG+8KMkgYUQ5h4FTjWtOafLWnH66ty3WH74S
	rD4zpwSHStBrzFqwKux/ZUjAiFvW3UD5/nB6tp5D61vbFepB82wHpbNbFTPtP54NY/L62uaoqaWdS
	oq6OcirOPno84Gix4fbmufnNtpyzMv7NmJQ0LaSgdYK2ZTAxzrivWNUJAC2GQIeh9LNNWNyrwsAdq
	1wn6HikaMdEQkbCUVagSHe+OyTIzGa478GdlaupV1whiPOx1V4x9Fnauyue0c+lzr1O0TgOTpifP+
	Uy/cENYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6B8i-00000000znk-2mBu;
	Wed, 30 Oct 2024 16:01:44 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6AyJ-00000000wna-1k8Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:51:00 +0000
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea50585bf2so2816447b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 08:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730303457; x=1730908257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EC2kAOyhBeu2A9ruzL2chXlQlK+zyVVG5peyIKTpvEg=;
        b=eu8AqXwHBm7wDuH4dlkzf/QnpIgim/o4Yf+0OSW3AWGfVluUMJTY3QObX+TMFXedRO
         UR00kui+7fy76hjN3ydGyy9A9CFU/zosuEgvkJi1tOWZyEWR23g5Lq84xSCFVYAGelIs
         nX4l6yTmpuY25B6Khhg085xqPMxjQbgMAXAjVTO9CnBVgspT/PA0qjy0eHOh0ngfwwiy
         /lg2xYajfZzRHlNkxAdiOZgXeWeFQDudz+WEUWZOSBKCXj3ycMH9wCOq0xFqol0aIiWI
         uJVfih3GbMBNyIhcVaighYGopqxcFHCb75Dtt7bULC5O4x0lZWWCNkmn7GnANzQxkR/S
         tEMw==
X-Forwarded-Encrypted: i=1; AJvYcCWQb/whC+5kR0GuRmnBtpf6UHmz620Iqt8b4/WgGci7I7FNWCZ80iNVDyZ/dL5dDpZlRKhQ1p1uDoDpkO4PN0hQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy0OuAiN6bZZi6dCrn8fqlD2mLlMHDZgb7iKgzI5UYynuRhJXf
	UnIJIYR7vGEXtMSOX3XJBzhSuSHRS4Nqygb9OVFjofnL51DkpJUnvOGke12s
X-Google-Smtp-Source: AGHT+IEyj8kZjFKngJgrBJtnC+z8gHs1M1rmKA8goQmwgEwLwslen8B+5STLaHyJJdkKM6r+NnxlHA==
X-Received: by 2002:a05:690c:87:b0:6e7:e2e9:6940 with SMTP id 00721157ae682-6e9d8a028ebmr154010137b3.10.1730303456864;
        Wed, 30 Oct 2024 08:50:56 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c97797sm24733087b3.126.2024.10.30.08.50.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 08:50:55 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ea053b5929so29981767b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 08:50:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWP0/MHFZQbFfvTj2MbYRfs7mSS1yt0fuhdQ1ujoBTbdjSCCOgbqAEfn0BmWsYFGXRjCM6yqqk57Qp1nuzlqkYR@lists.infradead.org
X-Received: by 2002:a05:690c:60c1:b0:6de:2ae:811f with SMTP id
 00721157ae682-6e9d8b34729mr183550047b3.35.1730303455642; Wed, 30 Oct 2024
 08:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2024 16:50:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwW98riCJ0VfZMzf59Lb4-gRm740z7mnSDQDTfQSJzWw@mail.gmail.com>
Message-ID: <CAMuHMdUwW98riCJ0VfZMzf59Lb4-gRm740z7mnSDQDTfQSJzWw@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] Add RTC support for the Renesas RZ/G3S SoC
To: mturquette@baylibre.com, sboyd@kernel.org, alexandre.belloni@bootlin.com
Cc: Claudiu <claudiu.beznea@tuxon.dev>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_085059_475633_2796CB1D 
X-CRM114-Status: GOOD (  23.67  )
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

Hi Mike, Stephen, Alexander,

On Wed, Oct 30, 2024 at 12:01=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> On the Renesas RZ/G3S SoC the RTC clock is provided by the VBATTB
> IP. A 32 KHz crystall oscillator could be connected to the VBATTB
> input pins. The logic to control this clock (and pass it to RTC)
> is inside the VBATTB IP. For this, the clk-vbattb driver was added
> (patches 01-03/12).
>
> Patches:
> - 01-03/10: add VBATTB support that provides the RTC clock
> - 04-05/10: add the RTC driver
> - 06-09/10: update the device trees with proper nodes to enable RTC
> -    10/10: enable proper config flags for RTC to work on RZ/G3S SoC
>
> Merge strategy, if any:
> - clock patches (01-03/10) need to go though the same tree because of
>   patch 03/10 using the devm_clk_hw_register_gate_parent_hw() introduced
>   in patch 02/12

Once Mike/Stephen are happy with 02, I can queue patches 01-03 in
renesas-clk.

> - RTC patches (04-05/10) can go though RTC tree
> - DTS and defconfig patches can go though Renesas tree

Patches 06 and 08 I can queue in renesas-devel soon.
For 07 and 09, I am waiting for feedback from Alexandre on the RTC
DT bindings.

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

