Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD9FC71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 21:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=RTsEhkkQkV87y+rXquaud1hFD/UmLEtzqTR/W3FIoCs=; b=MqcYtGnGyqLmRM
	mn9rl/2yeXEaNN21YmHwuzstVPRQyT7CMT8RkM72o/3Z94QTrZc880da685iid9cbO8R5P3jL4H2Y
	bFCj76kGZUtN8ESqMLMQeR/wYS95up0qJkslG6Mxr3z8O+RBg+GuBH9yXBP7XSesKu91e7A0qgTqJ
	05ewGuIwbUJ90fM25yORj5GNPptNcUY8eAnHrH/oCEHB4K/eWc2sRpRRzOE1V8BUcHfmFUDCxGSsa
	qcJe9lH4YEAVpRUxPplOYAWogiWb3vzLAAp/PDlCKj3wYi4rd6Qes499cwGkW4qFkVw/lX7DaW4gQ
	pyczJbiHNW1oH+DnmG9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQByR-000000007rq-3K5X;
	Fri, 13 Jun 2025 21:30:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBvc-000000007fm-4B9M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 21:27:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B66F5C56F4;
	Fri, 13 Jun 2025 21:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62DCC4CEE3;
	Fri, 13 Jun 2025 21:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749850030;
	bh=uao9vXicfmNGv7hAWWVlUXBcpeUEFrEd/9ktZYSF5ig=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nZbpXBjnZAtM27vBM686WDSlmCevbldUDcv0haHfTvmlSbLoJxSVxv9p7sUN/igzZ
	 DQK/ujQyUDtDXKo2+9/B+og9k8xaILfs7yj0Ci3wDQTJoB15fvuJM/ChAGShZ3sJS/
	 bufKhI9YRG+YCjlQBcTTG/xsYrSg2fEsxsIA3vHaqMgwXY8cAwIwDfocOYkk4kfsyJ
	 P4ztXwL4ANgDMym+oXwaG7Bg27bJtH+40UVzknDgw/qfvepHaMcja5TXadWM+ftgzY
	 JKVnZ/05xPQ/3S7h35bYqr18+mF84NOxMFMKg9d3gusw5T0wrId6QwXlt1I1+pXePB
	 G+ukl5JR60TBg==
Date: Fri, 13 Jun 2025 16:27:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
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
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v3 24/28] PCI: Add Microchip LAN9662 PCI Device ID
Message-ID: <20250613212709.GA979346@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-25-herve.codina@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_142713_120683_9D2ADBE3 
X-CRM114-Status: GOOD (  18.38  )
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

On Fri, Jun 13, 2025 at 03:48:04PM +0200, Herve Codina wrote:
> Existing code uses the 0x9660 value (LAN9662 PCI Device ID) in several
> places.
> 
> Avoid this direct use of the 0x9660 value replacing it by defined PCI
> Device ID.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/misc/lan966x_pci.c | 2 +-
>  drivers/pci/quirks.c       | 2 +-
>  include/linux/pci_ids.h    | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/lan966x_pci.c b/drivers/misc/lan966x_pci.c
> index b28066c96534..e60ab662b8f3 100644
> --- a/drivers/misc/lan966x_pci.c
> +++ b/drivers/misc/lan966x_pci.c
> @@ -197,7 +197,7 @@ static void lan966x_pci_remove(struct pci_dev *pdev)
>  }
>  
>  static struct pci_device_id lan966x_pci_ids[] = {
> -	{ PCI_DEVICE(PCI_VENDOR_ID_EFAR, 0x9660) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_EFAR, PCI_DEVICE_ID_EFAR_LAN9662) },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, lan966x_pci_ids);
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index d7f4ee634263..bde077ce663a 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -6302,7 +6302,7 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0xa76e, dpc_log_size);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5020, of_pci_make_dev_node);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5021, of_pci_make_dev_node);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_REDHAT, 0x0005, of_pci_make_dev_node);
> -DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, 0x9660, of_pci_make_dev_node);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, PCI_DEVICE_ID_EFAR_LAN9662, of_pci_make_dev_node);
>  
>  /*
>   * Devices known to require a longer delay before first config space access
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index e2d71b6fdd84..5d69fde7dd97 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -934,6 +934,7 @@
>  #define PCI_VENDOR_ID_EFAR		0x1055
>  #define PCI_DEVICE_ID_EFAR_SLC90E66_1	0x9130
>  #define PCI_DEVICE_ID_EFAR_SLC90E66_3	0x9463
> +#define PCI_DEVICE_ID_EFAR_LAN9662	0x9660
>  
>  #define PCI_VENDOR_ID_MOTOROLA		0x1057
>  #define PCI_DEVICE_ID_MOTOROLA_MPC105	0x0001
> -- 
> 2.49.0
> 

