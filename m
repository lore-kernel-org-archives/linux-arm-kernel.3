Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDB9C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 21:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpEaJTEpfR9+TojleH3uk2aBSDLiXQVkHne1HqD9Ces=; b=GOhVVp7WM1uy/7o819YbPQHK6X
	QMayz2xgUib9nSbqKukcL8TYrotBSa9sck7KonsWKaXcF31Qq3EzaEOn6XBWaokiIB87wIXAqGZ9X
	+UxxEMoq+uzTBaspoSc9zKCJBDnxclCO3+qY3s3tT8tQXugY4m2oG2bThl2gqiq+pKroIaSVYss4t
	gzli9kM4BdrEl1mr8YUuC9CXELi6YoR96q3PfosM/6srzjUWpBQWYkAKFatHcnGA/f9ZtACaPmVtk
	Z73Y093IofDCo27L6nrusnyALqTeykq7+oNNHUkL9YtTulFGlETuom4ONuADXeUsSRXVd+yrdwfdl
	4bJytYaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKOd5-0000000EAbR-0rP5;
	Wed, 28 May 2025 21:48:07 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKOaw-0000000EAOs-1qJF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 21:45:55 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-52403e39a23so115361e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 14:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748468753; x=1749073553; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpEaJTEpfR9+TojleH3uk2aBSDLiXQVkHne1HqD9Ces=;
        b=Mwuhc1ZaATOXuMW97Y2uJMOl/a6eT22V1HCwtazmZkZqr2nJmt9U8yw8+JhjG/ZkV+
         LVpdBHewS73nZx+lqcjuAWaXJdv7Y4T7EGtiRgoaDM5WQEVi/qVafjkEPagJarU14ZG1
         aE7SIFyRN8w1/qNcthCxAZ6RL0Zjj05hv0xro6zHwF5qAgqJWga3eUKhZjN1/MGPKuGu
         Da1Xx+RrZwAMvIpJsh/01iIHsAjf4RkBM64A5suimbpdJCb6UeT3XwCu/w7oewpxDjAj
         cvIBgMa9P1AKWYhy6Ox6UJucQV5B+t05oK4fKhiaJqJqR6VJTxu34oqUKimqpU6uGHAZ
         4xHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748468753; x=1749073553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpEaJTEpfR9+TojleH3uk2aBSDLiXQVkHne1HqD9Ces=;
        b=vjq4BjQjxu8KPsMAVm8ja9hHRlSkVCPBNG+xf26U/E1uZnwk3oGPg0KcZv5cxnY6LQ
         0y6Y0innS5dsnynRhthUftEuVe/Edd2dlZ6rzWBIrJ/PH1ZGsWbUbCJOEQJ4n0L6TJWB
         vRI8OWHcnBV+D9Xp/MXq3tzR2r9wPxzWN4/HK75bZ6bj7wxtIWU7PSiFoFz09/CKJJ7T
         bv0uJwrnQcn+pK8tPy/T9I3XdcTiqlMIz3ESSlU72PeqFxqUvTB5CCBAw4+pPx4u+7cK
         NZgoQ/zCOI3zZePaP0pm1WQgdGEtRNAStdICSoxYiRVvBfStipVh97ojSDTtScqGzGb/
         cXaw==
X-Forwarded-Encrypted: i=1; AJvYcCVMKHHSEGYy7H9RWg6TG4MhhPEpTYbbLr666bc5v7A20QRIIiuqSoGMKLbPZ9Ehl8VXkaDZ8aEQFj30uaFz9q+i@lists.infradead.org
X-Gm-Message-State: AOJu0YxQX33LgU9noadc7haCd0R1DFkYBREbqBv2viQhAMOqO2jxbQK2
	Fc9GP6os+B0T6QeezNDBkke2hzaXRQcZd/PQAjlsVJ/U7YD0jfWnKAolVhzfJCU/m82pu7ZOwjl
	irrO8GHeFo1Cv90+f1x9pzrTxNE5HDe0=
