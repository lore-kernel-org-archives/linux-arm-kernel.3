Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0096CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RK8kFBXT8y70E6huAXTL9QeVoyhtjVy+kcMEf6kxVI8=; b=rh8tm7oTv0e9d9QAoMK7jKQZhW
	47erS2TmjbmcdyO2rrBqCTBWPHSHwyQKVvW3cbKyX2SBB4czePJZFW4C1jFvEPa/Vjd/ltbhCdyLF
	4rOjmrLYHfdRqMThN/H92g7vmFiEdcT9HTsD5f+oT0hZUq82P/g+uKfJ74rrY1ZJhzcDuJXSj+OCf
	8UukRA6o9DPWZ5LD99d3e6yG0Kr2jIh7iVcRxwsEEjuuWS3zpA8xihn238/z3o+mbFrx5A3+h2oFw
	c07uhgLrCRMQjxRskpA42ximqatRz6u/QlPiTXeGls+cIFU2ZKSz9ttLJyJ7Tw0QbcvLiaagOvFX5
	Ui8l4OUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphnu-0000000420a-0YKJ;
	Sat, 23 Aug 2025 06:32:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTCa-00000002uVx-1tpm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1755874632; x=1787410632;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NX2EmAHptM0cpfbEil35UWdEA2+irxa/S467sbBJ+F8=;
  b=zcH2ukJJ8NfPB0AwV7vTZKZEo+9VqnkiFmZbP9oXss/Dch0IDseZkuff
   d2iuwuvLzlCySAXttpYFT7ubq3ww5DsV8BhjZYx0EYqiMiriXUEUi3Xqe
   41xA35T6HLhQi92rSnyfzEnT61HVVVAcUXYMEpgFhl04tXWE893E8Y6AN
   zmMM9ltCRFJIiPEr8XBSOgsJzn0ZSk/hWDLWhI+EQ9kIJHKN6KqMTSTTC
   bpk8P6pUWFA/KaNtwieQ7mfrQBfNH0ciO7YGFcg4mrri1gsKRpVW5oerO
   AQREVyjTOMfhRGSXfIW7tz5IqMvABfV6MakVAEYj8HRnAnEftGuZz4Elf
   g==;
X-CSE-ConnectionGUID: G8MtUZCmTuS7MMvct1brrg==
X-CSE-MsgGUID: 9da9UzP/RpGB51ZixKeqdw==
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="44987207"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Aug 2025 07:57:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 22 Aug 2025 07:56:38 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 22 Aug 2025 07:56:36 -0700
Message-ID: <b7089f9a-92d9-4652-b571-b749637c609f@microchip.com>
Date: Fri, 22 Aug 2025 16:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sama7d65: Force SDMMC Legacy mode
To: <Ryan.Wanner@microchip.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, Aubin Constans <Aubin.Constans@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250819170528.126010-1-Ryan.Wanner@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250819170528.126010-1-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_075712_683454_55956A00 
X-CRM114-Status: GOOD (  14.07  )
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

On 19/08/2025 at 19:05, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> The SDMMC in this IP currently only supports legacy mode

... but we're working on it ;-)

> due to a hardware quirk, setting the flags to reflect the limitation.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

That's fair enough for the time being:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Regards,
   Nicolas

> ---
>   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> index 7eaf6ca233ec..d086437f5e6f 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -387,6 +387,8 @@ &rtt {
>   
>   &sdmmc1 {
>   	bus-width = <4>;
> +	no-1-8-v;
> +	sdhci-caps-mask = <0x0 0x00200000>;
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pinctrl_sdmmc1_default>;
>   	status = "okay";


