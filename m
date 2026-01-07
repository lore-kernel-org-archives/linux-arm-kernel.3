Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF90CFD624
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqGPTmUxkA5NE7rurj9VaRxttCsIIsCu0r/3XGYiTRg=; b=MPA2rr/6grlSPya4nYPdts9HuQ
	xrRwv3MUfqbwUzp3pEPqf8EKY4Iitpd6odRG3iicTlYp65OEo7lBoinmp+yoR/vTNFU6RO+YqrRnk
	v9lOmXybVuPTe89+kDilKOlEivvRjGBlWiVjgLXDPLtFMwhPpmeefr5iUR0AG0ZL0h9NsKkbL8VVt
	4QQkaKg400v7J4L4R93XpQRwI8C/O2+9KKhSw1nXmFLk7/rzLw6kpZAA3A1o2ksoK046QJf46GRBZ
	XnVbUD5F3qNHg6f4HPqUf8JUoFEM7PtYzgkUJgMcmwHgwmUqzuq6eDAW1lOZ/M1FMF3fx47Sz9XtN
	xirFvjzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSnq-0000000EuwI-3HyV;
	Wed, 07 Jan 2026 12:38:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSnn-0000000Euvt-1Fk6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 12:38:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 333FD402E6
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Jan 2026 12:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F48C4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Jan 2026 12:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767789494;
	bh=D+1XJlIo28pgV7tUDNN+Sp6W6XAtXQ+CPXiMEXuiDyo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UAiCiKsFkBxMj2IWBaju2RfeNJ3Iln6raBs3VgjSDcFYKxmAmOLoBPHDf1WBRAlIb
	 araoruXGhZTu/JgSvZz+qGO3tzI/6UPYLrhYmGGYM8JPJKNCx+oYNchonPiTXLOiYR
	 TY2Sb+ss4eKAOsd3NKc5wzimGKbco86SdFnz268dLB1E1rsbzxbCIZZt0rUjdeA7ba
	 Ci2Xf28EyJsrPb36GBqMJKd2zRKOJV5PEmp0pYDzWZELK7rm1OfBrgGDkHakqf/Ljx
	 siIfc6qFnQs0BD3PXDxGagu7y/ghqR0a0SElabcOMjyNUS2t7Po/Q8Yxh3prDzrBMg
	 C8/UgnwLpqlnw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-595819064cdso1322403e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 04:38:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVAvQQyZ2s9KBZC0Evs4jGEhBFPyDkoNd5OS8mikFvZUnK2zzHmPtAk2sxMKrufgbqjxI6cKqO4iDP2Dgzit9UX@lists.infradead.org
X-Gm-Message-State: AOJu0YyhpAHyl0RF2+Bx23IqAi7qLGAhGR5Xv/+4fNGYYUn5cQU1q7SV
	gABkqbWO4FqpO9c6cXqkDB+4wpdpFIROpCBvG3F9OBmlfoSLedn0/8ko3bkrXeAMe4JqLvZoRaJ
	BufbucPQ+4rGcad8kt/b0DByp7U2XQSp0uGXQFcYQEA==
X-Google-Smtp-Source: AGHT+IET6YL/yQOWgZ/jye+5vJjHHBR0gOi/Agd3F1unhd20b9UQ7kE+T30lA0u/sDbLZsVeNsqtQhHT5hR9EPogOYs=
X-Received: by 2002:a05:6512:33cb:b0:59b:73b9:1f49 with SMTP id
 2adb3069b0e04-59b73b921e7mr211266e87.26.1767789492688; Wed, 07 Jan 2026
 04:38:12 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <66eaf003-c397-4920-b3b7-93ac8a5adfda@oss.qualcomm.com>
