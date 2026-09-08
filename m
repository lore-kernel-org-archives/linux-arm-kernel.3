Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8B1C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 21:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fo0YbEFL8wMrCYE2f1oBd51v/3oi28C2SOi3ZLEFoU0=; b=H4ZcpHNTlJUZKlxSUziwzCEJOB
	8/iv9mYpPArQ0VX7csim9EQx5iCnMr4CyTB+a/EUSNFDQOZWcfGS3PV+bhCLKIZ7VE/Cyol95sBdn
	Kli4DVlgJQcY08LxVz4s29vaO+d8GzV7sufFEdLae7qLCFuiR+VERm25BdWjlQecqmybxepxpur+a
	i73fXioCi+20GnV2eo6qZ3rcqj8gFFb7m8RTzKnoMUXrcNGKZ9GjXHBF7Q73kUQtL97gojSDY+cyq
	o4ZDbtDje4vZt4axRS/f6PTYCDgcejGfBHSbCDIk11h1VTkXNhYAVWWQH/KISmDLyGWQHbFg/YohM
	RaopFGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43KU-0000000AJFm-0Qlb;
	Tue, 08 Sep 2026 21:26:10 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43KR-0000000AJF5-1QEg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 21:26:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso75683575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 14:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788902765; x=1789507565; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fo0YbEFL8wMrCYE2f1oBd51v/3oi28C2SOi3ZLEFoU0=;
        b=GIAcGpkW7FNpZ8JSz9PV4UKwKAKg1m4GvWsC4wojJ4nwswU82BhHm5oJyxqcxN5Gi8
         37VMMO1VD/P4Ym9FBYcmFBrO+enNJY6DHaeVb/PpBrySlOmV/VZYGKlYY9eXNoPa0ezT
         uSHVK+V02alg+j2Lr8uVz2yA3n9nNc/OiHlDK3JjhfdRhfoXsuFdDZuxtTqrg2cxG0SC
         84WE363Tke5DHEoNpWuGVN7JLKqyeKw8qgah5c5AZIuP2L9VKTnB/BpfqWvW8rqtZpdB
         g2GBwFEyDqoYHWpEgQsDrFfr4vVZKM/F0haCapHJPRRNALucqeeWa10+sOu63mYuS7w5
         ur2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788902765; x=1789507565;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fo0YbEFL8wMrCYE2f1oBd51v/3oi28C2SOi3ZLEFoU0=;
        b=lAOTc4lJyPM4I6OCX5wZe3SFcuUuRgO+810+y00wYpoeTPEuuXo/8jVf4oIjLZDnmt
         fgq3pltKye0XPPmqOOy7xiLf2z25LdDSGnfSXFYFGSHdrkrtmNDm3JZaJHwhk+vJT4et
         qltIJqQKDn7qDag0WDF3KYo9yQN3dOfZdpu8m7dz/OaJ3MESB7I2ASoHAYSQOqDMTuuw
         ZjV5+MiOy4WYFLd/97xnABj19MzfgtfZd9SG1hkQWNmT0RQtTgrzPY9jKl74FA+vxF/9
         7eEg68uyZBacihWalKxushwYOfvGwSCW+DhHuZORMgRE9W5UNz90uYwGp5WFluiXoogp
         1brg==
X-Forwarded-Encrypted: i=1; AKwUvBxFFeHEKhdaEBWbHUkPP5RS+lgDhRzBHVqze9Ep/gwdrIZv65wrdwLFvgmuUf2eRENlUrUMTsVGCh00yw32grPx@lists.infradead.org
X-Gm-Message-State: AFuF++nYKFjmP+SZQCE2PfW/2UFjuRB7vDxiK3RApeEwLek+2jTgGY3G
	2h0dDxUSykT4Q4lXeRR55p/HSudTCe4tQbF7UppHGEqtS0aa5Y8jTR8e
X-Gm-Gg: AYBFou173kg2EoNKoZmgoVzIrDTWNd8jB3OkLxKRAeDE/h6NlFLhX/XkvwC/aR2eM2W
	5Z3m4QGRt8bEm9CqbSDMhdkMrBD10+38L/BopMM/TOAr+WM4a526kEp4DNt32J65sdsl467PJUS
	pmfwO2uhtX+Jmc8yw66iPWP+wd+Kxmf23xOFLiUIh42wKAWyPI4wDyLXemM+gGXFKyRSBVJI/tV
	E3GAJyE6Y0ouFxQfvLyy7Ad7PuiR+7Mr/+mxH72U9cPX9Z209S+IezPltRNdRy6PqfASOJWQTAQ
	Y1S9qWfuLG3YqZ4A+5SasspLBYLp7p/Rl0BmAeS3fCKsMYpnFW5eazbAyG9MeY2/dcVSn6PTJ7J
	LikvV1OTwKFs9b5OL/X51MH5EhLxZMgnhnZpq57kX+F4rbRut65u0mahWxYpIc5Danchf7LghvB
	P6RdiAyPoMoElwic+70JwxmXgW7lmfuECaQ9tIXYBwEy7oj3TA0UXgwgJXe/RnPL5b6z2JMqT5+
	EV3QCm3axXZ8udOd0ZbHRfvXw==
X-Received: by 2002:a05:600c:3495:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49cf8244bc5mr319923725e9.7.1788902765257;
        Tue, 08 Sep 2026 14:26:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm32433704f8f.13.2026.09.08.14.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:26:04 -0700 (PDT)
Date: Tue, 8 Sep 2026 22:26:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij
 <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>, Drew Fustini
 <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liviu Dudau
 <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement
 <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore
 <enelsonmoore@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo
 <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, "David
 Hildenbrand (Arm)" <david@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 01/13] ARM: remove sa1100 platform
Message-ID: <20260908222602.7b2aab1f@pumpkin>
In-Reply-To: <ccd58677-5e25-1f9f-2bb4-d1770fce8ac4@fluxnic.net>
References: <20260908152808.3928630-1-arnd@kernel.org>
	<20260908152808.3928630-2-arnd@kernel.org>
	<ccd58677-5e25-1f9f-2bb4-d1770fce8ac4@fluxnic.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_142607_410971_C26CD7B8 
X-CRM114-Status: GOOD (  18.48  )
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

On Tue, 8 Sep 2026 16:36:47 -0400 (EDT)
Nicolas Pitre <nico@fluxnic.net> wrote:

> On Tue, 8 Sep 2026, Arnd Bergmann wrote:
> 
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > Most sa1100 platforms were removed a few years, with the remaining
> > ones left as a starting point for a conversion to devicetree.
> > 
> > Nothing ever happened on that front, so remove the rest now,
> > including the sa1111 and locomo drivers that were once shared
> > with pxa but are already sa1100-exclusive now.  
> 
> The SA1100 was the starting point of my career. Feels strange how much 
> time has passed.
> 
> I parted with such hardware a long time ago in any case.

I failed to 'steal' a J-Slate when I left Tadpole.
(a very early 'tablet' computer with an LCD panel)
So I don't have one either.
Although that ran VxWorks and rtx-windows (after I patched bits so it worked!).

	David

