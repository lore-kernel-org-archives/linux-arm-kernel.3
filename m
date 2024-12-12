Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2E5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 11:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaN0kKcSk37U6rmBe26lnuj1wEmPvM80JRtxgz+AmiY=; b=F1zuJCRRK/0/96FlPqBqaFEaoX
	kjk6hJRfhbvRBzlTOh0BV3I82y+NS2O3ghP+JA+eBGHkOcFFU6xmcSJyQ8pFcw/2SdZyFDlBL+avl
	TWzHwYQeEiDxUePBvqB6uMihr7/msq6tegk8I3dTv7fCvHMGNxcezvjJUyrElcg4x8ObCLWXvOZ/X
	w/KgLGIVMs1Yhe8cMy4DVzbhFU4UiBW40fLz6RPDV7XXuDY7UJd3EKykMJ1SUewsMPmuf9Txu5gDU
	GS0kEwVVJy81bjZWaKyAseJKRzeljSa5dZoFRofqgxssor7KILSK12IPTfdXOkTGY3klUSEOBwDq3
	leOwrVLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLh7Z-000000009a6-2CjR;
	Thu, 12 Dec 2024 11:12:41 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLh6U-000000009TB-3to3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 11:11:36 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d2726c0d45so821639a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 03:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734001893; x=1734606693; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IaN0kKcSk37U6rmBe26lnuj1wEmPvM80JRtxgz+AmiY=;
        b=WHeBUjiXpimQc7tVRFwP37U/ItqNqI591oFvR7JXGPmNJlRkdCEpeNDEwPbi3DfWD+
         cTFMyAwRa+6PUuZQVFT7pbjDH1csiKVLVA8WlV2nAHtfwyj9rFUke4rUpCEJr4+Ycxps
         NQSDSMCQQKgN+zSPw5pA5vKS9IU9rE4FKFBRjDxNxAZv26t2ABC/iIgvP4+u9jMUgdp5
         5PwZ5RxD3FOyZlly+lSHDuAyrCVh8ppTF9ceaTd4ip2Y2ZPyE48sOMC9myWkyQcAVu03
         0q5RnOSlZv3f8dWy8y980o6kfRSG6zBA+Eo/Cmv6FSS50ACenqwwcc9CQ6LrWwBGbNCu
         FCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734001893; x=1734606693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IaN0kKcSk37U6rmBe26lnuj1wEmPvM80JRtxgz+AmiY=;
        b=TDUb2TJZIaJ2X81lC1H5XqDCKTPb+zpqoCMs7nUJIkSs4WxM3kA3ZIXCazyf2EHtHP
         wNCeGFDBROCGp2INTmN7lSisNIHi+7sr6e6uZMf20bz6PzGIIXecdLm9BlIClrt9nPuU
         no6yRUHneNXgNLJwXnVA6DZmnx60G7kR+6292O4ZTeBtIYtryFrtL/dIZlZ9D1Ud8TWx
         V/OmLuFcTajP0yByu8L3Ty7cw2Tc4z3NDOVRIte/Ucdu5IpNpFAJbIuaP+osxha1yD/Q
         lq6d/c5nXujG8CDERgE5ORbVao9RGnZBSUbuIS7v2yM8jQMuC11AvEsJDAoglng7rDx6
         7A6w==
X-Forwarded-Encrypted: i=1; AJvYcCWZOMBf2sGBVtR52jkhDs0fesvh5oaE8Tp436PZRHNkVoojGFZTDhd7E7UoFH3YLyvfWhyT7CzMLVYgHrmXtbj/@lists.infradead.org
X-Gm-Message-State: AOJu0YysaUSczGIk/FSVIVOV1D+yQpfl8m+8n2ptNRKtt0z2ra6uCOmD
	3hA8eg2w9hW3mN+MArzl4Rp0OJzi9htWUvRKiGBxpSIWMuJnlqDO
X-Gm-Gg: ASbGncsPXTC0+dquWzNT9huaSf5m9tMaTGhGqSBZQ6WEiq/MP38gp7qcT24boomL3bg
	FbcRmHDR2UASnyJN4N8tXe97sxrHyw1DxFduvatNdZxbh0RDd26VL3jcCfhHGpTWU31tPl49TXI
	CzwyuBD23JGQmJZM8gJkNL5slfBC3ZUz4+Qpi8cIWMjP72jRdRKkj/uOHNqybdbLa7T973c2gv5
	hOwF6l1p9YvkOqdpuVont1vEIGmrNyjxCoGpdc2lVIteGNHD5rYF6EENkbqs068hAhEddMlhGGw
	Ky29Rw==
