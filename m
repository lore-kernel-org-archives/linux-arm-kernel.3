Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763ACC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gbGOXTJamto1+tsBehXtVioYCP451qEHFbaWgvr9Rg=; b=dAItZ+bpxhM9Vj6LOFmV1S05k+
	K+v0tWI+NHk4m50PlEyYyl1W/59H1tQ1PkiBsv59akbe1NITa1Er9etszf/SzD+dwLOgzwh99oJ8A
	49A5uo0+7pZYi3l14lvaMyvbMd9QBqjTDunZXNcWbYJmh3BIggMInX6TknYQvl3WfPs4PJCIMEowm
	2LRgpDibjr7vaukD/xC/TTJcRTdkx/HOV05px1yXx9bA1MJHeM5AOFaaHEfliTcTCC50PGuLBTKJR
	gnJpZHstpFL9TNjFtu6FjQ/RtixdA3sJaT+7fHM7PKql4kUVIKfLPHgIQ25a18nsjnCalM/AiC1j4
	lBNISgbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dqP-0000000EKiq-1vYZ;
	Thu, 10 Sep 2026 12:25:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dqL-0000000EKiW-24ec
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789043134; x=1820579134;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MTbeJ01FO9J17bRn1c8XUB7qT3+WXI4gOZk+nMm/nfc=;
  b=Ud+OYh0B6MJYJk8ei4L0phnNSlP4Twcl5S+mkc00cMtUCp1Hc0+gMarn
   Gnd47ERcFLyXBRxfOqEFxarfYunsHqjh86WR/3U+twan/W/dESf3mmwM8
   9Mo3fQY6EtXNDKH8oMex3cGaGQVwmeQjascmF/Pz6ghS1I2vt53dErsMM
   MlqA3Yr2acwuyHX3gzN5wdaKd0Jv0kDEoYbKiDJ6bWeNqdx3P8DTb28Mn
   Z4ejXwDIEkzqCvTlCHz7i3xubQlxI8zo/EngV5f0eNUrDNJzR3vThAwyT
   INwm1qhavLByUA8qqeQoYjHCV0yl3cM9Z2Iy3y9I+LamgsiumiEUur4/t
   g==;
X-CSE-ConnectionGUID: 4abtTWM1TV2omNHCNlEErg==
X-CSE-MsgGUID: IfbE0zNeTWSylvZ/wUi8cQ==
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="294821428"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Sep 2026 05:25:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 10 Sep 2026 05:25:28 -0700
Received: from [10.171.248.45] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 10 Sep 2026 05:25:17 -0700
Message-ID: <fe9feffe-5bf1-47c7-9b29-f289a0a2f5a2@microchip.com>
Date: Thu, 10 Sep 2026 14:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] ARM: at91: remove samv7 support
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Arnd
 Bergmann <arnd@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla
	<sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank
 Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement
	<gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore
	<enelsonmoore@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "A.
 Sverdlin" <alexander.sverdlin@siemens.com>, Shawn Guo <shawnguo@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>, "David Hildenbrand (Red Hat)"
	<david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-stm32@st-md-mailman.stormreply.com>, Linux-OMAP
	<linux-omap@vger.kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-13-arnd@kernel.org>
 <20260908210947.GA519272-robh@kernel.org>
 <7608c487-390e-4526-a2ac-11f073c902c2@app.fastmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <7608c487-390e-4526-a2ac-11f073c902c2@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_052529_549901_9A67672B 
X-CRM114-Status: GOOD (  16.26  )
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

On 08/09/2026 at 23:30, Arnd Bergmann wrote:
> On Tue, Sep 8, 2026, at 23:09, Rob Herring wrote:
>>
>> Do you want to drop all the samv7 platform compatibles from at91.yaml?
>> Are there non-Linux users using DT?
> 
> I see that zephyr uses DT here, but it uses an incompatible
> set of bindings, see
> https://github.com/zephyrproject-rtos/zephyr/tree/main/dts/arm/atmel
> 
> I'm dropping the references from the binding now, and also from
> Documentation/arch/arm/microchip.rst, which I had missed earlier.

Very good, thanks for having handling that Arnd.

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Best regards,
   Nicolas

> diff --git a/Documentation/arch/arm/microchip.rst b/Documentation/arch/arm/microchip.rst
> index e721d855f2c9..b776a6656717 100644
> --- a/Documentation/arch/arm/microchip.rst
> +++ b/Documentation/arch/arm/microchip.rst
> @@ -157,45 +157,6 @@ the Microchip website: http://www.microchip.com.
> 
>             Coming soon
> 
> -    * ARM Cortex-M7 MCUs
> -      - sams70 family
> -
> -        - sams70j19
> -        - sams70j20
> -        - sams70j21
> -        - sams70n19
> -        - sams70n20
> -        - sams70n21
> -        - sams70q19
> -        - sams70q20
> -        - sams70q21
> -
> -      - samv70 family
> -
> -        - samv70j19
> -        - samv70j20
> -        - samv70n19
> -        - samv70n20
> -        - samv70q19
> -        - samv70q20
> -
> -      - samv71 family
> -
> -        - samv71j19
> -        - samv71j20
> -        - samv71j21
> -        - samv71n19
> -        - samv71n20
> -        - samv71n21
> -        - samv71q19
> -        - samv71q20
> -        - samv71q21
> -
> -          * Datasheet
> -
> -          http://ww1.microchip.com/downloads/en/DeviceDoc/SAM-E70-S70-V70-V71-Family-Data-Sheet-DS60001527D.pdf
> -
> -
>   Linux kernel information
>   ------------------------
>   Linux kernel mach directory: arch/arm/mach-at91
> diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> index bf161e0950ea..d9b32a95b136 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> +++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> @@ -258,45 +258,6 @@ properties:
>             - const: microchip,lan9668
>             - const: microchip,lan966
> 
> -      - items:
> -          - enum:
> -              - atmel,sams70j19
> -              - atmel,sams70j20
> -              - atmel,sams70j21
> -              - atmel,sams70n19
> -              - atmel,sams70n20
> -              - atmel,sams70n21
> -              - atmel,sams70q19
> -              - atmel,sams70q20
> -              - atmel,sams70q21
> -          - const: atmel,sams70
> -          - const: atmel,samv7
> -
> -      - items:
> -          - enum:
> -              - atmel,samv70j19
> -              - atmel,samv70j20
> -              - atmel,samv70n19
> -              - atmel,samv70n20
> -              - atmel,samv70q19
> -              - atmel,samv70q20
> -          - const: atmel,samv70
> -          - const: atmel,samv7
> -
> -      - items:
> -          - enum:
> -              - atmel,samv71j19
> -              - atmel,samv71j20
> -              - atmel,samv71j21
> -              - atmel,samv71n19
> -              - atmel,samv71n20
> -              - atmel,samv71n21
> -              - atmel,samv71q19
> -              - atmel,samv71q20
> -              - atmel,samv71q21
> -          - const: atmel,samv71
> -          - const: atmel,samv7
> -
>   additionalProperties: true
> 
>   ...


