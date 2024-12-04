Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A43E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Z8SsfJIMZ6wbDGLFC2pyak5YjkCzmlnT64gSuKBGIU=; b=v9qYXxZYpE9b0zZprHsDkpbooV
	ewiQ2aoYKsAAR1wxocT0Q6MHrK8Fxg4CEvN1y0tohiGmbQpZbf3msAhCsqaMAX55O/7gr3V5rJv7s
	iMQwi5RmdUMQcNbJ08C4s0tWPCLI0oiKHO124qfmBG0PyiZAbObxkZBCwC7cJPPNnds1AcesKvMrI
	MXklHt50HNCftgWw2jQn7l7SdPtbQzAQlIhhdrCS4BaCkqKc57edJMUMNQDMV97xvuzfltGhhHkqG
	xSu1/cEm4oIdAuMSUKcCGPokpxy8k5y6aMxNoDHyWY8IJ24PlZh3pY7whqNryMKCsMpRPth/tEvaq
	dXuOhHFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqvu-0000000Cw10-0sdG;
	Wed, 04 Dec 2024 15:04:54 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqrJ-0000000Cv5I-14Ez
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:00:10 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53dde4f0f23so6905009e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733324407; x=1733929207; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Z8SsfJIMZ6wbDGLFC2pyak5YjkCzmlnT64gSuKBGIU=;
        b=JxbUKn+plfmHpqVY6MpbWFcR8KFMZW99E1OWtVFcTDxQQqO+6FWMI/nkebsBe0JEuo
         iho7JbXc/DFZGP108XciqJoMRj+5dllSF5n7goyb/OJJPvKWRuRJ6IGG8Usy8hz5o9J+
         Udx0LV4Rd4yXdTBLndvVnujqjb/xvWA194tln+GgOJO0WTcQPRXlHXtBf3Tv8+f1sK9g
         ShmNCyCF+ZNu385jsVCBHTuiMI9FfevZC2Oj4x31abiJ9xzIpEw8Ks3RQ0c5Ou0kRy0c
         3LA7hyXvOFbckWXw4dPsEWfV3AawgKZUWdBAQr+nky/ERbeXMYc6jTLBZVQzol05qwef
         +2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733324407; x=1733929207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Z8SsfJIMZ6wbDGLFC2pyak5YjkCzmlnT64gSuKBGIU=;
        b=LmG+lmOILOXsds+swM5S/yrAlVUf+fG1NJy1fTmWLMcX7ujScIQBW/rzjV3IRS1n+x
         DyjkGU6UswQq1i/zkhek93AzhtU2lR4c23IwFV0oERwLuSuRk7r+ZYQOcsq9MATxsBQl
         63AczF4w3RInvWv5HknMEKlJGWSM6o4a6AwbcFF0AvSL9R4GU5GNLh/+V90iEMGxHcEu
         ++pBo+GkXTNf+o+gRQoTB2/KmxE2UuF1IPUvCrt+DCRG3RHk6tIiQ2JPnX0eBI1L4M5L
         oAPCaNt6fhBVbFgyqbwcUle1lMMNN1AazWNzHRoOLHTcITnVRZqtGleiizbutAqBdX4d
         anZg==
X-Forwarded-Encrypted: i=1; AJvYcCWzlwau0/r4TPtsZT+ZSwJBHqSgbZOmzwTLZ8NG0C5yNHL0/uVF4P2PQooGuFgdQvgYEJvsqX/7FY5I3ZfCmwQZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyF+LeaLnzbA2LcJjj4qZ6mMYO/8PUdT6ITKuEOXUX/ZZNrPcH6
	ZTOxnnBZTAquBekXS1pJpYnW+oz1AhBfxldRU3OzHgxQFjotmFD9AdAQfCzsS9D8Mb3F7GAW2sA
	+h5GhITFrUd96A4fAgDKppGBrtIFuUM12VAUK1g==
X-Gm-Gg: ASbGncuBdz8Wlc3bq8QcZmg1VoXl1LOdM050fSUHEab1m3pnNkWSu4Ot4MOGcthMyPR
	pLg3Gu4UtkYoRoHaDTY35BTuRIyOe+A==
X-Google-Smtp-Source: AGHT+IHT8ot8EDFntaLIs72pipJWUq+cKx2vj1L2uGRfDd/p23/CZ604435wdZoBy3VHdRA1oxNIm06ieh8Uc9hFCWQ=
X-Received: by 2002:a05:6512:31d4:b0:53d:e57e:dd4a with SMTP id
 2adb3069b0e04-53e129f2a38mr4263497e87.22.1733324406989; Wed, 04 Dec 2024
 07:00:06 -0800 (PST)
MIME-Version: 1.0
References: <20241203083838.3260036-1-jvetter@outer-limits.org> <609b026d-d54c-4a11-b7df-6ef0ac315f25@app.fastmail.com>
In-Reply-To: <609b026d-d54c-4a11-b7df-6ef0ac315f25@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Dec 2024 15:59:56 +0100
Message-ID: <CACRpkdZZ0vrYT1-76SBa0XN00p33sRTmpT1JPLjvBuyGD_yu0Q@mail.gmail.com>
Subject: Re: [PATCH] arm: Remove IO memcpy for Big-Endian
To: Arnd Bergmann <arnd@arndb.de>
Cc: Julian Vetter <jvetter@outer-limits.org>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Julian Vetter <julian@outer-limits.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_070009_363208_2C4ECE7B 
X-CRM114-Status: GOOD (  15.73  )
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

On Tue, Dec 3, 2024 at 11:08=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:

> - There is one ARMv5 "BE32" based platform, the ixp4xx, which
>   works differently, and this in turn allows multiple configurations
>   for its buses where a byte-swap is performed in the PCI
>   controller.

Actually it affects all memory-mapped I/O. E.g.
drivers/irqchip/irq-ixp4xx.c
for this reason IXP4xx drivers that are not PCI usually
use __raw_readl() and __raw_writel() to let the bus
do its thing.

IXP4xx PCI drivers are however *not* doing this, because
PCI is (IIUC) specified to be little-endian, and the hardware
deals with this. (Except for the PCI host driver itself, using
__raw accesses.)

> Before we apply your patch, I think the minimum would be to
> have Linus Walleij try it out on an an ixp4xx with a driver
> that uses these functions.

I applied the patch, compiled v6.13-rc1 HEAD for the
Linksys NSLU2 (oldest system there is! also a classic!)

+ Boots cleanly
+ Mounts root - this is on a USB drive which is on a
   PCI-attached USB controller, so PCI is tested
+ Reaches userspace and console
+ Gets network and IP address
+ LuCI web user inteface works (browsed to web server on device)
+ Dropbear SSH login works fine

Tested-by: Linus Walleij <linus.walleij@linaro.org>

I doubt any IXP4xx driver uses ioread/iowrite. The
MTD driver does not for example, because of other weirdness
with address swizzling (drivers/mtd/maps/physmap-ixp4xx.c)
For similar reasons drivers/ata/pata_ixp4xx_cf.c is
using readw/writew exclusively.

It also looks like a good idea:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Your,
Linus Walleij

