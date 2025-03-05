Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331C3C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FmH6eNvLfSaqHnPCHNsqnlACSKE+tpbxHFOLoDtN+Q=; b=MW9e6n1z0JND6ACcOE9ftYadl4
	x1Hu2+WtdSlTWDVqafiNWJ9R+A3pkUmRzwuYJBkCLonerrj2yGeSLm18jHxWaX7a+D3Tz8d1mJOW2
	M6A4uxyrAFZDwCyC3g0gDl6HescRFJllx/NB7L6zG6Q8uyF+yskVgM2tr52bcptoCYQ1Jx/NU94g7
	U6GFrDdP5gSUEK9CU4gE8bfipjtCR4hum00/Fi/DYMbajUoMoOLSNUf5LJstVf1Uz34vEAVvefo5K
	Iu0FWIF9VpIm2mCcZTY/qBcllW6YzShDW52bMZIXpLYz6lUq5k6XbdCtwJk0iUH6IeSyyuZbVjgKc
	FocVEihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpujU-000000097V1-3W6E;
	Wed, 05 Mar 2025 19:48:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsiF-00000008oly-0Qmm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 17:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1741196359; x=1772732359;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=x06wZ4JzzQdXv+skj8Mdw6FwOmNgc2Hi3vw3FdY5VlQ=;
  b=B9Ndt8Jrt9F/t8dghQ6FZpkCMmqN/FiEBeF0FdVjFXeHwEbEz8ydJ3fq
   FnZxphr38Ahrg+4Y9zqmbQh/9U0ap0SKylnOCIjCe55jMFRlMko+BOr1v
   HJAp+UqAxZk0O4q76GoLk9OENWkdMNN6OtTmd1im63XKSR9RcGk6Jctxa
   YwlVQ0ChitFOGAlA/0CEJ1PbPSRC+LltMmSzzG7CbLeHBkHXZLjG0lK7L
   asfklyrlgj9MV9a7rRlXdZxvpeG0wb3HIJcNaGbftxEc/j//RESrTqfE0
   Cfz6W4Ud7dElYaVkMaZaIz/o9z/PA8ma2Gq0dTl/ylDXR/bpXGqD1YYgR
   g==;
X-CSE-ConnectionGUID: aDhkZa15Rdq5O/AlBZMFPg==
X-CSE-MsgGUID: Xn9qTDuOTZypoTdWoRNdMg==
X-IronPort-AV: E=Sophos;i="6.14,223,1736838000"; 
   d="scan'208";a="269856430"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Mar 2025 10:39:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 5 Mar 2025 10:39:07 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 5 Mar 2025 10:39:07 -0700
Message-ID: <ebb161f2-632b-4d10-8c5c-4187a06a06c8@microchip.com>
Date: Wed, 5 Mar 2025 10:39:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/21] Enable Power Modes Support for SAMA7D65 SoC
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<sre@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <2a18e305-090c-41fe-9b27-97ebe93fd4e4@tuxon.dev>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <2a18e305-090c-41fe-9b27-97ebe93fd4e4@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_093919_357199_C73BF32A 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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

On 3/3/25 01:40, Claudiu Beznea wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27.02.2025 17:51, Ryan.Wanner@microchip.com wrote:
>> Ryan Wanner (20):
>>   ARM: at91: Add PM support to sama7d65
>>   ARM: at91: pm: add DT compatible support for sama7d65
>>   ARM: at91: PM: Add Backup mode for SAMA7D65
>>   ARM: at91: pm: Enable ULP0/ULP1 for SAMA7D65
> 
> Applied to at91-soc with some adjustments, please check!
Checked! This is correct.
> 
>>   ARM: dts: microchip: sama7d65: Add Reset Controller to sama7d65 SoC
>>   ARM: dts: microchip: sama7d65: Add Shutdown controller support
>>   ARM: dts: microchip: sama7d65: Add RTC support for sama7d65
>>   ARM: dts: microchip: sama7d65: Add SFRBU support to sama7d65
>>   ARM: dts: microchip: sama7d65: Enable shutdown controller
> 
> Applied to at91-dt with some adjustments, please check!
Same here

Thank you!
> 
> Thank you!


