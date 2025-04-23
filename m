Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2554C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwFnQLNd2ElqoHSqs6HidAKq6gQZiy66/qPTuUWPN1I=; b=dKIFouLh5RzvnK/Y1o8b+O53Lz
	enlb/TBqDXBHC74dA6DWh8zDv3rFL1WZB/V0r3iXcYw3KQA4y3KbKem3SBGDvwo0CkApzBGXG+JoS
	1H/QccF7PzEt+iKU4i10+kaxbs2iq7Sz/neBpIHTc/alw9Qg3PPP/yaMdk1gy8vik56rODlg3FErK
	b35bpwDupf1o9qMxdw/cwXHaWjrTzEUsCiAPahpVaRWNBm+A7GMa411T9knKrB6mEz3jKVKqubuSk
	N3oW6VO4eiL9TqzVBobz/rzLyUHDFMHFO04Bq7kEc+MPqUIa+/phRW1yhEF5nxI213x0CYMETD1JP
	64pztPfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zn9-0000000AXAK-0gND;
	Wed, 23 Apr 2025 13:05:31 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Y0z-0000000AGqc-3CgX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 11:11:42 +0000
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d69774081so2304978241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 04:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406699; x=1746011499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwFnQLNd2ElqoHSqs6HidAKq6gQZiy66/qPTuUWPN1I=;
        b=jJflPoUHRLQa7AA+3gKQR5OQVs0VkhkMG1RrTP8cj84+Pgwb0rQZsWe7be7Mb936S9
         YkkU4WrqSF4k1ixqpBle1caZ1Lh07V8VHGWZOMnM/zMW54mbSqBlojteS8dhMO8hOF6m
         IRo+t4oKdLOQkYPtZG3oNdKO8xByegMWN5shvK7pCMRPE572jNuyJJHygHHu/5v7t2xP
         A49+kDS6SVlxKBpvexKGok+TSg6UdcsD94dXgl+xxG7KP1Ot3T4AjnAtaTFUXRQjRnib
         04HXIZemCsRDt9xGvlDk8VtdDoO3IhQmu+Y5FXVpIEkvoXFNBmK2eEa/ylb6JRoS+KSN
         BacQ==
X-Forwarded-Encrypted: i=1; AJvYcCWknB3ouxmCfs/gss9wCG9rtTc7xtky7v7X+Fn3WdSLwssIk77wAp2ao8tOEt0YELO5rZL+YTcoeBTf5gMQP3AE@lists.infradead.org
X-Gm-Message-State: AOJu0YzBdxggkGLKDH4hlKSoZ1UrBfwtAyr4Bd48DeOkDiJBFpkV3Jgy
	+vLWMWHnYitfOyPgXLugktYZ7XFt6JoGk17dm0W7Ehqs6BgMbdiDsgJoyEqjVUI=
X-Gm-Gg: ASbGncsGDeFK5SliHkpGaUclndDilidcL0+J0xcN76eVmifsouA8dzFp1kB5rAj6hhy
	vrhMJfi/5UpVG+DM+BQo0Ef58uZq8uczJ21D9v7IL47Tkd6P0WSgay+DZ4Tqm8XwBURAMr2Ofqj
	SFoqh8xNXZVhUE8fZP9QjoNL2bthJ+27Gmr/i8echFJMhjXHYH0aWK6S1OQIckusX6fbJOzE8Sy
	KP8vyry33wDuJ8IbaaUgUE1lockzLQYK856YgFeSVX4nH7clQ4VSdZZtReGMf1bYGvoXitzxQBV
	RktZDLvogZEVwqOpp9YI8xa0KeqfBxfDBTgZdRJO2IyiysmojRvDbAC6v1aMCryMNxrrxV3Xja8
	7q+zk1yM=
X-Google-Smtp-Source: AGHT+IGzhgLnJ5nuDe5vqv7jv5DfnyvUF0KBR8jldLaW/J1y+L93HWpeuMEQVTtz6cXyBb8tTTzS4g==
X-Received: by 2002:a05:6122:d93:b0:528:bd71:8a8e with SMTP id 71dfb90a1353d-529254142e7mr14080756e0c.5.1745406699364;
        Wed, 23 Apr 2025 04:11:39 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8779b4dd30csm531051241.32.2025.04.23.04.11.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 04:11:38 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-525b44b7720so2437100e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 04:11:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1NKZxnLziLTgbtLWQYxg55fxvVoip7JKEDR87CoGT3sGiQvyVhxHRcMwRoWhVsunSboasflOpYqs0I871moFU@lists.infradead.org
X-Received: by 2002:a05:6122:2a13:b0:520:60c2:3fd with SMTP id
 71dfb90a1353d-529253df487mr15940732e0c.3.1745406698686; Wed, 23 Apr 2025
 04:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <50dbaf4ce962fa7ed0208150ca987e3083da39ec.1745345400.git.geert+renesas@glider.be>
 <b1f19b31-3535-4bb5-bcef-6f17ad2a0ee6@arm.com>
In-Reply-To: <b1f19b31-3535-4bb5-bcef-6f17ad2a0ee6@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 13:11:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJKA8zYETKJTRAwg6=+EuTq4YqbFO32K4+py9YNsD1Gw@mail.gmail.com>
X-Gm-Features: ATxdqUG3O_R-h3xFZ-VbZPzuOVx8S7u3rM-8ANr4EcMPwyY_6h0-oOYf4tSgGPw
Message-ID: <CAMuHMdVJKA8zYETKJTRAwg6=+EuTq4YqbFO32K4+py9YNsD1Gw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ARM_DMA350 should depend on ARM/ARM64
To: Robin Murphy <robin.murphy@arm.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_041141_799027_729EB16F 
X-CRM114-Status: GOOD (  32.21  )
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

Hi Robin,

On Wed, 23 Apr 2025 at 12:59, Robin Murphy <robin.murphy@arm.com> wrote:
> On 2025-04-22 7:11 pm, Geert Uytterhoeven wrote:
> > The Arm DMA-350 controller is only present on Arm-based SoCs.
>
> Do you know that for sure? I certainly don't. This is a licensable,
> self-contained DMA controller IP with no relationship whatsoever to any
> particular CPU ISA - our other system IP products have turned up in the
> wild paired with non-Arm CPUs, so I don't see any reason that DMA-350
> wouldn't either.

The dependency can always be relaxed later, when the need arises.
Note that currently there are no users at all...

Unlike drivers for other AMBA devices, this driver is a plain platform
driver, not an amba driver, so it does not depend on ARM_AMBA.

> Would you propose making all the DesignWare drivers depend on ARC
> because those happen to come from the same company too? ;)

No, I am fully aware they may appear anywhere.

> >  Hence add
> > dependencies on ARM and ARM64, to prevent asking the user about this
> > driver when configuring a kernel for a non-Arm architecture.
> >
> > Fixes: 5d099706449d54b4 ("dmaengine: Add Arm DMA-350 driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >   drivers/dma/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> > index 8109f73baf10fc3b..db87dd2a07f7606e 100644
> > --- a/drivers/dma/Kconfig
> > +++ b/drivers/dma/Kconfig
> > @@ -95,6 +95,7 @@ config APPLE_ADMAC
> >
> >   config ARM_DMA350
> >       tristate "Arm DMA-350 support"
> > +     depends on ARM || ARM64 || COMPILE_TEST
> >       select DMA_ENGINE
> >       select DMA_VIRTUAL_CHANNELS
> >       help

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

