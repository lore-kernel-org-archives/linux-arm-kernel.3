Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18802C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qy9s92ksMSniUeaZXNc1o+YqtbCQ10oNC8fmVkEi8sQ=; b=J2wiWFT6WWgdr3
	e2b/QlZR/jSAmM1GhVUa9f3Y2DnNu/Wgfs7QcaQzrlpSRiYJMcU6uu2i+3fB4wdKy7B/vTibYJVfB
	hvyg7iwttrtPkfVHoIGS09HDJfAS/XfDxCpxP3oU3MMQYJUv3lo1Dv/eWRff2RmgNv2SczfKeF1ho
	V6DUTwYPMl2omkaloS1dECvNKi2hBdN6emZTDU5Dlin5aNvnzRosJ/n3ZIbyIZllUAbeghKJMzYPD
	ml81yV5Y665qKawzGsTsslDk+WwzEdevwI7xbaYd3ZeNN1qzP4SbWbrcBd0s4dv8BaIE+zjfcKhis
	w9sWwyQMo9Q1aiTM4b0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5XT-0000000CGIE-1Zc1;
	Fri, 28 Feb 2025 18:56:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5HX-0000000CC1S-1AAP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740768019; x=1772304019;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dgwriYuHai0NswtoP8mHODftMD1l0GOWzgSCZTYh98A=;
  b=rwix3vSkZpwuhJPY/d7RgkyLpAeMGQGa8r9qkGF4PVBqsoOnLGjpA1WW
   Fxw9StU3ypZtsu2GPdc42L6k3aqwBtj7IAkgCdSXiVgLix4J/gmHXvEw1
   UtaH64KCED5CR+cYANtvI2Oc3wc1nw6Kuk55BEq5KRrgGwKIRc8Opm5uI
   MfUAoTsanjZYD1ObE+2JaO907luYfOZKmN7RS7QGZepgrrhrXcFyTOLAw
   8ku0cqky1NvpJ1YaW75aHRAhGLv/MAnvBly6PRpMinqW5sd1AxSDM0PMf
   hBaRuXz/YukTw0KSrw1kxlKQvfHszl265q4z9Yxq0hIM17AVGie8L+1+B
   g==;
X-CSE-ConnectionGUID: 0708Gxq6RM22afyZLBfpag==
X-CSE-MsgGUID: LguonwZOQEWh8tU6Da1OdA==
X-IronPort-AV: E=Sophos;i="6.13,323,1732604400"; 
   d="scan'208";a="42424459"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2025 11:40:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Feb 2025 11:39:54 -0700
Received: from [10.171.248.16] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 28 Feb 2025 11:39:52 -0700
Message-ID: <d1a9fc41-35df-4b30-83cc-5589a649c7ff@microchip.com>
Date: Fri, 28 Feb 2025 19:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] mmc: atmel-mci: Add missing clk_disable_unprepare()
To: Gu Bowen <gubowen5@huawei.com>, <ulf.hansson@linaro.org>
References: <20250225022856.3452240-1-gubowen5@huawei.com>
Content-Language: en-US, fr
From: Aubin Constans <aubin.constans@microchip.com>
In-Reply-To: <20250225022856.3452240-1-gubowen5@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_104019_350732_9DA4D320 
X-CRM114-Status: GOOD (  18.06  )
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
Cc: alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, claudiu.beznea@tuxon.dev, ludovic.desroches@microchip.com, wangweiyang2@huawei.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 25/02/2025 03:28, Gu Bowen wrote:
> The error path when atmci_configure_dma() set dma fails in atmci driver
> does not correctly disable the clock.
> Add the missing clk_disable_unprepare() to the error path for pair with
> clk_prepare_enable().
> 
> Fixes: 467e081d23e6 ("mmc: atmel-mci: use probe deferring if dma controller is not ready yet")
> Signed-off-by: Gu Bowen <gubowen5@huawei.com>

Acked-by: Aubin Constans <aubin.constans@microchip.com>

> ---
>   drivers/mmc/host/atmel-mci.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index fc360902729d..24fffc702a94 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -2499,8 +2499,10 @@ static int atmci_probe(struct platform_device *pdev)
>          /* Get MCI capabilities and set operations according to it */
>          atmci_get_cap(host);
>          ret = atmci_configure_dma(host);
> -       if (ret == -EPROBE_DEFER)
> +       if (ret == -EPROBE_DEFER) {
> +               clk_disable_unprepare(host->mck);
>                  goto err_dma_probe_defer;
> +       }
>          if (ret == 0) {
>                  host->prepare_data = &atmci_prepare_data_dma;
>                  host->submit_data = &atmci_submit_data_dma;
> --
> 2.25.1
> 

Thank you for having identified and fixed this.

