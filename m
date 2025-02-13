Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A97C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 12:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBQYwQdRIQ20yozFfxJGyrrPezD83gPdJ94AG2odwmc=; b=Pnz91dvBtbK5h4tc3nXM0X5u9I
	rjZ6sFNvVoDuC/ilAtLd8vmxNTW0X5pEsnEJTHU5T8M3Na7l8ZSu2NamqB55qrAZX2S3OwcZhUqU0
	oVAL07A+yMYFluxugKIixqpGYpwGj/9axv081BtBK65hvaw+zYAkOgfIVS5wCQD+DeXWb5IO8vrEU
	wRSxNFw3IqlkhIjCrU2ivZYE8cRUPNgdkmuSnupb+fgV3oIXw9hQ3Xj1x+CDJLX1gt8xaQ2z/i9Ky
	1Z4TdFkVmiLb48wcvzF4V9EgrRP9D75ZLjTS2GCUyK0M20+ym6zZJGtLIVwAwR6bDa4sRa0LiY3Gb
	fXmCqNeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYmk-0000000B4CH-2VTS;
	Thu, 13 Feb 2025 12:57:42 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYjw-0000000B3mL-0Nke
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 12:54:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8076F44191;
	Thu, 13 Feb 2025 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739451284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YBQYwQdRIQ20yozFfxJGyrrPezD83gPdJ94AG2odwmc=;
	b=FfC9PGeZopcSlMED939jJp01G7c43ji4lIsjeMGMdWf9BzbCs1A2yB+5sz31xizjVHXutY
	Qa7paCmQ3QlxzcBuYBE4JR9K5Tr7X3wI4bNjZUMkzkZ8xDcahMb9pyduRn+mKtI65+ymL+
	OYM3VkmT3wf2h0DQVsHYBCqJ3yP54S+LG5x3z2SdZkLJmGQJp1dSfPruDnEMdcWutO7GgZ
	KUL9T+OD6FgcieBuI9taJNS72yKDVGCkI8J68dBphVqPAdqHnh0CMIqAsRtarlFa5WO8gQ
	RMT6L7BMK0fvIZHxAbmh+D6RBt4sE5Z2CegRx6RzC1xmOvw0As4m3Ld4EZBsTg==
Date: Thu, 13 Feb 2025 13:54:42 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
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
Message-ID: <2025021312544202e175b4@mail.local>
References: <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z6uCCeG2d395ZGDS@bogus>
 <20250212063532.GB15796@localhost.localdomain>
 <Z6x7TBSjBFBxGo77@bogus>
 <20250212170147ee6863dc@mail.local>
 <20250213033033.GA21937@localhost.localdomain>
 <20250213082032315c4327@mail.local>
 <20250213105257.GA29804@localhost.localdomain>
 <202502131126057bac6f7a@mail.local>
 <20250213133550.GA1208@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213133550.GA1208@localhost.localdomain>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehpvghnghdrfhgrnhesohhsshdrnhigphdrtghomhdprhgtphhtthhopehsuhguvggvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopehpvghnghdrf
 hgrnhesnhigphdrtghomhdprhgtphhtthhopegtrhhishhtihgrnhdrmhgrrhhushhsihesrghrmhdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_045448_593045_ABA31397 
X-CRM114-Status: GOOD (  13.02  )
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

On 13/02/2025 21:35:50+0800, Peng Fan wrote:
> >Well, yes, you have your answer here, if the firmware knows RTC1 is more
> >accurate and will be your source of truth, then simply use this one.
> 
> But issue is RTC1 is only readable to Linux non-safety, Linux not able
> to set alarm. Linux could only use RTC0 for alarm with current i.MX95 EVK
> firmware.
> 
> If RTC1 could be exported to linux for control, we could for sure
> switch to using RTC1 without caring about RTC0. But this is not true.
> 
> RTC0 is free for linux to control, RTC1 not. Switching to RTC1 will make
> us lose RTC alarm to wake up linux feature.
> 

This doesn't make any sense, this limitation is on your firmware side,
either RTC1 has alarm support and the firmware can set the alarm for
linux or it doesn't and then, the firmware must set the time and alarm
on RTC0.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

