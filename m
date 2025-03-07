Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C1DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 09:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbwoBFfg5pVaSdi+Qssvq+8QdxwNch8vbgxAm8z822M=; b=oDo/PDchyxMBlgVXyfQTjmXQGl
	GB5juoWQZIQVtByvDLF3Ql/EbhLsKEIjloCbVOqJ+g8Ve6ZEOdwKWQXDRYOwRGujupgLI+7e0rTvk
	YsIr1Zx4s/vYgyxQ52dFJgw5N5YAwo4G8fcquSNpWTjX5FWANYuAH0wCZT16agw8lLnWPGYAzKh6Q
	4IxeLZgNBGQTUPrzZb6oo43QunupHUHxocNzL67V+Dad4bv2OCYuZwbJQecOMLxT2khCVSitSO/uv
	XGpb8ki2b/jmApJ4I9YlwFK2KrFmDgg4e46u9U2D1vuu1sdWMIFJit/OjD4vlJ3iLFRMhi0OMRGPx
	+VI9O/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTl8-0000000DfH5-1I9d;
	Fri, 07 Mar 2025 09:12:46 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTjT-0000000Df7j-2Lf3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 09:11:07 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5277MpKU029564;
	Fri, 7 Mar 2025 10:10:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	MbwoBFfg5pVaSdi+Qssvq+8QdxwNch8vbgxAm8z822M=; b=xlqJ5gvN1TnsNDm4
	1CT8YWBcB/a5XeRyb/I/ol1Rnvx1KlSG991Qw5SL25FfA+1/kLwJCEKmhodmujYx
	Y2oqilb2hWxwhZaDMWoVY+oGOHvBRR9/bM7nyfENFeJH+NcnoqkSC2rgyPz3XeJA
	z4v/Hjo3D6+Ub91QfXyPTJ9ak1QUGkh7wJ5pG6ZSvXqe+BMz5gEDdvS6B2UIUdr4
	BVdL6T8kFTVlSVXmOdA+q1/Kjx48ChQS/0S4f607E9DC0nMECo2GmM8H1O0jm9TN
	D4p+lrEDeU0e9xh6Zai9P+OLCH1h0ueMxQ47Smx8JPj5MkkgCArHduDdDTp3aS9l
	44j1dA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 457286vefq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 10:10:43 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A1001400F0;
	Fri,  7 Mar 2025 10:09:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BABD85AC8BC;
	Fri,  7 Mar 2025 09:59:43 +0100 (CET)
Received: from [10.252.19.16] (10.252.19.16) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 09:59:43 +0100
Message-ID: <dfd831ec-e004-4132-94f0-3bdc755907cd@foss.st.com>
Date: Fri, 7 Mar 2025 09:59:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: stm32: Fix a NULL vs IS_ERR() bug
To: Charles Han <hanchunchao@inspur.com>, <broonie@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250307032530.116837-1-hanchunchao@inspur.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250307032530.116837-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.19.16]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_03,2025-03-06_04,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_011104_227227_8AF0B0F3 
X-CRM114-Status: GOOD (  15.54  )
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



On 3/7/25 04:25, Charles Han wrote:
> The devm_ioremap() function doesn't return error pointers, it may
> returns NULL.  Update the error checking to match.
> 
> Fixes: 79b8a705e26c ("spi: stm32: Add OSPI driver")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/spi/spi-stm32-ospi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
> index 8eadcb64f34a..a544d7897edf 100644
> --- a/drivers/spi/spi-stm32-ospi.c
> +++ b/drivers/spi/spi-stm32-ospi.c
> @@ -835,10 +835,10 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
>  	if (rmem) {
>  		ospi->mm_size = rmem->size;
>  		ospi->mm_base = devm_ioremap(dev, rmem->base, rmem->size);
> -		if (IS_ERR(ospi->mm_base)) {
> +		if (!ospi->mm_base) {
>  			dev_err(dev, "unable to map memory region: %pa+%pa\n",
>  				&rmem->base, &rmem->size);
> -			ret = PTR_ERR(ospi->mm_base);
> +			ret = -ENOMEM;
>  			goto err_dma;
>  		}
>  

Hi

No need to copy/paste other contributor's patch by just swapping some 
words in title/commit message.

This fix has already sent By Dan Carpenter and merged.

Patrice

