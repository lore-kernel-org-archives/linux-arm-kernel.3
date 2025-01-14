Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288F4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 19:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elTGNPu988fAjTrte4nu/pddpSDUwQszKGZ49ovLxfc=; b=KzulNBkpFg2o5DMEHVwneiRAJh
	0urfYsuRAGKG7puL3QZpvPWDcrA4p0tgeYP+mvyXpYGhaY1v6s/X79nLjC/KRCDtn9t0OVNUQoG3U
	CbhiMgixSaupICmbXSHwOqnoFrbaU+pXAXRrS+wzc5Px9H2C/RyHkz8HajkOxU9aZpUUGBoe74+JZ
	3pMDEj5Wh8o4Jhh5q2im+9ohrJbmBRJ5wT+FizaSw7WwhxVu+YSgiwmjAZIQyXuSSeMjmX/nn+Mbw
	7CH3F4TO7D0BpSjBs4KNk6wXGU1k7xeHYr7enDFsGw+JoeCkLL2RvJlZNBcVpMZghQoeFaVfoS93w
	fe8BK5PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXn0h-00000009azP-0rxH;
	Tue, 14 Jan 2025 19:55:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmyp-00000009abO-3y7r;
	Tue, 14 Jan 2025 19:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=elTGNPu988fAjTrte4nu/pddpSDUwQszKGZ49ovLxfc=; b=MjPzkRGPKNYsvU1uc5+Pq6wcAk
	27LVQ7PmktQQgGI9NXBvjERYPeKgL/L/mmM8IYrZHYoxkYntegNpyD6rbfvpjzklp/+3WBdfdAjIU
	MVdwcwYs3owINMW/gYHJCzQeJLLQCkKuZ69pXn7H7k7y3ejKT54v2Pyw04AoHR03krcXLFuVN1/Yg
	/U9ZdogGhdv/hjp3ZptTFSmiIQ0TZhEq9m4dooWWKF/1TLw0RyEu5NAV85NJfSWm1htFSo02TiMYx
	xLItCJwAaQZY/+OEoHtJ8mYm4kGL5qCdE5Rez7RfWfvW1fMzbelTJ+hRurFzyZ2FFTEaBPLDlA9+O
	fXQof7lQ==;
Received: from i53875b2c.versanet.de ([83.135.91.44] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tXmyf-0007Mt-L4; Tue, 14 Jan 2025 20:53:29 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] iommu: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 20:53:28 +0100
Message-ID: <23826147.6Emhk5qWAg@diego>
In-Reply-To: <20250114192642.912331-1-krzysztof.kozlowski@linaro.org>
References: <20250114192642.912331-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_115340_008613_5EF2AAC1 
X-CRM114-Status: GOOD (  15.95  )
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

Am Dienstag, 14. Januar 2025, 20:26:42 CET schrieb Krzysztof Kozlowski:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

>  drivers/iommu/rockchip-iommu.c              | 3 ++-

For the Rockchip part
Acked-by: Heiko Stuebner <heiko@sntech.de>

> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 4b369419b32c..323cc665c357 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -25,6 +25,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <linux/string_choices.h>
>  
>  #include "iommu-pages.h"
>  
> @@ -611,7 +612,7 @@ static irqreturn_t rk_iommu_irq(int irq, void *dev_id)
>  
>  			dev_err(iommu->dev, "Page fault at %pad of type %s\n",
>  				&iova,
> -				(flags == IOMMU_FAULT_WRITE) ? "write" : "read");
> +				str_write_read(flags == IOMMU_FAULT_WRITE));
>  
>  			log_iova(iommu, i, iova);
>  
> 





