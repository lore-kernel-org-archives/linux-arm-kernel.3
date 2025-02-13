Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DBAC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9e8PtI2UeyluQx0sxUhBSF+kEkrKX+GNL5KqQq+l8c=; b=uJWLLDEZzR4Uhin/p1/61aFNA4
	mUqz5fiCHQoJEfd91ZAUcZBCLXcfQ5o54d7PnDdqQo1IGaPVyEe+zYyast4z5QjRQq234r9LcpW7l
	fDuMoIiZYndsZwjFmEWcaYVQOU1NRygC+AsuU1FZChr5tFF2MelU3bjqA9mRJ/aCJ91nDnoTZd6rk
	tby5EMGAoydCxysL8UiwHpLFOYjJSrERBDiI2U4WeARGomfCkZAU3bLHqmeZfDeOl9GmMHJ+RjYxp
	HHuDXj4M7h5lmy8kwQEzhofIAVQOf9JhxmBjpU9kQl5dJxG6D39R+lx+FI+1yr+kxatearM/9pVG4
	gNcdU8zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUeI-0000000AHpQ-2d8L;
	Thu, 13 Feb 2025 08:32:42 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUSa-0000000AFm4-0GvH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 08:20:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6B09204A9;
	Thu, 13 Feb 2025 08:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739434833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9e8PtI2UeyluQx0sxUhBSF+kEkrKX+GNL5KqQq+l8c=;
	b=Yufct0LQU+4cKHaoTyLiUTo1UYDqedce2F1RZjsE648kRr8ako6nYTTGsErPgBvKJp4ohF
	idOZ+N27ri6jmN1Bgk853QTxw7ueooqKIadPFvYTPXURiX6ir43bKErg5yyF+BqSTHPW9V
	5xUsMMDDqiLUC8QRXH2sUxn5N/VGq6szX+nachAT1VzKmxuNv2qy7axNCQHJkgD7yzYx7s
	o/NO/TbmRgSmKxFBLijw+fn8A3BumM5ltir7aUdR/xzNfluMrG36HTTIXWv4+n2n0jntaL
	paxF4LfpwNj3xL7NC2YfcZ3hN8kRYOgiit98zN29UFr7EUXY41R3VkgpGgJBMA==
Date: Thu, 13 Feb 2025 09:20:32 +0100
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
Message-ID: <20250213082032315c4327@mail.local>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120102117538ef59b@mail.local>
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z6uCCeG2d395ZGDS@bogus>
 <20250212063532.GB15796@localhost.localdomain>
 <Z6x7TBSjBFBxGo77@bogus>
 <20250212170147ee6863dc@mail.local>
 <20250213033033.GA21937@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213033033.GA21937@localhost.localdomain>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegiedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehpvghnghdrfhgrnhesohhsshdrnhigphdrtghomhdprhgtphhtthhopehsuhguvggvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopehpvghnghdrf
 hgrnhesnhigphdrtghomhdprhgtphhtthhopegtrhhishhtihgrnhdrmhgrrhhushhsihesrghrmhdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_002036_584083_CD013776 
X-CRM114-Status: GOOD (  18.54  )
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

On 13/02/2025 11:30:33+0800, Peng Fan wrote:
> >> IIUC on any pure DT based system, a device node exists per RTC and hence
> >> platform device associated with it. And the RTC devices are created with
> >> parent pointing to unique platform device.
> >> 
> >> > However i.MX SCMI BBM exports two RTCs(id: 0, id: 1), so to make it work for
> >> > current RTC framework, we could only pick one RTC and pass the id to BBM
> >> > server side.
> >> >
> >> > I am not sure whether Alexandre wanna me to update the code following each
> >> > parent could only support one RTC or else.
> >> >
> >
> >I want you to keep your changes local to your driver. I already stated
> >back in 2018 that you were on your own with the imx-sc driver and that I
> >don't like seeing multiple abstractions for existing RTCs. What is the
> >actual use case behind needing to access both RTCs using Linux?
> >Shouldn't this be handled on your firmware side?
> 
> The firmware exports two RTCs, RTC0 could be handled by Linux, RTC1
> could only be read by Linux and configuable by M7 per current i.MX95 EVK
> firmware.

This doesn't answer the main question, why is this useful? Where is the
time of RTC1 coming from and why would linux set a different time on
RTC0 ? Can't the firwmare just set the same time on both RTC0 and RTC1?
What would someone do if RTC0 and RTC1 don't agree on the time?

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

