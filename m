Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9782C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 13:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fY6ITv0IOCwAWvbopI78ay0Ho+0F53h/qZ6BsbQ7c3Q=; b=fJphH5nPC8MTj7hQ6wQmkBljvp
	ON0JNaWVZUG5TGjgPq6nemKn0Aqqp88kjSsuIXJtcVbsdjy/N0iBD/ixeECewxJjqdQJlF7H7c5WG
	MzhlTfQIF9Lcj8EpvBtjGjAKPecokkSUlXs9aGXfB2SvF5nZ6TiIHJW9PizIC5F+vl3KftKVzWm8E
	c2mljoXO4Su0RhlzcCiy0APZTegMD//nZ6ZJUE6apEPJVSNErtBvfNRBb6/q+EAYQQon7vcOTOlBs
	phcbxCE91ydjNxEEeKBaRWQhy+mePSzmq2+XwalmhtjibAcAzF9xJXHAJswvMRfRGA8IrEuNFA4X6
	pJREGGaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNL1-00000002wST-2bjn;
	Fri, 08 Aug 2025 13:40:51 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukNIV-00000002wCz-09WD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 13:38:16 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 578Dc9A8991745;
	Fri, 8 Aug 2025 08:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754660289;
	bh=fY6ITv0IOCwAWvbopI78ay0Ho+0F53h/qZ6BsbQ7c3Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=D3utI2E5WFPqamVWrVO4a81tSwdLi0z6mOuyh7BD0sJ/1z2h91QIRwCJetoQbOosH
	 0wNxxvKkaMDf1KPSgEy9X/7q+tIxDvs/w7brC8w/24O0bu6gQY4ANOJWLgEqJ1r28Q
	 rVJIMxchuHyliXWThmBJRm4QQK97skudF8D4IpeA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 578Dc91U520915
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 8 Aug 2025 08:38:09 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 8
 Aug 2025 08:38:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 8 Aug 2025 08:38:08 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 578Dc8OD3118894;
	Fri, 8 Aug 2025 08:38:09 -0500
Message-ID: <16fac32a-a42a-4ec8-b0a2-3efe785af728@ti.com>
Date: Fri, 8 Aug 2025 08:38:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mmc: sdhci_am654: Disable HS400 for AM62P SR1.0
 and SR1.1
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Nishanth Menon <nm@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Andrew Davis <afd@ti.com>
References: <20250807225138.1228333-1-jm@ti.com>
 <20250807225138.1228333-3-jm@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250807225138.1228333-3-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_063815_357376_57DF34FC 
X-CRM114-Status: GOOD (  17.72  )
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

Hi all,

On 8/7/25 5:51 PM, Judith Mendez wrote:
> This adds SDHCI_AM654_QUIRK_DISABLE_HS400 quirk which shall be used
> to disable HS400 support. AM62P SR1.0 and SR1.1 do not support HS400
> due to errata i2458 [0] so disable HS400 for these SoC revisions.
> 
> [0] https://www.ti.com/lit/er/sprz574a/sprz574a.pdf
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   drivers/mmc/host/sdhci_am654.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
> index e4fc345be7e5..dc4975514847 100644
> --- a/drivers/mmc/host/sdhci_am654.c
> +++ b/drivers/mmc/host/sdhci_am654.c
> @@ -156,6 +156,7 @@ struct sdhci_am654_data {
>   
>   #define SDHCI_AM654_QUIRK_FORCE_CDTEST BIT(0)
>   #define SDHCI_AM654_QUIRK_SUPPRESS_V1P8_ENA BIT(1)
> +#define SDHCI_AM654_QUIRK_DISABLE_HS400 BIT(2)
>   };
>   
>   struct window {
> @@ -765,6 +766,7 @@ static int sdhci_am654_init(struct sdhci_host *host)
>   {
>   	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>   	struct sdhci_am654_data *sdhci_am654 = sdhci_pltfm_priv(pltfm_host);
> +	struct device *dev = mmc_dev(host->mmc);
>   	u32 ctl_cfg_2 = 0;
>   	u32 mask;
>   	u32 val;
> @@ -820,6 +822,12 @@ static int sdhci_am654_init(struct sdhci_host *host)
>   	if (ret)
>   		goto err_cleanup_host;
>   
> +	if (sdhci_am654->quirks & SDHCI_AM654_QUIRK_DISABLE_HS400 &&
> +	    host->mmc->caps2 & (MMC_CAP2_HS400 | MMC_CAP2_HS400_ES)) {
> +		dev_err(dev, "Disable descoped HS400 mode for this silicon revision\n");

Forgot to switch to dev_info, so will respin the series one more time.

Sorry for the noise.

~ Judith


