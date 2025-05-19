Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F146C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 11:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81nL3/GhkQ2VjUOe+1pO+ZBtDt54R0erupT3wBOarVI=; b=IyR/Y84q8dLwvN135Rpqb84YRG
	u2bfDW/BRbPai0z29TgmHIoRkgCOHlGp9fRlO5DBRERQPxZG6PVhoHQQ21SQckKI/kHCZCyZsmsWW
	YYA0EtK/7XqfoJm+ybp9+ReElNSezy/8PkdWznCGgufs4se5H9daJPQmHkLQ28TtldehrQ3iuNoYl
	0aaDjYqIluwGv/HvC/isBlabu6juyVx5la4EdKyUxjYZteSZANG2UPdhFyJlq0W/AFQ8L6+V4szNW
	P/VOQp55c9biAk7RuxJNfm8j/WUGLz3MD38DVhD7vqExK9NRUvla+R6gQacH+12nAwAI3cRTYvIBS
	KNAgpr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGys0-000000092AJ-0oKl;
	Mon, 19 May 2025 11:41:24 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGymW-000000090r3-0YKA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 11:35:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87DEC43A0B;
	Mon, 19 May 2025 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747654527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81nL3/GhkQ2VjUOe+1pO+ZBtDt54R0erupT3wBOarVI=;
	b=StjPzBotRjmZ4tnUHmQoqCmpf+mchssIgwwekn96rt1gfXBps2XWX7jLEZAhJe4G9sVKqv
	t6dbwwTxJQEQBRizkflnOEQ8fY20CF6dugtMThMZyT9BLTOXR906FTXrOhwTeD7o9LHG2W
	DeyxuJBEDBhEEOK37c8ykjfjoE8X5mI4wOUa+DCUfmlFzBMUIgJKFpRcdUWxi1k356vUSX
	YsJdZmSF+EWVG/OYIn7c8cLUX/s9oBWV8FbtM1QSTJ/cJvwkRRBRophSkMp0kTrFsEVMoX
	V0tBDlm/n8mpuJ37edJqKi3vLAbvNmdUE5+t+cba0AlWo3W1HaVw7M0xJYtMog==
Date: Mon, 19 May 2025 13:35:22 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark
 Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, Daniel Scally
 <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 04/26] driver core: Avoid warning when removing a
 device while its supplier is unbinding
Message-ID: <20250519133522.63acf5e5@bootlin.com>
In-Reply-To: <aBt5FvZ95S1Y_Mba@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
	<20250507071315.394857-5-herve.codina@bootlin.com>
	<aBt5FvZ95S1Y_Mba@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdduvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_043544_777074_F0F1028D 
X-CRM114-Status: GOOD (  10.93  )
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

Hi Andy,

On Wed, 7 May 2025 18:15:34 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

...

> 
> >  		if (link->supplier->links.status == DL_DEV_DRIVER_BOUND) {
> >  			WRITE_ONCE(link->status, DL_STATE_AVAILABLE);
> >  		} else {
> > -			WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY));
> > +			if (link->supplier->links.status != DL_DEV_UNBINDING)
> > +				WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY));  
> 
> Why not
> 
> 			WARN_ON(link->supplier->links.status != DL_DEV_UNBINDING &&
> 			        !(link->flags & DL_FLAG_SYNC_STATE_ONLY));

Indeed, I will update in that way in the next iteration.

> 
> >  			WRITE_ONCE(link->status, DL_STATE_DORMANT);
> >  		}  
> 

Best regards,
Hervé

