Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400F0FCE07F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 13:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ktnmO6XeeUgTpHk52L20DFW17XZCZsUQe31fXi72g8=; b=glBzJweFx0n8FLVMHu8Md+Zsm/
	K1y5oqqCFZ9BjtHdXOnJLE1CYdC14Yxc/fhmyDFKDnZkty0JN8i/2yno+vltqjyWLKhTw98Bwdol8
	LeCmCzxHyuyvQj8XpQgAORmfpA2wK4PY4z8NBmF383HNrzAje2Rgi3zw9uvsgvhfzlFtjUrMy61Xr
	+GFRtntdYFZuFioue/7ihhYw8Iast/YYhuz1deEonergBbTnRb4Q7cM3o2hmtKrKG9uoshmexY989
	Bu4R4vSLfCCtopEvu5VtrZ9Ax920jn+Fo3pMgQHCsiPjKfdGuOryJNv5pOHfGnEjsGgdytO8cJa3G
	O8cJycnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbcD-00000006Ezg-17qw;
	Thu, 26 Feb 2026 13:41:17 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbc2-00000006EpO-0MV0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 13:41:09 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9980D2014FB;
	Thu, 26 Feb 2026 14:41:04 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8C9952005B7;
	Thu, 26 Feb 2026 14:41:04 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D65BA2035B;
	Thu, 26 Feb 2026 14:41:02 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Thu, 26 Feb 2026 15:40:45 +0200
Subject: [PATCH 6/9] accel/neutron: Add mailbox support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-neutron-v1-6-46eccb3bb50a@nxp.com>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
In-Reply-To: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772113256; l=4796;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=Jty6B0ytRRom/v7JJudk9QB5erW8GFmasf1vl2KeMcs=;
 b=knwxwSZo92Y/ebknfNXmi9yLBr7eb8/1HCXPEScLpQ6wM5aaZLAAtYJu/wZLqRyi+1MStjbEc
 grMwI3JbDuyBCUE5VQW/aFoLGvspo9gHCKoeBei1j8yMwK3pmkMliCi
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_054108_720051_D44B7C1E 
X-CRM114-Status: GOOD (  17.14  )
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

The driver communicates with the Neutron firmware via eight
register-backed mailboxes. A subset of the mailbox registers are
used to pass commands from driver to Neutron, while the rest are
written by Neutron firmware with status/ack info.

Signed-off-by: Jiwei Fu <jiwei.fu@nxp.com>
Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
 drivers/accel/neutron/Makefile          |  3 ++-
 drivers/accel/neutron/neutron_device.c  |  4 +++
 drivers/accel/neutron/neutron_mailbox.c | 47 +++++++++++++++++++++++++++++++++
 drivers/accel/neutron/neutron_mailbox.h | 42 +++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/neutron/Makefile b/drivers/accel/neutron/Makefile
index d4298c7a8535..192ed896a9f9 100644
--- a/drivers/accel/neutron/Makefile
+++ b/drivers/accel/neutron/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_NXP_NEUTRON) := neutron.o
 neutron-y := \
 	neutron_driver.o \
 	neutron_device.o \
-	neutron_gem.o
+	neutron_gem.o \
+	neutron_mailbox.o
diff --git a/drivers/accel/neutron/neutron_device.c b/drivers/accel/neutron/neutron_device.c
index 61b3c96b4996..e5c09105be99 100644
--- a/drivers/accel/neutron/neutron_device.c
+++ b/drivers/accel/neutron/neutron_device.c
@@ -7,6 +7,7 @@
 #include <linux/iopoll.h>
 
 #include "neutron_device.h"
