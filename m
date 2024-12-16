Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A959E77183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 12:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0M4ROyI5VuUm1Dqoke2sKtA4Jn5qP7aZUfIjFZkt4A=; b=SRJHQURdnAnPwqDO2IlBd2PsnF
	r+jLEgbhpp7QFlscErULekpM7Vx8pylyGlMYyGMUD4oQ5S9QpqtJZ+e7sbcPdQ7mQj7Tox0I+eGAp
	beBzWdj9qD0PHLt/00w6tvdRCCML3fKPJy/kY3GIvBvyVqnHKKkkKilM82ZADtoFfw2yMJzOr6ZZV
	DRz76e2Fu7++jrNvIrOyof53u4+7lzEZI3ngbSnmuLQepgUbdJHt9CX83tB4vqztW8aA7oKkpWXfD
	IXDLfjdlmZRTF8pT65zniDjg8BNAWx9+yHcqGxAtRASR2Z7r1p6JHGePEvEOLEbJ5HfGysbUTu1Fx
	JSICtG2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNA9p-00000009xuT-2pY8;
	Mon, 16 Dec 2024 12:25:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNA8j-00000009xg9-0uUu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 12:23:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43623f0c574so27590045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 04:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734351835; x=1734956635; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0M4ROyI5VuUm1Dqoke2sKtA4Jn5qP7aZUfIjFZkt4A=;
        b=Xph1GOzA3krg0KMtoBOJ7GIsS4f5JjpiDODy0Y4+3ocuJDBDjOhFqtpcTGhJE6qH4i
         PBZWpmDVycW5U7yIUHJVJWYQ8Hpc+qocE0zokTapOWExkYmeW6mV247YyHygkH7qkf60
         pI82jBZ6vzqzHKAzBRjTLyLnuHMgpNfpTTdEsykFh1ryqFOCl+jZGAfi/4w/Mscrd3u4
         qe8Wch4ltw1nzTZf3BOQATHsLexMzV7JVnGYczghoT9rxO27Fg1DDVNS7yFWaIw9uj6d
         7slPt53H99UMr56F71g/AO23y5S//qgLuuLH9UXMDCOxX+CIDLVgQ/7qKEhi82H5SLbI
         J48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734351835; x=1734956635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0M4ROyI5VuUm1Dqoke2sKtA4Jn5qP7aZUfIjFZkt4A=;
        b=h0/Fke47kZ7ZT23lU99upNr9a4RsxBhPtjZMmlclV40Wd5+d6E0PfhbX8dh1Nq1aj+
         rJ/G8Q/eplPxxS9Qi3f74XgaDJrHfhCjjS2HRv80y8EApZ7uom3qbrNUKAp9fhx25U/o
         1x8sLrwkQf2lo8BJQ4TG+bFFMbQFLPYtcu1WLej7nhV4sc9R4BvO/7OyCWoOxYwCX8C3
         Tpmux2udJ5J3r1kRfhB4CN1vOVyVMtnbKvUMd408Vfh0w4mr/aQQkKrx9eN0Gzromemp
         YnOnhp2R75tphTj+1hf2vSd3HOHJSiwe8pIMS4jYsFs6ksQMfSWwCiUisakv1Zwo6K0l
         0mMw==
X-Forwarded-Encrypted: i=1; AJvYcCUcnm8ixtOJEjEDON95xgmAstWfrxrN6Cse7KH5VI/dyGRdYaQrX1KrWC/9Nx3rlNG1HPf3CterIzLQx2D8DBGf@lists.infradead.org
X-Gm-Message-State: AOJu0YwM6kMs1fUgKJdOXaY85dI05wp3ynRds/XIpHTvCadlQpw3Mg49
	v3WmLWlqInPLs+Oxsw/kip2XCXMTV8tlGKaU0dhBxEaa1sLco2t4BZAl9QSs
X-Gm-Gg: ASbGncvFXYuPACqDfA4L8+D50H5ikjDnLZ+I2QSH+s3fr4q/2VJKX2YE1QI+0lZvLiA
	opJwoZT962yPdLHgNHelFwsDR52yh9Hd3jT7K9uWSgkGmwzGFbjTnRkfQyg7OuBXOOuEUdk4mdk
	AvQabbBejbyH8fK3hPC1VuK4Qagjy8O+jfT83ejHhBVDGZrXv6Go2ZNuuEua6UAWiAsD38yMgU9
	VGZmZkD4gHptvdP8p1AkNP91yOG+j072stdGYtam+CdftpZvV5hO4SNWro9BoNxLuJQut+XgC1R
	0xaIkQ==
