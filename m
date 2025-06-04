Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A351C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EG2I8Hbconh02TfD8bYVeP3mdP+sX6Mmh7wxjZ8h1nM=; b=kwPZGgnSvLbK7++9pd/xsdgbJq
	ub6QXb5YkHF1VNOC++JXXku6ORYf12P1bW6rvdj9zMpzITug9o0sv59Vkl9W5BeGrz2rQRm2L946O
	Alg1rsVKPKhxT4eSPO0qr1Lep85+RyOnB+Lef5mpOYIBkUfavB/EYiUrc7L36Qdb/GdhjykO+prhi
	trjNBSlXrJDdTv3npRqyJms28kMAakycgPIp/chsl1zlkkpaRWNwXw8I7Fdf55R7FfrFIEpwiOmJz
	JOAtfcugcvnFK7hvIQfqZ+hjSw/ipfr04drTpKoPJPCdNwwtrzQWTcQHOaCpuxWtrfSMxduX5DOG4
	ouSOtCFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMltM-0000000DB2Z-11lv;
	Wed, 04 Jun 2025 11:02:44 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlrG-0000000DAsV-1NSg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 11:00:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uMlrD-0000Jr-37; Wed, 04 Jun 2025 13:00:31 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uMlrC-001mPi-2B;
	Wed, 04 Jun 2025 13:00:30 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uMlrC-001JDN-1w;
	Wed, 04 Jun 2025 13:00:30 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 04 Jun 2025 13:00:30 +0200
Subject: [PATCH] clk: scmi: Fix children encountered before parents case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-clk-scmi-children-parent-fix-v1-1-be206954d866@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAE0nQGgC/x2MQQ5AMBAAvyJ7tkk1KviKOFQtNihpRSSNv9u4T
 DJzmASRAlOENksQ6ObIhxcp8gzcYv1MyKM4aKWNqlSJblsxup3RLbyNgTyeVnjhxA+WxtZNoYd
 6sApkcQaS/O+7/n0/xXveK24AAAA=
X-Change-ID: 20250604-clk-scmi-children-parent-fix-45a8912b8ba0
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749034830; l=2736;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=v/veQCLfrMcIRAj6dJqLlBlutbTVZR6wTEh4vNB9rjU=;
 b=p/7n0aM4JHmJA90LjJcorfb/OkVNPqsasWKC6s95WollCc5lkgTOdCrSA0J7PxaGnLV6Ujqk3
 BPOxZ5yBsoACaD1Fsr6qlqo0jsefBvPwUw34LZMz5myarg0YgOSshMj
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_040034_370620_B27C2F0B 
X-CRM114-Status: GOOD (  14.88  )
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

When it comes to clocks with parents the SCMI clk driver assumes that
parents are always initialized before their children which might not
always be the case.

During initialization of the parent_data array we have:

	sclk->parent_data[i].hw = hws[sclk->info->parents[i]];

hws[sclk->info->parents[i]] will not yet be initialized when children
are encountered before their possible parents. Solve this by allocating
all struct scmi_clk as an array first and populating all hws[] upfront.

Fixes: 65a8a3dd3b95f ("clk: scmi: Add support for clock {set,get}_parent")
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/clk-scmi.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 15510c2ff21c0335f5cb30677343bd4ef59c0738..f258ad7dda73e3c50c3ce567a8e22b3d2ec9836b 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -404,6 +404,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	const struct scmi_handle *handle = sdev->handle;
 	struct scmi_protocol_handle *ph;
 	const struct clk_ops *scmi_clk_ops_db[SCMI_MAX_CLK_OPS] = {};
+	struct scmi_clk *sclks;
 
 	if (!handle)
 		return -ENODEV;
@@ -430,18 +431,24 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	transport_is_atomic = handle->is_transport_atomic(handle,
 							  &atomic_threshold_us);
 
+	sclks = devm_kcalloc(dev, count, sizeof(*sclks), GFP_KERNEL);
+	if (!sclks)
+		return -ENOMEM;
+
 	for (idx = 0; idx < count; idx++) {
-		struct scmi_clk *sclk;
-		const struct clk_ops *scmi_ops;
+		struct scmi_clk *sclk = &sclks[idx];
 
-		sclk = devm_kzalloc(dev, sizeof(*sclk), GFP_KERNEL);
-		if (!sclk)
-			return -ENOMEM;
+		hws[idx] = &sclk->hw;
+	}
+
+	for (idx = 0; idx < count; idx++) {
+		struct scmi_clk *sclk = &sclks[idx];
+		const struct clk_ops *scmi_ops;
 
 		sclk->info = scmi_proto_clk_ops->info_get(ph, idx);
 		if (!sclk->info) {
 			dev_dbg(dev, "invalid clock info for idx %d\n", idx);
-			devm_kfree(dev, sclk);
+			hws[idx] = NULL;
 			continue;
 		}
 
@@ -479,13 +486,11 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 		if (err) {
 			dev_err(dev, "failed to register clock %d\n", idx);
 			devm_kfree(dev, sclk->parent_data);
-			devm_kfree(dev, sclk);
 			hws[idx] = NULL;
 		} else {
 			dev_dbg(dev, "Registered clock:%s%s\n",
 				sclk->info->name,
 				scmi_ops->enable ? " (atomic ops)" : "");
-			hws[idx] = &sclk->hw;
 		}
 	}
 

---
base-commit: 5abc7438f1e9d62e91ad775cc83c9594c48d2282
change-id: 20250604-clk-scmi-children-parent-fix-45a8912b8ba0

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


