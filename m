Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0493C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 17:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMFtwR0cjY9A1szP289YoQESj54wwE6Rq8FAwxVKpA4=; b=oqJk2Ot+Y+jwifvCnDjLa4wUTp
	urjcPweNZjzLl08QEVvbCX5oAN/Gn6eTMKSS4Csz7MRwWcH+gDgkbm7JgPQ0DAYPMdZhcaKvIl98L
	m7/aud7zKdw73Tq8hLdC6V3ONBXW66VYxshaBYKnHqNLhnFqE5KF6AvXsGvjH3d3k/KKlY1wpff0A
	56JLiNqZjnm7Z3AIyb+81HYfjy5FxYPM5brzyhBNzLRB5TOnOaiyJ54Mbx/fOEC7JYE4HzEiidwWU
	PgpFlCkxMIHNioEDPlZv5rLW4lYtsWLalREzt8JnbVRQfFUpR0FDPOyUfj5tmaCpumlMLm0KqBfpk
	RHMBFk7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u807e-0000000Er7f-1UcY;
	Thu, 24 Apr 2025 17:12:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ztX-0000000EpTy-40tJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 16:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cMFtwR0cjY9A1szP289YoQESj54wwE6Rq8FAwxVKpA4=; b=aBthNXM6vWrdj3d50Z1H/dZaBy
	omHwzqZ2ka58MgnaPR4453Vmrn9AsKVQfH00hux0d4aGREXjMmoIShm3dVg+EAahzOY3zO0IHu8oQ
	0KX8mZj5jq3z3K9RJtFtceMLHu3qN4iugqkEHAZtNTJjsC+GncNJDgRIu9NSDwgrOQ5AY/pxSu6eV
	abqRIBDovl7tOZFj5aj0vTSLu5bOrsqgzHczBTi7JNdAJvzEibljF5ac+vxJOaSnxuhtDtukVP3sh
	uV0VgsoS6mzcST3z574cBXrU/CkEmPnpFUJn/1qKlV35+YWoX004PSr4Yd6vAalPPMGzODZAajO62
	cJWhCSOw==;
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7ztV-0000000BrnI-0pmD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 16:57:50 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-70565ccf3bcso14790207b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 09:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745513866; x=1746118666; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cMFtwR0cjY9A1szP289YoQESj54wwE6Rq8FAwxVKpA4=;
        b=Ak4qJZHABKbS3M7gvd/VI0vhX4IBie9HUImE5SCSytwbO33ODhJn0S2dZCSrKJQldu
         PtYmsjbxWnBPaDhT70XYgUb2MZ7myiWXntywMyTLUWTaozj84SwENe4ozmQLFx2oB3fH
         ynLacanJEMQidW1pwDLQkTy8QsIre9gBHeRqUOYxAxkVoHt5Htt2mbAU/APQ/IQ0+rbB
         I2UzEueMPK1bKeTQrqbzTJSTHNKKNwrYAP8ZJv16v14GfQQflNHF4E1XqG61V8wCHlic
         46WHAfADrCq3mekq2Wa/GzGgzybjzdxtt68KbQwjSlUqBorAoJsb7+khJfrl44xuee+G
         XWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513866; x=1746118666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMFtwR0cjY9A1szP289YoQESj54wwE6Rq8FAwxVKpA4=;
        b=lhqzPgsJhMfMCmKJvHI8aGuSFIsG5UKsghYUHPy3vLtdb/OJIFUCbn4YtMd4A/RteW
         0kQXXePeottdIh55wspCyOdRQgxu57iMomQu2RtilmodogYy7E7wKWI09XpuYMgNSa5u
         gWcljGAYmPup2ojLjrkM4mf6NGm9zCzZfFFYw7ig5KNyYw7irM1v2aZNFU/jEMMymfka
         4rQHfHi2Ve/rSNVpKf3mcTs+IhwIibHWPxX+pD1CIOxtYBpxRTb5Y6/2wpI0KxV5lZmb
         r2XuUR7QOfDI6c+HuxD2Kf4et9rMLxMtK235by1KMg+sLEs+9k7atcz2FLSAF5IJQZCM
         NkMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZtTqWV9SYo7UUpWA18q2WPasqG/JpWiGMIjPXHfhyLC+OQneegLeYvqz2hsJnkOVL2XCn3P+l+lZLyN3fFq5Q@lists.infradead.org
