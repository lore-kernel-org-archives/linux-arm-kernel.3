Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883A8CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 02:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=608TxoAcsSFja39GdQX5iExTG94VTDqd7cjXZfeJR4s=; b=sbwIPoNEaFzCwayee6mgdcdEWe
	TdKMqjn3A99EVhGFLrc6f8FQBRLjFmkrPDaX2XJsOgoM2aSBInrA6TZm0scnnwK7wps9rJKVkGqDc
	At6rDATp5x8/KAfTBjEKCnuHdylSzy1l3K1ceUMVskO5ejNiPSYyfazqRoCjFhk38q0G8CqzSZI8W
	akDp+bHS9xaUdzYne50Y71674GaEGbqaM2g+YWAsqs3bEhgM1ck7MNkGtPMxkST1N7O+xenryOhYn
	F8n6J2RI+lMEQizG4FejhimEsdNqQbx9GKTEBQ5EkVXYuaUAauVmIGx9Vbvo2VPs2jP9CiANYsMhF
	Y51UMgOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNTU-000000027Sz-2feV;
	Tue, 29 Sep 2026 02:21:44 +0000
Received: from mail-m93204.xmail.ntesmail.com ([103.126.93.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNTM-000000027Qg-1qSL;
	Tue, 29 Sep 2026 02:21:39 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f6d2dccf;
	Tue, 29 Sep 2026 10:21:32 +0800 (GMT+08:00)
Message-ID: <23589ca5-7b7e-4f0a-8da7-1cd8ca8cdc6e@rock-chips.com>
Date: Tue, 29 Sep 2026 10:21:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linusw@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 jon.lin@rock-chips.com, bcm-kernel-feedback-list@broadcom.com,
 noltari@gmail.com
Subject: Re: [PATCH 2/3] spi: rockchip-sfc: Clean up runtime PM on remove
To: Guangshuo Li <lgs201920130244@gmail.com>, broonie@kernel.org,
 heiko@sntech.de, william.zhang@broadcom.com, kursad.oney@broadcom.com,
 jonas.gorski@gmail.com
References: <20260924112329.1566051-1-lgs201920130244@gmail.com>
 <20260924112329.1566051-3-lgs201920130244@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260924112329.1566051-3-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0eaf7a0ba03a4kunm3f316cb87f1ea3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSk9CVh9NQk1NGk8fHx1OTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=b0Nmn4A2L3sB7JXXDYNJoZwkmkRNQshPXshO1PivLsRYoBKNfmCpAX4c41WhmHiA0V3vSIAX9UViYpiGG1X/sPsl25P7DD6NNfhtT2G05ZEkmQX+3/LTlPQGKQ4gWt5eINnmjHlEtJlDI4xXqGRHli26/2zelrE9jjcj0uhCTt4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=608TxoAcsSFja39GdQX5iExTG94VTDqd7cjXZfeJR4s=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_192136_689152_4A1362DC 
X-CRM114-Status: GOOD (  12.98  )
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

Hi Guangshuo

在 2026/09/24 星期四 19:23, Guangshuo Li 写道:
> rockchip_sfc_probe() enables runtime PM and autosuspend before registering
> the controller. After a successful probe, rockchip_sfc_remove() tears down
> the controller and clocks without undoing that runtime PM setup.
> 
> The probe error path resumes the device, drops the temporary usage count,
> disables runtime PM, marks the device suspended, and stops using
> autosuspend before disabling the clocks. The remove path lacks this
> matching cleanup.
> 
> Mirror the existing error-path sequence in rockchip_sfc_remove() before
> disabling the clocks.
> 

Thanks for this patch. However, it was fixed, see:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=34e32e9ade58e32daf933974c9b697d066fc5aaa

> Fixes: 8011709906d0 ("spi: rockchip-sfc: Support pm ops")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>   drivers/spi/spi-rockchip-sfc.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
> index 662a994da60b..6e1c7d6318bb 100644
> --- a/drivers/spi/spi-rockchip-sfc.c
> +++ b/drivers/spi/spi-rockchip-sfc.c
> @@ -747,6 +747,12 @@ static void rockchip_sfc_remove(struct platform_device *pdev)
>   			 DMA_BIDIRECTIONAL);
>   	free_pages((unsigned long)sfc->buffer, get_order(sfc->max_iosize));
>   
> +	pm_runtime_get_sync(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +
>   	clk_disable_unprepare(sfc->clk);
>   	clk_disable_unprepare(sfc->hclk);
>   }


