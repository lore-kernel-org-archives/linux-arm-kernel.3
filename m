Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC940C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 15:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAYhilL8K4MG3Lby++YW4wlzMbCz5OolZw2MtSSQL0A=; b=zhqvHjzPjONWsFnRSM6dmhr0MB
	HSNmXJbuZ8kKgIrXvyvLJM6EvR57fYv+MQ/PW6qTWAlvEslkzop56mfxn9olvu1+L0gP9BMazZs18
	XjnyMyzqHKt7XHKFoyZO2TzWK4r4dOxyQYuxTLKtYmoEe5JlzIO65AZG1Y0wmH19r59huPLknbShw
	QkaxIgmZH9jAn7GcO7PWzQTabpKJ2xhnhHyTrvz0PcZutrL7meRRkYm7ved2HygtgkASOE0auCyV3
	g3qhExgGnb5c/WTS8kpQaULyfbCGIyayDGbhU/A19jpb4nzaIuEcjttZKx/cGaUAcSzhHACK775g0
	m/4/L0cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVRm-0000000G1zQ-2yx1;
	Thu, 01 May 2025 15:03:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVPs-0000000G1dN-0AHw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 15:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1746111696; x=1777647696;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FcT5OJIncV+3YTLlIknloH4b7NqZ8CJNvPmY7U77tYk=;
  b=kf7u8TChONDa3gp5WOvNuu9tfIeBEyW2WwaiAH2nvoC4qPOuNPm3/fGt
   zf+rBxRXkTmlBvIdPrpweCiO87nJLJjl1tCkdqHhR/tqbCbyDbTPHt+J0
   9yJK3F2SlojkghrrF7DS6l5p3mHA5rxujvO9VleTkPAI43HoHEE7NV9lk
   OAXa05C9biES9q4uWh5pefx/XXPFt5bZIQROxpbyrdXz44CKUZm4HMUG3
   xFdZEcHbQ9VhHMP6La+AIPIa4s8jylA+Sc8v7cJ2sWTFmZvHiRs3IMOK7
   dKLXOF37gaJMGU+1hwuU6cCv2dRb5ZQoWDtRvQzt3LUtfyRQGFLvzbw6I
   g==;
X-CSE-ConnectionGUID: rf2P6i5OR06cfakkSU8wBw==
X-CSE-MsgGUID: GycyurudQMeXlU/ye7iK7Q==
X-IronPort-AV: E=Sophos;i="6.15,254,1739862000"; 
   d="scan'208";a="208620796"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 May 2025 08:01:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 1 May 2025 08:01:28 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 1 May 2025 08:01:27 -0700
Message-ID: <e85fe2a4-ea86-4525-9b7a-1d1cabf743f5@microchip.com>
Date: Thu, 1 May 2025 08:01:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: at91: sama7d65: Add missing clk_hw to
 parent_data
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <mturquette@baylibre.com>
CC: <sboyd@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <cover.1742916867.git.Ryan.Wanner@microchip.com>
 <d634ae4f72bca022e205b03c01415e90fda0bc01.1742916867.git.Ryan.Wanner@microchip.com>
 <47b54406-42d8-41cd-a561-9073db09666e@tuxon.dev>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <47b54406-42d8-41cd-a561-9073db09666e@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_080136_381161_861D5671 
X-CRM114-Status: GOOD (  18.95  )
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

On 4/26/25 06:35, Claudiu Beznea wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi, Ryan,
> 
> On 25.03.2025 17:55, Ryan.Wanner@microchip.com wrote:
>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>
>> The main_xtal clk_hw struct is not passed into parent_data.hw causing an
>> issue with main_osc parent.
> 
> Can you please describe the issue?
> 
>> Passing the main_xtal struct into the
>> parent_data struct will ensure the correct parent structure.
>>
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>> ---
>>  drivers/clk/at91/sama7d65.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
>> index a5d40df8b2f2..08306261c9c7 100644
>> --- a/drivers/clk/at91/sama7d65.c
>> +++ b/drivers/clk/at91/sama7d65.c
>> @@ -1138,6 +1138,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>>
>>       parent_data.name = main_xtal_name;
>>       parent_data.fw_name = main_xtal_name;
>> +     parent_data.hw = main_xtal_hw;
> 
> I think, from time to time, you can still hit some random failure as the
> parent_data.index is still not initialized. I think the problem may be
> solved by doing something like:
> 
> -       static struct clk_parent_data parent_data;
> +       static struct clk_parent_data parent_data = {0};
> 
> Can you please check with this?
Yes I will check on this and test it.

Best,
Ryan
> 
> Thank you,
> Claudiu
> 
> 
>>       main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
>>                                                &parent_data, bypass);
>>       if (IS_ERR(main_osc_hw))
> 