X-Gm-Message-State: AOJu0YyWmzrhejBhjoc+dpfEG2NzLFc4icK93ZvCLSCJZq9YtRYAOYLq
	LFt45gGOP64lmcG38Hf9F+54gS6c7CNlhDGd90MIeKy1O1GmZBCUZNwgpHO91i9BXNv0f5uc9nc
	pSqCuV63kRw+azffMOWmNpbuB0tKFfkucA0SUyQ==
X-Gm-Gg: ASbGncudwhnUeKxStFpajnEC1n5pGY6+EIdZMFj9cdrXnOmlZzgmEBok13Pw99FNeAO
	A6S+TThxT37axFFf1iNtEqI2mM6uY+0KvqH2TRgciUfyL6MZAqtLOFSQWlJCn0IlJANsmUedBZs
	Hk5hpe1einwjFtpe0t75xeNQk=
X-Google-Smtp-Source: AGHT+IH5p9xZ9JTlIabjNlX7tQHJrcaoNt4NdS4YrEPTAAfSSCwMBfEDdWwaxwxD2TzmAUDKr0gH0wiBCRrqHBSYDNU=
X-Received: by 2002:a05:690c:385:b0:6fd:2feb:eb6e with SMTP id
 00721157ae682-7084f129df8mr7111907b3.28.1745513866588; Thu, 24 Apr 2025
 09:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250415032314.44997-1-kever.yang@rock-chips.com> <20250415032314.44997-2-kever.yang@rock-chips.com>
In-Reply-To: <20250415032314.44997-2-kever.yang@rock-chips.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Apr 2025 18:57:10 +0200
X-Gm-Features: ATxdqUHaEq5VBCeeWj8VtNYyErWM1Dmw22DJsOkuoLiPj5dVBYs62HJ1VPg7Ulw
Message-ID: <CAPDyKFqLQsG-rNeYgHT4g2mCWjPzkF2nkktUXxAL95tM7g+Smg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] soc: rockchip: power-domain: add power domain
 support for rk3562
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Finley Xiao <finley.xiao@rock-chips.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-pm@vger.kernel.org, 
	Detlev Casanova <detlev.casanova@collabora.com>, linux-kernel@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Peter Geis <pgwipeout@gmail.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_175749_378277_276525E6 
X-CRM114-Status: GOOD (  22.66  )
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

On Tue, 15 Apr 2025 at 05:23, Kever Yang <kever.yang@rock-chips.com> wrote:
>
> From: Finley Xiao <finley.xiao@rock-chips.com>
>
> This driver is modified to support RK3562 SoC.
> Add support to ungate clk.
> Add support to shut down memory for rk3562.
>
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Applied for next and by amending the commit message header, thanks!

Kind regards
Uffe


