Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E159FCD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 22:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNh7b0Xhzqp/vnt3OUqdlQqF8PGgfTTfDkdfQNr15Bo=; b=VMxEWJCnxmWqLTj8f/F7DxfQ6/
	fOBtboBOT7+FW/35t7c9kV95E9wBTvQu4rBcU1xrLqU8ngkLjFq+NspwxTaPiQirMgb0OQberrYQQ
	3MFzQRJI6zgaB++KddCMSaZF4zfO3z+hvcfsmq1Ahvk0wjHx5AIr2TqzW+Foug37JxQx/CKGGIkyS
	g7h65lsiHPz9sZwHQckfBK49P/OWoezV4JTz4zVGFBWAzbf9UpuvDXCKkZzjq8FpesbQLFLjJ17jU
	lqwXrnapfRD8UPQpk/jMJLufK/g84tWutG0QI17V/bweMJZtH/dIN/mOS0Wk3a44/a3Y4CGZG2L3k
	5xhLYsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciY-00000001Eu6-0y6e;
	Fri, 05 Jun 2026 22:08:42 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciR-00000001Eax-2sws
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 22:08:36 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVci6-0000LW-2z; Sat, 06 Jun 2026 00:08:14 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:53 +0200
Subject: [PATCH 07/17] media: rockchip: rga: adjust get_version to return
 the version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-7-3ec2b15675f7@pengutronix.de>
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
X-CRM114-CacheID: sfid-20260605_150835_764438_FDADC849 
X-CRM114-Status: GOOD (  13.90  )
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

Adjust get_version to return the version instead of directly updating it
in the rockchip_rga structure. This is done in preparation for a
multi-core support to check that cores with the same compatible share the
same version.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c  | 10 +++++++---
 drivers/media/platform/rockchip/rga/rga.c     |  2 +-
 drivers/media/platform/rockchip/rga/rga.h     |  2 +-
 drivers/media/platform/rockchip/rga/rga3-hw.c |  8 +++++---
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 4d7b0a03820a1..190104f3b2954 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -474,10 +474,14 @@ static bool rga_handle_irq(struct rockchip_rga *rga)
 	return intr & RGA_INT_COMMAND_FINISHED;
 }
 
-static void rga_get_version(struct rockchip_rga *rga)
+static struct rockchip_rga_version rga_get_version(struct rockchip_rga *rga)
 {
-	rga->version.major = (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
-	rga->version.minor = (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;
+	u32 version = rga_read(rga, RGA_VERSION_INFO);
+
+	return (struct rockchip_rga_version) {
+		.major = (version >> 24) & 0xFF,
+		.minor = (version >> 20) & 0x0F,
+	};
 }
 
 static struct rga_fmt formats[] = {
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 0eff558d7f133..b8edd3596c919 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -864,7 +864,7 @@ static int rga_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto rel_m2m;
 
-	rga->hw->get_version(rga);
+	rga->version = rga->hw->get_version(rga);
 
 	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
 		  rga->version.major, rga->version.minor);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 0e62337f8dd38..0e854cdf739f4 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -158,7 +158,7 @@ struct rga_hw {
 	void (*start)(struct rockchip_rga *rga,
 		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
 	bool (*handle_irq)(struct rockchip_rga *rga);
-	void (*get_version)(struct rockchip_rga *rga);
+	struct rockchip_rga_version (*get_version)(struct rockchip_rga *rga);
 	void *(*adjust_and_map_format)(struct rga_ctx *ctx,
 				       struct v4l2_pix_format_mplane *format,
 				       bool is_output);
diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/media/platform/rockchip/rga/rga3-hw.c
index 72741e1faccff..3469523a5ecad 100644
--- a/drivers/media/platform/rockchip/rga/rga3-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
@@ -299,12 +299,14 @@ static bool rga3_handle_irq(struct rockchip_rga *rga)
 	return FIELD_GET(RGA3_INT_FRM_DONE, intr);
 }
 
-static void rga3_get_version(struct rockchip_rga *rga)
+static struct rockchip_rga_version rga3_get_version(struct rockchip_rga *rga)
 {
 	u32 version = rga_read(rga, RGA3_VERSION_NUM);
 
-	rga->version.major = FIELD_GET(RGA3_VERSION_NUM_MAJOR, version);
-	rga->version.minor = FIELD_GET(RGA3_VERSION_NUM_MINOR, version);
+	return (struct rockchip_rga_version) {
+		.major = FIELD_GET(RGA3_VERSION_NUM_MAJOR, version),
+		.minor = FIELD_GET(RGA3_VERSION_NUM_MINOR, version),
+	};
 }
 
 static struct rga3_fmt rga3_formats[] = {

-- 
2.54.0


