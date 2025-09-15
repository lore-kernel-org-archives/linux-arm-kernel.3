Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1A9CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 12:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zdl8Abw19eJBEkm+MkgHGgPBxNJpyUu10Dkr51eTmrE=; b=iX4UyXIUpEA15fTZOXYxHw3j/M
	Lu+S8vjcEIaNQZtz3Iha5CBbSp8+8M6TSG/3TahZJmvbRdfP7ms7xw6Hfa0OajveH6QnyUywQ0hQ+
	3m3go6g4ANGihgmcdRxP0h/rt73fuEVwoxTDoXpDECf5M6vgIbxwKyJ/4HG2xGXMP3rOyHmCRZ6CB
	uNNJnRPuygTHaYKgmuUgECnAmhfH/ewEkeZaAo9MGFhWgc/F8a02luWjOGSoWm9tBl9xIWZbf3A1y
	mERQmqzgIQD06b2rjyTOO4dDaM8eOUr/pBlXSHzu8NsPgLajh1+a8sgwp2kb7FCHjCD7ihb8ZtX1x
	8rMlmWBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8XJ-00000004B12-11zz;
	Mon, 15 Sep 2025 12:42:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8XI-00000004B0b-0fqs
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 12:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Zdl8Abw19eJBEkm+MkgHGgPBxNJpyUu10Dkr51eTmrE=; b=Wo3HudL8Nfe1Y84/+LIUBgHioP
	6EDwJHlsr3tk4trTrvNjiyNc1v5xFDIgVZ21SiZzDd9NEB7c+wpRKoJ3TKdWZZQcLALID1YMF290I
	qz5cfgBJq+68DlxEu/lFY8GXMXw1wGphMOHZipKMIFLDw1PjtwZoc/YmFyvdnagQA6RQZmBeJG2/Y
	bHsH5T9c6Cv+9L0mCOMm4/E3BXergpl6IWAJSd2Sf4GxRNpbG2cB8JoREEx+je76DNfne4DFBmnsr
	dOB8sAFtcX1zswyolecMAGzlaEKJv7lFqbN4LNkj328elFHfQSSgHRy7iqip5xI/r3ZMM3bVsLSzo
	pTb0IexQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8XE-00000006ziH-0s3L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 12:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757940139; x=1789476139;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wabpa/Bn/zIBSd7p273qDFAlQ7rd9ElIYVr2tgBU9nE=;
  b=UGMKi85YbuvDqBTeNN/pKeVzUlngZGvZ8ZbPh/Tibc1mcz0Calz8kE9F
   n02mRE0idy05lfQ+rHcL4I9AKUdRLbQW0EsNzzaiRWnJkhWBaBlKb8flD
   vGJBmNmyefSfW7nfEC/eY8oJ9RNB/XPEWB59b56L4q0FlGtXoEhjc1b5w
   cgmDueWOWIM9RPweTHk9JXZjcj/4bb+iKyLvPX7S3Jz4LXT+v4yafRgZY
   e4lOfwp1TNXCJJV2T/XjaVq/BQnA7+C2YFXALEhnUQ3gbThbgLd7WavDm
   EGr6XEoclBuUBOf2rOlt4A2xUgWy2XPMhRpFn2XucD0iWcTeft3IN27bE
   w==;
X-CSE-ConnectionGUID: 1DTnD4bHR5G9Cvo21y5Mrg==
X-CSE-MsgGUID: Ytig52/fSJiTzZ/2C8AsWQ==
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="52326574"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2025 05:42:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 05:42:06 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 15 Sep 2025 05:42:02 -0700
Message-ID: <22f61953-e63f-4bfd-b129-52224cb0d122@microchip.com>
Date: Mon, 15 Sep 2025 14:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/9] arm64: lan969x: Add support for Microchip LAN969x
 SoC
To: Robert Marko <robert.marko@sartura.hr>, <linux@armlinux.org.uk>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <olivia@selenic.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<andi.shyti@kernel.org>, <lee@kernel.org>, <broonie@kernel.org>,
	<gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <arnd@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<o.rempel@pengutronix.de>, <daniel.machon@microchip.com>, Conor Dooley
	<conor@kernel.org>
CC: <luka.perkov@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_134220_823348_7C4166E1 
X-CRM114-Status: GOOD (  16.00  )
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

On 13/08/2025 at 19:44, Robert Marko wrote:
> This patch series adds basic support for Microchip LAN969x SoC.
> 
> It introduces the SoC ARCH symbol itself under the ARCH_MICROCHIP symbol
> which allows to avoid the need to change dependencies of the drivers that
> are shared for Microchip SoC-s in the future.
> 
> DTS and further driver will be added in follow-up series.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

In linux-next for a few days and pull requests sent to arm-soc.

Thanks Robert and all that reviewed.
Best regards,
   Nicolas

> ---
> Changes in v9:
> * Make ARCH_MICROCHIP hidden symbol that is selected by SparX-5 and LAN969x
> directly, this avoids breaking existing configs with ARCH_SPARX5
> 
> Changes in v8:
> * Move to using ARCH_MICROCHIP as suggested by Arnd
> * Dropped any review tags due to changes
> 
> Robert Marko (9):
>    arm64: Add config for Microchip SoC platforms
>    ARM: at91: select ARCH_MICROCHIP
>    arm64: lan969x: Add support for Microchip LAN969x SoC
>    mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
>    tty: serial: atmel: make it selectable for ARCH_MICROCHIP
>    spi: atmel: make it selectable for ARCH_MICROCHIP
>    i2c: at91: make it selectable for ARCH_MICROCHIP
>    char: hw_random: atmel: make it selectable for ARCH_MICROCHIP
>    crypto: atmel-aes: make it selectable for ARCH_MICROCHIP
> 
>   arch/arm/mach-at91/Kconfig     |  4 +++
>   arch/arm64/Kconfig.platforms   | 51 ++++++++++++++++++++++++----------
>   drivers/char/hw_random/Kconfig |  2 +-
>   drivers/crypto/Kconfig         |  2 +-
>   drivers/i2c/busses/Kconfig     |  2 +-
>   drivers/mfd/Kconfig            |  2 +-
>   drivers/spi/Kconfig            |  2 +-
>   drivers/tty/serial/Kconfig     |  2 +-
>   8 files changed, 47 insertions(+), 20 deletions(-)
> 
> --
> 2.50.1
> 


