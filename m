Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8E8C4450C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdqFK4QtAP512tn3Ad28QyzpZm5T12rP4k6rkOKPHM8=; b=gRzaiFilWCmVNI2XnFpx7SsMJn
	n7gQgMXG3Lpbrz8vJmJGpUe+wW/Mzw/zKkUky0vfPMBkRp4KJZ3Goq/h/S7QV1dIkXg7nasqHNbgP
	V59KZB9zUqtSQ7lyEdoZur2F01k3uhubyzyaIsXbW55mqDUsjGMWuuTECr/qlXUDMxcOHd/d3qP0J
	tTkuxLi2JhY12A6Y1Sp8jQKWi+n3jlkITd9PPLv9BhYm7XU89Xhow9zN7Vv4/FDvJ76tCDmHg3rvL
	r6/ifeemH57USyZLLoz/mTj+w/tY+8/nYiBo7DYl6utxxS/IG9wG1f4EU2alptLbn2E/hhVpUOExj
	2qx2Mehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcjO-0000000C3Nz-0Isp;
	Tue, 14 Jul 2026 12:59:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcir-0000000C2kz-21Is
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:58:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FE75405FE;
	Tue, 14 Jul 2026 12:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903FD1F00A3E;
	Tue, 14 Jul 2026 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033933;
	bh=QdqFK4QtAP512tn3Ad28QyzpZm5T12rP4k6rkOKPHM8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cCxqY9EWSrut8ZPGCnlpwTfCMfJnwKXxBMHUytRUbkUyG4PZFsZYQ5sT3xPCVZNZ0
	 vsYzOzPc+vDtMNqhikXzSb8QjbJpZN2wytZksOFiwTB0QwPQeK66PvCKDB5BCW3Fgf
	 HkT8XqPJXChmCpDYLSmjkCIRimanrEfN7ymS27XiRaqBu86U+62Jjif7ffc8a5gNHS
	 rQZhN6KTHwFu8hYr7MBIHKWznLlaQL9O9gg4KiJOFcWLOqR2Qk10rRgdW+CWzUXXS3
	 ZHAKL2wPBGQeZ0Ex1YkDZp+4FxvgdS9LjYr29LclGeGzFNtKdm0U/ukzf6V6aW6vFj
	 znncqj1jYn9tw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:35 +0100
Subject: [PATCH v6 16/16] firmware: arm_scmi: Fix transport device teardown
 lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-16-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
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

SCMI transport devices are deliberately excluded from normal SCMI bus
matching so protocol drivers cannot bind to the internal transport
children. However, scmi_device_destroy() uses the same protocol/name
lookup to find devices that must be unregistered during channel teardown.

Split the match helper so driver matching still skips transport devices,
while explicit child lookup can find them for teardown. Use a shared
transport-device name prefix macro for both matching and name generation.

Since transport-device names are derived from direction and protocol ID,
reject duplicate protocol channel setup before creating or finding a
transport device. This prevents malformed firmware with duplicate
protocol child nodes from reusing an existing transport device and then
destroying it when the duplicate IDR insertion fails.

Fixes: 9593804c44c2 ("firmware: arm_scmi: Exclude transport devices from bus matching")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c    | 22 +++++++++++++++++-----
 drivers/firmware/arm_scmi/common.h |  2 ++
 drivers/firmware/arm_scmi/driver.c |  5 ++++-
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index e1f66c08c81d..7f06d56e4905 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -200,21 +200,33 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 		scmi_protocol_device_unrequest(entry);
 }
 
-static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
-				      const struct scmi_device_id *id_table)
+static bool scmi_device_is_transport(const struct scmi_device *scmi_dev)
+{
+	return !strncmp(scmi_dev->name, SCMI_TRANSPORT_DEVNAME_PREFIX,
+			strlen(SCMI_TRANSPORT_DEVNAME_PREFIX));
+}
+
+static int __scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
+					const struct scmi_device_id *id_table,
+					bool skip_transport)
 {
 	if (!id_table || !id_table->name)
 		return 0;
 
-	/* Always skip transport devices from matching */
 	for (; id_table->protocol_id && id_table->name; id_table++)
 		if (id_table->protocol_id == scmi_dev->protocol_id &&
-		    strncmp(scmi_dev->name, "__scmi_transport_device", 23) &&
+		    !(skip_transport && scmi_device_is_transport(scmi_dev)) &&
 		    !strcmp(id_table->name, scmi_dev->name))
 			return 1;
 	return 0;
 }
 
+static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
+				      const struct scmi_device_id *id_table)
+{
+	return __scmi_dev_match_by_id_table(scmi_dev, id_table, true);
+}
+
 static int scmi_dev_match_id(struct scmi_device *scmi_dev,
 			     const struct scmi_driver *scmi_drv)
 {
@@ -234,7 +246,7 @@ static int scmi_match_by_id_table(struct device *dev, const void *data)
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 	const struct scmi_device_id *id_table = data;
 
-	return scmi_dev_match_by_id_table(scmi_dev, id_table);
+	return __scmi_dev_match_by_id_table(scmi_dev, id_table, false);
 }
 
 /* Returns a device_find_child() reference which must be dropped by caller. */
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index b9723c105fc1..fe8c22cfb9f7 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -34,6 +34,8 @@
 
 #define SCMI_SHMEM_MAX_PAYLOAD_SIZE	104
 
+#define SCMI_TRANSPORT_DEVNAME_PREFIX	"__scmi_transport_device"
+
 enum scmi_error_codes {
 	SCMI_SUCCESS = 0,	/* Success */
 	SCMI_ERR_SUPPORT = -1,	/* Not supported */
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 532f1f65b2ab..ef29fd223287 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2762,6 +2762,9 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	idx = tx ? 0 : 1;
 	idr = tx ? &info->tx_idr : &info->rx_idr;
 
+	if (idr_find(idr, prot_id))
+		return -EEXIST;
+
 	if (!info->desc->ops->chan_available(of_node, idx)) {
 		cinfo = idr_find(idr, SCMI_PROTOCOL_BASE);
 		if (unlikely(!cinfo)) /* Possible only if platform has no Rx */
@@ -2779,7 +2782,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	cinfo->no_completion_irq = info->desc->no_completion_irq;
 
 	/* Create a unique name for this transport device */
-	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
+	snprintf(name, sizeof(name), SCMI_TRANSPORT_DEVNAME_PREFIX "_%s_%02X",
 		 idx ? "rx" : "tx", prot_id);
 	/* Create a uniquely named, dedicated transport device for this chan */
 	tdev = scmi_device_create(of_node, info->dev, prot_id, name);

-- 
2.43.0


