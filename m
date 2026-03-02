Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02BBD58E7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 08:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoRcFJQ0D6uiNJl2vl4CvN47KwDERFC3nwFcFOSRpt0=; b=gE2Ix92h0+Zv1X2fpR1YlVQUt2
	Y7jjPh291KRA85S+9FHkdYA5CCcr94Es+Zc+Jg62wHMZt4ZRXWP3RgHr8QivnmvrGeM2gnb3cc9kh
	UB+qrtOXybjQ2cAOR0c6cR+fHkn8xVJFRA2DuV9h32++jRuVzYb4DKWP9deKNPp//vWFQLE+pmM6M
	xsQDQ5EdnFNVROTmGq/76HG79jmclnN8ojidkcwsYz/BZiDDY/3cCJPHsO3C8KE4D12/kYmienlIN
	t+dI//tXT5LEJdvI0Iv4Ins/rmorVh3oDVqvgwUPniIvI+iVx8+OG1rqtRo2fn5OQN/NJZ4yfUmih
	64DrGFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwz35-0000000CYHz-1P5E;
	Mon, 02 Mar 2026 08:54:43 +0000
Received: from mail-m49228.qiye.163.com ([45.254.49.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwz31-0000000CYGv-3ryO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 08:54:41 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 356c83a96;
	Mon, 2 Mar 2026 16:54:28 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-mmc@vger.kernel.org, s32@nxp.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 haibo.chen@nxp.com, ulf.hansson@linaro.org, adrian.hunter@intel.com
Subject: Re: [PATCH 1/4] mmc: core: fix timing selection for 1-bit bus width
To: ziniu.wang_1@nxp.com
References: <20260302080057.974102-1-ziniu.wang_1@nxp.com>
 <20260302080057.974102-2-ziniu.wang_1@nxp.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <2135cbdd-9329-1097-dd38-bb12aa1a7ff6@rock-chips.com>
Date: Mon, 2 Mar 2026 16:54:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20260302080057.974102-2-ziniu.wang_1@nxp.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cadc18b8709cckunmda3df11efd8467
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk8ZTFZLSB5OSh5NT0seQ0tWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=HmDu/dETENf3i+Y4cYXPTTZcQ0DZSnxDv0glq9Kjlq0KzFBJKT4S/Z+VowPcrj5rGXr0Pvd8uffO5neKMIJYKc6v4tibTK4HPP9Tm+gdZIzHLBVPOhQ4S5MkrTfgw0PRQj5fDGyGo8tkywbMZqc9pnUMBtYB2rC3i74q/UiB0bs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=BoRcFJQ0D6uiNJl2vl4CvN47KwDERFC3nwFcFOSRpt0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_005440_522162_3933B666 
X-CRM114-Status: GOOD (  21.15  )
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

Hi Luke

在 2026/03/02 星期一 16:00, ziniu.wang_1@nxp.com 写道:
> From: Luke Wang <ziniu.wang_1@nxp.com>
> 
> When 1-bit bus width is used with HS200/HS400 capabilities set,
> mmc_select_hs200() returns 0 without actually switching. This
> causes mmc_select_timing() to skip mmc_select_hs(), leaving eMMC
> in legacy mode (26MHz) instead of High Speed SDR (52MHz).
> 
> Per JEDEC eMMC spec section 5.3.2, 1-bit width supports High Speed
> SDR. Drop incompatible HS200/HS400/UHS/DDR caps early so timing
> selection falls through to mmc_select_hs() correctly.
> 

I've tested this patch, and it works as intended.

Unrelated to your specific change, however, I'm not convinced that
mmc_validate_host_caps() is doing what its name suggests, at least not
comprehensively. For example, the SD card path handles 1-bit bus with
UHS support correctly, thanks to the mmc_host_uhs() check inside the
SD/SDIO code. This makes the validation logic feel scattered across
different layers IMO. It would be even better if you could consolidate 
all these checks in one place maybe, but anyway

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>


> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> ---
>   drivers/mmc/core/host.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index 88c95dbfd9cf..18b9c3174e1f 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -617,17 +617,26 @@ EXPORT_SYMBOL(devm_mmc_alloc_host);
>   static int mmc_validate_host_caps(struct mmc_host *host)
>   {
>   	struct device *dev = host->parent;
> -	u32 caps = host->caps, caps2 = host->caps2;
>   
> -	if (caps & MMC_CAP_SDIO_IRQ && !host->ops->enable_sdio_irq) {
> +	if (host->caps & MMC_CAP_SDIO_IRQ && !host->ops->enable_sdio_irq) {
>   		dev_warn(dev, "missing ->enable_sdio_irq() ops\n");
>   		return -EINVAL;
>   	}
>   
> -	if (caps2 & (MMC_CAP2_HS400_ES | MMC_CAP2_HS400) &&
> -	    !(caps & MMC_CAP_8_BIT_DATA) && !(caps2 & MMC_CAP2_NO_MMC)) {
> +	/* UHS/DDR/HS200/HS400 modes require at least 4-bit bus */
> +	if (!(host->caps & (MMC_CAP_4_BIT_DATA | MMC_CAP_8_BIT_DATA)) &&
> +	    ((host->caps & (MMC_CAP_UHS | MMC_CAP_DDR)) ||
> +	     (host->caps2 & (MMC_CAP2_HS200 | MMC_CAP2_HS400_ES | MMC_CAP2_HS400)))) {
> +		dev_warn(dev, "drop UHS/DDR/HS200/HS400 support since 1-bit bus only\n");
> +		host->caps &= ~(MMC_CAP_UHS | MMC_CAP_DDR);
> +		host->caps2 &= ~(MMC_CAP2_HS200 | MMC_CAP2_HS400_ES | MMC_CAP2_HS400);
> +	}
> +
> +	if (host->caps2 & (MMC_CAP2_HS400_ES | MMC_CAP2_HS400) &&
> +	    !(host->caps & MMC_CAP_8_BIT_DATA) &&
> +	    !(host->caps2 & MMC_CAP2_NO_MMC)) {
>   		dev_warn(dev, "drop HS400 support since no 8-bit bus\n");
> -		host->caps2 = caps2 & ~MMC_CAP2_HS400_ES & ~MMC_CAP2_HS400;
> +		host->caps2 &= ~(MMC_CAP2_HS400_ES | MMC_CAP2_HS400);
>   	}
>   
>   	return 0;
> 

