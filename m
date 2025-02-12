Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CCAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIDxvtWqr76y3j2xTfmMPHMycoVkae0xjT2IX/8T/vg=; b=I1vmjVXL+fccsfzh0QohYdD4GJ
	XOwXmA9KAQVrSf/paFXKIB5tdRaECPbxHvJnZoRifhe3D/3iElQlBfXLcg1qu+j2iuZLL1l5HiedO
	SJZRKF7UJm9OrCJTFeTzQ2CSh8F2p5ckZsKJbTa2FFOAiq1uApdHypFAjfDDWEIGiUMyFjjJWlo0Z
	oBFeuONnNeKngpfF3wIGjhNVgbAly7dv5TnMK4j7elbEsA88/NRGXkHn2iM6b3/EBKxyUU99CDrk+
	xrfi+k5cHB9z5BSo6xBk/G78GrXGGG93EnGG7WNZLliRJrwLHDXo12mpT8w7NulNOznTCe9eumHh0
	wlx91Zug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGKG-00000008H4e-0vhJ;
	Wed, 12 Feb 2025 17:15:04 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiG7X-00000008Ckw-0mge
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:01:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E03B344288;
	Wed, 12 Feb 2025 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739379708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tIDxvtWqr76y3j2xTfmMPHMycoVkae0xjT2IX/8T/vg=;
	b=nkvwUDIqCe5vB1DWqOwWLRbo3G8bL56ZprANHyRUp5ixVPfrcZDZKNSDVsnm30aWHbQ7uB
	9B0ccFJj5lVDXxVwVjujlSkasHJoCDbOGwcGx+xA+H+537/jhg6I1RyZPtvei+cSdUxZdh
	gUCehJBOYUxyQYAZ6HmWDKSel+pcwdK0q3maBtTnsuirFim4qt7mM8qVYOtElUN4QAAQ3C
	emWcl0uAYO6RDmKcqM9v3ScmmJJrsmAETCEisnh6JvZbsp6PAJvBRBJc87VNaN3YOXwnSL
	OO733W4m3sMViJX2HBMUEw1sy0F8jX+wPpN/Eed4oKwyexv+PmjWzqTnYIapIQ==
Date: Wed, 12 Feb 2025 18:01:47 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 0/4] rtc/scmi: Support multiple RTCs
Message-ID: <20250212170147ee6863dc@mail.local>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120102117538ef59b@mail.local>
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z6uCCeG2d395ZGDS@bogus>
 <20250212063532.GB15796@localhost.localdomain>
 <Z6x7TBSjBFBxGo77@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6x7TBSjBFBxGo77@bogus>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggeegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehsuhguvggvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopehpvghnghdrfhgrnhesohhsshdrnhigphdrtghomhdprhgtphhtthhopehpvghnghdrf
 hgrnhesnhigphdrtghomhdprhgtphhtthhopegtrhhishhtihgrnhdrmhgrrhhushhsihesrghrmhdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_090155_385188_F55424AF 
X-CRM114-Status: GOOD (  27.26  )
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

On 12/02/2025 10:43:24+0000, Sudeep Holla wrote:
> On Wed, Feb 12, 2025 at 02:35:32PM +0800, Peng Fan wrote:
> > On Tue, Feb 11, 2025 at 04:59:53PM +0000, Sudeep Holla wrote:
> > >On Tue, Jan 21, 2025 at 02:31:55PM +0000, Peng Fan wrote:
> > >> 
> > >> It is the i.MX SCMI Protocol exports two RTCs using one protocol.
> > >> 
> > >> Two RTC devices are created, but share one parent device.
> > >> 
> > >> Do you mean each RTC device should have a unique parent device?
> > >>
> > >
> > >Can you point where is this check for unique parent ? I am not so familiar
> > >with RTC but I couldn't find myself with quick search.
> > 
> > The RTC ops takes the rtc parent as input parameter
> > https://elixir.bootlin.com/linux/v6.13.2/source/drivers/rtc/interface.c#L94
> > "err = rtc->ops->read_time(rtc->dev.parent, tm);"
> > 
> > So in the rtc device driver, there is no way to know which rtc it is just
> > from the parent device.
> >
> 
> If that is the expectation, you could create a platform or normal device
> per instance of RTC on your platform and slap them as parent device.

This would seem like the proper solution, why not using an MFD or
auxiliary bus ?

> 
> IIUC on any pure DT based system, a device node exists per RTC and hence
> platform device associated with it. And the RTC devices are created with
> parent pointing to unique platform device.
> 
> > However i.MX SCMI BBM exports two RTCs(id: 0, id: 1), so to make it work for
> > current RTC framework, we could only pick one RTC and pass the id to BBM
> > server side.
> >
> > I am not sure whether Alexandre wanna me to update the code following each
> > parent could only support one RTC or else.
> >

I want you to keep your changes local to your driver. I already stated
back in 2018 that you were on your own with the imx-sc driver and that I
don't like seeing multiple abstractions for existing RTCs. What is the
actual use case behind needing to access both RTCs using Linux?
Shouldn't this be handled on your firmware side?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

