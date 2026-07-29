Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2169C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6R2pYj296bY6DCGQdRtdRPLFwCQxaBfb6WzJAnKp2g=; b=GP3Vzo3C92qjfRPmIpOBXkfITO
	yDk42JcrgH0+AWF6xtuFnh1nus6ABdtPdcBO5sxSBgr8sFUc3kq7IwC51SgUnbQJCa7yDdGlm7KOm
	3wiSScT68r3e0TCwOCeFvxRHmyEdQlOEOuVfxfvn+EcayKnVsC0BoTdyoyTderx5Nex+UYsSfZviz
	t5isO5l/v9YXB1kLNgpMTbsAXMflkzDyGUd4SD4zPPAMd0OPg2LUeeMbH1EpZy9LzqUsodPEwD9+i
	L7Fl/YKFDvmItZlneY1ODV36S9p0tY8bfUxNPFud13c5k6sA8kQXlYpWckz3Et3gWBSh5HN5ia2N2
	mraW80vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4YW-000000089w5-0qeG;
	Wed, 29 Jul 2026 13:42:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Y8-000000089fh-26ne
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:42:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C9651595;
	Wed, 29 Jul 2026 06:42:15 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D4F13FA1F;
	Wed, 29 Jul 2026 06:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785332539; bh=g1oMay8m19gUPMJty4L0KAl+fOjOIHIHGhryh1NKbEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PvCrCE1iKyY7OF1rDjjzknKu8UXLj2Aw+ehX44QpApCEGzDMJTw8arAfn+g6BlT26
	 lsrQB7/UPgytFswfuzEOh00Gsjywq+YlJn/ZNhUkYD8kHezLWSTDSw037att9t2Ypg
	 FY/Of52SCXGxduKmszvrEQIn3+mZpR9MTv98JtGY=
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
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/10] arm_mpam: detect and enable MPAM-Fb PCC support
Date: Wed, 29 Jul 2026 15:41:24 +0200
Message-ID: <20260729134124.2506269-11-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729134124.2506269-1-andre.przywara@arm.com>
References: <20260729134124.2506269-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_064220_660632_788429E1 
X-CRM114-Status: GOOD (  24.07  )
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
---
 drivers/resctrl/mpam_devices.c  | 119 +++++++++++++++++++++++++++++++-
 drivers/resctrl/mpam_fb.c       |   4 +-
 drivers/resctrl/mpam_internal.h |   6 +-
 3 files changed, 124 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index e535603d2c7d..e360051f4aa7 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -19,14 +19,19 @@
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
@@ -49,6 +54,84 @@ static LIST_HEAD(mpam_all_msc);
 
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
+	cur->pcc_cl.dev = dev;
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
+	/* Timeout based on the "nominal latency" from the PCC ACPI table. */
+	cur->pcc_cl.tx_tout = cur->pcc_chan->latency * 5;
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
@@ -2221,6 +2304,8 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
 {
 	struct mpam_msc *msc = platform_get_drvdata(pdev);
 
+	mpam_pcc_chan_put(msc->pcc_chan);
+
 	mutex_lock(&mpam_list_lock);
 	mpam_msc_destroy(msc);
 	mutex_unlock(&mpam_list_lock);
@@ -2231,7 +2316,7 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
 static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 {
 	int err;
-	u32 tmp;
+	u32 pcc_subspace_id;
 	struct mpam_msc *msc;
 	struct resource *msc_res;
 	struct device *dev = &pdev->dev;
@@ -2279,7 +2364,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 	if (err)
 		return ERR_PTR(err);
 
-	if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
+	if (device_property_read_u32(dev, "pcc-channel", &pcc_subspace_id))
 		msc->iface = MPAM_IFACE_MMIO;
 	else
 		msc->iface = MPAM_IFACE_PCC;
@@ -2295,6 +2380,36 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 		}
 		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
 		msc->mapped_hwpage = io;
+	} else if (msc->iface == MPAM_IFACE_PCC) {
+		int ret;
+
+		msc->pcc_chan = mpam_pcc_chan_get(dev, pcc_subspace_id);
+		if (IS_ERR(msc->pcc_chan)) {
+			pr_err("Failed to request MSC PCC channel\n");
+			return ERR_CAST(msc->pcc_chan);
+		}
+
+		if (msc->pcc_chan->pcc_chan->shmem_size < MPAM_FB_MAX_MSG_SIZE) {
+			pr_err("MPAM-Fb PCC channel size too small.\n");
+			mpam_pcc_chan_put(msc->pcc_chan);
+			return ERR_PTR(-ENOMEM);
+		}
+		ret = mpam_fb_get_protocol_version(msc);
+		if (ret < 0) {
+			pr_err("Cannot query MPAM-Fb protocol version.\n");
+			mpam_pcc_chan_put(msc->pcc_chan);
+
+			/* ret is an MPAM-Fb error code, return a Linux one. */
+			return ERR_PTR(-EIO);
+		}
+		if (FIELD_GET(MPAM_FB_VERSION_MAJOR_MASK, ret) != 1) {
+			pr_err("Incompatible MPAM-Fb protocol version %ld.%ld\n",
+			       FIELD_GET(MPAM_FB_VERSION_MAJOR_MASK, ret),
+			       FIELD_GET(MPAM_FB_VERSION_MINOR_MASK, ret));
+			mpam_pcc_chan_put(msc->pcc_chan);
+
+			return ERR_PTR(-EINVAL);
+		}
 	} else {
 		return ERR_PTR(-EINVAL);
 	}