X-Gm-Gg: ASbGncs9krstjjGlcU9Wt5ltE4y/kHuzRGbA+sO7cFKTGYovw9tdD5BIpJCOXNjZlbv
	bBbjOA34X3a/Te0LuPi0wiMYYPrm7oq3NeLIUGNvuRHxs9VSBJcUbvSSLtM4f9w4f5WvemR5xq0
	xBRWMpklkvzVPfjN8Nhtkl77cAB/DbCjWeTg==
X-Google-Smtp-Source: AGHT+IGpsHKYbxIXwCy/oeyiPruU2kwkLfCm0N6ezu9dQx6lfofizVF8mmR7cTBw0/YoCHcNbrcZCx1R7ipPXQVnY1Y=
X-Received: by 2002:a05:6122:6185:b0:52f:4624:35ef with SMTP id
 71dfb90a1353d-52f46243757mr6427374e0c.6.1748468753120; Wed, 28 May 2025
 14:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch> <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk> <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
 <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch> <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
 <1e6e4a44-9d2b-4af4-8635-150ccc410c22@lunn.ch> <CADvTj4r1VvjiK4tj3tiHYVJtLDWtMSJ3GFQgYyteTnLGsQQ2Eg@mail.gmail.com>
 <0bf48878-a3d0-455c-9110-5c67d29073c9@lunn.ch>
In-Reply-To: <0bf48878-a3d0-455c-9110-5c67d29073c9@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 15:45:40 -0600
X-Gm-Features: AX0GCFsQQOiCt1aAs6THJH6hfyWkXOQcM4Hww3s0-x--VPr5n56VGuMBPUsnYgI
Message-ID: <CADvTj4qab272xTpZGRoPnCstufK_3e9CY99Og+2mey2co6u5dg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, wens@csie.org, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Furong Xu <0x1207@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_144554_513530_AF3FC9D4 
X-CRM114-Status: GOOD (  25.10  )
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

On Wed, May 28, 2025 at 3:29=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > Describe the one PHY which actually exists in device tree for the
> > > board, and point to it using phy-handle. No runtime detection, just
> > > correctly describe the hardware.
> >
> > But the boards randomly contain SoC's with different PHY's so we
> > have to support both variants.
>
> You have two .dts files, resulting in two .dtb files, which are 95%
> identical, but import a different .dtsi file for the PHY.
>
> You can test if the correct .dtb blob is used by checking the fuse. If
> it is wrong, you can give a hint what .dtb should be used.

How is this better than just choosing the correct PHY based on the
efuse?

> Or, as Russell suggested, you give the bootloader both .dtb blobs, and
> it can pick the correct one to pass to the kernel. Or the bootloader
> can patch the .dtb blob to make it fit the hardware.

This is what I'm really trying to avoid since it requires special
handling in the bootloader and therefore will result in a lot of broken
systems since most people doing ports to H616 based boards will only
ever test against one PHY variant.

> > > Do you have examples of boards where the SoC variant changed during
> > > the boards production life?
> >
> > Yes, the boards I'm working for example, but this is likely an issue fo=
r
> > other boards as well(vendor BSP auto detects PHY variants):
> > https://www.zeusbtc.com/ASIC-Miner-Repair/Parts-Tools-Details.asp?ID=3D=
1139
>
> Mainline generally does not care what vendors do, because they often
> do horrible things. Which is O.K, it is open source, they can do what
> they want in their fork of the kernel.

That's not really true IMO, mainline implements all sorts of workarounds
for various vendor hardware quicks/weirdness.

> But for Mainline, we expect a high level of quality, and a uniform way
> of doing things.

Sure, and I'm trying to do that here rather than do some super hacky
unmaintainable bootloader based device tree selector.

> This can also act as push back on SoC vendors, for doing silly things
> like changing the PHY within a SoC without changing its name/number.

It won't here, because Allwinner doesn't care about non-BSP kernels.

