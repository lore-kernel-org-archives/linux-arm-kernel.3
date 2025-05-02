Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0912C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 13:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnvkwvdpfvDbx1pMvmOORuDx/COchNGpzlyCKbIyomc=; b=TXj99jf8mnIS9zyhSFBmPrVnqC
	CZlaHy/d/m4SvwWHMVo4LqQNiEIGbX3TcqHkO0wNYA/kNOhehIWwJhpK9l9MGp3QJkQw8N8/2G6sF
	Gl8UUdkXGF7G5QN4YTclp4AkIB+7a5PpCuoGX8Ol3U24b/SL/3Tw2Fl+jI+rOlA1iwhmGUD7Gk3kC
	tya+1SqbSEeBZadXHt30+e/n9pjuoJm83P7KToFuSCs/02Fe5Uvaq44wu/pQKaBfDKBM3ogRELNAN
	1av4jaodjRv96mC4vpcx9GFc2qA8pFLEYiWola3I5DQax66/yjoZlcO/VyXkSCmNgya9dte0oiIMM
	7jl6O7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqkG-000000026ML-2P3T;
	Fri, 02 May 2025 13:48:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqZX-000000024jA-17RY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 13:37:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 745AF1688;
	Fri,  2 May 2025 06:36:48 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F6A53F66E;
	Fri,  2 May 2025 06:36:52 -0700 (PDT)
Message-ID: <6236d3cb-fbf2-4a41-a84a-276aa8079b9a@arm.com>
Date: Fri, 2 May 2025 14:36:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] tee: tee_device_alloc(): copy dma_mask from
 parent device
To: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-2-jens.wiklander@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250502100049.1746335-2-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_063659_368447_C6D2180E 
X-CRM114-Status: GOOD (  16.57  )
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

On 02/05/2025 10:59 am, Jens Wiklander wrote:
> If a parent device is supplied to tee_device_alloc(), copy the dma_mask
> field into the new device. This avoids future warnings when mapping a
> DMA-buf for the device.

That also sounds dodgy. If the parent device is the hardware device 
physically performing the DMA, then that is the device which should be 
passed to the DMA API. Trying to copy random bits of one device's 
configuration to another device and hoping it will work is not robust - 
not only is DMA-relevant information all over the place, including in 
archdata and/or bus/IOMMU driver-private data, but it can also opens up 
a whole can of subtle lifecycle issues...

> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
> ---
>   drivers/tee/tee_core.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index d113679b1e2d..685afcaa3ea1 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
>   	teedev->dev.class = &tee_class;
>   	teedev->dev.release = tee_release_device;
>   	teedev->dev.parent = dev;
> +	if (dev)
> +		teedev->dev.dma_mask = dev->dma_mask;

...for instance, I don't see any obvious guarantee that "dev" can't go 
away during the lifetime of "teedev" and leave this pointer dangling.

Thanks,
Robin.

>   
>   	teedev->dev.devt = MKDEV(MAJOR(tee_devt), teedev->id);
>   

