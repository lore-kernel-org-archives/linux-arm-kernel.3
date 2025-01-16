Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E7DC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+m1G7PofLTIXji56NSz1j24b2b2T3MuG3/CntqxLBBw=; b=YvTG0tAYt4KRme5GM8+tIAiBBu
	Z98Xla6r12HIc4RVu4jF3LbXMzFZ0Cm1pjqjKNmS87LaWkOIs/DS2TQr7Z/6nsFK9NpWDbSuWXyMZ
	GWoBMoqRcFQn2DgraTgV5NtyuW5GAcSzbx8Ej1eEWJx71S8GCoYXptEgvYA26Ch89jTyq7j+1fJH9
	trvfEdeeUQzl4KjWeN3oBRR4fb97qkt03qpeNHO3M0/uWBWDTfVGoiHTYql8jsGd8VMCuhCbvANaD
	1nWXeIGysChljbuRMy9BquYbEgGWtbByc6PKtM+W8llRn4WNammEC0BAq/j/zb6uo9SKGfB3GzHLO
	LA8lxKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRAJ-0000000FDyX-1gng;
	Thu, 16 Jan 2025 14:48:11 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYR93-0000000FDl2-1C0p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 14:46:54 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e46c6547266so1460075276.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 06:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737038812; x=1737643612; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+m1G7PofLTIXji56NSz1j24b2b2T3MuG3/CntqxLBBw=;
        b=EiGGEymabOEsk6Y15F+uHzMe6ZUiylM+016+khoOR6EHpvYL6dKZFL/7wKtBvC21pN
         GZYwn0POG508kY1oKwx/Vt7Mqe+Pgwpq0Gt1bSFwW73se3jbByN/iiGpcrb1qsIWzNtT
         xXDtfdqt2lt+ACZ9dyQTZvG2NuG4imrb2xDzBkTDnnhQIDcbFvMBvm/GNuJrZO45WHUr
         J5bweJvwl+BPUyjIhBMEFdWswzZmOxCEVW0Sono+wQKMKuBshRMMF8P+F9Ys//ZZKbo8
         gglhIF/IfyOSgK7tyoslNh7VNwSSfRBisEGnTTU8wSMunpkojRmqiEaUb+jnA1KrF96x
         jpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737038812; x=1737643612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+m1G7PofLTIXji56NSz1j24b2b2T3MuG3/CntqxLBBw=;
        b=ryndhbZTgUNrfLtLbAeQDMZ2cD9SCEH52ZIM9tM0kVpKQFZHnmeg23Z2XQg8DPpsI4
         GPRCLl9dYE27k5gwVhTxhtwaUujipOp8Qsgcmx1qGuDyD5b3s0cR/xFQEwrE0hqdNWxS
         r6mpWJpirXVuZWWjD5XyMiZHNgx6Nd161YoLWGuX+o5gFwlwKggbIU/GeU2V1S9ag1+T
         I8yhBubVVFvRFS7BGtktqIqGHtne3f7o0KjXjlJah6P4bfjiqJRqBZ52EvXo6wfGKxOI
         su+Bu0UAG39Hr5dOs3dv2TKWrzBiTQKWZ6pGGXX7uXilf4ecDUspBhY1uDT7KR9Ltm+a
         R5lg==
X-Forwarded-Encrypted: i=1; AJvYcCWQRk9Y2MdHqtIUzBTTQeFmyxW3W3VYf61AMC6AKmRMgsrh3iMb4JwkvA7MriA9o1844WoRMkncohk4wS3JI8ex@lists.infradead.org
X-Gm-Message-State: AOJu0Ywaq7Qqsvuv9SCeKuPAMmGds0mVuk31BIxzal+0G5GJB4q68wE8
	B4mRw81Yavlaud7ckHieyL0s95WymusOFAZwPnUm52nSuJ8vsTG4vS7tduHB1MbygyQfywJmZqr
	NPG2ey2uZ6Um0+9N99y+2qwNyWAnoviYTQ6XsUg==
X-Gm-Gg: ASbGnctSAKKfoxOw1wCOVrZif1qlUizh/OtKNB3hX1KeL7wHkTDM4vxtV2TaBS6AjXs
	C678jRLJjpHFD4Y1U5C8mv4ZzIS1ORNvJwxz0V64=
