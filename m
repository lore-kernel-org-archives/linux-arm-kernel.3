Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15449D10C0E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 12:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cd3kIe56QXQQam1qx/3dD2gryf9hu9/6h0hqv8KkgSA=; b=HZ/nSSEfO2iWvENZpi8p6VVmSS
	Yvr6JH6PcG01SjLLH7DEdoHKy+yUr2pSVcFCMiAiOOy7J9BjjX7RQPYJeTJOYsT561eiW10qE4Qix
	bEDtoo4UUmTB+smrzhRWaLTyXyd4k84JcTW+0Hn7CoRl+w2L+Gzz7FEfmvlfwZnKF0cB6EJiwa0LB
	Ew5koEb3r8qB6pX8Ue4vxCPtk7WTGhUMJc+nsKBxgfrTZGSJQ67ky8NH7tZpMOuVaM2na16l0o75u
	g1zG2XE8v3OtLV6Q5OAhjtVUn1Ov84Swbod5/nt5ZkToKUv53FhugvpazjDriu4/GKMS5zBPdedhI
	bYwPapjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ZLR-0000000BNft-0z31;
	Sun, 03 Nov 2024 12:04:37 +0000
Received: from mail-yb1-f175.google.com ([209.85.219.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ZJl-0000000BNVj-0u3N
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 12:02:54 +0000
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e2bd7d8aaf8so2942187276.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Nov 2024 04:02:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730635371; x=1731240171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cd3kIe56QXQQam1qx/3dD2gryf9hu9/6h0hqv8KkgSA=;
        b=CJ7h0LGnUIhUy5gl+93jmD3JcvUmXbKHDcAT+P1l/DX79BmrSHBPUKFq3SeWPkiVU/
         PP97rzs8BeakvA+eZ/bEDzrUTJ3oHIRIs5XL3/T/XSZvDavWubsBNYc3w29Ugc9Wzp5X
         d+bH6ynsWBBe6mwabFyYh8zatDIUGZVvlTuHfdxeuxtCKQ0ulx+Aw11tIaboa0Feqqx/
         jsI6QQZia4uTNgmQ8gJxyhmmI3zmNAQZv4T+aQrGwYsg6S6xA4+ZZouPy245yQuhrxlD
         IQBX/BV1Wxz4jB7wXqLNN7UrL6DwpvzXg9uAqkx91GN76/AYK4cLVbnI/+ui8p+NvL7F
         eSsA==
X-Forwarded-Encrypted: i=1; AJvYcCXuKfASwC7qggVhnWmWnXfqHspjCSC2W6DG0sC/qU0zIo9IydHKiqeZXBIeFQeLe9gBt+yLUjzTlKhX/Yvp4IWM@lists.infradead.org
X-Gm-Message-State: AOJu0YxP0G8QkYG4tQcD9IUXIb6eXkIuP2n2fBHBajUQci1nt+VzEEch
	B+M9LD3iQVeuVd8uVHDCrUS2W65XzkwWKYD3xiHHWE8atdCKBlHiHkp4z23Y
X-Google-Smtp-Source: AGHT+IGxjcmISv/A/o8U638w+yXlOM6MRaesCdAgta6Mqg/ysieBtBCUipoBaJ29lrO4101N4TP63Q==
X-Received: by 2002:a05:6902:f86:b0:e30:78c0:83aa with SMTP id 3f1490d57ef6-e30e5a0259bmr11013928276.3.1730635371312;
        Sun, 03 Nov 2024 04:02:51 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55cc5787sm14522467b3.137.2024.11.03.04.02.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Nov 2024 04:02:50 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e9ed5e57a7so25438337b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Nov 2024 04:02:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVvymo1OBePhe7evK0EQw2doePLM7m4SU7UbW+9vvsOn92YPO3OLqzlKvAusI3WO0aOYoSdSO3Ed5qXrYW/M1DZ@lists.infradead.org
X-Received: by 2002:a05:690c:600c:b0:6e3:21fa:e50f with SMTP id
 00721157ae682-6ea523742dcmr121048567b3.13.1730635369662; Sun, 03 Nov 2024
 04:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 3 Nov 2024 13:02:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJ7XSvE4AS67-Xwo9sRayyoFxkjFeffSA0y6242g6thw@mail.gmail.com>
Message-ID: <CAMuHMdWJ7XSvE4AS67-Xwo9sRayyoFxkjFeffSA0y6242g6thw@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] Add RTC support for the Renesas RZ/G3S SoC
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_040253_276102_5CFC9B69 
X-CRM114-Status: GOOD (  23.00  )
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

Hi Claudiu,

On Fri, Nov 1, 2024 at 10:57=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> On the Renesas RZ/G3S SoC the RTC clock is provided by the VBATTB
> IP. A 32 KHz crystall oscillator could be connected to the VBATTB
> input pins. The logic to control this clock (and pass it to RTC)
> is inside the VBATTB IP. For this, the clk-vbattb driver was added
> (patches 01-03/09).
>
> Patches:
> - 01-03/09: add VBATTB support that provides the RTC clock
> -    04/09: fixes compilation error for RTCA3 when building for RISC-V
> - 05-08/09: update the device trees with proper nodes to enable RTC
> -    09/09: enable proper config flags for RTC to work on RZ/G3S SoC
>
> Merge strategy, if any:
> - clock patches (01-03/09) need to go though the same tree because of
>   patch 03/09 using the devm_clk_hw_register_gate_parent_hw() introduced
>   in patch 02/09
> - RTC patch can go though RTC tree
> - DTS and defconfig patches can go though Renesas tree

Thank you! I have queued 01-03 and 05-09 in renesas-clk resp. renesas-devel=
.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

