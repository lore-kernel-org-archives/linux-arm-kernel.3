Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63844CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 19:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3vKFZ+ZAc477pdDejo5QZaOuOl53nFCfCWOpFZE7UY=; b=iKbb1DzBgnxDARHfimMc/5S/zM
	hi498MppPri0GKY4bBD+BEuJ6c+yVxeq/wAsXYF43zmpID+5PvinXegn80DZp5YEmUeCUjjtuvn81
	g/g++AEU5Ccxx0+mwvKfuPNEZjOw76qqHRJaV0VA77fqHphp123LgQIXGo7GdAZOhHxoXPspBDwhq
	BjcYhNhjPh+49n9wnnRRs3tlDNTOtMwvDRkQU3+serKnijtR4hPPN4CVVOPuufKe8iUHFRunyIc5r
	OLr5G8R8H7ckftja1XHtRh8qyeNeKWZsgLlUqKD3Rt5kyP/lYA8M6Yg+SsiqgiATc5rpdFV9l+T/M
	GmieWz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNc5T-00000006Sm2-1vxf;
	Thu, 14 May 2026 19:51:15 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNc5Q-00000006Sl0-1Ynu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 19:51:14 +0000
Date: Thu, 14 May 2026 21:51:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778788266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3vKFZ+ZAc477pdDejo5QZaOuOl53nFCfCWOpFZE7UY=;
	b=ENAOdSG/5e9S3guHxvN8N/NjNqnMIrV5wOAseLL5bQJfUQnMon3sPSd7L3rbYrMl7ZzvEy
	zb2FGLB1nANQ4vFaVl6zbwo1QdAIXq3buYALLUwnRvYxo7nUfvn17hX9PIZZPPZyO13ODp
	WoI/fng0zsEFc57DptemWhtHAheqfTk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] crypto: atmel - refactor common i2c support and
 add SHA256 ahash support
Message-ID: <agYnpsiG8bNeVw57@linux.dev>
References: <20260512224349.64621-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512224349.64621-1-l.rubusch@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_125112_777785_8495CB3E 
X-CRM114-Status: GOOD (  21.50  )
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

Hi Lothar,

On Tue, May 12, 2026 at 10:43:37PM +0000, Lothar Rubusch wrote:
> This series restructures the Atmel secure element drivers around a
> shared atmel-i2c core and adds SHA256 ahash support for ATSHA204A and
> ECC based devices.
> 
> The existing drivers duplicated substantial parts of the transport,
> RNG, EEPROM and device management logic. This series consolidates the
> common functionality into the shared i2c core and converts the client
> drivers to capability based allocation.
> 
> The series also introduces per-device timing configuration through
> match data, moves sanity checks and RNG handling into the core driver,
> updates workqueue handling and cleans up internal constants and helper
> definitions.
> 
> The final patch adds SHA256 ahash support using the hardware SHA engine
> provided by the devices.
> 
> ATSHA204A devices require software-side SHA256 padding according to
> FIPS 180-4, while newer ECC devices provide a dedicated SHA final
> command and perform padding internally in hardware.
> 
> Supporting the SHA engine also requires changes to the command
> transport path. SHA operations must execute as a strict uninterrupted
> sequence consisting of SHA INIT, one or more SHA COMPUTE commands and,
> for ECC devices, a terminating SHA FINAL command. The device loses its
> internal SHA state if it enters sleep mode or if unrelated commands
> are interleaved during the transaction.
> 
> To satisfy these hardware requirements, the send/receive path is split
> into a low-level transfer helper and a higher-level wrapper managing
> wakeup, sleep and locking. SHA operations keep the device awake and
> hold the i2c lock for the full duration of the hashing transaction.
> 
> The series has been tested on ATSHA204A and ATECC508A devices.
> Tests are ongoing/pending on ATECC608A and ATECC608B.
> ---
> Lothar Rubusch (12):
>   crypto: atmel - introduce shared I2C client management
>   crypto: atmel - move capability-based client allocation into i2c core
>   crypto: atmel - remove obsolete CONFIG_OF guard
>   crypto: atmel - add per-device timing and match-data driven
>     configuration
>   crypto: atmel - move RNG support into common i2c core
>   crypto: atmel - move EEPROM access support into common i2c core
>   crypto: atmel - expose CONFIG zone through sysfs
>   crypto: atmel - move device sanity check to core driver
>   crypto: atmel - check client data in remove callbacks
>   crypto: atmel - update workqueue flags and add flush on exit
>   crypto: atmel - refactor and localize driver constants
>   crypto: atmel - add SHA256 ahash support
> 
>  drivers/crypto/atmel-ecc.c     | 252 +++++++-----
>  drivers/crypto/atmel-i2c.c     | 679 +++++++++++++++++++++++++++++----
>  drivers/crypto/atmel-i2c.h     | 180 +++++----
>  drivers/crypto/atmel-sha204a.c | 284 +++++++-------
>  4 files changed, 1010 insertions(+), 385 deletions(-)
> 
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>

Thanks, but I'm not sure reviewing such a large series is sustainable.
I've only skimmed it, but it also mixes several different things that
should probably be submitted separately (e.g., refactorings and new
features).

Sashiko [1] also reviewed the series and found potential regressions
that might be helpful to consider.

Thanks,
Thorsten

[1] https://sashiko.dev/#/patchset/20260512224349.64621-1-l.rubusch%40gmail.com

