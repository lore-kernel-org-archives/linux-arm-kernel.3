Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67932C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5+H7EWznrfUm4biYkVbS1OMts3mRMuEpbLctSEdJls=; b=M0rlu0PVcNjvrBEa82mC6vFfHL
	zK7qFLzMfJ+NhUQ2KnuyH7keptSE1Q3sOM7i+yKkpkKM3h0cGMO6o483tfgZslnFM3H2jbvfzXzQT
	0fm9KNKbncanSN4djs1di33pH77t5+a81vyhq1Ogl6opgb15anWJiesy05Gjn2ej965iCK5m+fDuN
	qQTkWQoU2M88K5Qb2SKjxxTooBXFpbtj+oZ32w4aqjtaj9j/9dWO+RJTK3URjU0zDAM0TzrgsTFkI
	9eAJZieFy+LoKNryXnV4vTGfHJVp6eD+NAWGGyjZa7lOdNOtpnQqsNVOmvwivVaZhXpR51qoMDDCV
	+44LQunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBYN-00000009fib-2gTv;
	Tue, 21 Jul 2026 14:34:39 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBYL-00000009fhq-13W1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:34:38 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso8591583a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644475; x=1785249275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5+H7EWznrfUm4biYkVbS1OMts3mRMuEpbLctSEdJls=;
        b=p4fWV9KfBqeyr4QttAHT6509iYdrPzNCDOYK/lK6/knwmm1OkuhMvncC10LoWolWKT
         FLj/+Vs8Blz/NTBn/Ntw7m85X/y4hZtmKfidLxgvZLGt6LdzVr1DgpxmeMQ7et4BH4Jv
         HKln2yfgfDt6xQ+/3vYYU0XfOxZiCFq5lXyT5LuZl0y22RyGF8RWZGryOEz4i2EF29sP
         pQEpUJ6XbIFU6JHIHmEnFeArGJ+ezmpswnT3VigORAraLNLLNCvDdiZuIHPh5RxGSHbs
         29lJWKjZfK4OqoAPWnDnqImXoSkBI+/uJXSkCBmTxTcS3ooJE6w6NNv7J6LVwL6aus/A
         Wd+w==
X-Forwarded-Encrypted: i=1; AHgh+RoqzxhmiwCvW4xSbeOJLTiNkzgkkL0Td9plH14H3j7hqe4boNBIUXOX5riFoUj1AZCMM55ap8vA2BSPzISZzFUL@lists.infradead.org
X-Gm-Message-State: AOJu0YxhaauaLs3q3BPQAXwWRWEpFWYDiE2k5qdIN2GJf/o9P9DGeZI6
	fmh3ZEwwn4kASVUC5zF4AyNuuZS92zVTFr1BiU1aFhvQxhLTGRixgtmTgzKIqKs8BA==
X-Gm-Gg: AfdE7cmUWWPQQsOAKwUcIrUlOQ0P9U/6QgrJiodREI9sSDD66avtI879WiI4hhU/Oco
	z7E/G9kvfoQ1Dd6WA06kcMQcQ6XfCxR9saP/80j5k4E4RKsNRCKlVGgZE+ybkALtqQtdqOIP+Zd
	khrWMib7DTqGMnbVPObhviSZsVkGeRuzzrNsP4Fg2z8s/p3FOTVYbcLiCutMzztCqGZKXuC6m0d
	unj3+TtqBK4Mvawy9757HKwRnFISbp6Tn/idULbuAFmul/gtIRplEkYjFCQDw2gi2gNx+FOdlTb
	1uwrbjk7phphtuYAZdBObeABclaEM3RAf37YuQ6iXN5Op4gtHizIeUspkZUWFGfj9IxAJ/cnKSI
	4rUQJrTiXy4srEq6t8BiRhNjlxMlVddnHhode2kNYvn0yuqRnmTXjRoP+t8bNlj4l+XUKKffQc+
	LH33VkKGElksZGhn8oaGEz1ctjKoJonLNPrNzoA2sQOCsAVZUDRX5wTPi3oWyATzpvfhtPPLJA
X-Received: by 2002:a05:6830:6015:b0:7e9:c4ce:f7e5 with SMTP id 46e09a7af769-7eda1539c5bmr10007396a34.23.1784644475292;
        Tue, 21 Jul 2026 07:34:35 -0700 (PDT)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad965130sm11000261a34.11.2026.07.21.07.34.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:34:32 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6a397a0e5d8so6342216eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:34:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqeexmbZdI5y6TsZRVTYZy+mcXXzDGLI2SqhbWOsrvUiHdBnoJrBL2qZ/P4v+pUMVUbwPF4rW+HoElkrIcdCiOn@lists.infradead.org
X-Received: by 2002:a4a:ee0b:0:b0:6a1:9a5c:b60d with SMTP id
 006d021491bc7-6a536a94d40mr9887444eaf.65.1784644472073; Tue, 21 Jul 2026
 07:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-6-fourdollars@debian.org> <al81PmK1UMr2g8p-@wunner.de> <CAAT15mPuO71WbbS2ZpWjceCVj3FUTqHLi3wbbeV7B33JHbPRsQ@mail.gmail.com>
