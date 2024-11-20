Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D55ED6E2A6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 03:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jtk1zl4aSk9+lvWPZY5UumKAQmiBiNYz2jEHrbWkiE=; b=p6nRxDm+LK5rOEW4MrvuIaGZ3W
	7aR4CSwyYugGSlkvZNYvxl1ph6FFI6OU7Unr3er0jwATA+Nn4bK/rv2o+YV5IAQAWM4Khn2j3WUC+
	Jxi9XRmd+nyG7ebpcNbhDTtFYsCyFMHf58paSmabrecVVjnoA4y39adbkgm+VsK48ifPJ2/LK/ara
	3IeEMOg/JLDB5n9xQHRGekEo7xqxEwIXrJaSiHGHoASPnuy6jDqK/IoBpmGAYOFPXd/9uYWwjD6cX
	sBSTmXsnLtBcQQF56NV8C5RiUYdIA2tg1q3GTCIJOnjbkuG8SqX7TYrP1CzUQwlfeRnQflPamQp5w
	nGmEzWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDbgN-0000000EJX2-2C8U;
	Wed, 20 Nov 2024 03:47:11 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDbfQ-0000000EJQG-2WD7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 03:46:13 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-83aac75fcceso122196439f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 19:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732074371; x=1732679171; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jtk1zl4aSk9+lvWPZY5UumKAQmiBiNYz2jEHrbWkiE=;
        b=Tn8GvTxfMkfATurDAgavkBwadkjQG+wwBbsDrXZBPVLh52iPQBmuHWPwLAtPd+7n8v
         PZ2BeuP4WCtXOlJbI08v+MpKPCjKj11sE2XI0/363BxRpHVzIHVJ8tlhClmAJ8V5DeOh
         8k/k+pRFzsxYAvUWZaTXrkfFGhzzc3Tv6T05CeYGdoDYK4j/7iEiAfiMPoJYRyc8yrbm
         D9PGPlHmFUugxDdfaZPoHZtAvAjlB9GPFDCtL4sYZHtu8coRUB7SjHRNqlu17IxN2gbR
         3xOKcKFFlLueHk79Mzav5m7x4TtGTO9ksMw5TIC94GVnrplze1JKmC+0Tf+/I+4O+g2T
         LuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732074371; x=1732679171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jtk1zl4aSk9+lvWPZY5UumKAQmiBiNYz2jEHrbWkiE=;
        b=fwYTyOLz5H33zd7O5lnYZtClZpV6HyZrsMgBjEsvYRBfpAajxWNsr+Q4lpCgXvWBTt
         YZcKplmjH2b2shWUY2rtRuIXMBj1WpkRKILrJgC0ZCVZXfj35AW7+ZMzqqtyC1EIvAdd
         pXnuXBXE74oFVoDlWphcpJwzAUeLEpV0r64x+uDEzg9GVr8U9pRHirpe8t0I8YcAbVCH
         1JURHdkHSGUCF1HhEnCnbRVTbsleiM4MorvrcZ+b6dqBjIBv4ip8EorJ93cEfT2JmFaa
         CDzi4/LuigGK+n1pDjYakjIqP58msiT8d9kbEfFbSa1URRu7mDqhUSVZMzlbqXXw19OZ
         bfSw==
X-Forwarded-Encrypted: i=1; AJvYcCWzS5ByneMULot+hwAaGMJk4YlFQfShsdJnohYitO+15sxq/fmksWZSRs4/r56GFj5Sui5V77AVxuS+e0yeMdQp@lists.infradead.org
X-Gm-Message-State: AOJu0YwOVCEAxeG+cjJAZefOgAyQgPO4mAPfWpKSjkty2Ri7zA2g0LeV
	+UEPyeFzeTsPS8ZAkRVDAbwB/OyjMUcx7RYNnz/f9hdHZ9It7J0YX+Lc62YKu4XWXxCXcAkHCuy
	x05fWDfmKYiK47i6lBiLZ1L0lpmM=
X-Google-Smtp-Source: AGHT+IGhh4aSgpURVT3OET61N9X1zKakDzkHXxCrO7/9x2Fw8GYnbqDbAbC3nVPeDgWEHh7NOxcLBWPVrQEE4C9TbXU=
X-Received: by 2002:a05:6602:1645:b0:82c:d768:aa4d with SMTP id
 ca18e2360f4ac-83eb5fefbefmr225028639f.9.1732074371282; Tue, 19 Nov 2024
 19:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20241115230555.2435004-1-arnd@kernel.org>
