Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1408C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8oTZmseEszzoElc60lFvfT022jB9In7rPk2BcTBU8M=; b=SeuV+OtlyJ0vEoKMgk+DcYpunD
	gRWN1w6DpnxLU7kJII4fBkTDp4yQ0YiMzTOTuBsOihjcNH0eQZBqy9cAb+xTbGCkcApWq8XNgcIx3
	zw4SLeVDzQ2WR6hbOIBZJOEYEbOKwZGd9KekBwln7SMov06tJPSXaxPtNMNPGdc0c8/97vKvZ0h/I
	S2l2igd/Dz5ttFRDreEaFPmg7TpjgcLBkt5fo4H3vzRM50ahGubMfEJWLeuzmwef4BO1V7AemYg3v
	qmPsXIe6IyCSUL0oqHwFu9xY6QE+iZBgzczDJ85iw6nlQc0PJ2ZH16AJhQOtONJ3OUqfAGZwo5rUo
	Y1p6ITrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taF0l-000000082Ol-46e5;
	Tue, 21 Jan 2025 14:13:47 +0000
Received: from mail-qv1-f54.google.com ([209.85.219.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taEzU-000000082GT-29iU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 14:12:29 +0000
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d92e457230so53755606d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 06:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737468747; x=1738073547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8oTZmseEszzoElc60lFvfT022jB9In7rPk2BcTBU8M=;
        b=sEIxFkHv6NrZ4ZMTwWcEEmneVKc4dYlIk4XXyMno+7G5wperyYL4soX2rfw9xkEl6w
         MV3o9FaBg+HuEaQjK4kVua2PnkRXbb1j+siju7xYMhs8+vhrW7pfuraJ0+yprrYGy653
         Y2QiP3ZpCwu4CAvreGEvVdGE+w98g/Fe3DnERV1ST4TuVZqNlsqUVN4h7X+WTO24B7LY
         ezNYDnpysrjzDrOyjYQmqVuiAWqmJLfXSB2jmxjsMBebQxC23mivZXeMRLtIc1iYPEAK
         5ih/xtGm1CCpWs5BEF9eZUTMO+IYA1NF5t3mx4ghy6NdNRoighP1S6moLfOl+AczFimN
         hDMg==
X-Forwarded-Encrypted: i=1; AJvYcCWAQKdUd9jznyQu5WU1bWWo3vgg6TdPdnYJHAupoZS6OL8yYa8CvdB5Ah/0Bp7ZtjtzkkdfsMLSBEnHinh7G+PN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw04ldsjGJNQtXFKikHpP32K1QgxYGzU6LFfOVnmvq81t3xge0j
	6DbvIRVRIpYCdst3oNA+yd+QtTuh34v6mc0eiw4iHGueT0dxvQqLyToyAG+K
X-Gm-Gg: ASbGncsJU0GC1I5suZ+lcplWoSAgiWPlGMHC9brJ6AHPB6pCiv0NfyHIVxU6DJTRN16
	H2Cl7gt0evvY3bZmfXHdTmp0gznJKfWLO7dAaX5JGsbsTnVFEeh3f3bPZ6Z4XvUoqCWC5jkDP7H
	otR1Cwup8E2G4rhe9j5cRfqVnLjf57nzmLwhedJMCi0RHJYGGmLzArvl17COi63OrgSp62jSF5b
	We/4kPXhgqOWrAiengADvuLJP5zK9h13MdTCds6ThPr8Q9F+yVT8vV74dD7m9gvp+zhqb5UraBQ
	E6tnEf08DYdnYZzE1sc4q06O1s3tT46GHtwS
X-Google-Smtp-Source: AGHT+IEkbSgWJhIjxtAIbhTthKuz+2i+RYNEDVwDqLykHbg38qNYQ8lDieMuvxzQ00T43/UlVY27NQ==
X-Received: by 2002:a05:6214:27e2:b0:6d1:9e72:596a with SMTP id 6a1803df08f44-6e1b21d8673mr288481226d6.37.1737468746555;
        Tue, 21 Jan 2025 06:12:26 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcd387fsm51324886d6.79.2025.01.21.06.12.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 06:12:26 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b6fc3e9e4aso529806085a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 06:12:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW3unT1yHJjM8XV7ezk53SurOQTChRmYYcbthsRpA7TFaaqi7LfTWGkqwVMyaNko6PhSr7qilbFYskG2G1PtXxr@lists.infradead.org
X-Received: by 2002:a05:622a:134c:b0:467:6dd9:c961 with SMTP id
 d75a77b69052e-46e12bbee8cmr267144211cf.48.1737468746109; Tue, 21 Jan 2025
 06:12:26 -0800 (PST)
MIME-Version: 1.0
References: <20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org>
In-Reply-To: <20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jan 2025 15:12:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVLvCNZtc2qYrsnMz5L0Hyr70x-Hj5NA8izYBH2tf=yFg@mail.gmail.com>
X-Gm-Features: AbW1kvYsY55i73e1PVArL78wxeKH_sS6kvt1IZKg6bpigHUm_wzZQ5psfq8v81I
Message-ID: <CAMuHMdVLvCNZtc2qYrsnMz5L0Hyr70x-Hj5NA8izYBH2tf=yFg@mail.gmail.com>
Subject: Re: [PATCH] ARM: cacheinfo fix format field mask
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_061228_551178_EEDE1CB7 
X-CRM114-Status: GOOD (  18.15  )
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

Hi Dmitry,

Thanks for your patch!

On Wed, Jan 15, 2025 at 12:11=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> Fix C&P error left unnoticed during the reviews. The FORMAT field spans
> over bits 29-31, not 24-27 of the CTR register.

Please add

    This causes a warning on e.g. Cortex-A8 and Cortex-A9:

        WARNING: CPU: 0 PID: 0 at arch/arm/kernel/cacheinfo.c:43
cache_line_size+0x84/0x94

so people find this patch when looking up the warning.

> Fixes: a9ff94477836 ("ARM: 9433/2: implement cacheinfo support")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/linux-arm-msm/01515ea0-c6f0-479f-9da5-764=
d9ee79ed6@samsung.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This fixes the warning on Cortex-A8/A9, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that this changes HWalign on Cortex-A9 (various Renesas SoCs,
with 1, 2, or 4 CPU cores):

    -SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D<N>, Nodes=3D1
    +SLUB: HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=3D<N>, Nodes=3D1

On Cortex-A8 (BeagleBone Black, i.e. AM335x), it changes HWalign,
and causes a warning message:

    -SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1
    +SLUB: HWalign=3D16, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1
     ...
    +cacheinfo: Unable to detect cache hierarchy for CPU 0

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