X-Google-Smtp-Source: AGHT+IEgtTusJYrVZnLJqpkMnaQW6PKvqXaBdJ1qWB4u4sYFRvuNXZZiCbeAuzNh5mb57/Q5o/7WHYssJXuaOMTG558=
X-Received: by 2002:a05:690c:4d81:b0:6ef:7f34:fe08 with SMTP id
 00721157ae682-6f531224a36mr294371267b3.18.1737038812063; Thu, 16 Jan 2025
 06:46:52 -0800 (PST)
MIME-Version: 1.0
References: <20241224093920.3816071-1-kever.yang@rock-chips.com> <20241224093920.3816071-2-kever.yang@rock-chips.com>
In-Reply-To: <20241224093920.3816071-2-kever.yang@rock-chips.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 16 Jan 2025 15:46:16 +0100
X-Gm-Features: AbW1kvahorrlWkjwCiv7wkTLlUP8_JyQ26Uq7qZus2JotVO1Pyr02DSo-fK3yF0
Message-ID: <CAPDyKFqYjTsWsqf-C+iHJz3x-RKdsm2-2cPm-HMeH=WBNzcSLw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] soc: rockchip: power-domain: add power domain
 support for rk3562
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Finley Xiao <finley.xiao@rock-chips.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-pm@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_064653_323789_11CA7D27 
X-CRM114-Status: GOOD (  22.14  )
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

On Tue, 24 Dec 2024 at 10:39, Kever Yang <kever.yang@rock-chips.com> wrote:
>
> This driver is modified to support RK3562 SoC.
> Add support to ungate clk.
> Add support to shut down memory for rk3562.
>
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
>
> Changes in v2:
> - update the header after rename
>
>  drivers/pmdomain/rockchip/pm-domains.c | 48 +++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
> index cb0f93800138..d05ec0a009a0 100644
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
>  #include <linux/io.h>
> @@ -32,6 +32,7 @@
>  #include <dt-bindings/power/rk3366-power.h>
>  #include <dt-bindings/power/rk3368-power.h>
>  #include <dt-bindings/power/rk3399-power.h>
> +#include <dt-bindings/power/rockchip,rk3562-power.h>
>  #include <dt-bindings/power/rk3568-power.h>
>  #include <dt-bindings/power/rockchip,rk3576-power.h>
>  #include <dt-bindings/power/rk3588-power.h>
> @@ -129,6 +130,20 @@ struct rockchip_pmu {
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
>  #define DOMAIN_M_O_R(_name, p_offset, pwr, status, m_offset, m_status, r_status, r_offset, req, idle, ack, wakeup)     \
>  {                                                      \
>         .name = _name,                                  \
> @@ -194,6 +209,9 @@ struct rockchip_pmu {
>  #define DOMAIN_RK3399(name, pwr, status, req, wakeup)          \
>         DOMAIN(name, pwr, status, req, req, req, wakeup)
>
> +#define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)             \
> +       DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup, false)
> +
>  #define DOMAIN_RK3568(name, pwr, req, wakeup)          \
>         DOMAIN_M(name, pwr, pwr, req, req, req, wakeup)
>
> @@ -1130,6 +1148,18 @@ static const struct rockchip_domain_info rk3399_pm_domains[] = {
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
> @@ -1331,6 +1361,18 @@ static const struct rockchip_pmu_info rk3399_pmu = {
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
> @@ -1429,6 +1471,10 @@ static const struct of_device_id rockchip_pm_domain_dt_match[] = {
>                 .compatible = "rockchip,rk3399-power-controller",
>                 .data = (void *)&rk3399_pmu,
>         },
> +       {
> +               .compatible = "rockchip,rk3562-power-controller",

I couldn't find the corresponding DT patch where this compatible is
being documented. Can you please re-send and keep me posted for both
the DT and pmdomain patch?

> +               .data = (void *)&rk3562_pmu,
> +       },
>         {
>                 .compatible = "rockchip,rk3568-power-controller",
>                 .data = (void *)&rk3568_pmu,
> --
> 2.25.1
>

Kind regards
Uffe

