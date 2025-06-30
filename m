Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61142C83000
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 07:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TeFS+uiHYd7t7KK/aAu0N/KEC1YUemvKeluUuOfecA=; b=TtiOFFcVbDPjB0tUVGYuShbTZ8
	/0QEQj1MB08Yg9/MesP4rAotHJaoMr0xe75y6mnI75N2Tzjpe2kAe2L+qZDd7L6GKfNswCEsfDV9V
	GFlcfGBmS57JFlp5Kt1uZ4+aOtVyZQn2IjHsgoLwf9Liro8eoDDqHt0MrGlF7HYjIOVJWw3a0pBp9
	MZ0pCChVGTvuMYKrFj24VTz9fv//Jp825AB4QQDuXlIVZsFTW0fRhJUXtodpR47ohIvCQ9a3XVJM9
	L6LVd4+XWounC2dlfifI8rI9jQCnzIz2/B3fzbZyUBPQT4AZ3EPHceQWCKiKXJ6/S5RFO3QNh1hn6
	kdVEXWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW96m-00000001TP2-03f5;
	Mon, 30 Jun 2025 07:39:20 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW93P-00000001StJ-3xX4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 07:35:53 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U7AniW028032;
	Mon, 30 Jun 2025 09:35:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	3TeFS+uiHYd7t7KK/aAu0N/KEC1YUemvKeluUuOfecA=; b=QA9ziUH74nPr8B5h
	tSCcx7WJc5TajZUH1r7XpOAseYVJXtyyrECAhoHZ1w7H621FQsd/wZuiOntoOLux
	xVb1f3Sq4tnnJX0KF9NbhrT7jrH06muly99q0vw2j8PJgb6cw7X3NQ9vQ6mYIzS7
	FBVzTYysav1JdMt27wULU2nz24Dd7lfN8oNojqaj8xy/D1X7A3XL2xPzl1Tmm8T4
	BhKW6UfEbWYU+dQrmaO10MTQwPFFPtS+ruX6uTVqgBZadAunJcSSjXzMMAfwlpiA
	ANXefcNTmfzo4SoFirZNEOK8fZZWvUkGHf+r+v7WVek7sRmgn+VWHIAHWBqTlFPX
	+f5lqA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j79h5udb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 09:35:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id ACD4540047;
	Mon, 30 Jun 2025 09:34:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D342946AD15;
	Mon, 30 Jun 2025 09:34:15 +0200 (CEST)
Received: from [10.252.20.7] (10.252.20.7) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 09:34:15 +0200
Message-ID: <1f49b8f3-44c9-43f3-a3bf-b931fb0726f4@foss.st.com>
Date: Mon, 30 Jun 2025 09:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: stm32: fix NULL check on pointer-to-pointer variable
To: Antonio Quartulli <antonio@mandelbit.com>, <linux-spi@vger.kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alain Volmat
	<alain.volmat@foss.st.com>
References: <20250628000227.22895-1-antonio@mandelbit.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250628000227.22895-1-antonio@mandelbit.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.20.7]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_003552_470789_D173C751 
X-CRM114-Status: GOOD (  19.96  )
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

Hi Antonio,

On 6/28/25 02:02, Antonio Quartulli wrote:
> In stm32_spi_prepare_rx_dma_mdma_chaining() both rx_dma_desc
> and rx_mdma_desc are passed as pointer-to-pointer arguments.
> 
> The goal is to pass back to the caller the value returned
> by dmaengine_prep_slave_sg(), when it is not NULL.
> 
> However, the NULL check on the result is erroneously
> performed without dereferencing the pointer.
> 
> Add the proper dereference operator to both checks.
> 
> Fixes: d17dd2f1d8a1 ("spi: stm32: use STM32 DMA with STM32 MDMA to enhance DDR use")
> Addresses-Coverity-ID: 1644715 ("Null pointer dereferences (REVERSE_INULL)")
> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
> ---
>   drivers/spi/spi-stm32.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 3d20f09f1ae7..e9fa17e52fb0 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -1529,7 +1529,7 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
>   					       DMA_PREP_INTERRUPT);
>   	sg_free_table(&dma_sgt);
>   
> -	if (!rx_dma_desc)
> +	if (!*rx_dma_desc)
>   		return -EINVAL;
>   
>   	/* Prepare MDMA slave_sg transfer MEM_TO_MEM (SRAM>DDR) */
> @@ -1563,8 +1563,8 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
>   						DMA_PREP_INTERRUPT);
>   	sg_free_table(&mdma_sgt);
>   
> -	if (!rx_mdma_desc) {
> -		rx_dma_desc = NULL;
> +	if (!*rx_mdma_desc) {
> +		*rx_dma_desc = NULL;
>   		return -EINVAL;
>   	}
>   

Good catch for both pointers !

For readability, I would suggest to define two dma_async_tx_descriptor 
ptr at the beginning of the function such as :
	struct dma_async_tx_descriptor *_mdma_desc = *rx_mdma_desc;
	struct dma_async_tx_descriptor *_dma_desc = *rx_dma_desc;

And then use them all along the function even in the assignation.

Best regards,
Clément

