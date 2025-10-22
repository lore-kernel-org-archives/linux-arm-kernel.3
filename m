Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EC6CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 18:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wp7PQxwpEUaf4NDF7jDHZA4RAc1DRUXdHx0e2Vlvfqo=; b=4BxKvow1tiSKzJTensek76XVoR
	7lJCfs24+fXTqccAd3GYLWQTwipclKPOiC64EoVrV/StC1d8aT+4u+MyQNylyeuh8IPT8AVmI45yI
	Dxw5hlPLAa3d8k3kOJdpf6icxApdL7WSaol9h/dq9euuJloPEJdXy4uBGN4wjbXpz4QNpuAuVG+1y
	bMtQCABVfs7FLW1HOSeJ0zzdcAlxaCfUPWi3Q/pvZhMSD5eN/+To64NVSdY+8LYHrs9JsG/eSgH3A
	KkCnThbqLrDQbOqWCcGLR6B42gGUvPX+7E/0Zxr7qyr3sKYtBkd1ezcJovOge4xCyhg+TQ+KPHzxv
	6weQBb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdkn-000000041an-2ih4;
	Wed, 22 Oct 2025 18:40:09 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdkg-000000041Uo-2dY0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 18:40:08 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251022183956euoutp013a8bcb2309734c825da9d6f1f6b2d665~w5Drz_rIl1219612196euoutp01_
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 18:39:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251022183956euoutp013a8bcb2309734c825da9d6f1f6b2d665~w5Drz_rIl1219612196euoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761158396;
	bh=Wp7PQxwpEUaf4NDF7jDHZA4RAc1DRUXdHx0e2Vlvfqo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=tNOgdzIWZtXNOZ/Hu/grKRy1A+gwmxnM47VoFiQiKQNuR9W0LmUvunUkvu9FtCdH3
	 gnDY6SgHxgHT8ebCxqR8dvZpfTxBGDc67utnUy3I3tECih9j19xdbSF9Ec/8Yq1yAp
	 l4ZiujU90fMBy4EJAgaVTe59N+5VAbU1bLmxYNEQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251022183955eucas1p23819de66a835c57747daa0136753c808~w5DrCgZAS0057800578eucas1p2Z;
	Wed, 22 Oct 2025 18:39:55 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251022183953eusmtip131c046506281f6642166831a3fe9c211~w5DpcncR60141601416eusmtip1Y;
	Wed, 22 Oct 2025 18:39:53 +0000 (GMT)
Message-ID: <57bacc06-8a5e-4284-a520-c5d2a56545e9@samsung.com>
Date: Wed, 22 Oct 2025 20:39:53 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 08/10] pmdomain: samsung: selectively handle enforced
 sync_state
To: Ulf Hansson <ulf.hansson@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
	<andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter
	Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>,
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAPDyKFq2esPos=D-eVz6w1VXq=4LYi6fx54K4TvsUi4JqUJOaQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251022183955eucas1p23819de66a835c57747daa0136753c808
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251022110738eucas1p2cee28096ca5c9c6a802e2190d88ccf21
X-EPHeader: CA
X-CMS-RootMailID: 20251022110738eucas1p2cee28096ca5c9c6a802e2190d88ccf21
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
	<20251016-gs101-pd-v3-8-7b30797396e7@linaro.org>
	<CGME20251022110738eucas1p2cee28096ca5c9c6a802e2190d88ccf21@eucas1p2.samsung.com>
	<CAPDyKFq2esPos=D-eVz6w1VXq=4LYi6fx54K4TvsUi4JqUJOaQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_114004_107323_3452C85F 
X-CRM114-Status: GOOD (  24.76  )
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

On 22.10.2025 13:06, Ulf Hansson wrote:
> On Thu, 16 Oct 2025 at 17:58, André Draszik <andre.draszik@linaro.org> wrote:
>> Unconditionally calling of_genpd_sync_state() causes issues on
>> platforms with child domains as the parent domain will be turned off
>> before the child domain was even registered during boot.
>>
>> This in particular is an issue for the upcoming Google gs101 support -
>> all operations on child domains registered after the parent domain
>> misbehave.
>>
>> Add a flag to the probe data to be able to sync_state conditionally
>> only, and enable that flag on the two platforms currently supported by
>> this driver.
>>
>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
>>
>> ---
>> v2:
>> * use bool for need_early_sync_state (Krzysztof)
>> ---
>>   drivers/pmdomain/samsung/exynos-pm-domains.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
>> index 638d286b57f716140b2401092415644a6805870e..15a1582aa92103a07335eb681600d9415369fefd 100644
>> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
>> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
>> @@ -20,6 +20,7 @@
>>   struct exynos_pm_domain_config {
>>          /* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
>>          u32 local_pwr_cfg;
>> +       bool need_early_sync_state;
>>   };
>>
>>   /*
>> @@ -69,10 +70,12 @@ static int exynos_pd_power_off(struct generic_pm_domain *domain)
>>
>>   static const struct exynos_pm_domain_config exynos4210_cfg = {
>>          .local_pwr_cfg          = 0x7,
>> +       .need_early_sync_state  = true,
>>   };
>>
>>   static const struct exynos_pm_domain_config exynos5433_cfg = {
>>          .local_pwr_cfg          = 0xf,
>> +       .need_early_sync_state  = true,
>>   };
>>
>>   static const struct of_device_id exynos_pm_domain_of_match[] = {
>> @@ -179,7 +182,7 @@ static int exynos_pd_probe(struct platform_device *pdev)
>>           * reset during boot. As a temporary hack to manage this, let's enforce
>>           * a sync_state.
>>           */
>> -       if (!ret)
>> +       if (pm_domain_cfg->need_early_sync_state && !ret)
>>                  of_genpd_sync_state(np);
> The call to of_genpd_sync_state() was intended as a temporary solution here.
>
> Potentially, if we would be able to distinguish what PM domain that is
> causing the problem on the Exynos platforms, we could set
> GENPD_FLAG_NO_STAY_ON for that genpd instead.

Well, this of_genpd_sync_state() "workaround" has to be applied only to 
the power domain of the display controller device. It can be replaced by 
the following check on the legacy Exynos systems:

if (IS_ENABLED(CONFIG_ARM) &&
of_device_is_compatible(np, "samsung,exynos4210-pd") && 
(strstr(pd->pd.name, "LCD") || strstr(pd->pd.name, "DISP"))) 
pd->pd.flags = GENPD_FLAG_NO_STAY_ON;

I assume that this information cannot be coded in device tree to make it 
somehow generic...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