In-Reply-To: <66eaf003-c397-4920-b3b7-93ac8a5adfda@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 7 Jan 2026 13:38:00 +0100
X-Gmail-Original-Message-ID: <CAMRc=McXFTLjE=2-xsx4sodHgd83h822iEBHT7bxcNOQm6OJ3A@mail.gmail.com>
X-Gm-Features: AQt7F2pA13_wtRLLQWUOTtMFhQv1HJ_sZB68tT-M4ZgHKbE3BedmspQkreV0U28
Message-ID: <CAMRc=McXFTLjE=2-xsx4sodHgd83h822iEBHT7bxcNOQm6OJ3A@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Will Deacon <will@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_043815_378281_75C9AD82 
X-CRM114-Status: GOOD (  22.36  )
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

On Wed, Jan 7, 2026 at 12:07=E2=80=AFPM Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> On 11/12/2025 7:25 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Some qualcomm platforms use shared GPIOs. Enable support for them by
> > selecting the Kconfig switch provided by GPIOLIB.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  arch/arm64/Kconfig.platforms | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platform=
s
> > index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3=
fd0f29e277af94f20 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -316,6 +316,7 @@ config ARCH_QCOM
> >       select GPIOLIB
> >       select PINCTRL
> >       select HAVE_PWRCTRL if PCI
> > +     select HAVE_SHARED_GPIOS
> >       help
> >         This enables support for the ARMv8 based Qualcomm chipsets.
> >
> >
> Enabling shared gpios is breaking hamoa and glymur boot on next-20260106
> For hamoa - reg_fixed_voltage_probe which calls gpio api is breaking
> Please find the log here - https://lava-oss.qualcomm.com/scheduler/job/24=
722#L3514
>
> For Glymur - qcom_pcie_parse_perst calls the gpio api <4>[    2.910982] W=
ARNING: drivers/gpio/gpiolib-shared.c:493 at gpio_shared_add_proxy_lookup+0=
x160/0x24c, CPU#1: kworker/u75:0/109 <4>[    2.911027] Call trace: <4>[    =
2.911028]  gpio_shared_add_proxy_lookup+0x160/0x24c (P) <4>[    2.911030]  =
gpiod_find_and_request+0x1c0/0x504 <4>[    2.911032]  devm_fwnode_gpiod_get=
_index+0x1c/0x6c <4>[    2.911034]  qcom_pcie_parse_perst+0x70/0x150 <4>[  =
  2.911037]  qcom_pcie_probe+0x414/0x804 <4>[    2.911039]  platform_probe+=
0x5c/0x98 <4>[    2.911042] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@fd0=
0: supply vdd18 not found, using dummy regulator <4>[    2.911043]  really_=
probe+0xbc/0x298 <4>[    2.911045]  __driver_probe_device+0x78/0x12c <4>[  =
  2.911047]  driver_probe_device+0x3c/0x15c <4>[    2.911049]  __device_att=
ach_driver+0xb8/0x134 <4>[    2.911050]  bus_for_each_drv+0x84/0xe0 <4>[   =
 2.911052]  __device_attach_async_helper+0xac/0xd0 <4>[    2.911053]  async=
_run_entry_fn+0x34/0xe0
> <4>[    2.911055]  process_one_work+0x14c/0x28c <4>[    2.911058]  worker=
_thread+0x188/0x304 <4>[    2.911059]  kthread+0x11c/0x128 <4>[    2.911060=
] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@fd00: supply vdd3 not found, =
using dummy regulator <4>[    2.911061]  ret_from_fork+0x10/0x20 <4>[    2.=
911063] ---[ end trace 0000000000000000 ]--- <3>[    2.911065] qcom-pcie 1b=
40000.pci: error -ENOENT: Failed to parse Root Port: -2 <3>[    2.911069] q=
com-pcie 1b40000.pci: probe with driver qcom-pcie failed with error -2
> Reverting this commit fixes the boot on both platforms
>

Hi!

This is not really the offending commit, it's a recent one in the
implementation. The issue should be fixed by the following series[1]
that will be in the next next tag. Can you give it a try?

Bart

[1] https://lore.kernel.org/all/20260106-gpio-shared-fixes-v2-0-c7091d2f758=
1@oss.qualcomm.com/

