Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BF4D46BEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 18:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8t6SLqjvsNW00Dj2Hjf4deNPVV8qylbppXyHu+3S3LI=; b=E/6x6jS/OoGZOJOmTgJuAldSY1
	J+Tcm7yMN3W3iQjqf9mM02uPXRxNDhOEvjpT4mVR3zC2QGMlI/H/scLhjDUPZ9Wv0DxMqNYWKZjM0
	RZOijlNRWVeCTBg09d+whX39+Vd6QITF1f99+v6sx1Kqti0rX74Imy9qUfk31tXVadym0faNC0rBv
	f2kT7YRYQSJyzQ2ylj0H5q44ARJh6OA8FzxuPaDxqQqYOMmm6Ip5Ql0+WoDgQoK+B7iRAellzuhLj
	eMIuaL6Gi6ch6zW7frofnvi5hkMNz/h5vJRqvIa/9BQ3J+a0cb/CwANVqEPrkmd12bEHGnv7tltHe
	FcPHiTyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAc1-0000000Ge1g-3Wlk;
	Wed, 28 Jan 2026 18:49:57 +0000
Received: from mail-qk1-f178.google.com ([209.85.222.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAbz-0000000Ge0v-15vt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 18:49:56 +0000
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c6ac42b91eso22668685a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 10:49:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769626193; x=1770230993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8t6SLqjvsNW00Dj2Hjf4deNPVV8qylbppXyHu+3S3LI=;
        b=t7n46Vp63uTgU8vRwqqYFnl7tH8ZgsdIqFl3V8h680TlH3yhn1tz9C/dPKWSm+9kUB
         Zc4wQBt1etwh1svM84yctuSUh8oH2z9UJrop2FASzWhNt1vrAxahSLI0YhgJst9OH7Qf
         JJlnavAwTQ7SiwIZslLSrdsqBhyXQIBuXmp1DV8bWg2wJ0CCEHzZR97CttK8MdIQTU0z
         NlpSBMc72E6PqNYV6UXixI6DxCkJd1pqUkP9cEw90iCHRlK1luQoSvO2Vkk+WFDX4JnP
         TckR2B8SWSTsX7pxRk6MPgvZPwwZuRWyBL77SdzGBwpu+y1VwriucL+mF0bbLk9yrHWr
         7HCw==
X-Forwarded-Encrypted: i=1; AJvYcCV+2AEQummTHAvKG4U2MXlSgbbOgfuJzXXKIU9CY0Yg3r7llVYRUiGyadWL6pE3f+2rNzoodLAhV6gLz3/gBHcf@lists.infradead.org
X-Gm-Message-State: AOJu0YzyXgjNluYnNZ+ui/Sr+SXAtGtd1piTXhbtgzrCvXP40rY2WSor
	rxBAhd+yyvAGcqMg43SIEjDxAgRBOxAi1D8FUMRhCAxnXlffzTerjm6lMCGS0Ir6
X-Gm-Gg: AZuq6aLoG25VMTOSLWkT+BbQVS675CJLxfgZA3ZbYsclDvC0CuZOl87YyGkIuC3d702
	tr3EfyilUBXor0uXA88F81wpsDytV/rMG/pVDXII7Y0gPJGn5nt50Z19n4d1QDmbcDyddAjsjoA
	PrNoDXASMdoygq3SMhoID4nxXlUxKnbsmsKG90RnKqjYchmFguErwfU3+ksv0swyWFYFsZpCN4r
	2gA1lpvYRrWs8is51FGw8cHKXb3Yl5QCZXQd3X4Qt7h2MpMvCrg3bk0MYw77Z2IbpwJWTlUTGTV
	s9TKpmUewd0YgNpQk0IrY1gtxdS8RCHHOj13E466yequFlGR3OP289q0b3stru59txYQzR4D+KD
	+cGSGAQVAVs/n24WNF9OELASXrAVIP3ek+knAb0OEBFpxS2OmdErXQoU+JilpFnffFj1UE+foXV
	lTdMLfkHANKLlUTNrkbCGzsdbkIp4lU9rhkl/NAV1W9ZIMIl/fl5mO
X-Received: by 2002:a05:620a:3199:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8c70b8713f1mr736394485a.40.1769626193217;
        Wed, 28 Jan 2026 10:49:53 -0800 (PST)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711b7b380sm244710785a.10.2026.01.28.10.49.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 10:49:52 -0800 (PST)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c6af798a83so25542585a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 10:49:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkw4rikskqEBXcWAKP9Bx1qxAv9JkUOlLLCWhdHWp1w5IY9gh9+hN0nUoVYXs5kHwdU87deipgaWV1hqX+0eId@lists.infradead.org
X-Received: by 2002:a05:6102:948:b0:5f1:72a7:f879 with SMTP id
 ada2fe7eead31-5f72378e7a1mr2207053137.28.1769625713444; Wed, 28 Jan 2026
 10:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Jan 2026 19:41:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgnVcwo3b=zQx0wVcH53dm6kBz3nQ5T0DZat4KxastuQ@mail.gmail.com>
X-Gm-Features: AZwV_QggK5aoCgxDwMwUamFclvyMAvDW7y1KAlSqyJcViMQkB2_vluWrOqhRb1Y
Message-ID: <CAMuHMdUgnVcwo3b=zQx0wVcH53dm6kBz3nQ5T0DZat4KxastuQ@mail.gmail.com>
Subject: Re: [PATCH net-next 0/8] Add support for Renesas RZ/G3L GBETH
To: Biju <biju.das.au@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_104955_310150_D5D832FF 
X-CRM114-Status: GOOD (  22.08  )
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

Hi Biju,

On Wed, 28 Jan 2026 at 13:58, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The Renesas RZ/G3L GBETH IP uses Synopsys DesignWare MAC version 5.30
> compared to other Renesas SoC such as RZ/V2H that use MAC version 5.20.
>
> The RZ/G3L GBETH requires an extra clock compared to RZ/G3E and has pps
> interrupts. Document the Renesas RZ/G3L GBETH IP in bindings and enable
> the Gigabit Ethernet Interface (GBETH0) populated on the RZ/G3L SMARC
> EVK. The eth1, pincontrol definitions and hotplug support will be added
> later.
>
> Biju Das (8):
>   dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC
>   net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC
>   clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
>   clk: renesas: rzg2l: Add support for enabling PLLs
>   clk: renesas: r8a08g046: Add support for PLL6 clk
>   clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs
>   arm64: dts: renesas: r9a08g046: Add GBETH nodes
>   arm64: dts: renesas: rzg3l-smarc-som: Enable eth0 (GBETH) interface

Thanks for your series!

Please don't include "net-next" tags in patches that are not meant
to be applied to the net-next tree.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