In-Reply-To: <20241115230555.2435004-1-arnd@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 20 Nov 2024 11:45:59 +0800
Message-ID: <CAA+D8AO8=NaNM0jPuSa68yvNa5pJQ7r207_-y06sxB__kqWdGw@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: fix i.MX build dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Cristian Marussi <cristian.marussi@arm.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_194612_657531_DD2A7C03 
X-CRM114-Status: GOOD (  33.62  )
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

On Sat, Nov 16, 2024 at 7:08=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The newly added SCMI vendor driver references functions in the
> protocol driver but needs a Kconfig dependency to ensure it can link,
> essentially the Kconfig dependency needs to be reversed to match the
> link time dependency:
>
> arm-linux-gnueabi-ld: sound/soc/fsl/fsl_mqs.o: in function `fsl_mqs_sm_wr=
ite':
> fsl_mqs.c:(.text+0x1aa): undefined reference to `scmi_imx_misc_ctrl_set'
> arm-linux-gnueabi-ld: sound/soc/fsl/fsl_mqs.o: in function `fsl_mqs_sm_re=
ad':
> fsl_mqs.c:(.text+0x1ee): undefined reference to `scmi_imx_misc_ctrl_get'
>
> This however only works after changing the dependency in the SND_SOC_FSL_=
MQS
> driver as well, which uses 'select IMX_SCMI_MISC_DRV' to turn on a
> driver it depends on. This is generally a bad idea, so the best solution
> is to change that into a dependency.
>
> To allow the ASoC driver to keep building with the SCMI support, this
> needs to be an optional dependency that enforces the link-time
> dependency if IMX_SCMI_MISC_DRV is a loadable module but not
> depend on it if that is disabled.
>
> Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for i.MX MI=
SC protocol")
> Fixes: 101c9023594a ("ASoC: fsl_mqs: Support accessing registers by scmi =
interface")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
> I'm not sure this is the version we want to go with in the end, without
> having read the code in detail, but the version in linux-next is clearly
> wrong in multiple ways and this is the best I could come up with so far.
>
> If we can agree on this approach, it needs to go through the ASoC tree
> as that contains the 101c9023594a commit at the moment.
> ---
>  drivers/firmware/arm_scmi/vendors/imx/Kconfig | 1 +
>  drivers/firmware/imx/Kconfig                  | 1 -
>  sound/soc/fsl/Kconfig                         | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firm=
ware/arm_scmi/vendors/imx/Kconfig
> index 2883ed24a84d..a01bf5e47301 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> +++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> @@ -15,6 +15,7 @@ config IMX_SCMI_BBM_EXT
>  config IMX_SCMI_MISC_EXT
>         tristate "i.MX SCMI MISC EXTENSION"
>         depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> +       depends on IMX_SCMI_MISC_DRV
>         default y if ARCH_MXC
>         help
>           This enables i.MX System MISC control logic such as gpio expand=
er
> diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
> index 477d3f32d99a..907cd149c40a 100644
> --- a/drivers/firmware/imx/Kconfig
> +++ b/drivers/firmware/imx/Kconfig
> @@ -25,7 +25,6 @@ config IMX_SCU
>
>  config IMX_SCMI_MISC_DRV
>         tristate "IMX SCMI MISC Protocol driver"
> -       depends on IMX_SCMI_MISC_EXT || COMPILE_TEST
>         default y if ARCH_MXC
>         help
>           The System Controller Management Interface firmware (SCMI FW) i=
s
> diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
> index 8e88830e8e57..678540b78280 100644
> --- a/sound/soc/fsl/Kconfig
> +++ b/sound/soc/fsl/Kconfig
> @@ -29,8 +29,8 @@ config SND_SOC_FSL_SAI
>  config SND_SOC_FSL_MQS
>         tristate "Medium Quality Sound (MQS) module support"
>         depends on SND_SOC_FSL_SAI
> +       depends on IMX_SCMI_MISC_DRV || !IMX_SCMI_MISC_DRV
>         select REGMAP_MMIO
> -       select IMX_SCMI_MISC_DRV if IMX_SCMI_MISC_EXT !=3Dn
>         help
>           Say Y if you want to add Medium Quality Sound (MQS)
>           support for the Freescale CPUs.
> --
> 2.39.5
>
>

