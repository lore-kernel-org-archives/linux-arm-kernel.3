Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F8DCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 20:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtkVPG4of8mRnfj2/nA6E8m6WE6AcVbVcoO1Cac3Ypg=; b=yMK5prmLNgtGtOli3YCKg/4QFt
	TddlVKGV+8JKdo8PTjaRqdGgbxSE9lClNrvZq/PmWVoxCQDDPxck5+K4SU0qC1bTChjzgCOVhtFHS
	vsRXpyKdLWfkCOhjmgZsbpTtmelnKIoyk3OOx8E/9tnPyckit9c3sfxiVPARoqXqsoQtYE0Sa3AO9
	CvWgqGJQsefIShOw83rHTGU3jdrov+8EgYYrrci+NBhT1m//rlIyhJr26oqUE/QltfT/Rm2Mz7Q3K
	VLv4RI7Y/oCuBzICnFDqA9yy6XuU1Wj2bKr1e3ZLcsCKEPzQYI+qzbPHynxVMUfLKngYipIzTLZII
	+p/gXsaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRcAS-00000000Rc9-2kGZ;
	Mon, 25 May 2026 20:44:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRc9w-00000000RKM-1ziD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 20:44:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E5E3460018;
	Mon, 25 May 2026 20:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F041F00A3A;
	Mon, 25 May 2026 20:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741863;
	bh=TtkVPG4of8mRnfj2/nA6E8m6WE6AcVbVcoO1Cac3Ypg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XLr/3Ih/OXVBShrWWSTFB9XlwNwzO5ewHyBpxcKE8KAZpdv7zQJyhD1n01VTByJLF
	 3hZJUkVUZrSZ/cZ/nhWtdXf+Fhdorq4LCxpggx+pYk1Q/ngu1pV+hGIHxgW716kNRU
	 hu0zvv0iK7RqNPCeJ0oz996B/fU2GYxszqD82/puNWttBrgbDyq3a8I+e6Z/Hl4xh0
	 Q3UYgmgV9y3e79JAtsIRZ8PYsIxAevRPRrKX7qOgJEhDCtWERvh1vMrRU0M9wD1VPF
	 OZmGxHnbFrr/5Y01hSt+Z65qcufZSz5i6YL4e7neQscOo0oG/EMtdfYCL0r4DKgr94
	 t3s5sICBFmcNg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 25 May 2026 21:42:45 +0100
Subject: [PATCH v2 7/9] firmware: arm_scmi: Refactor protocol device
 creation logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpi_scmi_pcc-v2-7-4f38938d08d8@arm.com>
References: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
In-Reply-To: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
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

Refactor the protocol validation and device creation logic in
scmi_probe() into a new helper function, scmi_device_check_create(),
to improve readability and reduce code duplication.

The new helper consolidates checks for protocol ID range, implementation
availability, and duplicate activation, before invoking
scmi_create_protocol_devices(). This refactor simplifies the SCMI probe
path while preserving existing behavior.

No functional changes intended. This refactoring is required to enable
ACPI PCC transport.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 56 ++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 02f14167c918..47f13409dfeb 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3181,6 +3181,38 @@ static void scmi_enable_matching_quirks(struct scmi_info *info)
 			   rev->sub_vendor_id, rev->impl_ver);
 }
 
+static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
+				     struct scmi_info *info)
+{
+	int ret;
+	struct device *dev = info->dev;
+	struct scmi_handle *handle = &info->handle;
+
+	if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
+		dev_err(dev, "Out of range protocol %d\n", prot_id);
+
+	if (!scmi_is_protocol_implemented(handle, prot_id)) {
+		dev_err(dev, "SCMI protocol %d not implemented\n",
+			prot_id);
+		return;
+	}
+
+	/*
+	 * Save this valid fwnode protocol descriptor amongst
+	 * @active_protocols for this SCMI instance.
+	 */
+	ret = idr_alloc(&info->active_protocols, fwnode,
+			prot_id, prot_id + 1, GFP_KERNEL);
+	if (ret != prot_id) {
+		dev_err(dev, "SCMI protocol %d already activated. Skip\n",
+			prot_id);
+		return;
+	}
+
+	fwnode_handle_get(fwnode);
+	scmi_create_protocol_devices(fwnode, info, prot_id, NULL);
+}
+
 static int scmi_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -3309,29 +3341,7 @@ static int scmi_probe(struct platform_device *pdev)
 		if (fwnode_property_read_u32(child, "reg", &prot_id))
 			continue;
 
-		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
-			dev_err(dev, "Out of range protocol %d\n", prot_id);
-
-		if (!scmi_is_protocol_implemented(handle, prot_id)) {
-			dev_err(dev, "SCMI protocol %d not implemented\n",
-				prot_id);
-			continue;
-		}
-
-		/*
-		 * Save this valid fwnode protocol descriptor amongst
-		 * @active_protocols for this SCMI instance.
-		 */
-		ret = idr_alloc(&info->active_protocols, child,
-				prot_id, prot_id + 1, GFP_KERNEL);
-		if (ret != prot_id) {
-			dev_err(dev, "SCMI protocol %d already activated. Skip\n",
-				prot_id);
-			continue;
-		}
-
-		fwnode_handle_get(child);
-		scmi_create_protocol_devices(child, info, prot_id, NULL);
+		scmi_device_check_create(child, prot_id, info);
 	}
 
 	return 0;

-- 
2.43.0


