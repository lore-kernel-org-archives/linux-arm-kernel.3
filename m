Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5043C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 12:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ceVaas/zwMip4GikCNp3y9+sFxM0bT+slpdpZWeVj0s=; b=tFPrOdtfPtuueLNlbHjcLq8EG8
	aiQ4DZRReGMRscJv8QbRy4XUFtPv54BJJ81dH5uJ3lTLBuhE17/na863UmGptwc7sZj4WrSHQ7Kq0
	RvwS3B58vlRXBFj6bvn9HtCXHFtz/Pb+69+p7W5007RASpALTxlZo95FRdKg5DDe7DuuunByigqRj
	TtwwVAcOuzf3biZhwyRlM1lOtcCJt/Axg5IaJm98Cp4zr1/yw0AOS6IrhIMo7CVtrfZJkSzGMCdM2
	V7unx1bJ7emu3JT6UXyHkx9kpvAwGgAiS7asCD4W0AdY63q3dcN9ugilAZTxPVIkNKyxuEFSTfBc2
	ER+NUguA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3JT-0000000GLZj-2EO4;
	Fri, 13 Jun 2025 12:15:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3Dv-0000000GKr1-0oOj
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Jun 2025 12:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ceVaas/zwMip4GikCNp3y9+sFxM0bT+slpdpZWeVj0s=; b=jbCYqNyNf8IC9TmF4NjjhlkCue
	L+hZneIa0rnFTyv3rXN+M33x0nwQcLEZaynwjtaG6SnXiF/63+kLYB9GOLROcITDn04gp+L1v2vXb
	y4tZyA5LN9pXX2jnPqxeSBDGGcjOHaJ3XYUWNqkVjJKjZw+52JPbuylhWvs8fyTIPnZ+rsamuL9Br
	DodRJ3+gXs5gfdkMO9/ulU9vBMW2N+0IjCGFpxcYxyuubUBTozOCedUSPGHP9lHBw5R1K3QUcfeR9
	LZivjnm7NQLiFdhNBZdCKj4qejIPyzbGDDutXSwas10pT9v92UlbFBhI5EC3G5BCUGTYdI/H51wf6
	PSiTUSgw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3Ds-00000002zsz-3RUB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 12:09:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uQ3Dj-0000it-5I; Fri, 13 Jun 2025 14:09:19 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uQ3Di-003HuD-2p;
	Fri, 13 Jun 2025 14:09:18 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uQ3Di-00BA4s-2S;
	Fri, 13 Jun 2025 14:09:18 +0200
Date: Fri, 13 Jun 2025 14:09:18 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Robert Marko <robert.marko@sartura.hr>
Cc: catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	andi.shyti@kernel.org, broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	kernel@pengutronix.de, luka.perkov@sartura.hr, arnd@arndb.de,
	daniel.machon@microchip.com
Subject: Re: [PATCH v7 6/6] crypto: atmel-aes: make it selectable for
 ARCH_LAN969X
Message-ID: <aEwU7jkrYU3YYnLb@pengutronix.de>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
 <20250613114148.1943267-7-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613114148.1943267-7-robert.marko@sartura.hr>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_130929_127201_0E3090EA 
X-CRM114-Status: GOOD (  11.89  )
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

On Fri, Jun 13, 2025 at 01:39:41PM +0200, Robert Marko wrote:
> LAN969x uses the same crypto engine, make it selectable for ARCH_LAN969X.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

