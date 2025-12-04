Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806AFD2168D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 15:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3/3Hb3qfYZzW2bYv2yTJjcAh5kwXWl3c9WrFjjDxww=; b=HH0//hrJeE/JqNgyBAyWgJangD
	vb78eSqEDOCEqp8F5OqyuK+r5AnUnhX/Pa2wIZSK9QXcPXtZyO0p6CIOrpb0chbpNH073y4t14QsP
	8v7SLK/mrIjUkaWQdPVsw6GTZFjIknRwIZ3rok8SJiDTN+i8REPV+ha2nzdyusi/imdobahrbjX52
	cueaSoXnXZXqPBF7LP05DLIgTctv3iUFIG+dTvyDaUI9Iy4Nhb7URI/j23vp23WTk6HrC2HgVO5cN
	CLGjhpxYtvQSinvcCElq/04Z0nrhtnntL3D9DFbYt3DbriySeeD/0atTwwO+b/JUh5qR0xbAMyPPT
	4Oj5nhcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAxK-00000008BcO-0igY;
	Thu, 04 Dec 2025 15:09:18 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAxI-00000008Bbw-0omT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 15:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764860956; x=1796396956;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0sFsd5k8Q0vVJXdJf/IRTs0ofL7IMrAGQDQFMFrLC5c=;
  b=A5YSqXS6229/46i2HBFEUrGLtht86vv5ZlzRvjGxHuIfZCQrQ89a+XZL
   Ej3fs1V1XoK1Jb8WySn+ZHbVpkxbXcJY/hTOjF5hiyVBqI8V63UhZsRae
   p8f38LJB58GYYvzUnDI3AaYxj+TukNcfH/o9jdYyi4vQtg5DJ75GmDdEI
   q8fN1nWHVf3YfFJaslzrEOMbb32uTD9icnAEa7o4GX2ZPX22UnlyigKEh
   HnJTU0SmC01OdkSLXR9fm48bw3utSVBJBpdlQgAD15N9/bKpSsAbTi6L/
   +C77IPqkh1ermiiOwMVWA/Xvw+AbNbY/g5oEsTL1oZpdRKKEeBwEDUI0y
   Q==;
X-CSE-ConnectionGUID: wR0tSpEQT3eH/1z9zMsOpA==
X-CSE-MsgGUID: zIlNKMMPSj6hoHV4SJYoQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84280664"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="84280664"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 07:09:14 -0800
X-CSE-ConnectionGUID: ea1+yHXsTTKRqWUCFFHAag==
X-CSE-MsgGUID: FMlvhaqoQ2q5MO16oqZAdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="194073418"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.108.95]) ([10.125.108.95])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 07:09:13 -0800
Message-ID: <3a065c54-f043-4c94-ac52-ef5b48a0dc71@intel.com>
Date: Thu, 4 Dec 2025 08:09:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: lpi2c: Use cleanup helper for
 dma_async_tx_descriptor error handling
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 carlos.song@nxp.com
References: <20251003-dma_chan_free-v2-0-564946b6c563@nxp.com>
 <20251003-dma_chan_free-v2-2-564946b6c563@nxp.com>
 <26b9cb6d-8370-4908-aed9-9c5b07e5fb82@intel.com>
 <aTDjmdfUk94R3Dyk@lizhi-Precision-Tower-5810>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <aTDjmdfUk94R3Dyk@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_070916_279602_520CF956 
X-CRM114-Status: GOOD (  17.48  )
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



On 12/3/25 6:27 PM, Frank Li wrote:
> On Wed, Dec 03, 2025 at 03:52:09PM -0700, Dave Jiang wrote:
>>
>>
>> On 10/3/25 9:26 AM, Frank Li wrote:
>>> Use the cleanup helper to simplify dma_async_tx_descriptor error handling.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>> change v2
>>>  need goto unmap buffer.
>>>
>>> desc_prepare_err_exit:
>>>         dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>>>                          dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>>>         return -EINVAL;
>>>
>>> submit_err_exit:
>>>         dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>>>                          dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>>>         dmaengine_desc_free(rx_cmd_desc)
>>>
>>> auto cleanup by __free, so whole error path submit_err_exit can be removed
>>> and use desc_prepare_err_exit label.
>>> ---
>>>  drivers/i2c/busses/i2c-imx-lpi2c.c | 11 +++--------
>>>  1 file changed, 3 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
>>> index 03b5a7e8c361abe1d75fb4d31f9614bbc6387d93..e31c2d81f59f18a09d34f79896a7fa4bb83c0a12 100644
>>> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
>>> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
>>> @@ -722,7 +722,7 @@ static void lpi2c_dma_callback(void *data)
>>>
>>>  static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>>>  {
>>> -	struct dma_async_tx_descriptor *rx_cmd_desc;
>>> +	struct dma_async_tx_descriptor *rx_cmd_desc __free(dma_async_tx_descriptor) = NULL;
>>>  	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
>>>  	struct dma_chan *txchan = dma->chan_tx;
>>>  	dma_cookie_t cookie;
>>> @@ -746,10 +746,11 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>>>  	cookie = dmaengine_submit(rx_cmd_desc);
>>>  	if (dma_submit_error(cookie)) {
>>>  		dev_err(&lpi2c_imx->adapter.dev, "submitting DMA failed, use pio\n");
>>> -		goto submit_err_exit;
>>> +		goto desc_prepare_err_exit;
>>
>> Typically if you are introducing cleanup usage, you will want to remove all the goto usages. Otherwise it gets kinda messy having both styles. Although not sure how to do a cleanup macro with dma_unmap_*. Unless a local one where lpi2c_imx_dma also contains a ptr to the device. Then that may be doable.
> 
> dma_unmap() patch at
> https://lore.kernel.org/imx/aPZbuY5bLpkoO2J%2F@lizhi-Precision-Tower-5810/
> 
> The first patch need be pickup and dma umap firstly.  Then I can remove all
> goto.

perfect


> 
> Frank
> 
>>
>> DJ>  	}
>>>
>>>  	dma_async_issue_pending(txchan);
>>> +	retain_and_null_ptr(rx_cmd_desc);
>>>
>>>  	return 0;
>>>
>>> @@ -757,12 +758,6 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>>>  	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>>>  			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>>>  	return -EINVAL;
>>> -
>>> -submit_err_exit:
>>> -	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>>> -			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>>> -	dmaengine_desc_free(rx_cmd_desc);
>>> -	return -EINVAL;
>>>  }
>>>
>>>  static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)
>>>
>>
> 


