Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35171CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myx4/5jFEwgPMypRQW0MvCw37lba0AGpLfeSdkY6mNw=; b=uveYsUMpfkkcYmpjUEM5mJHgpO
	NPpe6VRJPL0Uayf2t/oq6ujDrgoeK/lB20hwFIZiJEFtXea71jAQywWd8fB4V1aFNy0XN/3k5poze
	uP1ubrX3HLvIh3OtWJ8L0Ot6UTWuwL/kAPBdtzAy5l53IgHeR/FtAjpMw4/5A/PecVSxgUuAAfZyc
	GTMptEI5bVP82lpRcKM0PVS3g0s+MgUz+RBOCJqtkd7479+/czsaZJ8ZVe67KMAHgX0rpVkIwssQa
	gLC/I6pq0GsiqwRky6BIVFq+8Fcm4hVZt5xy6+s+fcF0crBD1zw0B8jAzgnngmecBdWJky+XaQ2W8
	vZveKrKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0UO-000000066lw-44Sb;
	Fri, 29 Aug 2025 14:54:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwj3-00000005O5t-1hCP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:52:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DE9719F0;
	Fri, 29 Aug 2025 03:52:48 -0700 (PDT)
Received: from [10.57.2.173] (unknown [10.57.2.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 374673F738;
	Fri, 29 Aug 2025 03:52:55 -0700 (PDT)
Message-ID: <857fd009-bfef-4da9-b6a8-832f0c8b3154@arm.com>
Date: Fri, 29 Aug 2025 11:52:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] dmaengine: dma350: Add missing dch->coherent
 setting
To: Jisheng Zhang <jszhang@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250823154009.25992-1-jszhang@kernel.org>
 <20250823154009.25992-3-jszhang@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250823154009.25992-3-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_035257_489104_3B9FCE7E 
X-CRM114-Status: GOOD (  13.88  )
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

On 2025-08-23 4:39 pm, Jisheng Zhang wrote:
> The dch->coherent setting is missing.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   drivers/dma/arm-dma350.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index bf3962f00650..24cbadc5f076 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -587,6 +587,7 @@ static int d350_probe(struct platform_device *pdev)
>   	for (int i = 0; i < nchan; i++) {
>   		struct d350_chan *dch = &dmac->channels[i];
>   
> +		dch->coherent = coherent;

Nit: I'd put this a bit further down with the CH_LINKATTR setup, but 
otherwise,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

>   		dch->base = base + DMACH(i);
>   		writel_relaxed(CH_CMD_CLEAR, dch->base + CH_CMD);
>   


