Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035A6C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNopylHfZ9Mz3H0DNxb5zaJTipOuzTwGoRrYcebA7dI=; b=ywZl4qKRSmyJmoRVFCY8d/qPpV
	Sl7KhU+Y8U0z5YZitnGYuh9jvVt0CgsG2Eezn0sjD8LatuoHZdTaATJWAsPyq8bNGNK299y9CgdoN
	WJI3jYU/Q2/j/osvo22hK3gmkwwfs4Llr7Bylnkfh1euTKJxdhVBzVSUIwgqEahqQj1fcDJIvfrlA
	MAR6gIMmkxGrhgcJmI3DK4tOztr3nIAdwXnnwlMjEXZe5EgJNmf/fkJQyd9XXgQ2wE7guEHiBM8dh
	OtotrSdSky7aLBkuXfHJjjez8EfCahxBiS+Lnu5pSgxgy6fG6vZCGB6yGX2bYCtpCXLHSExiVl574
	JNHvTjgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTgx-00000000Ya2-2V4H;
	Thu, 13 Aug 2026 11:33:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTgr-00000000YUx-0xRc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 11:33:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AA1C2600B0;
	Thu, 13 Aug 2026 11:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859EF1F00A3D;
	Thu, 13 Aug 2026 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786620820;
	bh=lNopylHfZ9Mz3H0DNxb5zaJTipOuzTwGoRrYcebA7dI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kFAQcCJwWBJOuXAqbLvZjTw+2RVn/3/EefaRhjd78D3La6Ux5rxF4s3D4vX60O6vj
	 fCxsOx3XKBCdqD7UHjm4Zlf3LesfQfbdrW5GvEBJDeOurl5JJzYpM4C9dOUwUHrjt5
	 Ggiq7FbstYzPOpFyp0LP/q6VxZaq17e5+f0jjPGYBsQVuMaf621EykdwNPQuPQR2Mb
	 uOKLe2NG4bka1P4Xy3QGGG9FViUPi9d2gEDnqh+svWXfHTpJkY2inVwsjhUTLGstMD
	 DONCL3FfYR2f/OWCY5qTqbkWOipl9Tfnke5VfrqnlHSwlJBMD3meNbhnLULABdyCHy
	 NM3+9fqThSLTA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 13 Aug 2026 12:33:03 +0100
Subject: [PATCH v3 8/9] firmware: arm_scmi: Initialise known ACPI protocol
 devices and channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-acpi_scmi_pcc-v3-8-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>
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

Unlike Device Tree, the ACPI SCMI namespace device does not provide
child fwnodes to represent each protocol. Iterate over the non-BASE
entries in scmi_dsd_info_list to initialize their protocol devices and
transport channels. The BASE channel and device are handled by the
common setup path.

Let the transport channel-availability and SCMI protocol implementation
checks decide which of the known protocols are usable on the platform.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 951ba3df6ba6..45591c971c56 100644
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
 		dev_err(dev, "SCMI protocol %d not implemented\n",
 			prot_id);
 		return;
@@ -3280,7 +3297,7 @@ static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
 
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


