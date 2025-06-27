Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF188C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4f/vHcRVZ3+4F8jGL4/itlgmH6zYwv+ow/NqC1RSEQ=; b=NZR/DZgY6NNeOdCuZAH746tfh9
	ZApStMhdbZH8RFWJe1MDkTlmkPxYCmwwcYYDo8gWwa4eYVpBeSqMnIQbhRkxMfcMUqlGg6JH+5b/v
	m2xWY/nU4Ti/QbAeCd3gp4dljaEJ4HsDs/Vz97UeQF9KoUx4RAOaNgf+AWgSzXOoBr6gQLWp1MU1R
	p7XrAUSIzGz/lM6HeixaFV3rtTLgbeOxCvcF7UuuYKERB9G7C6S3CnNccpVhOZrX7hueOh0N3jV6t
	iVVHkVlatbDx3jS6Zh1asYZxmT8VqGJMXg1XxA4FwWFWhSaadAF8WF7x3MoG6Zj0QAsfHq0XU6kgW
	6pdvmRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCq5-0000000FPPu-3F3z;
	Fri, 27 Jun 2025 17:26:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBqh-0000000FFHL-14af
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 16:22:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E6B261433;
	Fri, 27 Jun 2025 16:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3C2C4CEE3;
	Fri, 27 Jun 2025 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751041366;
	bh=S4rQXSxYy7l30Jex5dOyQNVkfrqjgNBFJChd03NJJd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9+kRI24E/sv8i/YQJ0N921DtCB+0kcRk3H1pQUMNQtT02K02PjfsySme4B8GniwI
	 9dRRJgnIYjYIcYjcs5Tb6obHmqh8Twkaf0TCIOBrTfj53TmQdFrvAxOP+wruzM3Ril
	 JCTW0cM7wsH4IW+Zw3XsSKRN7zxXgWdw8fzZVfaBSHnAOFcYr4+qCebHHiZca51pkr
	 3BUYtnmUuDrHiFYPlicYhuFNogDvoLoyaU3CKheMqkHeHJarNuPc7Ks6Whuzf7UE8A
	 TZW+lJ9Gtdsw5sd9/k4NKCLKh0F893QUDS6oOqMbIefzWUsXHa7lfFZkbD8l+/snV+
	 iZPTmjg/hmAvQ==
Date: Fri, 27 Jun 2025 11:22:45 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 18/28] of: property: Allow fw_devlink device-tree on
 x86 when PCI device-tree node creation is enabled
Message-ID: <20250627162245.GA3513535-robh@kernel.org>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-19-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-19-herve.codina@bootlin.com>
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

On Fri, Jun 13, 2025 at 03:47:58PM +0200, Herve Codina wrote:
> PCI drivers can use a device-tree overlay to describe the hardware
> available on the PCI board. This is the case, for instance, of the
> LAN966x PCI device driver.
> 
> Adding some more nodes in the device-tree overlay adds some more
> consumer/supplier relationship between devices instantiated from this
> overlay.
> 
> Those fw_node consumer/supplier relationships are handled by fw_devlink
> and are created based on the device-tree parsing done by the
> of_fwnode_add_links() function.
> 
> Those consumer/supplier links are needed in order to ensure a correct PM
> runtime management and a correct removal order between devices.
> 
> For instance, without those links a supplier can be removed before its
> consumers is removed leading to all kind of issue if this consumer still
> want the use the already removed supplier.
> 
> The support for the usage of an overlay from a PCI driver has been added
> on x86 systems in commit 1f340724419ed ("PCI: of: Create device tree PCI
> host bridge node").
> 
> In the past, support for fw_devlink on x86 had been tried but this
> support has been removed in commit 4a48b66b3f52 ("of: property: Disable
> fw_devlink DT support for X86"). Indeed, this support was breaking some
> x86 systems such as OLPC system and the regression was reported in [0].
> 
> Instead of disabling this support for all x86 system, a first approach
> would be to use a finer grain and disable this support only for the
> possible problematic subset of x86 systems (at least OLPC and CE4100).
> 
> This first approach could still leads to issues. Indeed, the list of
> possible problematic system and the way to identify them using Kconfig
> symbols is not well defined and so some system can be missed leading to
> kernel regressions on those missing systems.
> 
> Use an other way and enable the support on x86 system only when this
> support is needed by some specific feature. The usage of a device-tree
> overlay by a PCI driver and thus the creation of PCI device-tree nodes
> is a feature that needs it.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Link: https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/ [0]
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/of/property.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index c1feb631e383..8b5cfee696e2 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1605,7 +1605,7 @@ static int of_fwnode_add_links(struct fwnode_handle *fwnode)
>  	const struct property *p;
>  	struct device_node *con_np = to_of_node(fwnode);
>  
> -	if (IS_ENABLED(CONFIG_X86))
> +	if (IS_ENABLED(CONFIG_X86) && !IS_ENABLED(CONFIG_PCI_DYNAMIC_OF_NODES))

I really want CONFIG_PCI_DYNAMIC_OF_NODES to go away at some point, not 
add more users. 

I think this should instead check for specific platforms not with 
kconfig symbols but DT properties. For ce4100, you can just check the 
root compatible string. For OLPC, there isn't a root compatible (in the 
DT I have). You could check for /architecture == OLPC instead. There's 
some virtualization guests using DT now too. I would think their DT's 
are simple enough to avoid any fw_devlink issues. 

Alternatively, we could perhaps make x86 fw_devlink default off and then 
enable it only when you create nodes. Maybe it has to be restricted a 
sub tree of the DT to avoid any later interactions if devices are 
unbound and rebound. Not a fully fleshed out idea...

Rob

