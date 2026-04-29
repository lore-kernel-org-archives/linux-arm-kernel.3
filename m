Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFA8FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 14:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDRQb+QnHGVfwEG1zBdLMNsdJxlphFAwaSlCFSCZhrg=; b=RaHQpxcH/Tvh2310vXZMDHDAtE
	Y+DVDcZnI5dKyUbYIilfayw0jmkZo1rMC235sXcrCk0y7piA1UfuYiyJGMZVH6TwIAnxZENodR4R5
	z0TMiV37gr0AHC6EOgUjlc96zljIbhP2dQ1dCYS6tqGzbtsEaU3l2hYWBWyYr95uinUjCDSPgpzzi
	tCRK4oJCz1v8+1AY1epZZdHRvauleCMOZc+uVBHEnbewIPQ1cj68YX7F+z7dxM8kBiBPOn2LCQcRz
	3I10d2YJefyClVFXKCtFfvwB3QWewZc/s1By9N/JR3dyfLdesHyG3HxuQuLHuD6OwUTnQEKt9BJEp
	csjB2iWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5gj-00000003jvP-0m4S;
	Wed, 29 Apr 2026 14:14:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5gf-00000003jtX-3KnN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 14:14:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A38BF339A;
	Wed, 29 Apr 2026 07:14:42 -0700 (PDT)
Received: from e142021.munich.arm.com (e142021.arm.com [10.41.150.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7FBE3F62B;
	Wed, 29 Apr 2026 07:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777472088; bh=ldZxzTWch59z/RFKGiQvciyVzcz7OzfESYVbo05g5xY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ndB+3V7S4WoE8Rkx/M7wS3GiZuV2lSZuZHWKGj3wR8pjias/plvjoNqkVDMugSL2a
	 ASOCOB0FC4YTW6JNJL7Y5NYYMRV7hUrx0nc/ZCBdcLSZDhw+jZDgCz9EfLp9RyvG03
	 jdojs2YT0iqY0uqbp3+nE2L3kkrk/9GcMi7NYNMs=
From: Andre Przywara <andre.przywara@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm_mpam: add MPAM-Fb MSC firmware access support
Date: Wed, 29 Apr 2026 16:13:37 +0200
Message-ID: <20260429141339.3171205-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429141339.3171205-1-andre.przywara@arm.com>
References: <20260429141339.3171205-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_071449_926449_9A655619 
X-CRM114-Status: GOOD (  29.85  )
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

The Arm MPAM Firmware-backed (Fb) Profile document[1] describes an
alternative way of accessing the "Memory System Components" (MSC) in an
MPAM enabled system.
Normally the MSCs are MMIO mapped, but in some implementations this
might not be possible (MSC located outside of the local socket, MSC
mapped secure-only) or desirable (direct MMIO access too slow or needs
to be mediated through a control processor). MPAM-fb standardises a
protocol to abstract MSC accesses, building on the SCMI protocol.

Add functions that do an MSC read or write access by redirecting the
request through a firmware interface. For now this done via an ACPI
PCC shared memory and mailbox combination.

Since the protocol used is only a small subset of the full SCMI spec,
and the SCMI protocol has no full ACPI support anyway, open-code the
SCMI message generation and handshake, for just the fields we need.

[1] https://developer.arm.com/documentation/den0144/latest

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/Makefile        |   2 +-
 drivers/resctrl/mpam_devices.c  |  16 +++-
 drivers/resctrl/mpam_fb.c       | 158 ++++++++++++++++++++++++++++++++
 drivers/resctrl/mpam_fb.h       |  17 ++++
 drivers/resctrl/mpam_internal.h |   5 +
 include/linux/arm_mpam.h        |   2 +-
 6 files changed, 196 insertions(+), 4 deletions(-)
 create mode 100644 drivers/resctrl/mpam_fb.c
 create mode 100644 drivers/resctrl/mpam_fb.h

diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
index 4f6d0e81f9b8..097c036724e9 100644
--- a/drivers/resctrl/Makefile
+++ b/drivers/resctrl/Makefile
@@ -1,5 +1,5 @@
 obj-$(CONFIG_ARM64_MPAM_DRIVER)			+= mpam.o
-mpam-y						+= mpam_devices.o
+mpam-y						+= mpam_devices.o mpam_fb.o
 mpam-$(CONFIG_ARM64_MPAM_RESCTRL_FS)		+= mpam_resctrl.o
 
 ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 3be09b0c46ae..90b49bfd5caa 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -28,6 +28,7 @@
 #include <linux/workqueue.h>
 
 #include "mpam_internal.h"
+#include "mpam_fb.h"
 
 /* Values for the T241 errata workaround */
 #define T241_CHIPS_MAX			4
@@ -175,6 +176,13 @@ static u32 __mpam_read_reg(struct mpam_msc *msc, u16 reg)
 {
 	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
 
+	if (msc->iface == MPAM_IFACE_PCC) {
+		u32 ret;
+
+		mpam_fb_send_read_request(msc, reg, &ret);
+		return ret;
+	}
+
 	return readl_relaxed(msc->mapped_hwpage + reg);
 }
 
@@ -188,10 +196,14 @@ static inline u32 _mpam_read_partsel_reg(struct mpam_msc *msc, u16 reg)
 
 static void __mpam_write_reg(struct mpam_msc *msc, u16 reg, u32 val)
 {
-	WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);
 	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
 
-	writel_relaxed(val, msc->mapped_hwpage + reg);
+	if (msc->iface == MPAM_IFACE_PCC) {
+		mpam_fb_send_write_request(msc, reg, val);
+	} else {
+		WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);
+		writel_relaxed(val, msc->mapped_hwpage + reg);
+	}
 }
 
 static inline void _mpam_write_partsel_reg(struct mpam_msc *msc, u16 reg, u32 val)
