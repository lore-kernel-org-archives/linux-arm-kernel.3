Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0390BCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4Z4pi2vstaCY5LFpKxEjHRuqlRGNHBr99kO/RP0amE=; b=clMh2GGOtd+x7a9eCSzCef2+2E
	Rd8fIjsz0iACeqFG4lWJEtime48bY+NH0BIvEChutbLBf6KKKzIFiss+zBaTU6j0eaJbG/eEdSFIm
	KpHazdSPhL9oNvQjm6OtsMrWrz7/Akl0mftxfDhltTZjbEWuVVehp+wXIs5s5KLNV/iMASR0kplgy
	+qY/rGFRgiApws/FBZjoNDju6J9SYjnzUFg6K8PexikvkwoDhJ8IYMq8zVN4P31y+LgdDExz9meE8
	wjiILT5GM/U+CEuAsPEyBCRFSZH3YgKGVIrP7g2k4/VfV8AgwGO4dJApWioTTQYUAKMLZ+xEUNp56
	EUxT7g/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXWa-00000002MHC-0RO4;
	Fri, 05 Sep 2025 14:34:48 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuT6e-00000000rW8-2pQU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=S4Z4pi2vstaCY5LFpKxEjHRuqlRGNHBr99kO/RP0amE=; b=fdHhu5+tculIUWKwtIyzxXqTKn
	tr5L6aJmOMRaiUEnRzoIQn+5165zUajK6YOcUepLbPk1BscOZJTdye0+k8qlrCKTxiNRF3VrkwEHN
	IbIAcPw2AcIEQ0I0tdFBtjU/nyE5fj2Y6VcUW6tthn/IGAWXsyUBaWxc5aaZkscyereORb8py+sfx
	B5sJXT3IlsxWJEhOkOEnHEA2qTwA9ZLH3l1xl2rJPaFANi5hJ5p/KC48NxWEYaBFqZFL3xhtokOuJ
	TN/RjVCMQhvlbvLWyq8Jb1Ii8QYOQk4ZQixj28m11Qeolgm7Xvu7OosAeNuA5bjeq/mbJ/P/Il7bf
	CaExittA==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1uuT6X-000AAb-24;
	Fri, 05 Sep 2025 11:51:37 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1uuT5s-0006sD-0e;
	Fri, 05 Sep 2025 11:51:37 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Sep 2025 09:51:36 +0000
Message-Id: <DCKRVLG0RDPF.2HIFAQSB8UF3H@folker-schwesinger.de>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Fix uninitialized addr_width
 when "xlnx,addrwidth" property is missing
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Suraj Gupta" <suraj.gupta2@amd.com>, <vkoul@kernel.org>,
 <michal.simek@amd.com>, <radhey.shyam.pandey@amd.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250905064811.1887086-1-suraj.gupta2@amd.com>
In-Reply-To: <20250905064811.1887086-1-suraj.gupta2@amd.com>
X-Virus-Scanned: Clear (ClamAV 1.0.7/27753/Thu Sep  4 10:26:09 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_025145_010377_E397810B 
X-CRM114-Status: GOOD (  14.76  )
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

On Fri Sep 5, 2025 at 8:48 AM CEST, Suraj Gupta wrote:
> When device tree lacks optional "xlnx,addrwidth" property, the addr_width
> variable remained uninitialized with garbage values, causing incorrect
> DMA mask configuration and subsequent probe failure. The fix ensures a
> fallback to the default 32-bit address width when this property is missin=
g.
>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> Fixes: b72db4005fe4 ("dmaengine: vdma: Add 64 bit addressing support to t=
he driver")

Reviewed-by: Folker Schwesinger <dev@folker-schwesinger.de>

> ---
>  drivers/dma/xilinx/xilinx_dma.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index fabff602065f..89a8254d9cdc 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -131,6 +131,7 @@
>  #define XILINX_MCDMA_MAX_CHANS_PER_DEVICE	0x20
>  #define XILINX_DMA_MAX_CHANS_PER_DEVICE		0x2
>  #define XILINX_CDMA_MAX_CHANS_PER_DEVICE	0x1
> +#define XILINX_DMA_DFAULT_ADDRWIDTH		0x20
> =20
>  #define XILINX_DMA_DMAXR_ALL_IRQ_MASK	\
>  		(XILINX_DMA_DMASR_FRM_CNT_IRQ | \
> @@ -3159,7 +3160,7 @@ static int xilinx_dma_probe(struct platform_device =
*pdev)
>  	struct device_node *node =3D pdev->dev.of_node;
>  	struct xilinx_dma_device *xdev;
>  	struct device_node *child, *np =3D pdev->dev.of_node;
> -	u32 num_frames, addr_width, len_width;
> +	u32 num_frames, addr_width =3D XILINX_DMA_DFAULT_ADDRWIDTH, len_width;
>  	int i, err;
> =20
>  	/* Allocate and initialize the DMA engine structure */
> @@ -3235,7 +3236,9 @@ static int xilinx_dma_probe(struct platform_device =
*pdev)
> =20
>  	err =3D of_property_read_u32(node, "xlnx,addrwidth", &addr_width);
>  	if (err < 0)
> -		dev_warn(xdev->dev, "missing xlnx,addrwidth property\n");
> +		dev_warn(xdev->dev,
> +			 "missing xlnx,addrwidth property, using default value %d\n",
> +			 XILINX_DMA_DFAULT_ADDRWIDTH);
> =20
>  	if (addr_width > 32)
>  		xdev->ext_addr =3D true;


