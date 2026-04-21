Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC00F94CA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 18:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfjDm4hwfSrm+xume9nV91xgEFBQISlVMitIilEjP24=; b=SHEeafKvdQBzkuWdIAmaSwHQba
	9HJku0TaHYV7KvyylZOlD35h5MpfCrK2NDNEl0QyupqQooCgZtwmDoieS9E6d4/UnRRQpDkZW++M6
	/8jIzld101W3+Wktb96Dl6yp+yD9teXl7Jh5vXnxLensbeI9qZIuoVntabYYCVo0OR5maGsyU+qsD
	19OHn414frAp55+uAavnWl/Wov85M6gzOOwa2PONPb11ZqD6/Gms1UYCgn2bwVe6FqzUd4vMLF635
	Cpb4+ZF8SFXVrODGxCp9/I3DHXojPy3wklil2hanTBefKMV4dJBZMLxl+IrSLp5L7nuen7raCbSi6
	qgsk1mcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFaR-000000090yj-3KQp;
	Tue, 21 Apr 2026 18:12:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFaR-000000090y5-0cNv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 18:12:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E70D60142;
	Tue, 21 Apr 2026 18:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7D0C2BCB5;
	Tue, 21 Apr 2026 18:12:33 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 08/14] reset: Add reset_controller_get_provider()
Date: Tue, 21 Apr 2026 20:11:41 +0200
Message-ID: <87edde434e1760bbe9e2741856724301d02a4fc8.1776793163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The reset subsystem differs from the clock subsystem in multiple ways:
  1. It does not provide a public way to lookup resets from a reset
     provider (clock has of_clk_get_from_provider()),
  2. The xlate callback does not return a reset object, but merely an
     index, which is converted to a reset object by the reset core.

Hence add a public helper reset_controller_get_provider(), which just
returns the provider, and will be used by the R-Car X5H Module
Controller driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/reset/core.c             | 11 +++++++++++
 include/linux/reset-controller.h |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 38e189d04d09b270..57c427bb33b322e2 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1135,6 +1135,17 @@ __reset_find_rcdev(const struct fwnode_reference_args *args, bool gpio_fallback)
 	return NULL;
 }
 
+struct reset_controller_dev *
+reset_controller_get_provider(struct fwnode_handle *fwnode)
+{
+	struct fwnode_reference_args args = { .fwnode = fwnode };
+
+	guard(mutex)(&reset_list_mutex);
+
+	return __reset_find_rcdev(&args, false);
+}
+EXPORT_SYMBOL_GPL(reset_controller_get_provider);
+
 struct reset_control *
 __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int index,
 			   enum reset_control_flags flags)
diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
index 52a5a4e81f184407..0c17a36466115ba6 100644
--- a/include/linux/reset-controller.h
+++ b/include/linux/reset-controller.h
@@ -74,6 +74,7 @@ void reset_controller_unregister(struct reset_controller_dev *rcdev);
 struct device;
 int devm_reset_controller_register(struct device *dev,
 				   struct reset_controller_dev *rcdev);
+struct reset_controller_dev *reset_controller_get_provider(struct fwnode_handle *fwnode);
 #else
 static inline int reset_controller_register(struct reset_controller_dev *rcdev)
 {
@@ -89,6 +90,11 @@ static inline int devm_reset_controller_register(struct device *dev,
 {
 	return 0;
 }
+
+static inline struct reset_controller_dev *reset_controller_get_provider(struct fwnode_handle *fwnode)
+{
+	return NULL;
+}
 #endif
 
 #endif
-- 
2.43.0


