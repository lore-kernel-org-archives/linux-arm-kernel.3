Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE23C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQOvwRNwTkLzVaY8id30dLgtF9kWAMl8WmMJa6WWsyM=; b=e8U80YhZOJ//hlyBmAbOe8ACdV
	daYtDtyFiuIPpPXePzGrQQdgSuovxZbkskCrjj1+HlKW5eT8Slids+AliI3eaCM/4jdkI9xsZPp32
	jvaHVxPgJGw3gUQWViUJgvm41IVolBI4/10EBK2FPtqHUCwzro4IDTM37Yts4RJPp2M1k3WSJpR60
	gwdyqxZqXTF1BX1TjWS3cWU537CF1gIvrx+BU5fvRV21ZrisEuYKQN7n3v/7oQiCxLghFP2OCxNCZ
	WpodkoyhWXtwqgTkCkANb1L/fG+NzgB/jZkLSWTiEJ8xQDyqvJqbXsTGxiWpO6YW0jWswPzIHRbC4
	hrUmI8uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xwh-00000009WQX-3xIS;
	Tue, 08 Sep 2026 15:41:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xwg-00000009WPr-3NAn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fQOvwRNwTkLzVaY8id30dLgtF9kWAMl8WmMJa6WWsyM=; b=kZ82dRD9gvHa3RdbHs0+8GrsXg
	RDdAnc4HGOQmvUBLnP7CH901MPeM1mTiqbP5bcuCNHwzZ6IFzP5jlMtYeTN5FcT+tHI/6HP/wwfl5
	J8voIA60FWJ9R+CdMqgb4oRFWjWGfCdkKJ9j3/H38mhQJ71yBGFGGU5i4yPTWqn3Yjx8C98KRVV7C
	YNYBTd7STNC3epye3byMzTVo7ZaCrbxBLxP3pnJEuL7qFuHZlyTCgXZ9GlFO7ja01N5tg2oK2yBIP
	1bnEV9isQjvPRJxZ3x5iMemqIHnpS29khoQyb+A/gLINXxH4Lyzh5mUL/fo+nCqjMXKswlrzQOIpy
	UTxgYYQw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xwd-000000002BL-1cZV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:41:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20D5A1476;
	Tue,  8 Sep 2026 08:41:05 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A8123F7B4;
	Tue,  8 Sep 2026 08:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788882068; bh=GzYrXlZnDB1XKGfiPNBinLUJL2v814WR7dfGcc/FiBQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pHtb0IRAsW9wOvzoGibNXykydW6eCILCKGrOEu/Cep+YCKNzNG2lTH/1wfxB6GmXU
	 cHbWOW8J08oJ3H7b5SEaQKXaSVLD7iAL3oCvN7oSRO9NDX5ROzp1Mcpr9JSj/4Bquq
	 NbOWYxtdlzil98rLN4cciq3EoT4jY0mdiyk89BJk=
Message-ID: <cdb4d02c-242f-4b82-9ddc-f9ea5eb91b53@arm.com>
Date: Tue, 8 Sep 2026 16:41:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] ARM: versatile: remove mps2 support
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-12-arnd@kernel.org>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260908152808.3928630-12-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_164111_818803_536551F6 
X-CRM114-Status: GOOD (  14.61  )
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

On 9/8/26 16:28, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The Arm mps2 platform is the reference implementation for Arm
> microcontrollers and is useful for testing but not expected to be used
> as a production device.
> 
> With all the Cortex-M based products gone, there is no longer a need
> for a reference platform either, so remove it as well.
> 
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/Kconfig                     |  14 --
>  arch/arm/boot/dts/arm/Makefile       |   3 -
>  arch/arm/boot/dts/arm/mps2-an385.dts |  92 -----------
>  arch/arm/boot/dts/arm/mps2-an399.dts |  92 -----------
>  arch/arm/boot/dts/arm/mps2.dtsi      | 220 ---------------------------
>  arch/arm/configs/mps2_defconfig      | 102 -------------
>  arch/arm/mach-versatile/Makefile     |   3 -
>  arch/arm/mach-versatile/v2m-mps2.c   |  17 ---
>  drivers/i2c/busses/Kconfig           |   2 +-
>  9 files changed, 1 insertion(+), 544 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/arm/mps2-an385.dts
>  delete mode 100644 arch/arm/boot/dts/arm/mps2-an399.dts
>  delete mode 100644 arch/arm/boot/dts/arm/mps2.dtsi
>  delete mode 100644 arch/arm/configs/mps2_defconfig
>  delete mode 100644 arch/arm/mach-versatile/v2m-mps2.c

Acked-by: Vladimir Murzin <vladimir.murzin@arm.com>


