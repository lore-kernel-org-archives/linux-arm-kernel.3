Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49604CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 20:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vddGLbWM42D50r30tpsujE0VLG/iAeMtwLoJ5znOa/s=; b=tCq8jUs82uWKh4w+zNftIo5Wch
	BwFU1JCZsZJoMcWbny3qwKHXWWSw71G06+/MJqLReuLn8u6pP8YIqwpzcFiP3WLra/fcNXWHf6tuv
	YNaCPvCguoI2nF9n9CuBLej1/94ECuZPLkkoNHnEwT8jQpPrZOI8OZ2ca5QDSRXSlZwXtrxYKmA0V
	ZZFGeo1OZjCOSORcK6q/gIqF8QfoJs5V332v8uE/df30hp6clNTnBAhjqatZQxexDzFtRS6oHGrKm
	/JjvOrhsN++P9a57jmVskBS3egkbYcPLIvOZwEMLaEJdhp5jNxznr/76IOV6JsH+hWwiCOdOorSJU
	RU0W4ENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjX9-00000003DYB-1Z8G;
	Thu, 28 Aug 2025 20:47:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urfIj-00000002E5u-27Gc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 16:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756397797; x=1787933797;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dbxb4w4OJlV5sDEo57zFUE5nYfUGYzxZZDwgoF4J/Dw=;
  b=qE0811NslvXMOCMpISj6dNWX4S1QmFOk7N+cOUUfax2KnHFJMk05WPDx
   oLddhwDL3CdE0ddhOv7zA0u71M1A6EUcKkxi5pGRJaIn0m+CLReMslVtK
   KHXV9p/POkkXrVGeQcbXs8nvETfaYWW1ZoTdCy/d5ulhyNBQiQuVU/n2/
   83UPOpu8kl/j/2ls/Zal94RLaFqV8EOhpt07Gec8OJxy9HpDNSQhHe08Q
   NMkW5qHPza1EFWVPqJYhAZGRRNWiwwLF1L1wxzrYeFMUJJO/Zh7KxRKb2
   U/mnopzK+TyoIZyJS9UK/KBqyXzeozui5KI3fWG6Km+WgHB08+1jxjDDp
   A==;
X-CSE-ConnectionGUID: X9YiAgovSEikt4Ra+TjvOg==
X-CSE-MsgGUID: 9dg/711GTSemJKiM6lKqeA==
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; 
   d="scan'208";a="46343766"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Aug 2025 09:16:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 28 Aug 2025 09:16:18 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 28 Aug 2025 09:16:18 -0700
Message-ID: <08dd4d82-8ac4-43a3-8d01-f293db6302e2@microchip.com>
Date: Thu, 28 Aug 2025 09:16:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/32] clk: at91: add support for parent_data and
To: Brian Masney <bmasney@redhat.com>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <robh@kernel.org>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <aLB7CJY9nMLoS1or@x1>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <aLB7CJY9nMLoS1or@x1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_091637_739402_0A412958 
X-CRM114-Status: GOOD (  18.69  )
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

On 8/28/25 08:51, Brian Masney wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Ryan and Claudiu,
> 
> On Thu, Jul 10, 2025 at 01:06:53PM -0700, Ryan.Wanner@microchip.com wrote:
>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>
>> This series adds support for parent data and parent _hw on the at91
>> clock drivers. This also updates all the SoC specific clock drivers to
>> use this format as well.
>>
>> This is a continuation of the V1 of this series here [1].
>>
>> This has been tested on the SAMA5* SoCs, the sam9x* SoCs, and the SAMA7*
>> SoCs.
>>
>> Changes v1 -> V2:
>> - Remove all the small sama7g54 SoC driver changes and put them in their
>>   own patch.
>> - Add the SAMA7D65 and the SAM9X75 to this update.
>> - Add a patch to move all common used macros into the pmc.h file.
>> - Update changes from v6.6 to v6.16.
>> - Remove patches that where style fixes and include those in the update.
>>
>> Changes v2 -> v3:
>> - Adjust each patch so they are fully atomic.
>> - Add a patch to have the SAMA7D65 systemclocks use parent_data and
>>   parent_hw.
>> - Add a formatting cleanup patch for the SAM9X75.
>> - Adjust commit messages that no longer show invalid information.
>>
>>
>> 1) https://lore.kernel.org/all/20230727053156.13587-1-claudiu.beznea@tuxon.dev/
>>
>>
>> Claudiu Beznea (28):
>>   clk: at91: pmc: add macros for clk_parent_data
>>   clk: at91: clk-sam9x60-pll: use clk_parent_data
>>   clk: at91: clk-peripheral: switch to clk_parent_data
>>   clk: at91: clk-main: switch to clk parent data
>>   clk: at91: clk-utmi: use clk_parent_data
>>   clk: at91: clk-master: use clk_parent_data
>>   clk: at91: clk-programmable: use clk_parent_data
>>   clk: at91: clk-generated: use clk_parent_data
>>   clk: at91: clk-usb: add support for clk_parent_data
>>   clk: at91: clk-system: use clk_parent_data
>>   clk: at91: clk-pll: add support for parent_hw
>>   clk: at91: clk-audio-pll: add support for parent_hw
>>   clk: at91: clk-plldiv: add support for parent_hw
>>   clk: at91: clk-h32mx: add support for parent_hw
>>   clk: at91: clk-i2s-mux: add support for parent_hw
>>   clk: at91: clk-smd: add support for clk_parent_data
>>   clk: at91: clk-slow: add support for parent_hw
>>   clk: at91: dt-compat: switch to parent_hw and parent_data
>>   clk: at91: sam9x60: switch to parent_hw and parent_data
>>   clk: at91: sama5d2: switch to parent_hw and parent_data
>>   clk: at91: sama5d3: switch to parent_hw and parent_data
>>   clk: at91: sama5d4: switch to parent_hw and parent_data
>>   clk: at91: at91sam9x5: switch to parent_hw and parent_data
>>   clk: at91: at91rm9200: switch to parent_hw and parent_data
>>   clk: at91: at91sam9260: switch to parent_hw and parent_data
>>   clk: at91: at91sam9g45: switch to parent_hw and parent_data
>>   clk: at91: at91sam9n12: switch to parent_hw and parent_data
>>   clk: at91: at91sam9rl: switch to clk_parent_data
>>
>> Ryan Wanner (4):
>>   clk: at91: pmc: Move macro to header file
>>   clk: at91: sam9x75: switch to parent_hw and parent_data
>>   clk: at91: sama7d65: switch to parent_hw and parent_data
>>   clk: at91: sam9x7: Clean up formatting
> 
> What tree did you develop this against? When I try to apply this series
> to Linus's tree (6.17-rc3) and linux-next, only 12 of these patches
> actually apply with 'git am'.

This was developed on 6.16 but when I bumped this thread I checked and
they all apply cleanly on the v6.17-rc3 tag. I also just tested on
next-20250828 tag and this set applies cleanly as well.

Ryan
> 
> Brian
> 


