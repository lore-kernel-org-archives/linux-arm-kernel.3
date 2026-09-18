Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B0AC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 18:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOhcWmnsbi53YPTXfAw+zcUnoooC/FX50KEoY7w9BnA=; b=x7SWhVCJNoI59XR+M6QqlWpHhb
	e9upScK4xS7N4w4xua35Bdr1RB0e+Evm14OjoeOloRwOz28FiseKRdu23WqzlYGo/lcG/PZaA/HKC
	AKtn0JUvxI5R2ezKRmoWMdYFnJ4d53oq2egH8ssZSt3ZqckkTsPFTGND9iW1oPmiEltFfMtHLduNg
	1GI/egpPlBGqp1JoE12Z+l7RkVRlY8EwTJySmA8kH8+JuQKCQFtJEJEf8jwZA/2oYJ880LiD/pDJw
	Q37rd+pQmQDhb43Z/YbY5x40BsMoVHVZuNYnPrh+6BhdsNiNtg/dztTdcXUgQ0cFfDNtOT9CnEqtg
	YRmYhyHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dEj-0000000FItN-1KFQ;
	Fri, 18 Sep 2026 18:23:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dEg-0000000FIsl-20xs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 18:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789755778; x=1821291778;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DQ11aT6chxj+is/hy9hP1fiwgbDJw2XvIWlCzvNSbts=;
  b=Goiz7D5YCakOnpMdIsnQ5jaGlw1mKVEzFBws+ASbkDepwSCFYZIynLZY
   0+CKB6JNSk2dtSovHZ2oqZ4ABtJZjFDDiy/IYW0/bL6x8TIcVIv2Et1DQ
   yvDu8e7DABN26Apkkzc/B/h/GbQjTCHceRAvkgL8SXz5yk4jiOa8sgr4S
   Z+BNo8KyDIGfYMK7KJp8rhk2IIZqu9AtbF0pZzNOm+/Q9MKJ+AJg7mw+X
   L7ZpbJOgTvAcR7fZ7lCjrxHcFrKyRVX8u0rCXytkYEdmfU49SW5akR3s9
   oNbw0arUy1jQc1iR1rhiiroXvHbo1tqXAAYz/k8HZoo0ElELD0dqaPgAJ
   w==;
X-CSE-ConnectionGUID: 5WHnhQZqR6u+GIxmC7mKRA==
X-CSE-MsgGUID: Ee0zJLNUQYqD92MmQl47ag==
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="73905459"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2026 11:22:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 18 Sep 2026 11:22:57 -0700
Received: from [10.171.248.88] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 18 Sep 2026 11:22:55 -0700
Message-ID: <70fd2e40-ddc1-4e80-9c4b-cf2fa9c3929e@microchip.com>
Date: Fri, 18 Sep 2026 20:22:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: use assign_bit() where applicable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Ulf Hansson <ulfh@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Kees Cook <kees@kernel.org>, Peng Fan <peng.fan@nxp.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260918141810.3023069-1-peng.fan@oss.nxp.com>
Content-Language: en-US, fr
From: Aubin Constans <aubin.constans@microchip.com>
In-Reply-To: <20260918141810.3023069-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_112258_748797_0102FBC3 
X-CRM114-Status: GOOD (  15.77  )
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

On 18/09/2026 16:18, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
> 
> Done with Coccinelle semantic patch and manual fixups.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   drivers/mmc/host/atmel-mci.c | 5 +----

Acked-by: Aubin Constans <aubin.constans@microchip.com>

>   drivers/mmc/host/ushc.c      | 5 +----
>   2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 8f4df250a77a..98933be5f174 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -1677,10 +1677,7 @@ static void atmci_detect_change(struct timer_list *t)
> 
>                  spin_lock(&host->lock);
> 
> -               if (!present)
> -                       clear_bit(ATMCI_CARD_PRESENT, &slot->flags);
> -               else
> -                       set_bit(ATMCI_CARD_PRESENT, &slot->flags);
> +               assign_bit(ATMCI_CARD_PRESENT, &slot->flags, present);
> 
>                  /* Clean up queue if present */
>                  mrq = slot->mrq;
> diff --git a/drivers/mmc/host/ushc.c b/drivers/mmc/host/ushc.c
> index 7e8af5a06ac9..410e5bb62752 100644
> --- a/drivers/mmc/host/ushc.c
> +++ b/drivers/mmc/host/ushc.c
> @@ -388,10 +388,7 @@ static void ushc_enable_sdio_irq(struct mmc_host *mmc, int enable)
>   {
>          struct ushc_data *ushc = mmc_priv(mmc);
> 
> -       if (enable)
> -               set_bit(INT_EN, &ushc->flags);
> -       else
> -               clear_bit(INT_EN, &ushc->flags);
> +       assign_bit(INT_EN, &ushc->flags, enable);
>   }
> 
>   static void ushc_clean_up(struct ushc_data *ushc)
> --
> 2.51.0
> 


