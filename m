Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65333C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/oWQEudpESa3h5p25FZ2E/peR9srzu3zLywQospGPM=; b=fq83ne/a5sSvv/tV/v3zzNXi4u
	rCtGNS7ZLYt8QHcG1l581Gwumkb9MbW9gB+K3hInTE7lI5CvVJfJ0Ky/LYrNWrnqjq7pHJTMZ7vvE
	gfsyJ+J8vqE3M5wZ+ZD+SjuZLept66zryBq7b9qceAj+3U0TlFE0l4D1jjkDv30H7GIUOxM9oNw7P
	L2guIwHvMWn2hGBBnn3OvdXvWo7+FVDXwfVyWfbblFCwQbmSYfj//Y/95QS+3ky7nPGzi6IiCAtet
	RsDHTuRC9hJspYLpfKA7HOK3rfAZFyoP5L1jXfYIs7IgnWArjMxDQwAlKckBFo1I8uNUYhVYDWRHz
	fIxFJb3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrfn-0000000C0pU-1rEG;
	Thu, 10 Jul 2025 13:50:51 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqMd-0000000BlQh-1eal
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 12:27:01 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250710122654euoutp024c3ac5b7ed7239ad7c4e3e9cd8d86143~Q44TEbhV21227412274euoutp02Z
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 12:26:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250710122654euoutp024c3ac5b7ed7239ad7c4e3e9cd8d86143~Q44TEbhV21227412274euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752150414;
	bh=D/oWQEudpESa3h5p25FZ2E/peR9srzu3zLywQospGPM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=kuJjdzKFrQrPl6guBdNHnmzta9I3S5ng7rIMZbSj6LmBH1ogtj39zUKoZvvREbeaN
	 NmbHpEDc5PurEoaRLa3Iau9o2Fc+JVY/L+Ntad4xAfN7AtmK3UhYCEfOLjbJP2rykf
	 BfkD5LetV4o3GLXom+6g/gBvnr4CIu/8exE01jCU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250710122654eucas1p20f1179a9ff22d562d89252f924d34dae~Q44Stx9J21669716697eucas1p26;
	Thu, 10 Jul 2025 12:26:54 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250710122652eusmtip1205fb97fbbf5070e4fbdb96b09b6fb55~Q44RtpbyU1085010850eusmtip1Z;
	Thu, 10 Jul 2025 12:26:52 +0000 (GMT)
Message-ID: <212a1a56-08a5-48a5-9e98-23de632168d0@samsung.com>
Date: Thu, 10 Jul 2025 14:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/24] pmdomain: core: Leave powered-on genpds on
 until late_initcall_sync
To: Ulf Hansson <ulf.hansson@linaro.org>, Saravana Kannan
	<saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Michael Grzeschik
	<m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, Abel
	Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, Maulik
	Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Hiago De
	Franco <hiago.franco@toradex.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250701114733.636510-22-ulf.hansson@linaro.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250710122654eucas1p20f1179a9ff22d562d89252f924d34dae
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250710122654eucas1p20f1179a9ff22d562d89252f924d34dae
X-EPHeader: CA
X-CMS-RootMailID: 20250710122654eucas1p20f1179a9ff22d562d89252f924d34dae
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
	<20250701114733.636510-22-ulf.hansson@linaro.org>
	<CGME20250710122654eucas1p20f1179a9ff22d562d89252f924d34dae@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_052700_022996_7A5FA404 
X-CRM114-Status: GOOD (  31.16  )
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

On 01.07.2025 13:47, Ulf Hansson wrote:
> Powering-off a genpd that was on during boot, before all of its consumer
> devices have been probed, is certainly prone to problems.
>
> As a step to improve this situation, let's prevent these genpds from being
> powered-off until genpd_power_off_unused() gets called, which is a
> late_initcall_sync().
>
> Note that, this still doesn't guarantee that all the consumer devices has
> been probed before we allow to power-off the genpds. Yet, this should be a
> step in the right direction.
>
> Suggested-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

This change has a side effect on some Exynos based boards, which have 
display and bootloader is configured to setup a splash screen on it. 
Since today's linux-next, those boards fails to boot, because of the 
IOMMU page fault.

This happens because the display controller is enabled and configured to 
perform the scanout from the spash-screen buffer until the respective 
driver will reset it in driver probe() function. This however doesn't 
work with IOMMU, which is being probed earlier than the display 
controller driver, what in turn causes IOMMU page fault once the IOMMU 
driver gets attached. This worked before applying this patch, because 
the power domain of display controller was simply turned off early 
effectively reseting the display controller.

This has been discussed a bit recently: 
https://lore.kernel.org/all/544ad69cba52a9b87447e3ac1c7fa8c3@disroot.org/ 
and I can add a workaround for this issue in the bootloaders of those 
boards, but this is something that has to be somehow addressed in a 
generic way.

> ---
>   drivers/pmdomain/core.c   | 10 ++++++++--
>   include/linux/pm_domain.h |  1 +
>   2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 5cef6de60c72..18951ed6295d 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -931,11 +931,12 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>   	 * The domain is already in the "power off" state.
>   	 * System suspend is in progress.
>   	 * The domain is configured as always on.
> +	 * The domain was on at boot and still need to stay on.
>   	 * The domain has a subdomain being powered on.
>   	 */
>   	if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
>   	    genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
> -	    atomic_read(&genpd->sd_count) > 0)
> +	    genpd->stay_on || atomic_read(&genpd->sd_count) > 0)
>   		return;
>   
>   	/*
> @@ -1346,8 +1347,12 @@ static int __init genpd_power_off_unused(void)
>   	pr_info("genpd: Disabling unused power domains\n");
>   	mutex_lock(&gpd_list_lock);
>   
> -	list_for_each_entry(genpd, &gpd_list, gpd_list_node)
> +	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
> +		genpd_lock(genpd);
> +		genpd->stay_on = false;
> +		genpd_unlock(genpd);
>   		genpd_queue_power_off_work(genpd);
> +	}
>   
>   	mutex_unlock(&gpd_list_lock);
>   
> @@ -2352,6 +2357,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
>   	INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
>   	atomic_set(&genpd->sd_count, 0);
>   	genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
> +	genpd->stay_on = !is_off;
>   	genpd->sync_state = GENPD_SYNC_STATE_OFF;
>   	genpd->device_count = 0;
>   	genpd->provider = NULL;
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index d68e07dadc99..99556589f45e 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -199,6 +199,7 @@ struct generic_pm_domain {
>   	unsigned int performance_state;	/* Aggregated max performance state */
>   	cpumask_var_t cpus;		/* A cpumask of the attached CPUs */
>   	bool synced_poweroff;		/* A consumer needs a synced poweroff */
> +	bool stay_on;			/* Stay powered-on during boot. */
>   	enum genpd_sync_state sync_state; /* How sync_state is managed. */
>   	int (*power_off)(struct generic_pm_domain *domain);
>   	int (*power_on)(struct generic_pm_domain *domain);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


