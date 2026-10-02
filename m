Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A1FCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vM5oeUoz9IkPZlC8LuYWa3R5GnMf/klL/HOKoq0Tdw=; b=cLSSesoHBTmOlQS58a6GPFlRli
	JdF/y2EsOAFZeAW/jzRZiliEeo9T1uD0+dRZgwCUiwkUNepO5nmOqcgFmFRrQpfEIJk/KPBI2TE1r
	vi5PyYrNsFTgEUYjvx1h/qD0A+xy9i3r1TOF5g7zF6qde8i4AFAl78b5Z0QqgLTPy8uJTyInRn2BB
	OoYnrfc7poBI7X1W3xFxQx8tClYLHwKVLbYpQSR5O3vTLLTPP72GGL7qMU56RLmHHrtXr4WUqkD0B
	/WUO/JENyOAEH+Dv6OyCZjwV8/yvxYAF65TgP4Kt3EgEQGK5YRX2vYeINvgO4623SqkLIo0pSOVaa
	9I2ecVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFs-0000000CCTd-0Qn3;
	Fri, 02 Oct 2026 17:41:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFf-0000000CC8F-0EDI
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Oct 2026 17:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7vM5oeUoz9IkPZlC8LuYWa3R5GnMf/klL/HOKoq0Tdw=; b=PPPdd2bH16fkifeLTbnCEM9ggq
	1O9Fq1ziTX5beP2sbEiDs6973/kSTOjur4vJak9EUTZNZao0wJP1Q1Px7rsb9uH6V2QncfQ2J7odh
	O4FoizmIKqyyq3FKbqKj0AbR+85gl20fo9quj1lnCWwTU5H+IpPjwUoTC+KP2I/SFR+elAJc7N80c
	X55e/Kfs/v+M7WX7XfbRhn494x4rpjQn2pXm7Lz44xGDfuarMWl3XOsy8n4UEBbg8+nmll9f58DFy
	nFQs4rHP8l6P1yjYnud9BEzkAJMiFNP8TAu03XSIr4mnehJ6yA3rMEiYsvwu2FLb1Oeq6Lj9XoZiz
	ZruBuFVw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xChFV-00000006BQQ-1I4z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BBB9143D;
	Fri,  2 Oct 2026 10:40:40 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 320B13F85F;
	Fri,  2 Oct 2026 10:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962838; bh=2/X9eArhgO6gn8NC65ETOi/lX4OWPpcnL4MF4jUZ+UY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jORBEeUspKm1+5Z0ESAoTK7HqFJCUEZjeC/aYEb6I0omU3UhT70B1d4HEq0kPnnTG
	 YcNNFDmK9hCOjSCocvc5y/s6mn5YE/xX/NuqZRYSSqqTCMR0FX9VDTB4PPWpUyWtrG
	 6uhf4lEoaokSGGdS5SsnjxZ8CO5L6lKXy7hzdIyw=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Ritwick Sharma <ritwick.sharma@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 27/27] arm_mpam: detect and enable MPAM-Fb PCC support
Date: Fri,  2 Oct 2026 18:39:40 +0100
Message-ID: <20261002173941.292319-28-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_184047_294809_05E77E20 
X-CRM114-Status: GOOD (  25.00  )
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

From: Andre Przywara <andre.przywara@arm.com>

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
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/Kconfig         |   1 +
 drivers/resctrl/mpam_devices.c  | 119 +++++++++++++++++++++++++++++++-
 drivers/resctrl/mpam_fb.c       |  41 +++++++++++
 drivers/resctrl/mpam_internal.h |   2 +
 4 files changed, 161 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
index 9591d792736e..f5ff9b1f6c48 100644
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
index 95caa151b27a..c32175426433 100644
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
@@ -2334,6 +2420,8 @@ static void mpam_msc_destroy(struct mpam_msc *msc)
 		mpam_ris_destroy(ris);
 
 	list_del_rcu(&msc->all_msc_list);
+	synchronize_srcu(&mpam_srcu);
+	mpam_pcc_chan_put(msc->pcc_chan);
 	platform_set_drvdata(pdev, NULL);
 
 	add_to_garbage(msc);
@@ -2356,7 +2444,7 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
 static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 {
 	int err;
-	u32 tmp;
+	u32 pcc_subspace_id;
 	struct mpam_msc *msc;
 	struct resource *msc_res;
 	struct device *dev = &pdev->dev;
@@ -2400,7 +2488,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 	if (err)
 		return ERR_PTR(err);
 
-	if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
+	if (device_property_read_u32(dev, "pcc-channel", &pcc_subspace_id))
 		msc->iface = MPAM_IFACE_MMIO;
 	else
 		msc->iface = MPAM_IFACE_PCC;
@@ -2421,6 +2509,33 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
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
+		msc->fb_id = mpam_fb_msc_id;
 	} else {
 		return ERR_PTR(-EINVAL);
 	}
diff --git a/drivers/resctrl/mpam_fb.c b/drivers/resctrl/mpam_fb.c
index 72f45e9582df..54834052cbde 100644
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
@@ -215,3 +220,39 @@ int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value)
 	return mpam_fb_send_request(msc, msc->fb_id, reg, &value,
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
index 99057d6abee1..ee7c3953a9b6 100644
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
2.53.0


