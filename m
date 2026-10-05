Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285B2CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16n94nUYvcbZLV31vzIlAiIN4TxVfADG8ToDHtsscB8=; b=eSxnam8uu30zG0oIKWpvwMK3oD
	4Ct2I9tmgTQkERgs+kyqvHCLwMLms5746syWcv6ZZ8xAhucsoe4MEblzHReKnje5qYhNQSSMVuBpH
	lNUpX0Rp18S34jrlaOJe76cxnsYMtp0O/BeKuQbVu7uOuUwzrq0c9oApDMabEOIlTjSbMN9Fqtd97
	5L86OvRTG24i9n15OXaNnq36+Nv0ISJk/tYFRvTvGL3j1NwStZmAr36mSkSYzvnz0Wz15rCveyyEa
	qMyvHPxr+kTnkGayj2Mqil0PaMzDGZVJUsnBIGAntvBBwIEqC8UpBi4MBJTZegFtE0+YTJ/bi8fBf
	XRD7B8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfNy-0000000G5LF-437l;
	Mon, 05 Oct 2026 09:53:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfNx-0000000G5Kd-0O5E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:53:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BA8B60A64;
	Mon,  5 Oct 2026 09:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04831F00899;
	Mon,  5 Oct 2026 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791194007;
	bh=16n94nUYvcbZLV31vzIlAiIN4TxVfADG8ToDHtsscB8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ge6XgwUykNH9aKYQ6Po4IKuo+pBXvnincVMSsx1EA3arZM4LDFt44BznQbrpjDakp
	 pUlCwnUPTcxosVVf+FLEtlpJoYs7ElG+FQBmGKp7f0uAy0r9cR/D5KHTekG04Gwxc1
	 VUwZdV1k8yiqaxidloVrtr1SiMMRxlvL8kXqNsPJMUyhE1D9ZiNRKig8v3OFMm2NvT
	 2HGHdqRCfV6u5xZbaelxci80B9jwtFzH07HSnshak0VgBpFEYbMEkMtCk8cq4bzOWl
	 a0NDI9WcKSaJCKv6SE2UhKVksr4vgTqbh+4781rDWFXZNEY7wOc90Vapo4YWE/9tf4
	 p+LXsL8YNy/rQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 05 Oct 2026 10:53:10 +0100
Subject: [PATCH v3 1/4] firmware: arm_scmi: Avoid protocol devices in
 exclusive raw mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-scmi_bus_fixes-v3-1-d9bada32ed38@kernel.org>
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

Since standard protocol devices are created without a driver request,
rejecting SCMI driver registration is no longer enough to prevent them
from appearing when raw mode is enabled without coexistence.

When raw-mode debugfs setup succeeds, scmi_probe() returns success
before protocol enumeration, so it does not normally create those
devices. That early return is not sufficient: scmi_device_create() is
exported and can be called later.

Skip protocol-device creation in exclusive raw mode, including named
non-transport requests. Keep named transport devices so raw mode can
still set up its channels. Share the raw-mode condition and transport
name check with the existing bus paths.

Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>
Fixes: aac4e67d6eb9 ("firmware: arm_scmi: Always create devices for standard protocols")
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95 EVK
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 25197197db8e..f2e2ed56bc32 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -36,6 +36,12 @@ struct scmi_requested_dev {
 /* Track globally the SCMI SystemPower protocol device. */
 static struct scmi_device *scmi_syspower_registered;
 
+static bool scmi_raw_mode_only(void)
+{
+	return IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT) &&
+	       !IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX);
+}
+
 /**
  * scmi_protocol_device_request  - Helper to request a device
  *
@@ -60,8 +66,7 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	pr_debug("Requesting SCMI device (%s) for protocol %x\n",
 		 id_table->name, id_table->protocol_id);
 
-	if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT) &&
-	    !IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX)) {
+	if (scmi_raw_mode_only()) {
 		pr_warn("SCMI Raw mode active. Rejecting '%s'/0x%02X\n",
 			id_table->name, id_table->protocol_id);
 		return -EINVAL;
@@ -210,12 +215,17 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 		scmi_protocol_device_unrequest(entry);
 }
 
-static bool scmi_device_is_transport(const struct scmi_device *scmi_dev)
+static bool scmi_device_name_is_transport(const char *name)
 {
-	return !strncmp(scmi_dev->name, SCMI_TRANSPORT_DEVNAME_PREFIX,
+	return !strncmp(name, SCMI_TRANSPORT_DEVNAME_PREFIX,
 			strlen(SCMI_TRANSPORT_DEVNAME_PREFIX));
 }
 
+static bool scmi_device_is_transport(const struct scmi_device *scmi_dev)
+{
+	return scmi_device_name_is_transport(scmi_dev->name);
+}
+
 static int __scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
 					const struct scmi_device_id *id_table,
 					bool skip_transport)
@@ -591,6 +601,11 @@ struct scmi_device *scmi_device_create(struct fwnode_handle *fwnode,
 	struct scmi_requested_dev *rdev;
 	struct scmi_device *sdev, *scmi_dev = NULL;
 
+	/* Exclusive raw mode still needs transport devices for its channels. */
+	if (scmi_raw_mode_only() &&
+	    (!name || !scmi_device_name_is_transport(name)))
+		return NULL;
+
 	if (name)
 		return _scmi_device_create(fwnode, parent, protocol, name);
 

-- 
2.43.0