+#include "neutron_mailbox.h"
 
 void neutron_enable_irq(struct neutron_device *ndev)
 {
@@ -148,6 +149,9 @@ int neutron_boot(struct neutron_device *ndev)
 	if (ret)
 		return ret;
 
+	/* Prepare device to receive jobs */
+	neutron_mbox_reset_state(ndev);
+
 	ndev->flags |= NEUTRON_BOOTED;
 
 	return 0;
diff --git a/drivers/accel/neutron/neutron_mailbox.c b/drivers/accel/neutron/neutron_mailbox.c
new file mode 100644
index 000000000000..327ef2e8081d
--- /dev/null
+++ b/drivers/accel/neutron/neutron_mailbox.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright 2023, 2025-2026 NXP */
+
+#include <linux/iopoll.h>
+
+#include "neutron_device.h"
+#include "neutron_mailbox.h"
+
+#define NEUTRON_MBOX_FW_STATUS(dev)	NEUTRON_REG(dev, MBOX0)
+#define NEUTRON_MBOX_FW_ERRCODE(dev)	NEUTRON_REG(dev, MBOX1)
+#define NEUTRON_MBOX_CMD_ID(dev)	NEUTRON_REG(dev, MBOX3)
+#define NEUTRON_MBOX_CMD_ARG_BASE(dev)	NEUTRON_REG(dev, MBOX4)
+#define NEUTRON_MBOX_CMD_ARG(dev, i)	(NEUTRON_MBOX_CMD_ARG_BASE(dev) + (i) * 4)
+
+int neutron_mbox_send_cmd(struct neutron_device *ndev, struct neutron_mbox_cmd *cmd)
+{
+	u32 status;
+	int i;
+
+	/* Make sure Neutron is ready to receive commands */
+	status = readl_relaxed(NEUTRON_MBOX_FW_STATUS(ndev));
+	if (status != NEUTRON_FW_STATUS_RESET)
+		return -EBUSY;
+
+	for (i = 0; i < NEUTRON_MBOX_MAX_CMD_ARGS; i++)
+		writel_relaxed(cmd->args[i], NEUTRON_MBOX_CMD_ARG(ndev, i));
+	writel(cmd->id, NEUTRON_MBOX_CMD_ID(ndev));
+
+	return 0;
+}
+
+int neutron_mbox_reset_state(struct neutron_device *ndev)
+{
+	u32 status;
+
+	writel_relaxed(NEUTRON_CMD_RESET_STATE, NEUTRON_MBOX_CMD_ID(ndev));
+
+	return readl_poll_timeout(NEUTRON_MBOX_FW_STATUS(ndev), status,
+				  status == NEUTRON_FW_STATUS_RESET,
+				  100, 100 * USEC_PER_MSEC);
+}
+
+void neutron_mbox_read_state(struct neutron_device *ndev, struct neutron_mbox_state *state)
+{
+	state->status = readl_relaxed(NEUTRON_MBOX_FW_STATUS(ndev));
+	state->err_code = readl_relaxed(NEUTRON_MBOX_FW_ERRCODE(ndev));
+}
diff --git a/drivers/accel/neutron/neutron_mailbox.h b/drivers/accel/neutron/neutron_mailbox.h
new file mode 100644
index 000000000000..4fe40a2f6a0c
--- /dev/null
+++ b/drivers/accel/neutron/neutron_mailbox.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright 2023, 2025-2026 NXP */
+
+#ifndef __NEUTRON_MAILBOX_H__
+#define __NEUTRON_MAILBOX_H__
+
+#include <linux/types.h>
+
+struct neutron_device;
+
+/* Device (firmware) status magic values */
+enum neutron_mbox_fwstat {
+	NEUTRON_FW_STATUS_RESET		= 0,
+	NEUTRON_FW_STATUS_ACK		= 0xA3,
+	NEUTRON_FW_STATUS_DONE		= 0xAD0,
+};
+
+/* Firmware command opcodes */
+enum neutron_mbox_cmdid {
+	NEUTRON_CMD_INFERENCE		= 0x269,
+	NEUTRON_CMD_RESET_STATE		= 0x23637,
+};
+
+#define NEUTRON_MBOX_MAX_CMD_ARGS	4
+
+/* Firmware command */
+struct neutron_mbox_cmd {
+	enum neutron_mbox_cmdid id;
+	u32 args[NEUTRON_MBOX_MAX_CMD_ARGS];
+};
+
+/* Device state */
+struct neutron_mbox_state {
+	enum neutron_mbox_fwstat status;
+	u32 err_code;
+};
+
+int neutron_mbox_send_cmd(struct neutron_device *ndev, struct neutron_mbox_cmd *cmd);
+void neutron_mbox_read_state(struct neutron_device *ndev, struct neutron_mbox_state *state);
+int neutron_mbox_reset_state(struct neutron_device *ndev);
+
+#endif /* __NEUTRON_MAILBOX_H__ */

-- 
2.34.1


