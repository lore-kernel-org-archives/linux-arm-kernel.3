Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05365C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bYUbaRO9Ahl1mhwaZ0sPLIbJfMrA4K43hbFBF+CdxM=; b=FA0pOsvJ+kBJHXG4Q67yalImqb
	2vRcBkZ91RjVqBPnzpzDB6Vn31UiNils04bsYP43EJic/GHFfnKe3gYNQ6j52X5DVSuFL7JKNWTDw
	l8ra7GsBoGy6Qu41HpiflfeI4DGyeYSz8plMcEmfuQUfDdTB5oLQVLgR4q03kFCr/oUEwONv/GLou
	vSyGqClTqSNAd6mSk8zouX84u+pmz+1biqwV00GuAz5VVzm4eDLb/DD7Kw+00al/ALwYkl3NbZ9oN
	zrPXWSUEAzAcEMlB/W/Y8iNnuBrGQYPD4NNNEQrXPU51dVTF9V/5iSiVAqvphW1edA8hFZOZyDfPf
	Udu7IYtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKp-00000002drE-1b3b;
	Fri, 04 Sep 2026 16:00:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKT-00000002d0o-11Rh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:59:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B00160214;
	Fri,  4 Sep 2026 15:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821091F00A3E;
	Fri,  4 Sep 2026 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537588;
	bh=2bYUbaRO9Ahl1mhwaZ0sPLIbJfMrA4K43hbFBF+CdxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oVcuQX+lyTVCS19xSWICAMUfu7vcycCdwm4ACmOAo2WOP36pyEVsMk5aL/iUYWWyP
	 qJ1It4GQF/dWOU51tjZfx5YO0o1uuNJozwXz9ur2SaeUusgOIh/6DuvwqXPm1fdK9g
	 rMiBo6Ndi5WKOPZoeOZ2O9XZLRKFRRMT/HEbM0zWJeEWGqlz4j4PpLI1SxU+SXeKul
	 kcHZnnzm375434Ft4m8lG2aWc1OL7PKOJF4B0lUStZt3f5Lwni2dPMxHUN091IJ3YK
	 l1vA9nGTsNYD0Q/4w5BXE6decK/xmW8t1jqXuc8dDdQXUejie+N5+zjXwXWRPAzGzO
	 sm/+2V04VzORQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 04 Sep 2026 16:58:03 +0100
Subject: [PATCH v4 8/9] firmware: arm_scmi: Initialise known ACPI protocol
 devices and channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi_scmi_pcc-v4-8-6ebe9755606e@kernel.org>
References: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
In-Reply-To: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
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

Unlike Device Tree, the ACPI SCMI namespace device does not provide
child fwnodes to represent each protocol. Iterate over the non-BASE
entries in scmi_dsd_info_list to initialize their protocol devices and
transport channels. The BASE channel and device are handled by the
common setup path.

Let the transport channel-availability and SCMI protocol implementation
checks decide which of the known protocols are usable on the platform.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 10e660da440c..01117c21805d 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2873,7 +2873,7 @@ scmi_txrx_setup(struct scmi_info *info, struct fwnode_handle *fwnode,
  */
 static int scmi_channels_setup(struct scmi_info *info)
 {
-	int ret;
+	int ret, idx;
 	struct fwnode_handle *fwnode = dev_fwnode(info->dev);
 
 	/* Initialize a common generic channel at first */
@@ -2898,6 +2898,20 @@ static int scmi_channels_setup(struct scmi_info *info)
 			return ret;
 	}
 
+	if (!is_acpi_node(fwnode))
+		return 0;
+
+	for (idx = 0; idx < ARRAY_SIZE(scmi_dsd_info_list); idx++) {
+		int prot_id = scmi_dsd_info_list[idx].protocol_id;
+
+		if (prot_id == SCMI_PROTOCOL_BASE)
+			continue;
+
+		ret = scmi_txrx_setup(info, fwnode, prot_id);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -3245,7 +3259,7 @@ static void scmi_enable_matching_quirks(struct scmi_info *info)
 }
 
 static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
-				     struct scmi_info *info)
+				     struct scmi_info *info, bool report_missing)
 {
 	int ret;
 	struct device *dev = info->dev;
@@ -3257,6 +3271,9 @@ static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
 	}
 
 	if (!scmi_is_protocol_implemented(handle, prot_id)) {
+		if (!report_missing)
+			return;
+
 		dev_err(dev, "SCMI protocol %d not implemented\n", prot_id);
 		return;
 	}
@@ -3279,7 +3296,7 @@ static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
 
 static int scmi_probe(struct platform_device *pdev)
 {
-	int ret;
+	int ret, idx;
 	char *err_str = "probe failure\n";
 	struct scmi_handle *handle;
 	const struct scmi_desc *desc;
@@ -3406,7 +3423,19 @@ static int scmi_probe(struct platform_device *pdev)
 		if (fwnode_property_read_u32(child, "reg", &prot_id))
 			continue;
 
-		scmi_device_check_create(child, prot_id, info);
+		scmi_device_check_create(child, prot_id, info, true);
+	}
+
+	if (!is_acpi_node(dev_fwnode(dev)))
+		return 0;
+
+	for (idx = 0; idx < ARRAY_SIZE(scmi_dsd_info_list); idx++) {
+		int prot_id = scmi_dsd_info_list[idx].protocol_id;
+
+		if (prot_id == SCMI_PROTOCOL_BASE)
+			continue;
+
+		scmi_device_check_create(dev_fwnode(dev), prot_id, info, false);
 	}
 
 	return 0;

-- 
2.43.0


