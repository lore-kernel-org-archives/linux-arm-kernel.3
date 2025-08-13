Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12717C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 21:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+4L/tCfnDisKcwTagSWW4ZOeKB0w0o7diP0uW+eLtk=; b=xccjYfu04D8oXS7CobQc78f4jC
	6OBCrSmus0PbK+hws9txgBrT5FFtAS3zchxXy5g2zgExGe23PuHQdp//Vrp1jEn+Rdo+oi2zk+0gp
	rwX90Nt9jFMS0Et006Kp1VQMBRf9p/4Dw5kJelGwDefqNlAxj+OW7q5UWLSMkdtlFi7WnV+ULyd6z
	iV32BBMcM0d2ai7b9uVE/5kyfQFAzsACuIzHINCFCWt2UK9gUIZQ4UHcZkkVXMOLWDagDnwe44n0y
	Ink0Jt4QFJBpWZIHHrYyQCESkZ6GMI5m5b0F6IoAKDh8bszCUK6YUQm8pJv2aFpGAZlxxMCEE5ACi
	VI2hJ/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umIwz-0000000F0r4-2qky;
	Wed, 13 Aug 2025 21:24:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umIuQ-0000000F0Wp-03hh
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 21:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=n+4L/tCfnDisKcwTagSWW4ZOeKB0w0o7diP0uW+eLtk=; b=irEaec2iVS89ZUth/j2lMQ/kvL
	qbd6JGV4f3i/Ac4gx34RKgoRmtpdg/JHSFNWrMXChMt+A5ytFLA/wqt9ihL06Q7NCjzZ1F5wwf3RH
	iaaSleftWbNZ0DHIl4RbUgKRu/qoEl4DBpmojMYEPQeTEWmbeCmGPGqh4MpLgSiMpxcoFcmh+MXg2
	r07ZIGu0DJERUBBA4lb9P7geX3RjvT3eABsVjuDCvp1a9Ituu4juYlNh9KfisZRx3Z31kk/GlIclq
	Irx+2zJmvzDS0msVO8rZRIDrizK7QHxhU/qAS7K6fN+2SzsbMqB10PzghckvZb35Ot4bJ7BhMCcES
	lBPmylUA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umIu9-0000000GCi4-3nKs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:21:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45a15fd04d9so9675935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 14:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755120062; x=1755724862; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+4L/tCfnDisKcwTagSWW4ZOeKB0w0o7diP0uW+eLtk=;
        b=OthtT25M1u7btRO/C3p2lW6hfUd0DExyqSfpfuFKhhUrkqOtEPsjq8yY0kRBUvsHoR
         eg//Zbd8ednB5tn1/sUzm8weV/E7BXXJOcJn9YzFiqvYavLDmnPe66+PBh3sx0ImDYsS
         SXBDBQIkYiiXaPg+00Q6jKN/oK3HyDXE4hH+Rkgxn1DgHOKlohH8das3oZhBRRKADnca
         YcbJU80oN8Bi7YSrlq3kGcdzHZigviWYb08lPkuzYfhu3uYtK2nNE394AJSiZrKkyEN2
         ocp6J2dfx1A0I3AYCzcLCAwk0yPWDaZiIS4jpUQQxbaq2LVQ8wOgDhqQtuc7H8YrNV32
         AiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120062; x=1755724862;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+4L/tCfnDisKcwTagSWW4ZOeKB0w0o7diP0uW+eLtk=;
        b=Jqy44vlmqZ3HQA3yPeTXnqChtd9zT/QiEDTD+ajbn6i4q2c0IE5eIQHQVglTv6Dwje
         5GW3Nn5fF/5RFOBfIxdhjA3weieo0Ji6SmzYUKGZPZGVEmCgZc8j9WVXBxJhXBpNvEV3
         mGNeJgPXh/CHDcqLwdmGg+o+qD6hqqUPY6gcrrzFe37NCWUPUkGhUZ6D+zv4zLZsypeM
         VgabQdxW5EVMAFBv+m8ZcbBa0H/+y1coDNbLmXvPCDfRdC0aA0zOi6UpBcNcgIBRNKIt
         Dg6cYhqrMBk7ZXdzUG3iJo2EaMxrh92Phr4P0t2cuUj97HADeURrM7nVrlWLccaY7rnT
         DQ9w==
X-Gm-Message-State: AOJu0YyQnx9Yj8tczdAtpz1xR1epGwyZ8Sn5V5mQXF/KL3yjH5uIDfcE
	uH26gb6u8n5ZEbLBeE67eSL1+D1gIRC6gUuK0T+Ksuhgz7Il+7frS0GT9nz5/OCzunM=
