Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33978CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 20:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkfTpNuqej1UoTarvASJEkiFQ49zLY0qzCQi5FcT4uM=; b=KrXTkSvTh/fJGS4GRTn3ZM8a6V
	JOemke1WPa33T59Yjbd1aA6FM+09mcPPmXRtyNeSecmxfGpuf/Yb/Et7qfB3soRw9gJsOeTabnL7a
	pMKpdcUtfycmx9Ip7/yeHBLHEZLXrF1h2P0lmmsVqRxVMj5Zt3yb+2DJzApMzWuaxs+7pVRL/CyOy
	4xZXC4Sl9UA1H9aEISkritpKjbEQY0Yu2MXzlUkWZCnM7jIMU3D6Z2P5XLR9TkS8PVt0MFRbvVxDr
	vXBCDqXZGOAIQ7DxXq1EsP0jpQcIHaGir+YSacyjexCJZ4Mbo6dXPzUoCTpufVrf8oHz8iRSjDc1C
	pIs4w11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJ7V-00000000bbn-3llz;
	Tue, 21 Oct 2025 20:38:13 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBJ7S-00000000bZw-2NeW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 20:38:12 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251021203805euoutp01ac68c4569ef66b6ff401b2f1d10dc7f4~wnBj-3b5d2821328213euoutp01L
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 20:38:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251021203805euoutp01ac68c4569ef66b6ff401b2f1d10dc7f4~wnBj-3b5d2821328213euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761079085;
	bh=WkfTpNuqej1UoTarvASJEkiFQ49zLY0qzCQi5FcT4uM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rSyoE7eEsLXh9M8Vms1QePG23J8dvTd+XqkgCf2aNnIF06Guc00f+AK4hNUbm+XLw
	 pJfmkcyYy9OpTo5HtJVNtSFgUe7ZKlhsHWf2/tt/kDnr4zYtaVbCXvNif9xY70br9D
	 /h2cMy3Hj9X/n0N535wxwcgZt96u+dAS1Heq4SpQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251021203804eucas1p2c091f1cce52c4d08eeacf8c36604f1fb~wnBisd64H0197501975eucas1p21;
	Tue, 21 Oct 2025 20:38:04 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251021203802eusmtip23e28f0f310780cc696c497752fb587eb~wnBhWTpKN1353213532eusmtip2A;
	Tue, 21 Oct 2025 20:38:02 +0000 (GMT)
Message-ID: <2e38e6c2-0548-432f-ae34-daf3972877ac@samsung.com>
Date: Tue, 21 Oct 2025 22:38:01 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 06/10] pmdomain: samsung: convert to
 regmap_read_poll_timeout()
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, Krzysztof
	Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob
	Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>,
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251016-gs101-pd-v3-6-7b30797396e7@linaro.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251021203804eucas1p2c091f1cce52c4d08eeacf8c36604f1fb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251016155855eucas1p2ccc516861548e963761133fc52fc560e
X-EPHeader: CA
X-CMS-RootMailID: 20251016155855eucas1p2ccc516861548e963761133fc52fc560e
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
	<CGME20251016155855eucas1p2ccc516861548e963761133fc52fc560e@eucas1p2.samsung.com>
	<20251016-gs101-pd-v3-6-7b30797396e7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_133811_177662_8EDCD231 
X-CRM114-Status: GOOD (  22.08  )
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

On 16.10.2025 17:58, André Draszik wrote:
> Replace the open-coded PD status polling with
> regmap_read_poll_timeout(). This change simplifies the code without
> altering functionality.
>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>   drivers/pmdomain/samsung/exynos-pm-domains.c | 29 ++++++++--------------------
>   1 file changed, 8 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
> index 383126245811cb8e4dbae3b99ced3f06d3093f35..431548ad9a7e40c0a77ac6672081b600c90ddd4e 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -13,7 +13,6 @@
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
>   #include <linux/pm_domain.h>
> -#include <linux/delay.h>
>   #include <linux/of.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/regmap.h>
> @@ -35,7 +34,8 @@ struct exynos_pm_domain {
>   static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
>   {
>   	struct exynos_pm_domain *pd;
> -	u32 timeout, pwr;
> +	unsigned int val;
> +	u32 pwr;
>   	int err;
>   
>   	pd = container_of(domain, struct exynos_pm_domain, pd);
> @@ -45,25 +45,12 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
>   	if (err)
>   		return err;
>   
> -	/* Wait max 1ms */
> -	timeout = 10;
> -	while (timeout-- > 0) {
> -		unsigned int val;
> -
> -		err = regmap_read(pd->regmap, 0x4, &val);
> -		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
> -			cpu_relax();
> -			usleep_range(80, 100);
> -			continue;
> -		}
> -
> -		return 0;
> -	}
> -
> -	if (!err)
> -		err = -ETIMEDOUT;
> -	pr_err("Power domain %s %sable failed: %d\n", domain->name,
> -	       power_on ? "en" : "dis", err);
> +	err = regmap_read_poll_timeout(pd->regmap, 0x4, val,
> +				       (val & pd->local_pwr_cfg) == pwr,
> +				       100, 1 * USEC_PER_MSEC);
> +	if (err)
> +		pr_err("Power domain %s %sable failed: %d (%#.2x)\n",
> +		       domain->name, power_on ? "en" : "dis", err, val);

I've posted my 'tested-by' tag for this patchset, but in meantime I 
found that this patch causes regression from time to time on old Exynos 
SoCs (especially when all debugs are disabled). It looks that there are 
some subtle differences between reading the status register up to 10 
times with cpu_relax()+usleep_range() and the 
regmap_read_poll_timeout(). I will try to analyze this a bit more and 
provide details, but I suspect that the old loop might take a bit longer 
than the 1ms from the comment above this code.


>   	return err;
>   }
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


