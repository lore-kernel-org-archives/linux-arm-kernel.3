Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D52ACAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/Ku0WQ65djtaMitZtvpBRz1mourwVgiqgk6yxreW9g=; b=a7HpyRWzavc90xQ3xfYAKYf8nC
	zlvrHI+KMada6zbEyzwwFDC66ISsmZB74fA1zg80vw/c3nrU0v9oGanxGRvxh+VzJE+H4IEeGkJ0k
	JzjksXBtpNyLIreFVrLuE2cZ098sgL6fNwAFFUGKCp8tjgevU+UdyIrZei32A4csFQsPGKteDQYz5
	Tt0gV9JdzO8LDaGA+XkT2w0gdZvvFZ/ZoAcOERtVmpjJQXJdGZhxx6GtyMOWaSYhcKjtghnLAYwX3
	uvdP9UEXaAKedz8Pcv08gDG7ffP3un/VaZGJrcc2pQpIi3pxX52mxMvM1Y1PzLbU5S+f5veev+8m7
	0MQicYaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw20p-00000008veX-0sWc;
	Tue, 09 Sep 2025 17:20:11 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyjC-00000007WJ2-0lhv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:49:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757425763; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZPAIgnVLIIrn3kDfkEgrFFCfm2FitlN2ZyePQB2nyhgAbyEcp2drvC9+bpRtQq/eOpUTetSZVspMR6q44O3rXDhJ0msylFG0B/5i5MARL5PV9j6L/izb+YWRjz3VnqMi3sfZpeU4krXpgEf3VRv9e3/8/2sop4yaxJc03trZ7SA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757425763; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=L/Ku0WQ65djtaMitZtvpBRz1mourwVgiqgk6yxreW9g=; 
	b=NTbem7q4rgQFGLQC7p3n9d5KbbswX5gjJZgBxJsCGyHDRvd5SqLzZdK1vJ6B0s7OEdAWwbZoAr7eKL79mq6RM5c3VJXO5OwbdisgxdXAFyfBZVn6YPNqaXhlWvtRTATOMC36RamzQrawf3uaUtP9RTYxGjFsJJBK45MtOsKAYuI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757425763;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=L/Ku0WQ65djtaMitZtvpBRz1mourwVgiqgk6yxreW9g=;
	b=eVZCcOC/CBXKqJM/FpN4NLI6W9TZQ6B05GYsrJXwlAyL2Mfa1xksWUOAvvwL+u0W
	XhB0Kp8/w2hEGRVm0r60cY7URRfUvo+nTyaMRF/Jdb7oSO27ZpUun1TfpeHA1pfJDFU
	+8RQAIzy70zuEm8UsAQ/MM6maRuTB88w0CfjwGX8=
Received: by mx.zohomail.com with SMTPS id 1757425761695925.908509267311;
	Tue, 9 Sep 2025 06:49:21 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sebin Francis <sebin.francis@ti.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Peng Fan <peng.fan@oss.nxp.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Michal Simek <michal.simek@amd.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] pmdomain: rockchip: Fix regulator dependency with
 GENPD_FLAG_NO_STAY_ON
Date: Tue, 09 Sep 2025 15:49:15 +0200
Message-ID: <4274915.mvXUDI8C0e@workhorse>
In-Reply-To: <20250909111130.132976-3-ulf.hansson@linaro.org>
References: <20250909111130.132976-1-ulf.hansson@linaro.org>
 <20250909111130.132976-3-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_064946_290463_E0C19D90 
X-CRM114-Status: GOOD (  20.69  )
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

On Tuesday, 9 September 2025 13:11:21 Central European Summer Time Ulf Hansson wrote:
> The deferred regulator retrieval for Rockchip PM domains are causing some
> weird dependencies. More precisely, if the power-domain is powered-on from
> the HW perspective, its corresponding regulator must not be powered-off via
> regulator_init_complete(), which is a late_initcall_sync.
> 
> Even on platforms that don't have the domain-supply regulator specified for
> the power-domain provider, may suffer from these problems.
> 
> More precisely, things just happen to work before, because
> genpd_power_off_unused() (also a late_initcall_sync) managed to power-off
> the PM domain before regulator_init_complete() powered-off the regulator.
> 
> Ideally this fragile dependency must be fixed properly for the Rockchip PM
> domains, but until then, let's fallback to the previous behaviour by using
> the GENPD_FLAG_NO_STAY_ON flag.
> 
> Link: https://lore.kernel.org/all/20250902-rk3576-lockup-regression-v1-1-c4a0c9daeb00@collabora.com/
> Reported-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/pmdomain/rockchip/pm-domains.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
> index 242570c505fb..1955c6d453e4 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -865,7 +865,7 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
>  	pd->genpd.power_on = rockchip_pd_power_on;
>  	pd->genpd.attach_dev = rockchip_pd_attach_dev;
>  	pd->genpd.detach_dev = rockchip_pd_detach_dev;
> -	pd->genpd.flags = GENPD_FLAG_PM_CLK;
> +	pd->genpd.flags = GENPD_FLAG_PM_CLK | GENPD_FLAG_NO_STAY_ON;
>  	if (pd_info->active_wakeup)
>  		pd->genpd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;
>  	pm_genpd_init(&pd->genpd, NULL,
> 

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Fixes the full-SoC lockup I've observed on my RK3576 Radxa ROCK 4D,
which before this patch would occur when the vdd_npu_s0 regulator
was disabled.

Thank you!

Kind regards,
Nicolas Frattaroli




