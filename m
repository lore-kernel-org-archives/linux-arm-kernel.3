Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82064CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9e7Hvlyvd6AI5Iq7g82BxSHV5WaFxFZsS58itdhYtY=; b=1LMJJOUcVEsr6EvJFhmuBPGNBa
	mXK+EV703oeRekvWY4T8SiqjHtgdztJsGWeCXRQCydEzsXCaRPGUepIqWjtRCQY/Jy21cNxzqiA3Y
	2N7H9iyIl2ShWo/kaO100wZFC3FT3HL6wpjMFDCOCoJajiZvj4D2ffMfHnqLNNqg3gw81Hq/q17U7
	S/+DNBAEhX8ko4GAEr5aqRE9WhVCgt7sPixLe+K5GHWICigCbugJZH4KLgOjNwS8H9fd6aMeHH9Tk
	QQKep+ygRsZdoIwdnsf2m8ZpFaONLg1aQaqTtOMrozvIOaCjAWu2arViyHvuOvVS1xh+RBTtBD20o
	Ipo37p9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umaca-000000000Z3-48zG;
	Thu, 14 Aug 2025 16:16:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZnG-0000000HQEL-0cyS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 15:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1755184985; x=1786720985;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qjtO41c38rpuKsYV5ayAQzQ9BLfZGevGWrqxNM6oyTM=;
  b=mC3quBJ7Pg12S678iCnWHT7686LiIoAhAA3EpmxFDyq3SZvxUFt6qnBo
   W0ToffjhyQ3gdHLuftZsNXn3jhVAPAnfr1MDNGf56Pu9AIH8jpJqSP48d
   cquCbMWEJ99gyZ3BMaWEKOheQ3A9lQm3fxYD2028VHZhB2f0dV5o4gXum
   Hnz97rIdp11DXHuEOCnxnDRFHH3LUhfNcnNGnCu6nlHSKxB7R0u1QFoYV
   JDi8dZiYCVrEXJ0e/a61AclbCjp+znOYtCN++1tt1At2bloNzLG/W6J4m
   cG015o7pP/f+PYIurDAeImWAsAnSKOqw0WDiDwyZKJiUI8DzJFmeCn9RB
   Q==;
X-CSE-ConnectionGUID: OtV+OFDYSuOsKLpywoW1nQ==
X-CSE-MsgGUID: GwQnAvf/ThKdu6dsdqUvnw==
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="44660456"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Aug 2025 08:23:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 14 Aug 2025 08:22:54 -0700
Received: from [10.150.206.71] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 14 Aug 2025 08:22:51 -0700
Message-ID: <10824956-cb3a-4ccc-bea4-0f7310090db7@microchip.com>
Date: Thu, 14 Aug 2025 17:22:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 001/114] clk: at91: peripheral: fix return value
To: <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
	"Stephen Boyd" <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Paul Cercueil <paul@crapouillou.net>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, Daniel Machon
	<daniel.machon@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-1-b3bf97b038dc@redhat.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-1-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_082306_424726_B8B48862 
X-CRM114-Status: GOOD (  17.59  )
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

On 11/08/2025 at 17:17, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> determine_rate() is expected to return an error code, or 0 on success.
> clk_sam9x5_peripheral_determine_rate() has a branch that returns the
> parent rate on a certain case. This is the behavior of round_rate(),
> so let's go ahead and fix this by setting req->rate.
> 
> Fixes: b4c115c76184f ("clk: at91: clk-peripheral: add support for changeable parent rate")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Looks good to me:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks, best regards,
   Nicolas

> ---
>   drivers/clk/at91/clk-peripheral.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
> index c173a44c800aa8cc6970c266995f4a60b0a38554..629f050a855aaebfd1a03ff87c2b016cd2284a5a 100644
> --- a/drivers/clk/at91/clk-peripheral.c
> +++ b/drivers/clk/at91/clk-peripheral.c
> @@ -279,8 +279,11 @@ static int clk_sam9x5_peripheral_determine_rate(struct clk_hw *hw,
>          long best_diff = LONG_MIN;
>          u32 shift;
> 
> -       if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max)
> -               return parent_rate;
> +       if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max) {
> +               req->rate = parent_rate;
> +
> +               return 0;
> +       }
> 
>          /* Fist step: check the available dividers. */
>          for (shift = 0; shift <= PERIPHERAL_MAX_SHIFT; shift++) {
> 
> --
> 2.50.1
> 
> 


