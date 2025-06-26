Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFA2C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 09:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xLXEiPmIkFsOWq2iScRt7BhDQ5CLO6wEMeeYC9tPQw=; b=qekYFmXYNnJGm2LmUQWC+JtSXP
	9bUW7r2DBDpslrtgveoZNyUjJ4/TteuajBNRdtHkFgJhHGvocihhfvDCQ+xVwSRCF/zmwFhfiQk7f
	srrrsDVMf29fsxN6bA7E08N6slYQ1dqKEHMg7U/c65B92JZzibZ/XKVfn4X0r69x1EUZDgwPP8Jwb
	uyFeMRfM4wWvnUdsjhEZF53SAG2g+qm2nM4yPKGMDbnkKZtarjt/a+AL27JHKOs1USet6e1noTAXe
	mNoBKkA3lYixpo6kwHiIfw7kxy/M2SEg5bkkvczyApfmGKhTWHAeL4hrd0tUO5D9iX/TJ36X/JjXW
	+FdCdrbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiY8-0000000B5i3-0WjO;
	Thu, 26 Jun 2025 09:05:40 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiAA-0000000B0L3-0vpQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:40:55 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q8PD5s026846;
	Thu, 26 Jun 2025 10:40:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	5xLXEiPmIkFsOWq2iScRt7BhDQ5CLO6wEMeeYC9tPQw=; b=yAcNns/eKTBEPfvF
	brtge3KBWhvYe/uSk9spqaox79wdlAKfckfm1jprWhwvaHBI4BvhcuI2HlePQNDJ
	MeoSMRdIO4uGXT1H04TjELdVKe6z6lpj9irdpw6upp7KzjGEC7pE6O9J8KhUty+R
	VDPvYz/mRhaSOpyH4RJFCS3qLhPYvWusBwhhp03g92LtBsFkdLahsO25v9bnduVm
	CDPbcT9Rvmrqj4R4DDu0ic4LkIRYqimc2G+M6gEGCstRZMM3+e0Uc1CQSA32di49
	oADO1A0KfMQa2MMwO+jL1+SEHSY8ZSgI8ExKTt9rOqwj3CklBCDmGVq/xpNp5Y6x
	5ERS9g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dhvbwe8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 10:40:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 24FE640047;
	Thu, 26 Jun 2025 10:39:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9EADBB22D16;
	Thu, 26 Jun 2025 10:37:51 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 10:37:50 +0200
Date: Thu, 26 Jun 2025 10:37:44 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Andi Shyti
	<andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>,
        M'boumba Cedric Madianga
	<cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        "Pierre-Yves
 MORDRET" <pierre-yves.mordret@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH 1/3] i2c: stm32: fix the device used for the DMA map
Message-ID: <20250626083744.GA348766@gnbcxd0016.gnb.st.com>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
 <20250616-i2c-upstream-v1-1-42d3d5374e65@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616-i2c-upstream-v1-1-42d3d5374e65@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_014054_536100_FDE3DE97 
X-CRM114-Status: GOOD (  16.21  )
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

Hi Clément,

On Mon, Jun 16, 2025 at 10:53:54AM +0200, Clément Le Goffic wrote:
> If the DMA mapping failed, it produced an error log with the wrong
> device name:
> "stm32-dma3 40400000.dma-controller: rejecting DMA map of vmalloc memory"
> Fix this issue by replacing the dev with the I2C dev.

Indeed, nice catch ! Thanks a lot !

> 
> Fixes: bb8822cbbc53 ("i2c: i2c-stm32: Add generic DMA API")
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
> index 157c64e27d0b..5e0b31aed774 100644
> --- a/drivers/i2c/busses/i2c-stm32.c
> +++ b/drivers/i2c/busses/i2c-stm32.c
> @@ -118,7 +118,7 @@ int stm32_i2c_prep_dma_xfer(struct device *dev, struct stm32_i2c_dma *dma,
>  	dma->dma_len = len;
>  	chan_dev = dma->chan_using->device->dev;
>  
> -	dma->dma_buf = dma_map_single(chan_dev, buf, dma->dma_len,
> +	dma->dma_buf = dma_map_single(dev, buf, dma->dma_len,
>  				      dma->dma_data_dir);
>  	if (dma_mapping_error(chan_dev, dma->dma_buf)) {
>  		dev_err(dev, "DMA mapping failed\n");
> 
> -- 
> 2.43.0
>

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

