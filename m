Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480A1CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16n94nUYvcbZLV31vzIlAiIN4TxVfADG8ToDHtsscB8=; b=CYwKMBM/ZRPEgnodm9Mid2WqEK
	lcwSYg0awKj+IeC8O9gy/77ko1IUJVzGi4fnwkEuLjLD88VgZkqCaksQiHr/UbVY7t7qITIPKOewi
	O3Deqg/j3j5vt5cmy8IVP8N+EsHxOJ8AhBhTvzQ84GfPA5kwwi5pY6y60FHMNdkP8PTqG7DW+fLVt
	cheruf3t4HffcaggvO3Azyog+ISJPyiZyaWGBgK7VInrRvd0Y6oCvw7t0ajRS8cZ5pg/OBG9kiARh
	eH0H53EZhoOgQo8fXa0KFQsZcCT8hXXFia4LgQ8Xk8VlQDSIO97Ep9WwEqdpMaA/U6RaPx1kA9x+O
	uHp2jX4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeev-0000000Fvni-2cIa;
	Mon, 05 Oct 2026 09:06:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeet-0000000Fvmk-30Qm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:06:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F03EA60235;
	Mon,  5 Oct 2026 09:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604EC1F000FF;
	Mon,  5 Oct 2026 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791191214;
	bh=16n94nUYvcbZLV31vzIlAiIN4TxVfADG8ToDHtsscB8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KnaA65Jhvg7gL4Wx4MErzEzjUOOxIccacYr2g1qgir0itF1CJO3MsISY4E/yYvg2w
	 hbhXsNLgiyX/57uXsPIynO2frc4KCnz58PmxFfZGRMv8J8DCtrPCmW3zP3aKatr0bL
	 ei3gsTjBCplbiTa0AsaH+WkgFSF4xwLFrHzUQpa+VlV9LgOHxi7f6U1LrRa++uZ9YB
	 e+E4M2Jz+UaCharqnM5basbvqKrkSjQIoy8Qb8M9s1uKc1IBfQBIx284x+URLwLupQ
	 8CLpEpT5HIam2XELNejuKHBsfflXUOTr0a9OpGG0KOFOkkJB8DqknOqSBpnryB5Lfa
	 RL9Gndb5vIMVA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 05 Oct 2026 10:04:32 +0100
Subject: [PATCH v2 1/4] firmware: arm_scmi: Avoid protocol devices in
 exclusive raw mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-scmi_bus_fixes-v2-1-34a51338875a@kernel.org>
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


