Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634F8C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 13:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kDealCV6zffo4RuWYcZVJvSwU3t4q0xUuFSOKLwc8Q=; b=zEId10iimDtauxEXSX9t3ICJsU
	hKVmPQsveGg/2WZNNDigL2yAYMIZvq8YQJkwdY1d47Ym8pzCiiaj8iipXc+oL3kEMNUUchkYkTuJX
	uN+6kkOoBPGtlW9IBDzGgyM0Me1feRvtdqOOaiwvJ0HJyJcKwqoChmWN8KaeFgbaxwQiCEWTVev7a
	y4xGQgnI0WWn1zBO1zn1S+3GVZkNsANIEq7yeLxQ+pZxW+oCFtf6vt35TbYb0DBF2JX4BmGUbDQh5
	RY0/E1dQJtIpDTxQ4Uw0nHffkabHse1wnaVnnq2YxHUp6G7W3MkfKTqLU46XLb9EKPtqhTO9SB43C
	uuIocDTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDOy-0000000EotB-3rGJ;
	Fri, 11 Jul 2025 13:02:56 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDLO-0000000Eo75-0gFZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 12:59:16 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250711125907euoutp0291d1672883485984517fdce70f9769d3~RM9ty4Twb0139601396euoutp02M
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 12:59:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250711125907euoutp0291d1672883485984517fdce70f9769d3~RM9ty4Twb0139601396euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752238747;
	bh=3kDealCV6zffo4RuWYcZVJvSwU3t4q0xUuFSOKLwc8Q=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=sJIjFK2hjreora6isCVF4sSwqZooR1YZAfTELwJUidrX9mSB+CTKpaGsUaO80uubv
	 L1R7wxFaNIcD/bGKEGPmwl17W6BB26vIBjVCBSJufCtaLiw11GRKlqUzegaaZtpWLk
	 vmvRRgAvTAQIkL7Oet0Qxrt9jxXynaxQKN4XuPsc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250711125906eucas1p1bdd63ed78efdc9e1ed419e3765f939c2~RM9tLOVmS2722427224eucas1p1u;
	Fri, 11 Jul 2025 12:59:06 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250711125906eusmtip1d00d7a0a16b6f50ed698eeeab2ff3a30~RM9saRIS00427404274eusmtip1O;
	Fri, 11 Jul 2025 12:59:06 +0000 (GMT)
Message-ID: <751b912d-48a5-416d-aa83-8947b952dd5e@samsung.com>
Date: Fri, 11 Jul 2025 14:59:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: samsung: Fix splash-screen handover by
 enforcing a sync_state
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250711114719.189441-1-ulf.hansson@linaro.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250711125906eucas1p1bdd63ed78efdc9e1ed419e3765f939c2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250711114739eucas1p2e3b4b266d24dc239b8ef4f75da06e40b
X-EPHeader: CA
X-CMS-RootMailID: 20250711114739eucas1p2e3b4b266d24dc239b8ef4f75da06e40b
References: <CGME20250711114739eucas1p2e3b4b266d24dc239b8ef4f75da06e40b@eucas1p2.samsung.com>
	<20250711114719.189441-1-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_055914_805154_4EF1FBB4 
X-CRM114-Status: GOOD (  23.38  )
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

On 11.07.2025 13:47, Ulf Hansson wrote:
> It's has been reported that some Samsung platforms fails to boot with
> genpd's new sync_state support.
>
> Typically the problem exists for platforms where bootloaders are turning on
> the splash-screen and handing it over to be managed by the kernel. However,
> at this point, it's not clear how to correctly solve the problem.
>
> Although, to make the platforms boot again, let's add a temporary hack in
> the samsung power-domain provider driver, which enforces a sync_state that
> allows the power-domains to be reset before consumer devices starts to be
> attached.
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Link: https://lore.kernel.org/all/212a1a56-08a5-48a5-9e98-23de632168d0@samsung.com
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

This fixes the issue and seems to be a good workaround for now. Thanks!

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

I will work on the proper fix in 2 weeks after getting back from holidays.


> ---
>   drivers/pmdomain/samsung/exynos-pm-domains.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
> index 9b502e8751d1..5d478bb37ad6 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -147,6 +147,15 @@ static int exynos_pd_probe(struct platform_device *pdev)
>   				parent.np, child.np);
>   	}
>   
> +	/*
> +	 * Some Samsung platforms with bootloaders turning on the splash-screen
> +	 * and handing it over to the kernel, requires the power-domains to be
> +	 * reset during boot. As a temporary hack to manage this, let's enforce
> +	 * a sync_state.
> +	 */
> +	if (!ret)
> +		of_genpd_sync_state(np);
> +
>   	pm_runtime_enable(dev);
>   	return ret;
>   }

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


