Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF7ACAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 10:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pql4+9iK9J1XaKoIrXXTTeztSOhZE9LK27gYUKOWcpE=; b=iq95Lre5MAKk69dof7sPSbMZE6
	20tp6TkYuPxbVF0xNLC9WOAoRoYAluT5UMYw7TDK7CRNsTBWfZmlrRXds86tMIjh49adv5Q3ls/1r
	dne49z4EXJA1VyoBNHuf/uKEQ/ij4/hcIotWWKJgd9D2+uEre1R0/56pPYrnokX1Bh9kEJnh2T13z
	B26jbJafhcV5OwxY79QvP2fw90eceCSEGA1+TBZsT3chT851zz6Uwvtv/xxxdsYkqUElSpdl5d8T6
	ykkRwoKWCjvh+SA7jQRGT8Fq+07g77f9NMycKhItBldsXd0Cxg2KBXB3+MebvWc5YR7RtmvT4ZpL9
	LT5zxa2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5i34-0000000HIte-2Gpd;
	Mon, 06 Oct 2025 10:02:30 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5i32-0000000HIsS-0Uwf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 10:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:Subject:To:
	From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Pql4+9iK9J1XaKoIrXXTTeztSOhZE9LK27gYUKOWcpE=; b=UANFUV7g7tFGhEFjVRG2vRTT4N
	3pY0kdNdD6jylPU50cpNI0Q6ck49OVFOCZDG3vQvmhroX1M9wPej5JTdhCoa187Td4SeRJi2tulqK
	c6gczvH798FDnWwnQ1/4MkCkr5nd+A1Kh7KuCYKM5wi5lwy1k/KUlHBdTkUXg2OgZcUSz0l56zmM7
	RSBHep31kex3V9AJUv170mXqIJmpQbKqrTv/puP3k9cVMiKYjNhGn7XLzDmGNd/iaPWWoL5MzHrrm
	00hNoyPZ/XQVhEjWhXfChj9yZs5y2rbFmau8WqeBGI7ElcBUpSiFEa4QKETlKAyyNwvoImIBCqjjz
	mbwPRERA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1v5i30-000C8q-1J;
	Mon, 06 Oct 2025 12:02:26 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1v5i2z-000JYp-2I;
	Mon, 06 Oct 2025 12:02:26 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Oct 2025 10:02:25 +0000
Message-Id: <DDB5IRSNB09F.3HRTZZOZQ7J6@folker-schwesinger.de>
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Suraj Gupta" <suraj.gupta2@amd.com>, <vkoul@kernel.org>,
 <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>
Subject: Re: [PATCH V2 2/3] dmaengine: xilinx_dma: Enable transfer chaining
 for AXIDMA and MCDMA by removing idle restriction
X-Mailer: aerc 0.21.0-9-ga57e783008e9
References: <20251003061910.471575-1-suraj.gupta2@amd.com>
 <20251003061910.471575-3-suraj.gupta2@amd.com>
In-Reply-To: <20251003061910.471575-3-suraj.gupta2@amd.com>
X-Virus-Scanned: Clear (ClamAV 1.0.9/27780/Thu Oct  2 04:58:32 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_030228_156207_39827AEF 
X-CRM114-Status: GOOD (  15.46  )
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

On Fri Oct 3, 2025 at 8:19 AM CEST, Suraj Gupta wrote:
> Remove the restrictive idle check in xilinx_dma_start_transfer() and
> xilinx_mcdma_start_transfer() that prevented new transfers from being
> queued when the channel was busy.
> Additionally, only update the CURDESC register when the channel is
> running in scatter-gather mode and active list is empty to avoid
> interfering with transfers already in progress. When the active list
> contains transfers, the hardware tail pointer extension mechanism
> handles chaining automatically.
>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> Co-developed-by: Srinivas Neeli <srinivas.neeli@amd.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>

For the AXIDMA code paths:

Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>

> ---
>  drivers/dma/xilinx/xilinx_dma.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index 53b82ddad007..aa6589e88c5c 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -1548,9 +1548,6 @@ static void xilinx_dma_start_transfer(struct xilinx=
_dma_chan *chan)
>  	if (list_empty(&chan->pending_list))
>  		return;
> =20
> -	if (!chan->idle)
> -		return;
> -
>  	head_desc =3D list_first_entry(&chan->pending_list,
>  				     struct xilinx_dma_tx_descriptor, node);
>  	tail_desc =3D list_last_entry(&chan->pending_list,
> @@ -1567,7 +1564,7 @@ static void xilinx_dma_start_transfer(struct xilinx=
_dma_chan *chan)
>  		dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
>  	}
> =20
> -	if (chan->has_sg)
> +	if (chan->has_sg && list_empty(&chan->active_list))
>  		xilinx_write(chan, XILINX_DMA_REG_CURDESC,
>  			     head_desc->async_tx.phys);
>  	reg  &=3D ~XILINX_DMA_CR_DELAY_MAX;
> @@ -1627,9 +1624,6 @@ static void xilinx_mcdma_start_transfer(struct xili=
nx_dma_chan *chan)
>  	if (chan->err)
>  		return;
> =20
> -	if (!chan->idle)
> -		return;
> -
>  	if (list_empty(&chan->pending_list))
>  		return;
> =20
> @@ -1652,8 +1646,9 @@ static void xilinx_mcdma_start_transfer(struct xili=
nx_dma_chan *chan)
>  	dma_ctrl_write(chan, XILINX_MCDMA_CHAN_CR_OFFSET(chan->tdest), reg);
> =20
>  	/* Program current descriptor */
> -	xilinx_write(chan, XILINX_MCDMA_CHAN_CDESC_OFFSET(chan->tdest),
> -		     head_desc->async_tx.phys);
> +	if (chan->has_sg && list_empty(&chan->active_list))
> +		xilinx_write(chan, XILINX_MCDMA_CHAN_CDESC_OFFSET(chan->tdest),
> +			     head_desc->async_tx.phys);
> =20
>  	/* Program channel enable register */
>  	reg =3D dma_ctrl_read(chan, XILINX_MCDMA_CHEN_OFFSET);


