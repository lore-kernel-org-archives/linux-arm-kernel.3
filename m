Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BD5ED7B8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 08:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fR/8RZWrpTM8A7/i1nFhInIAo0qgMM9hFmLDHafoS1Q=; b=H3K/3443v8CPx6xux0oH4JvBqR
	hUMm4YOd211cuWdnrK3gOM++BwvWTCrLtgXRPkpCSyb8rVItGd8dm9mGJvjCoDnLGC0S/jo9dqGPi
	oUVrWwbh1cPMdccd0O4IbI2ZwSqsMpwcSJKHC4cBTkvAiq7GJUz8QDTRo+uU3XPQyCiCpSiemQ518
	h8q4JMQZ2dJQTtYTE6eibh5HYqo3/bikn+zTedUMkpS+YkxRRgiicObPrGx2QYrSl0C0ePYwsinMw
	TKIQd5cyO5i8R/BT0cvHdYAsG/v8xf40wgzWiAA3vS687xjOcVzBG+0ksaART6m98uoHg39L14ed7
	XzwrHNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZU0-0000000H120-016W;
	Tue, 14 Apr 2026 08:50:56 +0000
Received: from mail-m15580.qiye.163.com ([101.71.155.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZTx-0000000H11A-0yvI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 08:50:55 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3aaac6a97;
	Tue, 14 Apr 2026 16:50:41 +0800 (GMT+08:00)
Message-ID: <cec99f99-5ac4-7f0d-8e2a-947edfef8930@rock-chips.com>
Date: Tue, 14 Apr 2026 16:50:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Cc: shawn.lin@rock-chips.com, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mmc: dw_mmc: implement option for configuring DMA
 threshold
To: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
References: <20260414-dwmmc-dma-thr-v2-0-4058078f5361@disroot.org>
 <20260414-dwmmc-dma-thr-v2-1-4058078f5361@disroot.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260414-dwmmc-dma-thr-v2-1-4058078f5361@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d8b2f889c09cckunmdcb2a6d389aa93
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5KTFZPGR9IGkhPTENNGhhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=DnfYRACSDZpJK0lRuJ8/WtbnW7oXUzViIm/tnTTDD7BEWELh5zkgF2TQmLVECg4cXDzZqHyTu9CiyYsWf+Gmmk8DWKUU8NN5FE4pWHtyT32pHvbvK3sai0iqRsnGm0LeLjlzDiw4x84Ay2xKD0tAXZhJP9bvO22ApCB9Aqh23B8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=fR/8RZWrpTM8A7/i1nFhInIAo0qgMM9hFmLDHafoS1Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_015053_864084_A6869FA4 
X-CRM114-Status: GOOD (  21.23  )
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

在 2026/04/14 星期二 16:36, Kaustabh Chakraborty 写道:
> Some controllers, such as certain Exynos SDIO ones, are unable to
> perform DMA transfers of small amount of bytes properly. Following the
> device tree schema, implement the property to define the DMA transfer
> threshold (from a hard coded value of 16 bytes) so that lesser number of
> bytes can be transferred safely skipping DMA in such controllers. The
> value of 16 bytes stays as the default for controllers which do not
> define it. This value can be overridden by implementation-specific init
> sequences.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>   drivers/mmc/host/dw_mmc.c | 5 +++--
>   drivers/mmc/host/dw_mmc.h | 2 ++
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index 20193ee7b73eb..9dd9fed4ccf49 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -40,7 +40,6 @@
>   				 SDMMC_INT_RESP_ERR | SDMMC_INT_HLE)
>   #define DW_MCI_ERROR_FLAGS	(DW_MCI_DATA_ERROR_FLAGS | \
>   				 DW_MCI_CMD_ERROR_FLAGS)
> -#define DW_MCI_DMA_THRESHOLD	16
>   
>   #define DW_MCI_FREQ_MAX	200000000	/* unit: HZ */
>   #define DW_MCI_FREQ_MIN	100000		/* unit: HZ */
> @@ -821,7 +820,7 @@ static int dw_mci_pre_dma_transfer(struct dw_mci *host,
>   	 * non-word-aligned buffers or lengths. Also, we don't bother
>   	 * with all the DMA setup overhead for short transfers.
>   	 */
> -	if (data->blocks * data->blksz < DW_MCI_DMA_THRESHOLD)
> +	if (data->blocks * data->blksz < host->dma_threshold)
>   		return -EINVAL;
>   
>   	if (data->blksz & 3)
> @@ -3245,6 +3244,8 @@ int dw_mci_probe(struct dw_mci *host)
>   		goto err_clk_ciu;
>   	}
>   
> +	host->dma_threshold = 16;

I'd prefer to set it in dw_mci_alloc_host() instead of picking up
a random place to put it, for better code management.

> +
>   	if (host->rstc) {
>   		reset_control_assert(host->rstc);
>   		usleep_range(10, 50);
> diff --git a/drivers/mmc/host/dw_mmc.h b/drivers/mmc/host/dw_mmc.h
> index 42e58be74ce09..fc7601fba849f 100644
> --- a/drivers/mmc/host/dw_mmc.h
> +++ b/drivers/mmc/host/dw_mmc.h
> @@ -164,6 +164,8 @@ struct dw_mci {
>   	void __iomem		*fifo_reg;
>   	u32			data_addr_override;
>   	bool			wm_aligned;
> +	/* Configurable data byte threshold value for DMA transfer. */

No here, there is a long section of comment before struct dw_mci{ } that
describes each member of it, please add it there.

> +	u32			dma_threshold;
>   
>   	struct scatterlist	*sg;
>   	struct sg_mapping_iter	sg_miter;
> 

