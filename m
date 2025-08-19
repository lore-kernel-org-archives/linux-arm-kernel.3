Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF798CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 22:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qf75CQPmS6Vgpu2bv+6a7KC69P8DBinE50c4UZCzCAE=; b=hpmG9JkTxDo1lNUxl1r9vf6RyY
	nd1wWQUOzLNSqGY8TONH8pP5scvHp/VM8YKoR3rcaGWaO+4+Ldy3oFz1vrBfu7f9N3IQmYvC8QzFV
	ZtrfWJafV1ch9jL/L+krTV+IKgCpi4GVfQkmB6ZTBfylaDVPjBtJOQWpgjcx6B9rHdp3Uoz297nlQ
	3q58tRTelWGbSvupFaZZEWOOMlk+MQqJOy0w84wsIJqEBhRyBCMBGLKZalWY3Jftj7rOJNS9iWSr3
	5CzYNZjeMcmeML2WgqVMIyp55If+00VgMilekkcgkTq0USCh2OSCqk6M5lM+ti2nxxB6lEVfr7xXj
	amYG7XPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV1t-0000000BkhL-03ss;
	Tue, 19 Aug 2025 22:42:09 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSQH-0000000BTk7-3Z4Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 19:55:11 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57JJt3fw3026446;
	Tue, 19 Aug 2025 14:55:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755633303;
	bh=qf75CQPmS6Vgpu2bv+6a7KC69P8DBinE50c4UZCzCAE=;
	h=From:To:CC:Subject:Date;
	b=WNqEmylXI/vfjj8iQPt8nHCge9EvKLNj1LTA2IRBy1WpD63DbtsCCfG3eliCkd7Rh
	 mQYsCosctFHGoYBFLh3L1TZsmFmlCQjHBagFTErk3kyAlchh/bBj6CSasfy2xlIGGr
	 nr2VOLXsGzyudzIMLgi0mSdwe5sCByHS/4XSip4c=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57JJt3KD637564
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 14:55:03 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 14:55:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 14:55:03 -0500
Received: from uda0506412.dhcp.ti.com (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57JJt3q43241995;
	Tue, 19 Aug 2025 14:55:03 -0500
From: Kendall Willis <k-willis@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ulf.hansson@linaro.org>, <d-gole@ti.com>, <vishalm@ti.com>,
        <sebin.francis@ti.com>, <msp@baylibre.com>, <khilman@baylibre.com>,
        <k-willis@ti.com>
Subject: [PATCH v4] firmware: ti_sci: Enable abort handling of entry to LPM
Date: Tue, 19 Aug 2025 14:54:53 -0500
Message-ID: <20250819195453.1094520-1-k-willis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_125509_976641_7024F217 
X-CRM114-Status: GOOD (  25.05  )
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

The PM co-processor (device manager or DM) adds the ability to abort
entry to a low power mode by clearing the mode selection in the
latest version of its firmware (11.01.09) [1].

Enable the ti_sci driver to support the LPM abort call which clears the
low power mode selection of the DM. This fixes an issue where failed
system suspend attempts would cause subsequent suspends to fail.

After system suspend completes, regardless of if system suspend succeeds
or fails, the ->complete() hook in TI SCI will be called. In the
->complete() hook, a message will be sent to the DM to clear the current
low power mode selection. Clearing the low power mode selection
unconditionally will not cause any error in the DM.

[1] https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html

Signed-off-by: Kendall Willis <k-willis@ti.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
---
Series has been tested on an SK-AM62B-P1 board. Normal suspend/resume
has been verified. Abort was tested by adding an error into the TI SCI
suspend hook.

Link to v3:
https://lore.kernel.org/all/20250709221619.2237699-1-k-willis@ti.com/
Link to v2:
https://lore.kernel.org/all/20250709205332.2235072-1-k-willis@ti.com/
Link to v1:
https://lore.kernel.org/all/20250627204821.1150459-1-k-willis@ti.com/

Changes from v3 to v4:
  - rebase on linux-next
  - reword commit message
  - change ti_sci_cmd_lpm_abort parameter to be the device pointer
  - remove setting ret to 0 when checking for failure in
    ti_sci_cmd_lpm_abort since ret is set to 0 by default
  - change ti_sci_complete() to ti_sci_pm_complete()
  - add firmware capability support for LPM abort
  - update debug message of detected firmware capabilities with
    LPM-Abort
  - check if the firmware has the capability for LPM abort functionality
    before calling ti_sci_cmd_lpm_abort
  - remove updated year in the ti_sci.h license

Changes from v2 to v3:
  - added links to previous series and the changes between them

Changes from v1 to v2:
   - rebase on linux-next
   - drop the following patch:
     pmdomain: ti_sci: Add LPM abort sequence to suspend path
   - remove lpm_abort from ti_sci_pm_ops
   - add ->complete() hook with ti_sci_cmd_lpm_abort to be called
     unconditionally within it
   - remove ti_sci_cmd_lpm_abort from the ->suspend() and
     ->suspend_noirq() hooks
   - reword commit message
---
 drivers/firmware/ti_sci.c | 57 +++++++++++++++++++++++++++++++++++++--
 drivers/firmware/ti_sci.h |  3 +++
 2 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index ae5fd1936ad32..49fd2ae01055d 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -2015,6 +2015,47 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	return ret;
 }
 
