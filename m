Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AF7CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 07:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EF2JvwMr4g7DRklqifcz4XumYYnybiwSa2gvTXwheOk=; b=FfnTdoSsAChiMm51sdBrZ6yWA+
	cgjPQa0YNYiwFEh7llQvKKQVH/rvB2aZd8n7BItE36TshmGtTXbOBWZnYD2ULfNxgwsi4fQbK0A2r
	bVNVvW2RzvUmEP5p0912OsJjNuHDvVwnMKAtj44Xz2BRobnFsB4jkIoNngTnXwQZFfnXoxdFz2BFa
	9W7J/V5lV/hrWC5YxkjdZEnX0EC8cCPmz3n15xRC928JUP4jnsOJeR9FjrjeL8SGMxXRgrKdSYWln
	rfWEFzOmOceGxncL2fxkUxB1ei03BHxBS0iT1rA9MWrOsQLQ1FAHBmrG7yBppiKnRJ3i9Zsup2UNM
	RS4gZ8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz97r-0000000GY5X-1EFJ;
	Thu, 18 Sep 2025 07:32:19 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz97m-0000000GY46-3uLb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 07:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:Subject:To:
	From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=EF2JvwMr4g7DRklqifcz4XumYYnybiwSa2gvTXwheOk=; b=EnizF+iZQgDygZvrprMPkoxH+r
	bmlHflwK0jotENxOpC+j4GT5fpjYGV7bSahnPc7omgEpiN81PdKt1mCdE6ysDdaMGN1PNSyxhdyC1
	42SyKvyCwz7S0zFtIGSBa3jnLMPg8vXTTEmP3jf94E2zb0uyXjx9WI43ym08l5pW/jrmDZDyjMSuA
	QkUPjvED9VJsMgLOh9onupKMBbfepCFySKnUPSPxhkzaHwPiiF3GzvazkmBnuTDCCCxZQl2RPNcXr
	33zsCn+Q2h+qXdgUVEgKyNA04FzCL7GZU98kg7HplvKxnux4FnODt/Ez8slySQBSU8A+/2wzhg5En
	AY8h4kdQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1uz97e-000CPT-1u;
	Thu, 18 Sep 2025 09:32:06 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1uz97d-0009pW-2N;
	Thu, 18 Sep 2025 09:32:06 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Sep 2025 07:32:04 +0000
Message-Id: <DCVR1UNIOUUU.2VF0ODU86VKI2@folker-schwesinger.de>
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Suraj Gupta" <suraj.gupta2@amd.com>, <vkoul@kernel.org>,
 <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>
Subject: Re: [PATCH 1/3] dmaengine: xilinx_dma: Fix channel idle state
 management in interrupt handler
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250917133609.231316-1-suraj.gupta2@amd.com>
 <20250917133609.231316-2-suraj.gupta2@amd.com>
In-Reply-To: <20250917133609.231316-2-suraj.gupta2@amd.com>
X-Virus-Scanned: Clear (ClamAV 1.0.9/27765/Tue Sep 16 10:26:41 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_003215_457367_D15772F2 
X-CRM114-Status: GOOD (  12.68  )
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
> Only mark the channel as idle and start new transfers when the active lis=
t
> is actually empty, ensuring proper channel state management and avoiding
> spurious transfer attempts.
>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> Fixes: c0bba3a99f07 ("dmaengine: vdma: Add Support for Xilinx AXI Direct =
Memory Access Engine")

Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>

> ---
>  drivers/dma/xilinx/xilinx_dma.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index a34d8f0ceed8..9f416eae33d0 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -1914,8 +1914,10 @@ static irqreturn_t xilinx_dma_irq_handler(int irq,=
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


