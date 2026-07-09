Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E84C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEahzOA/KTRGTvkyoCk8o8fpVF85458RzotimJ/M6YA=; b=4hmFIaBAG61+MW1BLXTpvKWnfM
	U6944SoWL1oIUXfFA8Y7skuD+VpMCtezZO4WKp7WTH63eBcVPlGICiYsShLGzy7qU33fhN3/2/Rb9
	jSLdpsRbFtBolLCtWDj/20xZMYPWVcE5b1Xx6lalR5pIe6rU9gGsHRqfB9g9jo76vTW/SyVBSHIYf
	zCeApSngAfj/A4t2dSXvAFHBTrmuv5qoXN++4Xg1y3g3OrEq18fClHKg0eXnrWX/dxgcItmfSio9s
	P+EfxNadZzdgocdkABw/LFSF+kOqiNReUsYJVZmSt0Q/WrxRlgyyY2Fj7M3NRTy4Hf7E6XvByCar9
	tVUEoKPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjqB-00000001Nas-0Bhj;
	Thu, 09 Jul 2026 08:10:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjq6-00000001NYO-2Jbj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:10:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C4FF36111A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 08:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8D11F01558
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 08:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783584633;
	bh=OEahzOA/KTRGTvkyoCk8o8fpVF85458RzotimJ/M6YA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WTBH081nAVdwug7LFzIXFDgrbegoCxoadFT6WO6Frj2908/6QzMGpqt+CfrEXJqRU
	 rcgGiDX4HCNTU8FqoW1govO01jdvhuzUXNNJ0tTwJ/a75ha6cknVn+4Ri9j8V9UT6j
	 FEDw2qbGgQMoPPJBJI33u2xbH/NNR/2Po70XNcNawxYMXR37COZ6bP05UqWxnXPglt
	 +/3qvpADr+xjrw+F8R/KNXi2aw9RGkyyEgsPKWJU1EspALz+kc34kr4mUtD5XemHJd
	 k7mj/FGZm/6JeoPOKEQouTiImik/jECjqVZ4/3PN4IM+ItDJKnXZfeOx0R9CmyjUkp
	 t8QVaWsR+PBRg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb77b3afbso1566356e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 01:10:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqsgm8ObjFjy1eMBB0Lp655CVeydW0p9vqpb2NOSGytg3YwIvZmZpkdxAtb8vC/YouyWwGKVFT5TD+N7SCa4Ek0@lists.infradead.org
X-Gm-Message-State: AOJu0YxPsUz10OBGIdtIHISktfaSuh3Qtpw5rcB6zy4q/vyfCYQIWpnJ
	/pc6jyh9rkvBdh6kTlQhHrmOvmMLbTcTROqU+BZNWsOnl5i1gwS3Fpfy/I7A6OHn/Dr7LFBb1QO
	uaGdjFB6+XIH+dPrM9riKgALMO72paHgErnlLv4eWBg==
X-Received: by 2002:ac2:57cb:0:b0:5ae:b75a:7176 with SMTP id
 2adb3069b0e04-5b0115b31cbmr957946e87.65.1783584632201; Thu, 09 Jul 2026
 01:10:32 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:10:30 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:10:30 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
MIME-Version: 1.0
References: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
Date: Thu, 9 Jul 2026 01:10:30 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfJQm8RqhiLbRA1x7skt=jW8vvTD-1VCDcw-dO_VjisZQ@mail.gmail.com>
X-Gm-Features: AVVi8CddxA9iUF7IgAB_SRFc1uKWkA3NnqyOXCt0i1LuR82tf86E-F3pS5f_rfg
Message-ID: <CAMRc=MfJQm8RqhiLbRA1x7skt=jW8vvTD-1VCDcw-dO_VjisZQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Remove support for platform data from samsung keypad
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	patches@opensource.cirrus.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 9 Jul 2026 06:52:58 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Hi,
>
> This is a reworked and extended version of the series previously posted
> to convert the Samsung keypad driver and Cragganmore 6410 board to
> generic device properties. The first 8 patches of the original series
> (general cleanups) have been merged into mainline, and this version
> focuses on the remaining keypad rework and extends the board conversion.
>
> Specifically, we rework the Samsung keypad driver to stop using platform
> data and instead rely on generic device properties, and convert the
> Cragganmore board to use software nodes for all its peripherals, removing
> legacy GPIO lookup tables.
>
> We start by introducing a compact matrix keypad binding and implementing
> it in the driver. To support referencing Samsung GPIO chips in board
> properties, we add infrastructure to register and attach software nodes
> to Samsung gpio_chips. We then switch the Cragganmore keypad to use
> software properties and drop platform data support from the driver.
>
> To convert the PMIC DVS regulator on Cragganmore, we add software node
> support to the wm831x regulator driver, allowing DVS configuration via
> device properties. Once the board is converted, we clean up the driver
> by removing legacy DVS platform data fields.
>
> Finally, we convert the remaining peripherals on Cragganmore (GPIO keys,
> PMIC, WM1250, SPI0, basic-mmio-gpio, and LEDs) to software properties.
> This allows us to eliminate all legacy GPIO lookup tables, which also
> fixes incorrect GPIO chip names ("GPIO<N>" vs "GP<N>") from previous
> descriptor conversions.
>
> Mark, it would be great if you could give this a spin on Cragganmore.
>
> Thanks!
>

I admit I haven't looked at the series in great detail but it looks sane and
you've been doing these conversions before so I trust your judgment.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks,
Bartosz

