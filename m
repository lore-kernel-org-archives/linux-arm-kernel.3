Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A6FD7876A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 10:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GO7fVK+g5VXFiw6jUirAsxcaeR1tJ6lVtHXzxXnqFYQ=; b=voegJAPYlv96sXONHLbhCDHqq8
	SrnLUYgLZcS6CVhtWNSgisEFL+HO0dc8LvhF6P87UA2x6Ny7EybN7epgUugM9Ipts5sLyu70prIbY
	2WBgfd1hIfOs65NL7Ffbnl5eclH5F3y3Hc6Ry06sQx49mbk70SvWu/yGhofzeuz0plQSUGDw7GSE2
	jen/qYcRVkbleZ902TbncrwxymVqAyN2OwpAXExkzvhtCJ9QNESSkrtsMPQvSaXq815AP8n9OuGm1
	d3tMlKrg96j/MmKGXWxuQUvXiZY9cxLrWHRX1gdSTgpOc/W3asiucMYZzhJK+fs/FELVjPqYMjnxR
	irPPtvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQm0-00000002EbJ-1Z1Q;
	Fri, 22 Nov 2024 10:20:24 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQZK-00000002COl-2RhK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 10:07:19 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53dd1829b56so1540888e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 02:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732270037; x=1732874837; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GO7fVK+g5VXFiw6jUirAsxcaeR1tJ6lVtHXzxXnqFYQ=;
        b=w0dmOGUzEK0Ikd4w6u1x0/L6z16n4s0Aoz4B87kNhQ0y1k2lyUvl10TSquTv/y3jjH
         G34Xe9amAlItZ0D+OqE2B3klI9UBPYrc2OxzM61Pgjv+ozcm2/a+1oanXdv7XSQ4borY
         jGP95zxCVkWVLravd1dAIZWeTGf5RfirR1T2lrEKaezLr8OFGFWx84A4lTytk6NPyvXW
         QVPJP6hdyRtMRT4vmOYmo57fZDOQZ0lH0eFkCEyt2ExG2BhCdzcVtGfNbgaf2V1yCmxO
         OyA8O/IfN8oGE+MnnMGj/21JQ9NUsmPGlX5qAY+DYWZQ8/58FceWCDh1lfU6LtnY5MXP
         GEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270037; x=1732874837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GO7fVK+g5VXFiw6jUirAsxcaeR1tJ6lVtHXzxXnqFYQ=;
        b=wnWro5Y7tmE2av8wNvogeijUmTnhy5GOB7R4hsmZEYhzOqxDfjAVajoqy7vslHiqZS
         +RWYoxOSY7lE3CGCTedUyozTbctbDrtecHpf66+Oui5RhJIrSrxbHm5MvSYZlKzpPheo
         wa5uN2ze1mnyyFgwGVvtojtdoUB3HaLrAevQpl94rZjgAud/VpmbsU7vFLif0GJhLlK2
         J+FMeMdKTaXms1N0VH5YJYDVSQlOg70O9WERyQ/bcnLlvpur/oCuvmZhbhjGLAtZqZ9r
         6waJYqEqPy9kqkdAcDAE2OHGKchFRDzhk/EgpAm+CI9D5Ht9qULRPO2KrnpUhqUAuvNo
         vtIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnKK6WZckpJLo0Vl151RZ7V4rFp6K3r/b2nF0lq1fmwGQDVcjNmpV6W3yscJ5gYrVj4elgxLaju2Eu+ud7UdVi@lists.infradead.org
X-Gm-Message-State: AOJu0YyszoACj+pp6MgdkdY2Iiq3XvUCnp+FWRe4UCLMedcN7v5hNS2U
	WxCt0nseCneBcDBEQ3bNisfo1l3d63HwPM/WEe+bpIxw2C2MVOFETbiewWx8jCA=
X-Gm-Gg: ASbGnctj2Cyo2sFDU9Swj4HDh+D0Y+L3Lq4ieWh1WOORxn27FKuzxkxuFfQUmuCqQDP
	Md6dJMKjk1yRWAn5NRxhYwtnnrYRhDzUDf7RG0KOMO/cmuXPX7gM8HeASgkRLZV42nPaVr5L5/U
	i9Vq/EJtwnaHIIolbvZP8djCMO2yKRkVvztwbC2zdXZYsBzywqSrcVjAqT+EVk0gFlkcTU1rPMX
	9WlU40p/8ugzd6Fmc7BwLOady43/kRCGCq9MJtKbHOnIhS6qECBROEnVmStnM/TCdyfWCju0qN7
	OjDu0O0cjk6ON3qOaiO0NsMFXh2LwA==
X-Google-Smtp-Source: AGHT+IEAFmL7UZg1uTfDDRPoy0BBuksKzzgZGM3TutSiUK4Zl501M3PKPyCwG30hNRGeBsF6mBGDwg==
X-Received: by 2002:a05:6512:1110:b0:536:a695:942c with SMTP id 2adb3069b0e04-53dd35a4f17mr1072878e87.7.1732270036793;
        Fri, 22 Nov 2024 02:07:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2445712sm314765e87.40.2024.11.22.02.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:07:16 -0800 (PST)
Date: Fri, 22 Nov 2024 12:07:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/9] drm/msm/dpu: Add SM6150 support
Message-ID: <bhylewwvztm7gsmkjwo6asceuph2jlqgvy2lhocdvg6r7y4i6w@duvbnsko3xg2>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-5-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-5-35252e3a51fe@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_020718_634708_9BE2F004 
X-CRM114-Status: GOOD (  19.93  )
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

On Fri, Nov 22, 2024 at 05:56:48PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add definitions for the display hardware used on the Qualcomm SM6150
> platform.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 263 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 266 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..e8b7f694b885d69a9bbfaa85b0faf0c7af677a75
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> @@ -0,0 +1,263 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _DPU_5_3_SM6150_H
> +#define _DPU_5_3_SM6150_H
> +
> +	}, {
> +		.name = "intf_2", .id = INTF_2,
> +		.base = 0x6b000, .len = 0x2c0,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_NONE,
> +		.controller_id = 0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),

Please drop. No need to declare missing blocks.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x6b800, .len = 0x280,
> +		.features = INTF_SC7180_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +	},
> +};
> +

-- 
With best wishes
Dmitry

