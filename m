Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75DCD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5y0mjy/AnmqwFwXm6iMLRy3GSG7b5AJV4hPXL9m17BE=; b=ZtOTpKaT5rggYY7KyE5iP/LLi+
	RSjEXYng5AFMqr6I5mC44nTN72/wgyc4YpFJ0KR4ByBBi2UMaQ1tUxRVYkCOzg9tSd5+W/4QZ6ZN6
	CqoOZ3apfpfB1vDcLxlAN4t8N/QO4iS9oeI4PA3z/fIFZgGuWc/ho8Gvja5QjZSdE0N/l3KA5mf6r
	tYOmqKpzOjrwIgHiJgCRZmpn1A1Sj+Wy4pcWRUARcCegPOdBRe8xtGxJKK0Zno7sz6OuhbjqTM2GJ
	ALzz/nXDxRh1nZLZ8Hz3rDoi8N12R5LK3pirrYD34Y7PH/2/HiiVOm7Fgwm0l5SyvyRAKvjI5+jaS
	gTTrZ73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSw8R-0000000ECkd-1FrW;
	Tue, 09 Dec 2025 11:44:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSw8O-0000000ECkB-3rQc;
	Tue, 09 Dec 2025 11:44:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1583A1691;
	Tue,  9 Dec 2025 03:43:52 -0800 (PST)
Received: from [10.57.46.210] (unknown [10.57.46.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D19653F762;
	Tue,  9 Dec 2025 03:43:57 -0800 (PST)
Message-ID: <e22ea775-84e3-4116-a81a-52031be9f176@arm.com>
Date: Tue, 9 Dec 2025 11:43:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/rockchip: Check of_find_device_by_node() return
 value
To: Haotian Zhang <vulab@iscas.ac.cn>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251209113333.1086-1-vulab@iscas.ac.cn>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20251209113333.1086-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_034401_010972_B027CE1A 
X-CRM114-Status: GOOD (  14.94  )
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

On 2025-12-09 11:33 am, Haotian Zhang wrote:
> rk_iommu_of_xlate() calls of_find_device_by_node() without
> verifying it is non-NULL, which can lead to a NULL pointer
> dereference and crash.

No, it can't. Please look at how of_xlate is called - at this point we 
are looking up the IOMMU device, which has a driver bound to it, which 
has registered ops against this of_node that are the only way to reach 
this function in the first place. If the device could have somehow 
disappeared from underneath an active driver, this potential crash is 
the least of the kernel's worries...

Thanks,
Robin.

> Add a check for a NULL return from of_find_device_by_node()
> and return -ENODEV upon failure.
> 
> Fixes: 5fd577c3eac3 ("iommu/rockchip: Use OF_IOMMU to attach devices automatically")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>   drivers/iommu/rockchip-iommu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 0861dd469bd8..e59d0617574b 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -1153,6 +1153,8 @@ static int rk_iommu_of_xlate(struct device *dev,
>   	struct rk_iommudata *data;
>   
>   	iommu_dev = of_find_device_by_node(args->np);
> +	if (!iommu_dev)
> +		return -ENODEV;
>   
>   	data = devm_kzalloc(&iommu_dev->dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)


