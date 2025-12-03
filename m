Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAE0D1CDA8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 22:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0O+Q1G2DqR5GoIPc7gQ4rz1JNMzw9JI8Q1vjnLq24s=; b=DdnnNIRClbj/YnG8gPYrwRA14R
	nDsgbyDDyxFJ9LAbfvV9w/aBm0O4y7KW9b32PrAq5pph7q6v4+M6L/QMDoXQC9RoL1aX499R/uX3W
	m8bwdPl4kEWrHCGwx/fdHFUxCcVYrrwZrho/Nz1/YkNgzt8pemB/2U4aoNk7Ja44RWJf1JkEomaDM
	CpwXVwWhgHxu4iqsXtiQmwM3T1d20CGBza0pULhSUQHrFrPnMoKSUyL0NSLDQXDJbH86nMH++kTSw
	Rlj+sBxxESysFx2ckXQl9rQ8U7hn31gGWKCYiXFpuKnrP+B4CyNDFEviVfeHvVXH5x/XduUiSJwbp
	KVL0FGyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQvhn-00000007EDC-3sRg;
	Wed, 03 Dec 2025 22:52:15 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQvhl-00000007ECl-1X3w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 22:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764802333; x=1796338333;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J7zI0uZIaYifzCeFY1jzSs++/SMtxwmTWF7MhGyaStk=;
  b=OBG/m1ECzXnP1qu6t1AC+HF6ozaCCF+ocGAtzAYSz+OjxfoRkcvAyxOV
   x3K/NSf3OqAgXtlUBefrS74b0kyry0y3f+6CA4JIcnW101Sl2EOEL8nSO
   BaAuufRzwaKrged+lsCs8aABzDCLe13aU/M9guvCEqZwplygRYvKceOr+
   E2VrBRfjvjJc6DnPlb9lzgJ9Z3+m3fiB6YekJRIN+x/tzqBDlIpDSobdR
   t8eF+Bk3RZco3kt+aHIFOMGDK2ikkJktevDcPmDytob5Zc8zjP0tsR0px
   P7Wd1nt16zzUacsfI6Blcf+gm86PdcQUKR5UTAPB2wBjLr0ijGSXp0tSq
   g==;
X-CSE-ConnectionGUID: 0Y/2foRmSdyA1Pr9YEduSA==
X-CSE-MsgGUID: OEStXuWNT3y+v2kpDDsedQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84413525"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="84413525"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 14:52:11 -0800
X-CSE-ConnectionGUID: PAUoZFRtR4i6DUhSo0WuFg==
X-CSE-MsgGUID: WOqu3ApoQvWqpsaXQdDexg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="232140090"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO [10.125.108.28]) ([10.125.108.28])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 14:52:10 -0800
Message-ID: <26b9cb6d-8370-4908-aed9-9c5b07e5fb82@intel.com>
Date: Wed, 3 Dec 2025 15:52:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: lpi2c: Use cleanup helper for
 dma_async_tx_descriptor error handling
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, carlos.song@nxp.com
References: <20251003-dma_chan_free-v2-0-564946b6c563@nxp.com>
 <20251003-dma_chan_free-v2-2-564946b6c563@nxp.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20251003-dma_chan_free-v2-2-564946b6c563@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_145213_432043_F13391F6 
X-CRM114-Status: GOOD (  17.47  )
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



On 10/3/25 9:26 AM, Frank Li wrote:
> Use the cleanup helper to simplify dma_async_tx_descriptor error handling.
> 
> No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change v2
>  need goto unmap buffer.
> 
> desc_prepare_err_exit:
>         dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>                          dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>         return -EINVAL;
> 
> submit_err_exit:
>         dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>                          dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>         dmaengine_desc_free(rx_cmd_desc)
> 
> auto cleanup by __free, so whole error path submit_err_exit can be removed
> and use desc_prepare_err_exit label.
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 03b5a7e8c361abe1d75fb4d31f9614bbc6387d93..e31c2d81f59f18a09d34f79896a7fa4bb83c0a12 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -722,7 +722,7 @@ static void lpi2c_dma_callback(void *data)
>  
>  static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>  {
> -	struct dma_async_tx_descriptor *rx_cmd_desc;
> +	struct dma_async_tx_descriptor *rx_cmd_desc __free(dma_async_tx_descriptor) = NULL;
>  	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
>  	struct dma_chan *txchan = dma->chan_tx;
>  	dma_cookie_t cookie;
> @@ -746,10 +746,11 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>  	cookie = dmaengine_submit(rx_cmd_desc);
>  	if (dma_submit_error(cookie)) {
>  		dev_err(&lpi2c_imx->adapter.dev, "submitting DMA failed, use pio\n");
> -		goto submit_err_exit;
> +		goto desc_prepare_err_exit;

Typically if you are introducing cleanup usage, you will want to remove all the goto usages. Otherwise it gets kinda messy having both styles. Although not sure how to do a cleanup macro with dma_unmap_*. Unless a local one where lpi2c_imx_dma also contains a ptr to the device. Then that may be doable. 

DJ>  	}
>  
>  	dma_async_issue_pending(txchan);
> +	retain_and_null_ptr(rx_cmd_desc);
>  
>  	return 0;
>  
> @@ -757,12 +758,6 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>  	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>  			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>  	return -EINVAL;
> -
> -submit_err_exit:
> -	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
> -			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
> -	dmaengine_desc_free(rx_cmd_desc);
> -	return -EINVAL;
>  }
>  
>  static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)
> 