X-Gm-Gg: ASbGncuxd1VLajjRmDntpdHu28tkCIcBZ5rsHhUK1RKCFcdtVkng1ldZk12giSWUG12
	RuP3aXXyRLGM4DbHsPSuIdN7j4N9C5ytnpYU5tNFDI6LONVzXG68CX9fLBchXKvDx2gBIHrbe7R
	Mj0FMUDp/O54KFUpjfLtEkc5PxWupUAKyR0RPBtUPP7xKTv3g7l4oNontFV2FiTk3qPqO5nuS3j
	Mshleh59BMbT9cG4cUNJm6WUVx3Y5SRu3oxEVWK6JvmyB4dWRwRnPYtu1qSN3YOCUcoOmP6BPoG
	uigaQUOk7Hqa6Z3wbzMsa3Ma/bjUaV8sPXtZzXLLlt/g+JUxRUg3ZbkRl+GEJgpYsrK7JgqEZOk
	f1N9idPNs5uTo6aldG/Av4uORZRnImzaz/ZG679M9z0YhV1wd7Ao7pW2UYRKdJWqg
X-Google-Smtp-Source: AGHT+IFGYhPMnk24xFVtUvs1bX876yJ2eaEVzyvanQgTstTce4THnmsjT/5iydRanKcWbtpnAglYKQ==
X-Received: by 2002:a05:600c:b95:b0:456:1157:59ac with SMTP id 5b1f17b1804b1-45a1b79dc1emr1546285e9.7.1755120062385;
        Wed, 13 Aug 2025 14:21:02 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a51902bsm15405035e9.10.2025.08.13.14.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:21:01 -0700 (PDT)
Message-ID: <c77cb942-74b4-40d6-b965-81d0df9c7cdc@linaro.org>
Date: Wed, 13 Aug 2025 22:21:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] media: qcom: camss: Add support for VFE 690
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wenmeng Liu <quic_wenmliu@quicinc.com>
References: <20250807121105.710072-1-quic_vikramsa@quicinc.com>
 <20250807121105.710072-8-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250807121105.710072-8-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_222115_212881_B24B98EB 
X-CRM114-Status: GOOD (  22.68  )
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

