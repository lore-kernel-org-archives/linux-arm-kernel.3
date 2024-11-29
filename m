Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD81D6EBE6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 08:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xI6ZyEQYlO67EDyhVXwWpx45NB2tNXa1Y4U0cY6j/nk=; b=fs3mpnJDGKLA/S6WeKb5vHZ3ql
	YtMkAEJq2XUsZWUvQ9udvfoceUlgl2O5ajHSeNpb4WDc3Wz0O9cQv9CejFa3I4xuFi5ne6gAJ6ofz
	FTWepYvNc4YNXIobfZ+wBxJ6UtjByExNBXdCrefgUOxi7BHGv5P1OOdb5AHmdnuywmCeWHBFLDmyo
	XAkUBEk7VMN3EwdrmMfLOmDIpJDUsmmc4EKpT7S/mOJsDKlFNnH3lgp6Z7G4WartdvfCA3lqn+v8Q
	PqrwYfoRgXGHZGmV+H3rH8+o9GeYG+E/ZOUKKENqcQQP4U5rlGdivkjlzo/NX5q+zKNK3aslZ/Eyk
	ofTEX9KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGw66-0000000H91W-3NTK;
	Fri, 29 Nov 2024 08:11:30 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGw57-0000000H8oo-2h2U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 08:10:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADF4240003;
	Fri, 29 Nov 2024 08:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732867819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xI6ZyEQYlO67EDyhVXwWpx45NB2tNXa1Y4U0cY6j/nk=;
	b=Vl3fTfXgOUqb4XayzRUopNxuNO2a0PA88El3Vu57k1X2uvPqC3YDMFL4SXXvcnqdEv2qcC
	p7VAOtljAwIHPBmNSp/2/uIvdwozWyEuG9XBsypuWuD9uKEPEgHC0fLTumczbcD3dofyC9
	qwO/5TjFzq8qFITgBpYSGKkjQ8BvHIjfMvKXBRMcXgC/2yjhWejvojKqQRsryivCiD1JCy
	dx5myJsMw0QS86yN7CcSdrwNtG5t2wrN0bmKXVAjU9S2vPTG9ALfB6xSEIHzaGIeJBjGxS
	iM8o8ZeVZ4ex/HxBnuVh1FCfjxnQ9p06O9oGcM/2Z2YNI4a1b9mEiZwCTOlX7A==
Date: Fri, 29 Nov 2024 09:10:13 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Michal Kubecek <mkubecek@suse.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Simon Horman <horms@kernel.org>, Lee Jones
 <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Derek Kiernan
 <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Lars Povlsen
 <lars.povlsen@microchip.com>, Steen Hegelund
 <Steen.Hegelund@microchip.com>, Daniel Machon
 <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Andrew Lunn <andrew@lunn.ch>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v9 1/6] misc: Add support for LAN966x PCI device
Message-ID: <20241129091013.029fced3@bootlin.com>
In-Reply-To: <dywwnh7ns47ffndsttstpcsw44avxjvzcddmceha7xavqjdi77@cqdgmpdtywol>
References: <20241010063611.788527-1-herve.codina@bootlin.com>
	<20241010063611.788527-2-herve.codina@bootlin.com>
	<dywwnh7ns47ffndsttstpcsw44avxjvzcddmceha7xavqjdi77@cqdgmpdtywol>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_001029_946743_EB375A72 
X-CRM114-Status: GOOD (  16.66  )
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

Hi Michal,

On Thu, 28 Nov 2024 20:42:53 +0100
Michal Kubecek <mkubecek@suse.cz> wrote:

...
> > --- a/drivers/misc/Kconfig
> > +++ b/drivers/misc/Kconfig
> > @@ -610,6 +610,30 @@ config MARVELL_CN10K_DPI
> >  	  To compile this driver as a module, choose M here: the module
> >  	  will be called mrvl_cn10k_dpi.
> >  
> > +config MCHP_LAN966X_PCI
> > +	tristate "Microchip LAN966x PCIe Support"
> > +	depends on PCI
> > +	select OF
> > +	select OF_OVERLAY  
> 
> Are these "select" statements what we want? When configuring current
> mainline snapshot, I accidentally enabled this driver and ended up
> flooded with an enormous amount of new config options, most of which
> didn't make much sense on x86_64. It took quite long to investigate why.
> 
> Couldn't we rather use
> 
> 	depends on PCI && OF && OF_OVERLAY
> 
> like other drivers?
> 

I don't have a strong opinion on this 'select' vs 'depends on' for those
symbols.

I used select because the dependency is not obvious for a user that just
want the driver for the LAN966x PCI device.

Best regards,
Hervé

