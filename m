Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783E5C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTCUafdtosdR37NQvtP9EiPMhJXK/zMhX4xZ8wUPQZc=; b=glZkf+JrzG+qeaERZl7pQ9W3gf
	qrdFK7gNHmiBvUtgbr8/SvJ0A5FRty5zbH02doo4I9zzNlt0IftFxvej/E9G6jeNfVOLRESOrBrzA
	tU+42oCq9Gdv6mxaRwOrSdx8c6ow0ijVzD+iyJttYKLJCnl/BWqVS3Yvfm9iKD040FpPSB1KYowHE
	IAex22NSy6JjISh73Y8f1+Fy7JEnu22QVZ1PcmfWSTDLtu2MKHzyPMmg4KO0i9m9ZjPcFSoZvimdd
	zHNBFmFbiHh0CtBRefurn5Q28Ok48KICza6aenAKQ2Bn5iOZgxyK52/f6IRh9B0M8wrcmDE5XDkrx
	8YwxMwGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKg-00000002dZ4-3FLK;
	Fri, 04 Sep 2026 16:00:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKR-00000002cvI-0UK5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:59:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 26A656053B;
	Fri,  4 Sep 2026 15:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B2E1F00A3E;
	Fri,  4 Sep 2026 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537585;
	bh=hTCUafdtosdR37NQvtP9EiPMhJXK/zMhX4xZ8wUPQZc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dVh7N8afznP9HQNmTUuAkrqpvHRTJatZUtz1M+2EakkOSmRO+jjCQAUPa3TndD+e1
	 IKObpXGBZw4iGQ5Cn5h7FTp4TBvcvQKJjf59I8Im6npbuth5bpxRuieVXXbLxRHWfe
	 FrycMAT4uXG5+O2m/c2lPV3X35mwNzZQjsnJlg/cZJOq7PbIumQlssWPczghyBgbco
	 I4RQizdaUrG6ojz8m9zVakf1YKKeL7ehKd19wj6KQ21vMIpsJVTjBzq5jS+DKjzgdi
	 WtrPOvwfj98cbiusWYVu2ItVYPZac3IVVFE+uILsL1vO1oZZ6dlwITMgLsHV+hSy40
	 /XeFZ5LuXyq1A==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 04 Sep 2026 16:58:01 +0100
Subject: [PATCH v4 6/9] firmware: arm_scmi: Refactor protocol device
 creation logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi_scmi_pcc-v4-6-6ebe9755606e@kernel.org>
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

Move the protocol validation and device creation logic in scmi_probe()
into a reusable scmi_device_check_create() helper.

The helper centralizes checks for the protocol ID range, implementation
availability and duplicate activation before invoking
scmi_create_protocol_devices(). This preserves the existing behavior
while allowing the logic to be reused by the ACPI path, where protocol
child fwnodes are absent.

No functional change intended.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 59 ++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 4fbedd9be852..10e660da440c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3244,6 +3244,39 @@ static void scmi_enable_matching_quirks(struct scmi_info *info)
 			   rev->sub_vendor_id, rev->impl_ver);
 }
 
+static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
+				     struct scmi_info *info)
+{
+	int ret;
+	struct device *dev = info->dev;
+	struct scmi_handle *handle = &info->handle;
+
+	if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
+		dev_err(dev, "Out of range protocol %d\n", prot_id);
+		return;
+	}
+
+	if (!scmi_is_protocol_implemented(handle, prot_id)) {
+		dev_err(dev, "SCMI protocol %d not implemented\n", prot_id);
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
+	scmi_create_protocol_devices(fwnode_handle_get(fwnode), info, prot_id,
+				     NULL);
+}
+
 static int scmi_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -3373,31 +3406,7 @@ static int scmi_probe(struct platform_device *pdev)
 		if (fwnode_property_read_u32(child, "reg", &prot_id))
 			continue;
 
-		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
-			dev_err(dev, "Out of range protocol %d\n", prot_id);
-			continue;
-		}
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
-		scmi_create_protocol_devices(fwnode_handle_get(child), info,
-					     prot_id, NULL);
+		scmi_device_check_create(child, prot_id, info);
 	}
 
 	return 0;

-- 
2.43.0