diff --git a/drivers/resctrl/mpam_fb.c b/drivers/resctrl/mpam_fb.c
index dbe984241b0d..55c4778a8379 100644
--- a/drivers/resctrl/mpam_fb.c
+++ b/drivers/resctrl/mpam_fb.c
@@ -190,13 +190,13 @@ static int mpam_fb_send_request(struct mpam_pcc_chan *pcc_chan, u32 msc_id,
 
 int mpam_fb_send_read_request(struct mpam_msc *msc, u16 reg, u32 *result)
 {
-	return mpam_fb_send_request(msc->pcc_chan, msc->mpam_fb_msc_id,
+	return mpam_fb_send_request(msc->pcc_chan, msc->id,
 				    reg, result, MPAM_MSC_READ_CMD);
 }
 
 int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value)
 {
-	return mpam_fb_send_request(msc->pcc_chan, msc->mpam_fb_msc_id,
+	return mpam_fb_send_request(msc->pcc_chan, msc->id,
 				    reg, &value, MPAM_MSC_WRITE_CMD);
 }
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index a2193e7df57c..e926b7feb72a 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -77,7 +77,6 @@ struct mpam_msc {
 	/* Not modified after mpam_is_enabled() becomes true */
 	enum mpam_msc_iface	iface;
 	struct mpam_pcc_chan	*pcc_chan;
-	int			mpam_fb_msc_id;	/* in its own name space */
 	u32			nrdy_usec;
 	cpumask_t		accessibility;
 	bool			has_extd_esr;
@@ -532,6 +531,11 @@ int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value);
 int mpam_fb_get_protocol_version(struct mpam_msc *msc);
 
 #define MPAM_FB_PROT_HEADER_LEN		sizeof(u32)
+/* The longest message is MPAM_MSC_WRITE, with 4 parameters. */
+#define MPAM_FB_MAX_MSG_SIZE	(MPAM_FB_PROT_HEADER_LEN + 4 * sizeof(u32))
+
+#define MPAM_FB_VERSION_MAJOR_MASK	GENMASK(31, 16)
+#define MPAM_FB_VERSION_MINOR_MASK	GENMASK(15, 0)
 
 /*
  * MPAM MSCs have the following register layout. See:
-- 
2.43.0


