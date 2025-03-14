Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2A3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:To:From:Cc:Subject:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDGHe5H9DDTsiL/3ihAwqrP4qS9aTGO3ohjYTzmIf94=; b=EAMPuetl2FtGzDJRQWZzaMvZz2
	4gx6GIzTR3aHzOYQcIABJzr2AMauC6dXfzMfOed1cFT+Cwzi6fRH/Q+1YTa916wPTgEIm/kZkI+Ji
	ObbWHW89zz+/UUi8NMdijIRYF6fqUMcbRCkjioe0yBRAirXx5EnqnzCl21SSQWv+DoEh65gIdrfJl
	jACqq3F1F+GAKuJwnRTykAvosnNGoyIj1gk8Au6/sYvlXBH328jc8KmzOPTgSOMwT1vUNHFAI75EU
	yMuZokFueMpteMN3xLoLxiPyTfYr5erR5fvhDiioiLCvqcF+YISYCfDsmVSRSnVndAAuR4uIt9f86
	ewKXs9xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6kj-0000000EWUi-40Ne;
	Fri, 14 Mar 2025 15:15:13 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6f5-0000000EVYS-0Lgw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 15:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:To:From:Cc:Subject:Message-Id:Date:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=TDGHe5H9DDTsiL/3ihAwqrP4qS9aTGO3ohjYTzmIf94=; b=MjgqkO1UHN37C5wdfNLcTeDKFh
	F4uhfb/1LWyBNpNtuF7lk1D2cTSB+zaldu5zhS5tsdgZ7h1ghQTUTeqUv8NG3KcGjnLqRj+JWHKeH
	FWqD8pBWMKLsTNOwa2AXdwhXEqky8tsmv/5NCCrnNq1tQWBz+rTq1WkyQii0lOEnE5P5eMm+srzBr
	si6UEHvgsjAtmYQ3/J8L4mNh1SmkVsUhQpQztAFBNd9e/oe4rtpKBaTH0myfdgHbKN9GuiNyCR+DG
	SrPsuNnTanh+j8D//n6bCPBCINHeaIbaYDqU8HqIp6wJthZhzkxcwta5TZTXGcFAyCisTwdRLN6AZ
	02Pu5FhA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1tt6ey-000Mpp-1C;
	Fri, 14 Mar 2025 16:09:16 +0100
Received: from [185.213.155.229] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1tt6ex-0001HJ-0C;
	Fri, 14 Mar 2025 16:09:15 +0100
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Mar 2025 15:09:15 +0000
Message-Id: <D8G31H1FDKXJ.3C3P6GDB2JBW@folker-schwesinger.de>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Set dma_device directions
Cc: "Vinod Koul" <vkoul@kernel.org>, "Michal Simek" <michal.simek@amd.com>,
 "Marek Vasut" <marex@denx.de>, "Radhey Shyam Pandey"
 <radhey.shyam.pandey@amd.com>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Thomas Gessler" <thomas.gessler@brueckmann-gmbh.de>,
 <dmaengine@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-33-g75c6578986f4
References: <20250314134849.703819-1-thomas.gessler@brueckmann-gmbh.de>
In-Reply-To: <20250314134849.703819-1-thomas.gessler@brueckmann-gmbh.de>
X-Authenticated-Sender: dev@folker-schwesinger.de
X-Virus-Scanned: Clear (ClamAV 1.0.7/27577/Fri Mar 14 10:01:01 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_080923_407856_74A22E9A 
X-CRM114-Status: GOOD (  13.56  )
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

On Fri Mar 14, 2025 at 2:48 PM CET, Thomas Gessler wrote:
> Coalesce the direction bits from the enabled TX and/or RX channels into
> the directions bit mask of dma_device. Without this mask set,
> dma_get_slave_caps() in the DMAEngine fails, which prevents the driver
> from being used with an IIO DMAEngine buffer.
>
> Signed-off-by: Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>

Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>

> ---
>  drivers/dma/xilinx/xilinx_dma.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index 108a7287f4cd..641aaf0c0f1c 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -3205,6 +3205,10 @@ static int xilinx_dma_probe(struct platform_device=
 *pdev)
>  		}
>  	}
> =20
> +	for (i =3D 0; i < xdev->dma_config->max_channels; i++)
> +		if (xdev->chan[i])
> +			xdev->common.directions |=3D xdev->chan[i]->direction;
> +
>  	if (xdev->dma_config->dmatype =3D=3D XDMA_TYPE_VDMA) {
>  		for (i =3D 0; i < xdev->dma_config->max_channels; i++)
>  			if (xdev->chan[i])


