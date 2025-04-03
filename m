Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16391C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 08:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWvO+78VAxjgQgIr3ZVahoSUSFMGJLmUIHRMvwyH8gs=; b=OnXDS1nQtuDAid94+76DbAO5VL
	Czpy6s0hG5vqSqU8htVDZ5wMnqEzY+SqpURG56Pe5VvsOno+sYm4DG7plvbuti6hFfX1k79ONeKit
	MlD0FybBpJEGSNdt96eKNCBRshmtFJpWbRer6psD8aidQ8rjjwiadMPJlxZOhguFsM8//qYtPbqRx
	bbbx6J/ZoLAc3jZwetaPDQg8eoyvGHL4poHJjX59fJJYC+QpK/Yvw2kURZLILo7BSV9v6dpPKugLc
	nhiFrNovS/ZzQpt55JabSi61RFu7Q6gerV18SsE7Z+tTdyrHGzC7W9wSkF9XwfXyLnivPJ6VlWelP
	/M6sv0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FeM-00000008DdI-0pbw;
	Thu, 03 Apr 2025 08:10:10 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Fca-00000008DYg-3MDQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:08:22 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53388HUl3643485
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Apr 2025 03:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743667697;
	bh=fWvO+78VAxjgQgIr3ZVahoSUSFMGJLmUIHRMvwyH8gs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Nddxr9EmmQwhRueoouymrUOk9b9ipC1PxiXGOXXZT9EX3xjFoQ4azdrCtwuPo4N+e
	 N6nCCYCNPy6scmQrhAY+/boodmgzfi2Eu5VgfWczY0icfWAbLZkjvIan3GEqeOgAzY
	 eQCJfhDU2nsFBbWkhDPTJ4Oey4yUjj9kW2FornMs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53388HkV007541
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 3 Apr 2025 03:08:17 -0500
Received: from lewvowa01.ent.ti.com (10.180.75.79) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 3
 Apr 2025 03:08:16 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by lewvowa01.ent.ti.com
 (10.180.75.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Thu, 3 Apr
 2025 03:08:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 3 Apr 2025 03:08:16 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53388GeN050233;
	Thu, 3 Apr 2025 03:08:16 -0500
Date: Thu, 3 Apr 2025 13:38:15 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pmdomain: core: Reset genpd->states to avoid freeing
 invalid data
Message-ID: <20250403080815.jsdoydcczkeuvmy6@lcpd911>
References: <20250402120613.1116711-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250402120613.1116711-1-ulf.hansson@linaro.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_010820_934906_EF14BA07 
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

On Apr 02, 2025 at 14:06:13 +0200, Ulf Hansson wrote:
> If genpd_alloc_data() allocates data for the default power-states for the
> genpd, let's make sure to also reset the pointer in the error path. This
> makes sure a genpd provider driver doesn't end up trying to free the data
> again, but using an invalid pointer.

I maybe missing something but if kfree works similar to [1]GNU free() won't
it make the genpd->states NULL anyway? Have you actually seen scenarios
where the genpd->states is remaining non-NULL even after kfree?

[1]
https://www.gnu.org/software/libc/manual/html_node/Freeing-after-Malloc.html#:~:text=The%20free%20function%20deallocates%20the%20block%20of%20memory%20pointed%20at%20by%20ptr%20.&text=Occasionally%2C%20free%20can%20actually%20return,malloc%20to%20reuse%20the%20space.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/pmdomain/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 9b2f28b34bb5..c179464047fe 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2229,8 +2229,10 @@ static int genpd_alloc_data(struct generic_pm_domain *genpd)
>  	return 0;
>  put:
>  	put_device(&genpd->dev);
> -	if (genpd->free_states == genpd_free_default_power_state)
> +	if (genpd->free_states == genpd_free_default_power_state) {
>  		kfree(genpd->states);
> +		genpd->states = NULL;

Also the coding convention for kfree in other places in pmdomains
doesn't seem to follow this practise either...

$> rg -A1 kfree drivers/pmdomain

Is this something we're planning to start following in pmdomains from
now on?

> +	}
>  free:
>  	if (genpd_is_cpu_domain(genpd))
>  		free_cpumask_var(genpd->cpus);
> -- 
> 2.43.0
> 
> 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

