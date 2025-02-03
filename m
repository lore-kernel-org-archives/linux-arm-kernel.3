Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60D1C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 10:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8oziO6AG9t175QvFqSPrNTuoczh6aeN6VVEcD4++qA=; b=hIkiFUen9yhoX7IYRAwaRnUVp0
	lcu9jtWfigJPS5Yhucahz16mBZJ1qQmSOFNRxQTYS1tJELIW82y4k4FoJxzlrIFJtOHLT38W0SwNu
	gm0llmJWIB1WmsZvmxvAPKA1W2wEsl+E0lkdWh7b5ghKMvBWJDEmbotF2FbtmZ5v5OLhn6dCh4D3W
	d0s1dpOFM8abPynSFPQfOj0ohecOodXGppYS5N4FrfZmaLebtXIOC6H0dkzqHXgav5sNy98pBy1Ar
	sXks4W349hjCh+vw+UW5ufTaNCH9f6h7mczfbaQHA9xuf9xsHknUbw9B8CldSZepIGtn9fjDi0jP0
	YJNP4fGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetK7-0000000F4wa-1sC8;
	Mon, 03 Feb 2025 10:04:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetHd-0000000F4mX-0mAd
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v8oziO6AG9t175QvFqSPrNTuoczh6aeN6VVEcD4++qA=; b=oL62s2ncC43akGHIh2ZUN8WeY2
	J5y8/hGt2loF1DR/CFClejbTlRppiXs7V6q9mcjdZDcAEWPH5AThCQDJWloscaCAc8m15uaQ0ifHP
	k/bxb2ycbgb/s+rWaDHuBXHxMLDzJ7Z7jIEn/GQ7Jlh5PARSKy2l14WGykqw+8NLCN46F69vwIcOz
	4GJ8DOae+V9WWK4SYVSVRzIyHyk17a5/Tl9g5MiEmjbdtxTg4ONoMSuTEkBYvWXdn/IB2xqo/qyDb
	56RWHm13xZMvY3xcsQw1t2C40SXY/sEonEz/QTql1zUM2sXRg7Gk9g6GkipvRfHdaeDaYzcAX7uOh
	ZWaISMIg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetHZ-0000000G392-3he5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:02:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79CBD1476;
	Mon,  3 Feb 2025 02:02:43 -0800 (PST)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D6AF3F63F;
	Mon,  3 Feb 2025 02:02:17 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: cristian.marussi@arm.com
Cc: arm-scmi@vger.kernel.org,
	guomin_chen@sina.com,
	linux-arm-kernel@lists.infradead.org,
	peng.fan@nxp.com,
	quic_xinqzhan@quicinc.com,
	sudeep.holla@arm.com
Subject: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for autoloading
Date: Mon,  3 Feb 2025 10:01:54 +0000
Message-ID: <20250203100154.140877-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250203100154.140877-1-cristian.marussi@arm.com>
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_100222_314905_600872F0 
X-CRM114-Status: GOOD (  15.11  )
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

Emit proper MODALIAS uevents when SCMI devices are created and make sure
all the standard protocol devices are requested when the bus is
initialized.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 52 +++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index def41fe3b161..dfa4fde2a81c 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -92,12 +92,17 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 				phead = head;
 		}
 		list_for_each_entry(rdev, head, node) {
+			/*
+			 * HACK
+			 * We ignore requested duplicates since they could have
+			 * been pre-requested...
+			 */
 			if (!strcmp(rdev->id_table->name, id_table->name)) {
-				pr_err("Ignoring duplicate request [%d] %s\n",
-				       rdev->id_table->protocol_id,
-				       rdev->id_table->name);
-				ret = -EINVAL;
-				goto out;
+				pr_debug("Device already requested [%d] %s\n",
+				        rdev->id_table->protocol_id,
+				        rdev->id_table->name);
+				mutex_unlock(&scmi_requested_devices_mtx);
+				return 0;
 			}
 		}
 	}
@@ -274,6 +279,16 @@ static struct scmi_device *scmi_child_dev_find(struct device *parent,
 	return to_scmi_dev(dev);
 }
 
+static int scmi_dev_uevent(const struct device *dev,
+			   struct kobj_uevent_env *env)
+{
+	const struct scmi_device *sdev = to_scmi_dev(dev);
+
+	add_uevent_var(env, "MODALIAS=scmi:pr%02X", sdev->protocol_id);
+
+	return 0;
+}
+
 static int scmi_dev_probe(struct device *dev)
 {
 	struct scmi_driver *scmi_drv = to_scmi_driver(dev->driver);
@@ -297,6 +312,7 @@ static void scmi_dev_remove(struct device *dev)
 const struct bus_type scmi_bus_type = {
 	.name =	"scmi_protocol",
 	.match = scmi_dev_match,
+	.uevent	= scmi_dev_uevent,
 	.probe = scmi_dev_probe,
 	.remove = scmi_dev_remove,
 };
@@ -516,6 +532,23 @@ static void scmi_devices_unregister(void)
 	bus_for_each_dev(&scmi_bus_type, NULL, NULL, __scmi_devices_unregister);
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
+	{ SCMI_PROTOCOL_VOLTAGE,  "regulator" },
+	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ },
+};
+
 static int __init scmi_bus_init(void)
 {
 	int retval;
@@ -526,6 +559,15 @@ static int __init scmi_bus_init(void)
 
 	pr_info("SCMI protocol bus registered\n");
 
+	/* HACK pre-request ALL standard protocol devices */
+	retval = scmi_protocol_table_register(scmi_std_id_table);
+	if (retval) {
+		bus_unregister(&scmi_bus_type);
+		return retval;
+	}
+
+	pr_info("SCMI standard protocols devices requested\n");
+
 	return retval;
 }
 subsys_initcall(scmi_bus_init);
-- 
2.47.0


