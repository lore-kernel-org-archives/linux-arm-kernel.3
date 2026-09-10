Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E664BC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32gbh+7lVLf8TucrlUBD/A/oJa8W7xX+kHE8kDNiPYg=; b=pvUiH+BiDGjf8+eepjDm64uXaS
	msT+lMa7NW2a0Ne0jIDJBie8T5SlszONJ6iGxaKv028dSdHRXlpW4O01NVxV3rIsZHzn8xxk5jiGW
	0ENU1aT3noc/MWmCoRiiboqefiiat0wU5+yAA9y43WikBVcQhO+M8ZLq2meIaswz57f+FWK8Uxiyz
	HoAln7Wvonh0uCGFBnT4B2QdfqfRIMddIWJ1mCQePk0Zb+wqMnadOFgL8HPJxUOAW6MADqgrNlLKK
	+p+PLhjJTJi7lTE5VK0ENiX+h3Jfm2lCFPC9QxUhn+HOhiF+OGAnaRJMVfpu3ubsl4sNlDDEvrxPr
	CnD5QjLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4doo-0000000EKTq-12mo;
	Thu, 10 Sep 2026 12:23:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dok-0000000EKRx-3rnR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789043035; x=1820579035;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jgzMo+jc3q+A/v2xMacCodsLl/Wrx/OHS3haDtdDJtE=;
  b=FPIf9VmoqxmOc/KekMMk7xhXPKc86v4f0ILU4d6cUtSDfPHt83FAMJD5
   2XSTYbu/y8fXZ7nBigS5WG0Gk/4NtWPBG6LHhkMObpgDEvSGX+ZcNfF4Z
   et7213lRWk+eM8i2FsoRvTDdFbV+MXvMHFCtG6lIZeT6BJ4LeuAq+sB2W
   MVV+jf0rmoB+6YRKtEhyjzVi5QTGXbusUwAk0ChzPCgqASz275lyJl+z/
   qZfnSV2AeQlg6mNS18OhKH6kpO4I1KaElHzogUoEQt1H8+pHECpwMRhaZ
   JgXMby0bkkFRiPdYa+oH2X1lXcTDJm8lvluKrMcRj39gY8tEsEVPcd+kU
   A==;
X-CSE-ConnectionGUID: xFhwPbRkQRugnQXNKtFw3A==
X-CSE-MsgGUID: NYit3wuCSTaiBpQ/FT2mrg==
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="294821368"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 05:23:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Thu, 10 Sep 2026 05:23:47 -0700
Received: from [10.171.248.45] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 10 Sep 2026 05:23:38 -0700
Message-ID: <86617617-0c89-485d-994e-7c98b42e526a@microchip.com>
Date: Thu, 10 Sep 2026 14:23:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] ARM: at91: remove samv7 support
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij
	<linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
CC: Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liviu Dudau
	<liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan
 Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Aaro Koskinen
	<aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
	<khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn
	<andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik
	<robert.jarzmik@free.fr>, Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre
	<npitre@baylibre.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-omap@vger.kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-13-arnd@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260908152808.3928630-13-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_052351_188833_45416FFC 
X-CRM114-Status: GOOD (  12.68  )
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

On 08/09/2026 at 17:28, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The Atmel at91 line, now known as Microchip SAM contains both
> SoCs using ARM926 and Cortex-A CPUs as well as a number of
> microcontrollers. Only a single one of those MCUs currently
> has Linux support, and has no known users.
> 
> The samv7 platform was deprecated in Linux-7.3LTS, which will
> remain supported a while longer after it is gone from mainline.
> 
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Regards,
   Nicolas

> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/arm/Kconfig.debug      | 10 ----------
>   arch/arm/mach-at91/Kconfig  | 11 +----------
>   arch/arm/mach-at91/Makefile |  1 -
>   arch/arm/mach-at91/samv7.c  | 17 -----------------
>   drivers/soc/atmel/soc.c     | 36 ------------------------------------
>   5 files changed, 1 insertion(+), 74 deletions(-)
>   delete mode 100644 arch/arm/mach-at91/samv7.c

[..]

