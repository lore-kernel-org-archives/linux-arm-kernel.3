Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B916C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMURx36GlLDD+dvoyTlP38y6Qfch1n09cZ58c3w5MCE=; b=i8XmZ0z0iBUp72/wjUSgg9wSXT
	vEWFHmoNoc7aJOBGqkUxpl8TGHlu0Qa/unUg3KQfHKFuEH6efARt0yZV48Q2NxrNTe6SFrFTQVkVA
	WkyVDTiotoDfHofpVb2ww9iPYmgAg0por6D0zPeG3lrrJUcPpCxIlIznP2YNjMjyQspRs3S7/2+aa
	S4sA50nhAoh+ES3OGVdoWODGPcBRq4ISQlgPhtv6pWm1F9GITp8JUD8LrpO6SqsoOibXbc0kOeqzU
	NZ8kmLjG/724Yh4mys80BkIsqF4P/rkijG9jdP5ndA03QbhnLCij78+bdcDmUSxw4jKtVV1lhW1fb
	U5eA6GVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jAG-0000000EUyl-27D9;
	Wed, 02 Sep 2026 11:30:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jAF-0000000EUyD-3Y4A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:29:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 423A0434F6;
	Wed,  2 Sep 2026 11:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C357D1F00A3A;
	Wed,  2 Sep 2026 11:29:53 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clegoffic@baylibre.com>
Cc: devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 03/12] firmware: arm_scmi: Add scmi_get_base_info()
Date: Wed,  2 Sep 2026 13:29:19 +0200
Message-ID: <59241a6714353aa7ff180368b5a733b3db00012f.1788338320.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788338320.git.geert+renesas@glider.be>
References: <cover.1788338320.git.geert+renesas@glider.be>
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

Currently non-SCMI drivers cannot find out what the specific versions of
each SCMI provider implementation on the running system are.

However, different versions may use different ABIs (e.g. different clock
IDs), provide different abstractions, or behave different, requiring
remapping or workarounds in other drivers.

Add a public function to obtain base protocol information for the
selected SCMI provider.  This will be used by the R-Car X5H Clock Pulse
Generator and Module Controller drivers, to map hardware descriptions in
DT to SCMI abstractions offered by the SCMI firmware implementation
present.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - No changes,

v2:
  - Add that SCMI may provide different abstractions,
  - Add missing asterisk to blank kerneldoc line,
  - Return -EPROBE_DEFER or -EOPNOTSUPP instead of -ENOENT.
---
 drivers/firmware/arm_scmi/driver.c | 33 ++++++++++++++++++++++++++++++
 include/linux/scmi_protocol.h      |  8 ++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index ef29fd223287dd58..478f25ae0587e422 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3525,6 +3525,39 @@ int scmi_inflight_count(const struct scmi_handle *handle)
 	}
 }
 
+/**
+ * scmi_get_base_info() - Get SCMI base protocol information
+ *
+ * @of_node: pointer to a device node for an SCMI provider
+ * @version: pointer to write base protocol information
+ *
+ * Check if an SCMI device has been instantiated for the passed device node
+ * pointer, and, if found, return its base info.
+ *
+ * Return: 0 on Success,
+ *         -EPROBE_DEFER if the SCMI provider is not ready yet,
+ *         -EOPNOTSUPP if SCMI support is disabled.
+ */
+int scmi_get_base_info(struct device_node *of_node,
+		       struct scmi_base_info *version)
+{
+	int ret = -EPROBE_DEFER;
+	struct scmi_info *info;
+
+	mutex_lock(&scmi_list_mutex);
+	list_for_each_entry(info, &scmi_list, node) {
+		if (info->dev->of_node == of_node) {
+			*version = info->version;
+			ret = 0;
+			break;
+		}
+	}
+	mutex_unlock(&scmi_list_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(scmi_get_base_info);
+
 static int __init scmi_driver_init(void)
 {
 	scmi_quirks_initialize();
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5ab73b1ab9aa4fa8..fd2d648964f68f53 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -971,6 +971,8 @@ struct scmi_driver {
 int scmi_driver_register(struct scmi_driver *driver,
 			 struct module *owner, const char *mod_name);
 void scmi_driver_unregister(struct scmi_driver *driver);
+int scmi_get_base_info(struct device_node *of_node,
+		       struct scmi_base_info *version);
 #else
 static inline int
 scmi_driver_register(struct scmi_driver *driver, struct module *owner,
@@ -980,6 +982,12 @@ scmi_driver_register(struct scmi_driver *driver, struct module *owner,
 }
 
 static inline void scmi_driver_unregister(struct scmi_driver *driver) {}
+
+static inline int scmi_get_base_info(struct device_node *of_node,
+				     struct scmi_base_info *version)
+{
+	return -EOPNOTSUPP;
+}
 #endif /* CONFIG_ARM_SCMI_PROTOCOL */
 
 #define scmi_register(driver) \
-- 
2.43.0


