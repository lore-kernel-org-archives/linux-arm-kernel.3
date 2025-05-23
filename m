Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE00CC54F2E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 11:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wlzvB2Q8r8iVI++Q756y7sEw+0J/OE0zl08HpFQmKI=; b=YFyAN5gJA3/7QkKH0oj6brbI5d
	Neb/uUiAVxH1clpGKGmePQublujH0+0HXEUVPDwG0cVBuZLiEg1ldj5NYMRVGMdymTuXioaLDdw0Z
	fPOwuSreyklQByw48ySHQvT0enuWFHiq83SknEV8AR+0abk/gWotecn2NlpVUAHHb06C3/zJ74QWn
	5KEOooPC+d1elviuwxiLtVxw/gZbHjztVK0oiBqbDQJHDJlpugzS4Fx4HEs/b/NH56pj6h/vlK7fk
	BxQfgLp+6RIBkfhR4p80IFgCuzDKGq6CIsI+ZffKyeSjstFFhpsjGNNf18eJPlb5nyPoN+vBJ7SmD
	6j/hXeGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQpO-00000003jgc-3e1K;
	Fri, 23 May 2025 11:44:42 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQiS-00000003iyZ-0cpW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 11:37:33 +0000
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3da73e9cf17so76367695ab.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 04:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748000250; x=1748605050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wlzvB2Q8r8iVI++Q756y7sEw+0J/OE0zl08HpFQmKI=;
        b=Q2y4uEzENr12oTzPt7FYwRDb7frRXo9NqlApworCKisPoNU28WUZLglWv7BUxqlLl+
         uwp6t5cmDLHfgZtNSbEYS0t5+CfiKbu0sGENuyzOiX8LjYnSFzF5MDiwP1WGKrWPMcbT
         4uSOEipcMKxpgBIiHcpda8o/fpipPthp4KNJ5LyEL7Gelj1i8H0RS8XfKJZ9ZYL8/n8K
         b9TZMGzcbYHFiriGHS97+7IdMJFnAf6x4xyPWxgAzhgE8fhvusFaD2YqpGEgyoZSGDQE
         7GUGLbJG2Mvp0kz4MZFy31rBQKSBAUyRO+gQQxp938kaxKHIwyKHRVQbSOgC4FDdADLU
         1EZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrWoPmIMs6JZkTEINl4ltNJwKmppSUOV+YuDQFE4wNousNwAAFBf82Yivn7/jVuxkpxYMvuC+WRhpNPgj3hvXh@lists.infradead.org
X-Gm-Message-State: AOJu0YwfkM1YYKEPSfUiFs8l5SeldsULKRcyuR/NS9iNc69QfdiVN2PW
	8dFc8h8zcHcct7eURPPdu+hR2vz6fNZfIYGc8aq4TTngajVw0EBsJHO1rwLhAWEd
X-Gm-Gg: ASbGnctEvF4V4LIlS/giKvcGkDNKJvjSWS+IKGa6DRuJD/cWqG6TEbsSz6AHyq34b1m
	LDxASdHrZfQRxzBsYLSe7hSWgvGIMpd7IwABvUMhuZUFQtni5TeRry0ib4ucs7AdtdGf2C/EAbO
	y61H8tmKX7TKV+MfoHUBJLGOnzUwLXXTN1SC5VToCx/83oUVeW0L6NwHtfE/54uboma6cMnqD/v
	eeOYzvT0ZxMSyXg1FuGE8SlHIk29caH2V5ED03exPcdm1WLP8qmjRtXQG7cI9IjVayd0ZE+L2kM
	NhaQMYcSAPaN7z+7Daj98GXFia0qV4fC2NT4riXzUrGsHP9CoQbTc7kiaTwtamkqf5dETJLVfFI
	3swyjlwT4BYUAjDiDjw==
X-Google-Smtp-Source: AGHT+IGSdLwKfVrGSTFrkKfcjOvKcDi/fEkHvKofvacFnNhwhQOK3Jp6c5Nya+EdNcC/dTXFiEcN6w==
X-Received: by 2002:a05:6e02:23c8:b0:3dc:76ad:e3a8 with SMTP id e9e14a558f8ab-3dc76ade94dmr183221655ab.11.1748000250100;
        Fri, 23 May 2025 04:37:30 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc3ae0cdsm3518934173.35.2025.05.23.04.37.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 04:37:29 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3dc978d52edso2755225ab.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 04:37:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9NBkIEk/TGe1m08hxbz+1Pdtpum2vOefBPf19SWfxBT0pLDDTwwRicvuEoIXX6Uk63SYPg3JKfVXnXkX4XXbV@lists.infradead.org
X-Received: by 2002:a05:6102:370a:b0:4c1:9b88:5c30 with SMTP id
 ada2fe7eead31-4dfa6c62d03mr28083060137.19.1748000239515; Fri, 23 May 2025
 04:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250513125858.251064-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250513125858.251064-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 13:37:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLYuwVU=9FnXoYYXzA+XYoSc89MBsTzAyZQAGF2cVvFA@mail.gmail.com>
X-Gm-Features: AX0GCFsYAsYC7rTS4r0G9iHcLPTnjlp95PDD1ysnF-SrRgCKFmwYpC3XJI0oK_c
Message-ID: <CAMuHMdWLYuwVU=9FnXoYYXzA+XYoSc89MBsTzAyZQAGF2cVvFA@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable RZ/V2H(P) USB2 PHY controller
 reset driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_043732_188741_D717B9FC 
X-CRM114-Status: GOOD (  18.29  )
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

On Tue, 13 May 2025 at 14:59, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the `CONFIG_RESET_RZV2H_USB2PHY` option in the arm64 defconfig to
> support the USB2 PHY controller reset driver on the Renesas RZ/V2H(P) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

