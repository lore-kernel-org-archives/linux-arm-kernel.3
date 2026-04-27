Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B3BFF8865
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEXtKTiSLqPkT4HuU47H4q2ctrP6aQNmjALtTxlbzMs=; b=jcDMOOamMGPpmt4GkwPZFktWMU
	H8Q5a+dxYe0hP2FGgnJ/kAbOzUMNPqIWKwCU9ocV6I2Y4uDTNngRiRMVmdWo8xQ6A1TMYOjbcDPMg
	6gqV9gwW5riLXiHa2z6uXV2QDj1dqEe7pnTSecbI7PzUyBRyInOkjI2VjWBrOt9PKLXJSkdfSV9IO
	oCyE8HCpyfumy1/6kY9NzBtLGM6n+jVWMe84ZHRTN5aoT10PsCKt7Za9z5inClMuKSJMHn12Zr14a
	ZgkC2mF1QmQYzi2EKYpJbhBbM2bIZ9gmM/V/9K3A32vqRuCwRrTCDWcVhQkp0LGkTdyLri1mqxTaF
	rDWpOotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFpr-0000000GIn0-1hLt;
	Mon, 27 Apr 2026 06:52:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFpi-0000000GIee-3V3D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:52:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 808D240D78;
	Mon, 27 Apr 2026 06:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A31C19425;
	Mon, 27 Apr 2026 06:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777272762;
	bh=Lgmbk9xMIpHvR05nzEfVzoIynoOoPTPEvkqEGSPDfJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BJHUouHRSkmYTywbg9zws+4kV6xqUuhelqXjP+HvFWKQTtaWZB3KY4x2DO0M8T3ch
	 EBhGzDyiKKYgXnZLScnZ8eXFbi0WIkFZMcMOF4H6F7A4Cm54wExxYkdJEwiVa0ZjZ3
	 PgKpu/nB3UTf2R5wTmqrvp0JUjbfj4hFzkbku5ABJTI4MlspkV98vV7jCDW2qThHeE
	 yK7qBfI2NNwO+uhtU8kYkhHm62poGTRsLzD7c4N/ZOYqhzs8mltEvj/mN1dS10wKi0
	 RI3N9JilK7PoxhGdA+AxzFFdMHMhg67xZw05lCdCfDF9WQDflK+tY45dJtz6ZnbNKB
	 kd4vd263wK6Bw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH v4 12/14] coco: host: arm64: Refcount root-port pdevs used by IDE streams
Date: Mon, 27 Apr 2026 12:21:19 +0530
Message-ID: <20260427065121.916615-13-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427065121.916615-1-aneesh.kumar@kernel.org>
References: <20260427065121.916615-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_235244_809931_EFE73262 
X-CRM114-Status: GOOD (  16.69  )
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

Keep the root-port RMM pdev alive while endpoint IDE streams are attached
to it.

Add a kref to the root-port descriptor, take a reference when reusing an
existing root-port pdev for stream setup, and drop it when the endpoint
disconnects. Release the root-port pdev once the final reference is
dropped, tearing down the RMM object and its communication buffers at that
point.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/arm-cca-host/arm-cca.c | 31 +++++++++++++++++++++---
 drivers/virt/coco/arm-cca-host/rmi-da.h  |  4 +++
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/virt/coco/arm-cca-host/arm-cca.c b/drivers/virt/coco/arm-cca-host/arm-cca.c
index de7a2e156549..0b1200f591ab 100644
--- a/drivers/virt/coco/arm-cca-host/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-host/arm-cca.c
@@ -134,6 +134,23 @@ static int alloc_stream_id(struct pci_host_bridge *hb)
 	return stream_id;
 }
 
+static void cca_root_port_pdev_release(struct kref *kref)
+{
+	struct cca_host_rp_dsc *rp_dsc = container_of(kref, struct cca_host_rp_dsc,
+						      tsm_ref);
+	struct pci_dev *rp = rp_dsc->pci.pdev;
+
+	cca_pdev_stop_and_destroy(rp);
+	free_dev_communication_buffers(&rp_dsc->pdev.comm_data);
+	rp->tsm = NULL;
+	kfree(rp_dsc);
+}
+
+static inline void cca_root_port_pdev_put(struct cca_host_rp_dsc *rp_dsc)
+{
+	kref_put(&rp_dsc->tsm_ref, cca_root_port_pdev_release);
+}
+
 static int cca_root_port_pdev_create(struct pci_dev *rp, struct tsm_dev *tsm_dev)
 {
 	int ret;
@@ -151,6 +168,7 @@ static int cca_root_port_pdev_create(struct pci_dev *rp, struct tsm_dev *tsm_dev
 	rp->tsm->dsm_dev = rp;
 	rp->tsm->pdev = rp;
 	rp->tsm->tsm_dev = tsm_dev;
+	kref_init(&rp_dsc->tsm_ref);
 	mutex_init(&rp_dsc->pdev.object_lock);
 
 	ret = init_dev_communication_buffers(rp, &rp_dsc->pdev.comm_data);
@@ -222,12 +240,15 @@ static int cca_pdev_create_ncoh_stream(struct pci_dev *pdev, unsigned long strea
 		/* Make sure they use the same TSM */
 		if (rp->tsm->tsm_dev != pf0_ep_dsc->pci.base_tsm.tsm_dev)
 			return -EINVAL;
-	}
 
+		kref_get(&rp_dsc->tsm_ref);
+	}
 
 	params = (struct rmi_pdev_stream_params *)get_zeroed_page(GFP_KERNEL);
-	if (!params)
+	if (!params) {
+		cca_root_port_pdev_put(rp_dsc);
 		return -ENOMEM;
+	}
 
 	params->flags = 0;
 	params->type = RMI_PDEV_STREAM_NCOH;
@@ -237,7 +258,9 @@ static int cca_pdev_create_ncoh_stream(struct pci_dev *pdev, unsigned long strea
 	params->num_addr_range = pci_dev_addr_range(pdev, params->addr_range);
 
 	ret = cca_pdev_stream_connect(pdev, rp, params, &stream_handle);
-	if (!ret)
+	if (ret)
+		cca_root_port_pdev_put(rp_dsc);
+	else
 		pf0_ep_dsc->stream_handle = stream_handle;
 
 	free_page((unsigned long)params);
@@ -375,6 +398,8 @@ static void cca_tsm_disconnect(struct pci_dev *pdev)
 	}
 
 	cca_pdev_disconnect_stream(pdev, rp, pf0_ep_dsc->stream_handle);
+	if (rp)
+		cca_root_port_pdev_put(to_cca_rp_dsc(rp));
 
 	cca_pdev_stop_and_destroy(pdev);
 	free_dev_communication_buffers(&pf0_ep_dsc->pdev.comm_data);
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.h b/drivers/virt/coco/arm-cca-host/rmi-da.h
index ea5f7df3541f..798a8ed7505f 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.h
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.h
@@ -10,6 +10,9 @@
 #include <linux/pci-ide.h>
 #include <linux/pci-tsm.h>
 #include <linux/sizes.h>
+#include <linux/atomic.h>
+#include <linux/kref.h>
+#include <linux/wait.h>
 #include <asm/rmi_cmds.h>
 #include <asm/rmi_smc.h>
 
@@ -104,6 +107,7 @@ struct cca_host_pf0_ep_dsc {
 struct cca_host_rp_dsc {
 	struct pci_tsm pci;
 	struct cca_host_pdev_dsc pdev;
+	struct kref tsm_ref;
 };
 
 struct cca_host_fn_dsc {
-- 
2.43.0