> ---
>
> Changes in v4:
> - rebase to v6.15-rc1
> - update patch author and Collect review tag
>
> Changes in v3: None
> Changes in v2:
> - update the header after rename
>
>  drivers/pmdomain/rockchip/pm-domains.c | 48 +++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
> index 03bcf79a461f..4cce407bb1eb 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -2,7 +2,7 @@
>  /*
>   * Rockchip Generic power domain support.
>   *
> - * Copyright (c) 2015 ROCKCHIP, Co. Ltd.
> + * Copyright (c) 2015 Rockchip Electronics Co., Ltd.
>   */
>
>  #include <linux/arm-smccc.h>
> @@ -35,6 +35,7 @@
>  #include <dt-bindings/power/rk3366-power.h>
>  #include <dt-bindings/power/rk3368-power.h>
>  #include <dt-bindings/power/rk3399-power.h>
> +#include <dt-bindings/power/rockchip,rk3562-power.h>
>  #include <dt-bindings/power/rk3568-power.h>
>  #include <dt-bindings/power/rockchip,rk3576-power.h>
>  #include <dt-bindings/power/rk3588-power.h>
> @@ -135,6 +136,20 @@ struct rockchip_pmu {
>         .active_wakeup = wakeup,                        \
>  }
>
> +#define DOMAIN_M_G_SD(_name, pwr, status, req, idle, ack, g_mask, mem, wakeup, keepon) \
> +{                                                      \
> +       .name = _name,                                  \
> +       .pwr_w_mask = (pwr) << 16,                      \
> +       .pwr_mask = (pwr),                              \
> +       .status_mask = (status),                        \
> +       .req_w_mask = (req) << 16,                      \
> +       .req_mask = (req),                              \
> +       .idle_mask = (idle),                            \
> +       .ack_mask = (ack),                              \
> +       .clk_ungate_mask = (g_mask),                    \
> +       .active_wakeup = wakeup,                        \
> +}
> +
>  #define DOMAIN_M_O_R(_name, p_offset, pwr, status, m_offset, m_status, r_status, r_offset, req, idle, ack, wakeup, regulator)  \
>  {                                                      \
>         .name = _name,                                  \
> @@ -201,6 +216,9 @@ struct rockchip_pmu {
>  #define DOMAIN_RK3399(name, pwr, status, req, wakeup)          \
>         DOMAIN(name, pwr, status, req, req, req, wakeup)
>
> +#define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)             \
> +       DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup, false)
> +
>  #define DOMAIN_RK3568(name, pwr, req, wakeup)          \
>         DOMAIN_M(name, pwr, pwr, req, req, req, wakeup)
>
> @@ -1197,6 +1215,18 @@ static const struct rockchip_domain_info rk3399_pm_domains[] = {
>         [RK3399_PD_SDIOAUDIO]   = DOMAIN_RK3399("sdioaudio", BIT(31), BIT(31), BIT(29), true),
>  };
>
> +static const struct rockchip_domain_info rk3562_pm_domains[] = {
> +                                            /* name           pwr     req     g_mask  mem wakeup */
> +       [RK3562_PD_GPU]         = DOMAIN_RK3562("gpu",         BIT(0), BIT(1), BIT(1), 0, false),
> +       [RK3562_PD_NPU]         = DOMAIN_RK3562("npu",         BIT(1), BIT(2), BIT(2), 0, false),
> +       [RK3562_PD_VDPU]        = DOMAIN_RK3562("vdpu",        BIT(2), BIT(6), BIT(6), 0, false),
> +       [RK3562_PD_VEPU]        = DOMAIN_RK3562("vepu",        BIT(3), BIT(7), BIT(7) | BIT(3), 0, false),
> +       [RK3562_PD_RGA]         = DOMAIN_RK3562("rga",         BIT(4), BIT(5), BIT(5) | BIT(4), 0, false),
> +       [RK3562_PD_VI]          = DOMAIN_RK3562("vi",          BIT(5), BIT(3), BIT(3), 0, false),
> +       [RK3562_PD_VO]          = DOMAIN_RK3562("vo",  BIT(6), BIT(4), BIT(4), 16, false),
> +       [RK3562_PD_PHP]         = DOMAIN_RK3562("php",         BIT(7), BIT(8), BIT(8), 0, false),
> +};
> +
>  static const struct rockchip_domain_info rk3568_pm_domains[] = {
>         [RK3568_PD_NPU]         = DOMAIN_RK3568("npu",  BIT(1), BIT(2),  false),
>         [RK3568_PD_GPU]         = DOMAIN_RK3568("gpu",  BIT(0), BIT(1),  false),
> @@ -1398,6 +1428,18 @@ static const struct rockchip_pmu_info rk3399_pmu = {
>         .domain_info = rk3399_pm_domains,
>  };
>
> +static const struct rockchip_pmu_info rk3562_pmu = {
> +       .pwr_offset = 0x210,
> +       .status_offset = 0x230,
> +       .req_offset = 0x110,
> +       .idle_offset = 0x128,
> +       .ack_offset = 0x120,
> +       .clk_ungate_offset = 0x140,
> +
> +       .num_domains = ARRAY_SIZE(rk3562_pm_domains),
> +       .domain_info = rk3562_pm_domains,
> +};
> +
>  static const struct rockchip_pmu_info rk3568_pmu = {
>         .pwr_offset = 0xa0,
>         .status_offset = 0x98,
> @@ -1496,6 +1538,10 @@ static const struct of_device_id rockchip_pm_domain_dt_match[] = {
>                 .compatible = "rockchip,rk3399-power-controller",
>                 .data = (void *)&rk3399_pmu,
>         },
> +       {
> +               .compatible = "rockchip,rk3562-power-controller",
> +               .data = (void *)&rk3562_pmu,
> +       },
>         {
>                 .compatible = "rockchip,rk3568-power-controller",
>                 .data = (void *)&rk3568_pmu,
> --
> 2.25.1
>

