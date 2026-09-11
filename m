Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBC2C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jg8pzZcsmlOdlLOW8dnW1r5vqPBGRuYTa0vEEkR8vjA=; b=oN9UkFIWZM7PEYrCwLeOthGg7k
	LckdzTk67eIbeWr4tfE6yy6phu8y4Sv10GaxP4nyldVzcsYBJdTu/F+h4Ydcd008rCV+mbH10UWPu
	IWl8epa5o4/PvDU//CJzLOF0eNWisDkA4akMaLl52ZaEn4Db3Gn41U40JwvhTfRZzYweLCaTQCqOw
	dO788cJXkwM4m2CViDe2anYBPXBZN53J5IIP5g/LHuLW7I76N0tIvHOylLaFVZf62cZNXG3rs5g+d
	zP6yfm0L3LI3SrLXXMTbH/3YYDreEmbtXLgaTOnsHp6BwNy8pDVA6Ay+lkMsGdvBJneCeJQ4dYzB0
	cc7izRbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zS3-0000000GVyD-3fZI;
	Fri, 11 Sep 2026 11:29:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zRs-0000000GVkt-35xD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 11:29:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E2C62923;
	Fri, 11 Sep 2026 04:29:36 -0700 (PDT)
Received: from e142021.arm.com (unknown [10.57.6.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84D723F59E;
	Fri, 11 Sep 2026 04:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789126179; bh=UR1VVkewxL3Q16Du1mTDtFye/bBzhJLs9txkfi7XVDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rnBYidWeOp/A5snraSsVOvYFNrvEHisVzmaHpYZS3tUkt0hzTPDVP7vnQKDZG5C2v
	 9gJJFVJGnsSknghHVlmvLMdn4orq75s99YFB7aJvHf/JafEsevX4LRaMrTNMc1u33A
	 NGbHyQUOkRMfNzH6+GwTEjAJGE99IFNKEgx/VmQI=
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
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>,
	Lee Trager <lee@trager.us>,
	Ritwick Sharma <ritwick.sharma@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 12/14] arm_mpam: detect and enable MPAM-Fb PCC support
Date: Fri, 11 Sep 2026 13:28:33 +0200
Message-ID: <20260911112835.714162-13-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911112835.714162-1-andre.przywara@arm.com>
References: <20260911112835.714162-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_042940_883924_0428D49B 
X-CRM114-Status: GOOD (  23.09  )
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

The Arm MPAM-Fb specification [1] describes a protocol to access MSC
registers through a firmware interface. This requires a shared memory
region to hold the message, and a mailbox to trigger the access.
For ACPI this is wrapped as a PCC channel, described using existing
ACPI abstractions.

Add code to parse those PCC table descriptions associated with an MSC,
and store the parsed information in the MSC struct.
There can be multiple PCC channels, and each channel can serve multiple
MSCs, so we need to keep track of the channel usage, using a list and
a refcount.

This will be used by the MPAM-Fb access wrapper code.

[1] https://developer.arm.com/documentation/den0144/latest

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Ritwick Sharma <ritwick.sharma@arm.com> # on Arm AGI CPU
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Tested-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 drivers/resctrl/Kconfig         |   1 +
 drivers/resctrl/mpam_devices.c  | 119 +++++++++++++++++++++++++++++++-
 drivers/resctrl/mpam_fb.c       |  41 +++++++++++
 drivers/resctrl/mpam_internal.h |   2 +
 4 files changed, 161 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
index 9591d792736e5..3f81638f57be3 100644
--- a/drivers/resctrl/Kconfig
+++ b/drivers/resctrl/Kconfig
@@ -2,6 +2,7 @@ menuconfig ARM64_MPAM_DRIVER
 	bool "MPAM driver"
 	depends on ARM64 && ARM64_MPAM
 	select ACPI_MPAM if ACPI
+	select PCC if ACPI
 	select MAILBOX
 	help
 	  Memory System Resource Partitioning and Monitoring (MPAM) driver for
diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 14dc8461e4b8f..150a529458388 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -20,14 +20,19 @@
 #include <linux/irqdesc.h>
 #include <linux/list.h>
 #include <linux/lockdep.h>
+#include <linux/mailbox_client.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
+#include <linux/property.h>
 #include <linux/srcu.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
+#include <acpi/pcc.h>
+#include <acpi/acpi_io.h>
+
 #include "mpam_internal.h"
 
 /* Values for the T241 errata workaround */
@@ -50,6 +55,87 @@ static LIST_HEAD(mpam_all_msc);
 
 struct srcu_struct mpam_srcu;
 
+/* PCC channels might be serving multiple MSCs, so keep a refcounted list. */
+static DEFINE_MUTEX(pcc_chan_list_lock);
+static LIST_HEAD(pcc_chan_list);
+
+static void mpam_pcc_chan_release(struct kref *ref)
+{
+	struct mpam_pcc_chan *cur = container_of(ref, struct mpam_pcc_chan,
+						 refcount);
+
+	pcc_mbox_free_channel(cur->pcc_chan);
+	list_del(&cur->pcc_chans);
+	mutex_destroy(&cur->pcc_chan_lock);
+	kfree(cur);
+}
+
+static struct mpam_pcc_chan *mpam_pcc_chan_get(struct device *dev,
+					       int subspace_id)
+{
+	struct mpam_pcc_chan *cur;
+
+	guard(mutex)(&pcc_chan_list_lock);
+
+	list_for_each_entry(cur, &pcc_chan_list, pcc_chans) {
+		if (cur->subspace_id == subspace_id) {
+			kref_get(&cur->refcount);
+
+			return cur;
+		}
+	}
+
+	cur = kzalloc_obj(*cur);
+	if (!cur)
+		return ERR_PTR(-ENOMEM);
+
+	cur->pcc_cl.tx_block = true;
+
+	cur->pcc_chan = pcc_mbox_request_channel(&cur->pcc_cl, subspace_id);
+	if (IS_ERR(cur->pcc_chan)) {
+		long err = PTR_ERR(cur->pcc_chan);
+
+		kfree(cur);
+		return ERR_PTR(err);
+	}
+
+	/*
+	 * Timeout based on the "nominal latency" in us, from the
+	 * PCC ACPI table. tx_tout is in ms.
+	 * Add some margin here to be on the safe side.
+	 */
+	cur->pcc_cl.tx_tout = DIV_ROUND_UP(cur->pcc_chan->latency * 5, 1000);
+
+	mutex_init(&cur->pcc_chan_lock);
+
+	cur->subspace_id = subspace_id;
+	kref_init(&cur->refcount);
+
+	list_add_tail(&cur->pcc_chans, &pcc_chan_list);
+
+	return cur;
+}
+
+static int mpam_pcc_chan_put(struct mpam_pcc_chan *pcc_chan)
+{
+	struct mpam_pcc_chan *cur, *tmp;
+
+	if (!pcc_chan)
+		return 0;
+
+	guard(mutex)(&pcc_chan_list_lock);
+
+	list_for_each_entry_safe(cur, tmp, &pcc_chan_list, pcc_chans) {
+		if (cur == pcc_chan) {
+			kref_put(&cur->refcount, mpam_pcc_chan_release);
+
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+
 /*
  * Number of MSCs that have been probed. Once all MSCs have been probed MPAM
  * can be enabled.
@@ -2285,6 +2371,8 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
 	if (!msc)
 		return;
 
+	mpam_pcc_chan_put(msc->pcc_chan);
+
 	mutex_lock(&mpam_list_lock);
 	mpam_msc_destroy(msc);
 	mutex_unlock(&mpam_list_lock);
@@ -2295,7 +2383,7 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
 static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 {
 	int err;
-	u32 tmp;
+	u32 pcc_subspace_id;
 	struct mpam_msc *msc;
 	struct resource *msc_res;
 	struct device *dev = &pdev->dev;
@@ -2339,7 +2427,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 	if (err)
 		return ERR_PTR(err);
 
-	if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
+	if (device_property_read_u32(dev, "pcc-channel", &pcc_subspace_id))
 		msc->iface = MPAM_IFACE_MMIO;
 	else
 		msc->iface = MPAM_IFACE_PCC;
@@ -2360,6 +2448,33 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 		}
 		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
 		msc->mapped_hwpage = io;
+	} else if (msc->iface == MPAM_IFACE_PCC) {
+		u32 mpam_fb_msc_id;
+
+		msc->pcc_chan = mpam_pcc_chan_get(dev, pcc_subspace_id);
+		if (IS_ERR(msc->pcc_chan)) {
+			pr_err("Failed to request MSC PCC channel\n");
+			return ERR_CAST(msc->pcc_chan);
+		}
+
+		err = mpam_fb_check_shared_buffer_size(msc);
+		if (err) {
+			mpam_pcc_chan_put(msc->pcc_chan);
+
+			return ERR_PTR(err);
+		}
+
+		err = mpam_fb_check_protocol_version(msc);
+		if (err) {
+			mpam_pcc_chan_put(msc->pcc_chan);
+
+			return ERR_PTR(err);
+		}
+
+		if (device_property_read_u32(&pdev->dev, "mpam-fb-msc-id",
+					     &mpam_fb_msc_id))
+			mpam_fb_msc_id = msc->id;
+		msc->mpam_fb_msc_id = mpam_fb_msc_id;
 	} else {
 		return ERR_PTR(-EINVAL);
 	}
diff --git a/drivers/resctrl/mpam_fb.c b/drivers/resctrl/mpam_fb.c
index 98212f761de38..8fc1d78a7b5ab 100644
--- a/drivers/resctrl/mpam_fb.c
+++ b/drivers/resctrl/mpam_fb.c
@@ -20,10 +20,15 @@
 #define MPAM_FB_PROTOCOL_ID		0x1a
 
 #define MPAM_PROTOCOL_VERSION_CMD	0x0
+#define MPAM_FB_VERSION_MAJOR_MASK		GENMASK_U32(31, 16)
+#define MPAM_FB_VERSION_MINOR_MASK		GENMASK_U32(15, 0)
+
 #define MPAM_MSC_READ_CMD		0x4
 #define MPAM_MSC_WRITE_CMD		0x5
 
 #define MPAM_FB_PROT_HEADER_LEN		sizeof(u32)
+/* The longest message is MPAM_MSC_WRITE, with 4 parameters. */
+#define MPAM_FB_MAX_MSG_SIZE		(4 * sizeof(u32))
 
 #define MPAM_FB_SUCCESS		 0
 #define MPAM_FB_ERR_NOT_SUPPORTED	-1
@@ -209,3 +214,39 @@ int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value)
 	return mpam_fb_send_request(msc, msc->mpam_fb_msc_id, reg, &value,
 				    MPAM_MSC_WRITE_CMD);
 }
+
+/* We only support MPAM-Fb protocol version 1.x */
+int mpam_fb_check_protocol_version(struct mpam_msc *msc)
+{
+	u32 version;
+	int ret;
+
+	ret = mpam_fb_send_request(msc, 0, 0, &version,
+				   MPAM_PROTOCOL_VERSION_CMD);
+	if (ret)
+		return ret;
+
+	if (FIELD_GET(MPAM_FB_VERSION_MAJOR_MASK, version) != 1) {
+		pr_err("Incompatible MPAM-Fb protocol version %d.%d\n",
+		       FIELD_GET(MPAM_FB_VERSION_MAJOR_MASK, version),
+		       FIELD_GET(MPAM_FB_VERSION_MINOR_MASK, version));
+
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc)
+{
+	int min_buffer_size = MPAM_FB_MAX_MSG_SIZE +
+			      sizeof(struct acpi_pcct_ext_pcc_shared_memory);
+
+	if (msc->pcc_chan->pcc_chan->shmem_size < min_buffer_size) {
+		pr_err("MPAM-Fb PCC channel size too small.\n");
+
+		return -ENOMEM;
+	}
+
+	return 0;
+}
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index e5a2804facd2d..314d3b48ca9fd 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -538,6 +538,8 @@ static inline void mpam_resctrl_teardown_class(struct mpam_class *class) { }
 /* MPAM-Fb Firmware-backed protocol wrappers */
 int mpam_fb_send_read_request(struct mpam_msc *msc, u16 reg, u32 *result);
 int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value);
+int mpam_fb_check_protocol_version(struct mpam_msc *msc);
+int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
 
 /*
  * MPAM MSCs have the following register layout. See:
-- 
2.43.0


