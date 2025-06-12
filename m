Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21197C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 10:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4gTnAusbtfL5G0grnWGEElF552MerFrkX+8ouuadF0=; b=ZfzgUqaC4Y8HccMknob7qCfuA5
	qXHWD4cB4Qt50UA8msi9l9P+CCoChtw6ok60ijxshGbugTTBKzI6vcVaTC0Bp1mgGazpHM8pVj9GO
	oCcS3G3MdhAQtunA8QBJqp2HNCm3auGu0kDvwG7RDz4PQok0g0UchT64CdA6IRl2iJkDW5l6R8lpo
	5bgW794Mq2oBxE81NdtIIAkayf8MbQ/sckFRpA3XihRv+8Fkb6HcQo3bfUVGc5czvekckmeDswD4J
	iY7NL+znopS1y7t1w7kejX6cUAVMRgUsV6xqHnwH16bvyK/LBdnkEIcZzObfADy51upI8h0tWBGL0
	4fea2lGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfBY-0000000Cz2G-371u;
	Thu, 12 Jun 2025 10:29:29 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdzB-0000000Cmgg-2RTT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 09:12:39 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C93cWv004497;
	Thu, 12 Jun 2025 11:12:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	k4gTnAusbtfL5G0grnWGEElF552MerFrkX+8ouuadF0=; b=ovwOcZGvVZO+1lK8
	pwGai2+7sgumZ9z7lixxIQdKouskKxZyNisYGGKx2ibHkV7KU+T2BW5ewjpdZ4PG
	g92OxE9AH0lbYtHM4Di29+naHxN0/2LQuJzzItlndQCP4P6R1jnqjBUHg8j9rnSI
	E8aUzlcKiyAeyEXg0pXGC8Gdav+n93DLCf9u9zcp/GWScF94I60S4wJjbSc/deuZ
	5A8zGO6f4kn14VLnpel7Mwu9Kkp5zI3UJNgH6yUwcU6g5w21zWJ4Tn+JRyQbQ8O1
	iaUc/K6zYN4xgRUCnghOdKXp+Irc6WizD32L7lR+YF+RE2x11hnDqvYyjzj70xvv
	QC9IgA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474ajaegp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 11:12:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 51E7840044;
	Thu, 12 Jun 2025 11:11:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B23985C820E;
	Thu, 12 Jun 2025 11:10:44 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 11:10:44 +0200
Message-ID: <11dcec73-8e29-4139-bddf-4b63de3f9aed@foss.st.com>
Date: Thu, 12 Jun 2025 11:10:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] spi: stm32-ospi: clean up on error in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Mark Brown <broonie@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <aEmAGTUzzKZlLe3K@stanley.mountain>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <aEmAGTUzzKZlLe3K@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_06,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_021238_112446_6331249E 
X-CRM114-Status: GOOD (  14.53  )
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



On 6/11/25 15:09, Dan Carpenter wrote:
> If reset_control_acquire() fails, then we can't return directly.
> We need to do a little clean up first.
> 
> Fixes: cf2c3eceb757 ("spi: stm32-ospi: Make usage of reset_control_acquire/release() API")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/spi/spi-stm32-ospi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
> index db6b1cfc970f..4ab7e86f4bd5 100644
> --- a/drivers/spi/spi-stm32-ospi.c
> +++ b/drivers/spi/spi-stm32-ospi.c
> @@ -937,8 +937,10 @@ static int stm32_ospi_probe(struct platform_device *pdev)
>  		goto err_pm_enable;
>  
>  	ret = reset_control_acquire(ospi->rstc);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Can not acquire reset %d\n", ret);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Can not acquire reset %d\n", ret);
> +		goto err_pm_resume;
> +	}
>  
>  	reset_control_assert(ospi->rstc);
>  	udelay(2);


Hi Dan

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

