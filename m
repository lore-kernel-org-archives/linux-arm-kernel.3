Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8FCC83F18
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 23:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JIbyMx4pUQJaQizBCeoW8CblQcIuSEi6aEA0o/7zXuo=; b=YKnmUz2KUMvv8ap6nHokZhVqXY
	+KVMPzrRQ4Qva2BwoV+Yoyi0h2OP+V6eU2j1TYLZz/3MOC7HlUf2cTlupCIW00kmLP1+OVypZmsDS
	6gQVLfE58QmTvIihKG/NRsM8gjQKGBekakUPKcOEhqZy9f2j4aJXZzPz3/t241ytc7F5KHkmnk4MU
	cx7GjlV21R9BIWBdXVkzJi3PWTw1AzmWaRuqC057Vi/yeN/Y5fxMDFXSSrsozlPOH17MknAMnMSQ8
	P8wXFAXHqf3SvkhoVYY+svyZIr/nIWc+vcwhsMZKyP852S6nY1tpkk7SkK1SwOTyosCF+GVIj6TaW
	rmD3YCHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZegp-0000000AHQH-36X9;
	Wed, 09 Jul 2025 23:59:03 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZd5W-0000000A3TM-22WR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 22:16:28 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569MGKFP1326375;
	Wed, 9 Jul 2025 17:16:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752099380;
	bh=JIbyMx4pUQJaQizBCeoW8CblQcIuSEi6aEA0o/7zXuo=;
	h=From:To:CC:Subject:Date;
	b=U8KtgA7f0G7/Q5k60eGmmtYwDl/dSwlZeQt7UoYwuDwgLDO2fv4ctxpiOIX2KqO3F
	 mVYDjZZJ9NqtZQJP8uCH9N2w6CjEDY5dtRyADMVEU+5cDbIlAGOwoNS3p++sK0pR/m
	 sFykixi1k3aX3DmGfA0RuSDl0VHwJAuvynKW7Qww=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569MGKxe555986
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 17:16:20 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 17:16:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 17:16:19 -0500
Received: from uda0506412.dhcp.ti.com (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569MGJuI207024;
	Wed, 9 Jul 2025 17:16:19 -0500
From: Kendall Willis <k-willis@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ulf.hansson@linaro.org>, <vigneshr@ti.com>, <d-gole@ti.com>,
        <vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
        <khilman@baylibre.com>, <k-willis@ti.com>
Subject: [PATCH v3] firmware: ti_sci: Enable abort handling of entry to LPM
Date: Wed, 9 Jul 2025 17:16:19 -0500
Message-ID: <20250709221619.2237699-1-k-willis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_151626_656541_77892BEF 
X-CRM114-Status: GOOD (  26.57  )
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
latest version of its firmware (11.x). The following power management
operation defined in the TISCI Low Power Mode API [1] is implemented to
enable aborting entry to LPM:

TISCI_MSG_LPM_ABORT
Abort the current low power mode entry by clearing the current mode
selection.

Introduce LPM abort call that enables the ti_sci driver to support abort
by clearing the low power mode selection of the DM. This fixes behavior
from the DM where if system suspend failed, the next time system suspend
is entered, it will fail because DM did not have the low power mode
selection cleared. Instead of this behavior, the low power mode selection
will be cleared after Linux resume which will allow subsequent system
suspends to work correctly.

When Linux suspends, the TI SCI ->suspend() call will send a prepare_sleep
message to the DM. The DM will choose what low power mode to enter once
Linux is suspended based on constraints given by devices in the TI SCI PM
domain. After system suspend completes, regardless of if system suspend
succeeds or fails, the ->complete() hook in TI SCI will be called. In the
->complete() hook, a message will be sent to the DM to clear the current
low power mode selection. This is necessary because if suspend fails, the
low power mode selection in the DM is not cleared and the next system
suspend will fail due to the low power mode not having been cleared from
the previous failed system suspend.

Clearing the mode selection unconditionally acts as a cleanup from sending
the prepare_sleep message in ->suspend(). The DM already clears the low
power selection automatically when resuming from system suspend. If
suspend/resume executed without failure, clearing the low power mode
selection will not cause an error in the DM.

The flow for the abort sequence is the following:
   1. User sends a command to enter sleep
   2. Linux starts to suspend drivers
   3. TI SCI suspends and sends prepare_sleep message to DM
   4. A driver fails to suspend
   5. Linux resumes the drivers that have already suspended
   6. Linux sends DM to clear the current low power mode selection from
      TI SCI ->complete() hook
   7. DM aborts LPM entry by clearing the current mode selection
   8. Linux works as normal

[1] https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
Series has been tested on an SK-AM62B-P1 board. Normal suspend/resume
has been verified. Abort was tested by adding an error into the TI SCI
suspend hook.

Link to v2:
https://lore.kernel.org/all/20250709205332.2235072-1-k-willis@ti.com/
Link to v1:
https://lore.kernel.org/all/20250627204821.1150459-1-k-willis@ti.com/

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
 drivers/firmware/ti_sci.c | 61 +++++++++++++++++++++++++++++++++++++++
 drivers/firmware/ti_sci.h |  3 +-
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index ae5fd1936ad32..63c405f7037f0 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -2015,6 +2015,58 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	return ret;
 }
 
+/**
+ * ti_sci_cmd_lpm_abort() - Abort entry to LPM by clearing selection of LPM to enter
+ * @handle:     pointer to TI SCI handle
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_lpm_abort(const struct ti_sci_handle *handle)
+{
+	struct ti_sci_info *info;
+	struct ti_sci_msg_hdr *req;
+	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_xfer *xfer;
+	struct device *dev;
+	int ret = 0;
+
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+	if (!handle)
+		return -EINVAL;
+
+	info = handle_to_ti_sci_info(handle);
+	dev = info->dev;
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
+	else
+		ret = 0;
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
@@ -3739,11 +3791,20 @@ static int __maybe_unused ti_sci_resume_noirq(struct device *dev)
 	return 0;
 }
 
+static void __maybe_unused ti_sci_complete(struct device *dev)
+{
+	struct ti_sci_info *info = dev_get_drvdata(dev);
+
+	if (ti_sci_cmd_lpm_abort(&info->handle))
+		dev_err(dev, "LPM clear selection failed.\n");
+}
+
 static const struct dev_pm_ops ti_sci_pm_ops = {
 #ifdef CONFIG_PM_SLEEP
 	.suspend = ti_sci_suspend,
 	.suspend_noirq = ti_sci_suspend_noirq,
 	.resume_noirq = ti_sci_resume_noirq,
+	.complete = ti_sci_complete,
 #endif
 };
 
diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
index 053387d7baa06..51d77f90a32cc 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -6,7 +6,7 @@
  * The system works in a message response protocol
  * See: https://software-dl.ti.com/tisci/esd/latest/index.html for details
  *
- * Copyright (C)  2015-2024 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C)  2015-2025 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #ifndef __TI_SCI_H
@@ -42,6 +42,7 @@
 #define TI_SCI_MSG_SET_IO_ISOLATION	0x0307
 #define TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT	0x0309
 #define TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT	0x030A
+#define TI_SCI_MSG_LPM_ABORT	0x0311
 
 /* Resource Management Requests */
 #define TI_SCI_MSG_GET_RESOURCE_RANGE	0x1500

base-commit: 835244aba90de290b4b0b1fa92b6734f3ee7b3d9
-- 
2.34.1


