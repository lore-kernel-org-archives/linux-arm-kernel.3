Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3516FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pwz/ckwIg5SF6DSbtDhZCYSiD3zX969PVuMCNsS/n58=; b=buVHeipKlbxvegs0HkiTlPT/0A
	o54KO4sIBw1EluZKCRhV3/9WyvJoJGtlZ2Jv5d1isuTms8aMtYL7L1uePGMn3X17eJMX2T+aq+ncf
	vSQc+e7zDQQRWThV7bN6S13bxDYvbzb8QQd+QKZq2Bt7NiIv8n68vv6u3M/0uYDzENh4ipcX0VEvk
	jTFLNs8CsrzX59/TEfe75XXNvE/iLGoKfK6do55iRKIdbVhvVf8OdXqZJdyE80bCDkn4s99ENyjfV
	Fw8oYoNDSfSWns/EzFsqU1mSFFRf35YlrQ0uB+Ts7WoadUKR2bofElXCCxgxkKZezgyXxSiF3NMNB
	a2/qZqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPLC-0000000GrLE-2OP5;
	Wed, 08 Jul 2026 10:17:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPL8-0000000GrJG-3Trw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:17:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5209E40DC0;
	Wed,  8 Jul 2026 10:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2317D1F00A3D;
	Wed,  8 Jul 2026 10:17:08 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 04/10] reset: Add reset_controller_get_provider()
Date: Wed,  8 Jul 2026 12:16:22 +0200
Message-ID: <c415dc5f468e62cd0e2a6b9639abb92a82c01324.1783505329.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783505329.git.geert+renesas@glider.be>
References: <cover.1783505329.git.geert+renesas@glider.be>
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
v2:
  - No changes.
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


