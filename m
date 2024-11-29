Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2422BD729EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 16:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OVBGq+/1nN6qhr9PjN5vQt9zyaPUYhgugPlEbaqe7g=; b=E5zBwqPPuQZwAImlvc81/pjpNT
	GNVZzRqC+TMOcMbtDagFFUC7kkXPqUxd9viw/Hv7pWsDwoeaTVnrtiyDrzCfXh60HKN5l0rHjW0ry
	NzB0lt2/HoZeRjAWBvZWe7vxGM3j+YxOuE0nqFe5MwnolFgj2QnpMEQU+mdyo4VEzYeomwtrrpAzX
	QdtFuAIQ0WqpBavjyOuhxh/DBpayK02Fk9C6VxDmUwgrYJETbCA9alD+aJZxedUzhdlXzM4XPD5zM
	CQFQUqZRbfJZ1W891ACehlgTyPp/iMKk2fr/F/z03Coin8YlS3eWvVe0Rwd63mrLPsPXStQx+XWTi
	9LRqcpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH47p-00000000doy-1qtO;
	Fri, 29 Nov 2024 16:45:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH46q-00000000diW-2KJw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 16:44:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3316312FC;
	Fri, 29 Nov 2024 08:45:15 -0800 (PST)
Received: from [10.57.90.216] (unknown [10.57.90.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E72903F5A1;
	Fri, 29 Nov 2024 08:44:43 -0800 (PST)
Message-ID: <4dd1caa7-4b95-4e06-a5ac-e2d33ce88d04@arm.com>
Date: Fri, 29 Nov 2024 16:44:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: dma_request_chan_by_mask() defer probing
 unconditionally
To: Enric Balletbo i Serra <eballetb@redhat.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, u-kumar1@ti.com, vigneshr@ti.com,
 nm@ti.com
References: <20241127-defer-dma-request-chan-v1-1-203db7baf470@redhat.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241127-defer-dma-request-chan-v1-1-203db7baf470@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_084448_642654_6A10BCCC 
X-CRM114-Status: GOOD (  20.56  )
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

On 2024-11-27 8:23 am, Enric Balletbo i Serra wrote:
> Having no DMA devices registered is not a guarantee that the device
> doesn't exist, it could be that is not registered yet, so return
> EPROBE_DEFER unconditionally so the caller can wait for the required
> DMA device registered.
> 
> Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
> ---
> This patch fixes the following error on TI AM69-SK
> 
> [    2.854501] cadence-qspi 47040000.spi: error -ENODEV: No Rx DMA available
> 
> The DMA device is probed after cadence-qspi driver, so deferring it
> solves the problem.

Conversely, though, it does carry some risk that if there really is no 
DMA device/driver, other callers (e.g. spi-ti-qspi) may now get stuck 
deferring forever where the -ENODEV would have let them proceed with a 
fallback to non-DMA operation. driver_deferred_probe_check_state() is 
typically a good tool for these situations, but I guess it's a bit 
tricky in a context where we don't actually have the dependent device to 
hand :/

Thanks,
Robin.

> ---
>   drivers/dma/dmaengine.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index c1357d7f3dc6ca7899c4d68a039567e73b0f089d..57f07b477a5d9ad8f2656584b8c0d6dffb2ab469 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -889,10 +889,10 @@ struct dma_chan *dma_request_chan_by_mask(const dma_cap_mask_t *mask)
>   	chan = __dma_request_channel(mask, NULL, NULL, NULL);
>   	if (!chan) {
>   		mutex_lock(&dma_list_mutex);
> -		if (list_empty(&dma_device_list))
> -			chan = ERR_PTR(-EPROBE_DEFER);
> -		else
> -			chan = ERR_PTR(-ENODEV);
> +		/* If the required DMA device is not registered yet,
> +		 * return EPROBE_DEFER
> +		 */
> +		chan = ERR_PTR(-EPROBE_DEFER);
>   		mutex_unlock(&dma_list_mutex);
>   	}
>   
> 
> ---
> base-commit: 43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2
> change-id: 20241127-defer-dma-request-chan-4f26c62c8691
> 
> Best regards,


