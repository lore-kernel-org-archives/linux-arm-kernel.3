Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35246CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 07:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTiiARvjYDiBVt7M/XCY8cwwyM5K4Ezubm3vBRd2AEY=; b=vB580SU9d9COIpJMlYFfxd+qI6
	sDWyFECOfGaTCKhBK8kuTQm4F7611A8ocEgfSXl6IFDmeG/Ww5Hs+GkHJ2vJ+DoiaQKG/STLKu86J
	DVk8ZuYd4dct6wopi0uEDVb8dj5IZYVZZs69RdYAsaMC8CQ5UiX4n0cLVAuGmAWs+l8wytz53PKJg
	ila5DTkBFnsK928xpH6Uq6UIWp12DKi2FzuisLD++72KV3WND8GKUG/zKgHXRsHcXShdLy3SJPBOn
	p6o6mGlwOLrxj8V1BGmZzkadVUBKLmmzaLaWMguwegDxAk44F1sJ1X9J0hdi1GbigEzB4IVEok8W8
	ZV5jR5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz99d-0000000GYOv-3RY5;
	Thu, 18 Sep 2025 07:34:09 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz99b-0000000GYN8-1jtM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 07:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YTiiARvjYDiBVt7M/XCY8cwwyM5K4Ezubm3vBRd2AEY=; b=IegsR67wiIdFsX7vitr1JXNWdC
	VF+EHnF3AQ/2W5TIaqQ3RTDUHhXbEP/D4m6RHSoa4RZhd9WIvxx1AewIf8AvfqeruuG9uDGS7XIFL
	OUSaCosYU6pNCEhaghyv8W5TMPTZSphcP/Z/Iqc5oVaBJzQ+cf4tnexT6rK0tGqqJPc160awgcuGS
	I2L9oWHmh9vAyMm41gjmmpJS3gL9lwR74QI7pDHXF+pnHeDWMblGFlBQvzFTmJ3v3jowcdm+eBk+N
	LM07aW4aYtHEMEcRtLkDnYN28+ACjvVO8KcDYP5IEzqwwX4w1yM9CymriuPgTUvHcuM6qupTMLd2Q
	fkY1Jt7w==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1uz99Z-000Cqq-1M;
	Thu, 18 Sep 2025 09:34:05 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1uz99Y-000378-21;
	Thu, 18 Sep 2025 09:34:05 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Sep 2025 07:34:03 +0000
Message-Id: <DCVR3DC53STM.3H636S2IWLLG9@folker-schwesinger.de>
Subject: Re: [PATCH 3/3] dmaengine: xilinx_dma: Optimize control register
 write and channel start logic in xilinx_dma_start_transfer
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Suraj Gupta" <suraj.gupta2@amd.com>, <vkoul@kernel.org>,
 <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250917133609.231316-1-suraj.gupta2@amd.com>
 <20250917133609.231316-4-suraj.gupta2@amd.com>
In-Reply-To: <20250917133609.231316-4-suraj.gupta2@amd.com>
X-Virus-Scanned: Clear (ClamAV 1.0.9/27765/Tue Sep 16 10:26:41 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_003407_453088_6785A260 
X-CRM114-Status: GOOD (  14.59  )
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

On Wed Sep 17, 2025 at 3:36 PM CEST, Suraj Gupta wrote:
> Optimize AXI DMA control register programming by consolidating
> coalesce count and delay configuration into a single register write.
> Previously, the coalesce count was written separately from the delay
> configuration, resulting in two register writes. Combine these into
> one write operation to reduce bus overhead.
> Additionally, avoid redundant channel starts by only calling
> xilinx_dma_start() when the channel is actually idle.
>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>

Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>

> ---
>  drivers/dma/xilinx/xilinx_dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index 7211c394cdca..6e9bf4732ded 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -1561,7 +1561,6 @@ static void xilinx_dma_start_transfer(struct xilinx=
_dma_chan *chan)
>  		reg &=3D ~XILINX_DMA_CR_COALESCE_MAX;
>  		reg |=3D chan->desc_pendingcount <<
>  				  XILINX_DMA_CR_COALESCE_SHIFT;
> -		dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
>  	}
> =20
>  	if (chan->has_sg && list_empty(&chan->active_list))
> @@ -1571,7 +1570,8 @@ static void xilinx_dma_start_transfer(struct xilinx=
_dma_chan *chan)
>  	reg  |=3D chan->irq_delay << XILINX_DMA_CR_DELAY_SHIFT;
>  	dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
> =20
> -	xilinx_dma_start(chan);
> +	if (chan->idle)
> +		xilinx_dma_start(chan);
> =20
>  	if (chan->err)
>  		return;


