Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB5AC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4CgzvQiInbe8bc3VV3PcAVGmZbXimShPwMNviMcn6Q=; b=vQjec0qhC2GeQRuNYUPd3AbmAC
	jiOsFbvfkD8NGxDKnJgejzOWIf2DeCMRosCjeDx25R4pRTLV9cFivePPB3IieNCrZByD8trKQzuXB
	7a9jJqRnZICCgoX+ccZ23XW9fBuO5ew+m0fQx3BD/o6P56VHIujW3auiQXlbWzGndWeBOwhwJQc5j
	d9C1XGST+5c3KWvw7cXIRVvl/x9UdBFwyy9T1cYyhpJ8QRdshc5xbMnpMRMVOaxIHG7ciTcr+dlS/
	wzDbMuRAhT+0ZqwLuuH63TQIBA7jncmLlnAt6H7MtCUCSoAhsyBzvTgDsmhutnLVkXSc3zo60OyGE
	N3gaxd2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXge7-0000000EXh0-3ha1;
	Fri, 04 Jul 2025 13:40:07 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgAi-0000000ETdt-12qc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 13:09:45 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564CYv65012818;
	Fri, 4 Jul 2025 15:09:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	V4CgzvQiInbe8bc3VV3PcAVGmZbXimShPwMNviMcn6Q=; b=NHe2yd9m470sdg9H
	NHs26SleVaFuy/p54nAVaL9c8Ape8CbpgMEnrfV87HUKUirsnpaqxq5v8pkNVSka
	ZCvqnuh2rtJjKdlehg5NSsGb4Tcf0nauSz9MLoI2DapPVM/CBUVuZKulJ96ZOQp+
	yWgEAme1KP4HWewoxOUOlhYu4QdYybF0GidBYmU/IIGR5yc0PfV3O8RGxSQu+ioq
	OmiCZn1ihYllNwZrgB5Cq5hFM/FWIGXfrvrsWaiMAVIzePMTDrl7Pgs3DrcIkG4o
	zX63VhphJb8bU+fOUNXfiezDBgP1uIACdiD3fY1bdItdds44z5Zf1vQgCFsIwISq
	K/GG5w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tmnkws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 15:09:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0CD6840046;
	Fri,  4 Jul 2025 15:08:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9343B51B49;
	Fri,  4 Jul 2025 15:08:23 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 15:08:23 +0200
Message-ID: <304da1be-c0de-475e-92be-ef7a9727e281@foss.st.com>
Date: Fri, 4 Jul 2025 15:08:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: busses: Use min() to improve code
To: Qianfeng Rong <rongqianfeng@vivo.com>, Andi Shyti <andi.shyti@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <opensource.kernel@vivo.com>
References: <20250619142609.323082-1-rongqianfeng@vivo.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250619142609.323082-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_05,2025-07-04_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_060944_802173_65514A0E 
X-CRM114-Status: GOOD (  12.30  )
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



On 6/19/25 16:26, Qianfeng Rong wrote:
> Use min() to reduce the code and improve its readability.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/i2c/busses/i2c-st.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
> index 750fff3d2389..3373a828b5a0 100644
> --- a/drivers/i2c/busses/i2c-st.c
> +++ b/drivers/i2c/busses/i2c-st.c
> @@ -19,6 +19,7 @@
>  #include <linux/of.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/minmax.h>
>  
>  /* SSC registers */
>  #define SSC_BRG				0x000
> @@ -422,10 +423,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
>  	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
>  	tx_fstat &= SSC_TX_FSTAT_STATUS;
>  
> -	if (c->count < (SSC_TXFIFO_SIZE - tx_fstat))
> -		i = c->count;
> -	else
> -		i = SSC_TXFIFO_SIZE - tx_fstat;
> +	i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
>  
>  	for (; i > 0; i--, c->count--, c->buf++)
>  		st_i2c_write_tx_fifo(i2c_dev, *c->buf);
> @@ -452,10 +450,7 @@ static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
>  	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
>  	tx_fstat &= SSC_TX_FSTAT_STATUS;
>  
> -	if (max < (SSC_TXFIFO_SIZE - tx_fstat))
> -		i = max;
> -	else
> -		i = SSC_TXFIFO_SIZE - tx_fstat;
> +	i = min(max, SSC_TXFIFO_SIZE - tx_fstat);
>  
>  	for (; i > 0; i--, c->xfered++)
>  		st_i2c_write_tx_fifo(i2c_dev, 0xff);


Hi Qianfeng

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

