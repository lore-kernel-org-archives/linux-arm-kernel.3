Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF81DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 22:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/tH7Qf4HiNAqkjCWoI2VqVcIzT/s6u7QtlekUOnckE=; b=p+omvYqVlhFuVNUjJfYORJcAyN
	F7Z8ZJ7FOQkMRb4Om0Ktak2o7fKX3LntEmbqINVJcfhFzZJHh823fcj/rcFg9TpoC8JAz4O7wtAvm
	VYn0SL59unMxWcPUeeuCGyXLdnP1zcBbKqbkUVshhfPyttI8/0gHwzHSgLHVyFlLjLoJ2QTzqqnjk
	9OjDhEihmDcRzqcEw3AkI1qxhV0aBoblGjCWFu5RMSN9FiWLZgcxENnMvLvmekPSHriCo4fgkfV+m
	+pw07Ips+UGuftSdRZ8mMDNo8Oak+5U/K1CD9DjRMhXHtZjvlBT1J3xGyBPW0xe+BB8hTuAY31gOr
	mNXLw2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbjr-0000000AqyP-2Uyo;
	Mon, 12 May 2025 22:35:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbho-0000000AqkU-1tlp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 22:33:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8010452CE;
	Mon, 12 May 2025 22:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80E1C4CEE7;
	Mon, 12 May 2025 22:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747089183;
	bh=7uaPkVruATXm9Huody3+3MZx6tE8WbKbRuYqnjKm0pI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLZ1KgzQOJhVUAg9HL/gG+/R//L7FAoO/kB/yvK5yZYA02+YkydJW15gu7HC4e1/l
	 TwDqKmCGX8QJ1BMBsPkhEMfaHO0CeBjM16ODGskLNGUuuwssFGg9Zg2pN2cZMZhkxz
	 yZftrJotY5E5fl3AFwbv/ZA0XqmSjhZUZ3j4L05gEo4q0Gd71DcA7BPV0j+n88AqC/
	 /lXlbS0VrgwPwF4yyi7g4nUmRvIHmlMf4NUEQUPT6Bwunk1fLQ09V4q/NQG5V8APL6
	 zyyz1I7mHgeS9gkiYzuw+Zlc0XZcHmMtcT8e3ZxeSTWAKYT4a64llabhgqhbPyg1lX
	 Ent9sEQe4ZTww==
Date: Tue, 13 May 2025 00:32:59 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Peter Rosin <peda@axentia.se>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Wolfram Sang <wsa@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 19/26] i2c: busses: at91: Add MCHP_LAN966X_PCI
 dependency
Message-ID: <t362y4tvg3y2q5yop3vnqme3qi6wxxehpbyzbx6qp7zbrihqkr@5bvsxvd2ti7i>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-20-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-20-herve.codina@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_153304_508143_A0F84958 
X-CRM114-Status: GOOD (  11.10  )
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

Hi Herve,

On Wed, May 07, 2025 at 09:13:01AM +0200, Herve Codina wrote:
> The AT91 I2C driver depends on ARCH_AT91.
> 
> This I2C controller can be used by the LAN966x PCI device and so
> it needs to be available when the LAN966x PCI device is enabled.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

