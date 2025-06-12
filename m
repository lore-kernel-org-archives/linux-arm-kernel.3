Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AB8C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdmKBl6XQx/lg6XYfGHOU0jB5qghLcO4dPwReFsMtRM=; b=VmmOuQ/yllOctP6g5XKGyJoRju
	yuNuUVQqYeBovQ3P6Z8Z3eoiwB/NvEaLVeihyoc56Nxllh24WEMkdWQlFAJ8olsUTekyuAuvm/7At
	WYxjouWqASDSfezPlsKw4nWFQ6NEE0LGWtgitZa8NYfffWplWTnHZbVjOUexO0wU+C5gRYyNIP3J7
	j3WcSeeM83bw4Ew/0/y35mESglqWVrE8TOozVvC0VqadpRz+G99KfIHKkSPgH3Qu/jUnXdJvp+HC0
	FyvANw/u++uzG1U0AbJyQOrXALpxV0X5wbOTVQwqEkN51nwl497VGWlwjJto10HLAlytYaNwaT+p4
	zajYcupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhrN-0000000DPfW-2IBU;
	Thu, 12 Jun 2025 13:20:49 +0000
Received: from mail-qk1-f174.google.com ([209.85.222.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPh8s-0000000DGkJ-3aQZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 12:34:52 +0000
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5b8d13f73so95637785a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 05:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749731687; x=1750336487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdmKBl6XQx/lg6XYfGHOU0jB5qghLcO4dPwReFsMtRM=;
        b=o5U5t4M56t9VB5smOcex8PJsEpVpiz2QiKTeGn+houcNQmmYOXgyfu1Tsn6iltCnC9
         IncIJs3cRHo9sPkINkKTaChc5tIaHorspkN8glzTx9AQlZYObFoHyRQwdndPxOpB5C/z
         Q3ZFS+4dTDMmdEYbRrLnZo8MlPcdZqs2NqxNDj/nYYFK4w9vasrITphry4Z3q0ysbb2N
         oChcKRtwnJUFBd1pnu+7C1CAkCaG0gSdxMXkvfyfdDgQQqB7+hmqqxF3GkjhF/sjMOzI
         0LGMVeu2dhQnfZ7ynZaAf15nzTdYmYBQz5XCeMekD5ecyh5ZImOxesu2dvqRofKQgoh3
         pazw==
X-Forwarded-Encrypted: i=1; AJvYcCXNcIsbn8QLtmaABZy08oTL6zOe/KenbIe9AvvXFMzPAL4yRSCAPhUEFCmfe301wTPGi1XfVhxVufafjLg01hmU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9L3Txlhau1Z2CpzrOdB1uIJUsvv+4aPESjChA2CpfDdD+1yat
	fx+bvk9Sdub5JP4y8+8w/dR00f1Bjif+EooDdWdZ2ao4f/AYL4A2oiq8/0wRT9KL
X-Gm-Gg: ASbGncsVOJ+24Y2muCiEUCQ75RjkfNE8keJBUhnU3p1EEzhXGBy/ENT5OzRSlfEN+Ti
	0AANFIHgHtIkB3QUrprCrSRnFV1qBqRvUxxHuMhnkLjfVnBoobHUyndJaEb1PfnbAKn8yiommB6
	xrJJaCeOf1ELEO//aa+CXPxixCLDZ5N+huEVjKBTnNNwzDOvEjs33VCMYe2JjZKiWXsyGFWjyfy
	5a71/1cF2H39Ort5iYTEBXBHSQRZ0UYykEI8NU0BEsOEOr+1nwvWmath1fHbQnAoEafLDfxJ0vC
	3OADJiG1AT+Bc6PH6kw8wmK56cS/ZdKIpEGkWE+pIDvfS7bi+A3FZ4MR2Lt5FfjL+hPBECVmQJT
	Z0KO+hP8H+wsLPEl0ZrtGy75xXULB
X-Google-Smtp-Source: AGHT+IFDPxJwCvb7ZIUVHjbtoKbgcavquem61eZMTi/xAoFsMR5JrimP31p3y3LQpVLxbCWJm6nvXA==
X-Received: by 2002:a05:620a:318d:b0:7d2:139b:a994 with SMTP id af79cd13be357-7d3b369e45amr382230385a.34.1749731687365;
        Thu, 12 Jun 2025 05:34:47 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8f272a8sm34218985a.115.2025.06.12.05.34.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 05:34:46 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d3939ecb7dso91701085a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 05:34:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEfsw/8S+eJyFQySExFU5dqmOCQYhz4DxWyp31aCGY+ElhYYF/Z1jqeMUXP4/cMX4U+3g6bL/6T2UfP+K+soiY@lists.infradead.org
X-Received: by 2002:a05:620a:2953:b0:7cd:565b:dbc9 with SMTP id
 af79cd13be357-7d3b369e445mr372396085a.26.1749731685801; Thu, 12 Jun 2025
 05:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWhwJTbJOBhKmC9YUaSebBg-9m7euqmxqJLCXdr6++siA@mail.gmail.com>
 <bdd989b4-a572-44c2-ae7b-2c445c09fd7a@linaro.org> <d05f2c03-fa86-4fc6-9b81-1a7b5592c2e8@nvidia.com>
In-Reply-To: <d05f2c03-fa86-4fc6-9b81-1a7b5592c2e8@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 14:34:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9NzFvsOv9eT0t4KVNufHSqVEht7yRbrt0qE49WgHpGg@mail.gmail.com>
X-Gm-Features: AX0GCFtVgQikSSiKAPvkGq33v0M-ImHzyr3NJwP-bYJMvcSTiP6kAXgBA_LZ8eQ
Message-ID: <CAMuHMdX9NzFvsOv9eT0t4KVNufHSqVEht7yRbrt0qE49WgHpGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_053450_891930_04FF6E5E 
X-CRM114-Status: GOOD (  32.04  )
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

Hi Jon,

CC Arnd

On Thu, 12 Jun 2025 at 14:20, Jon Hunter <jonathanh@nvidia.com> wrote:
> On 23/05/2025 12:54, Krzysztof Kozlowski wrote:
> > On 23/05/2025 13:39, Geert Uytterhoeven wrote:
> >> On Tue, 6 May 2025 at 12:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
> >>> ensure the Ethernet driver is available early in the boot process. This
> >>> is necessary for platforms mounting the root filesystem via NFS, as the
> >>> driver must be available before the root filesystem is accessed.
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>> ---
> >>> With this change, the Renesas RZ/V2H EVK board can boot from NFS
> >>> which has the DWMAC IP.
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> i.e. will queue in renesas-devel for v6.17.
> >
> > With my Nacked, please.
>
> I was surprised to see this change in -next. We also use NFS for testing
> and we use the dwmac drivers. To date we are explictly building these
> drivers into the initramfs but I noticed that that is now failing
> because this driver is no longer a module by default. This is easy for

Oops, sorry for that...

> us to fix.

Good ;-)

> I do agree that if we start to build every networking driver into the
> kernel it is going to bloat. Yes I do see the kernel image growing
> regardless of this, but nonetheless it seems better to just build as a
> module IMO.

Not _every_ networking driver, of course.  AFAIK, making network
drivers built-in for systems where development is done using nfsroot
has always been acceptable for the arm64 defconfig before.  For things
not critical for booting, modular is indeed the preferred way.

BTW, we have other low-hanging fruit to fix, though:

CONFIG_SOUND=y
CONFIG_SND=y
CONFIG_SND_SOC=y
CONFIG_SND_SOC_SAMSUNG=y (Krzysztof? ;-)
CONFIG_USB=y

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