diff --git a/drivers/resctrl/mpam_fb.c b/drivers/resctrl/mpam_fb.c
new file mode 100644
index 000000000000..bfb5798c74b0
--- /dev/null
+++ b/drivers/resctrl/mpam_fb.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2024 Arm Ltd.
+
+#include <linux/arm_mpam.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/gfp.h>
+#include <linux/iopoll.h>
+#include <linux/list.h>
+#include <linux/mailbox_client.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+#include <linux/processor.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include <acpi/pcc.h>
+
+#include <asm/mpam.h>
+
+#include "mpam_fb.h"
+
+#define MPAM_FB_PROTOCOL_ID	0x1a
+#define MPAM_MSC_ATTRIBUTES_CMD	0x3
+#define MPAM_MSC_READ_CMD	0x4
+#define MPAM_MSC_WRITE_CMD	0x5
+
+#define MPAM_MSC_PROT_ID_MASK	GENMASK(17, 10)
+#define MPAM_MSC_TOKEN_MASK	GENMASK(27, 18)
+
+#define SCMI_CHAN_RSVD_OFS	0x00
+#define SCMI_CHAN_STATUS_OFS	0x04
+#define SCMI_CHAN_STATUS_FREE_BIT	BIT(0)
+#define SCMI_CHAN_FLAGS_OFS	0x10
+#define SCMI_CHAN_FLAGS_IRQ		BIT(0)
+#define SCMI_MSG_LENGTH_OFS	0x14
+#define SCMI_MSG_HEADER_OFS	0x18
+#define SCMI_MSG_PAYLOAD_OFS	0x1c
+
+#define MPAM_READ_MSG_SIZE	(SCMI_MSG_PAYLOAD_OFS + 3 * sizeof(u32))
+#define MPAM_WRITE_MSG_SIZE	(SCMI_MSG_PAYLOAD_OFS + 4 * sizeof(u32))
+
+static atomic_t mpam_fb_token = ATOMIC_INIT(0);
+
+static int mpam_fb_build_read_message(int msc_id, int reg, unsigned int token,
+				      void __iomem *msg_buf)
+{
+	writel_relaxed(SCMI_CHAN_FLAGS_IRQ, msg_buf + SCMI_CHAN_FLAGS_OFS);
+	writel_relaxed(MPAM_READ_MSG_SIZE, msg_buf + SCMI_MSG_LENGTH_OFS);
+	writel_relaxed(MPAM_MSC_READ_CMD |
+		       FIELD_PREP(MPAM_MSC_TOKEN_MASK, token) |
+		       FIELD_PREP(MPAM_MSC_PROT_ID_MASK, MPAM_FB_PROTOCOL_ID),
+		       msg_buf + SCMI_MSG_HEADER_OFS);
+
+	writel_relaxed(cpu_to_le32(msc_id), msg_buf + SCMI_MSG_PAYLOAD_OFS);
+	writel_relaxed(0, msg_buf + SCMI_MSG_PAYLOAD_OFS + 0x4);
+	writel_relaxed(cpu_to_le32(reg), msg_buf + SCMI_MSG_PAYLOAD_OFS + 0x8);
+
+	return MPAM_READ_MSG_SIZE;
+}
+
+static int mpam_fb_build_write_message(int msc_id, int reg, u32 val,
+				       unsigned int token,
+				       void __iomem *msg_buf)
+{
+	writel_relaxed(MPAM_WRITE_MSG_SIZE, msg_buf + SCMI_MSG_LENGTH_OFS);
+	writel_relaxed(MPAM_MSC_WRITE_CMD |
+		       FIELD_PREP(MPAM_MSC_TOKEN_MASK, token) |
+		       FIELD_PREP(MPAM_MSC_PROT_ID_MASK, MPAM_FB_PROTOCOL_ID),
+		       msg_buf + SCMI_MSG_HEADER_OFS);
+
+	writel_relaxed(cpu_to_le32(msc_id), msg_buf + SCMI_MSG_PAYLOAD_OFS);
+	writel_relaxed(0, msg_buf + SCMI_MSG_PAYLOAD_OFS + 0x4);
+	writel_relaxed(cpu_to_le32(reg), msg_buf + SCMI_MSG_PAYLOAD_OFS + 0x8);
+	writel_relaxed(cpu_to_le32(val), msg_buf + SCMI_MSG_PAYLOAD_OFS + 0xc);
+
+	return MPAM_WRITE_MSG_SIZE;
+}
+
+#define SCMI_CHANNEL_FREE	true
+#define SCMI_CHANNEL_BUSY	false
+static int mpam_fb_wait_for_channel(struct pcc_mbox_chan *chan,
+				    bool free)
+{
+	u32 status = free ? SCMI_CHAN_STATUS_FREE_BIT : 0;
+	u32 val;
+
+	/*
+	 * The channel should really be free always at this point, as we take
+	 * a lock for every read or write request. Check the free bit anyway,
+	 * for good measure and to catch corner cases.
+	 */
+	return readl_poll_timeout(chan->shmem + SCMI_CHAN_STATUS_OFS, val,
+				  (val & SCMI_CHAN_STATUS_FREE_BIT) == status,
+				  1, 10000);
+}
+
+static int mpam_fb_send_request(struct mpam_msc *msc, u16 reg, u32 *result,
+				bool is_write)
+{
+	unsigned int token = atomic_inc_return(&mpam_fb_token);
+	struct pcc_mbox_chan *chan = msc->pcc_chan;
+	u32 status;
+	int ret;
+
+	guard(mutex)(&msc->pcc_chan_lock);
+	ret = mpam_fb_wait_for_channel(chan, SCMI_CHANNEL_FREE);
+	if (ret < 0)
+		return ret;
+
+	/* Clear error bit and mark the channel as belonging to the callee */
+	writel(0, chan->shmem + SCMI_CHAN_STATUS_OFS);
+
+	if (is_write)
+		ret = mpam_fb_build_write_message(msc->mpam_fb_msc_id, reg,
+						  *result, token, chan->shmem);
+	else
+		ret = mpam_fb_build_read_message(msc->mpam_fb_msc_id, reg,
+						 token, chan->shmem);
+	if (ret < 0)
+		return ret;
+
+	ret = mbox_send_message(chan->mchan, NULL);
+	if (ret < 0)
+		return ret;
+
+	ret = mpam_fb_wait_for_channel(chan, SCMI_CHANNEL_FREE);
+	if (ret)
+		return ret;
+
+	status = readl(chan->shmem + SCMI_MSG_HEADER_OFS);
+	if (FIELD_GET(MPAM_MSC_TOKEN_MASK, status) != token)
+		return -ETIMEDOUT;
+
+	ret = readl(chan->shmem + SCMI_MSG_PAYLOAD_OFS + 0x0);
+	if (ret < 0)
+		return ret;
+
+	if (!is_write)
+		*result = readl(chan->shmem + SCMI_MSG_PAYLOAD_OFS + 0x4);
+
+	return 0;
+}
+
+int mpam_fb_send_read_request(struct mpam_msc *msc, u16 reg, u32 *result)
+{
+	return mpam_fb_send_request(msc, reg, result, false);
+}
+
+int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value)
+{
+	return mpam_fb_send_request(msc, reg, &value, true);
+}
diff --git a/drivers/resctrl/mpam_fb.h b/drivers/resctrl/mpam_fb.h
new file mode 100644
index 000000000000..c3d1a239e16f
--- /dev/null
+++ b/drivers/resctrl/mpam_fb.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// Copyright (C) 2024-2025 Arm Ltd.
+
+#ifndef MPAM_FB_H_
+#define MPAM_FB_H_
+
+#include <linux/types.h>
+#include "mpam_internal.h"
+
+#define SCMI_MSG_PAYLOAD_OFS	0x1c
+#define MPAM_WRITE_MSG_SIZE	(SCMI_MSG_PAYLOAD_OFS + 4 * sizeof(u32))
+#define MPAM_FB_MAX_MSG_SIZE	MPAM_WRITE_MSG_SIZE
+
+int mpam_fb_send_read_request(struct mpam_msc *msc, u16 reg, u32 *result);
+int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value);
+
+#endif
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 80213af10a64..3f524cd4fc81 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/jump_label.h>
 #include <linux/llist.h>
+#include <linux/mailbox_client.h>
 #include <linux/mutex.h>
 #include <linux/resctrl.h>
 #include <linux/spinlock.h>
@@ -66,6 +67,10 @@ struct mpam_msc {
 
 	/* Not modified after mpam_is_enabled() becomes true */
 	enum mpam_msc_iface	iface;
+	struct mbox_client	pcc_cl;
+	struct pcc_mbox_chan	*pcc_chan;
+	struct mutex		pcc_chan_lock; /* only one message at a time */
+	int			mpam_fb_msc_id;	/* in its own name space */
 	u32			nrdy_usec;
 	cpumask_t		accessibility;
 	bool			has_extd_esr;
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index f92a36187a52..002f56e15362 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -12,7 +12,7 @@ struct mpam_msc;
 
 enum mpam_msc_iface {
 	MPAM_IFACE_MMIO,	/* a real MPAM MSC */
-	MPAM_IFACE_PCC,		/* a fake MPAM MSC */
+	MPAM_IFACE_PCC,		/* using the MPAM-Fb firmware redirection */
 };
 
 enum mpam_class_types {
-- 
2.43.0


