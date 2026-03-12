Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3A5FED2E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBSCQMX3JeHRXjOC3VACdRHEDUQ9zs+C7wH07h0Q1L4=; b=VF9GjSQD//QxHBE9whFpAsHE1Q
	th5hl5rmhfsBFQOV86iRXtuW4hS06H01UmleQYWl6767FTzsm8GJTc6borE9r3O2Xkp5UrmwOzBBl
	qXJ9DKHXu/vTTcPU/RFbBWJ69jM0W78+eWAlpKRovCWoJDwOdHl2VUn2JPWHMOjJXJjJML9fTptvY
	pFTo3aG/PoHcy8BdqfFpfyYqL9DRDPGZ/1NJt6tRcZNFSaUDazOF5tSdCsjLXKlj9junZ18Zsw49l
	6pgQEHQfnN4whqXo1MbjXSQYY7hdFohcH3PY2pyOQ8psW+9sC7FTqaAhS9XjdNjHtnvIKNonHIeq+
	dMmpK+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b3G-0000000Dagy-08Tz;
	Thu, 12 Mar 2026 08:05:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b3E-0000000DafQ-0Smm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:05:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC6C44093F;
	Thu, 12 Mar 2026 08:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A51C2BC87;
	Thu, 12 Mar 2026 08:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302747;
	bh=AFb8qJO3yWFdMCBJS62LAGaVA5aASPEzQ42qXitN/5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MsiNiQ2A1lQ/hM/cQN23aHdmLk1FOoDo9pAPQ+2JqE5rwwY0qASoqRpx8WO5Pj2fx
	 eOoB1LM28zq0L9qyeulid+8ckcJ5WMv6SlVbheaDya78YpTox3dYsSgO/F85RhsGO4
	 mOM7+DKWURuImM2jjaixR6sF5MIL71VTxR5SrR2oWTLcr/qOq7jrsBnp3jDJeFSlE8
	 MccIBHoZDP+7YZByHFlMAS42qTmJy0cyC8hS+IHEoc3BzrmWQsMOJHaJjjJPwhElWe
	 oxfzH8Z3yYvo15kWhgfqBhaYD/BaN5dsJzQwe95UfFVuQUPGRX3cimhs/kAhINTwLw
	 0RD12oON2gDeQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Dan Williams <dan.j.williams@intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [RFC PATCH v3 09/11] coco: guest: arm64: Hook TSM accept to Realm TDISP RUN transition
Date: Thu, 12 Mar 2026 13:34:40 +0530
Message-ID: <20260312080442.3485633-10-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080442.3485633-1-aneesh.kumar@kernel.org>
References: <20260312080442.3485633-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_010548_188041_239B2DF6 
X-CRM114-Status: GOOD (  14.27  )
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

Add an accept callback in pci_tsm_ops and implement cca_device_accept() to:
- verify evidence generation (lock_nonce)
- allocate and register protected MMIO ranges
- transition TDI state to RUN

Cc: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Samuel Ortiz <sameo@rivosinc.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/arm-cca-guest/arm-cca.c | 20 +++++++++++
 drivers/virt/coco/arm-cca-guest/rsi-da.c  | 43 +++++++++++++++++++++++
 drivers/virt/coco/arm-cca-guest/rsi-da.h  |  1 +
 3 files changed, 64 insertions(+)

diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca.c b/drivers/virt/coco/arm-cca-guest/arm-cca.c
index 80ee20c8a7a6..84152f505b10 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
@@ -499,9 +499,29 @@ static void cca_tsm_unlock(struct pci_tsm *tsm)
 	kfree(cca_dsc);
 }
 
+static int __cca_tsm_accept(struct pci_dev *pdev, unsigned long lock_nonce)
+{
+	int ret;
+
+	ret = cca_device_accept(pdev, lock_nonce);
+	if (ret) {
+		pci_err(pdev, "failed to transition the device to run state (%d)\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int cca_tsm_accept(struct pci_dev *pdev)
+{
+	struct cca_guest_dsc *dsc = to_cca_guest_dsc(pdev);
+
+	return __cca_tsm_accept(pdev, dsc->dev_info.lock_nonce);
+}
+
 static struct pci_tsm_ops cca_devsec_pci_ops = {
 	.lock = cca_tsm_lock,
 	.unlock = cca_tsm_unlock,
+	.accept	 = cca_tsm_accept,
 };
 
 static void cca_devsec_tsm_remove(void *tsm_dev)
diff --git a/drivers/virt/coco/arm-cca-guest/rsi-da.c b/drivers/virt/coco/arm-cca-guest/rsi-da.c
index 6f40329ac2f9..4030fa213ff4 100644
--- a/drivers/virt/coco/arm-cca-guest/rsi-da.c
+++ b/drivers/virt/coco/arm-cca-guest/rsi-da.c
@@ -230,3 +230,46 @@ int cca_verify_digests(u64 hash_algo,
 	}
 	return 0;
 }
+
+int cca_device_accept(struct pci_dev *pdev, unsigned long lock_nonce)
+{
+	int ret;
+	struct cca_guest_dsc *dsc = to_cca_guest_dsc(pdev);
+
+	if (lock_nonce != dsc->dev_info.lock_nonce) {
+		pci_err(pdev, "Device evidence generation mismatch\n");
+		return -EIO;
+	}
+
+	/* Allocation private mmio range based on interface report. */
+	struct pci_tsm_mmio *tsm_mmio __free(kfree) = pci_tsm_mmio_alloc(pdev);
+	if (!tsm_mmio) {
+		pci_err(pdev, "Protected mmio range allocation failure\n");
+		return -ENOMEM;
+	}
+
+	/*
+	 * Present the private mmio range in the resource hierarchy.
+	 * We don't use this for ioremap, ioremap check the RIPAS value.
+	 */
+	ret = pci_tsm_mmio_setup(pdev, tsm_mmio);
+	if (ret) {
+		pci_err(pdev, "Protected mmio setup failure\n");
+		return ret;
+	}
+
+	ret = cca_map_evidence_report_range(pdev, tsm_mmio);
+	if (ret) {
+		pci_err(pdev, "failed to validate the interface report\n");
+		return ret;
+	}
+
+	ret = rhi_vdev_set_tdi_state(pdev, RHI_DA_TDI_CONFIG_RUN);
+	if (ret) {
+		pci_err(pdev, "failed to switch the device (%u) to RUN state\n", ret);
+		return ret;
+	}
+
+	dsc->pci.mmio = no_free_ptr(tsm_mmio);
+	return 0;
+}
diff --git a/drivers/virt/coco/arm-cca-guest/rsi-da.h b/drivers/virt/coco/arm-cca-guest/rsi-da.h
index 4903a770412e..c550926145a0 100644
--- a/drivers/virt/coco/arm-cca-guest/rsi-da.h
+++ b/drivers/virt/coco/arm-cca-guest/rsi-da.h
@@ -61,4 +61,5 @@ int cca_verify_digests(u64 hash_algo,
 		       uint8_t *interface_report, size_t interface_report_size,
 		       uint8_t *measurements, size_t measurements_size,
 		       struct rsi_vdevice_info *dev_info);
+int cca_device_accept(struct pci_dev *pdev, unsigned long lock_nonce);
 #endif
-- 
2.43.0


