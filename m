Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A1CC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 14:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSstOMUWc4GoyUjdBMZ7pO7yxSRI6p+YmDrYBqNfASg=; b=CD5/rj3sqlPbKhZeeGHe+p2iMu
	aBz6EpRtQVfu9Fuh3uwVYQBXKkIwrkbaOvHdLP3NuPV8h92NiV9VenKSdimmQVMwNewxEf4ZsXCPW
	aATJAm2CjcE+9PIEfA0NgJCCmuEUDtfPuytUfOWz+UK4PZi1/JDA79ZrHKJDlxADrQBplTcr5kWLZ
	WIJVXWx5ijZT+tl7WGJoM55Cde+Pbnk+5m8kM0BjgXEw4LHiV2b3FgW0u8X1GbP/DDJ382LwYG75m
	UscHiSlTYdZD4gILuW6X/O6lvZRYgO4t0tgt/0Gba2MuV9/J1FXHbZ69Dop7kj/1CaRV4WK/542s+
	6s17YcRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrtQ-0000000AlJ5-2VUF;
	Fri, 31 Jan 2025 14:21:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrqq-0000000Al14-3C3i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 14:18:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D2E5FEC;
	Fri, 31 Jan 2025 06:18:57 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E7A8B3F63F;
	Fri, 31 Jan 2025 06:18:30 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>,
	Guomin Chen <guomin_chen@sina.com>
Subject: [PATCH 2/3] firmware: arm_scmi: Add name and protocol id attributes
Date: Fri, 31 Jan 2025 14:18:21 +0000
Message-Id: <20250131141822.514342-2-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131141822.514342-1-sudeep.holla@arm.com>
References: <20250131141822.514342-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_061832_842543_BC79FED2 
X-CRM114-Status: GOOD (  10.17  )
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

Add the name and the protocol id attributes to the SCMI devices on the
bus so that they are exposed to the user-space via the sysfs.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 8acf33ccfd21..862dd34eca62 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -17,6 +17,8 @@
 
 #include "common.h"
 
+#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
+
 BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
 EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
 
@@ -276,11 +278,47 @@ static void scmi_dev_remove(struct device *dev)
 		scmi_drv->remove(scmi_dev);
 }
 
+static int scmi_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
+{
+	const struct scmi_device *scmi_dev = to_scmi_dev(dev);
+
+	return add_uevent_var(env, "MODALIAS=" SCMI_UEVENT_MODALIAS_FMT,
+			      dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
+			      scmi_dev->name);
+}
+
+static ssize_t protocol_id_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct scmi_device *scmi_dev = to_scmi_dev(dev);
+
+	return sprintf(buf, "0x%02x\n", scmi_dev->protocol_id);
+}
+static DEVICE_ATTR_RO(protocol_id);
+
+static ssize_t name_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct scmi_device *scmi_dev = to_scmi_dev(dev);
+
+	return sprintf(buf, "%s\n", scmi_dev->name);
+}
+static DEVICE_ATTR_RO(name);
+
+static struct attribute *scmi_device_attributes_attrs[] = {
+	&dev_attr_protocol_id.attr,
+	&dev_attr_name.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(scmi_device_attributes);
+
 const struct bus_type scmi_bus_type = {
 	.name =	"scmi_protocol",
 	.match = scmi_dev_match,
 	.probe = scmi_dev_probe,
 	.remove = scmi_dev_remove,
+	.uevent	= scmi_device_uevent,
+	.dev_groups = scmi_device_attributes_groups,
 };
 EXPORT_SYMBOL_GPL(scmi_bus_type);
 
-- 
2.34.1


