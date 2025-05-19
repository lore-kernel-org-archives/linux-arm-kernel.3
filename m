Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE9FC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMIQ5j4O4hhkkXDBrtnUP9c1BM9Lw9LhW4rCV+JF4qo=; b=E/3b62YEplZ345XcrDqGTfT8FN
	B1NvL4OWemYqBb9YOjNRgTcO/vwPtPu6rV6cfRZSf3pMibX3vbjpV2qHrD9keHgqIjU3uSs6lv3TE
	PBkwU4EZYIeymxigW31eg0YMSgaUDq/2vMRjIyfZzB8kU0okTbfmt6Xr8yqliItPFfmJLbUA8pP6J
	zR/gvVMqZJ8aybmx6cb2COWRFsqEWdV1dWJ7KAO8xtcFl8RqQ/6FbYXOoysD6YObIJcVq6K+k3+1B
	PmAicepTK8eax1FF4+H5PailUkbPt9u33tzpgZM8gVdyJDTxT87Eo+cKdCMz1raHZhA8goSo0HcoX
	Dy1fpqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29W-00000009Xcy-2MMa;
	Mon, 19 May 2025 15:11:42 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1Sv-00000009RgJ-15d9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:27:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F23D14397E;
	Mon, 19 May 2025 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747664858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QMIQ5j4O4hhkkXDBrtnUP9c1BM9Lw9LhW4rCV+JF4qo=;
	b=KPDyy+L4/pZBa2cLkw0ZUcC/t8rYe1alekyOJHI2L357/ABWIW2l77vPCeqjLt6ZKftunk
	gc9U3l6270Yon2+sihKOQPrx1ucqucmm0w2hVe3oE+xzPMvnDzakmKrrioYOQIeCHJTrDV
	w19guANFSsFUeD26WaHkWPZUKztJoPMOj2HylC8EZxi7qDsNCG4zA9/f1fMDYMXfwWvn28
	1KyRQciYejW0VpyxKN5Hcs5cMXQWddLeUW0vN9Fi3V4gbfTrIcssDSaU5ip7653w8+a7JM
	bbqYCTx6pZP/NdQ4WhEdcO1tSehTzs6BHuCTO77ylHRy8J+eAwmJQ4WpkO4wDg==
Date: Mon, 19 May 2025 16:27:33 +0200
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
Subject: Re: [PATCH v2 06/26] driver core: fw_devlink: Introduce
 fw_devlink_set_device()
Message-ID: <20250519162733.2ef82127@bootlin.com>
In-Reply-To: <aBt2EHYf6j6Ulthb@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
	<20250507071315.394857-7-herve.codina@bootlin.com>
	<aBt2EHYf6j6Ulthb@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdduiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeguddprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_072741_427279_26B34852 
X-CRM114-Status: GOOD (  12.74  )
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

On Wed, 7 May 2025 18:02:40 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Wed, May 07, 2025 at 09:12:48AM +0200, Herve Codina wrote:
> > Setting fwnode->dev is specific to fw_devlink.
> > 
> > In order to avoid having a direct 'fwnode->dev = dev;' in several
> > place in the kernel, introduce fw_devlink_set_device() helper to perform
> > this operation.  
> 
> Makes sense, can you also mark that field as __private? So sparse can catch
> the abusers up.
> 

I didn't know about __private tag and related ACCESS_PRIVATE().
Indeed, It makes perfect sense.

I will add it in next iteration.

Thanks for pointing out.

Best regards,
Hervé

