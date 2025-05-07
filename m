Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73179C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Bj8KOiEcnsmz5xmKsrZ1JKbRMUANWee2a/AUbn8PbY=; b=Y++HzBk5xa2N+C0y072TT4HZlG
	5ACQRc75D6jZp65sD9iiSOMXbdzwPAkK2F7E50AofbYrKuxustR2snIQSBdYyGBf6Y/xbDqZF2ONK
	i0vM7ueosuBMMUg/9o9wvKGKRO+ANb2u1iEuWRjB8bmEhZuz6UT9BqGWUx4jgE98M/e0f7k5JawZ1
	OxALtrkv57MAqtnnQMFHCryAU9eYz66qI+j7SkCjACJ+27Dx2hkUZwifEvpW3O9rzf3VBzjMgDtQj
	R7UQJ1ORUw89gjcj67sMKat/Pv24nsBvmN/bRC2bHBsmT9XhTCDqEWh1bxCP1UKNqIEfDTwnuiBNY
	OFp69R0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiX6-0000000GIqU-0V9Y;
	Wed, 07 May 2025 17:26:12 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChII-0000000G68f-1fuN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 16:06:51 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547DogUs012755;
	Wed, 7 May 2025 18:06:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	6Bj8KOiEcnsmz5xmKsrZ1JKbRMUANWee2a/AUbn8PbY=; b=G25/85P6kJWaHyE/
	U/FFOlfzznc+gVOlABxZ9/bsW8itl+DseWaOjVsmFvMOevmL1rJcWEkOZkJh5KOe
	ZeEtlAyGg6GUm0t0rg6l67b085C/42/s1G6ZlW32HRhiAfPFuS/U8RRTcq6FOI0m
	XCl/5hti/bkt/k3xYXzJVmbBwFJtnxpwXPBn8cVOWnCLu00qH9H0YBeY02FrarzY
	kG7LiKj1jVVuGqxW5JYCxFNAyHrqY6XcQ8u8i/ZZ4mI8H9nHwAmBAo0oI/zjFYkw
	4yGomokhAL4MHWhiDr1yBReNL/oFC1goaoSh5nH6xQCOa7p54TEgLF4y9QtZxpUj
	mPxHyQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dbf3h3fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 18:06:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7E4AD40088;
	Wed,  7 May 2025 18:05:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F20EEA56C3E;
	Wed,  7 May 2025 18:04:33 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 18:04:33 +0200
Message-ID: <721ec8c6-ceb5-4e6c-91f6-2e234f12ff2b@foss.st.com>
Date: Wed, 7 May 2025 18:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
To: Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250411-b4-upstream_ospi_reset_update-v2-0-4de7f5dd2a91@foss.st.com>
 <20250411-b4-upstream_ospi_reset_update-v2-2-4de7f5dd2a91@foss.st.com>
 <3685c6351d8b940abe70ccf22d783e71ced6f6da.camel@pengutronix.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <3685c6351d8b940abe70ccf22d783e71ced6f6da.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_05,2025-05-06_01,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_090650_713702_44ECA47E 
X-CRM114-Status: GOOD (  15.91  )
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



On 5/5/25 15:12, Philipp Zabel wrote:
> Hi Patrice,
> 
> On Fr, 2025-04-11 at 14:41 +0200, Patrice Chotard wrote:
>> As ospi reset is consumed by both OMM and OSPI drivers, use the reset
>> acquire/release mechanism which ensure exclusive reset usage.
>>
>> This avoid to call reset_control_get/put() in OMM driver each time
>> we need to reset OSPI children and guarantee the reset line stays
>> deasserted.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>  drivers/spi/spi-stm32-ospi.c | 15 +++++++++------
>>  1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
>> index d002b9c16714684e4e4623f9255a7f2660c46fd1..ef840f377459891b559be6d6c0435408fb58a1e9 100644
>> --- a/drivers/spi/spi-stm32-ospi.c
>> +++ b/drivers/spi/spi-stm32-ospi.c
>> @@ -804,7 +804,7 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
>>  		return ret;
>>  	}
>>  
>> -	ospi->rstc = devm_reset_control_array_get_exclusive(dev);
>> +	ospi->rstc = devm_reset_control_array_get_exclusive_released(dev);
>>  	if (IS_ERR(ospi->rstc))
>>  		return dev_err_probe(dev, PTR_ERR(ospi->rstc),
>>  				     "Can't get reset\n");
>> @@ -936,11 +936,14 @@ static int stm32_ospi_probe(struct platform_device *pdev)
>>  	if (ret < 0)
>>  		goto err_pm_enable;
>>  
>> -	if (ospi->rstc) {
>> -		reset_control_assert(ospi->rstc);
>> -		udelay(2);
>> -		reset_control_deassert(ospi->rstc);
>> -	}
>> +	ret = reset_control_acquire(ospi->rstc);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Can not acquire reset %d\n", ret);
>> +
>> +	reset_control_assert(ospi->rstc);
>> +	udelay(2);
>> +	reset_control_deassert(ospi->rstc);
>> +	reset_control_release(ospi->rstc);
> 
> Could you keep the reset control (mostly) acquired from probe() to
> remove()? The reset control would have to be released/acquired in OSPI
> suspend/resume so that OMM can temporarily acquire control during OMM
> resume.

Ok

Thanks
Patrice

> 
> regards
> Philipp

