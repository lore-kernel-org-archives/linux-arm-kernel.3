Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB01C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 12:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPCRe/TgEltGIITb2RSmkN/AQ+QZSqqEFrNT5myaLgc=; b=oTc4MDBZDFXQy049jUFO2ZT2eW
	PDXdW9NzKXO91GH1wi2TZTEFgaIYn3eNQBCLiPWylB7hGs0/KmVXoJkFuhhI/Vnwz/fKZCj8Z92lA
	l6TuIlY9ZSsjT8/IHxziEYwLF/CDqYLO9qZgZOVpgalsUwbLxsdAuT6WUXOgp4I9Xc+5Y/NZpYpBQ
	ibjoNjeQ4kKD8MaxWY02sI9NHzTMW/pIDc/7IjaoSkHDyVisDmfDSznEB/5a6bRDAFXBZy+3ntkNv
	7S+6n0MO3cN8nYSR4haS/+hLbqh3vowLu++vePwACknuDSeNNWzvVk9qkD/HExZkZ9OFshGKVmcE4
	bx+E5RNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3HE-0000000GLKG-3h7a;
	Fri, 13 Jun 2025 12:12:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3DE-0000000GKl8-2h3E
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Jun 2025 12:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cPCRe/TgEltGIITb2RSmkN/AQ+QZSqqEFrNT5myaLgc=; b=hanV48KGDCBx9qyP/dHiFu0tEE
	v/CbOF1wsNpiStTY197qBw1srzLcUAmD41nml7eZkRH+zyUiQtFJXoLmIJBXCvwBoze7yD5ekaiGt
	/AzX5aTb8WaOh1bmq+GrLw4SORcw+WZ9wfj4p0kx2z78rSS3EUGo+LTPku38Ylc9pOruY7V9unO75
	L4xYUFIbmSF1SVVeMw5f6EVg0c1IuUQLXH2CO3/9mmFOPqnisnn5QTDf6THpy9wRawA5ZXCCHmV+f
	BO6GkUG08riHt2EAqn5HaBa4KQxjXQo1DUqF5ok305mj9UqgA1paUcgMEUqLmG4aejSWLT3hDeV7Y
	H03U4F9Q==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3DC-00000002zrS-20AW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 12:08:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uQ3D2-0000Pz-Cs; Fri, 13 Jun 2025 14:08:36 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uQ3D2-003Hu1-0N;
	Fri, 13 Jun 2025 14:08:36 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uQ3D1-00BA4H-3D;
	Fri, 13 Jun 2025 14:08:36 +0200
Date: Fri, 13 Jun 2025 14:08:35 +0200
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
Subject: Re: [PATCH v7 3/6] i2c: at91: make it selectable for ARCH_LAN969X
Message-ID: <aEwUw3D2htUAx-Wq@pengutronix.de>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
 <20250613114148.1943267-4-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613114148.1943267-4-robert.marko@sartura.hr>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_130846_739507_385BB7A2 
X-CRM114-Status: GOOD (  11.96  )
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

On Fri, Jun 13, 2025 at 01:39:38PM +0200, Robert Marko wrote:
> LAN969x uses the AT91 TWI I2C, so make it selectable for ARCH_LAN969X.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

