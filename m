Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E59CF45CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHahXyrxqs4drA8WBojKjJ3gmEJM2cCsR80DxQ1XArg=; b=daHXO6KrDS7nipBmFrO8S1qark
	x029nnTy3UMyeEREwNeMmfszJf0i+kPLV75E2NiNEOZQP/dNR7ehgp+NU4ThamP9lcqSlFeAIhpYS
	X0D9NEGambclLTl59XJR5tvHgGdOaSqtWVfbRBKjQCvlJ7l91s29d4iRS/TKT1282TCdaL6NLL1qy
	HgkbeXerJ2vG4Y6EkcjYnBf0+jwp9KeSoUkXbJ2CoK+2CiY45nxThBYegvnrMxwaGtr6rU40X0qan
	8yL8OQyxbFhXJVFFEO0X5ZoBUl/LKLaV0ChKqq4i+jfyDmEel0aCXeG7WOHg3UvAdK4cDC8YmH9Vc
	xOQzbRNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPPx-00000006DCH-0tV7;
	Mon, 12 Jan 2026 21:25:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPPu-00000006DBs-0F49
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 21:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768253138; x=1799789138;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fvSsA+S0/oU9AH4QpW4EiN6TixJIJsN16h6Ww3Ssy+A=;
  b=n1vQeVri8nbxy1LZjMeWkQZnjaR5vrTeUbSeY/ICatFztOXs41FJ5dLl
   Q+O/fKm6Y8LVi9mKM54WEyoWtcs+SA9D5h59rpNSSK23FiH5PbdllS2zg
   A/cjtd+c8PNEGbuuvJukOhu9xWhfweUvxopojFQaVhSkbI8/skJKnKwIQ
   tWnhXHEppD3txbcgW55RTs/U6MYONZA2l74hi6V0T055COnVPY1wNafSL
   JT3XRCeC4LTgYp3cy0Ekp30fcWAkclQRcDSBvl/WQgJ6R0ibIuhzUET3l
   igCFOv8cL6NIP9rXlaKbz+c/3xYGdZT+B+r2vuiWOMGMqLSip5Wre7jWN
   A==;
X-CSE-ConnectionGUID: xddJJ4WoRF6RVqk1KSStEA==
X-CSE-MsgGUID: kRrye1T+QrWBSihmqI4mJg==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; 
   d="scan'208";a="52207534"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Jan 2026 14:25:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 12 Jan 2026 14:25:18 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 12 Jan 2026 14:25:18 -0700
Message-ID: <bf0c00b5-9e7d-47d1-b503-2d27d862a171@microchip.com>
Date: Mon, 12 Jan 2026 14:25:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <alexandre.belloni@bootlin.com>,
	<nicolas.ferre@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <varshini.rajendran@microchip.com>
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <6979b3734462c97381159f3968a3f22b6193e04d.1758226719.git.Ryan.Wanner@microchip.com>
 <27aab227-01e3-4074-8aab-38623b4d9808@tuxon.dev>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <27aab227-01e3-4074-8aab-38623b4d9808@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_132538_409483_CD7C0B6C 
X-CRM114-Status: GOOD (  17.20  )
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

On 10/20/25 12:17, Claudiu Beznea wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi, Ryan,
> 
> On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>
>> Add support for clk_parent_data in usb clock driver.
>>
>> All the SoC based drivers that rely on clk-usb were adapted
>> to the new API change. The switch itself for SoCs will be done
>> in subsequent patches.
>>
>> Remove the use of __clk_get_hw() for the slow clocks.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> [ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to the changes.
>> Change how the main_xtal and slcks are initialized so they match the
>> parent_data API]
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>> ---
>>  drivers/clk/at91/at91rm9200.c  |  2 +-
>>  drivers/clk/at91/at91sam9260.c |  2 +-
>>  drivers/clk/at91/at91sam9g45.c |  2 +-
>>  drivers/clk/at91/at91sam9n12.c |  2 +-
>>  drivers/clk/at91/at91sam9x5.c  |  2 +-
>>  drivers/clk/at91/clk-usb.c     | 41 ++++++++++++++++++++++------------
>>  drivers/clk/at91/dt-compat.c   |  6 ++---
>>  drivers/clk/at91/pmc.h         | 11 +++++----
>>  drivers/clk/at91/sam9x60.c     |  2 +-
>>  drivers/clk/at91/sam9x7.c      | 21 +++++++++--------
>>  drivers/clk/at91/sama5d2.c     |  2 +-
>>  drivers/clk/at91/sama5d3.c     |  2 +-
>>  drivers/clk/at91/sama5d4.c     |  2 +-
>>  drivers/clk/at91/sama7d65.c    | 24 +++++++++++---------
>>  14 files changed, 72 insertions(+), 49 deletions(-)
>>
> 
> [ ... ]
> 
>> @@ -882,10 +885,10 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>>
>>       sam9x7_pmc->chws[PMC_MCK] = hw;
>>
>> -     parent_names[0] = "plla_divpmcck";
>> -     parent_names[1] = "upll_divpmcck";
>> -     parent_names[2] = "main_osc";
>> -     usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
>> +     parent_data[0] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
>> +     parent_data[1] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw);
>> +     parent_data[2] = AT91_CLK_PD_HW(main_osc_hw);
>> +     usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", NULL, parent_data, 3);
> 
> sam9x60_clk_register_usb() could be converted to use parent_hws member of
> struct clk_init_data instead of parent_data.

Looking more in depth sam9x60_clk_register_usb() calls
at91sam9x_clk_register_usb() which like in 21/31 is called in dt-compact
and only the clock name is passed into it. Should I make another
function for sam9x60_clk_register_usb() that uses parent_hw?

Ryan>


