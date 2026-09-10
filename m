Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABE4C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iX8SSvkP0TRGmeqvD2oG6hiYGm+9zRzWtG9NpyIedjc=; b=zoqwTf8elrWLoxO3nu2mUVSEc5
	Y9hACjWD1GG67rLyL3dRKAiTXiT5eIcgy51Y0uHf+Goq4rg5eaRJifhyFu3BSKdA1g00xcUnxuwZq
	twnfTEEXLvKCKi9ww508Egh6Cp1wXhiG4119DDuEMXxtyleJ3RPNpVXDISawDY1QUnwY37KXMfjG3
	UXijEI+KMNmgV02A7Q3Rji/F+Rry94rxz8+8Zz/rLSLOBfiD15DAbnYhvlg0suiLv7hlT/cAt0+Pb
	8f9R3KCeGvgTVurD01PkDiQK5fWKPKnUTcnW7/Eotk/RzTyn2wsTf8i5AdNWbrz/JVCr5HRfs45R9
	GqFvk/2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fQJ-0000000EZEb-01PV;
	Thu, 10 Sep 2026 14:06:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fQI-0000000EZCy-0ZPq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:06:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD5E5416F3;
	Thu, 10 Sep 2026 14:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9841F000FF;
	Thu, 10 Sep 2026 14:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049201;
	bh=iX8SSvkP0TRGmeqvD2oG6hiYGm+9zRzWtG9NpyIedjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mqh0EZzxseos9g49gSpPyaDSDP5fp4uJNWI8WD3DmpUAhySxNIDdub8DwxX7JS1MY
	 OFcPexKHHMz+mcZu2x29KuhaokyCG42H3Nq7ApOk0qP4BLWTHpGrnsjysSgjtqLTjp
	 OwbfD6Vn9XrH8UOrFUGbqdy1RvCWhJjjp7/GxgRvL2gWHMPSJ7rRyTjUMLf7xieWxv
	 MQfJw++DEPr/ywU9RirDxo/9CXhOMoVB3JYSSIbdCLWyKdSn9POChncwl6iFZ6Qu9e
	 4UDqBBOuFfKw6Yky6O8B58cQsOIquQw8T4RbS7c1mlQzSNrmp0Kt6T7+lnbg8doAQZ
	 pWGDwku8uJ3uw==
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
Subject: [PATCH v5 12/15] coco: host: arm64: Refcount root-port pdevs used by IDE streams
Date: Thu, 10 Sep 2026 19:35:05 +0530
Message-ID: <20260910140509.868402-13-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910140509.868402-1-aneesh.kumar@kernel.org>
References: <20260910140509.868402-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 drivers/virt/coco/arm-cca-host/main.c   | 31 ++++++++++++++++++++++---
 drivers/virt/coco/arm-cca-host/rmi-da.h |  4 ++++
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/virt/coco/arm-cca-host/main.c b/drivers/virt/coco/arm-cca-host/main.c
index d357bad14325..b74fe1fb14fd 100644
--- a/drivers/virt/coco/arm-cca-host/main.c
+++ b/drivers/virt/coco/arm-cca-host/main.c
@@ -113,6 +113,23 @@ static inline void free_dev_communication_buffers(struct cca_host_comm_data *com
 	free_page((unsigned long)comm_data->io_params);
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
@@ -127,6 +144,7 @@ static int cca_root_port_pdev_create(struct pci_dev *rp, struct tsm_dev *tsm_dev
 	rp->tsm->dsm_dev = rp;
 	rp->tsm->pdev = rp;
 	rp->tsm->tsm_dev = tsm_dev;
+	kref_init(&rp_dsc->tsm_ref);
 	mutex_init(&rp_dsc->pdev.object_lock);
 
 	ret = init_dev_communication_buffers(rp, &rp_dsc->pdev.comm_data);
@@ -198,12 +216,15 @@ static int cca_pdev_create_ncoh_stream(struct pci_dev *pdev, unsigned long strea
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
 	params->stream_type = RMI_PDEV_STREAM_NCOH;
@@ -213,7 +234,9 @@ static int cca_pdev_create_ncoh_stream(struct pci_dev *pdev, unsigned long strea
 	params->num_addr_range = pci_dev_addr_range(pdev, params->addr_range);
 
 	ret = cca_pdev_stream_connect(pdev, rp, params, &stream_handle);
-	if (!ret)
+	if (ret)
+		cca_root_port_pdev_put(rp_dsc);
+	else
 		pf0_ep_dsc->stream_handle = stream_handle;
 
 	free_page((unsigned long)params);
@@ -339,6 +362,8 @@ static void __maybe_unused cca_tsm_disconnect(struct pci_dev *pdev)
 		ide = pf0_ep_dsc->sel_stream;
 
 	cca_pdev_disconnect_stream(pdev, rp, pf0_ep_dsc->stream_handle);
+	if (rp)
+		cca_root_port_pdev_put(to_cca_rp_dsc(rp));
 
 	cca_pdev_stop_and_destroy(pdev);
 	free_dev_communication_buffers(&pf0_ep_dsc->pdev.comm_data);
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.h b/drivers/virt/coco/arm-cca-host/rmi-da.h
index ed5d3a58096d..b76cb4af8436 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.h
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.h
@@ -12,6 +12,9 @@
 #include <linux/pci-ide.h>
 #include <linux/pci-tsm.h>
 #include <linux/sizes.h>
+#include <linux/atomic.h>
+#include <linux/kref.h>
+#include <linux/wait.h>
 
 #define MAX_CACHE_OBJ_SIZE	SZ_16M
 #define CACHE_CHUNK_SIZE	SZ_4K
@@ -104,6 +107,7 @@ struct cca_host_pf0_ep_dsc {
 struct cca_host_rp_dsc {
 	struct pci_tsm pci;
 	struct cca_host_pdev_dsc pdev;
+	struct kref tsm_ref;
 };
 
 struct cca_host_fn_dsc {
-- 
2.43.0


