Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A448EE4992
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9PaIKfx0ypaAUCu3woRJo/bm3GevWJW36NU/5SDa5Q=; b=Oho+9O3fxo1vVOWGKJOplSTrv0
	S7+1MAkKteuArkvwV+HbK6nfjMRY5e9cu/CkIkpps7czPSiZUYmh2Nx/pL07j9Xoh1HuqukajajXe
	luT/cAgIYBZxDVLXqudc8WMR7GO/4D0jYVFUG+lJpzLmRwyAZElTnYBkZ/6Pyp2T+nC9KWnwRvco4
	o7CcIghCTcOpVnKRG5iV+1erKahcFe0RiN/s/ASbUmap3LIqKAESVaGyNIj0dA0MgSjcmyJf25NDx
	JN4X6gy8h1XI0z95jh9vw9ggtHRtEJOIUZ8YYxxQytlE2PqXsX1KOCZgIWOZd0UD6QWNedo3T56Hq
	xy2kXXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadsf-000000059KM-2lbz;
	Tue, 30 Dec 2025 17:51:37 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadsd-000000059JJ-0Ymf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 17:51:36 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xqw9.prod.antispam.mailspamprotection.com; s=arckey; t=1767117095;
	 b=MzLiqCfXAmPYMFyG2/u+xvHxWqcghr3gROCJsCSLLCk4h9FKDvTGEkg16MPoMoQvirwp+OM3o8
	  FT4NoZnVcuFVnk0KbcKxT9O3j8bBAmofAXAVxDkT32rMZkoH0rJTzz4ssFEQgJVez6R6Ugd/uV
	  6CkQIog10AaKpnKfUbYu/iB+LuaV/0l4TaOO3fZ0NCD1gEBwW+qKskcROXGK7T10o1TFdKluQa
	  jRZMyi4KIY3pYARAzbLdDgR20VXedNl47Hgp/LipIxa559meqOfTXaHGGi+85msm3cwTe64I2E
	  4QGD3ZzGSYmUOHfNRyT7PNEdWiZ9diAUUInFKjG/4xrorA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xqw9.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xqw9.prod.antispam.mailspamprotection.com; s=arckey; t=1767117095;
	bh=rbAp8Me5ipLrzK0s4yeINnwWURv6z0zvULOwHoV3Zjo=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=py3H65lqqYlHGkYS1t4qiknr+BgPURBYD4kcampVP1GAWi3Z6H2mTyS+Hh1bGQLQXsogX3PO3q
	  psKqvWNsZ4/B+UDuQtNdU6VSsTR5AGNJGwsqreyQB8NjNvu2DT98rPxNlosGtvfbAUfX75cOh9
	  98S/o/Ud/lzc8UzukPKujTOAAiehsKShjGNe/FI1bX/5t8BIXwIsmyGL39huFj94xi2RIZv1FQ
	  sjSUpIjUUG3GAwFSDsiphvbE7acsBRL+cf1y7pED3bTJDHLz2c1aAagaIhPwypbJgGgTurzUPp
	  +ubAF7mJ8Hf8O/11/7UedVto7TbuTAK5wKLT4mm9CDNBAQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=m9PaIKfx0ypaAUCu3woRJo/bm3GevWJW36NU/5SDa5Q=; b=ILoRJX3kBdyzHfiQIAC17k5G5/
	L+fwBWLBwkOZadVk5zG+dy1wRghODa+Nhr/ir9Xtg+m0VthlhBaQVPntVCS0NxYMzhq+eAtyCyFlb
	8wBDocMADdoe8Vt4JdZQ+APQt/pX9MilvN8OvLKq0Ln6MLZCja5+OMn6Ws+TmrWAgsVE=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xqw9.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vadsS-0000000Gsyd-4C0A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 17:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=m9PaIKfx0ypaAUCu3woRJo/bm3GevWJW36NU/5SDa5Q=; b=oY3ZQkiBNW6lgBspY/QM72BsYg
	eCV8rd9gLD4Wk3GCYQz2DQLCPcLmXEFq6ndzIluocwLsEl2gYCqjuYAWaegvIjTO/vSTrLctGAWNG
	HQnt5d8N5eoKnbjuGWjMIEuEuwdSUF3zxRSxF2RNTmdaqnX+gu0HWHGUUzNAVjRGfOXM=;
Received: from [95.248.141.113] (port=63913 helo=bywater)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vadsD-000000007p2-0fef;
	Tue, 30 Dec 2025 17:51:09 +0000
Date: Tue, 30 Dec 2025 18:51:07 +0100
From: Francesco Valla <francesco@valla.it>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabian Pflug <f.pflug@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Haidong Zheng <haidong.zheng@nxp.com>,
	Danwei Luo <danwei.luo@nxp.com>, Lei Xu <lei.xu@nxp.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add support for NXP i.MX93
 FRDM
Message-ID: <aVQRCzq8-Q5FguTN@bywater>
References: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
 <20251218-fpg-nxp-imx93-frdm-v4-2-cd3a9f6ac89a@pengutronix.de>
 <20251230171548.67289601@windsurf>
 <20251230172427.4f22ac7c@windsurf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230172427.4f22ac7c@windsurf>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 8a9dccd966a9b846d80cdbada4de540e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vadsS-0000000Gsyd-4C0A-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xqw9.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_095135_278934_B6673128 
X-CRM114-Status: GOOD (  18.27  )
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

Hello Thomas,

On Tue, Dec 30, 2025 at 05:24:27PM +0100, Thomas Petazzoni wrote:
> Hello (again),
> 
> On Tue, 30 Dec 2025 17:15:48 +0100
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> > I see the PMIC interrupt and the RTC interrupts are routed to the I2C
> > GPIO expander at 1-0022, so I imagine either the PMIC or the RTC are
> > triggering an interrupt (left enabled by U-Boot), and the kernel isn't
> > compiled with the driver for either the PMIC or the RTC, and therefore
> > there's no IRQ handler?
> > 
> > (I confess I didn't investigate more than that at this point.)
> 
> Upon closer inspection, I in fact get thousands over IRQ #100 per
> seconds right after boot, until the point where it reaches 100000 IRQ
> events, and the splat appears, with the IRQ being subsequently
> disabled. So it's not just one interrupt, but a storm of it.
> 

This recalls the behaviour seen on i.MX91 FRDM [0], and the hardware is
indeed very similar: the GPIO expander and the TypeC port controller
(PTN5110) share the same IRQ line, and if the first gets enabled before
the second an interrupt storm will happen (because the PTN5110 is
triggering interrupts that nobody services).

I did not see this during my testing - but maybe the probe sequence is 
different. Any chance you are not loading the driver for the PTN5110?
I see from your defconfig it should be compiled as module, but maybe
you are not including it into the image or not loading it?

The NXP downstream BSP is masking interrupts for the TypeC port
controller as part of the U-Boot initialization, as they are enabled by
default at reset. While it somewhat breaks the required isolation
between the bootloader and the system it loads, I fear this is the only
sensible option here, given this hardware limitation; this was the path
that was chosen for the i.MX91 FRDM (which has been applied today [1]).

> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> 

[0] https://lore.kernel.org/all/aTBFCc-8NzeS4MzT@bywater/
[1] https://lore.kernel.org/u-boot/CAOMZO5DsCi6GHrkvLEZTjsLy1D02A2e83YgMO36b3EMt8B6c5Q@mail.gmail.com/

Reagrds,
Francesco


