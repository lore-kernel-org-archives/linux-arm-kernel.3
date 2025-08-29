Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF68CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 12:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxwO0D5M5MsSF9UrsmntyUOWa7/+hES71CHZmWgGXPc=; b=uM0pHmNPFYVWd28B5J8lvFrSii
	D7AuI9Y1iZhCbnSg5KCB1vIicfqk18z4XkfgHyZk9ot4FkwJaIp96Tpy8CB2TaTRkSPM1y0eIsFtf
	xJW/8IvpKt7I8+lYfZvOrt4rBR+f3UuJ3v68C7VGamLa6PqwgIjuIIkNEtLUet7gLZVphOIOfyKE1
	A3D3yKcly8Zu6Iiw52JlT1P03+OXuuwx/Bft9sYV/V6F5Q8w35zMGU6OCzwqUK4Tu4nmnFEms3j3q
	mGrmkk0bgf8wgu6HXscd40NB9gYXYn5NGDgCB8ygSVpPM5+3UPMlb8TclH1gYErXrfazpZyg+Ndez
	Pp/W7o4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryAt-00000005do3-3n2t;
	Fri, 29 Aug 2025 12:25:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvw1-00000005Ek8-2UpK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:02:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10BF51758;
	Fri, 29 Aug 2025 03:02:07 -0700 (PDT)
Received: from [10.57.2.173] (unknown [10.57.2.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACCDD3F694;
	Fri, 29 Aug 2025 03:02:13 -0700 (PDT)
Message-ID: <82cf913c-f050-4325-ac5b-7efd0634d8ff@arm.com>
Date: Fri, 29 Aug 2025 11:02:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] dmaengine: dma350: Check vchan_next_desc() return
 value
To: Jisheng Zhang <jszhang@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250823154009.25992-1-jszhang@kernel.org>
 <20250823154009.25992-4-jszhang@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250823154009.25992-4-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_030217_674874_582D2182 
X-CRM114-Status: GOOD (  14.90  )
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
> vchan_next_desc() may return NULL, check its return value.

IIRC it's important that dch->desc gets set to NULL in that case, 
otherwise things can go wonky after a completion interrupt - i.e. the 
current code *is* using the return value both ways, just the sneaky 
thing is that it does actually depend on "vd" being the first member of 
d350_desc to do it concisely, sorry I didn't document that.

Thanks,
Robin.
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   drivers/dma/arm-dma350.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 24cbadc5f076..96350d15ed85 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -399,11 +399,14 @@ static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie
>   static void d350_start_next(struct d350_chan *dch)
>   {
>   	u32 hdr, *reg;
> +	struct virt_dma_desc *vd;
>   
> -	dch->desc = to_d350_desc(vchan_next_desc(&dch->vc));
> -	if (!dch->desc)
> +	vd = vchan_next_desc(&dch->vc);
> +	if (!vd)
>   		return;
>   
> +	dch->desc = to_d350_desc(vd);
> +
>   	list_del(&dch->desc->vd.node);
>   	dch->status = DMA_IN_PROGRESS;
>   	dch->cookie = dch->desc->vd.tx.cookie;


