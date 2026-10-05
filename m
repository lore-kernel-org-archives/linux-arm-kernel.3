Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B54CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6bufFBqW8dq7DKct1AarMPtBEbx3Z1NgvNWu4Jhc3I=; b=HuonjfhlePmj8Ol18LdP5oU4hv
	kgq0kkEC7ysPn51rKjWsENuwJkn2V3tr48gIYzO3jdCOrLxl/FAcbvtM7PIPxnOBW4pQL3wvzPy3S
	pxZi9w588HHVJmKAhM0TbWqk8mQcVOmSkUeQ9CxdEPhNQvrVwWzSPJHSZidNJ1CpzzbvDOSWUAFmm
	q5GOMqZNPJIDDVsFXohizCsKBgFeR9IG5AMlvlWq94oim+1MLkAxBGLL5yobAO7pDPolM9Jl0X04D
	f7soeTAHKrAdaddF4/jYa2/ePEA4+kUiHl3ny+cldgeiJuW93xXoBD1V+KS2zl8Q0uXr7ZGbXmhdS
	Kkw0LQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfO1-0000000G5Mo-0ge5;
	Mon, 05 Oct 2026 09:53:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfNy-0000000G5L5-0YmE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:53:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 954644370D;
	Mon,  5 Oct 2026 09:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC901F000FF;
	Mon,  5 Oct 2026 09:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791194009;
	bh=Z6bufFBqW8dq7DKct1AarMPtBEbx3Z1NgvNWu4Jhc3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TfLQ6CHpOFf528B8QOx4rjyzcnjDXTNt/wTyzKbcTA0zhcKBTB7onIbv0Y44okY/s
	 Z1e3cF743YZyINBWOqLGdEsggwlgDHESVMXUYWLDD5F6pY8YECHZBmMKU3nGDMwfvV
	 KObsHsoooCqP6zTjaSWLLN3Ve3Cg3PNWjBP1JZff42SyhUlVOlCVMflIZCoOLLOjnO
	 8/GMCvG30F8PwLX5sr0XEE9F3baHYQg4rlYNEEhmHVTX02wiarg3JkPPd+tLf08Y6M
	 L3Ldg5tWnjFMmP/4pqF4kMJc6EkyYkVgmrttBBJT73+YannPAs5s2nO63mnWTp3UQx
	 yK7lvc36qg4+w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 05 Oct 2026 10:53:11 +0100
Subject: [PATCH v3 2/4] firmware: arm_scmi: Skip requests for standard
 protocol devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-scmi_bus_fixes-v3-2-d9bada32ed38@kernel.org>
References: <20261005-scmi_bus_fixes-v3-0-d9bada32ed38@kernel.org>
In-Reply-To: <20261005-scmi_bus_fixes-v3-0-d9bada32ed38@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
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

The SCMI core creates devices for the standard protocol IDs during
protocol enumeration, without waiting for an SCMI driver request.
Recording a request for one of these devices also rejects a second
driver registering the same protocol/name pair.

When the first driver unregisters, unrequesting that pair destroys the
core-created device. No other driver can be bound to it at that point,
but removing it also removes the device that a later driver could bind
to or use for module autoloading.

Skip request tracking for standard devices. Keep request tracking and
rollback for nonstandard devices unchanged.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95 EVK
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 77 ++++++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 36 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index f2e2ed56bc32..ed5bed545030 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -186,12 +186,44 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 	}
 }
 
+/* Standard protocols table */
+static const struct scmi_device_id scmi_std_id_table[] = {
+	{ SCMI_PROTOCOL_POWER, "genpd" },
+	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
+	{ SCMI_PROTOCOL_PERF, "perf" },
+	{ SCMI_PROTOCOL_PERF, "cpufreq" },
+	{ SCMI_PROTOCOL_CLOCK, "clocks" },
+	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
+	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
+	{ SCMI_PROTOCOL_RESET, "reset" },
+	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
+	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ },
+};
+
+static bool scmi_device_id_in_std_id_table(const struct scmi_device_id *id)
+{
+	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
+		if (scmi_std_id_table[i].protocol_id == id->protocol_id &&
+		    !strcmp(scmi_std_id_table[i].name, id->name))
+			return true;
+	}
+
+	return false;
+}
+
 static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
 {
 	const struct scmi_device_id *entry;
 	int ret;
 
 	for (entry = id_table; entry->name[0]; entry++) {
+		/* Skip standard devices as they are created unconditionally */
+		if (scmi_device_id_in_std_id_table(entry))
+			continue;
+
 		ret = scmi_protocol_device_request(entry);
 		if (ret)
 			goto err_unrequest;
@@ -200,8 +232,11 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
 	return 0;
 
 err_unrequest:
-	while (entry != id_table)
-		scmi_protocol_device_unrequest(--entry);
+	while (entry != id_table) {
+		--entry;
+		if (!scmi_device_id_in_std_id_table(entry))
+			scmi_protocol_device_unrequest(entry);
+	}
 
 	return ret;
 }
@@ -211,8 +246,10 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name[0]; entry++)
-		scmi_protocol_device_unrequest(entry);
+	for (entry = id_table; entry->name[0]; entry++) {
+		if (!scmi_device_id_in_std_id_table(entry))
+			scmi_protocol_device_unrequest(entry);
+	}
 }
 
 static bool scmi_device_name_is_transport(const char *name)
@@ -542,34 +579,6 @@ _scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
 	return sdev;
 }
 
-/* Standard protocols table */
-static const struct scmi_device_id scmi_std_id_table[] = {
-	{ SCMI_PROTOCOL_POWER, "genpd" },
-	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
-	{ SCMI_PROTOCOL_PERF, "perf" },
-	{ SCMI_PROTOCOL_PERF, "cpufreq" },
-	{ SCMI_PROTOCOL_CLOCK, "clocks" },
-	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
-	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
-	{ SCMI_PROTOCOL_RESET, "reset" },
-	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
-	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
-	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
-	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
-	{ },
-};
-
-static bool scmi_device_id_in_std_id_table(const struct scmi_device_id *id)
-{
-	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
-		if (scmi_std_id_table[i].protocol_id == id->protocol_id &&
-		    !strcmp(scmi_std_id_table[i].name, id->name))
-			return true;
-	}
-
-	return false;
-}
-
 /**
  * scmi_device_create  - A method to create one or more SCMI devices
  *
@@ -634,10 +643,6 @@ struct scmi_device *scmi_device_create(struct fwnode_handle *fwnode,
 
 	/* Walk the list of requested devices for protocol and create them */
 	list_for_each_entry(rdev, phead, node) {
-		/* Standard proto matches already have their dev created above */
-		if (scmi_device_id_in_std_id_table(rdev->id_table))
-			continue;
-
 		sdev = _scmi_device_create(fwnode, parent,
 					   rdev->id_table->protocol_id,
 					   rdev->id_table->name);

-- 
2.43.0


