Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AE7C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mF5oKs7psVdNl4VxctnZ6rzDqfIG7hBDlALYLcA054=; b=2uKkqi/gbUB0Q3Ah32Ogaw4xzk
	oSuFztrOpruQndj2RBz4PoZrres1K9ybbS//4v8cVn18MAJ8yE7fgwgZsPeTSd0YZLk0d/FkGZA5V
	5qsQuZLxMyFnQx4QbL6VQ6Inld5ksiRHLm05d9l8BrfEyfdHjM3EAzHY5FjQF7vwRW5/kvGfFYi+a
	RLfqq/aciibH17JhBjzxQQnrGen7EOBBcDOj2OQoJteseBdhBIwyWCT0x2tthcBYlCBjUwp0cpGsg
	o7gRR0VQ99UB+qkN6x8HJyTxJWtjYnBqT1jTbub7gyNzwC9DYyHdLauWLFftj/NkGxajPqCtdg07s
	VGSgJxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MYj-0000000CeTx-0gLl;
	Thu, 17 Apr 2025 10:33:29 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MLT-0000000Cc7y-3xjS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 10:19:49 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HAJeLg3052983
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 05:19:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744885181;
	bh=9mF5oKs7psVdNl4VxctnZ6rzDqfIG7hBDlALYLcA054=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=kodfp0eG+L2VAdCVnwgTYzTDynCGAN4U+HjU474A7q01Vv5gfYFFIIX4XFxZz61xI
	 +xVnnSLk2cSiU6mkglJVssmz5ZbvgoMijjSpvyDrSjQ9qPG+0GkaHirkW0+/R4DVxv
	 eWBWkMPB9ep7yhgzXmnJ/vikwpRJh4/J2B1PQE50=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HAJeqV021946
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 05:19:40 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 05:19:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 05:19:40 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HAJdBe019708;
	Thu, 17 Apr 2025 05:19:39 -0500
Date: Thu, 17 Apr 2025 15:49:38 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Robert Nelson <robertcnelson@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
        Andrew Davis
	<afd@ti.com>, Roger Quadros <rogerq@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>, Judith Mendez <jm@ti.com>,
        Andrei Aldea
	<a-aldea@ti.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Deepak Khatri
	<lorforlinux@beagleboard.org>,
        Ayush Singh <ayush@beagleboard.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
Message-ID: <20250417101938.uc5tm5gd2tx7ujgj@lcpd911>
References: <20250415225940.3899486-1-robertcnelson@gmail.com>
 <20250415225940.3899486-2-robertcnelson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250415225940.3899486-2-robertcnelson@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_031948_240605_7E744A6E 
X-CRM114-Status: GOOD (  13.90  )
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

Hi,

On Apr 15, 2025 at 17:59:40 -0500, Robert Nelson wrote:
> BeagleBoard.org PocketBeagle 2 is an upgraded version of the popular
> PocketBeagle.  It is based on Texas Instruments AM6232 or AM6254 SoC.
> Its dual or quad A53 cores can provide higher performance than classic
> PocketBeagle. The new design comes with pre-soldered headers, a 3-pin
> JST-SH 1.00mm UART debug port, a USB-C port, Texas Instruments
> MSPM0L1105 Cortex-M0+ MCU for ADC, 512MB RAM, and a LiPo Battery charger.
> 
> MSPM0L1105 firmware source: https://openbeagle.org/pocketbeagle/mspm0-adc-eeprom
> * EEPROM 24c32 emulation
> * ADC ad7291 emulation
> 
> https://www.beagleboard.org/boards/pocketbeagle-2
> https://openbeagle.org/pocketbeagle/pocketbeagle-2
> 
> Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: Vignesh Raghavendra <vigneshr@ti.com>
> CC: Nishanth Menon <nm@ti.com>
> CC: Andrew Davis <afd@ti.com>
> CC: Roger Quadros <rogerq@kernel.org>
> CC: Siddharth Vadapalli <s-vadapalli@ti.com>
> CC: Judith Mendez <jm@ti.com>
> CC: Andrei Aldea <a-aldea@ti.com>
> CC: Dhruva Gole <d-gole@ti.com>
> CC: Jason Kridner <jkridner@beagleboard.org>
> CC: Deepak Khatri <lorforlinux@beagleboard.org>
> CC: Ayush Singh <ayush@beagleboard.org>
> ---
> Changes since v2:
>  - cleanup unused serial aliases
>  - cleanup unused sdhci0 (un-populated) aliases
>  - cleanup unused main_i2c1 (un-populated) aliases
>  - add missing main_i2c0 aliases
>  - fix bootph, function, color, gpios order in leds nodes
>  - drop local cpsw disable, needs to be moved to k3-am62-main
>  - MSPM0L1105 add firmware source and note where emulated
>  - usb0 add note about Type-C connector, but only wired for USB 2.0
>  - usb1 add compatible note with original PocketBeagle expansion boards
> Changes since v1:
>  - fix '_' in main-i2c2-default-pins
>  - aliases i2c match original pocketbeagle
>  - add mcu_m4fss with reseved memory and mailbox
>  - drop unused main_gpio0_pins_default pinmux
>  - drop unused main_gpio1_pins_default pinmux
>  - drop unused main_spi2_pins_gpio pinmux
>  - Reserve 128MiB of global CMA
> ---

Thanks for all the fixes, I also boot tested with a bare minimum Image [1]
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Tested-by: Dhruva Gole <d-gole@ti.com>

[1]
https://gist.github.com/DhruvaG2000/d67dce191b6613736ba38f19cf0a0cc6
[No modules installed, only kernel + DTB boot test]

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

