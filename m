Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C34C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 22:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anUu0iGZccTAr7XKInCn6vxxWIjEHT78iPCZEky3scE=; b=N9eCIYmYLETdqG+/bSNWL6X4x1
	0rEBYjagaEXy0n4xq/hu89UQKq30firtuRV5a9RHiTrFCG64bvpMGriXtkdFCIdetP96UG0oSEcwy
	lS8U6GDIcSIMs5fvIzVUvabUZu4chSMnAS8hhcbpG9YtadKzaWudYwSUHvUBHoZXz5f90AVg/gCYa
	UGes+3Hlt9MdlapiQinbCGQz4XHpTdgMJ5ePs75GkITMUVikRGWLyS76zkhh8wTA1sVUlJ8/PoBx8
	l++QjuUqfarV9SWfXyNksSmNeteVUGaMO0LkxnL5Ck/oQf1bllYE7U+cdfnNNLKGYeXIx/PoQHKIg
	FQbpbD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8vH-00000001cHn-1uTn;
	Thu, 07 Aug 2025 22:17:19 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8sj-00000001bv5-2cWF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 22:14:43 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 577MEVZE405890;
	Thu, 7 Aug 2025 17:14:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754604871;
	bh=anUu0iGZccTAr7XKInCn6vxxWIjEHT78iPCZEky3scE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CiZ4Zq6kiEhHmG7UmhDjYE5gzTT8qkzVCiAa1gzKZi8NpwWxQY+eJwdkmzMzimYgL
	 agpB0mzogoK2brivLEV+yE5zm3PqvDZFux9WN3292jXkezgMVcSAjpHreXVyljw4kA
	 tFktZmmZDryX4fW1KRgoD6BmFV2mO8RP6wW5Dr54=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 577MEVlx1118947
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 7 Aug 2025 17:14:31 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 7
 Aug 2025 17:14:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 7 Aug 2025 17:14:31 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 577MEVAV2047321;
	Thu, 7 Aug 2025 17:14:31 -0500
Message-ID: <f5b48a22-b036-4df0-b68d-0606b1bc454d@ti.com>
Date: Thu, 7 Aug 2025 17:14:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mmc: sdhci_am654: Disable HS400 for AM62P SR1.0 and
 SR1.1
To: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>
References: <20250805234950.3781367-1-jm@ti.com>
 <20250805234950.3781367-4-jm@ti.com>
 <1f424bbd-3830-41f9-af4b-9d17af42edaa@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <1f424bbd-3830-41f9-af4b-9d17af42edaa@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_151441_792400_EB0B8A32 
X-CRM114-Status: GOOD (  16.05  )
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

Hi Andrew,

On 8/7/25 12:28 PM, Andrew Davis wrote:
> On 8/5/25 6:49 PM, Judith Mendez wrote:
>> This adds SDHCI_AM654_QUIRK_DISABLE_HS400 quirk which shall be used
>> to disable HS400 support. AM62P SR1.0 and SR1.1 do not support HS400
>> due to errata i2458 [0] so disable HS400 for these SoC revisions.
>>
>> [0] https://www.ti.com/lit/er/sprz574a/sprz574a.pdf
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   drivers/mmc/host/sdhci_am654.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci_am654.c 
>> b/drivers/mmc/host/sdhci_am654.c
>> index e4fc345be7e5..b7d2adff3277 100644
>> --- a/drivers/mmc/host/sdhci_am654.c
>> +++ b/drivers/mmc/host/sdhci_am654.c
>> @@ -156,6 +156,7 @@ struct sdhci_am654_data {
>>   #define SDHCI_AM654_QUIRK_FORCE_CDTEST BIT(0)
>>   #define SDHCI_AM654_QUIRK_SUPPRESS_V1P8_ENA BIT(1)
>> +#define SDHCI_AM654_QUIRK_DISABLE_HS400 BIT(2)
>>   };
>>   struct window {
>> @@ -820,6 +821,9 @@ static int sdhci_am654_init(struct sdhci_host *host)
>>       if (ret)
>>           goto err_cleanup_host;
>> +    if (sdhci_am654->quirks & SDHCI_AM654_QUIRK_DISABLE_HS400)
>> +        host->mmc->caps2 &= ~(MMC_CAP2_HS400 | MMC_CAP2_HS400_ES);
>> +
>>       ret = __sdhci_add_host(host);
>>       if (ret)
>>           goto err_cleanup_host;
>> @@ -883,6 +887,12 @@ static int sdhci_am654_get_of_property(struct 
>> platform_device *pdev,
>>       return 0;
>>   }
>> +static const struct soc_device_attribute sdhci_am654_descope_hs400[] = {
>> +    { .family = "AM62PX", .revision = "SR1.0" },
>> +    { .family = "AM62PX", .revision = "SR1.1" },
>> +    { /* sentinel */ }
>> +};
>> +
>>   static const struct of_device_id sdhci_am654_of_match[] = {
>>       {
>>           .compatible = "ti,am654-sdhci-5.1",
>> @@ -970,6 +980,12 @@ static int sdhci_am654_probe(struct 
>> platform_device *pdev)
>>       if (ret)
>>           return dev_err_probe(dev, ret, "parsing dt failed\n");
>> +    soc = soc_device_match(sdhci_am654_descope_hs400);
>> +    if (soc) {
>> +        dev_err(dev, "Disable descoped HS400 mode for this silicon 
>> revision\n");
> 
> Not really an error, use dev_info() or dev_warn(). Also this message
> should go up in the init function when the caps are actually removed,
> and only printed if the caps were set in the first place.

Will fix for v2, thanks

~ Judith


