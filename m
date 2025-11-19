Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80ACBCF256C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 04:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yscUZQSJ5FmcnJIo8NwxQChb9YorR51ssHm6/dokRxc=; b=XHQ4ZSsKw+Gh29sFCkqSILWc4M
	AfiEOfCNsKGx75248Bs1UKmvENY63PbEIHHqDQpmM8F7295D8uJPxK4107PauLtfUhkrrAoqJRtQd
	otFPMmUERB+gglEd1+mWjCQBhqgT//nQoqGS7pjE33jCkr3zyX1ux9a+clGqkx8ANCaEtv7RJ1+CC
	zmp16z6+MkYT7qLW9TK+iBSLL/Y/huhiN6MYjbFVNbOAD5LcMfazS5du29O9O8P67i0wbGpGeLzxi
	tjF+4Aw0XmkxtRehBq0WBuEe2cWnJJFscz2FpixTx0Ih2+MOB840GhBZADBpFrb4TKjzLvhDrtqp7
	tp7bf+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZkP-00000001iXU-36lR;
	Wed, 19 Nov 2025 04:24:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZkN-00000001iUj-3QfH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 04:24:49 +0000
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7300B14B0;
	Wed, 19 Nov 2025 05:22:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763526162;
	bh=yJeaXoLf70VhhSAHjfistXPCj7PDJPUYG9zpDQ+w2/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVSI0E3Ui98hX4dZ9Gb+H4e1+FpH3mSIYUuu0IMS4POaM8pAeO/ByZaHEmxmDCPFq
	 Tjv+0rBXwmi0xVhfATr/t5R13TkXbYD81fiE6DrcejeUcZWGJz2c2rEZa94saLNa86
	 nvBZMRl5BUj3okfss17WLcmZMb8Kb+013yUHlMhc=
Date: Wed, 19 Nov 2025 13:24:12 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] media: nxp: imx8-isi: use devm_pm_runtime_enable()
 to simplify code
Message-ID: <20251119042412.GN10711@pendragon.ideasonboard.com>
References: <20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com>
 <20251117-cam_cleanup-v1-3-6cd42872db79@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117-cam_cleanup-v1-3-6cd42872db79@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_202448_003759_A5F427C6 
X-CRM114-Status: GOOD (  19.90  )
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

On Mon, Nov 17, 2025 at 01:58:13PM -0500, Frank Li wrote:
> Use devm_pm_runtime_enable() to simplify code. Change to use
> dev_err_probe() because previous goto change to return.
> 
> No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index c3d411ddf492eb27b372763ce5d344a90c6ec524..a884976ac8f8295120c404941f7ee19b90723924 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -499,13 +499,14 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
>  	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
>  
> -	pm_runtime_enable(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
>  
>  	ret = mxc_isi_crossbar_init(isi);
> -	if (ret) {
> -		dev_err(dev, "Failed to initialize crossbar: %d\n", ret);
> -		goto err_pm;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to initialize crossbar: %d\n", ret);

No need to print the error value anymore.

>  
>  	for (i = 0; i < isi->pdata->num_channels; ++i) {
>  		ret = mxc_isi_pipe_init(isi, i);
> @@ -528,8 +529,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  
>  err_xbar:
>  	mxc_isi_crossbar_cleanup(&isi->crossbar);
> -err_pm:
> -	pm_runtime_disable(isi->dev);
> +
>  	return ret;
>  }
>  
> @@ -548,8 +548,6 @@ static void mxc_isi_remove(struct platform_device *pdev)
>  
>  	mxc_isi_crossbar_cleanup(&isi->crossbar);
>  	mxc_isi_v4l2_cleanup(isi);
> -
> -	pm_runtime_disable(isi->dev);
>  }
>  
>  static const struct of_device_id mxc_isi_of_match[] = {
> 
> -- 
> 2.34.1
> 

-- 
Regards,

Laurent Pinchart

