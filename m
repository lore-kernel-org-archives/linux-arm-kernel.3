Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B998CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 10:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2+AdvJEarXyjOc4kgwr0OGK2UDYTIAIMd4EPnbaUnk=; b=Yrq3ueWFDxpmjmh6SDpIOgtoae
	rNPfr5+lJlkCARyecxSnfUnLkdN46xssEuVJkXwM+B2ACqAbVY9CXvs9BC2qeJPQ0LKvtBRm8rCPN
	kFGcoJlGhutOkmSmuW4mUW/iPgM4miEbaPXEzCffzaq9pDthA1Ngzr6H8BPiYlVDEo7XG0GdmUiE8
	eeAsYUI+vlfv/RY4FMtD0J8u0xID0Ygrg6w1BIhz3P//VgfU0dhFrtCZrgbYNcfbb+YhqeStR0/uM
	lIJmKezj3dD3JtP4TJkNwJUe2DeZkFYe7TFc9PyWr051RBcwwUHTX6VEQuEKPsTfzFaewRAwqxpJF
	0W9XktVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5i2f-0000000HInn-0tFs;
	Mon, 06 Oct 2025 10:02:05 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5i2c-0000000HInM-1GrM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 10:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:Subject:To:
	From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=M2+AdvJEarXyjOc4kgwr0OGK2UDYTIAIMd4EPnbaUnk=; b=U1YWadyoifm7mM0YGP+poyHkVT
	CQzuj1ezWhJjFCvgKBX1PwHo868THq65o/dt6vLLvzRFg2k6Jn6tDtGPDi9Tby22L4H0ckzeOGtsA
	i5Kd6FAj9HxgLJbEl6aRrXZuEe6eHkYk3yXKFCWhl03Ohq0frjynbbsSvf5ziD0FyDxA6wYshycOD
	AQxfENVX39WT8yQK9d4Ob2Zc9jpk3AdH8u1MU9bfO8xHMdAxNTWBJubJLwiG8mveJre2JAmn9vtZ+
	crg7vQFCJ7cKctWs5RGjOPfg3IMbL/p+DS2rer5t2erLusdoVmlpmDU6RufiywivdEr1EC66Ev8gY
	Sm0alTnQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1v5i2V-000C3T-0E;
	Mon, 06 Oct 2025 12:01:55 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1v5i2U-000EoX-1D;
	Mon, 06 Oct 2025 12:01:54 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Oct 2025 10:01:54 +0000
Message-Id: <DDB5IDDEOVBT.NHJF03FYW2BN@folker-schwesinger.de>
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Suraj Gupta" <suraj.gupta2@amd.com>, <vkoul@kernel.org>,
 <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>
Subject: Re: [PATCH V2 1/3] dmaengine: xilinx_dma: Fix channel idle state
 management in AXIDMA and MCDMA interrupt handlers
X-Mailer: aerc 0.21.0-9-ga57e783008e9
References: <20251003061910.471575-1-suraj.gupta2@amd.com>
 <20251003061910.471575-2-suraj.gupta2@amd.com>
In-Reply-To: <20251003061910.471575-2-suraj.gupta2@amd.com>
X-Virus-Scanned: Clear (ClamAV 1.0.9/27780/Thu Oct  2 04:58:32 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_030202_669369_73EC4ACE 
X-CRM114-Status: GOOD (  15.97  )
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
> Fix a race condition in AXIDMA and MCDMA irq handlers where the channel
> could be incorrectly marked as idle and attempt spurious transfers when
> descriptors are still being processed.
>
> The issue occurs when:
> 1. Multiple descriptors are queued and active.
> 2. An interrupt fires after completing some descriptors.
> 3. xilinx_dma_complete_descriptor() moves completed descriptors to
> done_list.
> 4. Channel is marked idle and start_transfer() is called even though
>    active_list still contains unprocessed descriptors.
> 5. This leads to premature transfer attempts and potential descriptor
>    corruption or missed completions.
>
> Only mark the channel as idle and start new transfers when the active lis=
t
> is actually empty, ensuring proper channel state management and avoiding
> spurious transfer attempts.
>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> Co-developed-by: Srinivas Neeli <srinivas.neeli@amd.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
> Fixes: c0bba3a99f07 ("dmaengine: vdma: Add Support for Xilinx AXI Direct =
Memory Access Engine")

For the AXIDMA code paths:

Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>

> ---
>  drivers/dma/xilinx/xilinx_dma.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index fabff602065f..53b82ddad007 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -1857,8 +1857,10 @@ static irqreturn_t xilinx_mcdma_irq_handler(int ir=
q, void *data)
>  	if (status & XILINX_MCDMA_IRQ_IOC_MASK) {
>  		spin_lock(&chan->lock);
>  		xilinx_dma_complete_descriptor(chan);
> -		chan->idle =3D true;
> -		chan->start_transfer(chan);
> +		if (list_empty(&chan->active_list)) {
> +			chan->idle =3D true;
> +			chan->start_transfer(chan);
> +		}
>  		spin_unlock(&chan->lock);
>  	}
> =20
> @@ -1914,8 +1916,10 @@ static irqreturn_t xilinx_dma_irq_handler(int irq,=
 void *data)
>  		      XILINX_DMA_DMASR_DLY_CNT_IRQ)) {
>  		spin_lock(&chan->lock);
>  		xilinx_dma_complete_descriptor(chan);
> -		chan->idle =3D true;
> -		chan->start_transfer(chan);
> +		if (list_empty(&chan->active_list)) {
> +			chan->idle =3D true;
> +			chan->start_transfer(chan);
> +		}
>  		spin_unlock(&chan->lock);
>  	}
> =20


