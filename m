Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A67C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 11:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUZkMEvJv2/Nc54eZXgalM3L01O0l7yfmrIgB7KhrLk=; b=RqFV0vCyPlJ4970wGE1Zd1P2my
	LpAzm2L3cE3v+tJqpmiedx0W7iuNLe/L0m3iJd+n+6u6R6VoszOqDaBt7YO245PhkMx9TiaHhznai
	ahpbePw11Zs48mfQKEzyoNKdVK8REEfy4rv5Jm8UNcwtrv+tHuB8nR+OQhPEdMNX4IUSVPa35KDWd
	kfuWwRl1ygARvunKsPHenlliPnnoDCIkZZdZamSmJEvGq6Fh8n6IBMfJiEms25t+HwTtlnOJhWc2H
	bsKvnKPLgT62/TTAIEqLsym4ZwxivqTHVekHJsQQxTHSv+HNNoEstTwoOzCeVQn0lZYsuqhRKnPyC
	xALwRytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXTr-0000000AsNy-2DIA;
	Thu, 13 Feb 2025 11:34:07 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXM9-0000000Aq3T-1hzv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 11:26:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BB9B204A5;
	Thu, 13 Feb 2025 11:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739445966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rUZkMEvJv2/Nc54eZXgalM3L01O0l7yfmrIgB7KhrLk=;
	b=ClNjhBiU7bSJ2LVuVj3MhNmAjBfG5wdPHJR51Gst5UBx+tZo172PGsyFbW/ciciZ5Ih2te
	bePvC1qsSkNduxfr6W2DMo1Dt4H+HMBdal9tgCTfPZYTl2b58SxaQirU3X3n6M4xtEQCD+
	T+hsOlT+VbYJhcyn+1jF6QAkreHWn1IBAqbaTUQoclk1OT8TQEJppckzb5IrHgVzqrShBu
	Jn+PgHEuATNkPCv84wny9UR0TyAaZbYr+hQVZEpEti6Rj4Qb7z6XDU2tjEiwPZci7Oo52p
	alAUavb9fHcqfoqu0H/IITUwRgmvh4ftAnpzdYt83jle9DuCOCTbgP0pgl2VJQ==
Date: Thu, 13 Feb 2025 12:26:05 +0100
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
Message-ID: <202502131126057bac6f7a@mail.local>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120102117538ef59b@mail.local>
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z6uCCeG2d395ZGDS@bogus>
 <20250212063532.GB15796@localhost.localdomain>
 <Z6x7TBSjBFBxGo77@bogus>
 <20250212170147ee6863dc@mail.local>
 <20250213033033.GA21937@localhost.localdomain>
 <20250213082032315c4327@mail.local>
 <20250213105257.GA29804@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213105257.GA29804@localhost.localdomain>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehpvghnghdrfhgrnhesohhsshdrnhigphdrtghomhdprhgtphhtthhopehsuhguvggvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopehpvghnghdrf
 hgrnhesnhigphdrtghomhdprhgtphhtthhopegtrhhishhtihgrnhdrmhgrrhhushhsihesrghrmhdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_032610_049225_FCE85816 
X-CRM114-Status: GOOD (  29.70  )
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

On 13/02/2025 18:52:57+0800, Peng Fan wrote:
> On Thu, Feb 13, 2025 at 09:20:32AM +0100, Alexandre Belloni wrote:
> >On 13/02/2025 11:30:33+0800, Peng Fan wrote:
> >> >> IIUC on any pure DT based system, a device node exists per RTC and hence
> >> >> platform device associated with it. And the RTC devices are created with
> >> >> parent pointing to unique platform device.
> >> >> 
> >> >> > However i.MX SCMI BBM exports two RTCs(id: 0, id: 1), so to make it work for
> >> >> > current RTC framework, we could only pick one RTC and pass the id to BBM
> >> >> > server side.
> >> >> >
> >> >> > I am not sure whether Alexandre wanna me to update the code following each
> >> >> > parent could only support one RTC or else.
> >> >> >
> >> >
> >> >I want you to keep your changes local to your driver. I already stated
> >> >back in 2018 that you were on your own with the imx-sc driver and that I
> >> >don't like seeing multiple abstractions for existing RTCs. What is the
> >> >actual use case behind needing to access both RTCs using Linux?
> >> >Shouldn't this be handled on your firmware side?
> >> 
> >> The firmware exports two RTCs, RTC0 could be handled by Linux, RTC1
> >> could only be read by Linux and configuable by M7 per current i.MX95 EVK
> >> firmware.
> >
> >This doesn't answer the main question, why is this useful? Where is the
> >time of RTC1 coming from and why would linux set a different time on
> >RTC0 ? Can't the firwmare just set the same time on both RTC0 and RTC1?
> 
> To current i.MX95 EVK SCMI firmware, RTC0 is SoC internal RTC, RTC1 is
> board level RTC which is more acurrate.
> 
> There are safety island in i.MX95, M7 safety core is assigned owner of
> RTC1. Linux non-safety is assigned owner of RTC0, but Linux could read RTC1
> time, Linux not able to set alarm of RTC1.
> 
> I need ask firmware developer to see whether RTC1 time could be synced to
> RTC0 from firmware level. But considering RTC1 is more accurate, should we
> use RTC1?
> 
> The current firmware design is RTC0 is always there and exported, because
> it is SoC internal RTC. RTC1 is board level one, it could be optional per
> board design and firmware design.
> 
> The firmware could update to only export RTC1 if no safety need it,
> but this needs big change to the firmware BBM part, I need check with
> firmware developer. But things may not change.
> 
> >What would someone do if RTC0 and RTC1 don't agree on the time?
> 
> RTC1 is more accurate if it is there.
> 

Well, yes, you have your answer here, if the firmware knows RTC1 is more
accurate and will be your source of truth, then simply use this one.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

