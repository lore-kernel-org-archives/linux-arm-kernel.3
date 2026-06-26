Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D97C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 13:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2Idfefkhd5yd2wTqXvp/0zaLmn55htaW7rWMLoCA2w=; b=zl50gY0Yaigt+7m2nZvSEiOQUX
	oePrQFeh02lQKNYJHKEkfpweF6o38QdmbPok89UyKesWidh9FWpBPXpHtoeK4+B1apdZeEeFThzPc
	f3qYhEi1FVocBYn9oNpvPyxg8OJjix0v8Jh3/vanrX47asVBDxwj2L2KDmEndkHBLuO5pgtvRJ558
	c+yblYjobgEBq/IrtdAFY4mS5fMuyuKyTGjnF2ze9u0JrZJfgOvFZX/DlBL9QPj3pfP7lHiN1XnTW
	IAcVWSAjA5VvbxM6X68Mtt3+VIlvb8XB48FwIC4b5ad2bwjO+ZGj6VjOmZZsRAoLXDAqBBp1Q8P9r
	QeHS37fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6Aw-0000000BLXD-3o3L;
	Fri, 26 Jun 2026 13:00:54 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6Ar-0000000BLVA-467e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 13:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=P2Idfefkhd5yd2wTqXvp/0zaLmn55htaW7rWMLoCA2w=; b=fCb6qML9biq0KYATmm+LYcSegQ
	fwq23ZA3TmsHz4YwMcG1/3eR7iaRM6/yYCi1EenQA3gZvonB0ZjqDt5icDzqDqdi/Ytl1X0HVbLiL
	RdvoAC9UOzVpZ6DecBzuI2vvlpSus1DCvsirhrNnkDkme7N4MQDBM7sJZj2IFszenrtFw3Bw6dAis
	HApFD0lgo75fSYNpvbj6UGAdnOq4rB0dMBEwpOZB7S3XTtHDAxH+pHPM7fLGlpiHLmovLkcQDwt3H
	yEO37KdeKmZNA4rGr8Dzkq/3EehBSUqJ+/vqaKB6HE1x4jabS587kHOvEqsu8QoV1Fs4zRyU8yhfD
	ABVaFw2Q==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1wd6Ak-00018g-2k;
	Fri, 26 Jun 2026 15:00:42 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1wd69m-000Cq5-0G;
	Fri, 26 Jun 2026 15:00:42 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 13:00:41 +0000
Message-Id: <DJJ00J6ROCIR.17UYIA64S2JHY@folker-schwesinger.de>
Subject: Re: [PATCH v3 2/3] dmaengine: xilinx_dma: Enable transfer chaining
 for AXIDMA and MCDMA by removing idle restriction
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Suraj Gupta" <suraj.gupta2@amd.com>, <vkoul@kernel.org>,
 <Frank.Li@kernel.org>, <michal.simek@amd.com>
X-Mailer: aerc 0.21.0-151-gce80509b8454
References: <20260626092656.1563871-1-suraj.gupta2@amd.com>
 <20260626092656.1563871-3-suraj.gupta2@amd.com>
In-Reply-To: <20260626092656.1563871-3-suraj.gupta2@amd.com>
X-Virus-Scanned: Clear (ClamAV 1.4.3/28043/Fri Jun 26 08:24:31 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_060050_318881_D234CF6D 
X-CRM114-Status: GOOD (  20.33  )
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

On Fri Jun 26, 2026 at 11:26 AM CEST, Suraj Gupta wrote:
> Relax the idle check in xilinx_dma_start_transfer() and
> xilinx_mcdma_start_transfer() that prevented new transfers from being
> queued when the channel was busy, so scatter-gather transfers can be
> chained onto an in-flight transfer.
>
> In scatter-gather mode, only update the CURDESC register when the active
> list is empty to avoid interfering with transfers already in progress.
> When the active list contains transfers, the hardware tail pointer
> extension mechanism handles chaining automatically via the descriptor
> next pointer chain, which is set up at channel allocation and preserved
> across descriptor recycling.
>
> Direct (non-SG) mode has no descriptor queue: writing the BTT register
> launches a transfer immediately, so a new transfer must not be programmed
> while one is in flight. Keep those transfers serialized by retaining the
> idle check on the non-SG path. MCDMA always operates in scatter-gather
> mode, so it is unaffected.
>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> Co-developed-by: Srinivas Neeli <srinivas.neeli@amd.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>

For the AXIDMA SG-path:

Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>

> ---
>  drivers/dma/xilinx/xilinx_dma.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index ca396b709742..6e7b183cb499 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -1580,7 +1580,14 @@ static void xilinx_dma_start_transfer(struct xilin=
x_dma_chan *chan)
>  		return;
>  	}
> =20
> -	if (!chan->idle)
> +	/*
> +	 * Direct (non-SG) mode has no descriptor queue: writing the BTT
> +	 * register launches a transfer immediately, so a new transfer must
> +	 * not be programmed while one is in flight. Keep such transfers
> +	 * serialized. SG mode supports chaining onto a running transfer via
> +	 * tail-pointer extension, so it is allowed to proceed when busy.
> +	 */
> +	if (!chan->has_sg && !chan->idle)
>  		return;
> =20
>  	head_desc =3D list_first_entry(&chan->pending_list,
> @@ -1599,7 +1606,7 @@ static void xilinx_dma_start_transfer(struct xilinx=
_dma_chan *chan)
>  		dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
>  	}
> =20
> -	if (chan->has_sg)
> +	if (chan->has_sg && list_empty(&chan->active_list))
>  		xilinx_write(chan, XILINX_DMA_REG_CURDESC,
>  			     head_desc->async_tx.phys);
>  	reg  &=3D ~XILINX_DMA_CR_DELAY_MAX;
> @@ -1660,9 +1667,6 @@ static void xilinx_mcdma_start_transfer(struct xili=
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
> @@ -1685,8 +1689,9 @@ static void xilinx_mcdma_start_transfer(struct xili=
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


