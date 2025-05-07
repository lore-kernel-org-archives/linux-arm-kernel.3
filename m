Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2819C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 07:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHB/9UuHG38qsa7S8TUW1978+sjN4o07nWT58aNFeaQ=; b=wfDUbALutqtN0/JTmQVg2XWsjw
	oiealQWMvml02tdY0J6RxeGFyG2gD5QnkISKin3s2spIpGRjDLaCL4WyDm6HrErz0BGvEcOtv/QKN
	oUP1ZnPUVs6+opaoI6epcy/Wtpu8QBCbUu/fPjtVKqGolwMjoJ6VMxE1O1tD3j+CBXzTDJhPZaMWI
	yMEkYYEgb1RKPf7P0JsyuLUEJJYwBmn9ol82ubFN7d5Kbg3KIcpv3jyESIER92mPj/bTi05XBP2KS
	oSPXYicLQwqO9wHxgCyIuouz/DJFwLcHy6xNrlvHJ5QP50eZJcgTqoAgL38lHSl4UW+ANYJI6G2n+
	knPVaQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZ8q-0000000EVwe-4734;
	Wed, 07 May 2025 07:24:32 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYyA-0000000ETRS-3ki5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:13:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 96C2443B4B;
	Wed,  7 May 2025 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746602009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oHB/9UuHG38qsa7S8TUW1978+sjN4o07nWT58aNFeaQ=;
	b=deJHKLn4MdoLpXhuEza9dlfq3io2QdrLxwwu2kX1esVgW1Xc40V0aQr8RrvfqnIZQzCoji
	gGUO6W7/NBHRHOZFQfdMeJjaftxswZiqjytG9BeE8X3kYRI5EFgxzmt1iYrYSopMlHH/mx
	uy9UTA+NprCElD1OoyNykVwkOifTSVEyLiQVAWOY2cDYWukKsjtX10bofKVO7PcOb4xZi6
	ePi1z1BBTe3z72+vor8qnid+7AL3Nz4ZtZoiAqAwa+nVNcdA32X0VYw9BqVECmI8yKuOCV
	i8+8QCi/rrGl1+X2C9vkbxXLWcxf26rPEu+T33ZCLrdmACH2s+l/yXhvbM3DdA==
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
Subject: [PATCH v2 02/26] driver core: Rename get_dev_from_fwnode() wrapper to get_device_from_fwnode()
Date: Wed,  7 May 2025 09:12:44 +0200
Message-ID: <20250507071315.394857-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507071315.394857-1-herve.codina@bootlin.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeivdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleffudeludffledviefftedtffffjeehhfeiffelteejtdeugffggfffudffheegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedvpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_001331_071418_25A66BB6 
X-CRM114-Status: GOOD (  14.35  )
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

get_dev_from_fwnode() calls get_device() and so it acquires a reference
on the device returned.

In order to be more obvious that this wrapper is a get_device() variant,
rename it to get_device_from_fwnode().

Suggested-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=iEkKPNbNOccYmA@mail.gmail.com/
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Saravana Kannan <saravanak@google.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/base/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index d2f9d3a59d6b..f30260fd3031 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1881,7 +1881,7 @@ static void fw_devlink_unblock_consumers(struct device *dev)
 	device_links_write_unlock();
 }
 
-#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
+#define get_device_from_fwnode(fwnode)	get_device((fwnode)->dev)
 
 static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
 {
@@ -1891,7 +1891,7 @@ static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
 	if (!(fwnode->flags & FWNODE_FLAG_INITIALIZED))
 		return false;
 
-	dev = get_dev_from_fwnode(fwnode);
+	dev = get_device_from_fwnode(fwnode);
 	ret = !dev || dev->links.status == DL_DEV_NO_DRIVER;
 	put_device(dev);
 
@@ -1960,7 +1960,7 @@ static struct device *fwnode_get_next_parent_dev(const struct fwnode_handle *fwn
 	struct device *dev;
 
 	fwnode_for_each_parent_node(fwnode, parent) {
-		dev = get_dev_from_fwnode(parent);
+		dev = get_device_from_fwnode(parent);
 		if (dev) {
 			fwnode_handle_put(parent);
 			return dev;
@@ -2016,8 +2016,8 @@ static bool __fw_devlink_relax_cycles(struct fwnode_handle *con_handle,
 		goto out;
 	}
 
-	sup_dev = get_dev_from_fwnode(sup_handle);
-	con_dev = get_dev_from_fwnode(con_handle);
+	sup_dev = get_device_from_fwnode(sup_handle);
+	con_dev = get_device_from_fwnode(con_handle);
 	/*
 	 * If sup_dev is bound to a driver and @con hasn't started binding to a
 	 * driver, sup_dev can't be a consumer of @con. So, no need to check
@@ -2156,7 +2156,7 @@ static int fw_devlink_create_devlink(struct device *con,
 	if (sup_handle->flags & FWNODE_FLAG_NOT_DEVICE)
 		sup_dev = fwnode_get_next_parent_dev(sup_handle);
 	else
-		sup_dev = get_dev_from_fwnode(sup_handle);
+		sup_dev = get_device_from_fwnode(sup_handle);
 
 	if (sup_dev) {
 		/*
@@ -2225,7 +2225,7 @@ static void __fw_devlink_link_to_consumers(struct device *dev)
 		bool own_link = true;
 		int ret;
 
-		con_dev = get_dev_from_fwnode(link->consumer);
+		con_dev = get_device_from_fwnode(link->consumer);
 		/*
 		 * If consumer device is not available yet, make a "proxy"
 		 * SYNC_STATE_ONLY link from the consumer's parent device to
-- 
2.49.0


