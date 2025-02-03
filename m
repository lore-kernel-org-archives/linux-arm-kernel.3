Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A453C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kowjNUPkP18lH8FfnjhF2qNwuje3S4u8H7avaM0p5vE=; b=PL1y6yNqkUB1jI4YSEm6YWRaLe
	GY5NeGVK3CG3mZQeTZbNx5ofCcwE3VT7IaDIElof5e4hbWljw5XbgyegOsunkUsShSmS43kTlt0qp
	RzTnyV6apVajOF0AKe05/p2MhOhoMDHp6xDzv4HzsAxCwa7+N1d5BZtXOw7ay6iBQdGFq2vqL6roG
	epdKK/xGcHEPUeAq57c8q5EgeYaYG2lK34fVU0u7GXWvQk4WUbNjoIRxuUTqRQi1a+8pAjafDBEaM
	ljLmiy4LXpaK+Mrmpt+rWrcYxkdWPu26+N26BOY5nyhCsoL/R61RCBvi/nNdNTzH+QeO1xEjdsjSy
	vImpspBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teuQe-0000000FDG4-1P5B;
	Mon, 03 Feb 2025 11:15:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetHW-0000000F4ls-30gE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:02:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3488F11FB;
	Mon,  3 Feb 2025 02:02:42 -0800 (PST)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCB933F63F;
	Mon,  3 Feb 2025 02:02:16 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: cristian.marussi@arm.com
Cc: arm-scmi@vger.kernel.org,
	guomin_chen@sina.com,
	linux-arm-kernel@lists.infradead.org,
	peng.fan@nxp.com,
	quic_xinqzhan@quicinc.com,
	sudeep.holla@arm.com
Subject: [RFC PATCH 1/2] firmware: arm_scmi: Generate aliases for SCMI modules
Date: Mon,  3 Feb 2025 10:01:53 +0000
Message-ID: <20250203100154.140877-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <Z6CNWOp8B_ghIrJt@pluto>
References: <Z6CNWOp8B_ghIrJt@pluto>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_020218_876130_4A514A4D 
X-CRM114-Status: GOOD (  12.04  )
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

Generate aliases for SCMI modules to allow automatic module probing.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 include/linux/mod_devicetable.h   | 6 ++++++
 include/linux/scmi_protocol.h     | 6 +-----
 scripts/mod/devicetable-offsets.c | 3 +++
 scripts/mod/file2alias.c          | 9 +++++++++
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 4338b1b4ac44..90c1f7bd4d1e 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -972,4 +972,10 @@ struct coreboot_device_id {
 	kernel_ulong_t driver_data;
 };
 
+/* SCMI Devices */
+struct scmi_device_id {
+	__u8 protocol_id;
+	const char *name;
+};
+
 #endif /* LINUX_MOD_DEVICETABLE_H */
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5437275d3ac7..3d5c4b5a7dd8 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -12,6 +12,7 @@
 #include <linux/device.h>
 #include <linux/hashtable.h>
 #include <linux/log2.h>
+#include <linux/mod_devicetable.h>
 #include <linux/notifier.h>
 #include <linux/types.h>
 #include <linux/xarray.h>
@@ -1196,11 +1197,6 @@ struct scmi_device {
 
 #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
 
-struct scmi_device_id {
-	u8 protocol_id;
-	const char *name;
-};
-
 struct scmi_driver {
 	const char *name;
 	int (*probe)(struct scmi_device *sdev);
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index 9c7b404defbd..58d614109fae 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -281,5 +281,8 @@ int main(void)
 	DEVID(coreboot_device_id);
 	DEVID_FIELD(coreboot_device_id, tag);
 
+	DEVID(scmi_device_id);
+	DEVID_FIELD(scmi_device_id, protocol_id);
+
 	return 0;
 }
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 19ec72a69e90..f86f194a1711 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -510,6 +510,14 @@ static void do_css_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, "css:t%01X", type);
 }
 
+/* looks like: "scmi:prN" */
+static void do_scmi_entry(struct module *mod, void *symval)
+{
+	DEF_FIELD(symval, scmi_device_id, protocol_id);
+
+	module_alias_printf(mod, true, "scmi:pr%02X", protocol_id);
+}
+
 /* Looks like: "serio:tyNprNidNexN" */
 static void do_serio_entry(struct module *mod, void *symval)
 {
@@ -1471,6 +1479,7 @@ static const struct devtable devtable[] = {
 	{"usb", SIZE_usb_device_id, do_usb_entry_multi},
 	{"pnp", SIZE_pnp_device_id, do_pnp_device_entry},
 	{"pnp_card", SIZE_pnp_card_device_id, do_pnp_card_entry},
+	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
 };
 
 /* Create MODULE_ALIAS() statements.
-- 
2.47.0


