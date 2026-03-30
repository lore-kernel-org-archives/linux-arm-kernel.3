Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D0C10D14AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 13:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3oVNMdT+mbFhgFO6zIRUtncY7v6QFKPSzH5AgBC8gc=; b=4OK4nCbP5r7a3G549bhuzkbXJ8
	pN0392/vwH+fhjOgGK5czeFRo0ZWgyQtWm5dXUY75GXBluDzLvKk7thAOJ82SojdGrR5nvkjgZt6s
	o/qASzwwK1R8bSwg4421Bk8njiVk7fkKSZ8NEp/TQJGcycIb8c+GujgUvOjD6p4c1PVixxfWTwGgm
	k0POOeJQY1N1W/OiPyRa+tT/kMX/6w4RmoA31E9IFCg9+S/F+fjaKrq+gTfU6PgJGIShCmWtVqRQY
	CRvJBNRxuhHe7UAnqe/b4rkS9UtLz7MkaYg+J2xFZj44Sr46CF41cCmUoL8BVY3gm3rRD3JX27Odh
	ouDyyBQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CMZ-0000000BJpp-2itJ;
	Mon, 30 Mar 2026 13:09:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CMY-0000000BJpR-0vPM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 13:09:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CC2F600CB;
	Mon, 30 Mar 2026 13:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B45C4CEF7;
	Mon, 30 Mar 2026 13:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774876139;
	bh=P1BpTbax6M73OF8zBNBNgT5xJc7xmzDy4nLO8K3ghYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=td4OboJY+ln55L4NUvUODmhBu39Dimkrrq4qJnQPPyVlo4pZgunTMbNlewXD7OSLr
	 xMjBanH41pEHlZET1+PrkS1eFIOrzhNQntvEDLo4bjsTY+gaNK9zsWuAtFIMD8D1pY
	 hDkaCQqjJ+DsxbxBg11HXCeneLdXtvKiVbUX6vkQLdk80M460PuzorTKAPax2ajPwQ
	 jCEM4dZUyD3oYT9PieAihlA4TkpCr8UmGJsIL8DqAbcNW5GK7Vg+GFIc4s38OxVpSG
	 G1st0jI7Op4Gno/QH8c28BJXKQaitnqX6/uJ7ehzU+LK5/8iGoTdwKFCQpru6rUqtE
	 QnI3GS83xtMSg==
Date: Mon, 30 Mar 2026 18:38:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v14 12/12] crypto: qce - Communicate the base physical
 address to the dmaengine
Message-ID: <ulhiioxcb5opf4ab2qqqs7lkekkfv6nmmywq2gwbrxl6vgmx36@k3iwiw4cxl4x>
References: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
 <20260323-qcom-qce-cmd-descr-v14-12-f323af411274@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260323-qcom-qce-cmd-descr-v14-12-f323af411274@oss.qualcomm.com>
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

On Mon, Mar 23, 2026 at 04:17:18PM +0100, Bartosz Golaszewski wrote:
> In order to communicate to the BAM DMA engine which address should be
> used as a scratchpad for dummy writes related to BAM pipe locking,
> fill out and attach the provided metadata struct to the descriptor as
> well as mark the RX channel as such using the slave config struct.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/crypto/qce/dma.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
> index 5c42fc7ddf01e11a6562d272ba7c90c906e0e312..635208947668667765e6accf9ef02100746c0f9a 100644
> --- a/drivers/crypto/qce/dma.c
> +++ b/drivers/crypto/qce/dma.c
> @@ -11,6 +11,7 @@
>  
>  #include "core.h"
>  #include "dma.h"
> +#include "regs-v5.h"
>  
>  #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
>  #define QCE_BAM_CMD_SGL_SIZE		128
> @@ -43,6 +44,7 @@ void qce_clear_bam_transaction(struct qce_device *qce)
>  
>  int qce_submit_cmd_desc(struct qce_device *qce)
>  {
> +	struct bam_desc_metadata meta = { .scratchpad_addr = qce->base_phys + REG_VERSION };
>  	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
>  	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
>  	struct dma_async_tx_descriptor *dma_desc;
> @@ -64,6 +66,12 @@ int qce_submit_cmd_desc(struct qce_device *qce)
>  		return -ENOMEM;
>  	}
>  
> +	ret = dmaengine_desc_attach_metadata(dma_desc, &meta, 0);
> +	if (ret) {
> +		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
> +		return ret;
> +	}
> +
>  	qce_desc->dma_desc = dma_desc;
>  	cookie = dmaengine_submit(qce_desc->dma_desc);
>  
> @@ -107,7 +115,9 @@ void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val)
>  int devm_qce_dma_request(struct qce_device *qce)
>  {
>  	struct qce_dma_data *dma = &qce->dma;
> +	struct dma_slave_config cfg = { };
>  	struct device *dev = qce->dev;
> +	int ret;
>  
>  	dma->txchan = devm_dma_request_chan(dev, "tx");
>  	if (IS_ERR(dma->txchan))
> @@ -119,6 +129,11 @@ int devm_qce_dma_request(struct qce_device *qce)
>  		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
>  				     "Failed to get RX DMA channel\n");
>  
> +	cfg.direction = DMA_MEM_TO_DEV;
> +	ret = dmaengine_slave_config(dma->rxchan, &cfg);
> +	if (ret)
> +		return ret;
> +

I don't think this part is necessary. You are already passing the metadata above
and that should be sufficient for the BAM DMA driver to get the scratchpad
address. If any client drivers call dmaengine_slave_config() without
dmaengine_desc_attach_metadata(), and if the BAM DMA supports locking, then the
BAM driver should fail. Otherwise, continuing so would cause race conditions
among the BAM clients, which we are seeing right now on Qcom SDX targets with
both NAND driver in Linux and Modem trying to access NAND memory over BAM.

So please drop this and just use dmaengine_desc_attach_metadata().

- Mani

-- 
மணிவண்ணன் சதாசிவம்

