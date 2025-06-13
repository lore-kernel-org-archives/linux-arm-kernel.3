Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED675C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nrbs5uSY5Dm+NFLiFo1N3a9/UV+24MsYnTxxTvcJ3Ss=; b=LoYtAg1GuqgT+L92m+QPHC1kn0
	pRj1Q8RKXgfYXielVkexwa8Zs4pVwW8z7ZWgaSxy/cWZvY41Fsb43NMIVN/J5CVHOJT2FOntEq0XD
	d7cdw26IzM/gqMyu6+mjqzbSfl8+21DSp5/dcczlSRi2DDHk2zoVvjXwidnGPz/bgvWSAqrOvnFqN
	hB6u86+TQXRvlPyzZJ0GGrzNLdeZrJh+/sm93bZy4ieESzmJbKUFGc9dcpPt8G3O8s+GbHIFSjuMP
	mLXaEiY4rm4Ea08nYbh1PWKTwDuwSjFE+QRPxX3uEzyVi9XZmRpwUt/e3K/NJHyfBHYo4x2P/9mC3
	nlI+mPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5xY-0000000Goa5-2xWJ;
	Fri, 13 Jun 2025 15:04:48 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4mt-0000000GZ0J-3hs5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 13:49:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 3C9EB42E77;
	Fri, 13 Jun 2025 13:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749822582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nrbs5uSY5Dm+NFLiFo1N3a9/UV+24MsYnTxxTvcJ3Ss=;
	b=KQF4JSbYd5Q2TcnyFu+OqsJEeoMAWwCvH1A66lYc+gqGfZRLfoBEvZCENia/cwTxUS7pkN
	ZtHsbBYNsvOMqZy7ek9MyxKklRXl3aC4yh2OYXvyxgKEu1/dn2QL5ZwmzqubQBPu5iWFcA
	6QRKRp7q+TOLZvS6XVcSiInJz0ZcDN3Ch/N4n/gspTKjcVpC+/o1fGYljm6qdxvAd1gkFc
	r2lpbxe1Mv7n8sGn24us+ikO1wKF9ZVNTdO8ef9HdWF2O5rBbqXuyX2x3CAOw/6bKVVH8K
	L60lb4SjSf+0vveliFMQvvinDm/qATwIZ+8vrMoSGt1JSC+JW6+TwLTEO6Xr8A==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 23/28] misc: lan966x_pci: Rename lan966x_pci.dtso to lan966x_evb_lan9662_nic.dtso
Date: Fri, 13 Jun 2025 15:48:03 +0200
Message-ID: <20250613134817.681832-24-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613134817.681832-1-herve.codina@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetgfeihfduudeklefghfekfedtieekvedttdfghfevlefgffdtjeegvdffjefgieenucffohhmrghinhepmhhitghrohgthhhiphdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeelpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhos
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_064944_052863_CDD5FE79 
X-CRM114-Status: GOOD (  13.30  )
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

The lan966x_pci.dtso describes the Microchip EVB-LAN9662-NIC board [0]

This PCI board embeds a LAN9962 PCI device chip, part of the LAN966x
family.

Rename the lan966x_pci.dtso accordingly.

Link: https://www.microchip.com/en-us/development-tool/EV53U25A [0]
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 MAINTAINERS                                               | 2 +-
 drivers/misc/Makefile                                     | 2 +-
 .../{lan966x_pci.dtso => lan966x_evb_lan9662_nic.dtso}    | 0
 drivers/misc/lan966x_pci.c                                | 8 ++++----
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename drivers/misc/{lan966x_pci.dtso => lan966x_evb_lan9662_nic.dtso} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7b1e4c42d9d..bea712ad4f6e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16277,9 +16277,9 @@ F:	drivers/irqchip/irq-lan966x-oic.c
 MICROCHIP LAN966X PCI DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 S:	Maintained
+F:	drivers/misc/lan966x_evb_lan9662_nic.dtso
 F:	drivers/misc/lan966x_pci.c
 F:	drivers/misc/lan966x_pci.dtsi
-F:	drivers/misc/lan966x_pci.dtso
 
 MICROCHIP LAN969X ETHERNET DRIVER
 M:	Daniel Machon <daniel.machon@microchip.com>
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 917b9a7183aa..1e0da2d20528 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -71,7 +71,7 @@ obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
 obj-$(CONFIG_NSM)		+= nsm.o
 obj-$(CONFIG_MARVELL_CN10K_DPI)	+= mrvl_cn10k_dpi.o
 lan966x-pci-objs		:= lan966x_pci.o
-lan966x-pci-objs		+= lan966x_pci.dtbo.o
+lan966x-pci-objs		+= lan966x_evb_lan9662_nic.dtbo.o
 obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
 obj-y				+= keba/
 obj-y				+= amd-sbi/
diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_evb_lan9662_nic.dtso
similarity index 100%
rename from drivers/misc/lan966x_pci.dtso
rename to drivers/misc/lan966x_evb_lan9662_nic.dtso
diff --git a/drivers/misc/lan966x_pci.c b/drivers/misc/lan966x_pci.c
index 9c79b58137e5..b28066c96534 100644
--- a/drivers/misc/lan966x_pci.c
+++ b/drivers/misc/lan966x_pci.c
@@ -19,8 +19,8 @@
 #include <linux/slab.h>
 
 /* Embedded dtbo symbols created by cmd_wrap_S_dtb in scripts/Makefile.lib */
-extern char __dtbo_lan966x_pci_begin[];
-extern char __dtbo_lan966x_pci_end[];
+extern char __dtbo_lan966x_evb_lan9662_nic_begin[];
+extern char __dtbo_lan966x_evb_lan9662_nic_end[];
 
 struct pci_dev_intr_ctrl {
 	struct pci_dev *pci_dev;
@@ -125,8 +125,8 @@ struct lan966x_pci {
 
 static int lan966x_pci_load_overlay(struct lan966x_pci *data)
 {
-	u32 dtbo_size = __dtbo_lan966x_pci_end - __dtbo_lan966x_pci_begin;
-	void *dtbo_start = __dtbo_lan966x_pci_begin;
+	u32 dtbo_size = __dtbo_lan966x_evb_lan9662_nic_end - __dtbo_lan966x_evb_lan9662_nic_begin;
+	void *dtbo_start = __dtbo_lan966x_evb_lan9662_nic_begin;
 
 	return of_overlay_fdt_apply(dtbo_start, dtbo_size, &data->ovcs_id, dev_of_node(data->dev));
 }
-- 
2.49.0


