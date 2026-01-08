Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B4ED185C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5aKbCAJIbvFCpsQx9StQxw1Yzeju/rgn/PGRCNu+XQ=; b=26w4tl9YQnfNNGCISRCMzx889z
	/4n1SNPMhOqmYfipJBSShub6zJgHuvghuP3eIJ5TAF0pIXmAlznd6tH/dOYaT0FctfiBnsBTW9rAl
	B3j/2wh2ZtUmoNOKzeOiIvtVaBUy593qaeqDT5H2Ga6kZUROKKXC2KmPV9Ela/CD+Fl0V43t4miUQ
	ZeCMyotB1n21b0L5t4GcL+z6MgGBCueDq4nXzBSSjebaD0ufXbJ8B1Cf1BJYIjse7nEmgz5PQg/lC
	5yY/hkXqkcrPoTFrV+VOZ5XGitrCrPTylFCej8eSCYqPIH3t4iZv6VIgXHVVMDKAR6ynMjwmQI8vw
	6Aalpu7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdndI-0000000Gj2G-28ur;
	Thu, 08 Jan 2026 10:52:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnd0-0000000GicN-0hck
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 10:52:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFAA644416
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 10:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EA3C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 10:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767869548;
	bh=l/gMBZqB4Wf2fZYV6YRO2Fn/DBbs1dic3QvJlRj3BYA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fN5W2z+ML1YP6mjzwzF6K+ufyHEDs6G4tewgi9/uiDZY4cmoYY8cN2XFJJWr4dyIk
	 /2JfSKzvAn11DTUOoZEmfVcMIpC3gkWuhgzMULieirvqOPpZ96p5RJj4Mlfz5hfmoY
	 lnOJJQxylxr4pGu+83el+SbuHXgZI6U2iAqtNbO7h+x7JGw7iSEJrJW6t/ZhKqZEfw
	 fJlPYojRiBnMZQ7m6aSGJvYasPT7Hx2VieYlv1x7ozQ9CvM/FFTFqTB/vIEkiPAkbl
	 JnHKmUyqav8UnkVngHFIZZo332tW05+1CGGI2ug+KLcrPzNucXwoXU/i4TninE1Z9q
	 cy+BUAeLYJAIQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59b78886454so567466e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 02:52:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkosWFwyjLcXfoogtvWKzKb+cE7ll9mHBjnH86BsR95xLYxp4xTZm4M0ILJwdWwWjanhPcOO0z/gNft/ZGl4bN@lists.infradead.org
X-Gm-Message-State: AOJu0YxkYpGCo7sNgbuX1pPi5NAJA4Hpcxlf2AiaXOeyMtH3HDuVdpo8
	hGy6H0CSu5TSWL/OY9xIC/98r2uw3sR7zC52qsaDw49DI2RmIb1VeDz40H/JmBkBaKB/ztQWGQa
	9EWhDUNABe17xoCyQF/gA6el9rfSHAbIoxieAMHcOPg==
X-Google-Smtp-Source: AGHT+IGjqdyuY3KRfM+LiSJS8ufKP/VvtPs728gsfeqE9U3Gtw7g5zOA8ofNsJSkehAL894rZs5Rech9o1zwYYHpJvc=
X-Received: by 2002:ac2:47f2:0:b0:59b:715b:4fd8 with SMTP id
 2adb3069b0e04-59b715b529amr1216531e87.13.1767869547364; Thu, 08 Jan 2026
 02:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <66eaf003-c397-4920-b3b7-93ac8a5adfda@oss.qualcomm.com>
 <CAMRc=McXFTLjE=2-xsx4sodHgd83h822iEBHT7bxcNOQm6OJ3A@mail.gmail.com>
 <98d69fb9-d3bc-4439-88b4-60f3cdea3422@oss.qualcomm.com> <CAMRc=McmvaM9=K=0NLRcLLmo5ck=m8Fqekh7tBMz6quO9K4opQ@mail.gmail.com>
 <5151bdfe-7e83-4aa0-b9fc-28209d535e1e@oss.qualcomm.com>
In-Reply-To: <5151bdfe-7e83-4aa0-b9fc-28209d535e1e@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 8 Jan 2026 11:52:15 +0100
X-Gmail-Original-Message-ID: <CAMRc=McNH5+hk+9h1eseUTqm_J2CZLviJ8oC_i_8mXm5nMo6_Q@mail.gmail.com>
X-Gm-Features: AQt7F2rCIGfQHNZuZZNdIyWGD51XMxF3XQisHmrfPog50rXiS2PIMdJwP8hGXEc
Message-ID: <CAMRc=McNH5+hk+9h1eseUTqm_J2CZLviJ8oC_i_8mXm5nMo6_Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260108_025230_426213_D316F9C4 
X-CRM114-Status: GOOD (  26.58  )
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

