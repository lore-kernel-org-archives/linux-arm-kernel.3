Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31733C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 07:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rgaWbRTM+DFYeZhCEAh/L1Os9dQNFKUxR9CFmxIXbs=; b=mFoOAYmMZGbZidPOKi56DldeNr
	oB0pIp+x6Nv5PQpsivcSjdfrUnprdALiY2m3vp6VSrCOD6NPSqSFrcpejvyc5a5ulo/rgWxfUKSSh
	6jAD+bWqklYorQepLi9K2tnWPrxBtE6FQmN5Yfg4583n+wPSZb9i1M8iBV0qk8nA6/KNCtGaJsPYU
	DFeWsiGd8Lw9O9pb18rYzCQuZ5knmdB+mmwCW1vmq5ZSo9EALFAtccWZjK5zzbyxk7QZJYyhXGb2v
	/0U/62e7Puqcy1RiLOLZBed/rHQyUUU1Q99U5ucAmxWJWdPDJR283P01D9HR/rI73U3X2dj6S0a3F
	2Wy9XKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENAx-00000008aLS-0Zd9;
	Mon, 12 May 2025 07:02:11 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEN8t-00000008a1Z-2qrU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 07:00:06 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BKH5uc007926;
	Mon, 12 May 2025 08:59:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	6rgaWbRTM+DFYeZhCEAh/L1Os9dQNFKUxR9CFmxIXbs=; b=vLSNlWENDiCRu1IW
	mCs6uZ/MkOw7XXzo/sb5AMWYG4NB1tpUWC+ZEj+iMvOfFr2E08Z20YlKW96gCCXm
	gma/4apQEDcrfQmdAeyI9k0H5Y7tY0XuVp2X4TJX81sCTxLhjlB7YfSjzEqsVCCS
	9mfrpbCFbyAgXzgKQpX6cgPH5pQZoCvnPBrJrZFtD2KTrGd3bsYjHNWdo2O80Usq
	Yv1Wmj+24VKL45LhO2if/df+5W+TxZ+Fg4rb10T79qjZUSkWYJR++jzrrmIe8Y/x
	Hd/Dm7qoVfvX9xzl3O6L3HhSuyAQzXNqjPci+A7MLBSm07OUuHW9loKHr4YzPuDi
	EqJQpw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46huxa5gay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 08:59:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BD04140045;
	Mon, 12 May 2025 08:58:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D629A79D85;
	Mon, 12 May 2025 08:58:29 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 08:58:28 +0200
Message-ID: <3c655dad-270d-44e1-b20f-3b15f6cc06f1@foss.st.com>
Date: Mon, 12 May 2025 08:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
To: Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250507-b4-upstream_ospi_reset_update-v3-1-7e46a8797572@foss.st.com>
 <ee4e3e521434a0dadce058e7e5f3bbd77f598f90.camel@pengutronix.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ee4e3e521434a0dadce058e7e5f3bbd77f598f90.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_02,2025-05-09_01,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_000004_005549_9ABD4F25 
X-CRM114-Status: GOOD (  18.67  )
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



On 5/8/25 11:16, Philipp Zabel wrote:
> Hi Patrice,
> 
> On Mi, 2025-05-07 at 18:04 +0200, Patrice Chotard wrote:
>> As ospi reset is consumed by both OMM and OSPI drivers, use the reset
>> acquire/release mechanism which ensure exclusive reset usage.
>>
>> This avoid to call reset_control_get/put() in OMM driver each time
>> we need to reset OSPI children and guarantee the reset line stays
>> deasserted.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>> Changes in v3:
>>   - Remove previous patch 1/2 as already merged.
>>   - Keep the reset control acquired from probe() to remove().
>>   - Link to v2: https://lore.kernel.org/r/20250411-b4-upstream_ospi_reset_update-v2-0-4de7f5dd2a91@foss.st.com
>>
>> Changes in v2:
>>   - Rebased on spi/for-next (7a978d8fcf57).
>>   - Remove useless check on reset.
>>   - Add error handling on reset_control_acquire().
>>   - Link to v1: https://lore.kernel.org/all/20250410-b4-upstream_ospi_reset_update-v1-0-74126a8ceb9c@foss.st.com/
>> ---
>>  drivers/spi/spi-stm32-ospi.c | 24 ++++++++++++++++++------
>>  1 file changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
>> index 668022098b1eac3628f0677e6d786e5a267346be..b2597b52beb1133155e0d6f601b0632ad4b8e8f5 100644
>> --- a/drivers/spi/spi-stm32-ospi.c
>> +++ b/drivers/spi/spi-stm32-ospi.c
>> @@ -804,7 +804,7 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
>>  		return ret;
>>  	}
>>  
>> -	ospi->rstc = devm_reset_control_array_get_optional_exclusive(dev);
>> +	ospi->rstc = devm_reset_control_array_get_exclusive_released(dev);
>>  	if (IS_ERR(ospi->rstc))
>>  		return dev_err_probe(dev, PTR_ERR(ospi->rstc),
>>  				     "Can't get reset\n");
>> @@ -936,11 +936,13 @@ static int stm32_ospi_probe(struct platform_device *pdev)
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
>>  
>>  	ret = spi_register_controller(ctrl);
>>  	if (ret) {
>> @@ -983,6 +985,8 @@ static void stm32_ospi_remove(struct platform_device *pdev)
>>  	if (ospi->dma_chrx)
>>  		dma_release_channel(ospi->dma_chrx);
>>  
>> +	reset_control_release(ospi->rstc);
>> +
>>  	pm_runtime_put_sync_suspend(ospi->dev);
>>  	pm_runtime_force_suspend(ospi->dev);
>>  }
>> @@ -993,6 +997,8 @@ static int __maybe_unused stm32_ospi_suspend(struct device *dev)
>>  
>>  	pinctrl_pm_select_sleep_state(dev);
>>  
>> +	reset_control_release(ospi->rstc);
> 
> It would be nice to point out in a comment that OMM will temporarily
> take over control during resume. But either way,
> 
Hi Philipp

Right, i will send a new version by adding this information.

Thanks
Patrice

> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>



> 
> regards
> Philipp

