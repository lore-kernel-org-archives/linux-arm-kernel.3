Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E1DCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 13:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSmLfzHQG0lRZ6imz419vi6zPx6BOfsuVk+vqsXMUkc=; b=O8Ae/zkSqEy7BlPcE1/IJTN3pG
	3WKDhzoOZKV6jQJN5NBSDA6LxrCfZ/xYq7egOjsYqwtg5NZpuaySnEkMquklrUfRP8kGYgEgI0hkl
	EoaBmDNS+B6HMG5SvYdvig+a7QQ7Am4UOx7bUnXpRKz/MYdp0FZWjflNkL2Hq2jDW9vggfVu2gJUI
	QZbQk1wNnFevhxZ6mB2iLed9Ef7Xq6ndIleVPc+YEFBFNlx/DzLYEQYnpEYrXv0JRPhFPXK+rOZVb
	bjArahQ7hqdOpt8NrjcvGlvsckvu13vBtyVYWDnEF7yz/woLgqkn4wKmSnAO2qGxio+izq8MmbWv+
	VcmNUTqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urz6n-00000005ock-0bol;
	Fri, 29 Aug 2025 13:25:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwYk-00000005MgE-3F4w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:42:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAC301758;
	Fri, 29 Aug 2025 03:42:09 -0700 (PDT)
Received: from [10.57.2.173] (unknown [10.57.2.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F63F3F694;
	Fri, 29 Aug 2025 03:42:16 -0700 (PDT)
Message-ID: <57528c01-2a1c-4d70-b70c-ed4b64bd93fc@arm.com>
Date: Fri, 29 Aug 2025 11:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/14] dmaengine: dma350: Check dma_cookie_status() ret
 code and txstate
To: Jisheng Zhang <jszhang@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250823154009.25992-1-jszhang@kernel.org>
 <20250823154009.25992-5-jszhang@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250823154009.25992-5-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_034218_855883_5558E260 
X-CRM114-Status: GOOD (  19.81  )
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
> If dma_cookie_status() returns DMA_COMPLETE, we can return immediately.
> 
>  From another side, the txstate is an optional parameter used to get a
> struct with auxilary transfer status information. When not provided
> the call to device_tx_status() should return the status of the dma
> cookie. Return the status of dma cookie when the txstate optional
> parameter is not provided.

Again, the current code was definitely intentional - I think this was 
down to the hardware error case, where for reasons I now can't remember 
I still had to nominally complete the aborted descriptor from the IRQ 
handler to avoid causing some worse problem, and hence we don't return 
early without cross-checking dch->status here, because returning 
DMA_COMPLETE when the descriptor hasn't done its job makes dmatest unhappy.

I did spend a *lot* of time exercising all the error cases, and trying 
to get a sensible result across all of the different reporting APIs was 
fiddly to say the least - there's a huge lack of consistency between 
drivers in this regard, and this was just my attempt to be the 
least-worst one :)

Thanks,
Robin.

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   drivers/dma/arm-dma350.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 96350d15ed85..17af9bb2a18f 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -377,6 +377,8 @@ static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie
>   	u32 residue = 0;
>   
>   	status = dma_cookie_status(chan, cookie, state);
> +	if (status == DMA_COMPLETE || !state)
> +		return status;
>   
>   	spin_lock_irqsave(&dch->vc.lock, flags);
>   	if (cookie == dch->cookie) {


