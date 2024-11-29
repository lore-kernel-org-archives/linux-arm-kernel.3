Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246F0D729E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 17:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z02MjlJuh3b3hDQPFS72EpBOSuOXivey6EAK77/5mEo=; b=vcTkZ/U+MDzoaKikOKZ19ZiWHL
	v4fGho4Ke4U731eQzHBT5i6E69jNKDedQXoNXgjXRc34plgNQ06g1usUSwPAORQASvZHTQ/MobM8F
	CmSWD6uIZtL1EqRy8yXe6SoqqqtXUoKz+9JcHTiAagImWUyAdRteicScqcaLfe1JZlESp+PDViLmR
	6wkE65BCZvCn7Nyhj/9YAD8Xgwst2uJDmAlMGWxLQPP2rdlu9G/UFKP1gPsqXZSqhEOzSOGWyI7f/
	w/1vDOWiCWd+dKL2r1pnhXnUM6nSC02TA1gddOzqBNX7b726NDzL59QFPrwTJteVbew8bBNFVzn97
	DX1xPyng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH4w4-00000000ibw-3Mp3;
	Fri, 29 Nov 2024 17:37:44 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH4v5-00000000iSw-40XS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 17:36:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A47B9240015;
	Fri, 29 Nov 2024 17:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732901800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z02MjlJuh3b3hDQPFS72EpBOSuOXivey6EAK77/5mEo=;
	b=jsfNbPPng/GRegUIEJ4p4mxJOa8AY12nYR20XbQ8t3rkvxi4NdJbUYcQ4tQvsVxfaJEpx5
	OD9BHE20vUPRbjY9K3HLWUewLAcPcTLeIBpdT3VN6pCSeVNisCLFZ0uZd1xQsWAyXCVJGX
	mYiS1Sz1N3iPyl7AdZ2WC8wFTLlUGWraMIy0SBIkA54GSVixqK0aJZPAjdiXm7Bc6k5HIi
	Hn5iJf899ZRyhy0R6cvRjOt38EzG/5YZA2sv0hgstXCMZ9fplreT4vwb8ct4D1G9BTqPvN
	e2FWnmGmQ6zaah6xPjFkOIxCYtVO8hGsdI92t1qD45flUEypQIWtibQRa8/B2g==
Date: Fri, 29 Nov 2024 18:36:36 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michal Kubecek <mkubecek@suse.cz>, Andy
 Shevchenko <andy.shevchenko@gmail.com>, Simon Horman <horms@kernel.org>,
 Lee Jones <lee@kernel.org>, "derek.kiernan@amd.com"
 <derek.kiernan@amd.com>, "dragan.cvetic@amd.com" <dragan.cvetic@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Lars Povlsen
 <lars.povlsen@microchip.com>, Steen Hegelund
 <Steen.Hegelund@microchip.com>, Daniel Machon
 <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Andrew Lunn <andrew@lunn.ch>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Netdev
 <netdev@vger.kernel.org>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ricardo Ribalda
 <ribalda@chromium.org>
Subject: Re: [PATCH v9 1/6] misc: Add support for LAN966x PCI device
Message-ID: <20241129183636.7043fa66@bootlin.com>
In-Reply-To: <CAMuHMdWgqEZtd82hSp0iYahtTcTnORFytTm11EiZOjLf8V9tQw@mail.gmail.com>
References: <20241010063611.788527-1-herve.codina@bootlin.com>
	<20241010063611.788527-2-herve.codina@bootlin.com>
	<dywwnh7ns47ffndsttstpcsw44avxjvzcddmceha7xavqjdi77@cqdgmpdtywol>
	<20241129091013.029fced3@bootlin.com>
	<1a895f7c-bbfc-483d-b36b-921788b07b36@app.fastmail.com>
	<CAMuHMdWXgXiHNUhrXB9jT4opnOQYUxtW=Vh0yBQT0jJS49+zsw@mail.gmail.com>
	<93ad42dc-eac6-4914-a425-6dbcd5dccf44@app.fastmail.com>
	<CAMuHMdWgqEZtd82hSp0iYahtTcTnORFytTm11EiZOjLf8V9tQw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_093644_282779_9EAE9A6D 
X-CRM114-Status: GOOD (  32.47  )
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

+Cc Ricardo

On Fri, 29 Nov 2024 11:29:44 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Arnd,
> 
> On Fri, Nov 29, 2024 at 10:23 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Fri, Nov 29, 2024, at 09:44, Geert Uytterhoeven wrote:  
> > > On Fri, Nov 29, 2024 at 9:25 AM Arnd Bergmann <arnd@arndb.de> wrote:  
> > >> On Fri, Nov 29, 2024, at 09:10, Herve Codina wrote:
> > >> I would write in two lines as
> > >>
> > >>         depends on PCI
> > >>         depends on OF_OVERLAY
> > >>
> > >> since OF_OVERLAY already depends on OF, that can be left out.
> > >> The effect is the same as your variant though.  
> > >
> > > What about
> > >
> > >     depends on OF
> > >     select OF_OVERLAY
> > >
> > > as "OF" is a clear bus dependency, due to the driver providing an OF
> > > child bus (cfr. I2C or SPI bus controller drivers depending on I2C or
> > > SPI), and OF_OVERLAY is an optional software mechanism?  
> >

A patch has be done in that way by Ricardo Ribalda
  https://lore.kernel.org/all/20241129-lan966x-depend-v1-1-603fc4996c4f@chromium.org/

> > OF_OVERLAY is currently a user visible option, so I think it's
> > intended to be used with 'depends on'. The only other callers
> > of this interface are the kunit test modules that just leave
> > out the overlay code if that is disabled.  
> 
> Indeed, there are no real upstream users of OF_OVERLAY left.
> Until commit 1760eb547276299a ("drm: rcar-du: Drop leftovers
> dependencies from Kconfig"), the rcar-lvds driver selected OF_OVERLAY
> to be able to fix up old DTBs.
> 
> > If we decide to treat OF_OVERLAY as a library instead, it should
> > probably become a silent Kconfig option that gets selected by
> > all its users including the unit tests, and then we can remove
> > the #ifdef checks there.  
> 
> Yep.
> 
> > Since OF_OVERLAY pulls in OF_DYNAMIC, I would still prefer that
> > to be a user choice. Silently enabling OF_OVERLAY definitely has
> > a risk of introducing regressions since it changes some of the
> > interesting code paths in the core, in particular it enables
> > reference counting in of_node_get(), which many drivers get wrong.  
> 
> Distro kernels will have to enable this anyway, if they want to
> support LAN966x...
> 

Best regards,
Hervé

