Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D229CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxbS28SntsMUQyXM5E13ugMcWQINhgsovIcMpFDcwJ4=; b=s6p8aAvF5FPwAoN/BNUB/CIWfz
	7dSnlmKsXlM5Cb6Xtaob+CT3Yxa2s50wA1Pl/W3h/1nJlCtjVqubNaX4G8RrwKaRLi/i2m/raBbAh
	fRED5YQbxkqA++3BFxOIgd7fZ8fMc6cyyFwoIWfxMwauqiyRQDIrPpT/uuG6OcN+/C6Rb0EJMx12V
	hnEU+HH91eTfqRWgCw3nrVYL0e/hXH2X4IUaNm02vqMx6b588m5uByPAInSXGtMVAv/1UFR+iQbhy
	Q7gwzstbnwQXF8+P/8/sL0unCn4duSLO1+iFhARy9Z1JYgApPC4JcGkw373JUfW9zQ6lPQRM2AIcG
	qj5HuQuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeex-0000000Fvol-3DSY;
	Mon, 05 Oct 2026 09:06:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeeu-0000000Fvn4-3v8M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:06:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 797C043DDA;
	Mon,  5 Oct 2026 09:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1420F1F0089C;
	Mon,  5 Oct 2026 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791191216;
	bh=gxbS28SntsMUQyXM5E13ugMcWQINhgsovIcMpFDcwJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DjJoWloRFZNFBdWo3TyOVpX8PmVPTpKiT4yzrRJ5apizSOE41FzvGpytITen5Tn12
	 wLpb8UGqtY8sjDFl9A7e/4tOG8eCNvI7rV9AEzpW9ZtHvaSFbAHkb8WKy7hlI4olFu
	 oJjH3/PsPE8DwKg9hTYpGJZVHGHkHK/hC1lw0KbaM9wzl4kGf+gRf3cldzNuAMrhR+
	 tCuHvZhUZuLoIXOvyAg7cHCiRv/Oy2G+fmQLgA/1w5cY4DDBW3o5mC19lwvJ3FS6BP
	 OYujNII2UpyflFLbtpXG1nMuIgsMSVtH9waetva2nBHgfDvz4esDiKG3v8oEfz1qGR
	 oWrh2uYpOfIhQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 05 Oct 2026 10:04:33 +0100
Subject: [PATCH v2 2/4] firmware: arm_scmi: Skip requests for standard
 protocol devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-scmi_bus_fixes-v2-2-34a51338875a@kernel.org>
References: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org>
In-Reply-To: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org>
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
 drivers/firmware/arm_scmi/bus.c | 73 +++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index f2e2ed56bc32..230ee9f6f1aa 100644
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

-- 
2.43.0


