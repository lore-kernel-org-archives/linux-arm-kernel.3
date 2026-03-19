Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58064108E1DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 10:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKAPmcA2X9Bm9pJ7T+wzs/NFBFfUIopHAZt+of0O0TE=; b=C4q+p7C/CtBXZ9XYkP1Hn/o39M
	3a7FlZ4vlLqxj7/mxNkF/5FD5rNDmjyfkiLbR1Ayx1vRvSNUJW+ht8QgoFr1+MXNiZwj5tVEkubJN
	7JN5WNg5MR+Bf0mrIYHa7hSjmvNBbrllnb0fTRl61e34ooyTkvZ9jI/rDNo38aLt1K0dK0YgPn/rj
	SwgEKmE5V53ZJbNkVT4628hteD7S5FZl94DOCKNezcD4vkcHZAoYKvP5VPJox5UBdRESDi6Cx0A5t
	56ojLkWyYm+yGjdane9FY/P08iqYlgoeJaxdISlwjU+EMKl36zkV/Il4oY4Rt8kOx1CWHC4frNK/f
	I86j9P9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ada-0000000APsH-1dgv;
	Thu, 19 Mar 2026 10:29:58 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3AdW-0000000APrT-27v0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 10:29:57 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260319102948euoutp026482e196f4aba78a23f9b8848052e404~eN2AR7puy1781617816euoutp02-
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 10:29:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260319102948euoutp026482e196f4aba78a23f9b8848052e404~eN2AR7puy1781617816euoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1773916189;
	bh=uKAPmcA2X9Bm9pJ7T+wzs/NFBFfUIopHAZt+of0O0TE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=C7xqy6XartaJebAc/mio76XJgysOea9Dhzs17asXEowNuhnl4+zZPcqEs2aitk7Dw
	 rx9J3fgwC7hVscoeFHjVoqHtn7LNCEL6lP6m2NHLhc/iouWTgywbvvbRGo6O6wySyS
	 ADC4nFYUa7UILv6G6+6jFPm9zHvZNkSXdkjjWl+8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260319102948eucas1p19b0586ca5935a60f9d5bcea3bbbccdac~eN1-1Tym32451224512eucas1p1g;
	Thu, 19 Mar 2026 10:29:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260319102947eusmtip1f9e65f8316f14e8d08a56aea54338db7~eN1_23p1d2191621916eusmtip1f;
	Thu, 19 Mar 2026 10:29:47 +0000 (GMT)
Message-ID: <c5ba58fb-50f1-4067-a099-97169ea81f68@samsung.com>
Date: Thu, 19 Mar 2026 11:29:46 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v8 05/10] pmdomain: samsung: convert to using regmap
To: Ulf Hansson <ulf.hansson@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
	<andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam
	Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter
	Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, Will McVicker
	<willmcvicker@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAPDyKFrprMSLOBMB_BHbi=j6UXV4dXBn-H8M1BsqDWNSCJwvuA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260319102948eucas1p19b0586ca5935a60f9d5bcea3bbbccdac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260319101424eucas1p2d5dca06240e8760046fb40507ffb3bba
X-EPHeader: CA
X-CMS-RootMailID: 20260319101424eucas1p2d5dca06240e8760046fb40507ffb3bba
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
	<20260318-gs101-pd-v8-5-241523460b10@linaro.org>
	<CGME20260319101424eucas1p2d5dca06240e8760046fb40507ffb3bba@eucas1p2.samsung.com>
	<CAPDyKFrprMSLOBMB_BHbi=j6UXV4dXBn-H8M1BsqDWNSCJwvuA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_032955_118978_E14C292B 
X-CRM114-Status: GOOD (  22.06  )
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

On 19.03.2026 11:13, Ulf Hansson wrote:
> On Wed, 18 Mar 2026 at 16:28, André Draszik <andre.draszik@linaro.org> wrote:
>> On platforms such as Google gs101, direct mmio register access to the
>> PMU registers doesn't necessarily work and access must happen via a
>> regmap created by the PMU driver instead.
>>
>> In preparation for supporting such SoCs convert the existing mmio
>> accesses to using a regmap wrapper.
>>
>> With this change in place, a follow-up patch can update the driver to
>> optionally acquire the PMU-created regmap without having to change the
>> rest of the code.
>>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> [...]
>
>> @@ -36,31 +35,42 @@ struct exynos_pm_domain {
>>   static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
>>   {
>>          struct exynos_pm_domain *pd;
>> -       void __iomem *base;
>>          u32 timeout, pwr;
>> -       char *op;
>> +       int err;
>>
>>          pd = container_of(domain, struct exynos_pm_domain, pd);
>> -       base = pd->base;
>>
>>          pwr = power_on ? pd->local_pwr_cfg : 0;
>> -       writel_relaxed(pwr, base);
>> +       err = regmap_write(pd->regmap, 0, pwr);
>> +       if (err) {
>> +               pr_err("Regmap write for power domain %s %sable failed: %d\n",
>> +                      domain->name, power_on ? "en" : "dis", err);
>> +               return err;
>> +       }
>>
>>          /* Wait max 1ms */
>>          timeout = 10;
>> -
>> -       while ((readl_relaxed(base + 0x4) & pd->local_pwr_cfg) != pwr) {
>> -               if (!timeout) {
>> -                       op = (power_on) ? "enable" : "disable";
>> -                       pr_err("Power domain %s %s failed\n", domain->name, op);
>> -                       return -ETIMEDOUT;
>> +       while (timeout-- > 0) {
>> +               unsigned int val;
>> +
>> +               err = regmap_read(pd->regmap, 0x4, &val);
>> +               if (err || ((val & pd->local_pwr_cfg) != pwr)) {
>> +                       cpu_relax();
>> +                       usleep_range(80, 100);
>> +                       continue;
>>                  }
>> -               timeout--;
>> -               cpu_relax();
>> -               usleep_range(80, 100);
>> +
>> +               break;
>>          }
>>
> [...]
>
> As a follow-up patch on top, please consider converting the open-coded
> polling loop above into a readx_poll_timeout_atomic().

This has been tried and it doesn't work in all cases required for power 
domain driver:

https://lore.kernel.org/all/5c19e4ef-c4fd-4bf5-88b3-46c86751b14e@samsung.com/

Probably a comment about that could be added directly to this code to 
avoid such conversion and breakage in the future.

> That said, the series looks ready to me, but I am awaiting an ack from
> a DT maintainer on patch4 before applying.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


