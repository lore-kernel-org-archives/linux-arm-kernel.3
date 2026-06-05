Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D95CD8C86
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2zNTH6mLeSKioV6YWOqZ6osV0quuFXjxlMRW0+Ybt8=; b=pWTeX1IpEYroJ9bL8oZl+x6gW2
	YmG2tax9M6Vqm9fUhPwr/R0dNqR9Nejhk/vg6AdLEQnhe4b+sfg6Webo4/6oaJw3fJHQ/Qy2BV8+x
	vhGzNhbrRLjUoErMDJWES78uVSsB84fHOgu1vlZDVVFSKurRtIu32Lbx10XMFRhEJfvbFkNnlvv3w
	dJNbnhX4oMJ0M2UKonusZBA3X3qXwCmqKOAGSt8D7Kj4XBoUgWYairMdjDIj8BrpJ0OVdKS0AGVQP
	HsmJJhbivaaEowUxa7xsFQQd39kO0d5WtNjNlE0Gxjq4VF4ly5pE8DTPae8cffWojQTAJcIFqSoEV
	LEhhivVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciH-00000001EG3-3oQh;
	Fri, 05 Jun 2026 22:08:25 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciE-00000001E9x-21zS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 22:08:23 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVciC-0000LW-G9; Sat, 06 Jun 2026 00:08:20 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:59 +0200
Subject: [PATCH 13/17] media: rockchip: rga: bind all cores to the master
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-13-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
In-Reply-To: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_150822_575713_6A25CB74 
X-CRM114-Status: GOOD (  19.96  )
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

Bind all core components to the master component. Previously only the
first core has been added to the master device to avoid creating
multiple video devices. As the video device creation has been moved to
the master component, it allows us to bind all cores without creating
additional video devices.

We expect that all cores to report the same version number, as we only
add cores with the same compatible value. This is important, as  we
setup the command buffer before actually scheduling the work to a
specific core. Therefore adjusting command buffers depending on the
version register only works when all cores have the same value.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 22 +++++++++++-----------
 drivers/media/platform/rockchip/rga/rga.h |  1 +
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 0413b8518dfc8..6add6c510c127 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -742,6 +742,7 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 {
 	struct rockchip_rga *rga = data;
 	struct rga_core *core = dev_get_drvdata(dev);
+	struct rockchip_rga_version version;
 	int ret = 0;
 
 	core->rga = rga;
@@ -750,14 +751,21 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 	if (ret < 0)
 		return ret;
 
-	rga->version = rga->hw->get_version(core);
+	version = rga->hw->get_version(core);
 
 	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
-		  rga->version.major, rga->version.minor);
+		  version.major, version.minor);
+
+	if (rga->num_cores) {
+		/* we are not the first core, expect that we have the same version */
+		if (rga->version.major != version.major || rga->version.minor != version.minor)
+			v4l2_warn(&rga->v4l2_dev, "Detected multi-core setup with different core versions!\n");
+	} else
+		rga->version = version;
 
 	pm_runtime_put(core->dev);
 
-	rga->cores[0] = core;
+	rga->cores[rga->num_cores++] = core;
 
 	return 0;
 }
@@ -983,14 +991,6 @@ static int rga_probe(struct platform_device *pdev)
 		component_match_add_release(dev, &match, component_release_of,
 					    component_compare_of, core_node);
 		num_cores++;
-
-		/*
-		 * As multi core is not implemented yet,
-		 * break out of the loop to only have one core per rockchip_rga struct.
-		 * Also put the node, which otherwise would've been done by the loop iteration.
-		 */
-		of_node_put(core_node);
-		break;
 	}
 
 	if (!match)
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index fcf1ef7d2029f..6237436b984eb 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -88,6 +88,7 @@ struct rockchip_rga {
 
 	const struct rga_hw *hw;
 
+	u8 num_cores;
 	struct rga_core *cores[];
 };
 

-- 
2.54.0


