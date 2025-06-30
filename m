Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57459C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 12:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91jH5cFvvocFD9cZk0oZNMRRI8Lu1LwSiDDduj/iv9Q=; b=DvZOJIxXdSdbiVe45WZ0vmh9s9
	gMXbBMglg3PbAHfpgDSEgGgCAsvpcqmGSiBTuqAeig4gXVMvo8bubd47xdjmI7Oaht6t2isooW7b/
	YEcjXhNyoaJnVnvDD4tvO+uWpFUDUmD5l1gJ9Xi6bLEoOTB8xMih3dbfIsVNDu8TgRh9NsSAbbo18
	D1AZBsYlhzJO9M/UDlY6hMPMA694qTZg4Fe25ZWCjTrr3fCuQ9G2saXKGIGgDI0/m4n7/gBxiZYhs
	mo+8+zejHdXJrWD3I+wV+NGWY9qESSJf5vWHhcmeOMrLS7xkfXVBF3/9cjtPTuwYta6YowRjXGWdP
	E0ygwM8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDS4-000000029lI-1XS2;
	Mon, 30 Jun 2025 12:17:36 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWD0B-000000025lp-2Y7w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 11:48:48 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U7x1gK025447;
	Mon, 30 Jun 2025 13:48:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	91jH5cFvvocFD9cZk0oZNMRRI8Lu1LwSiDDduj/iv9Q=; b=cFNtvq2G6gSzql0A
	9toSeVBYzuHhPRn3p4gNSVQ6W6jAkSgqNetkM09uJ8qpEOncJd5IJZlDB6zf+WOO
	A8hcTWHKsVQV5inpukGA+dgpKqGzNMWzXh6wo2ea/VLU/wcWDeGWXAy81n4RQcPo
	yLyqI/J90HIom9VcxytldkfLF5ZeN5w8y+6PEuEXht5LKk5Qeg7/lw+r1FPb8Au5
	vFBp8TjpQHTEr4keKHkx+N4V+8rYOcqUeqmKCmy7j3Q22voEx71SBs+RdTUFatK/
	1IdrP7bn69pDx3XrZQ5LuDrGI6DpPM9BI6TaoLZqiFvNGLW5AsDq7WdyuuQr89vE
	Jn4Inw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jsy4myxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 13:48:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F1A2C4004B;
	Mon, 30 Jun 2025 13:47:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D89CDB28C48;
	Mon, 30 Jun 2025 13:47:10 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 13:47:10 +0200
Date: Mon, 30 Jun 2025 13:47:09 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
CC: Mark Brown <broonie@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Dan
 Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] spi: stm32: fix sram pool free in probe error path
Message-ID: <20250630114709.GB398774@gnbcxd0016.gnb.st.com>
References: <20250630-spi-fix-v1-1-2e671c006e15@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630-spi-fix-v1-1-2e671c006e15@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_044847_934964_25BCD3F6 
X-CRM114-Status: GOOD (  17.27  )
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

Hi Clément,

On Mon, Jun 30, 2025 at 10:20:13AM +0200, Clément Le Goffic wrote:
> Add a test to check whether the sram_pool is NULL before freeing it.
> 
> Fixes: d17dd2f1d8a1 ("spi: stm32: use STM32 DMA with STM32 MDMA to enhance DDR use")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/spi/spi-stm32.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 3d20f09f1ae7..858470a2cab5 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -2486,7 +2486,9 @@ static int stm32_spi_probe(struct platform_device *pdev)
>  	if (spi->mdma_rx)
>  		dma_release_channel(spi->mdma_rx);
>  err_pool_free:
> -	gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf, spi->sram_rx_buf_size);
> +	if (spi->sram_pool)
> +		gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf,
> +			      spi->sram_rx_buf_size);
>  err_dma_release:
>  	if (spi->dma_tx)
>  		dma_release_channel(spi->dma_tx);
> 

Looks good to me. Thanks.
Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

> ---
> base-commit: 045719b1d0aab98e6abdd7715e8587b997d1cefa
> change-id: 20250630-spi-fix-860416bfb96d
> 
> Best regards,
> -- 
> Clément Le Goffic <clement.legoffic@foss.st.com>
> 

