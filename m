Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94284C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 12:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pycezctstuz3BFlNIxQMNF0K5ylVdmwNgA8PPuNOE4=; b=dzD79+ZeUxLgxlU94FndYm1U3Z
	SWM8AVYwZ6M9S8ubbBLQFPTHdBGfrt/vtl2D+vg5/LDakQ1z99X6h4In4CYAamQzgORCfriBUzUuX
	UgP8Nrvqt71tmiuN+WrrOtfzO5XBnzDov+wup206U5+G1YJrrO2yKjrW1M8OZ9RvChJ5w0c7i6ha/
	Xv+anpiWpKPEHI+Ne0wnUJMthlJZYI4Jvf+vJdeNjMAxwVk/VJMOLBTFkIyn866AGZAkLce/crjou
	rFLl1xb3YUrFFpTm9SjVd/dLH8EG1rp0gDWDUPW3qAPxNgfsIx5nFVd7bDVKmQ1CnyGilwDKGIeGW
	jNfBeUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDIw-000000028TP-1GeB;
	Mon, 30 Jun 2025 12:08:10 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCu5-000000024Wz-3xaX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 11:42:31 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UA9NFN023997;
	Mon, 30 Jun 2025 13:42:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=8pycezctstuz3BFlNIxQMNF0
	K5ylVdmwNgA8PPuNOE4=; b=MkYrRgjbalPM0VOOV78JMBpg6f3AhTUePQ8VeYVZ
	1TMtJouX6Eq4sVkrc8PHVpBOmp/Ngy7OrS/fKgugQLkvjtwCN6AMVK9yfT2d6m/1
	aKpW/SgEOXBmc0JQIRAK6jD6PB9o7JYle/NhL1Xkh+GsB9ykA8aMd3u1WtkrqrlK
	j7ySLnqKHhIGsyTMRG9i5J9T8R5hrc0ngrPL3U8DMk5RKFVpLZicJmKuxyd9v25+
	by19Hcuyrsbo/4bv3+NJ48pJNi/vG7OtVImPJnZu7cf3mSq8LEG6ey/85XERtJfp
	l2C1QUdrraL4uNa6ubG8Ucv0Mg9yYR61zHH3wDzoaV9Q0Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jubnmqrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 13:42:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3830E40059;
	Mon, 30 Jun 2025 13:41:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACD70B2379E;
	Mon, 30 Jun 2025 13:40:57 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 13:40:57 +0200
Date: Mon, 30 Jun 2025 13:40:51 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Antonio Quartulli <antonio@mandelbit.com>
CC: <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] spi: stm32: fix pointer-to-pointer variables usage
Message-ID: <20250630114051.GA398774@gnbcxd0016.gnb.st.com>
References: <1f49b8f3-44c9-43f3-a3bf-b931fb0726f4@foss.st.com>
 <20250630081253.17294-1-antonio@mandelbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250630081253.17294-1-antonio@mandelbit.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_044230_255910_F5D99A72 
X-CRM114-Status: GOOD (  23.82  )
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

Thank you for the patch.

On Mon, Jun 30, 2025 at 10:12:53AM +0200, Antonio Quartulli wrote:
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
>   failure of sg_alloc_table()
> * commit title/message reworded accordingly to the previous point
> ---
>  drivers/spi/spi-stm32.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 3d20f09f1ae7..4b7f074fdba9 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -1474,6 +1474,8 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
>  						  struct dma_async_tx_descriptor **rx_dma_desc,
>  						  struct dma_async_tx_descriptor **rx_mdma_desc)
>  {
> +	struct dma_async_tx_descriptor *_mdma_desc = *rx_mdma_desc;
> +	struct dma_async_tx_descriptor *_dma_desc = *rx_dma_desc;
>  	struct dma_slave_config rx_mdma_conf = {0};
>  	u32 sram_period, nents = 0, spi_s_len;
>  	struct sg_table dma_sgt, mdma_sgt;
> @@ -1524,18 +1526,18 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
>  		}
>  	}
>  
> -	*rx_dma_desc = dmaengine_prep_slave_sg(spi->dma_rx, dma_sgt.sgl,
> -					       dma_sgt.nents, rx_dma_conf->direction,
> -					       DMA_PREP_INTERRUPT);
> +	_dma_desc = dmaengine_prep_slave_sg(spi->dma_rx, dma_sgt.sgl,
> +					    dma_sgt.nents, rx_dma_conf->direction,
> +					    DMA_PREP_INTERRUPT);
>  	sg_free_table(&dma_sgt);
>  
> -	if (!rx_dma_desc)
> +	if (!_dma_desc)
>  		return -EINVAL;
>  
>  	/* Prepare MDMA slave_sg transfer MEM_TO_MEM (SRAM>DDR) */
>  	ret = sg_alloc_table(&mdma_sgt, nents, GFP_ATOMIC);
>  	if (ret) {
> -		rx_dma_desc = NULL;
> +		_dma_desc = NULL;
>  		return ret;
>  	}
>  
> @@ -1558,13 +1560,13 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
>  		}
>  	}
>  
> -	*rx_mdma_desc = dmaengine_prep_slave_sg(spi->mdma_rx, mdma_sgt.sgl,
> -						mdma_sgt.nents, rx_mdma_conf.direction,
> -						DMA_PREP_INTERRUPT);
> +	_mdma_desc = dmaengine_prep_slave_sg(spi->mdma_rx, mdma_sgt.sgl,
> +					     mdma_sgt.nents, rx_mdma_conf.direction,
> +					     DMA_PREP_INTERRUPT);
>  	sg_free_table(&mdma_sgt);
>  
> -	if (!rx_mdma_desc) {
> -		rx_dma_desc = NULL;
> +	if (!_mdma_desc) {
> +		_dma_desc = NULL;
>  		return -EINVAL;
>  	}
>  

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain
> -- 
> 2.49.0
> 