On 07/08/2025 13:11, Vikram Sharma wrote:
> Add support for VFE found on SA8775P (Titan 690). This VFE is
> different from vfe 780 w.r.t few register offsets.
> It supports two full and five lite VFE.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Co-developed-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../platform/qcom/camss/camss-vfe-gen3.c      |  67 +++++--
>   drivers/media/platform/qcom/camss/camss-vfe.c |   5 +-
>   drivers/media/platform/qcom/camss/camss.c     | 174 ++++++++++++++++++
>   3 files changed, 228 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> index 93d16b0951e9..f2001140ead1 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> @@ -12,13 +12,43 @@
>   #include "camss.h"
>   #include "camss-vfe.h"
>   
> -#define BUS_REG_BASE			(vfe_is_lite(vfe) ? 0x200 : 0xC00)
> +#define IS_VFE_690(vfe) \
> +	    (vfe->camss->res->version == CAMSS_8775P)
> +
> +#define BUS_REG_BASE_690 \
> +	    (vfe_is_lite(vfe) ? 0x480 : 0x400)
> +#define BUS_REG_BASE_780 \
> +	    (vfe_is_lite(vfe) ? 0x200 : 0xC00)
> +#define BUS_REG_BASE \
> +	    (IS_VFE_690(vfe) ? BUS_REG_BASE_690 : BUS_REG_BASE_780)
> +
> +#define VFE_TOP_CORE_CFG (0x24)
> +#define VFE_DISABLE_DSCALING_DS4  BIT(21)
> +#define VFE_DISABLE_DSCALING_DS16 BIT(22)
> +
> +#define VFE_BUS_WM_TEST_BUS_CTRL_690 (BUS_REG_BASE + 0xFC)
> +#define VFE_BUS_WM_TEST_BUS_CTRL_780 (BUS_REG_BASE + 0xDC)
> +#define VFE_BUS_WM_TEST_BUS_CTRL \
> +	    (IS_VFE_690(vfe) ? VFE_BUS_WM_TEST_BUS_CTRL_690 \
> +	     : VFE_BUS_WM_TEST_BUS_CTRL_780)
> +/*
> + * Bus client mapping:
> + *
> + * Full VFE:
> + * VFE_690: 16 = RDI0, 17 = RDI1, 18 = RDI2
> + * VFE_780: 23 = RDI0, 24 = RDI1, 25 = RDI2
> + *
> + * VFE LITE:
> + * VFE_690 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4, 5 = RDI5
> + * VFE_780 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4
> + */
> +#define RDI_WM_690(n)	((vfe_is_lite(vfe) ? 0x0 : 0x10) + (n))
> +#define RDI_WM_780(n)	((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
> +#define RDI_WM(n)	(IS_VFE_690(vfe) ? RDI_WM_690(n) : RDI_WM_780(n))
>   
>   #define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + 0x08)
>   #define		WM_CGC_OVERRIDE_ALL		(0x7FFFFFF)
>   
> -#define VFE_BUS_WM_TEST_BUS_CTRL	(BUS_REG_BASE + 0xDC)
> -
>   #define VFE_BUS_WM_CFG(n)		(BUS_REG_BASE + 0x200 + (n) * 0x100)
>   #define		WM_CFG_EN			BIT(0)
>   #define		WM_VIR_FRM_EN			BIT(1)
> @@ -39,17 +69,6 @@
>   #define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x260 + (n) * 0x100)
>   #define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x264 + (n) * 0x100)
>   
> -/*
> - * Bus client mapping:
> - *
> - * Full VFE:
> - * 23 = RDI0, 24 = RDI1, 25 = RDI2
> - *
> - * VFE LITE:
> - * 0 = RDI0, 1 = RDI1, 2 = RDI3, 4 = RDI4
> - */
> -#define RDI_WM(n)			((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
> -
>   static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>   {
>   	struct v4l2_pix_format_mplane *pix =
> @@ -62,14 +81,24 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>   
>   	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
>   
> -	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
> -	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
> +	if (IS_VFE_690(vfe))
> +		writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height,
> +		       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
> +	else
> +		writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
> +		       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
> +
>   	writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
>   	       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
>   	writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
>   	       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
>   	writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
>   
> +	/* TOP CORE CFG */
> +	if (IS_VFE_690(vfe))
> +		writel(VFE_DISABLE_DSCALING_DS4 | VFE_DISABLE_DSCALING_DS16,
> +			vfe->base + VFE_TOP_CORE_CFG);
> +
>   	/* no dropped frames, one irq per frame */
>   	writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
>   	writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
> @@ -92,7 +121,11 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
>   			  struct vfe_line *line)
>   {
>   	wm = RDI_WM(wm);
> -	writel((addr >> 8) & 0xFFFFFFFF, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> +
> +	if (IS_VFE_690(vfe))
> +		writel(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> +	else
> +		writel((addr >> 8), vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
>   
>   	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n",
>   		wm, addr);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 4bca6c3abaff..99cbe09343f2 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -346,6 +346,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_8775P:
>   	case CAMSS_X1E80100:
>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
> @@ -910,7 +911,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
>   
>   	return (!strcmp(clock->name, vfe_name) ||
>   		!strcmp(clock->name, vfe_lite_name) ||
> -		!strcmp(clock->name, "vfe_lite"));
> +		!strcmp(clock->name, "vfe_lite") ||
> +		!strcmp(clock->name, "camnoc_axi"));
>   }
>   
>   /*
> @@ -1974,6 +1976,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_8775P:
>   	case CAMSS_X1E80100:
>   		ret = 16;
>   		break;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 5f1e267045cb..08763d92f659 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2687,6 +2687,180 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources vfe_res_8775p[] = {
> +	/* VFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe0", "vfe0", "vfe0_fast_ahb",
> +			   "cpas_ahb", "gcc_axi_hf",
> +			   "cpas_fast_ahb_clk",
> +			   "camnoc_axi"},
> +		.clock_rate = {
> +			{ 0 },
> +			{ 480000000 },
> +			{ 300000000, 400000000 },
> +			{ 300000000, 400000000 },
> +			{ 0 },
> +			{ 300000000, 400000000 },
> +			{ 400000000 },
> +		},
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = false,
> +			.pd_name = NULL,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe1", "vfe1", "vfe1_fast_ahb",
> +			   "cpas_ahb", "gcc_axi_hf",
> +			   "cpas_fast_ahb_clk",
> +			   "camnoc_axi"},
> +		.clock_rate = {
> +			{ 0 },
> +			{ 480000000 },
> +			{ 300000000, 400000000 },
> +			{ 300000000, 400000000 },
> +			{ 0 },
> +			{ 300000000, 400000000 },
> +			{ 400000000 },
> +		},
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = false,
> +			.pd_name = NULL,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE2 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE3 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE4 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite2" },
> +		.interrupt = { "vfe_lite2" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE5 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite3" },
> +		.interrupt = { "vfe_lite3" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE6 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite4" },
> +		.interrupt = { "vfe_lite4" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +};
> +
>   static const struct resources_icc icc_res_sa8775p[] = {
>   	{
>   		.name = "ahb",
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

