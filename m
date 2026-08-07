Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8405FC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 17:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rfm6fvj0LdnF4tQ1D8g9Cn2aEj1UvzZ5nlws1p5BFk=; b=JM53vtGDQB5tjr7JLE6lZjxb4Z
	u1jvosBIoutmSkuI1hJwC9WH8m/U+ePSvJoZgJ9+qhM87UFzsYajHrLHHI2DnOJOIOVGZZZpTgvt1
	YtRPiM9njPssTHaDQo9sQiGXw2mgCfqSzsl2WLUxyz9zeTfQiZuj15u5hVZ43nsRJE2XQE21d2TJf
	J5SXUdYVqlnwr6GbakH1h/4teVlJLhAeeecNRSipdNJaRPbFJpNBgYE5Qg6kknQEnN7gSUmRSsbAx
	sQ+Dtf1XMSQgSZ5BfUFk5naMY59qLUgs9sLGQ43OLU/oQGUxnyuBqloCsKAxm3z7CCwALz/LjVeko
	RbLGDiiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOIO-00000008W7B-3Krr;
	Fri, 07 Aug 2026 17:23:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOIL-00000008W6Y-1bbK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 17:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786123428; x=1817659428;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=+Z+rLnu80/tj5r5EvIpSKTEXh+L+IOeZ5o/UAr8GcWw=;
  b=L+Ecycz1O3OrvMdhzbsvHVtQaOTVXBSI9yfI/1eLDCtfC+xBP8wh5nT6
   bbdvLArxrNUuy8RtyFOYSX40Xgbpuxarw/wuautHgeL5J9DZgGdElOnRc
   ZBQDE5t2JX5+LAFblddxVKV6dVQLTrFU0eLcBV1RMsEyG53e+7D/4tDeZ
   0r/0DMrsTW86xa3zXxGfza2mx8zHedcwdwnSYGbw86NGSDwRuDLZdAGkj
   k7CvvMgxodTvA+MmwjhjGtfDhNllyLFt5IgivUDgBTLbbFXszwBWg5Pk2
   5BthtEFqhfA46obvk/iOcAJPMuG9U4QM5A7LH0w9R8dXrpWa47V/l/GM7
   g==;
X-CSE-ConnectionGUID: 0/cx6JZQTNWmZ46ra+BWzw==
X-CSE-MsgGUID: AzOXgBViRLyVa7zLfFgNlQ==
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="61825255"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 10:23:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Fri, 7 Aug 2026 10:23:42 -0700
Received: from [10.171.248.73] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 7 Aug 2026 10:23:40 -0700
Message-ID: <e4960897-fe77-41c2-95c6-56038b7c9ba2@microchip.com>
Date: Fri, 7 Aug 2026 19:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: atmel-mci: Fix use-after-free in atmci_remove due to
 race condition
To: Pei Xiao <xiaopei01@kylinos.cn>, <ulfh@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-mmc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <4389d5deff90b2b860bd07f17668270fda36bd26.1785750407.git.xiaopei01@kylinos.cn>
Content-Language: en-US, fr
From: Aubin Constans <aubin.constans@microchip.com>
In-Reply-To: <4389d5deff90b2b860bd07f17668270fda36bd26.1785750407.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_102345_747123_5E8EE087 
X-CRM114-Status: GOOD (  21.40  )
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

On 03/08/2026 11:48, Pei Xiao wrote:

 > In atmci_probe, &host->bh_work is bound with atmci_work_func, and> atmci_interrupt, atmci_timeout_timer and atmci_dma_complete can all
> queue this work on system_bh_wq.
> 
> If we remove the module, atmci_remove makes cleanup and the memory
> allocated for host with devm_kzalloc() is released after the remove
> callback returns, while the work mentioned above may still be pending
> or running. The sequence of operations that may lead to a UAF bug is
> as follows:

Thank you for having spotted the issue, and sent this fix.
  >
> CPU0                                      CPU1
> 
>                                            | atmci_interrupt
>                                            | queue_work(system_bh_wq,
>                                            |            &host->bh_work)
> atmci_remove                              |
> atmci_cleanup_slot(...)                   |
> atmci_writel(host, ATMCI_IDR, ~0UL)       |
> timer_delete_sync(&host->timer)           |
> dma_release_channel(host->dma.chan)       |
> free_irq(platform_get_irq(pdev, 0), host) |
>                                            | atmci_work_func
>                                            | // use host
> // devm resources released after          |
> // remove returns, host is freed          |
>                                            | // use host (use-after-free)
> 
> Fix it by canceling the work after all the sources that can schedule
> it (IRQ handler, timeout timer and DMA completion callback) have been
> stopped, and before proceeding with the remaining cleanup in
> atmci_remove.

For completeness, PDC completion could be added to the above list of sources,
even though it is a subroutine of the IRQ handler.
PDC and DMA are exclusive.

Mentioning on which board or MPU the patch was tested would also be a welcome
addition.

> 
> Fixes: 7d2be0749a59 ("atmel-mci: Driver for Atmel on-chip MMC controllers")
> Assisted-by: Codex:deepseek-v4-flash
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>   drivers/mmc/host/atmel-mci.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 3b4928f5b9b2..8f4df250a77a 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -2610,6 +2610,8 @@ static void atmci_remove(struct platform_device *pdev)
> 
>          free_irq(platform_get_irq(pdev, 0), host);
> 
> +       cancel_work_sync(&host->bh_work);
> +
>          clk_disable_unprepare(host->mck);
> 
>          pm_runtime_disable(dev);
> --
> 2.25.1
> 


