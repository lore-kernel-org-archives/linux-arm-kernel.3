Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A950CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 20:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WqkZGCDpTzJ1EumFjxjv0ApmlvIjGxkETRW0i/MFEg=; b=jPfwtowO5sKAqISlTCtV8+KRz6
	z7xqonlPMYfBtcMHFbdaFJ8JnnTUDdOERdEwEcD0fT++OEnQZjVPF9pudXOKYB8UTsCftBc4D1vRA
	mZPsV64k/Ds9A/tjTDvFzNDeotlKh0ztw0B1bcX2iXSWrg2SswZdsbeFEVYPy30iC+Okpek1/3qeH
	Io0uBts3pXPNxQBPepnPxjZ9ebl9efmGP86M3KppMAYUVd5ZwMqPsZdkEG808x1vd+AV738jROFFP
	FkPooIfqSFfA4/6z9VsZDAOUVvRGSqTJAVEXnKphx2l9mQ2g3hUh7DqjZEcpUzGIvQa/oFS3VPo/u
	USjGVk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgkH-00000004Mrt-3gl9;
	Mon, 08 Jun 2026 20:38:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgkF-00000004MrU-0Hms
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 20:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1780951131; x=1812487131;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hTL8ZR3VPVw9YEegIP5cAxrbCCtByYq2SVKt2Kx7Y0c=;
  b=SvCZnho3WkY4Gq3V3iRtJn+YjLPnOVStf1jUl6YrK4Bkm3m/6Db/G6AS
   tVu95Nz962aWQwa9ZG0y+Eyy906Qte1hwNo6jqAvwxLNnsEIKRr7xv+uh
   LUxV+NSvADZ1Nl53PmYERjX7VNR+/lx1PUojmvvbPlbZpzlkpjvjVBmyZ
   kn60NWrsNmpuQUCXXYQRUXQ1egiptTO5Bix2xX10+sW1ua4d24SXI74QA
   mfV9Zqo7qSC19pXYCJiH1WxCkEcAhArJGJgi+Qk6kiEgMCi6DwpbbGg+J
   UP5fujxOs1n3twhcEOA63BZEy+/HFFhVf6AauBhXVDEcfmzq5a6D7rDiO
   g==;
X-CSE-ConnectionGUID: WN7Jf+4cRveid0SHWkkRyg==
X-CSE-MsgGUID: J1tZQ2cKTqm51WcorA2RzQ==
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="290168080"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Jun 2026 13:38:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 8 Jun 2026 13:38:49 -0700
Received: from [10.10.177.23] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 8 Jun 2026 13:38:49 -0700
Message-ID: <10b595d3-d44b-4fbb-a834-a94b154a0381@microchip.com>
Date: Mon, 8 Jun 2026 13:38:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 0/3] watchdog: sama5d4: fix IRQ and timeout bugs, use
 platform_get_irq_optional
To: Rosen Penev <rosenp@gmail.com>, <linux-watchdog@vger.kernel.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, "moderated list:ARM/Microchip (AT91) SoC
 support" <linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>
References: <20260608200933.18669-1-rosenp@gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260608200933.18669-1-rosenp@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_133851_143844_1860DA52 
X-CRM114-Status: GOOD (  12.80  )
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

On 08/06/2026 at 13:09, Rosen Penev wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> This series fixes three issues in the sama5d4 watchdog driver:
> 
> Patch 1: Return IRQ_NONE when the status register indicates no watchdog
> interrupt is pending, and pass the configured timeout (not the hardcoded
> default) to sama5d4_wdt_init().
> 
> Patch 2: Replace irq_of_parse_and_map() with platform_get_irq_optional()
> for simpler error handling and EPROBE_DEFER support.
> 
> Patch 3: Move platform_set_drvdata() before devm_request_irq() to prevent
> a NULL pointer dereference in the interrupt handler if the shared System
> IRQ fires immediately after registration.
> 
> v2: address sashiko review

Rosen,

I'd like to hear how these issues where found and how the patches were 
tested.

Best regards,
   Nicolas

> Rosen Penev (3):
>    watchdog: sama5d4: fix shared IRQ and hardcoded timeout issues
>    watchdog: sama5d4: use platform_get_irq_optional()
>    watchdog: sama5d4: fix NULL deref in irq handler
> 
>   drivers/watchdog/sama5d4_wdt.c | 32 +++++++++++++++++---------------
>   1 file changed, 17 insertions(+), 15 deletions(-)
> 
> --
> 2.54.0
> 


