Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFD6EFB819
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LkBWz+K1nxLr/lBo/t63y5ciaH4V8V92AgZnhwFxGiA=; b=qTik0cpjQo31Jl93AgG6WA7Ptd
	R+MLG/X/7PL9mG1R8EVdX9AdvZLBgUnNWN3MhrunyRJ6wGgR2hyWCRizzoaGe1bXuhngW0UFmvEr3
	LuYl31X6ztxoo2gK6GoaHZu5SFsucXrudd2G0uFvkTTe+//BICq7tdW/ARKw5C9NS35asmN6mw512
	AHLttt7fubMfG/xAXNId3/3VoEVwcBrNoRx56fMGOKoNczmPWyeU0uSJc7OibYo/1h/z0MZnxlzGz
	ovdpcQdd4V9C4o2C63tev3pIYfUCGoXZ/h9N//Jh3lHm3/wn1a2rDf1DK73q3622TKmEc5kzembnm
	n8xc7ELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoF3-00000001h5i-19f7;
	Tue, 24 Feb 2026 08:58:05 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoEz-00000001h4R-3Hlh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 08:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=LkBWz+K1nxLr/l
	Bo/t63y5ciaH4V8V92AgZnhwFxGiA=; b=LiQO4QDAIPC7jcFmuXQdpS9cUIzzff
	rXWVlM9nR60bsKOnCkWjG0KnKQTqD81SwstkLHp6FEz3vYXFtiamSQVd5hgItMGq
	GV9+bJGPQ50+Ac4ldqd1/vlEg3Mj4E28u/nF02AdxtVuthUCsJE7ELD9+nntiQ7h
	d0HkE9X1UbIZxLn9T9E1VlZ9/bTfDL/nH/EjGWSGImvrCKh9VZ52v5gdOg2K2Rru
	LrZjemW/Q8ZwVyzT83Y5GQOkT/mcff8RaSRsEL4wIxcuq3mV1aJSsP7ogw/qBrbz
	l0XrVuhNFsQj8xLj9ahx68kzfmuU8AEKWck47h34E3GWLiq9ixsTjLgg==
Received: (qmail 175537 invoked from network); 24 Feb 2026 09:57:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Feb 2026 09:57:54 +0100
X-UD-Smtp-Session: l3s3148p1@Nso9FY5LUsUgAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [RFC PATCH] mailbox: remove superfluous internal header
Date: Tue, 24 Feb 2026 09:50:21 +0100
Message-ID: <20260224085720.18055-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_005802_692525_9AE4688D 
X-CRM114-Status: GOOD (  14.94  )
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

Quite some controller drivers use the defines from the internal header
already. This prevents controller drivers outside the mailbox directory.
Move the defines to the public controller header to allow this again as
the defines are not strictly internal anyhow.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I need this for a combined driver (mailbox + hwspinlock at least) which
probably ends up in drivers/soc. But it seems reasonable to me to do
this anyway. Locally build tested. Still waiting for buildbot results.
Opinions?

 drivers/mailbox/cix-mailbox.c      |  2 --
 drivers/mailbox/hi3660-mailbox.c   |  2 --
 drivers/mailbox/imx-mailbox.c      |  2 --
 drivers/mailbox/mailbox-sti.c      |  2 --
 drivers/mailbox/mailbox.c          |  2 --
 drivers/mailbox/mailbox.h          | 12 ------------
 drivers/mailbox/omap-mailbox.c     |  2 --
 drivers/mailbox/pcc.c              |  2 --
 drivers/mailbox/tegra-hsp.c        |  2 --
 include/linux/mailbox_controller.h |  5 +++++
 10 files changed, 5 insertions(+), 28 deletions(-)
 delete mode 100644 drivers/mailbox/mailbox.h

diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
index 443620e8ae37..864f98f21fc3 100644
--- a/drivers/mailbox/cix-mailbox.c
+++ b/drivers/mailbox/cix-mailbox.c
@@ -12,8 +12,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#include "mailbox.h"
-
 /*
  * The maximum transmission size is 32 words or 128 bytes.
  */
diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-mailbox.c
index 17c29e960fbf..9b727a2b54a5 100644
--- a/drivers/mailbox/hi3660-mailbox.c
+++ b/drivers/mailbox/hi3660-mailbox.c
@@ -15,8 +15,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include "mailbox.h"
-
 #define MBOX_CHAN_MAX			32
 
 #define MBOX_RX				0x0
diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 003f9236c35e..22331b579489 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -23,8 +23,6 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
-#include "mailbox.h"
-
 #define IMX_MU_CHANS		24
 /* TX0/RX0/RXDB[0-3] */
 #define IMX_MU_SCU_CHANS	6
diff --git a/drivers/mailbox/mailbox-sti.c b/drivers/mailbox/mailbox-sti.c
index b4b5bdd503cf..b6c9ecbbc8ec 100644
--- a/drivers/mailbox/mailbox-sti.c
+++ b/drivers/mailbox/mailbox-sti.c
@@ -21,8 +21,6 @@
 #include <linux/property.h>
 #include <linux/slab.h>
 
-#include "mailbox.h"
-
 #define STI_MBOX_INST_MAX	4      /* RAM saving: Max supported instances */
 #define STI_MBOX_CHAN_MAX	20     /* RAM saving: Max supported channels  */
 
diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index e63b2292ee7a..9d41a1ab9018 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -18,8 +18,6 @@
 #include <linux/property.h>
 #include <linux/spinlock.h>
 
-#include "mailbox.h"
-
 static LIST_HEAD(mbox_cons);
 static DEFINE_MUTEX(con_mutex);
 
diff --git a/drivers/mailbox/mailbox.h b/drivers/mailbox/mailbox.h
deleted file mode 100644
index e1ec4efab693..000000000000
--- a/drivers/mailbox/mailbox.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#ifndef __MAILBOX_H
-#define __MAILBOX_H
-
-#include <linux/bits.h>
-
-#define TXDONE_BY_IRQ	BIT(0) /* controller has remote RTR irq */
-#define TXDONE_BY_POLL	BIT(1) /* controller can read status of last TX */
-#define TXDONE_BY_ACK	BIT(2) /* S/W ACK received by Client ticks the TX */
-
-#endif /* __MAILBOX_H */
diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbox.c
index d9f100c18895..5772c6b9886a 100644
--- a/drivers/mailbox/omap-mailbox.c
+++ b/drivers/mailbox/omap-mailbox.c
@@ -22,8 +22,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/mailbox_controller.h>
 
-#include "mailbox.h"
-
 #define MAILBOX_REVISION		0x000
 #define MAILBOX_MESSAGE(m)		(0x040 + 4 * (m))
 #define MAILBOX_FIFOSTATUS(m)		(0x080 + 4 * (m))
diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index 22e70af1ae5d..636879ae1db7 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -59,8 +59,6 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <acpi/pcc.h>
 
-#include "mailbox.h"
-
 #define MBOX_IRQ_NAME		"pcc-mbox"
 
 /**
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index ed9a0bb2bcd8..2231050bb5a9 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -16,8 +16,6 @@
 
 #include <dt-bindings/mailbox/tegra186-hsp.h>
 
-#include "mailbox.h"
-
 #define HSP_INT_IE(x)		(0x100 + ((x) * 4))
 #define HSP_INT_IV		0x300
 #define HSP_INT_IR		0x304
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 80a427c7ca29..16fef421c30c 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -3,6 +3,7 @@
 #ifndef __MAILBOX_CONTROLLER_H
 #define __MAILBOX_CONTROLLER_H
 
+#include <linux/bits.h>
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/hrtimer.h>
@@ -11,6 +12,10 @@
 
 struct mbox_chan;
 
+#define TXDONE_BY_IRQ	BIT(0) /* controller has remote RTR irq */
+#define TXDONE_BY_POLL	BIT(1) /* controller can read status of last TX */
+#define TXDONE_BY_ACK	BIT(2) /* S/W ACK received by Client ticks the TX */
+
 /**
  * struct mbox_chan_ops - methods to control mailbox channels
  * @send_data:	The API asks the MBOX controller driver, in atomic
-- 
2.51.0


