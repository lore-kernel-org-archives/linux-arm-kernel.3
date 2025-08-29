Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AADFCA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 09:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIjbWzkQfbiZQvRqxwaD0JjNVVTzZG1OAG6bEKJV6mo=; b=BaYl71qU5kZXNuUYrV10VHAH+C
	H/UazS3oJmODytgKfO/p1/lmyrFJIvsZ1tqnjgNaqgGvl3D4uqUbsubIzxztSR8LmFB2SpGz0hEmP
	4PEx/Kf7HIFDqRkLWS5CrlqAlTligKU9p0i4BzCjH0u5w4T3YOnxhdLRKOV0uj/SuDN2LAuKintPU
	EoVZizC4h6juSTpleLiIZaQ0A7t0WZooSXBhHbcYR5+2sPoHQBavoQwwKcBQgNy2C7GcthcUIAybI
	2XqJvMZj48hXNDboAdfDEEnqGWqT5FgIFIFN3MGAvA+awNLo5ivTkEeIzJGgMSrQ4Dn42tUkuEs5C
	9rpcBKhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvm3-00000005CxD-3ncF;
	Fri, 29 Aug 2025 09:51:59 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urulG-000000051Gw-1CgB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 08:47:07 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-afee6037847so266287866b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 01:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756457225; x=1757062025; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CIjbWzkQfbiZQvRqxwaD0JjNVVTzZG1OAG6bEKJV6mo=;
        b=ctdTjIqWWRh6eFEd76ppMMzXG0ztukbtSOBPtv064BwnI0wK7pFaHDMv5D9t3VphJ/
         PuTW/AJYJpKKXUlr3XwmHPPFcyutgx+dtr6ZhWxr/ifomNd+DD8synWGPv8vmbAwKDnI
         FsQscjFgMjaMURUSDaFGOxMnZBQ8dWtw6L3hMfWbxlvHTxI5Q9uIztMwln8QxV9sDmE/
         9vnIEbW8yh1a7s7GnH5gUnQD1Ee4ppCZWErA4BG6Na04pxurCMnLl8W/7bNcaK8YlvkI
         ldWG/CWD9cAUf4UZM2y2WxUdTk90XaWAqa7sGS0QYAMqEcsEPiyr77wZe8Q0wOjyw3zF
         /PFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756457225; x=1757062025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIjbWzkQfbiZQvRqxwaD0JjNVVTzZG1OAG6bEKJV6mo=;
        b=CjGFD/bEZjQzIOjFQFhSD9Ik/4SWfrUyXZduUOIOPkrg5GLAXt86h6cCtNenOyl23C
         GdqBB0ySIF3yO5UySIDJDvw3Ubwz5NgX8H+Cen6X5YRTOjXJDCU32Pv3d8pkBn2g//AR
         2WdNidYKNLmgPMCEpStT3ryv/HBGNQv0vBTpIZG0hDztph4XfrwMZIKXLvxyxoL7zHz1
         m8B3Kw4ZIi7I9WRFMxEmxIIK88ZCCgNZJchapd1y7g/3uUThtf9k4tbBmmnFkPgt5wGY
         G+VakT8vE7NjoV0WvI52BHi5a0K2w89ZHtyd1wblpKE26iRjpCP85cfWcu2SMgi5hGn5
         PNDA==
X-Forwarded-Encrypted: i=1; AJvYcCV4zSz7451MKEyguFwdcX2Iun/h2/nv+eO0Lvse6H1HtvS/+nXHDQcsSCirt3o29QWa0QgcUcU0/WgYQ1KideVD@lists.infradead.org
X-Gm-Message-State: AOJu0YyqsG9/QYqgvDBfn7YVl/+YUOJQpMVgqpLVD8k4xQL/BJEHVAas
	1qBlqmUuRUO1vgE274hg42/s4zo7CkjtFJvkuawgu+4p1QQxAjktqvZWxGfVmY7byJg=
