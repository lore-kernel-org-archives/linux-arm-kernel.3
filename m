Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF2DC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 12:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEBmyAj2MQJzsGWtA/jCxYMVGCfxsTtR/1ElMUQHMeI=; b=D8ZWqIYu4O//h+j4LJqASwMnvN
	sLbTLlBbLzlMwZVOU6nXu6NgIMrLbEtW2gQmGpOOZoORaKSgAcmUalDrExD215hPYmGxyANeuTKzV
	wEnkWmzwIP+gxPsMVoFK40zrTxlOxWKPjMSQBDwoS9hAlaq89/4RMBxhN7AItqCzhecm+A14GHdrp
	6gxnLMqNK3iWMjjNDHXMDQlZHOCbMjVNTY7nyRpzbuCTti5miMWMjexWYBMGQpl8ZxOWEfGNA/rQ1
	a65DrtN9KsiLnEhXFfi83WHG00LR6gDTdlRaOAmgQXl9iV4/tg9NnxykOr4IwptdVqK4aOFgV9DJi
	uHgpi5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDi6-00000002C3v-46AR;
	Mon, 30 Jun 2025 12:34:10 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDBP-000000027gT-3rto
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 12:00:25 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UBDEir013621;
	Mon, 30 Jun 2025 14:00:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	cEBmyAj2MQJzsGWtA/jCxYMVGCfxsTtR/1ElMUQHMeI=; b=TpJUoJlKKthBV9fC
	kyjCT9i+2YAzwSUzVMr1GxpaqNPVmFP1Kfad1oyVB1/EoRhzUGsnA6UauzGBQnoK
	iEAeiFdwP9OziVAjFwZ24jD9jhemwCJonQ6obSepTt9YQZL/nBfkjLuRho7Do8AB
	QnSDtctyPMZ4h8crAivLx36w4Sd1xt26mDaDbNja2H5rJc/JWXILPdbjY5uUpN0O
	VVeKX1ewXLmjCPU92ExqXBpBoOlVOQQsu9OvsT0QjZdeXLN51mCkmcPOn6lXTVxz
	kxW+Hu1qRb7e/736JC+ZQt/66Z5AIYogtVqA/IToyACEJ6rSdJh96J/4BImEM/4m
	6Fwt4w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j79h73np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 14:00:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0A73440048;
	Mon, 30 Jun 2025 13:59:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B88BB2B6D3;
	Mon, 30 Jun 2025 13:58:53 +0200 (CEST)
Received: from [10.252.20.7] (10.252.20.7) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 13:58:52 +0200
Message-ID: <64628676-1eec-41b2-b11d-341f97edd113@foss.st.com>
Date: Mon, 30 Jun 2025 13:58:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spi: stm32: fix pointer-to-pointer variables usage
To: Antonio Quartulli <antonio@mandelbit.com>, <linux-spi@vger.kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alain Volmat
	<alain.volmat@foss.st.com>
References: <20250630081253.17294-1-antonio@mandelbit.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250630081253.17294-1-antonio@mandelbit.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.20.7]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_050024_238214_9A38FE45 
X-CRM114-Status: GOOD (  20.07  )
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

On 6/30/25 10:12, Antonio Quartulli wrote:
> In stm32_spi_prepare_rx_dma_mdma_chaining() both rx_dma_desc
> and rx_mdma_desc are passed as pointer-to-pointer arguments.
> 
> The goal is to pass back to the caller the value returned
> by dmaengine_prep_slave_sg(), when it is not NULL.
> 
> However, these variables are wrongly handled as simple pointers
> during later assignments and checks.
> 
> Fix this behaviour by introducing two pointer variables
> which can then be treated accordingly.
> 
> Fixes: d17dd2f1d8a1 ("spi: stm32: use STM32 DMA with STM32 MDMA to enhance DDR use")
> Addresses-Coverity-ID: 1644715 ("Null pointer dereferences (REVERSE_INULL)")
> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
> 
> ---
> Changes from v1:
> * introduce *_mdma_desc and *_dma_desc for better readability
> * fix another instance of rx_dma_desc bogus assignment in case of
>    failure of sg_alloc_table()
> * commit title/message reworded accordingly to the previous point
> ---
>   drivers/spi/spi-stm32.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 3d20f09f1ae7..4b7f074fdba9 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -1474,6 +1474,8 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
>   						  struct dma_async_tx_descriptor **rx_dma_desc,
>   						  struct dma_async_tx_descriptor **rx_mdma_desc)
>   {
> +	struct dma_async_tx_descriptor *_mdma_desc = *rx_mdma_desc;
> +	struct dma_async_tx_descriptor *_dma_desc = *rx_dma_desc;
>   	struct dma_slave_config rx_mdma_conf = {0};
>   	u32 sram_period, nents = 0, spi_s_len;
>   	struct sg_table dma_sgt, mdma_sgt;
> @@ -1524,18 +1526,18 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
>   		}
>   	}
>   
> -	*rx_dma_desc = dmaengine_prep_slave_sg(spi->dma_rx, dma_sgt.sgl,
> -					       dma_sgt.nents, rx_dma_conf->direction,
> -					       DMA_PREP_INTERRUPT);
> +	_dma_desc = dmaengine_prep_slave_sg(spi->dma_rx, dma_sgt.sgl,
> +					    dma_sgt.nents, rx_dma_conf->direction,
> +					    DMA_PREP_INTERRUPT);
>   	sg_free_table(&dma_sgt);
>   
> -	if (!rx_dma_desc)
> +	if (!_dma_desc)
>   		return -EINVAL;
>   
>   	/* Prepare MDMA slave_sg transfer MEM_TO_MEM (SRAM>DDR) */
>   	ret = sg_alloc_table(&mdma_sgt, nents, GFP_ATOMIC);
>   	if (ret) {
> -		rx_dma_desc = NULL;
> +		_dma_desc = NULL;
>   		return ret;
>   	}
>   
> @@ -1558,13 +1560,13 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
>   		}
>   	}
>   
> -	*rx_mdma_desc = dmaengine_prep_slave_sg(spi->mdma_rx, mdma_sgt.sgl,
> -						mdma_sgt.nents, rx_mdma_conf.direction,
> -						DMA_PREP_INTERRUPT);
> +	_mdma_desc = dmaengine_prep_slave_sg(spi->mdma_rx, mdma_sgt.sgl,
> +					     mdma_sgt.nents, rx_mdma_conf.direction,
> +					     DMA_PREP_INTERRUPT);
>   	sg_free_table(&mdma_sgt);
>   
> -	if (!rx_mdma_desc) {
> -		rx_dma_desc = NULL;
> +	if (!_mdma_desc) {
> +		_dma_desc = NULL;
>   		return -EINVAL;
>   	}
>   

Reviewed-by: Clément Le Goffic <clement.legoffic@foss.st.com>