On Thu, Jan 8, 2026 at 10:44=E2=80=AFAM Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> On 1/8/2026 2:15 PM, Bartosz Golaszewski wrote:
> > On Thu, Jan 8, 2026 at 7:49=E2=80=AFAM Pankaj Patil
> > <pankaj.patil@oss.qualcomm.com> wrote:
> >>
> >> On 1/7/2026 6:08 PM, Bartosz Golaszewski wrote:
> >>> On Wed, Jan 7, 2026 at 12:07=E2=80=AFPM Pankaj Patil
> >>> <pankaj.patil@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 11/12/2025 7:25 PM, Bartosz Golaszewski wrote:
> >>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>>
> >>>>> Some qualcomm platforms use shared GPIOs. Enable support for them b=
y
> >>>>> selecting the Kconfig switch provided by GPIOLIB.
> >>>>>
> >>>>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>> ---
> >>>>>  arch/arm64/Kconfig.platforms | 1 +
> >>>>>  1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.plat=
forms
> >>>>> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d=
8cb3fd0f29e277af94f20 100644
> >>>>> --- a/arch/arm64/Kconfig.platforms
> >>>>> +++ b/arch/arm64/Kconfig.platforms
> >>>>> @@ -316,6 +316,7 @@ config ARCH_QCOM
> >>>>>       select GPIOLIB
> >>>>>       select PINCTRL
> >>>>>       select HAVE_PWRCTRL if PCI
> >>>>> +     select HAVE_SHARED_GPIOS
> >>>>>       help
> >>>>>         This enables support for the ARMv8 based Qualcomm chipsets.
> >>>>>
> >>>>>
> >>>> Enabling shared gpios is breaking hamoa and glymur boot on next-2026=
0106
> >>>> For hamoa - reg_fixed_voltage_probe which calls gpio api is breaking
> >>>> Please find the log here - https://lava-oss.qualcomm.com/scheduler/j=
ob/24722#L3514
> >>>>
> >>>> For Glymur - qcom_pcie_parse_perst calls the gpio api <4>[    2.9109=
82] WARNING: drivers/gpio/gpiolib-shared.c:493 at gpio_shared_add_proxy_loo=
kup+0x160/0x24c, CPU#1: kworker/u75:0/109 <4>[    2.911027] Call trace: <4>=
[    2.911028]  gpio_shared_add_proxy_lookup+0x160/0x24c (P) <4>[    2.9110=
30]  gpiod_find_and_request+0x1c0/0x504 <4>[    2.911032]  devm_fwnode_gpio=
d_get_index+0x1c/0x6c <4>[    2.911034]  qcom_pcie_parse_perst+0x70/0x150 <=
4>[    2.911037]  qcom_pcie_probe+0x414/0x804 <4>[    2.911039]  platform_p=
robe+0x5c/0x98 <4>[    2.911042] qcom-eusb2-repeater c448000.spmi:pmic@9:ph=
y@fd00: supply vdd18 not found, using dummy regulator <4>[    2.911043]  re=
ally_probe+0xbc/0x298 <4>[    2.911045]  __driver_probe_device+0x78/0x12c <=
4>[    2.911047]  driver_probe_device+0x3c/0x15c <4>[    2.911049]  __devic=
e_attach_driver+0xb8/0x134 <4>[    2.911050]  bus_for_each_drv+0x84/0xe0 <4=
>[    2.911052]  __device_attach_async_helper+0xac/0xd0 <4>[    2.911053]  =
async_run_entry_fn+0x34/0xe0
> >>>> <4>[    2.911055]  process_one_work+0x14c/0x28c <4>[    2.911058]  w=
orker_thread+0x188/0x304 <4>[    2.911059]  kthread+0x11c/0x128 <4>[    2.9=
11060] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@fd00: supply vdd3 not fo=
und, using dummy regulator <4>[    2.911061]  ret_from_fork+0x10/0x20 <4>[ =
   2.911063] ---[ end trace 0000000000000000 ]--- <3>[    2.911065] qcom-pc=
ie 1b40000.pci: error -ENOENT: Failed to parse Root Port: -2 <3>[    2.9110=
69] qcom-pcie 1b40000.pci: probe with driver qcom-pcie failed with error -2
> >>>> Reverting this commit fixes the boot on both platforms
> >>>>
> >>>
> >>> Hi!
> >>>
> >>> This is not really the offending commit, it's a recent one in the
> >>> implementation. The issue should be fixed by the following series[1]
> >>> that will be in the next next tag. Can you give it a try?
> >>>
> >>> Bart
> >>>
> >>> [1] https://lore.kernel.org/all/20260106-gpio-shared-fixes-v2-0-c7091=
d2f7581@oss.qualcomm.com/
> >>
> >> With the linked patchset applied I still see the same issue
> >>
> >> Pankaj
> >>
> >
> > Is the gpio-shared-proxy module available? If not, can you change the
> > config to make it built-in like CONFIG_GPIO_SHARED_PROXY=3Dy?
> >
> > Bartosz
>
> With CONFIG_GPIO_SHARED_PROXY=3Dy the issue remains the same

Ok, I believe there must be an issue with environment differences
because I'm not seeing this.

Can you enable CONFIG_DEBUG_GPIO in config and post the entire kernel
log to some pastebin? Can you also post the output of gpiodetect and
gpioinfo?

Thanks
Bartosz

