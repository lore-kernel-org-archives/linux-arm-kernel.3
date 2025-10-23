Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEFFCCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 12:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDw1nU8NLSxSa1gqia5h1scw7MTd+jhxy/PnLfCJ7Ks=; b=20+ii8UzUi6iVleFPZ1lEKfM6f
	rlhsIdyPsVDJ7H5fItqu+9p4k8UW0+rHBodY3kV3IXeTPiTRE0JtkkPu3H7Hd2JU9l9aTEgkUvuQg
	3kyRXQK/hYsYQQjyqSa3QrZlDbgc9dYQFMvBrUy/y0L11KtIfyRZOXt+YZN27LTGMGRG9SlQG47B1
	jkDoZM8gYwagqmFIkbAp7Lotu8XnXVJZr0GrnW0Ex2A0PA8AlnNVWlmtgRPDnktpvtbQi9snuwRKF
	Rhvx1u5q9fkEY1YJS6gPpbGr5Ux20PXLzq7iorwrMkPj+005Wp4I41DtK+e9BQnspPIIMHRY+SfID
	IZjxxscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuGE-00000006DPl-1nPX;
	Thu, 23 Oct 2025 12:17:42 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuGA-00000006DP4-0gzl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 12:17:41 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251023121731euoutp021c0fb37ccd87cad27ef41dc87c998abf~xHfFdqJq02913629136euoutp02k
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 12:17:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251023121731euoutp021c0fb37ccd87cad27ef41dc87c998abf~xHfFdqJq02913629136euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761221851;
	bh=lDw1nU8NLSxSa1gqia5h1scw7MTd+jhxy/PnLfCJ7Ks=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=V/n3wje2NJ8BLnwg4s18POq8rtSsar9kusWHxsaqF6P6x7rE7TlW2AXwY0m8nlusL
	 gt9HOPbivaiRXi7/VjOQCzlfIXrNQuh03yLkOxYJdL7QuENCB/JBu0r5qvOiHzvE3k
	 fVRpmi0ayFia6n07qcc/goyMfIszhKGBRvYk/3oM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251023121731eucas1p101ee5675a1effd61f7bbd504b018f529~xHfE-GNtq0073800738eucas1p15;
	Thu, 23 Oct 2025 12:17:31 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251023121730eusmtip29e2f973850b2c55d974387409fea4f03~xHfEBdNx52867328673eusmtip2p;
	Thu, 23 Oct 2025 12:17:30 +0000 (GMT)
Message-ID: <cca286f5-bb43-4914-864c-b5e5c73270c8@samsung.com>
Date: Thu, 23 Oct 2025 14:17:29 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 08/10] pmdomain: samsung: selectively handle enforced
 sync_state
To: Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
	<willmcvicker@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAPDyKFrCS1PGwPeZd2ahZ=wKXCqPj93qAJ7V-ELELLA_OwgdSw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251023121731eucas1p101ee5675a1effd61f7bbd504b018f529
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251022110738eucas1p2cee28096ca5c9c6a802e2190d88ccf21
X-EPHeader: CA
X-CMS-RootMailID: 20251022110738eucas1p2cee28096ca5c9c6a802e2190d88ccf21
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
	<20251016-gs101-pd-v3-8-7b30797396e7@linaro.org>
	<CGME20251022110738eucas1p2cee28096ca5c9c6a802e2190d88ccf21@eucas1p2.samsung.com>
	<CAPDyKFq2esPos=D-eVz6w1VXq=4LYi6fx54K4TvsUi4JqUJOaQ@mail.gmail.com>
	<57bacc06-8a5e-4284-a520-c5d2a56545e9@samsung.com>
	<CAPDyKFrCS1PGwPeZd2ahZ=wKXCqPj93qAJ7V-ELELLA_OwgdSw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_051739_672285_3CFE3C58 
X-CRM114-Status: GOOD (  27.12  )
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

