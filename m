Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89A91062891
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFOikBRvqMU6zX+08mj7VLJfo/P1dX0DbZLBErGzu7o=; b=GXfw0eEVcLZWmOabDcG3AHxZUF
	GTWHU2IXe+lUEo2sVYW0OVbT7fsVNjmIE/OP1XYtfUrYvmM2H/8pD35x2o1SaTmF0hI8wwyDM698f
	Gl6dUPLuqpX0+LKMLQ17F9HSRhg7TOC4xxKA900mKzfRLv9WZslVp4jcXxz0LDjGH1B55YTjlW87+
	0B04amyRiLAD61NBv0A4wig6dctMTRWtk+uPXFARGh/AfkZfzsd+SZ/qHFAN0NVjy7tRerzOLiFi7
	IpORkVqPm1OpTcxL0qjFUG+bJhmZPF6S1NBcJHufmjuKkpl2AU312ZdxRBKzv1BAz/KF4/dflJrTK
	FF9zj9XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IvV-0000000Ba6i-2ghM;
	Wed, 11 Mar 2026 12:44:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IvS-0000000Ba6N-3QCq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 12:44:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D868408F3;
	Wed, 11 Mar 2026 12:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31755C19425;
	Wed, 11 Mar 2026 12:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773233073;
	bh=2TsPW1VUrfzhXFigTHHxqQSuXjl+yKNb6vmNwYfv3Rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eDfNntacup9W7fsFDmo+L2CKzFeNrMPjOh6O+qT6o4uFua9BVen3NR7GjYAh8DNXV
	 IKXG7cyu8HA6VGzPRI4Js64Zn99OSyFVl3U013MtS5pxv4GLlJpYwI4eQCZmr7mQkC
	 dMqdNwRivSNHZdXsm2A+h1zID9gclxQ8SwsDB7VEfzDnPD6XroexoVunYvw0p8bpYs
	 PoGj9h8IDZf4yVljVZcfRMb4hMfmWiCnUX0mH5VnzYDiQWBnt3tpWofjoZsYN+rOD1
	 3iG2Tn931m0rCJS34Q/AZjsvyMgPo/3xYa+a78Bx0o8y/0PUB9MzPW5/UZRJiqua9H
	 ZYINWO658BENg==
Date: Wed, 11 Mar 2026 18:13:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v12 01/12] dmaengine: constify struct
 dma_descriptor_metadata_ops
Message-ID: <gtkfzgmtap6536sd5hexkuxrak25qekyrg3zwr2ikg3gnidwww@kq77l6l4kq66>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
 <20260310-qcom-qce-cmd-descr-v12-1-398f37f26ef0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-1-398f37f26ef0@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_054434_917974_0E2800F0 
X-CRM114-Status: GOOD (  16.88  )
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

On Tue, Mar 10, 2026 at 04:44:15PM +0100, Bartosz Golaszewski wrote:
> There's no reason for the instances of this struct to be modifiable.
> Constify the pointer in struct dma_async_tx_descriptor and all drivers
> currently using it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/dma/ti/k3-udma.c        | 2 +-
>  drivers/dma/xilinx/xilinx_dma.c | 2 +-
>  include/linux/dmaengine.h       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index c964ebfcf3b68d86e4bbc9b62bad2212f0ce3ee9..8a2f235b669aaf084a6f7b3e6b23d06b04768608 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
>  	return 0;
>  }
>  
> -static struct dma_descriptor_metadata_ops metadata_ops = {
> +static const struct dma_descriptor_metadata_ops metadata_ops = {
>  	.attach = udma_attach_metadata,
>  	.get_ptr = udma_get_metadata_ptr,
>  	.set_len = udma_set_metadata_len,
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index b53292e02448fe528f1ae9ba33b4bcf408f89fd6..97b934ca54101ea699e3ab28d419bed1b45dee4a 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
>  	return seg->hw.app;
>  }
>  
> -static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
> +static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
>  	.get_ptr = xilinx_dma_get_metadata_ptr,
>  };
>  
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 99efe2b9b4ea9844ca6161208362ef18ef111d96..92566c4c100e98f48750de21249ae3b5de06c763 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
>  	void *callback_param;
>  	struct dmaengine_unmap_data *unmap;
>  	enum dma_desc_metadata_mode desc_metadata_mode;
> -	struct dma_descriptor_metadata_ops *metadata_ops;
> +	const struct dma_descriptor_metadata_ops *metadata_ops;
>  #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
>  	struct dma_async_tx_descriptor *next;
>  	struct dma_async_tx_descriptor *parent;
> 
> -- 
> 2.47.3
> 

-- 
மணிவண்ணன் சதாசிவம்

