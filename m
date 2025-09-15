Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56103CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FI/+qlYN/SsIM/B7Y0GBF9SUidenyaN8aC0aZMSb+gQ=; b=3H2lzXA1Q1TJAJvRweSYavZk0H
	dEHuvF+bZ9IrhAdU/4Ksx3tO4p/z97QRitTTXjdv6rrrl+60l+rvS94d56C0flo5oguatQzwn3rVA
	ZtY5fML4sifhPJvtzS3qBiNi78dkcm+rcLYgSNyQwBXM4s+a6W2gbjOjivzP3Cq88M/mVbCrgAIaq
	a43zD4940EkNhU9Js1tLTZNuWWnlmI787Ks4DVG+LB06KRER9bTZvNHYzzpd1hP0XeC9rhcgfVpgq
	U60TDWZJjghGGlYdDU0YUQzWEK843BhOflHFVf1m5/sbqMnOVpy1q527bEy+JaQqZuqXfdf7sVK+c
	QizMfGgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAa4-00000004nIg-1x7p;
	Mon, 15 Sep 2025 14:53:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAa2-00000004nHr-0YAh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757948002; x=1789484002;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NI/V1BFu/xw0s0N3NYrfmXM+nPXpri1JQ+T381KWCLY=;
  b=F3RcN3bTnWaFq4Z0XlP06QLzsbHP0YFr/RpPaUHVdZMxoayy9qqsZR6/
   xhnRxER15CbO5VPNnJ0taqtL46un98d5yg40KkfjxrSsK5dTy+S7bAyyu
   2Hl1l9Ez4CcHIGvDrnrUIxj8mPpgHrLMOOH2IhxcTI795V7JCNOf3CaxC
   OgTzSV2VEC1SGLGRzydzeAM0HqGHfL42mqmQFWOPJcpK4Ec+Qr+o+GtNQ
   Rnt1tuFL18C7ofiF00g7oUCnd3K2Dr0a3S8K+OXeCPlVqNa0w/7a+ba6I
   bKF0/XAmpIXXANTYlmjDf/6r0XJJUDfip+KD4iRCysyHnZWpOecdrOhLh
   Q==;
X-CSE-ConnectionGUID: t4nJTFLUQceZvkt6u9W+ug==
X-CSE-MsgGUID: OXxTyGUQRK+73AIK12XuEA==
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="45941907"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2025 07:53:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 07:53:17 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 15 Sep 2025 07:53:15 -0700
Message-ID: <826bb7ba-c4fb-4dd9-9332-88140d7a0eb1@microchip.com>
Date: Mon, 15 Sep 2025 16:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: at91: sam9x7: Add peripheral clock id for pmecc
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250909103817.49334-1-balamanikandan.gunasundar@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250909103817.49334-1-balamanikandan.gunasundar@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_075322_265957_9329FDD4 
X-CRM114-Status: GOOD (  13.97  )
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

On 09/09/2025 at 12:38, Balamanikandan Gunasundar wrote:
> Add pmecc instance id in peripheral clock description.
> 
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>

Added to clk-microchip with fix of tab vs. space (made by Claudiu).

Thanks, regards,
   Nicolas

> ---
> Changes in v2:
> - Removed Acked-by tag that was added by mistake
> 
>   drivers/clk/at91/sam9x7.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index ffab32b047a0..bce60f7393d5 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -403,6 +403,7 @@ static const struct {
>   	{ .n = "pioD_clk",	.id = 44, },
>   	{ .n = "tcb1_clk",	.id = 45, },
>   	{ .n = "dbgu_clk",	.id = 47, },
> +	{ .n = "pmecc_clk",     .id = 48, },
>   	/*
>   	 * mpddr_clk feeds DDR controller and is enabled by bootloader thus we
>   	 * need to keep it enabled in case there is no Linux consumer for it.


