Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654FAC71155
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 06:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBGulc6OJDRJ6EH2D/4VrzOnYanbPEi9K20DVZwTamw=; b=ei8VB80utMkUHroB8T8f9ISmQG
	r6cej/TKaK1VzM6SQqbOE9rieUVRromJb3J0oC28nEgeaf3O7xG4Q7zeZXmtwGZCfqceGopptpnus
	LFuWCrjvuWPZ5xOn3WsS9P+nwkAkHMw4sdZaaD56oUotzEhtfEtuY53Z103TwchQgBw/fRHbecBVC
	5HkwQ0ljyyafBBe71K9Ddma9W5LxVMuBxZpALHc8NgLiOBOKYFWecmrw0NCObJuds7rSml243QrjP
	+8/BNkNIiyHkoSn0jJjWfkZ9tvvVkD+eKexmGpg5uN5My2bIOgz4yi8HUEhfOQh4S5BfNMZF2ItHQ
	Wi5q8cYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQ32-00000006NxJ-1TR2;
	Tue, 17 Jun 2025 06:43:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPyE-00000006NVk-1w7W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 06:38:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 535015C5F28;
	Tue, 17 Jun 2025 06:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A1FC4CEE3;
	Tue, 17 Jun 2025 06:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750142336;
	bh=z+vpObESyxPEfQz9MODClMQrhR21GENy2LtWC3VhyO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KEh/V+VFAkpmYeRXwXnW4Gtssa2FNm9M3j6QIyoBW8wLdMDarSedKQkM5wzrG+5zp
	 cDL8UlZw948WVJawBmkQ5bOJq1V1WafNt3pk8AqVwrJSIOrd0edtxuIW34dKju+Yen
	 YLTQKnn6NA8HIXNSv7V8VMYCiPosyKRg1IFgrTxiX5Z3ZoM55FTuqFCB8dbcd6INTC
	 CA+kgxgZlqZ1cO+g5hYngjyGmQuiTOxpajoMqizwH98nb2/sawVxBjwQgVn+i98AEz
	 AKa2ptfcM0APRnv3r/Lm/NPQwnbxEIleXIpe0PszbavEUG6TiihejDHPP2yV/BUBE5
	 Ftd3IsvnZbuxg==
Date: Tue, 17 Jun 2025 12:08:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Abin Joseph <abin.joseph@amd.com>
Cc: michal.simek@amd.com, yanzhen@vivo.com, radhey.shyam.pandey@amd.com,
	palmer@rivosinc.com, u.kleine-koenig@baylibre.com, git@amd.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: zynqmp_dma: Add shutdown operation support
Message-ID: <aFENfW0v0gmtY2Gu@vaman>
References: <20250612162144.3294953-1-abin.joseph@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612162144.3294953-1-abin.joseph@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_233858_741612_79599A75 
X-CRM114-Status: GOOD (  18.86  )
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

On 12-06-25, 21:51, Abin Joseph wrote:
> Implement shutdown hook to ensure dmaengine could be stopped inorder for
> kexec to restart the new kernel.
> 
> Signed-off-by: Abin Joseph <abin.joseph@amd.com>
> ---
>  drivers/dma/xilinx/zynqmp_dma.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index d05fc5fcc77d..8f9f1ef4f0bf 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -1178,6 +1178,18 @@ static void zynqmp_dma_remove(struct platform_device *pdev)
>  		zynqmp_dma_runtime_suspend(zdev->dev);
>  }
>  
> +/**
> + * zynqmp_dma_shutdown - Driver shutdown function
> + * @pdev: Pointer to the platform_device structure
> + */
> +static void zynqmp_dma_shutdown(struct platform_device *pdev)
> +{
> +	struct zynqmp_dma_device *zdev = platform_get_drvdata(pdev);
> +
> +	zynqmp_dma_chan_remove(zdev->chan);
> +	pm_runtime_disable(zdev->dev);
> +}
> +
>  static const struct of_device_id zynqmp_dma_of_match[] = {
>  	{ .compatible = "amd,versal2-dma-1.0", .data = &versal2_dma_config },
>  	{ .compatible = "xlnx,zynqmp-dma-1.0", },
> @@ -1193,6 +1205,7 @@ static struct platform_driver zynqmp_dma_driver = {
>  	},
>  	.probe = zynqmp_dma_probe,
>  	.remove = zynqmp_dma_remove,
> +	.shutdown = zynqmp_dma_shutdown,

Why not do all operations performed in remove..?

>  };
>  
>  module_platform_driver(zynqmp_dma_driver);
> -- 
> 2.34.1

-- 
~Vinod

