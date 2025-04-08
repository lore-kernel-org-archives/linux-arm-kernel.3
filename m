Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AEFC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MT039/hhuMMp5IO2JcEWxMC4o3y8QemyuoMvfE2SUFc=; b=ncNzJ40KUoXEi0J1eWQzaD0Hoa
	4pmCAaqoNqrII0Qw5PrhMG7VwlS/v4l+oHVIoWAPZzpT/CGSttGbVE7Z5tskFdYYlyrR/UEBaPrqe
	1dBEcIWJZGHmmXv1S3XfsMMOhH/b6et+VhrIot5b8dZ4Vexw25P2j1p761fKdY7zwvE8CrPPQMVMT
	51FW63p5NmxbOooiGmot0DbhiLoLH9w4lX1jAx1fjKtGfzFOngph4W/HZkEK6sdFWpa6vfwlN+cyn
	Gm5kjPq95G1YF3MDjMjQVr/zrOeFktuzSMz2pbE0CIrWoPbFCHn4PwLm/YSEBN/QveVtOIdmMMsLu
	ROp7gWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29Fp-00000004Fdn-2ITR;
	Tue, 08 Apr 2025 13:44:41 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28h3-000000045AO-0PU4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 13:08:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B982944326;
	Tue,  8 Apr 2025 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744117721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MT039/hhuMMp5IO2JcEWxMC4o3y8QemyuoMvfE2SUFc=;
	b=CoGtiJjrd6pJSrynxk4Ww042keQh9u8acYoWopM/7RJrx9UjShh6+u7Qo3SEoi01uF1T+3
	7JYdjRmu+B/pSRo5pKCLoCR+Wnw9v1QhZDuWoasw9JAzB1/hEkC6kEYTs1u6jXCFCSypsd
	8EYWRBvHIoQB0sde8vSCwIyu2OYFXap+fsygdNhAOjLPHZ+ljCPsdEa9Tb3Zh19j7+9RMU
	5Bg5gS0f5LoXYD55neip1umz/F8gxUf2aVGhUaz63FSOKcaLxWUsac7ZoMUZgsTu5lm97u
	tV9Df778F4P+kiMOoJZJ/CJRrnkEnStg22TSuJc7wvqBsbmT23vNx5hI6wdulA==
Date: Tue, 8 Apr 2025 15:08:36 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
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
Subject: Re: [PATCH 08/16] i2c: core: Introduce i2c_get_adapter_supplier()
Message-ID: <20250408150836.327a337d@bootlin.com>
In-Reply-To: <Z_Puy8eEBc6tubEx@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
	<20250407145546.270683-9-herve.codina@bootlin.com>
	<Z_Puy8eEBc6tubEx@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegtddprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_060845_282669_77D8BC75 
X-CRM114-Status: GOOD (  26.39  )
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

On Mon, 7 Apr 2025 18:27:07 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Apr 07, 2025 at 04:55:37PM +0200, Herve Codina wrote:
> > The supplier device of an I2C adapter is the device that calls
> > i2c_add_adapter() or variants and i2c_del_adapter().
> > 
> > Most of the time this supplier device is the parent of the adapter dev.
> > 
> > Exceptions exist with i2c muxes. Indeed, in case of i2c muxes, the
> > parent of the adapter dev points to the adapter dev the mux is connected  
> 
> dev --> device (in both cases)

Will be updated in the newt iteration.

> 
> > to instead of the supplier of this adapter.
> > 
> > Introduce i2c_get_adapter_supplier() and a new supplier field in the
> > adapter structure in order to ease the adapter supplier retrieval.  
> 
> ...
> 
> > +/**
> > + * i2c_get_adapter_supplier() - Get the supplier of an adapter
> > + * @adapter: the adapter to get the supplier from
> > + *
> > + * return:  
> 
> Return:

Will be updated.

> 
> > + * Look up and return the &struct device corresponding to the device supplying
> > + * this adapter.  
> 
> @adapter

Will be updated.

> 
> > + * The user must call put_device() once done with the supplier returned.
> > + */
> > +struct device *i2c_get_adapter_supplier(struct i2c_adapter *adapter)
> > +{
> > +	return get_device(adapter->supplier ?: adapter->dev.parent);  
> 
> What will be the meaning when both are set? Why dev.parent is not the same
> as supplier in this case?  Looking at the commit message example, it seems
> like you want to provide a physdev or sysdev (as term supplier seems more
> devlink:ish), like it's done elsewhere. And in the same way _always_ initialise
> it. In such a case, the ambiguity will be gone.

When both are set (this is case for i2c muxes), the adapter->supplier the
device that register the I2C adapter using i2c_add_adapter() or variant.
In other word, the device that creates the I2C adapter.

The adapter->dev.parent is most of the time the device that register the
I2C adapter except for i2c muxes. For I2C muxes, this adapter->dev.parent
is the adapter the i2c mux is connected to.

Between physdev and sysdev, I really prefer physdev and, if renaming from
supplier to physdev is still needed (and wanted), I will rename it. Let me
know.

For initialization, I don't want to modify all the I2C controller drivers.
What I can do is to initialize adapter->supplier using adapter->dev.parent
during the i2c_register_adapter() call if it was not already initialize by
the caller (i.e. the I2C controller driver).

Does it make sense ?

Best regards,
Hervé

