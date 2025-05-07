Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73438C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 07:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itxan9EuG0FuUpqxKlqCP8iOs9iWcsyZKP4fqZ5Hxr0=; b=n1MhpVS8d4RLQYVzwy1MHFtYod
	CrE94OBcb1G9iitmoMLPyGt8iaRqL8RRFElvFmeZQv8W6CyHSvVJ2S9lKOAmxohssfGOC+vhaBJRb
	644rLuE9s8hGYRzZxzJCUnQs065abCK9yBt4sKJKYUcdODPj4rLlwqQQLlY183ITdrR+bzyoTY71V
	n1cj9ibgW9hkH0qFgNey5HUlmxhVgmvvxIId/fp6yAUf+Er+d0Tx7afp5K28nmclDDEZz2iSImJKk
	LcYNnRNhHlPQj/MKlzHG0z8FeIkuiA8w+MumD9kThlefkIbmRPegOkwGMgM8nYbkKaiiHNCyabUn5
	Nh0saHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZCg-0000000EWwJ-1gmL;
	Wed, 07 May 2025 07:28:30 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYyE-0000000ETSW-3IkO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:13:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 8ECD743B5E;
	Wed,  7 May 2025 07:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746602013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=itxan9EuG0FuUpqxKlqCP8iOs9iWcsyZKP4fqZ5Hxr0=;
	b=SdWV2QMXpGhZJK6TzbcR016k5y/LspDiqBraCC6VrAY8thDpkRIR6ZeEMbXycPhF1DcN70
	YwcCzRB6UlEUgP4t8CB1SrIRCWWsy6kC+KWHtMyuPrlh7+41JixOEVTrCOUmfvPR1tzRz0
	nDupRUP685f04bv/AFIMR5gHiN+MsTbqgp2u9X1BYIPy/mxrt0dGy6OPIb8Gp3JmXSPIDx
	affEn+cQhM0VAo3FQ8tl40ia6yCJKz2/ot3V19icUCrvYJYnmp49Eu0n5Xj5mfuCSK8+gN
	6PfRra8pj3BZyoC1tAaA/ObN4rYX8PE2eOggHtGYAp2DEgE0T5uQxbFdRmjB4w==
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
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 04/26] driver core: Avoid warning when removing a device while its supplier is unbinding
Date: Wed,  7 May 2025 09:12:46 +0200
Message-ID: <20250507071315.394857-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507071315.394857-1-herve.codina@bootlin.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeivdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrh
 hgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_001334_959416_B6B423F6 
X-CRM114-Status: GOOD (  15.97  )
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

During driver removal, the following warning can appear:
   WARNING: CPU: 1 PID: 139 at drivers/base/core.c:1497 __device_links_no_driver+0xcc/0xfc
   ...
   Call trace:
     __device_links_no_driver+0xcc/0xfc (P)
     device_links_driver_cleanup+0xa8/0xf0
     device_release_driver_internal+0x208/0x23c
     device_links_unbind_consumers+0xe0/0x108
     device_release_driver_internal+0xec/0x23c
     device_links_unbind_consumers+0xe0/0x108
     device_release_driver_internal+0xec/0x23c
     device_links_unbind_consumers+0xe0/0x108
     device_release_driver_internal+0xec/0x23c
     driver_detach+0xa0/0x12c
     bus_remove_driver+0x6c/0xbc
     driver_unregister+0x30/0x60
     pci_unregister_driver+0x20/0x9c
     lan966x_pci_driver_exit+0x18/0xa90 [lan966x_pci]

This warning is triggered when a consumer is removed because the links
status of its supplier is not DL_DEV_DRIVER_BOUND and the link flag
DL_FLAG_SYNC_STATE_ONLY is not set.

The topology in terms of consumers/suppliers used was the following
(consumer ---> supplier):

      i2c -----------> OIC ----> PCI device
       |                ^
       |                |
       +---> pinctrl ---+

When the PCI device is removed, the OIC (interrupt controller) has to be
removed. In order to remove the OIC, pinctrl and i2c need to be removed
and to remove pinctrl, i2c need to be removed. The removal order is:
  1) i2c
  2) pinctrl
  3) OIC
  4) PCI device

In details, the removal sequence is the following (with 0000:01:00.0 the
PCI device):
  driver_detach: call device_release_driver_internal(0000:01:00.0)...
    device_links_busy(0000:01:00.0):
      links->status = DL_DEV_UNBINDING
    device_links_unbind_consumers(0000:01:00.0):
      0000:01:00.0--oic link->status = DL_STATE_SUPPLIER_UNBIND
      call device_release_driver_internal(oic)...
        device_links_busy(oic):
          links->status = DL_DEV_UNBINDING
        device_links_unbind_consumers(oic):
          oic--pinctrl link->status = DL_STATE_SUPPLIER_UNBIND
          call device_release_driver_internal(pinctrl)...
            device_links_busy(pinctrl):
              links->status = DL_DEV_UNBINDING
            device_links_unbind_consumers(pinctrl):
              pinctrl--i2c link->status = DL_STATE_SUPPLIER_UNBIND
              call device_release_driver_internal(i2c)...
                device_links_busy(i2c): links->status = DL_DEV_UNBINDING
                __device_links_no_driver(i2c)...
                  pinctrl--i2c link->status is DL_STATE_SUPPLIER_UNBIND
                  oic--i2c link->status is DL_STATE_ACTIVE
                  oic--i2c link->supplier->links.status is DL_DEV_UNBINDING

The warning is triggered by the i2c removal because the OIC (supplier)
links status is not DL_DEV_DRIVER_BOUND. Its links status is indeed set
to DL_DEV_UNBINDING.

It is perfectly legit to have the links status set to DL_DEV_UNBINDING
in that case. Indeed we had started to unbind the OIC which triggered
the consumer unbinding and didn't finish yet when the i2c is unbound.

Avoid the warning when the supplier links status is set to
DL_DEV_UNBINDING and thus support this removal sequence without any
warnings.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/base/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 5d6687f38d00..b44f9d371d47 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1494,7 +1494,8 @@ static void __device_links_no_driver(struct device *dev)
 		if (link->supplier->links.status == DL_DEV_DRIVER_BOUND) {
 			WRITE_ONCE(link->status, DL_STATE_AVAILABLE);
 		} else {
-			WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY));
+			if (link->supplier->links.status != DL_DEV_UNBINDING)
+				WARN_ON(!(link->flags & DL_FLAG_SYNC_STATE_ONLY));
 			WRITE_ONCE(link->status, DL_STATE_DORMANT);
 		}
 	}
-- 
2.49.0


