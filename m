Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7118C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeeCE5Kg3uAM2mLs7ZtUxTfbfhk36JQepmBNadtG+B0=; b=UgpC9NEyki5h9iVU8HY9rPAPUc
	I4Q8dZDjU+d5QwIyACRBL4JWtTcQZRB0jGwD82cu5nTld+qKlj/AMZrf2HpKAk2PZ70uVqvaZGxdQ
	PSsdTeeTmc0d0xTS7c5Of7KckisF2IgUEa3taTsGzc4vuYlzXYH80sid/gbKB0KINiKqSkX6Qs9Xv
	1K3nMTDyx2Di6ETekDGO2Xa5wy1euDcNxZqf1RhvUYowR3qzfWnF7SE+UBd6W7w3FQ24V9hbeq/Aw
	mJJ6JXEKEQSwyvbSuXtIHSkpOdNvRHFOxk+blLAROWmddeSRjkLqELG9/UMzbml1yGLQaQsves2S0
	0iH4OCgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKCX-0000000507v-0Bmc;
	Thu, 02 Jul 2026 16:23:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKCU-0000000504s-1vYb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:23:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67EBC1570;
	Thu,  2 Jul 2026 09:23:37 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E7743F673;
	Thu,  2 Jul 2026 09:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783009421; bh=5kM2E5EL2sy+Q/cFrQVCcEt0RIOVlylbhrO0aXa3F6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EUlq4wBCNh5xne02yqI2ZkXKUPzF1E8FMBd/QsC+9ePwyxPzWbHN5tEqzUo6SaaNA
	 ionehk7J/RnazgD/BsguUyKl/Pkwe8yG0UbgW48NtRT1KwMJpjxsOlAg3BlxpQUBIq
	 xQ8WxkG1NdTOuSEnatfz3wH3ElaK7vUTHyhgSqmw=
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
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/15] arm_mpam: detect and enable MPAM-Fb PCC support
Date: Thu,  2 Jul 2026 18:22:29 +0200
Message-ID: <20260702162229.4008659-16-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702162229.4008659-1-andre.przywara@arm.com>
References: <20260702162229.4008659-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_092342_602793_87A68D7F 
X-CRM114-Status: GOOD (  21.51  )
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
 drivers/acpi/arm64/mpam.c      |   2 +
 drivers/resctrl/mpam_devices.c | 113 ++++++++++++++++++++++++++++++++-
 2 files changed, 113 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
index 84963a20c3e7..64bc84bb2029 100644
--- a/drivers/acpi/arm64/mpam.c
+++ b/drivers/acpi/arm64/mpam.c
@@ -256,6 +256,8 @@ static struct platform_device * __init acpi_mpam_parse_msc(struct acpi_mpam_msc_
 	} else if (iface == MPAM_IFACE_PCC) {
 		props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
 							tbl_msc->base_address);
+		props[next_prop++] = PROPERTY_ENTRY_U32("msc-id",
+							tbl_msc->identifier);
 	}
 
 	acpi_mpam_parse_irqs(pdev, tbl_msc, res, &next_res);
diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 4a088e6cd235..35214520bfd4 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -19,6 +19,7 @@
 #include <linux/irqdesc.h>
 #include <linux/list.h>
 #include <linux/lockdep.h>
+#include <linux/mailbox_client.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
@@ -27,6 +28,9 @@
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
+#include <acpi/pcc.h>
+#include <acpi/acpi_io.h>
+
 #include "mpam_internal.h"
 #include "mpam_fb.h"
 
@@ -50,6 +54,88 @@ static LIST_HEAD(mpam_all_msc);
 
 struct srcu_struct mpam_srcu;
 