X-Gm-Gg: ASbGnct4DV8TXZFeWIuWie+zjNOlgkwlj6qPZ9/Oi5BC9sMCqXXXvaLTP+DqENAsp9a
	tmJa0L9YzA5xZsiQ90vnYJsCPgi/BAiZ0qqcpUdDeqb+PSCLUo5/cacILGmOa1XIKN6iNatMA8K
	xaqIzp7JigOTgbrPCF7VO7jnviXkMdc9ZgZmVUHDaweHftZ5Zv0Vm7Jv0BLL8oCaIAHxBXIjJ/i
	INSVAm0j3pO+Tqt+Uj/XewZGpJFtEmmZhnUzjIMqRPVTl1p80bJQFbeVz7pGLfRrfLmxyn1d3oM
	WkY/YR+UlDGQ2rapfgOEtcH05N0ur/1WlP2aPph8/ltGSoEmpWdhdrY3RY7Qyz+uW+NHon9/cFH
	/wTegxMR/6HOQ7huuprixSYhgiCwQfHs42ONqgsGzrKDK7un8jS/+FZEMEhtbUb5dk60iGWr/nn
	WIZwSr1fqiYcSKHEY7
X-Google-Smtp-Source: AGHT+IErTYPB0ZCtNXtBGMM05Ddun8cHbo2OACk+cXvTX6zjrrSwmnOgjIMwSDpKlFVkBbllKUdVtA==
X-Received: by 2002:a17:907:2d10:b0:afe:c1e4:5554 with SMTP id a640c23a62f3a-afec1e457b6mr893166266b.38.1756457224579;
        Fri, 29 Aug 2025 01:47:04 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcc695cesm149130766b.97.2025.08.29.01.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:47:04 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 29 Aug 2025 10:48:58 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	wahrenst@gmx.net, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v4 3/3] arm64: defconfig: Enable BCM2712 on-chip pin
 controller driver
Message-ID: <aLFpeuwoh1g2IKYI@apocalypse>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <38704a5ab6913845bbf9178170e83004ab3e8fcf.1756372805.git.andrea.porta@suse.com>
 <fac53dd3-9774-4a14-9557-19c2a2532a0d@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fac53dd3-9774-4a14-9557-19c2a2532a0d@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_014706_324100_C2286F8F 
X-CRM114-Status: GOOD (  20.82  )
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

Hi Florian,

On 10:19 Thu 28 Aug     , Florian Fainelli wrote:
> On 8/28/25 05:47, Andrea della Porta wrote:
> > Select the on-chip pin controller driver for BCM2712 SoC.
> > 
> > On RapsberryPi 5 devices it is primarily needed to operate the
> > bluetooth and WiFi devices, to configure the uSD interface
> > and the power button.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >   arch/arm64/configs/defconfig | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 58f87d09366c..d4c3853d885d 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -592,6 +592,8 @@ CONFIG_SPI_TEGRA114=m
> >   CONFIG_SPI_SPIDEV=m
> >   CONFIG_SPMI=y
> >   CONFIG_SPMI_MTK_PMIF=m
> > +CONFIG_PINCTRL_BRCMSTB=y
> > +CONFIG_PINCTRL_BCM2712=y
> 
> Do those need to be built-in or does it work good enough if you have them as
> loadable modules?

They do work reasonably well as modules too, but you need to add
them to initrd, the reason being that this patch [1] is referencing
the pinctrl driver from the SD card node so you need them early or
you won't be able to boot from SD.

Also, since many other nodes will reference the SoC pin controller,
I would expect some minor latency due to deferred probe, so keeping
them as built-in could bring some performance benefit.

A minor note: skimming through defconfig it seems that most pinctrl
drivers are built-ins, so I would stick to that too.

Many thanks,
Andrea


Links

1 - https://lore.kernel.org/all/5ceba8558e0007a9685f19b51d681d0ce79e7634.1756386531.git.andrea.porta@suse.com/
 
> -- 
> Florian

