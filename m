Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EEFC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JI17jfGVb1g/QMqGoomF8hB7m62tDw1VCJzR/C1p+kI=; b=TmLXgh5uVZIU4wrpv17mKNQN5K
	0/QTjev2smudwh1wwtAfkSODKtegVLSUDTMfudrZ+kZOQoMbsqti6MH6SfOqC3NNLx3ERjjDktRro
	JoHQ7kW9yLAzj4loi8HGkVuXfCGEp28LW7Nk1GVRGIfoGNP5xL0retejSHUGAh4+LsCQKEsXh+CPL
	AYW4VfhUR+x1VUjuYdilrPUavOWNdyv2GW5Svd+xacdW8rVjk+vRqJgEKTuvejYY1BFaWKb5+F6EI
	cl0a3xaHNL8mjsuj+21Zkt+piR5rAxjVkALX5p/mXkEXsMYVr0ke5La12LKGcR1lM44OO974cCEJk
	hFW09czA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9k2-00000006gmF-0hQb;
	Tue, 24 Jun 2025 19:55:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7ZT-00000006Ok6-0QWq;
	Tue, 24 Jun 2025 17:36:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 613AA113E;
	Tue, 24 Jun 2025 10:36:15 -0700 (PDT)
Received: from [10.57.29.113] (unknown [10.57.29.113])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FC4E3F58B;
	Tue, 24 Jun 2025 10:36:31 -0700 (PDT)
Message-ID: <33672077-77b9-476c-9565-b78aae2a38de@arm.com>
Date: Tue, 24 Jun 2025 18:36:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] iommu: mtk_iommu_v1: Simplify by dropping local
 'mtk_mapping' variable
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
 <20250624-syscon-phandle-args-iommu-v3-3-1a36487d69b8@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250624-syscon-phandle-args-iommu-v3-3-1a36487d69b8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_103635_188754_CDF1929F 
X-CRM114-Status: GOOD (  22.15  )
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

On 2025-06-24 1:22 pm, Krzysztof Kozlowski wrote:
> Storing 'data->mapping' in local variable in
> mtk_iommu_v1_probe_finalize() does not make the code easier to read.
> Use the 'data->mapping' directly.
> 
> ARM64 W=1 builds also complain with:
> 
>    mtk_iommu_v1.c:512:28: error: variable 'mtk_mapping' set but not used [-Werror,-Wunused-but-set-variable]
> 
> but this is not being fixed here and 'data' still won't be used in such
> compile test.

Sorry, I guess that's on me for doing the COMPILE_TEST stubs the lazy 
way... TBH I'm still not sure this driver hasn't completely bitrotted, 
but if we're touching it at all we should probably actually fix the 
warning, e.g.:

-#define arm_iommu_attach_device(...)   -ENODEV
+#define arm_iommu_attach_device(d, m)  ((void)m, -ENODEV)

or perhaps make it a less lazy static inline.

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Old warning is changed now to:
> 
>    error: variable 'data' set but not used [-Werror,-Wunused-but-set-variable]
> ---
>   drivers/iommu/mtk_iommu_v1.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index 66824982e05fbfdda224276ad41b90f9d5f9ca4e..bbe3e9d901c69ac6405d9549a4481fc80f1adb80 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -509,14 +509,12 @@ static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
>   
>   static void mtk_iommu_v1_probe_finalize(struct device *dev)
>   {
> -	struct dma_iommu_mapping *mtk_mapping;
>   	struct mtk_iommu_v1_data *data;
>   	int err;
>   
>   	data        = dev_iommu_priv_get(dev);

And for the sake of a readability cleanup you may as well fold this into 
the declaration line as well. And then maybe also whack a __maybe_unused 
on it, for even less effort than the first silly thing I thought of 
above... :)

Thanks,
Robin.

> -	mtk_mapping = data->mapping;
>   
> -	err = arm_iommu_attach_device(dev, mtk_mapping);
> +	err = arm_iommu_attach_device(dev, data->mapping);
>   	if (err)
>   		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
>   }
> 


