Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A57FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 14:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbtKNXmoODMcgiMXjR4pf1srKUeCCT/KPxcZsdoUHgM=; b=PaZZE/ANl4LyOwoRioqXopHRoj
	YzmGyugfmv0Rtgv4qCrk4srjyS1aqRxbkE2tggZw3jI5M5aqbKkSvPILG2/9ZFfSW6KQ1U/gcl33I
	inOcfWQ/EzhKTbb9pX7z5x2/4bf1sioWtlXKEcF5BSIK6UHPNSfG/N5Ql5pA3390vhFBjQHfp/+3W
	Vy4sNzKXzOFkOlPDqzfOQET1Rcs7lwv5ffUMm3WSKGIgOBXjZ54ombhRnGlgpYrr5BaT6KQw+8MmX
	LQ7iRWalNwjhcFGAgao14g/cWqtiZadbPxUcY7rMMfHWydjPXPQbmJa0ysWXXp1QWnE16pOWh9+Ms
	v6Kt9rLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5gr-00000003k2Z-1EXa;
	Wed, 29 Apr 2026 14:15:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5gm-00000003jyx-2QBG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 14:14:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7507337B;
	Wed, 29 Apr 2026 07:14:49 -0700 (PDT)
Received: from e142021.munich.arm.com (e142021.arm.com [10.41.150.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A5563F62B;
	Wed, 29 Apr 2026 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777472095; bh=TWP2lAxaXbVnNFo9vl6Hezc0Pf81dRrSakpKGzDEGrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EC+a4NN0XacvSuP1ZAVaqebvSvCXSGooD78o5sbQrwatcJiY3G3N2OZ3WBXKZHsVy
	 7Z49/1/5NlHsMjXGQEmzj+voK1P5e5wg+I0bKJLrwN5EulI+CGzn58eSDbHxMo+ODm
	 BP04HxgYwVdhIc4OLn6BHOya39QWQsvQ4wguYaAY=
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
Subject: [PATCH 5/5] arm_mpam: detect and enable MPAM-Fb PCC support
Date: Wed, 29 Apr 2026 16:13:39 +0200
Message-ID: <20260429141339.3171205-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429141339.3171205-1-andre.przywara@arm.com>
References: <20260429141339.3171205-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_071456_694210_7570752F 
X-CRM114-Status: GOOD (  17.66  )
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
This will be used by the MPAM-Fb access wrapper code.

[1] https://developer.arm.com/documentation/den0144/latest

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/acpi/arm64/mpam.c      |  2 ++
 drivers/resctrl/mpam_devices.c | 46 +++++++++++++++++++++++++++++++---
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
index 99c2bdbb3314..edb4d10e8dc3 100644
--- a/drivers/acpi/arm64/mpam.c
+++ b/drivers/acpi/arm64/mpam.c
@@ -341,6 +341,8 @@ static struct platform_device * __init acpi_mpam_parse_msc(struct acpi_mpam_msc_
 	} else if (iface == MPAM_IFACE_PCC) {
 		props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
 							tbl_msc->base_address);
+		props[next_prop++] = PROPERTY_ENTRY_U32("msc-id",
+							tbl_msc->identifier);
 	}
 
 	acpi_mpam_parse_irqs(pdev, tbl_msc, res, &next_res);
diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 62aa04cb6905..6f0d0959d3a4 100644
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
 
@@ -1042,7 +1046,8 @@ static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
 
 	mpam_mon_sel_lock_held(msc);
 
-	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
+	if (msc->iface == MPAM_IFACE_MMIO)
+		WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
 	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
 
 	mbwu_l_high2 = __mpam_read_reg(msc, MSMON_MBWU_L + 4);
@@ -2042,10 +2047,15 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
 	mpam_free_garbage();
 }
 
+static void mpam_pcc_rx_callback(struct mbox_client *cl, void *msg)
+{
+	/* TODO: wake up tasks blocked on this MSC's PCC channel */
+}
+
 static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 {
 	int err;
-	u32 tmp;
+	u32 pcc_subspace_id;
 	struct mpam_msc *msc;
 	struct resource *msc_res;
 	struct device *dev = &pdev->dev;
@@ -2090,7 +2100,8 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 	if (err)
 		return ERR_PTR(err);
 
-	if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
+	if (device_property_read_u32(&pdev->dev, "pcc-channel",
+				     &pcc_subspace_id))
 		msc->iface = MPAM_IFACE_MMIO;
 	else
 		msc->iface = MPAM_IFACE_PCC;
@@ -2106,6 +2117,35 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 		}
 		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
 		msc->mapped_hwpage = io;
+	} else if (msc->iface == MPAM_IFACE_PCC) {
+		u32 msc_id;
+
+		msc->pcc_cl.dev = &pdev->dev;
+		msc->pcc_cl.rx_callback = mpam_pcc_rx_callback;
+		msc->pcc_cl.tx_block = false;
+		msc->pcc_cl.tx_tout = 1000; /* 1s */
+		msc->pcc_cl.knows_txdone = false;
+
+		if (device_property_read_u32(&pdev->dev, "msc-id", &msc_id)) {
+			pr_err("missing MPAM-Fb MSC identifier\n");
+			return ERR_PTR(-EINVAL);
+		}
+		msc->mpam_fb_msc_id = msc_id;
+
+		msc->pcc_chan = pcc_mbox_request_channel(&msc->pcc_cl,
+							 pcc_subspace_id);
+		if (IS_ERR(msc->pcc_chan)) {
+			pr_err("Failed to request MSC PCC channel\n");
+			return (void *)msc->pcc_chan;
+		}
+
+		if (msc->pcc_chan->shmem_size < MPAM_FB_MAX_MSG_SIZE) {
+			pr_err("MPAM-Fb PCC channel size too small.\n");
+			pcc_mbox_free_channel(msc->pcc_chan);
+			return ERR_PTR(-ENOMEM);
+		}
+
+		mutex_init(&msc->pcc_chan_lock);
 	} else {
 		return ERR_PTR(-EINVAL);
 	}
-- 
2.43.0