+/* PCC channels might be serving multiple MSCs, so keep a refcounted list. */
+static DEFINE_MUTEX(pcc_chan_list_lock);
+static LIST_HEAD(pcc_chan_list);
+
+static void mpam_pcc_rx_callback(struct mbox_client *cl, void *msg)
+{
+	/* TODO: wake up tasks blocked on this MSC's PCC channel */
+}
+
+static struct mpam_pcc_chan *mpam_pcc_chan_get(struct device *dev,
+					       int subspace_id)
+{
+	struct mpam_pcc_chan *cur;
+
+	mutex_lock(&pcc_chan_list_lock);
+
+	list_for_each_entry(cur, &pcc_chan_list, pcc_chans) {
+		if (cur->subspace_id == subspace_id) {
+			cur->refcount++;
+			mutex_unlock(&pcc_chan_list_lock);
+
+			return cur;
+		}
+	}
+
+	cur = kzalloc_obj(*cur);
+	if (!cur) {
+		mutex_unlock(&pcc_chan_list_lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	cur->pcc_cl.dev = dev;
+	cur->pcc_cl.rx_callback = mpam_pcc_rx_callback;
+	cur->pcc_cl.tx_block = true;
+	cur->pcc_cl.tx_tout = 1000; /* 1s */
+
+	cur->pcc_chan = pcc_mbox_request_channel(&cur->pcc_cl, subspace_id);
+	if (IS_ERR(cur->pcc_chan)) {
+		long err = PTR_ERR(cur->pcc_chan);
+
+		kfree(cur);
+		mutex_unlock(&pcc_chan_list_lock);
+		return ERR_PTR(err);
+	}
+
+	mutex_init(&cur->pcc_chan_lock);
+	cur->subspace_id = subspace_id;
+	cur->refcount = 1;
+
+	list_add_tail(&cur->pcc_chans, &pcc_chan_list);
+
+	mutex_unlock(&pcc_chan_list_lock);
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
+	mutex_lock(&pcc_chan_list_lock);
+
+	list_for_each_entry_safe(cur, tmp, &pcc_chan_list, pcc_chans) {
+		if (cur == pcc_chan) {
+			if (!--cur->refcount) {
+				pcc_mbox_free_channel(cur->pcc_chan);
+				list_del(&pcc_chan->pcc_chans);
+				kfree(cur);
+			}
+			mutex_unlock(&pcc_chan_list_lock);
+			return 0;
+		}
+	}
+
+	mutex_unlock(&pcc_chan_list_lock);
+
+	return -ENOENT;
+}
+
 /*
  * Number of MSCs that have been probed. Once all MSCs have been probed MPAM
  * can be enabled.
@@ -2202,6 +2288,8 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
 {
 	struct mpam_msc *msc = platform_get_drvdata(pdev);
 
+	mpam_pcc_chan_put(msc->pcc_chan);
+
 	mutex_lock(&mpam_list_lock);
 	mpam_msc_destroy(msc);
 	mutex_unlock(&mpam_list_lock);
@@ -2212,7 +2300,7 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
 static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 {
 	int err;
-	u32 tmp;
+	u32 pcc_subspace_id;
 	struct mpam_msc *msc;
 	struct resource *msc_res;
 	struct device *dev = &pdev->dev;
@@ -2257,7 +2345,8 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 	if (err)
 		return ERR_PTR(err);
 
-	if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
+	if (device_property_read_u32(&pdev->dev, "pcc-channel",
+				     &pcc_subspace_id))
 		msc->iface = MPAM_IFACE_MMIO;
 	else
 		msc->iface = MPAM_IFACE_PCC;
@@ -2273,6 +2362,26 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 		}
 		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
 		msc->mapped_hwpage = io;
+	} else if (msc->iface == MPAM_IFACE_PCC) {
+		u32 msc_id;
+
+		if (device_property_read_u32(&pdev->dev, "msc-id", &msc_id)) {
+			pr_err("missing MPAM-Fb MSC identifier\n");
+			return ERR_PTR(-EINVAL);
+		}
+		msc->mpam_fb_msc_id = msc_id;
+
+		msc->pcc_chan = mpam_pcc_chan_get(&pdev->dev, pcc_subspace_id);
+		if (IS_ERR(msc->pcc_chan)) {
+			pr_err("Failed to request MSC PCC channel\n");
+			return (void *)msc->pcc_chan;
+		}
+
+		if (msc->pcc_chan->pcc_chan->shmem_size < MPAM_FB_MAX_MSG_SIZE) {
+			pr_err("MPAM-Fb PCC channel size too small.\n");
+			mpam_pcc_chan_put(msc->pcc_chan);
+			return ERR_PTR(-ENOMEM);
+		}
 	} else {
 		return ERR_PTR(-EINVAL);
 	}
-- 
2.43.0


