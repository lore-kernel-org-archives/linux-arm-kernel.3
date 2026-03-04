Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EC5EF8FF0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ix+2LzQHhSXhLktFEvYzvdq/Kr9/hwcVA4Xwm5I+2Hg=; b=GcmJEV8iiUPucDGhXcOB5qVDqZ
	9tzQ81N5zurqTqDHmEBDBeGxzGmRhbucDAMYUsr6BKOIXic8dt0dTpx4rrPG773NFKxfwAL1ergGh
	Tr5ClswSpVvsqMOlFEq99dx30DJJrEswZ+yKQVanxPFdTeHns0SPB2mf/US8roNRyDq79/TeoxXaV
	gd4Z9P0lYGExTCdCwBJSppZcer2Ljzro6iMdAaDhzTJVWFS5CX8EYLrE1HI5bwUyEiKOJn18kL3qH
	11Jx9FwP/tCS5hqAW6Vbzow3yW2p2CXHmtPyfOkBtd+pL9T6G2HaHdr/EbGXyqzUH53rP0nqRHQjl
	WPFefp9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnOC-0000000HQ9b-13BU;
	Wed, 04 Mar 2026 14:39:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnOB-0000000HQ9N-0eub
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:39:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BEAE60097;
	Wed,  4 Mar 2026 14:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F371C2BC9E;
	Wed,  4 Mar 2026 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772635189;
	bh=c9P1MJrJ5iSgDeKJm2NK7T0A2RucQmD2Vtmr+HlkX3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZKU8NqA2W9FxhntXn0JhnExzE2aPOPFnhX203q5ThWEX3Jvx4XduNtRzD/QksrPa
	 oMZ+/mMEeXN6hqUmheqwvSrgdEdh3PzriZ68n353S4FvbSMqzipYmBlnVPRBhI6pNE
	 kdxLjT3tLl1SfLcsJ1jh+46HLzdU66Ey4yP6I1i+brkPoar3PWRX0V0sJ7oWim0F/8
	 JAk8HbtQ1mXHUTRZQgBrCEAsi08vAgbdqHzlnKhDXpC75w+/rsEsGvNWYKlCmZ/Xt9
	 1mCD1AjNcjak/1lTyXyJt5KjtzPezIyuihcVM89GKR4sZGSXmTJ0S7rVbWMP3mB+nm
	 lmm+UaOtjWHmw==
Date: Wed, 4 Mar 2026 20:09:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC v11 07/12] crypto: qce - Communicate the base
 physical address to the dmaengine
Message-ID: <aahEMjjBRINXL5zC@vaman>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <20260302-qcom-qce-cmd-descr-v11-7-4bf1f5db4802@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-7-4bf1f5db4802@oss.qualcomm.com>
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

On 02-03-26, 16:57, Bartosz Golaszewski wrote:
> In order to let the BAM DMA engine know which address is used for
> register I/O, call dmaengine_slave_config() after requesting the RX
> channel and use the config structure to pass that information to the
> dmaengine core. This is done ahead of extending the BAM driver with
> support for pipe locking, which requires performing dummy writes when
> passing the lock/unlock flags alongside the command descriptors.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/crypto/qce/core.c | 3 ++-
>  drivers/crypto/qce/dma.c  | 8 ++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index 2667fcd67fee826a44080da8f88a3e2abbb9b2cf..f6363d2a1231dcee0176824135389c42bec02153 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -211,6 +211,8 @@ static int qce_crypto_probe(struct platform_device *pdev)
>  	if (IS_ERR(qce->base))
>  		return PTR_ERR(qce->base);
>  
> +	qce->base_phys = res->start;
> +
>  	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
>  	if (ret < 0)
>  		return ret;
> @@ -260,7 +262,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
>  	qce->dma_size = resource_size(res);
>  	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
>  					 DMA_BIDIRECTIONAL, 0);
> -	qce->base_phys = res->start;
>  	ret = dma_mapping_error(dev, qce->base_dma);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
> index ba7a52fd4c6349d59c075c346f75741defeb6034..86f22c9a11f8a9e055c243dd8beaf1ded6f88bb9 100644
> --- a/drivers/crypto/qce/dma.c
> +++ b/drivers/crypto/qce/dma.c
> @@ -109,7 +109,9 @@ void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val)
>  int devm_qce_dma_request(struct qce_device *qce)
>  {
>  	struct qce_dma_data *dma = &qce->dma;
> +	struct dma_slave_config cfg = { };
>  	struct device *dev = qce->dev;
> +	int ret;
>  
>  	dma->txchan = devm_dma_request_chan(dev, "tx");
>  	if (IS_ERR(dma->txchan))
> @@ -121,6 +123,12 @@ int devm_qce_dma_request(struct qce_device *qce)
>  		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
>  				     "Failed to get RX DMA channel\n");
>  
> +	cfg.dst_addr = qce->base_phys;
> +	cfg.direction = DMA_MEM_TO_DEV;

So is this the address of crypto engine address where dma data is
supposed to be pushed to..?

-- 
~Vinod