X-Google-Smtp-Source: AGHT+IHllI1JbXYYae2H/MvITh+4jN27/1ciwccWg4jug4lIS1NHVOZJ0z8HLrN/tAQsxRz++H1Dmw==
X-Received: by 2002:a05:600c:350c:b0:434:a802:e99a with SMTP id 5b1f17b1804b1-4362aa147a8mr104737745e9.4.1734351833107;
        Mon, 16 Dec 2024 04:23:53 -0800 (PST)
Received: from [192.168.4.67] ([92.120.5.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4363602d940sm83170665e9.12.2024.12.16.04.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 04:23:52 -0800 (PST)
Message-ID: <c3c9389f-5116-4a5f-99f6-1b37c1e8c457@gmail.com>
Date: Mon, 16 Dec 2024 14:23:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] ASoC: SOF: imx: add driver for imx95
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
 <20241113195240.3699-5-laurentiumihalcea111@gmail.com>
 <ZzUJQCeWclsrr/lr@lizhi-Precision-Tower-5810>
 <c47710a5-7e53-48b1-bd6b-c0123865aee5@gmail.com>
 <Z1r9hWH1ioR5vI5H@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z1r9hWH1ioR5vI5H@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_042357_267882_90DBA02A 
X-CRM114-Status: GOOD (  25.49  )
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



On 12/12/2024 5:13 PM, Frank Li wrote:
> On Thu, Dec 12, 2024 at 01:11:29PM +0200, Laurentiu Mihalcea wrote:
>>
>> On 11/13/2024 10:17 PM, Frank Li wrote:
>>> On Wed, Nov 13, 2024 at 02:52:39PM -0500, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> Add SOF driver for imx95.
>>>>
>>>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> ---
>>>>  sound/soc/sof/imx/Kconfig  |   8 +
>>>>  sound/soc/sof/imx/Makefile |   2 +
>>>>  sound/soc/sof/imx/imx95.c  | 401 +++++++++++++++++++++++++++++++++++++
>>> why not reused exist one? look likes simular.
>>>
>>> Frank
>> the SOF drivers do indeed have some similarities, but each of them has their own quirks which IMO makes it a bit harder to add the 95 support. We need to figure out the common parts and then move them to imx-common, but I believe this can be solved incrementally.
> You should create common part firstly, then implement equal function with
> existed part. Finially add imx95 part.
>
> Frank

Yes, I'm aware of how this _should_ be done, but, like I mentioned, the change is not trivial and will
require tweaking the other drivers as well. As such, I'd like to get the 95 support in as-is firstly.

Are there any other thoughts on this?

>
>>>>  3 files changed, 411 insertions(+)
>>>>  create mode 100644 sound/soc/sof/imx/imx95.c
>>>>
>>>> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
>>>> index 4751b04d5e6f..51a70a193533 100644
>>>> --- a/sound/soc/sof/imx/Kconfig
>>>> +++ b/sound/soc/sof/imx/Kconfig
>>>> @@ -50,4 +50,12 @@ config SND_SOC_SOF_IMX8ULP
>>>>  	  Say Y if you have such a device.
>>>>  	  If unsure select "N".
>>>>
>>>> +config SND_SOC_SOF_IMX95
>>>> +	tristate "SOF support for i.MX95"
>>>> +	depends on IMX_DSP
>>>> +	help
>>>> +	  This adds support for Sound Open Firmware for NXP i.MX95 platforms.
>>>> +	  Say Y if you have such a device.
>>>> +	  If unsure select "N".
>>>> +
>>>>  endif ## SND_SOC_SOF_IMX_TOPLEVEL
>>>> diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
>>>> index be0bf0736dfa..715ac3798668 100644
>>>> --- a/sound/soc/sof/imx/Makefile
>>>> +++ b/sound/soc/sof/imx/Makefile
>>>> @@ -2,10 +2,12 @@
>>>>  snd-sof-imx8-y := imx8.o
>>>>  snd-sof-imx8m-y := imx8m.o
>>>>  snd-sof-imx8ulp-y := imx8ulp.o
>>>> +snd-sof-imx95-y := imx95.o
>>>>
>>>>  snd-sof-imx-common-y := imx-common.o
>>>>
>>>>  obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
>>>>  obj-$(CONFIG_SND_SOC_SOF_IMX8M) += snd-sof-imx8m.o
>>>>  obj-$(CONFIG_SND_SOC_SOF_IMX8ULP) += snd-sof-imx8ulp.o
>>>> +obj-$(CONFIG_SND_SOC_SOF_IMX95) += snd-sof-imx95.o
>>>>  obj-$(CONFIG_SND_SOC_SOF_IMX_COMMON) += imx-common.o
>>>> diff --git a/sound/soc/sof/imx/imx95.c b/sound/soc/sof/imx/imx95.c
>>>> new file mode 100644
>>>> index 000000000000..5a0e44f5bd48
>>>> --- /dev/null
>>>> +++ b/sound/soc/sof/imx/imx95.c
>>>> @@ -0,0 +1,401 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
>>>> +/*
>>>> + * Copyright 2024 NXP
>>>> + */
>>>> +
>>>> +#include <linux/arm-smccc.h>
>>>> +#include <linux/clk.h>
>>>> +#include <linux/firmware/imx/dsp.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of_platform.h>
>>>> +#include <linux/of_reserved_mem.h>
>>>> +#include <sound/sof.h>
>>>> +
>>>> +#include "../sof-of-dev.h"
>>>> +#include "../ops.h"
>>>> +
>>>> +#define IMX_SIP_SRC 0xC2000005
>>>> +#define IMX_SIP_SRC_M_RESET_ADDR_SET 0x03
>>>> +
>>>> +#define IMX95_CPU_VEC_FLAGS_BOOT BIT(29)
>>>> +
>>>> +#define IMX_SIP_LMM 0xC200000F
>>>> +#define IMX_SIP_LMM_BOOT 0x0
>>>> +#define IMX_SIP_LMM_SHUTDOWN 0x1
>>>> +
>>>> +#define IMX95_M7_LM_ID 0x1
>>>> +
>>>> +#define MBOX_DSPBOX_OFFSET 0x1000
>>>> +#define MBOX_WINDOW_OFFSET 0x6000000
>>>> +
>>>> +struct imx95_priv {
>>>> +	struct platform_device *ipc_dev;
>>>> +	struct imx_dsp_ipc *ipc_handle;
>>>> +	resource_size_t bootaddr;
>>>> +};
>>>> +
>>>> +static void imx95_ipc_handle_reply(struct imx_dsp_ipc *ipc)
>>>> +{
>>>> +	unsigned long flags;
>>>> +	struct snd_sof_dev *sdev = imx_dsp_get_data(ipc);
>>>> +
>>>> +	spin_lock_irqsave(&sdev->ipc_lock, flags);
>>>> +	snd_sof_ipc_process_reply(sdev, 0);
>>>> +	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
>>>> +}
>>>> +
>>>> +static void imx95_ipc_handle_request(struct imx_dsp_ipc *ipc)
>>>> +{
>>>> +	snd_sof_ipc_msgs_rx(imx_dsp_get_data(ipc));
>>>> +}
>>>> +
>>>> +static struct imx_dsp_ops ipc_ops = {
>>>> +	.handle_reply = imx95_ipc_handle_reply,
>>>> +	.handle_request = imx95_ipc_handle_request,
>>>> +};
>>>> +
>>>> +static int imx95_disable_enable_core(bool enable)
>>>> +{
>>>> +	struct arm_smccc_res res;
>>>> +
>>>> +	if (enable)
>>>> +		arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_BOOT, IMX95_M7_LM_ID,
>>>> +			      0, 0, 0, 0, 0, &res);
>>>> +	else
>>>> +		arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_SHUTDOWN, IMX95_M7_LM_ID,
>>>> +			      0, 0, 0, 0, 0, &res);
>>>> +
>>>> +	return res.a0;
>>>> +}
>>>> +
>>>> +static int imx95_run(struct snd_sof_dev *sdev)
>>>> +{
>>>> +	return imx95_disable_enable_core(true);
>>>> +}
>>>> +
>>>> +static int imx95_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
>>>> +{
>>>> +	struct imx95_priv *priv = sdev->pdata->hw_pdata;
>>>> +
>>>> +	sof_mailbox_write(sdev, sdev->host_box.offset,
>>>> +			  msg->msg_data, msg->msg_size);
>>>> +
>>>> +	imx_dsp_ring_doorbell(priv->ipc_handle, 0);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int imx95_get_mailbox_offset(struct snd_sof_dev *sdev)
>>>> +{
>>>> +	return MBOX_DSPBOX_OFFSET + MBOX_WINDOW_OFFSET;
>>>> +}
>>>> +
>>>> +static int imx95_get_bar_index(struct snd_sof_dev *sdev, u32 type)
>>>> +{
>>>> +	switch (type) {
>>>> +	case SOF_FW_BLK_TYPE_SRAM:
>>>> +		return type;
>>>> +	default:
>>>> +		return -EINVAL;
>>>> +	}
>>>> +}
>>>> +
>>>> +static int imx95_get_window_offset(struct snd_sof_dev *sdev, u32 id)
>>>> +{
>>>> +	return MBOX_WINDOW_OFFSET;
>>>> +}
>>>> +
>>>> +static int imx95_set_power_state(struct snd_sof_dev *sdev,
>>>> +				 const struct sof_dsp_power_state *target_state)
>>>> +{
>>>> +	sdev->dsp_power_state = *target_state;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int imx95_suspend_resume(struct snd_sof_dev *sdev, bool suspend)
>>>> +{
>>>> +	struct imx95_priv *priv;
>>>> +	int ret, i;
>>>> +
>>>> +	priv = sdev->pdata->hw_pdata;
>>>> +
>>>> +	if (suspend) {
>>>> +		ret = imx95_disable_enable_core(false);
>>>> +		if (ret) {
>>>> +			dev_err(sdev->dev, "failed to stop core\n");
>>>> +			return ret;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	for (i = 0; i < DSP_MU_CHAN_NUM; i++) {
>>>> +		if (suspend)
>>>> +			imx_dsp_free_channel(priv->ipc_handle, i);
>>>> +		else
>>>> +			imx_dsp_request_channel(priv->ipc_handle, i);
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int imx95_runtime_resume(struct snd_sof_dev *sdev)
>>>> +{
>>>> +	int ret;
>>>> +	const struct sof_dsp_power_state target_state = {
>>>> +		.state = SOF_DSP_PM_D0,
>>>> +	};
>>>> +
>>>> +	ret = imx95_suspend_resume(sdev, false);
>>>> +	if (ret < 0) {
>>>> +		dev_err(sdev->dev, "failed to runtime resume: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	return snd_sof_dsp_set_power_state(sdev, &target_state);
>>>> +}
>>>> +
>>>> +static int imx95_resume(struct snd_sof_dev *sdev)
>>>> +{
>>>> +	int ret;
>>>> +	const struct sof_dsp_power_state target_state = {
>>>> +		.state = SOF_DSP_PM_D0,
>>>> +	};
>>>> +
>>>> +	ret = imx95_suspend_resume(sdev, false);
>>>> +	if (ret < 0) {
>>>> +		dev_err(sdev->dev, "failed to resume: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	if (pm_runtime_suspended(sdev->dev)) {
>>>> +		pm_runtime_disable(sdev->dev);
>>>> +		pm_runtime_set_active(sdev->dev);
>>>> +		pm_runtime_mark_last_busy(sdev->dev);
>>>> +		pm_runtime_enable(sdev->dev);
>>>> +		pm_runtime_idle(sdev->dev);
>>>> +	}
>>>> +
>>>> +	return snd_sof_dsp_set_power_state(sdev, &target_state);
>>>> +}
>>>> +
>>>> +static int imx95_runtime_suspend(struct snd_sof_dev *sdev)
>>>> +{
>>>> +	int ret;
>>>> +	const struct sof_dsp_power_state target_state = {
>>>> +		.state = SOF_DSP_PM_D3,
>>>> +	};
>>>> +
>>>> +	ret = imx95_suspend_resume(sdev, true);
>>>> +	if (ret < 0) {
>>>> +		dev_err(sdev->dev, "failed to runtime suspend: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	return snd_sof_dsp_set_power_state(sdev, &target_state);
>>>> +}
>>>> +
>>>> +static int imx95_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
>>>> +{
>>>> +	int ret;
>>>> +	const struct sof_dsp_power_state target_power_state = {
>>>> +		.state = target_state,
>>>> +	};
>>>> +
>>>> +	if (!pm_runtime_suspended(sdev->dev)) {
>>>> +		ret = imx95_suspend_resume(sdev, true);
>>>> +		if (ret < 0) {
>>>> +			dev_err(sdev->dev, "failed to suspend: %d\n", ret);
>>>> +			return ret;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return snd_sof_dsp_set_power_state(sdev, &target_power_state);
>>>> +}
>>>> +
>>>> +static struct snd_soc_dai_driver imx95_dai[] = {
>>>> +	{
>>>> +		.name = "sai3",
>>>> +		.playback = {
>>>> +			.channels_min = 1,
>>>> +			.channels_max = 32,
>>>> +		},
>>>> +		.capture = {
>>>> +			.channels_min = 1,
>>>> +			.channels_max = 32,
>>>> +		},
>>>> +	},
>>>> +};
>>>> +
>>>> +static int imx95_probe(struct snd_sof_dev *sdev)
>>>> +{
>>>> +	struct platform_device *pdev;
>>>> +	struct imx95_priv *priv;
>>>> +	struct resource *res;
>>>> +	struct arm_smccc_res smc_ret;
>>>> +	int ret;
>>>> +
>>>> +	pdev = container_of(sdev->dev, struct platform_device, dev);
>>>> +
>>>> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>>>> +	if (!priv)
>>>> +		return dev_err_probe(&pdev->dev, -ENOMEM, "failed to alloc priv\n");
>>>> +
>>>> +	sdev->pdata->hw_pdata = priv;
>>>> +
>>>> +	/* map SRAM */
>>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>> +	if (!res)
>>>> +		return dev_err_probe(&pdev->dev, -ENODEV,
>>>> +				     "failed to fetch SRAM region\n");
>>>> +
>>>> +	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap(&pdev->dev, res->start,
>>>> +						       resource_size(res));
>>>> +	if (IS_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM]))
>>>> +		return dev_err_probe(&pdev->dev,
>>>> +				     PTR_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM]),
>>>> +				     "failed to map SRAM region\n");
>>>> +
>>>> +	sdev->mmio_bar = SOF_FW_BLK_TYPE_SRAM;
>>>> +	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
>>>> +	sdev->dsp_box.offset = MBOX_DSPBOX_OFFSET + MBOX_WINDOW_OFFSET;
>>>> +	priv->bootaddr = res->start;
>>>> +
>>>> +	ret = of_reserved_mem_device_init(sdev->dev);
>>>> +	if (ret)
>>>> +		return dev_err_probe(&pdev->dev, ret,
>>>> +				     "failed to bind DMA region\n");
>>>> +
>>>> +	priv->ipc_dev = platform_device_register_data(&pdev->dev, "imx-dsp",
>>>> +						      PLATFORM_DEVID_NONE,
>>>> +						      pdev, sizeof(*pdev));
>>>> +	if (IS_ERR(priv->ipc_dev))
>>>> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->ipc_dev),
>>>> +				     "failed to create IPC device\n");
>>>> +
>>>> +	priv->ipc_handle = dev_get_drvdata(&priv->ipc_dev->dev);
>>>> +	if (!priv->ipc_handle) {
>>>> +		ret = -EPROBE_DEFER;
>>>> +		dev_err(&pdev->dev, "failed to fetch ipc handle\n");
>>>> +		goto err_unregister_ipc_dev;
>>>> +	}
>>>> +
>>>> +	priv->ipc_handle->ops = &ipc_ops;
>>>> +	imx_dsp_set_data(priv->ipc_handle, sdev);
>>>> +
>>>> +	/* set core boot reset address */
>>>> +	arm_smccc_smc(IMX_SIP_SRC, IMX_SIP_SRC_M_RESET_ADDR_SET, priv->bootaddr,
>>>> +		      IMX95_CPU_VEC_FLAGS_BOOT, 0, 0, 0, 0, &smc_ret);
>>>> +	if ((int)smc_ret.a0 < 0) {
>>>> +		ret = smc_ret.a0;
>>>> +		dev_err(&pdev->dev, "failed to set boot address: %d", ret);
>>>> +		goto err_unregister_ipc_dev;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err_unregister_ipc_dev:
>>>> +	platform_device_unregister(priv->ipc_dev);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void imx95_remove(struct snd_sof_dev *sdev)
>>>> +{
>>>> +	struct imx95_priv *priv;
>>>> +
>>>> +	priv = sdev->pdata->hw_pdata;
>>>> +
>>>> +	if (imx95_disable_enable_core(false))
>>>> +		dev_err(sdev->dev, "failed to stop core\n");
>>>> +
>>>> +	platform_device_unregister(priv->ipc_dev);
>>>> +}
>>>> +
>>>> +static const struct snd_sof_dsp_ops sof_imx95_ops = {
>>>> +	.probe = imx95_probe,
>>>> +	.remove = imx95_remove,
>>>> +
>>>> +	/* mandatory "DSP" ops */
>>>> +	.run = imx95_run,
>>>> +	.block_read = sof_block_read,
>>>> +	.block_write = sof_block_write,
>>>> +	.send_msg = imx95_send_msg,
>>>> +	.load_firmware = snd_sof_load_firmware_memcpy,
>>>> +	.ipc_msg_data = sof_ipc_msg_data,
>>>> +
>>>> +	.mailbox_read = sof_mailbox_read,
>>>> +	.mailbox_write = sof_mailbox_write,
>>>> +
>>>> +	.get_mailbox_offset = imx95_get_mailbox_offset,
>>>> +	.get_bar_index = imx95_get_bar_index,
>>>> +	.get_window_offset = imx95_get_window_offset,
>>>> +
>>>> +	.pcm_open = sof_stream_pcm_open,
>>>> +	.pcm_close = sof_stream_pcm_close,
>>>> +	.set_stream_data_offset = sof_set_stream_data_offset,
>>>> +
>>>> +	.runtime_suspend = imx95_runtime_suspend,
>>>> +	.runtime_resume = imx95_runtime_resume,
>>>> +
>>>> +	.resume = imx95_resume,
>>>> +	.suspend = imx95_suspend,
>>>> +
>>>> +	.set_power_state = imx95_set_power_state,
>>>> +
>>>> +	.drv = imx95_dai,
>>>> +	.num_drv = ARRAY_SIZE(imx95_dai),
>>>> +
>>>> +	.hw_info = SNDRV_PCM_INFO_MMAP |
>>>> +		   SNDRV_PCM_INFO_MMAP_VALID |
>>>> +		   SNDRV_PCM_INFO_INTERLEAVED |
>>>> +		   SNDRV_PCM_INFO_PAUSE |
>>>> +		   SNDRV_PCM_INFO_BATCH |
>>>> +		   SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
>>>> +};
>>>> +
>>>> +static struct snd_sof_of_mach sof_imx95_machs[] = {
>>>> +	{
>>>> +		.compatible = "fsl,imx95-19x19-evk",
>>>> +		.sof_tplg_filename = "sof-imx95-wm8962.tplg",
>>>> +		.drv_name = "asoc-audio-graph-card2",
>>>> +	},
>>>> +	{
>>>> +	},
>>>> +};
>>>> +
>>>> +static struct sof_dev_desc sof_of_imx95_desc = {
>>>> +	.of_machines = sof_imx95_machs,
>>>> +	.ipc_supported_mask = BIT(SOF_IPC_TYPE_3),
>>>> +	.ipc_default = SOF_IPC_TYPE_3,
>>>> +	.default_fw_path = {
>>>> +		[SOF_IPC_TYPE_3] = "imx/sof",
>>>> +	},
>>>> +	.default_tplg_path = {
>>>> +		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
>>>> +	},
>>>> +	.default_fw_filename = {
>>>> +		[SOF_IPC_TYPE_3] = "sof-imx95.ri",
>>>> +	},
>>>> +	.ops = &sof_imx95_ops,
>>>> +};
>>>> +
>>>> +static const struct of_device_id sof_of_imx95_ids[] = {
>>>> +	{ .compatible = "fsl,imx95-cm7-sof", .data = &sof_of_imx95_desc },
>>>> +	{ },
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, sof_of_imx95_ids);
>>>> +
>>>> +static struct platform_driver snd_sof_of_imx95_driver = {
>>>> +	.probe = sof_of_probe,
>>>> +	.remove = sof_of_remove,
>>>> +	.driver = {
>>>> +		.name = "sof-audio-of-imx95",
>>>> +		.pm = &sof_of_pm,
>>>> +		.of_match_table = sof_of_imx95_ids,
>>>> +	},
>>>> +};
>>>> +module_platform_driver(snd_sof_of_imx95_driver);
>>>> +
>>>> +MODULE_LICENSE("Dual BSD/GPL");
>>>> +MODULE_DESCRIPTION("SOF support for i.MX95 platforms");
>>>> +MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
>>>> --
>>>> 2.34.1
>>>>