In-Reply-To: <CAAT15mPuO71WbbS2ZpWjceCVj3FUTqHLi3wbbeV7B33JHbPRsQ@mail.gmail.com>
From: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Date: Tue, 21 Jul 2026 22:34:20 +0800
X-Gmail-Original-Message-ID: <CAAT15mPrwAqLmFVF730G+iJugzNzaT=HDj_7G5-wXbhBNU7ANg@mail.gmail.com>
X-Gm-Features: AUfX_mz1pHjxNDxH_DJazlQ2LnktVtEJm486_yXMRWbplACcG70nmLYfvBdWpHE
Message-ID: <CAAT15mPrwAqLmFVF730G+iJugzNzaT=HDj_7G5-wXbhBNU7ANg@mail.gmail.com>
Subject: Re: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
To: Lukas Wunner <lukas@wunner.de>
Cc: Mark Brown <broonie@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_073437_297155_02EF4DD8 
X-CRM114-Status: GOOD (  25.75  )
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

On Tue, Jul 21, 2026 at 5:26=E2=80=AFPM Shih-Yuan Lee (FourDollars)
<fourdollars@debian.org> wrote:
>
> On Tue, Jul 21, 2026 at 5:18=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wr=
ote:
> >
> > On Tue, Jul 21, 2026 at 12:21:14AM +0800, Shih-Yuan Lee wrote:
> > > On MacBook8,1 (early 2015 12" MacBook), the LPSS SPI controller at
> > > 00:15.4 suffers from hardware DMA handshake failures and interrupt
> > > routing bugs, causing keyboard/touchpad transactions to fail when
> > > DMA is enabled.
> > [...]
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D108331
> >
> > In the bugzilla comments, Leif Liddy writes:
> >
> >    "I needed to modify drivers/dma/dw/pci.c to assign the DMA controlle=
r
> >     irq value to 21 (which is what is listed in the ACPI table) for it
> >     to work. The DMA controller was being assigned an irq value of 20
> >     for some reason."
> >
> > It would seem better to fix up the incorrect interrupt number in a quir=
k,
> > rather than disabling DMA wholesale.
>
> This is a very good catch!
>
> I appreciate the comment. Based on the Bugzilla feedback regarding the
> incorrect interrupt assignment, it seems fixing the IRQ value via a
> quirk is indeed a better approach than disabling DMA wholesale. While
> I am not certain this will resolve the issue entirely, it looks very
> promising. I will investigate the IRQ mis-assignment problem further.

Hi Lukas,

Thank you for the suggestion. I have investigated this direction
thoroughly by implementing the DMI-based IRQ override quirk in
drivers/dma/dw/pci.c to assign both pdev->irq and chip->irq to 21 on
the physical MacBook8,1.

However, I found that fixing up the IRQ to 21 in software is not a
viable solution due to the following findings:

1. DMAR/IOMMU Validation Failure (Error -22)
On modern kernels with Interrupt Remapping (DMAR) enabled, overriding
pdev->irq to 21 causes the dw_dmac_pci driver probe to fail with
-EINVAL (-22) during request_irq(). This is because the
DMAR/IOMMU strictly validates the PCI Requester ID (source ID) against
the GSI mapping defined in the ACPI _PRT table. Forcing a device
mapped to GSI 20 (00:15.0) to register on GSI 21 triggers a
source ID mismatch check, which the kernel rejects.

2. The Mechanism Behind the Historical irqpoll Workaround
In Bugzilla ticket 108331, the reason Leif Liddy's workaround
functioned might be that they booted the system with irqpoll or
irqfixup. Under irqpoll, the kernel polls the DMA status register on
every clock tick/timer interrupt, which completely bypasses the broken
physical interrupt line at the cost of high CPU overhead and power
consumption. Without irqpoll, even if we register the handler
on IRQ 21, the driver never receives physical interrupts because the
hardware line on the motherboard is physically disconnected or masked.

3. Cross-OS Evidence (macOS and Windows 10)
  =E2=80=A2 macOS: Apple's native driver runs the SPI controller in pure PI=
O mode.
  =E2=80=A2 Windows 10 (Boot Camp): Interestingly, the Intel LPSS DMA
Controller (8086:9ce0) is left completely driverless (no driver
installed) by the official Boot Camp package, and does not register or
    use IRQ 20 at all. This forces the Windows SPI driver
(iaLPSS_SPI.sys) to fall back to pure PIO mode as well.

Since both macOS and Windows officially disable DMA to work around
this hardware routing defect, forcing PIO mode in spi-pxa2xx is the
most native, clean, and power-efficient way to support the
MacBook8,1 without introducing probe errors or relying on
high-overhead irqpoll workarounds.

Therefore, disabling DMA wholesale for this platform seems to be the
only correct solution. I will update the commit message of the next
revision to document these physical verification findings.

Thanks,

Shih-Yuan

