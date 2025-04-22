Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC830C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 06:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xi+JitXGAmFnZDuGwAZkV7H6E509qk6CX9yji9WUBzc=; b=MmqmH8BUoFIlGxOBTTO4NewP1j
	A+U/NL6Lp2m+er2AVsQ9hkKNYQFpHaL7BKhqCo+jlhhxiLocP7Bv6ZFlGDZxaIoXCy7qfvl6vM8iN
	f40n1crcOti/Caxy9Uy226DncVowo0FRUYzKV85zWbXHC+B4EoYzGj9syWJ5FQudNb8bRU20rhFOY
	PGQdBIo61TEa8Q6QqJk7vt6lgCX0shydVsyvVQEMPvlfwZTRxEw5vbKqwW4NTaNOEe5S/LR0PZPJp
	2fZdqA5I5Az7v9argBS+AaTOfxWturm0mSFHtj2VoIfjAMqNUQka8xAv4VqsS43Om/DIDWIg4CR9P
	kUqoO9YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77NS-000000061KO-36NE;
	Tue, 22 Apr 2025 06:45:06 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77Kp-000000060pd-1HbN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 06:42:24 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LNPgGE019258;
	Tue, 22 Apr 2025 08:42:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Xi+JitXGAmFnZDuGwAZkV7H6E509qk6CX9yji9WUBzc=; b=uOsCyW+1InSqYn2g
	Cx/G5SxzaZIEV88d7LOotKXgI5Fr9o7T4X1BpTbu/e8JRVPUzT5If7A4GPdlY3LS
	HtE48oiPu4j9pwjmUbLTvsGLAErTnmj1Dek3MxxAcPCB2h3cuxRh6d91mq5mWa9P
	eFKarYQYFy6ZUyRgJRhS/5vx++fGeUVnhcxTkfsMmHHGgWmhtU+hK/7UuaHQx1+v
	sWdZQOkgtAXyQEpShuDd96smn4WMmxW9CHRu9KrTYwr9oFC3dLIOuAdNQnq/cIza
	uZb44K9YHDSls0b0VU9Wm6m0EApUkX9gvFGkSs+5oHWL3UFL2slk9kxlJxIB4Owe
	yvwztA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 464psp670n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 08:42:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2D34740044;
	Tue, 22 Apr 2025 08:41:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3B918AD2F4;
	Tue, 22 Apr 2025 08:39:47 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 08:39:47 +0200
Message-ID: <c875e526-c60b-4063-9a98-c344443fdc96@foss.st.com>
Date: Tue, 22 Apr 2025 08:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: stm32-ospi: Fix an error handling path in
 stm32_ospi_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Mark Brown
	<broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_03,2025-04-21_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_234223_634858_A34400C0 
X-CRM114-Status: GOOD (  13.69  )
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



On 4/18/25 13:27, Christophe JAILLET wrote:
> If an error occurs after a successful stm32_ospi_dma_setup() call, some
> dma_release_channel() calls are needed to release some resources, as
> already done in the remove function.
> 
> Fixes: 79b8a705e26c ("spi: stm32: Add OSPI driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only
> ---
>  drivers/spi/spi-stm32-ospi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
> index 668022098b1e..9ec9823409cc 100644
> --- a/drivers/spi/spi-stm32-ospi.c
> +++ b/drivers/spi/spi-stm32-ospi.c
> @@ -960,6 +960,10 @@ static int stm32_ospi_probe(struct platform_device *pdev)
>  err_pm_enable:
>  	pm_runtime_force_suspend(ospi->dev);
>  	mutex_destroy(&ospi->lock);
> +	if (ospi->dma_chtx)
> +		dma_release_channel(ospi->dma_chtx);
> +	if (ospi->dma_chrx)
> +		dma_release_channel(ospi->dma_chrx);
>  
>  	return ret;
>  }
Hi Christophe

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks

