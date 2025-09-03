Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F11BCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 10:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oj9gesqCWEZX1N1hZgTvpmSqcv2Iw8bLBhaQ9r1RKbk=; b=YhIyMYnadLWNFqyrGRrzgMFQKX
	IQ/pvCZg2B9lOR05cmYqEfsfyk0M2tOUZpXfS0BJKfSAT3g5l9/RzbdMj2mXnTbCXFmH6PwToATfF
	lKThkQFS90m0E4WSrDTg9uTc7dBSos0WbpJDH3kPpDRGIBijN2uLEHAxzdaf8G05Ir5a+XcvQU56G
	J4DPElcAfHYzfs4rg5W86WmVNPceeXhlq5shmEZp4iJKjgM4SrSngWJRUQrnwe/dlSgv4bkUORohv
	89fcx7P7XXhI2lly6U9yu28m2kSENXHUSt1ZRNIxQo/N63/S3r02qcLoboHFwVPVU41aKVPhoE/Q8
	dh+LWHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkiT-00000006640-00aL;
	Wed, 03 Sep 2025 10:27:49 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjUk-00000005t8U-3lUM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 09:09:35 +0000
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-8921eb4bf1fso4105206241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 02:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756890573; x=1757495373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oj9gesqCWEZX1N1hZgTvpmSqcv2Iw8bLBhaQ9r1RKbk=;
        b=mG3oIXtZpaaKaVqJHihCzZob5rTAJ1ZUpTtOqw3ksHK9tTvaxUqalvYXJ7k9+xpG1t
         7kDRPImv1paLa5ww2C7YdcCiQBxQxGu36Geg5gbFFOir+9RKNuZkRAo+20Tzt62Yk6Gq
         qsb2crsBmUmHI33+0zme2wBXhsAxDMRuRWTgkmro9nUTfAyXtyr8LoRuOVtJAvt9U9oc
         9zRADKrLTD1zfEqyfjqH8TwFBANoFCnFYRKBIF4l+KY/OhcyapEAFs4KwsiJy7I5Tqsr
         XoSB2SLj8nm+msf/MYGOWh4KexhC+akVNYDtknSmsBvW1/9HuXwNhQ8YogjWixhKLFf5
         O26A==
X-Forwarded-Encrypted: i=1; AJvYcCWMFxuyxt8b0rwJhpobEd8YRtlKRKP9SD2kwxG/HKjy0b6Gwbbos5fHvigR5at/4Iu5vXa5VP2jRWxLH3sm2KWp@lists.infradead.org
X-Gm-Message-State: AOJu0YxqzUdWV21plY6f2W23eMKhwm4FceVYLopUeKCJXkU3CwBFhWIb
	sY/zryAZxgc4KacqXTejZ4SRGUOde7k35HSbD092lniM51VkhfpfOw2v70lGRFpM
X-Gm-Gg: ASbGncsDO07KV1oVXsDz+qIgeSmoWos2L9C/XlJrALZBNIU8UUHWa3MRZsnn+ES6efb
	Iizs/B9Q1XmXU4qiQ6SYTVnhIFj6quX5kKAIBnlvHl/i+jo568bNaDTImDVuAGRLUi4qtJf13r2
	YK3PqRlbq9FtMgG8YWOZJ+An1nauFmO2Wp0/5V8wNK/bAfSOXx7BlW6fTHCL1fBqqAVrbeGK+et
	kKpx36SyWILTI9xe+oA7+Iw+l2P8O8uMrftseD+T22sfaMcyKtcGmKlhik3QhiqthJUWe9P2MGM
	+ZVQBc3moaOZaQbqNi66cR2OcDpkUU3nHzdm5rmLl1QLKJx/8+SWen38pJtTX21H5B8hEiETB+J
	28/H9zqhycoSO0AEmfCdabUDrCkNIVyyw1iH7hy7rrKQUj7JZcfjtEAk/c29C
X-Google-Smtp-Source: AGHT+IHo+2KFVInyckfB/dl0xY/3PtCKp1ZP2NiBroE4l+8bErPI0PIOw3GycgaLCvWgLppKVDIz5w==
X-Received: by 2002:a05:6102:4b8a:b0:4e6:d94f:c197 with SMTP id ada2fe7eead31-52b1bf3bf2dmr5308103137.23.1756890573412;
        Wed, 03 Sep 2025 02:09:33 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af19156ecsm5397296137.12.2025.09.03.02.09.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:09:33 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-895fc1c8f05so2286485241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 02:09:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX587KSAvftuqLnLCMaGNJz9JqppKOzElPxUrPwYCht67x51FWX877WvLLzDigC3ZrV+quaGYicn3wA1gdKEcfO@lists.infradead.org
X-Received: by 2002:a05:6102:3581:b0:524:5266:f74c with SMTP id
 ada2fe7eead31-52b1c8811fdmr4553436137.31.1756890572867; Wed, 03 Sep 2025
 02:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 11:09:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_BHtHznN8C7s0Yf=nxBaXb94MLFD-Pcz73W8hJhxc-w@mail.gmail.com>
X-Gm-Features: Ac12FXxX9lgyaKAr8UpWw-SXRvkRdNef9IMOHkwD6ZbZ-DdxK6PzWj_7-XFm7Aw
Message-ID: <CAMuHMdU_BHtHznN8C7s0Yf=nxBaXb94MLFD-Pcz73W8hJhxc-w@mail.gmail.com>
Subject: Re: [PATCH net-next 2/4] dt-bindings: net: renesas,rzv2h-gbeth:
 Document Renesas RZ/T2H and RZ/N2H SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_020934_941938_14FDCE11 
X-CRM114-Status: GOOD (  25.22  )
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

Hi Prabhakar,

Thanks for your patch!

On Tue, 2 Sept 2025 at 02:13, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the Ethernet MAC (GMAC) IP present on the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs. The GMAC IP on RZ/N2H is
> identical to that found on the RZ/T2H SoC.
>
> While the RZ/V2H(P), RZ/T2H, and RZ/N2H SoCs all integrate the Synopsys
> DesignWare MAC (version 5.20), the hardware is synthesized with different
> options compared to the RZ/V2H(P):
>   - RZ/T2H requires only 3 clocks instead of 7
>   - RZ/T2H supports 8 RX/TX queue pairs instead of 4
>   - RZ/T2H needs 2 reset controls with reset-names property, vs. a single
>     unnamed reset
>   - RZ/T2H has the split header feature enabled, while it is disabled on
>     RZ/V2H(P)
>
> To accommodate these differences, introduce a new generic compatible
> string `renesas,rzt2h-gbeth`, used as a fallback for both RZ/T2H and
> RZ/N2H SoCs.

Until now, we didn't have any family-specific "renesas,rzt2h-*"
compatible values.  Instead, we always used " renesas,r9a09g077-<foo>"
as a fallback for "renesas,r9a09g087-<foo>".
Is there any good reason to start deviating from this?

> The DT schema is updated to validate the clocks, resets, reset-names,
> interrupts, and interrupt-names properties accordingly. Also extend
> `snps,dwmac.yaml` with the new `renesas,rzt2h-gbeth` compatible.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

