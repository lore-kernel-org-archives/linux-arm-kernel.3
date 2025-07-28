Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04230C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 13:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9af25jiuQ+ume924hKd7aFYy7n3IXrPlhC5QmLXxXw=; b=TMtt8N70MHChIE9XBmA8HZHjMQ
	5CIISMUSKYQzbP8rZkHQj9tk5TLAQPBfY0CIZIaJeX607xUIuPfhD4wkdU+bUhM1zZ2HfmO5/1SFL
	O2U+19jOyUjm9/NR//n6dw7qf5eo4XzKpNLuRR8KqFPwA8uR1ewrWsH8OVsIb/2uGKXc0ARnjnOX2
	DU5ReCrb9WdyZ1/J5lqsJCgYWbTb5DDsvuwiDFzVgiFSS6KOzprTyWECrpUCzQhdLu/mRJPwMzApv
	k1lyZTfHWdtrH0Nu3rlfss6CKraTBWTSHI4Qcb73JGvF51+WQcoAq7IgFwj6dAWt8cx0EUnzIMu6k
	eArIcT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOEm-0000000EZ7O-025b;
	Mon, 28 Jul 2025 13:49:56 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOAH-0000000EYQa-28mX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 13:45:18 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso7850642a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 06:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753710316; x=1754315116; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9af25jiuQ+ume924hKd7aFYy7n3IXrPlhC5QmLXxXw=;
        b=Ea7ayfkedlhAckVis4Ieh5WVnE+kwO9PZgdsOIpy7D8fRBw0nfZZpxV2eZVh7NahS+
         nbn2IoZ6+3KcOCTXZ68ZacpkuDu+cYIJ34eJ6bPKkYG0vHcG/3h7i4SgOQCy4A/QdGHI
         KxeX/yFUzO0iq5kjrc4GppwVvBD+xGKtDW6zvSaayBe7Adzqi8y7T2tdYAQ45QMcGlfP
         MWmWoKbsCz9ZWGp2IDBSjqnRmjKfCtgMFFgACJn2YgP6l4u+PD0u/GLLxhI7t3xGqP8n
         4ZUaCvWTl5PPDpr0INingUCuS25qCAnkl6eHpRXrQWhAzGB3YUIg5S9qvbTNbIF0hUMy
         vKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710316; x=1754315116;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9af25jiuQ+ume924hKd7aFYy7n3IXrPlhC5QmLXxXw=;
        b=qeVd6owcpRSr1r9C2ba75ZDxRmUDpTC+nigUSLpS0vz0dfaggNA8qIanJHfOHt6fQ/
         buT2Bj5lq/KYFtfAhB4vgUC16hR3SPVIeQ63n0SSgvCw7SOoJqiA/geeYCz9V3RBgGP3
         fhLYG3leW+E25mJ6I4CymAxeJxQTUAl3+qYZ8Cv9cWfylra0uE+cRWUYiK1AR9lHHzLS
         7/FleWDdpKDFFSdf7QJTRizgNhS1OAVK9D/1DZ4gsY2fRrRYaeYvAOvaU7mjyb0hKWZl
         7IPQhTi8hPshnDkWJbM9N+CXbQRMuCTccZF4adLEZeoCQ9FNIeYLrHpM82ErsAHwkIK3
         vTyg==
X-Gm-Message-State: AOJu0Yw26AeJzVRLRFHrC3PAf27BVxXcThy9f3xPKLY61FX0SM/OlPan
	5f9uyaI1hlkx7T+6lr9JHuM4+bdd2IjTsrzcuwHGxwRFWPVIBH4No97ELFJLR5kHSDEbKND/kku
	OwmzysF8=
X-Gm-Gg: ASbGncuNaWQ1+4lmXkDLfGm/9A10fYplKf3pOnEPtJmZ9BC57CpVpM0xG7m4oOMy2i1
	vJnXZfk3/DJ5WeZ8zCqxNOGGh6HbgnS5k2skMxNY8HxyDI3clFGxlFp6INXDZkgnmb5WI+vwFr6
	OX3o5Kytdvt+QgVu+hO6eIoUg2529cokqJIK4Ys8fOfgxhJr752OiRM399n+eVm8P9/Bjfpo/na
	NwzrERPRYx+CuBnXq1nWaAV7uwyyipBoy+x2NiS7XEeAIawHP02QMHD4CLv6w4wYUgLWUbn0A8P
	agVV2DhVSJlSxA58HFfHPDTKQw1k1vJWp7DRLEMgSq8LIFm0Mq8CT/AW+EwJ2SU7Sku3OPZP2dD
	1rm7p/0M4uTyhKh7FLc++gYjjEqwzOBoUcgXCiiLHoWqz4Zx5RSt6vNJD5cO/0In+yk4vN5pfTg
	==
X-Google-Smtp-Source: AGHT+IGd4Pa4ABn1UyusTYa3khDC/gbx26sr8pR3MExOOmpWYpRCLXp+2l8s5LKNuAnc9BeHFM/egQ==
X-Received: by 2002:a17:907:7f93:b0:aed:745:a139 with SMTP id a640c23a62f3a-af618f0233cmr1323576166b.33.1753710315686;
        Mon, 28 Jul 2025 06:45:15 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635aa4cc9sm426634466b.107.2025.07.28.06.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 06:45:15 -0700 (PDT)