+/**
+ * ti_sci_cmd_lpm_abort() - Abort entry to LPM by clearing selection of LPM to enter
+ * @dev:	Device pointer corresponding to the SCI entity
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_lpm_abort(struct device *dev)
+{
+	struct ti_sci_info *info = dev_get_drvdata(dev);
+	struct ti_sci_msg_hdr *req;
+	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_xfer *xfer;
+	int ret = 0;
+
+	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_ABORT,
+				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+				   sizeof(*req), sizeof(*resp));
+	if (IS_ERR(xfer)) {
+		ret = PTR_ERR(xfer);
+		dev_err(dev, "Message alloc failed(%d)\n", ret);
+		return ret;
+	}
+	req = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
+
+	ret = ti_sci_do_xfer(info, xfer);
+	if (ret) {
+		dev_err(dev, "Mbox send fail %d\n", ret);
+		goto fail;
+	}
+
+	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
+
+	if (!ti_sci_is_response_ack(resp))
+		ret = -ENODEV;
+
+fail:
+	ti_sci_put_one_xfer(&info->minfo, xfer);
+
+	return ret;
+}
+
 static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 {
 	struct ti_sci_info *info;
@@ -3739,11 +3780,22 @@ static int __maybe_unused ti_sci_resume_noirq(struct device *dev)
 	return 0;
 }
 
+static void __maybe_unused ti_sci_pm_complete(struct device *dev)
+{
+	struct ti_sci_info *info = dev_get_drvdata(dev);
+
+	if (info->fw_caps & MSG_FLAG_CAPS_LPM_ABORT) {
+		if (ti_sci_cmd_lpm_abort(dev))
+			dev_err(dev, "LPM clear selection failed.\n");
+	}
+}
+
 static const struct dev_pm_ops ti_sci_pm_ops = {
 #ifdef CONFIG_PM_SLEEP
 	.suspend = ti_sci_suspend,
 	.suspend_noirq = ti_sci_suspend_noirq,
 	.resume_noirq = ti_sci_resume_noirq,
+	.complete = ti_sci_pm_complete,
 #endif
 };
 
@@ -3876,10 +3928,11 @@ static int ti_sci_probe(struct platform_device *pdev)
 	}
 
 	ti_sci_msg_cmd_query_fw_caps(&info->handle, &info->fw_caps);
-	dev_dbg(dev, "Detected firmware capabilities: %s%s%s\n",
+	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s\n",
 		info->fw_caps & MSG_FLAG_CAPS_GENERIC ? "Generic" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO ? " Partial-IO" : "",
-		info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED ? " DM-Managed" : ""
+		info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED ? " DM-Managed" : "",
+		info->fw_caps & MSG_FLAG_CAPS_LPM_ABORT ? " LPM-Abort" : ""
 	);
 
 	ti_sci_setup_ops(info);
diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
index 053387d7baa06..701c416b2e78f 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -42,6 +42,7 @@
 #define TI_SCI_MSG_SET_IO_ISOLATION	0x0307
 #define TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT	0x0309
 #define TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT	0x030A
+#define TI_SCI_MSG_LPM_ABORT	0x0311
 
 /* Resource Management Requests */
 #define TI_SCI_MSG_GET_RESOURCE_RANGE	0x1500
@@ -147,6 +148,7 @@ struct ti_sci_msg_req_reboot {
  *		MSG_FLAG_CAPS_GENERIC: Generic capability (LPM not supported)
  *		MSG_FLAG_CAPS_LPM_PARTIAL_IO: Partial IO in LPM
  *		MSG_FLAG_CAPS_LPM_DM_MANAGED: LPM can be managed by DM
+ *		MSG_FLAG_CAPS_LPM_ABORT: Abort entry to LPM
  *
  * Response to a generic message with message type TI_SCI_MSG_QUERY_FW_CAPS
  * providing currently available SOC/firmware capabilities. SoC that don't
@@ -157,6 +159,7 @@ struct ti_sci_msg_resp_query_fw_caps {
 #define MSG_FLAG_CAPS_GENERIC		TI_SCI_MSG_FLAG(0)
 #define MSG_FLAG_CAPS_LPM_PARTIAL_IO	TI_SCI_MSG_FLAG(4)
 #define MSG_FLAG_CAPS_LPM_DM_MANAGED	TI_SCI_MSG_FLAG(5)
+#define MSG_FLAG_CAPS_LPM_ABORT		TI_SCI_MSG_FLAG(9)
 #define MSG_MASK_CAPS_LPM		GENMASK_ULL(4, 1)
 	u64 fw_caps;
 } __packed;

base-commit: 886e5e7b0432360842303d587bb4a65d10741ae8
-- 
2.34.1