X-Google-Smtp-Source: AGHT+IHIpwOjVa7ssUoWSqoTOzLvWRVfCq9dW++SsNASJJapQEQs92vXNORpWuFsu3Hjg5UVc5CeZA==
X-Received: by 2002:a05:6402:3508:b0:5ce:d028:e11 with SMTP id 4fb4d7f45d1cf-5d4edcdeb88mr659138a12.17.1734001892507;
        Thu, 12 Dec 2024 03:11:32 -0800 (PST)
Received: from [192.168.7.105] ([92.120.5.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b60789asm10116126a12.37.2024.12.12.03.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 03:11:31 -0800 (PST)
Message-ID: <c47710a5-7e53-48b1-bd6b-c0123865aee5@gmail.com>
Date: Thu, 12 Dec 2024 13:11:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] ASoC: SOF: imx: add driver for imx95
Content-Language: en-US
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
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ZzUJQCeWclsrr/lr@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_031134_980655_DBB25ACE 
X-CRM114-Status: GOOD (  24.94  )
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



On 11/13/2024 10:17 PM, Frank Li wrote:
> On Wed, Nov 13, 2024 at 02:52:39PM -0500, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add SOF driver for imx95.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  sound/soc/sof/imx/Kconfig  |   8 +
>>  sound/soc/sof/imx/Makefile |   2 +
>>  sound/soc/sof/imx/imx95.c  | 401 +++++++++++++++++++++++++++++++++++++
> why not reused exist one? look likes simular.
>
> Frank
the SOF drivers do indeed have some similarities, but each of them has their own quirks which IMO makes it a bit harder to add the 95 support. We need to figure out the common parts and then move them to imx-common, but I believe this can be solved incrementally.
>
>>  3 files changed, 411 insertions(+)
>>  create mode 100644 sound/soc/sof/imx/imx95.c
>>
>> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
>> index 4751b04d5e6f..51a70a193533 100644
>> --- a/sound/soc/sof/imx/Kconfig
>> +++ b/sound/soc/sof/imx/Kconfig
>> @@ -50,4 +50,12 @@ config SND_SOC_SOF_IMX8ULP
>>  	  Say Y if you have such a device.
>>  	  If unsure select "N".
>>
>> +config SND_SOC_SOF_IMX95
>> +	tristate "SOF support for i.MX95"
>> +	depends on IMX_DSP
>> +	help
>> +	  This adds support for Sound Open Firmware for NXP i.MX95 platforms.
>> +	  Say Y if you have such a device.
>> +	  If unsure select "N".
>> +
>>  endif ## SND_SOC_SOF_IMX_TOPLEVEL
>> diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
>> index be0bf0736dfa..715ac3798668 100644
>> --- a/sound/soc/sof/imx/Makefile
>> +++ b/sound/soc/sof/imx/Makefile
>> @@ -2,10 +2,12 @@
>>  snd-sof-imx8-y := imx8.o
>>  snd-sof-imx8m-y := imx8m.o
>>  snd-sof-imx8ulp-y := imx8ulp.o
>> +snd-sof-imx95-y := imx95.o
>>
>>  snd-sof-imx-common-y := imx-common.o
>>
>>  obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
>>  obj-$(CONFIG_SND_SOC_SOF_IMX8M) += snd-sof-imx8m.o
>>  obj-$(CONFIG_SND_SOC_SOF_IMX8ULP) += snd-sof-imx8ulp.o
>> +obj-$(CONFIG_SND_SOC_SOF_IMX95) += snd-sof-imx95.o
>>  obj-$(CONFIG_SND_SOC_SOF_IMX_COMMON) += imx-common.o
>> diff --git a/sound/soc/sof/imx/imx95.c b/sound/soc/sof/imx/imx95.c
>> new file mode 100644
>> index 000000000000..5a0e44f5bd48
>> --- /dev/null
>> +++ b/sound/soc/sof/imx/imx95.c
>> @@ -0,0 +1,401 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#include <linux/arm-smccc.h>
>> +#include <linux/clk.h>
>> +#include <linux/firmware/imx/dsp.h>
>> +#include <linux/module.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/of_reserved_mem.h>
>> +#include <sound/sof.h>
>> +
>> +#include "../sof-of-dev.h"
>> +#include "../ops.h"
>> +
>> +#define IMX_SIP_SRC 0xC2000005
>> +#define IMX_SIP_SRC_M_RESET_ADDR_SET 0x03
>> +
>> +#define IMX95_CPU_VEC_FLAGS_BOOT BIT(29)
>> +
>> +#define IMX_SIP_LMM 0xC200000F
>> +#define IMX_SIP_LMM_BOOT 0x0
>> +#define IMX_SIP_LMM_SHUTDOWN 0x1
>> +
>> +#define IMX95_M7_LM_ID 0x1
>> +
>> +#define MBOX_DSPBOX_OFFSET 0x1000
>> +#define MBOX_WINDOW_OFFSET 0x6000000
>> +
>> +struct imx95_priv {
>> +	struct platform_device *ipc_dev;
>> +	struct imx_dsp_ipc *ipc_handle;
>> +	resource_size_t bootaddr;
>> +};
>> +
>> +static void imx95_ipc_handle_reply(struct imx_dsp_ipc *ipc)
>> +{
>> +	unsigned long flags;
>> +	struct snd_sof_dev *sdev = imx_dsp_get_data(ipc);
>> +
>> +	spin_lock_irqsave(&sdev->ipc_lock, flags);
>> +	snd_sof_ipc_process_reply(sdev, 0);
>> +	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
>> +}
>> +
>> +static void imx95_ipc_handle_request(struct imx_dsp_ipc *ipc)
>> +{
>> +	snd_sof_ipc_msgs_rx(imx_dsp_get_data(ipc));
>> +}
>> +
>> +static struct imx_dsp_ops ipc_ops = {
>> +	.handle_reply = imx95_ipc_handle_reply,
>> +	.handle_request = imx95_ipc_handle_request,
>> +};
>> +
>> +static int imx95_disable_enable_core(bool enable)
>> +{
>> +	struct arm_smccc_res res;
>> +
>> +	if (enable)
>> +		arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_BOOT, IMX95_M7_LM_ID,
>> +			      0, 0, 0, 0, 0, &res);
>> +	else
>> +		arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_SHUTDOWN, IMX95_M7_LM_ID,
>> +			      0, 0, 0, 0, 0, &res);
>> +
>> +	return res.a0;
>> +}
>> +
>> +static int imx95_run(struct snd_sof_dev *sdev)
>> +{
>> +	return imx95_disable_enable_core(true);
>> +}
>> +
>> +static int imx95_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
>> +{
>> +	struct imx95_priv *priv = sdev->pdata->hw_pdata;
>> +
>> +	sof_mailbox_write(sdev, sdev->host_box.offset,
>> +			  msg->msg_data, msg->msg_size);
>> +
>> +	imx_dsp_ring_doorbell(priv->ipc_handle, 0);
>> +
>> +	return 0;
>> +}
>> +
>> +static int imx95_get_mailbox_offset(struct snd_sof_dev *sdev)
>> +{
>> +	return MBOX_DSPBOX_OFFSET + MBOX_WINDOW_OFFSET;
>> +}
>> +
>> +static int imx95_get_bar_index(struct snd_sof_dev *sdev, u32 type)
>> +{
>> +	switch (type) {
>> +	case SOF_FW_BLK_TYPE_SRAM:
>> +		return type;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>> +static int imx95_get_window_offset(struct snd_sof_dev *sdev, u32 id)
>> +{
>> +	return MBOX_WINDOW_OFFSET;
>> +}
>> +
>> +static int imx95_set_power_state(struct snd_sof_dev *sdev,
>> +				 const struct sof_dsp_power_state *target_state)
>> +{
>> +	sdev->dsp_power_state = *target_state;
>> +
>> +	return 0;
>> +}
>> +
>> +static int imx95_suspend_resume(struct snd_sof_dev *sdev, bool suspend)
>> +{
>> +	struct imx95_priv *priv;
>> +	int ret, i;
>> +
>> +	priv = sdev->pdata->hw_pdata;
>> +
>> +	if (suspend) {
>> +		ret = imx95_disable_enable_core(false);
>> +		if (ret) {
>> +			dev_err(sdev->dev, "failed to stop core\n");
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	for (i = 0; i < DSP_MU_CHAN_NUM; i++) {
>> +		if (suspend)
>> +			imx_dsp_free_channel(priv->ipc_handle, i);
>> +		else
>> +			imx_dsp_request_channel(priv->ipc_handle, i);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int imx95_runtime_resume(struct snd_sof_dev *sdev)
>> +{
>> +	int ret;
>> +	const struct sof_dsp_power_state target_state = {
>> +		.state = SOF_DSP_PM_D0,
>> +	};
>> +
>> +	ret = imx95_suspend_resume(sdev, false);
>> +	if (ret < 0) {
>> +		dev_err(sdev->dev, "failed to runtime resume: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return snd_sof_dsp_set_power_state(sdev, &target_state);
>> +}
>> +
>> +static int imx95_resume(struct snd_sof_dev *sdev)
>> +{
>> +	int ret;
>> +	const struct sof_dsp_power_state target_state = {
>> +		.state = SOF_DSP_PM_D0,
>> +	};
>> +
>> +	ret = imx95_suspend_resume(sdev, false);
>> +	if (ret < 0) {
>> +		dev_err(sdev->dev, "failed to resume: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (pm_runtime_suspended(sdev->dev)) {
>> +		pm_runtime_disable(sdev->dev);
>> +		pm_runtime_set_active(sdev->dev);
>> +		pm_runtime_mark_last_busy(sdev->dev);
>> +		pm_runtime_enable(sdev->dev);
>> +		pm_runtime_idle(sdev->dev);
>> +	}
>> +
>> +	return snd_sof_dsp_set_power_state(sdev, &target_state);
>> +}
>> +
>> +static int imx95_runtime_suspend(struct snd_sof_dev *sdev)
>> +{
>> +	int ret;
>> +	const struct sof_dsp_power_state target_state = {
>> +		.state = SOF_DSP_PM_D3,
>> +	};
>> +
>> +	ret = imx95_suspend_resume(sdev, true);
>> +	if (ret < 0) {
>> +		dev_err(sdev->dev, "failed to runtime suspend: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return snd_sof_dsp_set_power_state(sdev, &target_state);
>> +}
>> +
>> +static int imx95_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
>> +{
>> +	int ret;
>> +	const struct sof_dsp_power_state target_power_state = {
>> +		.state = target_state,
>> +	};
>> +
>> +	if (!pm_runtime_suspended(sdev->dev)) {
>> +		ret = imx95_suspend_resume(sdev, true);
>> +		if (ret < 0) {
>> +			dev_err(sdev->dev, "failed to suspend: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return snd_sof_dsp_set_power_state(sdev, &target_power_state);
>> +}
>> +
>> +static struct snd_soc_dai_driver imx95_dai[] = {
>> +	{
>> +		.name = "sai3",
>> +		.playback = {
>> +			.channels_min = 1,
>> +			.channels_max = 32,
>> +		},
>> +		.capture = {
>> +			.channels_min = 1,
>> +			.channels_max = 32,
>> +		},
>> +	},
>> +};
>> +
>> +static int imx95_probe(struct snd_sof_dev *sdev)
>> +{
>> +	struct platform_device *pdev;
>> +	struct imx95_priv *priv;
>> +	struct resource *res;
>> +	struct arm_smccc_res smc_ret;
>> +	int ret;
>> +
>> +	pdev = container_of(sdev->dev, struct platform_device, dev);
>> +
>> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return dev_err_probe(&pdev->dev, -ENOMEM, "failed to alloc priv\n");
>> +
>> +	sdev->pdata->hw_pdata = priv;
>> +
>> +	/* map SRAM */
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return dev_err_probe(&pdev->dev, -ENODEV,
>> +				     "failed to fetch SRAM region\n");
>> +
>> +	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap(&pdev->dev, res->start,
>> +						       resource_size(res));
>> +	if (IS_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM]))
>> +		return dev_err_probe(&pdev->dev,
>> +				     PTR_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM]),
>> +				     "failed to map SRAM region\n");
>> +
>> +	sdev->mmio_bar = SOF_FW_BLK_TYPE_SRAM;
>> +	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
>> +	sdev->dsp_box.offset = MBOX_DSPBOX_OFFSET + MBOX_WINDOW_OFFSET;
>> +	priv->bootaddr = res->start;
>> +
>> +	ret = of_reserved_mem_device_init(sdev->dev);
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret,
>> +				     "failed to bind DMA region\n");
>> +
>> +	priv->ipc_dev = platform_device_register_data(&pdev->dev, "imx-dsp",
>> +						      PLATFORM_DEVID_NONE,
>> +						      pdev, sizeof(*pdev));
>> +	if (IS_ERR(priv->ipc_dev))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->ipc_dev),
>> +				     "failed to create IPC device\n");
>> +
>> +	priv->ipc_handle = dev_get_drvdata(&priv->ipc_dev->dev);
>> +	if (!priv->ipc_handle) {
>> +		ret = -EPROBE_DEFER;
>> +		dev_err(&pdev->dev, "failed to fetch ipc handle\n");
>> +		goto err_unregister_ipc_dev;
>> +	}
>> +
>> +	priv->ipc_handle->ops = &ipc_ops;
>> +	imx_dsp_set_data(priv->ipc_handle, sdev);
>> +
>> +	/* set core boot reset address */
>> +	arm_smccc_smc(IMX_SIP_SRC, IMX_SIP_SRC_M_RESET_ADDR_SET, priv->bootaddr,
>> +		      IMX95_CPU_VEC_FLAGS_BOOT, 0, 0, 0, 0, &smc_ret);
>> +	if ((int)smc_ret.a0 < 0) {
>> +		ret = smc_ret.a0;
>> +		dev_err(&pdev->dev, "failed to set boot address: %d", ret);
>> +		goto err_unregister_ipc_dev;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_unregister_ipc_dev:
>> +	platform_device_unregister(priv->ipc_dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static void imx95_remove(struct snd_sof_dev *sdev)
>> +{
>> +	struct imx95_priv *priv;
>> +
>> +	priv = sdev->pdata->hw_pdata;
>> +
>> +	if (imx95_disable_enable_core(false))
>> +		dev_err(sdev->dev, "failed to stop core\n");
>> +
>> +	platform_device_unregister(priv->ipc_dev);
>> +}
>> +
>> +static const struct snd_sof_dsp_ops sof_imx95_ops = {
>> +	.probe = imx95_probe,
>> +	.remove = imx95_remove,
>> +
>> +	/* mandatory "DSP" ops */
>> +	.run = imx95_run,
>> +	.block_read = sof_block_read,
>> +	.block_write = sof_block_write,
>> +	.send_msg = imx95_send_msg,
>> +	.load_firmware = snd_sof_load_firmware_memcpy,
>> +	.ipc_msg_data = sof_ipc_msg_data,
>> +
>> +	.mailbox_read = sof_mailbox_read,
>> +	.mailbox_write = sof_mailbox_write,
>> +
>> +	.get_mailbox_offset = imx95_get_mailbox_offset,
>> +	.get_bar_index = imx95_get_bar_index,
>> +	.get_window_offset = imx95_get_window_offset,
>> +
>> +	.pcm_open = sof_stream_pcm_open,
>> +	.pcm_close = sof_stream_pcm_close,
>> +	.set_stream_data_offset = sof_set_stream_data_offset,
>> +
>> +	.runtime_suspend = imx95_runtime_suspend,
>> +	.runtime_resume = imx95_runtime_resume,
>> +
>> +	.resume = imx95_resume,
>> +	.suspend = imx95_suspend,
>> +
>> +	.set_power_state = imx95_set_power_state,
>> +
>> +	.drv = imx95_dai,
>> +	.num_drv = ARRAY_SIZE(imx95_dai),
>> +
>> +	.hw_info = SNDRV_PCM_INFO_MMAP |
>> +		   SNDRV_PCM_INFO_MMAP_VALID |
>> +		   SNDRV_PCM_INFO_INTERLEAVED |
>> +		   SNDRV_PCM_INFO_PAUSE |
>> +		   SNDRV_PCM_INFO_BATCH |
>> +		   SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
>> +};
>> +
>> +static struct snd_sof_of_mach sof_imx95_machs[] = {
>> +	{
>> +		.compatible = "fsl,imx95-19x19-evk",
>> +		.sof_tplg_filename = "sof-imx95-wm8962.tplg",
>> +		.drv_name = "asoc-audio-graph-card2",
>> +	},
>> +	{
>> +	},
>> +};
>> +
>> +static struct sof_dev_desc sof_of_imx95_desc = {
>> +	.of_machines = sof_imx95_machs,
>> +	.ipc_supported_mask = BIT(SOF_IPC_TYPE_3),
>> +	.ipc_default = SOF_IPC_TYPE_3,
>> +	.default_fw_path = {
>> +		[SOF_IPC_TYPE_3] = "imx/sof",
>> +	},
>> +	.default_tplg_path = {
>> +		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
>> +	},
>> +	.default_fw_filename = {
>> +		[SOF_IPC_TYPE_3] = "sof-imx95.ri",
>> +	},
>> +	.ops = &sof_imx95_ops,
>> +};
>> +
>> +static const struct of_device_id sof_of_imx95_ids[] = {
>> +	{ .compatible = "fsl,imx95-cm7-sof", .data = &sof_of_imx95_desc },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, sof_of_imx95_ids);
>> +
>> +static struct platform_driver snd_sof_of_imx95_driver = {
>> +	.probe = sof_of_probe,
>> +	.remove = sof_of_remove,
>> +	.driver = {
>> +		.name = "sof-audio-of-imx95",
>> +		.pm = &sof_of_pm,
>> +		.of_match_table = sof_of_imx95_ids,
>> +	},
>> +};
>> +module_platform_driver(snd_sof_of_imx95_driver);
>> +
>> +MODULE_LICENSE("Dual BSD/GPL");
>> +MODULE_DESCRIPTION("SOF support for i.MX95 platforms");
>> +MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
>> --
>> 2.34.1
>>