Message-ID: <63a0e35d-8e26-410c-ac44-225c8d8b37a9@linaro.org>
Date: Mon, 28 Jul 2025 14:45:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] media: qcom: camss: Rename camss-vfe-780.c to
 camss-vfe-gen3.c
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-3-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_064517_561385_FB5A0978 
X-CRM114-Status: GOOD (  18.08  )
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

On 03/07/2025 18:19, Vikram Sharma wrote:
> Rename the file camss-vfe-780.c to camss-vfe-gen3.c to enable
> reuse of VFE logic across multiple SoCs.
> 
> The SA8775P SoC includes VFE 690, which is very similar to
> VFE 780, with only minor differences in register bitfields.
> Rename prepares the codebase for supporting additional SoCs
> without duplicating VFE logic.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile             |  2 +-
>   .../qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c}   |  8 ++++----
>   drivers/media/platform/qcom/camss/camss-vfe.h          |  2 +-
>   drivers/media/platform/qcom/camss/camss.c              | 10 +++++-----
>   4 files changed, 11 insertions(+), 11 deletions(-)
>   rename drivers/media/platform/qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c} (96%)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index ee869e69521a..76845a456c45 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -19,7 +19,7 @@ qcom-camss-objs += \
>   		camss-vfe-17x.o \
>   		camss-vfe-480.o \
>   		camss-vfe-680.o \
> -		camss-vfe-780.o \
> +		camss-vfe-gen3.o \
>   		camss-vfe-gen1.o \
>   		camss-vfe.o \
>   		camss-video.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> similarity index 96%
> rename from drivers/media/platform/qcom/camss/camss-vfe-780.c
> rename to drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> index b9812d70f91b..93d16b0951e9 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v780 (SM8550)
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module gen3
>    *
>    * Copyright (c) 2024 Qualcomm Technologies, Inc.
>    */
> @@ -113,14 +113,14 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
>   	camss_reg_update(vfe->camss, vfe->id, port_id, true);
>   }
>   
> -static const struct camss_video_ops vfe_video_ops_780 = {
> +static const struct camss_video_ops vfe_video_ops_gen3 = {
>   	.queue_buffer = vfe_queue_buffer_v2,
>   	.flush_buffers = vfe_flush_buffers,
>   };
>   
>   static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
>   {
> -	vfe->video_ops = vfe_video_ops_780;
> +	vfe->video_ops = vfe_video_ops_gen3;
>   }
>   
>   static void vfe_global_reset(struct vfe_device *vfe)
> @@ -140,7 +140,7 @@ static int vfe_halt(struct vfe_device *vfe)
>   	return 0;
>   }
>   
> -const struct vfe_hw_ops vfe_ops_780 = {
> +const struct vfe_hw_ops vfe_ops_gen3 = {
>   	.global_reset = vfe_global_reset,
>   	.hw_version = vfe_hw_version,
>   	.isr = vfe_isr,
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index a23f666be753..02d9162ffd93 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -244,7 +244,7 @@ extern const struct vfe_hw_ops vfe_ops_4_8;
>   extern const struct vfe_hw_ops vfe_ops_170;
>   extern const struct vfe_hw_ops vfe_ops_480;
>   extern const struct vfe_hw_ops vfe_ops_680;
> -extern const struct vfe_hw_ops vfe_ops_780;
> +extern const struct vfe_hw_ops vfe_ops_gen3;
>   
>   int vfe_get(struct vfe_device *vfe);
>   void vfe_put(struct vfe_device *vfe);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 1431e08dc04a..310b5cd8de5f 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2371,7 +2371,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
>   			.is_lite = false,
>   			.has_pd = true,
>   			.pd_name = "ife0",
> -			.hw_ops = &vfe_ops_780,
> +			.hw_ops = &vfe_ops_gen3,
>   			.formats_rdi = &vfe_formats_rdi_845,
>   			.formats_pix = &vfe_formats_pix_845
>   		}
> @@ -2395,7 +2395,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
>   			.is_lite = false,
>   			.has_pd = true,
>   			.pd_name = "ife1",
> -			.hw_ops = &vfe_ops_780,
> +			.hw_ops = &vfe_ops_gen3,
>   			.formats_rdi = &vfe_formats_rdi_845,
>   			.formats_pix = &vfe_formats_pix_845
>   		}
> @@ -2419,7 +2419,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
>   			.is_lite = false,
>   			.has_pd = true,
>   			.pd_name = "ife2",
> -			.hw_ops = &vfe_ops_780,
> +			.hw_ops = &vfe_ops_gen3,
>   			.formats_rdi = &vfe_formats_rdi_845,
>   			.formats_pix = &vfe_formats_pix_845
>   		}
> @@ -2441,7 +2441,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
>   		.vfe = {
>   			.line_num = 4,
>   			.is_lite = true,
> -			.hw_ops = &vfe_ops_780,
> +			.hw_ops = &vfe_ops_gen3,
>   			.formats_rdi = &vfe_formats_rdi_845,
>   			.formats_pix = &vfe_formats_pix_845
>   		}
> @@ -2463,7 +2463,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
>   		.vfe = {
>   			.line_num = 4,
>   			.is_lite = true,
> -			.hw_ops = &vfe_ops_780,
> +			.hw_ops = &vfe_ops_gen3,
>   			.formats_rdi = &vfe_formats_rdi_845,
>   			.formats_pix = &vfe_formats_pix_845
>   		}
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

