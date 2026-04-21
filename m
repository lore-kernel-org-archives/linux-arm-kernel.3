Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96706F94CA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 18:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuMEp7hOD5JcyixO45GKj+fPVoNm6/QHoEruyu9vSHk=; b=I2RT8c60SM949z15+XD115bhJt
	jV+//ImbsGsNUHUQ9P90yJyb4hRAKf3y5WFYZfk2n+Mq1AAICke2kCJPTSFcElof17AfK7KhI7eJk
	gQT/fJy/rpXkWrj0yW7bt7WKjSS58w2yj8BxCcrAxyG7lQ38/kBM/n/Oymx8TVnvelwT8JFBmpfbG
	f6PmMDiLwVbvsEt116PWF/L7qp+LawnL3Jt9BTiy0IE7DHM9ZMAtaeY39kmGtRYhYNdkCSm3Z2sE8
	ZxepvLNDTiChHfWqEAq7/aZev1NfPpt/uP0bIu2ntzSy0oqudxBn35/6GsT4wV59g9qJ51l60JBps
	89/e/vHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFaD-000000090nq-39T0;
	Tue, 21 Apr 2026 18:12:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFaC-000000090mg-0kOR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 18:12:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 577FC61119;
	Tue, 21 Apr 2026 18:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A668C2BCB0;
	Tue, 21 Apr 2026 18:12:18 +0000 (UTC)
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
Subject: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
Date: Tue, 21 Apr 2026 20:11:38 +0200
Message-ID: <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
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

Currently non-SCMI drivers cannot find out what the specific versions of
each SCMI provider implementation on the running system are.

However, different versions may use different ABIs (e.g. different clock
IDs), or behave different, requiring remapping or workarounds in other
drivers.

Add a public function to obtain base protocol information for the
selected SCMI provider.  This will be used by the R-Car X5H Clock Pulse
Generator and Module Controller drivers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/driver.c | 31 ++++++++++++++++++++++++++++++
 include/linux/scmi_protocol.h      |  8 ++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e0d975ec94c4485..dfa8961775aa952d 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3504,6 +3504,37 @@ int scmi_inflight_count(const struct scmi_handle *handle)
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
+
+ * Return: 0 on Success or -ENOENT.
+ */
+int scmi_get_base_info(struct device_node *of_node,
+		       struct scmi_base_info *version)
+{
+	struct scmi_info *info;
+	int ret = -ENOENT;
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
index 49cc39e0cbca5a0b..52eba920de264bd7 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -972,6 +972,8 @@ struct scmi_driver {
 int scmi_driver_register(struct scmi_driver *driver,
 			 struct module *owner, const char *mod_name);
 void scmi_driver_unregister(struct scmi_driver *driver);
+int scmi_get_base_info(struct device_node *of_node,
+		       struct scmi_base_info *version);
 #else
 static inline int
 scmi_driver_register(struct scmi_driver *driver, struct module *owner,
@@ -981,6 +983,12 @@ scmi_driver_register(struct scmi_driver *driver, struct module *owner,
 }
 
 static inline void scmi_driver_unregister(struct scmi_driver *driver) {}
+
+static inline int scmi_get_base_info(struct device_node *of_node,
+				     struct scmi_base_info *version)
+{
+	return -ENOENT;
+}
 #endif /* CONFIG_ARM_SCMI_PROTOCOL */
 
 #define scmi_register(driver) \
-- 
2.43.0


