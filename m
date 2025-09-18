Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8F4CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 07:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3K1LLY6fBGRnWuhSS18/nnpPKS0286kpzOIjA3aeoY=; b=P7MhlhDlMfYfUZMd22v6ku3kRZ
	sqRQrNspaeye3jIRkLlL01Hn/4NEGMRk3+vIPhYlT6BUzAADBPHLdB9LtabH6ICwf7vohFaWqZJgT
	+uDFFlD1VT1f+5b4ahKbV3flVQRXyev6FLBoQRd6RsgulB8JDL/S7je+Wr2/GSdvgrmiJVHGkmIdq
	ME+YeDgDRu7QLRiulz8QD4XPe2v4VrGt/otVBNHSEds0dwzEsUljgVbV6EyA5mW32WT6woVx5M4ib
	/yD3sYzdNU2PS3D8UhdI+D3iixriYpWMUQzoa8HYj79wobc5pPnod5OdGB3EaqgurUH6Sglt2jbvJ
	o0Gz5S4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz98i-0000000GYDZ-1qru;
	Thu, 18 Sep 2025 07:33:12 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz98g-0000000GYCy-2rEf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 07:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:Subject:To:
	From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=R3K1LLY6fBGRnWuhSS18/nnpPKS0286kpzOIjA3aeoY=; b=Stk/9w3lNfCX9C9Rlx5WSX0iT0
	Hb5irJfzHlCwpcb0kqGB3QtTm+TwWsbke0XqYDBBdA2aBmD4Xi4YZNn/PYLduzIq9d93HJzRfwmtO
	RHnJeOwTUWA+yQYXIjy+JdK0wEv2gS+e3Bi0NyK+C/ulh6YeGaSEimdBJy+DC3wJVX+sRwjxrucdZ
	PSn56WlS8AGRstByaIqg0oxPqeQ7rlHjMcAemtZ60OzgbjuL3aPOq1cX4Q1FoQHGyd2/9fdgxo7M0
	e+zgmgaC5v7OSm7kDjlfxj6NcRMhVUx3UFBzQkbpHQlLuZox5FxqE02tl1Qs1Cph8D32ob0Vx5luw
	wYcO+WBg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1uz98e-000CZU-2L;
	Thu, 18 Sep 2025 09:33:08 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1uz98d-000JqH-33;
	Thu, 18 Sep 2025 09:33:08 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Sep 2025 07:33:07 +0000
Message-Id: <DCVR2N9GKNCH.2GLNGXYTGLHOX@folker-schwesinger.de>
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Suraj Gupta" <suraj.gupta2@amd.com>, <vkoul@kernel.org>,
 <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>
Subject: Re: [PATCH 2/3] dmaengine: xilinx_dma: Enable transfer chaining by
 removing idle restriction
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250917133609.231316-1-suraj.gupta2@amd.com>
 <20250917133609.231316-3-suraj.gupta2@amd.com>
In-Reply-To: <20250917133609.231316-3-suraj.gupta2@amd.com>
X-Virus-Scanned: Clear (ClamAV 1.0.9/27765/Tue Sep 16 10:26:41 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_003310_722073_B6C771F5 
X-CRM114-Status: GOOD (  14.35  )
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
> Remove the restrictive idle check in xilinx_dma_start_transfer() that
> prevented new transfers from being queued when the channel was busy.
> Additionally, only update the CURDESC register when the active list
> is empty to avoid interfering with transfers already in progress.
> When the active list contains transfers, the hardware tail pointer
> extension mechanism handles chaining automatically.
>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>

Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>

> ---
>  drivers/dma/xilinx/xilinx_dma.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index 9f416eae33d0..7211c394cdca 100644
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


