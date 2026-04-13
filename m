Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1406DF34C6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 17:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mP903dU9E33eepcYpUl+fojnP5DkqKJS4SIH6D9VG4A=; b=dbQwz2yeVG41Rk/DM401C0qq33
	3VKWIbaMOEzs2WNsPu0ER/zo0yxlhlovDry+AKDyZ4Yt3JLj0Q7g64YwkVL7ZjW2LcsIYiUupH0kQ
	sixoOwR5fspbSeIxvufdECAv31rP3eWntRzEIw/0KUFP0AQTWOlcjk19zs2OmH8fu92UBDogooq+z
	lHAYguqtT/ih8c69pgLUGqeZdMEljR1P6x8y4BRVlB603YCznkd232ifV1/hM4pjvkr1Zp+noCFw8
	iDSJY5M9W68BLvMJufg8/f5CyN5FriMX3KF6nCrUU4Bx3037UMpRxz7aYwZdkJRVWpZbYuduh5YyA
	oDswkG+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLFI-0000000G8lS-1azB;
	Mon, 13 Apr 2026 17:38:48 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCLEo-0000000G8kI-3iok
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 17:38:46 +0000
Received: from [100.65.225.115] (unknown [20.236.11.42])
	by linux.microsoft.com (Postfix) with ESMTPSA id E478220B6F01;
	Mon, 13 Apr 2026 10:38:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E478220B6F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776101897;
	bh=mP903dU9E33eepcYpUl+fojnP5DkqKJS4SIH6D9VG4A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eRSUm6dVxDM8+l8UZbS6bfvl5PP7E8vnXwL/BnbzJu+GC+gVIwbb7jojj9gJc9YcA
	 TbDemA4ZnDah8mZwqG9nUnu8SygKTWbWrjGgqSZedKmpQfnip2XoVpblI1/uJ+EHqk
	 aCJxjR91NYSzdnIe2aXfCcJ0lvYm3ozBEbKOfl30=
Message-ID: <3305684d-8517-47dd-8852-2e34d40fc712@linux.microsoft.com>
Date: Mon, 13 Apr 2026 10:38:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mmc: host: sdhci-iproc: implement the .hw_reset
 callback
To: rjui@broadcom.com
Cc: sbranden@broadcom.com, linux-arm-kernel@lists.infradead.org,
 tgopinath@linux.microsoft.com, adrian.hunter@intel.com,
 linux-mmc@vger.kernel.org
References: <20260327222150.2108111-1-meaganlloyd@linux.microsoft.com>
Content-Language: en-US
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
In-Reply-To: <20260327222150.2108111-1-meaganlloyd@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_103819_034977_BA2EDB2A 
X-CRM114-Status: GOOD (  17.55  )
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


On 3/27/2026 3:21 PM, Meagan Lloyd wrote:
> Implement the .hw_reset callback so that the eMMC can be reset as needed
> given cap-mmc-hw-reset is set in the devicetree and the functionality is
> enabled on the eMMC.
>
> Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
> ---
>
> SDHCI_POWER_CONTROL[4] (SD Host Controller Standard) has been repurposed
> on my Broadcomm processor to be eMMC hardware reset
> (SDIO*_eMMCSDXC_CTRL[12], HRESET).
>
> Can you confirm this repurposed bit is consistent across the Broadcomm
> iProc processors and thus the .hw_reset callback can be uniformly
> applied in this driver?

Hi Ray & Scott,

I hope you're doing well. This bit looks to have been repurposed from
the SD Host Controller Standard's VDD2 Power Control to being used for
toggling the hardware reset signal to eMMCs. Can you verify that it
applies across the iProc processors so that I may finalize this patch?

Thank you,

Meagan

>
> ---
>  drivers/mmc/host/sdhci-iproc.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-iproc.c b/drivers/mmc/host/sdhci-iproc.c
> index 35ef5c5f51467..9018ed7fe2e66 100644
> --- a/drivers/mmc/host/sdhci-iproc.c
> +++ b/drivers/mmc/host/sdhci-iproc.c
> @@ -181,12 +181,26 @@ static unsigned int sdhci_iproc_bcm2711_get_min_clock(struct sdhci_host *host)
>  	return 200000;
>  }
>  
> +static void sdhci_iproc_hw_reset(struct sdhci_host *host)
> +{
> +	u8 val = sdhci_readb(host, SDHCI_POWER_CONTROL);
> +
> +	/* Trigger reset and hold for at least 1us (eMMC spec requirement) */
> +	sdhci_writeb(host, val | BIT(4), SDHCI_POWER_CONTROL);
> +	usleep_range(2, 10);
> +
> +	/* Release from reset and wait for at least 200us (eMMC spec requirement) */
> +	sdhci_writeb(host, val & ~BIT(4), SDHCI_POWER_CONTROL);
> +	usleep_range(250, 300);
> +}
> +
>  static const struct sdhci_ops sdhci_iproc_ops = {
>  	.set_clock = sdhci_set_clock,
>  	.get_max_clock = sdhci_iproc_get_max_clock,
>  	.set_bus_width = sdhci_set_bus_width,
>  	.reset = sdhci_reset,
>  	.set_uhs_signaling = sdhci_set_uhs_signaling,
> +	.hw_reset = sdhci_iproc_hw_reset,
>  };
>  
>  static const struct sdhci_ops sdhci_iproc_32only_ops = {
> @@ -201,6 +215,7 @@ static const struct sdhci_ops sdhci_iproc_32only_ops = {
>  	.set_bus_width = sdhci_set_bus_width,
>  	.reset = sdhci_reset,
>  	.set_uhs_signaling = sdhci_set_uhs_signaling,
> +	.hw_reset = sdhci_iproc_hw_reset,
>  };
>  
>  static const struct sdhci_pltfm_data sdhci_iproc_cygnus_pltfm_data = {
> @@ -283,6 +298,7 @@ static const struct sdhci_ops sdhci_iproc_bcm2711_ops = {
>  	.set_bus_width = sdhci_set_bus_width,
>  	.reset = sdhci_reset,
>  	.set_uhs_signaling = sdhci_set_uhs_signaling,
> +	.hw_reset = sdhci_iproc_hw_reset,
>  };
>  
>  static const struct sdhci_pltfm_data sdhci_bcm2711_pltfm_data = {

