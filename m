Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0F3CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 10:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l27ZY3jOmzA73svt5ou/Sjkka4JiXmht+5hbNg1N6UY=; b=CcRr1c69PRRmSKTlmrINZodMNb
	KbjIvRNg9kz5Ee/ikhZE791hnFT3jHw87kT/t0UsV2ncvPDBGhk8daXXot2y/vAQLQLAOBPgRsNVY
	FTMXUHHKlo8o2V8AnmW8Rh/6vkmS9izkIMgsyaCm3whtMLu2BZI2nePIWtwY/PtpqbucQLiG8rLaG
	q939uZBbyDFN7mb3/+UR/FAkXvd0fEYc8VpdSLZIX1EIY4P6xH7PaGMuVIxj5/ey2uZKMCnutrDug
	gYzTKNXLwlmQvu8QPaVdYXlzZbtWiWywQ9hptJ+8VghW1cOd3IjI6kDJF4RhEeGXVS+Ukc7hGxRZv
	2EYZMLEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5i3Y-0000000HJ6A-1Z0W;
	Mon, 06 Oct 2025 10:03:00 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5i3W-0000000HJ5M-1yoT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 10:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:From:Cc:
	Subject:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=l27ZY3jOmzA73svt5ou/Sjkka4JiXmht+5hbNg1N6UY=; b=f9zENp90moxcJayc9FFYDaxna8
	z++uVAlBT3wd3Qz8uX6WLn3d50t+iYJj09s8tVlq9FtI5q1m28uLJ1jcqsvF7GZkuMOxxygzmdp5P
	cKs3+REhnKfVr1eLOc052GNvLrNtqtL/qE/teQjtLRK8KEpzaw4tgfvbYbVNcsPRh61/QEstI4mjQ
	16pAcLdnGbCeFpbAoOYLvI3V9r7AkK9nD+YdN59D4+CzAhCWapmXzSB9D8tHob888YikW1Ax42dOV
	KiVS/Hq4GXR0I5O5b97QXZWkPBBVSipb3Y9c1Pp0+dkaZSYR82tyFaOLKQD0mbWzQmdYUpKPQ9HBX
	ckdUCZtQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1v5i3V-000CEH-04;
	Mon, 06 Oct 2025 12:02:57 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1v5i3U-000NRc-14;
	Mon, 06 Oct 2025 12:02:56 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Oct 2025 10:02:56 +0000
Message-Id: <DDB5J5V1IM0E.34WP32K550WIU@folker-schwesinger.de>
To: "Suraj Gupta" <suraj.gupta2@amd.com>, <vkoul@kernel.org>,
 <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>
Subject: Re: [PATCH V2 3/3] dmaengine: xilinx_dma: Optimize control register
 write and channel start logic for AXIDMA and MCDMA in corresponding
 start_transfer()
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
X-Mailer: aerc 0.21.0-9-ga57e783008e9
References: <20251003061910.471575-1-suraj.gupta2@amd.com>
 <20251003061910.471575-4-suraj.gupta2@amd.com>
In-Reply-To: <20251003061910.471575-4-suraj.gupta2@amd.com>
X-Virus-Scanned: Clear (ClamAV 1.0.9/27780/Thu Oct  2 04:58:32 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_030258_511844_52B0BE1A 
X-CRM114-Status: GOOD (  14.17  )
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
> Optimize AXI DMA control register programming by consolidating
> coalesce count and delay configuration into a single register write.
> Previously, the coalesce count was written separately from the delay
> configuration, resulting in two register writes. Combine these into
> one write operation to reduce bus overhead.
> Additionally, avoid redundant channel starts in xilinx_dma_start_transfer=
()
> and xilinx_mcdma_start_transfer() by only calling xilinx_dma_start() when
> the channel is actually idle.
>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> Co-developed-by: Srinivas Neeli <srinivas.neeli@amd.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>

For the AXIDMA code paths:

Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>

> ---
>  drivers/dma/xilinx/xilinx_dma.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index aa6589e88c5c..a050b06e3b8d 100644
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
> @@ -1660,7 +1660,8 @@ static void xilinx_mcdma_start_transfer(struct xili=
nx_dma_chan *chan)
>  	reg |=3D XILINX_MCDMA_CR_RUNSTOP_MASK;
>  	dma_ctrl_write(chan, XILINX_MCDMA_CHAN_CR_OFFSET(chan->tdest), reg);
> =20
> -	xilinx_dma_start(chan);
> +	if (chan->idle)
> +		xilinx_dma_start(chan);
> =20
>  	if (chan->err)
>  		return;