On 23.10.2025 12:02, Ulf Hansson wrote:
> On Wed, 22 Oct 2025 at 20:39, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> On 22.10.2025 13:06, Ulf Hansson wrote:
>>> On Thu, 16 Oct 2025 at 17:58, André Draszik <andre.draszik@linaro.org> wrote:
>>>> Unconditionally calling of_genpd_sync_state() causes issues on
>>>> platforms with child domains as the parent domain will be turned off
>>>> before the child domain was even registered during boot.
>>>>
>>>> This in particular is an issue for the upcoming Google gs101 support -
>>>> all operations on child domains registered after the parent domain
>>>> misbehave.
>>>>
>>>> Add a flag to the probe data to be able to sync_state conditionally
>>>> only, and enable that flag on the two platforms currently supported by
>>>> this driver.
>>>>
>>>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
>>>>
>>>> ---
>>>> v2:
>>>> * use bool for need_early_sync_state (Krzysztof)
>>>> ---
>>>>    drivers/pmdomain/samsung/exynos-pm-domains.c | 5 ++++-
>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
>>>> index 638d286b57f716140b2401092415644a6805870e..15a1582aa92103a07335eb681600d9415369fefd 100644
>>>> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
>>>> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
>>>> @@ -20,6 +20,7 @@
>>>>    struct exynos_pm_domain_config {
>>>>           /* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
>>>>           u32 local_pwr_cfg;
>>>> +       bool need_early_sync_state;
>>>>    };
>>>>
>>>>    /*
>>>> @@ -69,10 +70,12 @@ static int exynos_pd_power_off(struct generic_pm_domain *domain)
>>>>
>>>>    static const struct exynos_pm_domain_config exynos4210_cfg = {
>>>>           .local_pwr_cfg          = 0x7,
>>>> +       .need_early_sync_state  = true,
>>>>    };
>>>>
>>>>    static const struct exynos_pm_domain_config exynos5433_cfg = {
>>>>           .local_pwr_cfg          = 0xf,
>>>> +       .need_early_sync_state  = true,
>>>>    };
>>>>
>>>>    static const struct of_device_id exynos_pm_domain_of_match[] = {
>>>> @@ -179,7 +182,7 @@ static int exynos_pd_probe(struct platform_device *pdev)
>>>>            * reset during boot. As a temporary hack to manage this, let's enforce
>>>>            * a sync_state.
>>>>            */
>>>> -       if (!ret)
>>>> +       if (pm_domain_cfg->need_early_sync_state && !ret)
>>>>                   of_genpd_sync_state(np);
>>> The call to of_genpd_sync_state() was intended as a temporary solution here.
>>>
>>> Potentially, if we would be able to distinguish what PM domain that is
>>> causing the problem on the Exynos platforms, we could set
>>> GENPD_FLAG_NO_STAY_ON for that genpd instead.
>> Well, this of_genpd_sync_state() "workaround" has to be applied only to
>> the power domain of the display controller device. It can be replaced by
>> the following check on the legacy Exynos systems:
>>
>> if (IS_ENABLED(CONFIG_ARM) &&
>> of_device_is_compatible(np, "samsung,exynos4210-pd") &&
>> (strstr(pd->pd.name, "LCD") || strstr(pd->pd.name, "DISP")))
>> pd->pd.flags = GENPD_FLAG_NO_STAY_ON;
> Oh wait, perhaps better to just power-off these PM domains before
> calling pm_genpd_init(), if that can be done safely?
>
> At least that would guarantee the reset to happen before the display
> driver gets probed. Instead of relying on genpd_power_off_unused()
> (late_initcall_sync) to do it.

Well, yes, this works too:

if ((of_device_is_compatible(np, "samsung,exynos4210-pd") &&
     (strstr(pd->pd.name, "LCD") || strstr(pd->pd.name, "DISP"))))
          exynos_pd_power_off(&pd->pd);

>> I assume that this information cannot be coded in device tree to make it
>> somehow generic...
> Right, in principle we would need a new DT property for a power-domain
> provider, like "broken-hw-reset", because we don't have a reset-line
> to pull.

It is not a matter of broken reset at all. It is a matter of software 
configuration and the lack of 'protocol' to pass the information that 
the display controller is configured to display splash screen from the 
system memory at given address and newly instantiated drivers must to be 
aware of that.

Turning display-related power domain off simply resets all that 
configuration, so drivers can start from good known 'unconfigured' state.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


