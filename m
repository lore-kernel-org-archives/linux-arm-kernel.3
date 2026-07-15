Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064E3C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9sbXL5nbqoFjpzCr3igS6PqsJ+mF4wAWSUROVb14qU=; b=amyDmzJeIr4ZPF+/G5v1VCR/eP
	p6CSs+JmLr5SK+fmLoNQ/E+Eu5j7HgR5mnf6fbCaRlekyfDqvpURy3zm8JPjoS7ea8oBbvS8fkT3Y
	eOMDvux+mzRr9IkRRZOYoubn6FXp9FSjjziaYjpbVaMuhbf5IX/V40uKge6/3Z/Y63NGTWsdXZvjW
	OgsTzOk5HVNOZJgtV+1MhaRsfe0zBlTxIjbhlbh7vW2GEOSy4Lel+hOIsQXpc7tiSYcKe4B/RiuXy
	//PjGyrnmR/l0FtNg/GT2/PXLmwVmCKBfjl05Bm+bNJQ4lyDyi6UxKi95T2/L5gAiOdhI/bMGEmSe
	wZt7ZNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyln-0000000Eo03-0JSM;
	Wed, 15 Jul 2026 12:31:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjylk-0000000Enyn-1MiP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:31:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EFDA1477;
	Wed, 15 Jul 2026 05:31:12 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D78FC3F7B4;
	Wed, 15 Jul 2026 05:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784118676; bh=egBPbzIXms4fL1Qs09T5XJ/wfT9wY+BYWZ3eoAlNZds=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VltoKQHcQlJoexJ6Jjp1KA4NelG2bX/uvsh5bL9ZClb4EclHnT1d40E/afJa1IGeg
	 JJMEyTjyWcvN23arFO6KJvqIM6oy/YRGbo9LoeE4/opElDdFRETlU9ka3gvC/hgKIU
	 fc6ytDHpi7PFogTDUVijGk8Ii2vAIQyrtPjlwQ5Y=
Message-ID: <f9d66162-a30f-4184-aa0e-61719afbd1e1@arm.com>
Date: Wed, 15 Jul 2026 13:31:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] dmaengine: arm-dma350: enable ANYCH interrupt for
 shared IRQ wiring
To: Jun Guo <jun.guo@cixtech.com>, peter.chen@cixtech.com,
 fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, Frank.Li@kernel.org
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 linux-arm-kernel@lists.infradead.org
References: <20260521072924.3000282-1-jun.guo@cixtech.com>
 <20260521072924.3000282-2-jun.guo@cixtech.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260521072924.3000282-2-jun.guo@cixtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_053120_413690_DC493445 
X-CRM114-Status: GOOD (  14.02  )
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

On 21/05/2026 8:29 am, Jun Guo wrote:
> Enable DMANSECCTRL.INTREN_ANYCHINTR during probe so channel
> interrupts are propagated when integrators wire DMA-350 channels
> onto a shared IRQ line.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Jun Guo <jun.guo@cixtech.com>
> ---
>   drivers/dma/arm-dma350.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 84220fa83029..09403aca8bb0 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -13,6 +13,11 @@
>   #include "dmaengine.h"
>   #include "virt-dma.h"
>   
> +#define DMANSECCTRL		0x200
> +
> +#define NSEC_CTRL		0x0c
> +#define INTREN_ANYCHINTR_EN	BIT(0)
> +
>   #define DMAINFO			0x0f00
>   
>   #define DMA_BUILDCFG0		0xb0
> @@ -582,6 +587,10 @@ static int d350_probe(struct platform_device *pdev)
>   	dmac->dma.device_issue_pending = d350_issue_pending;
>   	INIT_LIST_HEAD(&dmac->dma.channels);
>   
> +	reg = readl_relaxed(base + DMANSECCTRL + NSEC_CTRL);
> +	writel_relaxed(reg | INTREN_ANYCHINTR_EN,
> +		       base + DMANSECCTRL + NSEC_CTRL);
> +
>   	/* Would be nice to have per-channel caps for this... */
>   	memset = true;
>   	for (int i = 0; i < nchan; i++) {


