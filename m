Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62DCFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmN93SAdyNT7jyd0h9AmPweF50wRx8RGcKhMvEqKvRo=; b=ea6LD2GrK3WqW0r18kb2zs0t6I
	1rTLFvxbFnOta/2p6s9l0AKrH5MGiiJAooSOfsus8iLH+z1lvADIKwBucy7BdG2tlnUDa1+H1IY5p
	LSMzO9tRGdkcI9Zmd91sAph3XAm01U5kftBykkoEBgHWyB2XoBsI8bz5DmHnhGcSPI/Br4F2vFFwg
	pHUoiMN2yHrjUEDzbpZdcbbjNv2iSmKoeObwB2Db/1M55mbA1Xeh8wQr4Z87sl1dwMFlQtT65VjA8
	ATHJNVjXq6ZyaXTH2qh+j2x7sU49gm7ElADSAyOH0P1tjzKYjrEbmqvFNjBCm4rycaFpr+KnnrYzU
	eEdBjZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFpX-0000000GIWL-1nEV;
	Mon, 27 Apr 2026 06:52:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFpT-0000000GISZ-1XiS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:52:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6BF860138;
	Mon, 27 Apr 2026 06:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF739C19425;
	Mon, 27 Apr 2026 06:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777272746;
	bh=c/swTFYXP2qdXTxfLvAWfMN1SMlHP5XuNC+j5JT3jV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FoKtPFr+3ScWKwc6SzA0v/siEGUsjOevvKFwVDKE1gQyi8VHELmD9aHvocV7Thplp
	 XZ5iwO/wljdRJEqz+ZzpUi7i9xV+DhSKOf8UrFhv4ctVK/S4JiIWKPhb1+AX0losIK
	 1tnkSXXrtwKzvK8KDNYOVPIXsAoPMRd7NqxGAbVEcsLZGMptGJ/0uUbhtkE2Rt2Y9K
	 f2gchITpsR5HMzsB49XOel9wcX7i13tKHlB7EPzma4wIMpfyeS1ZjUFTzFSM4GI7ny
	 TcUTzvUOLiX0KVmZC100zJRj+Hzrf878O+NJiKMmMPBOgEfrPHDb+NavuGaQ0G47PT
	 UrXGR0+Q/8IAg==
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
Subject: [RFC PATCH v4 09/14] coco: host: arm64: Initialize RMM pdev state for TDISP IDE connect
Date: Mon, 27 Apr 2026 12:21:16 +0530
Message-ID: <20260427065121.916615-10-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427065121.916615-1-aneesh.kumar@kernel.org>
References: <20260427065121.916615-1-aneesh.kumar@kernel.org>
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

Update connect() to:
- allocate device-communication buffers,
- create the RMM pdev object,
- perform initial device communication to collect identity, and
- set the device public key when the pdev enters NEEDS_KEY.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/arm-cca-host/arm-cca.c | 43 +++++++++--
 drivers/virt/coco/arm-cca-host/rmi-da.c  | 92 +++++++++++++++++++++++-
 drivers/virt/coco/arm-cca-host/rmi-da.h  |  3 +
 3 files changed, 128 insertions(+), 10 deletions(-)

diff --git a/drivers/virt/coco/arm-cca-host/arm-cca.c b/drivers/virt/coco/arm-cca-host/arm-cca.c
index 3c854aab95cc..f0aa4e46e96c 100644
--- a/drivers/virt/coco/arm-cca-host/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-host/arm-cca.c
@@ -66,7 +66,7 @@ static void cca_tsm_pci_remove(struct pci_tsm *tsm)
 	}
 }
 
-static __maybe_unused int init_dev_communication_buffers(struct pci_dev *pdev,
+static int init_dev_communication_buffers(struct pci_dev *pdev,
 		struct cca_host_comm_data *comm_data)
 {
 	int ret = -ENOMEM;
@@ -184,15 +184,40 @@ static int cca_tsm_connect(struct pci_dev *pdev)
 		ret = tsm_ide_stream_register(ide);
 		if (ret)
 			goto err_tsm;
+	}
 
-		/*
-		 * Once ide is setup, enable the stream at the endpoint
-		 * Root port will be done by RMM
-		 */
-		pci_ide_stream_enable(pdev, ide);
+	ret = init_dev_communication_buffers(pdev, &pf0_ep_dsc->pdev.comm_data);
+	if (ret)
+		goto err_comm_buff;
+	ret = cca_pdev_create(pdev);
+	if (ret)
+		goto err_pdev_create;
+
+	ret = cca_pdev_collect_identity(pdev);
+	if (ret)
+		goto pdev_destroy;
+
+	if (cca_pdev_needs_key(pdev)) {
+		ret = cca_pdev_set_public_key(pdev);
+		if (ret)
+			goto pdev_destroy;
 	}
+	/*
+	 * Once ide is setup, enable the stream at the endpoint
+	 * Root port will be done by RMM
+	 */
+	if (cca_pdev_need_sel_ide_streams(pdev))
+		pci_ide_stream_enable(pdev, ide);
+
 	return 0;
 
+pdev_destroy:
+	cca_pdev_stop_and_destroy(pdev);
+err_pdev_create:
+	free_dev_communication_buffers(&pf0_ep_dsc->pdev.comm_data);
+err_comm_buff:
+	if (cca_pdev_need_sel_ide_streams(pdev))
+		tsm_ide_stream_unregister(ide);
 err_tsm:
 	if (cca_pdev_need_sel_ide_streams(pdev)) {
 		pci_ide_stream_teardown(rp, ide);
@@ -222,12 +247,16 @@ static void cca_tsm_disconnect(struct pci_dev *pdev)
 	if (cca_pdev_need_sel_ide_streams(pdev)) {
 		ide = pf0_ep_dsc->sel_stream;
 		stream_id = ide->stream_id;
+	}
+
+	cca_pdev_stop_and_destroy(pdev);
+	free_dev_communication_buffers(&pf0_ep_dsc->pdev.comm_data);
 
+	if (cca_pdev_need_sel_ide_streams(pdev)) {
 		pci_ide_stream_release(ide);
 		pf0_ep_dsc->sel_stream = NULL;
 		clear_bit(stream_id, cca_stream_ids);
 	}
-
 }
 
 static struct pci_tsm_ops cca_link_pci_ops = {
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.c b/drivers/virt/coco/arm-cca-host/rmi-da.c
index 996979dba709..cb654d1b2eb3 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.c
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.c
@@ -386,7 +386,7 @@ static int wait_for_pdev_state(struct pci_tsm *tsm, enum rmi_pdev_state target_s
 	return wait_for_dev_state(PDEV_COMMUNICATE, tsm, target_state, RMI_PDEV_ERROR);
 }
 
-static int __maybe_unused parse_certificate_chain(struct pci_tsm *tsm)
+static int parse_certificate_chain(struct pci_tsm *tsm)
 {
 	struct cca_host_pf0_ep_dsc *pf0_ep_dsc;
 	unsigned int chain_size;
@@ -484,7 +484,7 @@ static inline int copy_key_part(u8 *buf, const u8 *key_buf, size_t sz)
 }
 
 DEFINE_FREE(key_param_free, struct rmi_public_key_params *, if (_T) key_param_free(_T))
-static int __maybe_unused pdev_set_public_key(struct pci_tsm *tsm)
+static int pdev_set_public_key(struct pci_tsm *tsm)
 {
 	struct cca_host_pf0_ep_dsc *pf0_ep_dsc;
 
@@ -581,8 +581,94 @@ static int submit_pdev_state_transition_work(struct pci_dev *pdev,
 	return 0;
 }
 
+static void pdev_collect_identity_workfn(struct work_struct *work)
+{
+	struct pci_tsm *tsm;
+	struct dev_comm_work *setup_work;
+	struct cca_host_pdev_dsc *pdev_dsc;
+
+	setup_work = container_of(work, struct dev_comm_work, work);
+	tsm = setup_work->tsm;
+	pdev_dsc = to_cca_pdev_dsc(tsm->dsm_dev);
+
+	guard(mutex)(&pdev_dsc->object_lock);
+
+	do_dev_communicate(PDEV_COMMUNICATE, tsm, RMI_PDEV_ERROR);
+
+	/*
+	 * Don't worry about communication error. The caller will look at
+	 * device state to find more about error
+	 */
+}
+
+int cca_pdev_collect_identity(struct pci_dev *pdev)
+{
+	enum rmi_pdev_state state;
+	struct dev_comm_work comm_work;
+	struct cca_host_pdev_dsc *pdev_dsc = to_cca_pdev_dsc(pdev);
+	struct cca_host_comm_data *comm_data = to_cca_comm_data(pdev);
+
+	/*
+	 * Device identity is collected by doing a device communication
+	 * after a pdev_create
+	 */
+	INIT_WORK_ONSTACK(&comm_work.work, pdev_collect_identity_workfn);
+	comm_work.tsm = pdev->tsm;
+
+	queue_work(comm_data->work_queue, &comm_work.work);
+
+	flush_work(&comm_work.work);
+	destroy_work_on_stack(&comm_work.work);
+
+	/* check for device communication error*/
+	if (rmi_pdev_get_state(virt_to_phys(pdev_dsc->rmm_pdev), &state))
+		return -EIO;
+
+	if (state == RMI_PDEV_ERROR)
+		return -EPROTO;
+
+	return 0;
+}
+
+bool cca_pdev_needs_key(struct pci_dev *pdev)
+{
+	enum rmi_pdev_state state;
+	struct cca_host_pdev_dsc *pdev_dsc = to_cca_pdev_dsc(pdev);
+
+	/*
+	 * Consider pdev_get_state failure as need key transition
+	 * and that will result in device communication failure, which
+	 * will handle this error.
+	 */
+	if (rmi_pdev_get_state(virt_to_phys(pdev_dsc->rmm_pdev), &state))
+		return true;
+
+	if (state == RMI_PDEV_NEEDS_KEY)
+		return true;
+	return false;
+}
+
+int cca_pdev_set_public_key(struct pci_dev *pdev)
+{
+	int ret;
+
+	/*
+	 * we now have certificate chain in dsm->cert_chain. Parse that and set
+	 * the pubkey.
+	 */
+	ret = parse_certificate_chain(pdev->tsm);
+	if (ret)
+		return ret;
+
+	ret = pdev_set_public_key(pdev->tsm);
+	if (ret)
+		return ret;
+
+	return submit_pdev_state_transition_work(pdev, RMI_PDEV_READY);
+}
+
 static inline int rmi_pdev_destroy(unsigned long pdev_phys,
-			   unsigned long *rmi_ret)
+		unsigned long *rmi_ret)
 {
 	struct rmi_sro_state *sro __free(sro) =
 		rmi_sro_init(SMC_RMI_PDEV_DESTROY, pdev_phys);
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.h b/drivers/virt/coco/arm-cca-host/rmi-da.h
index 7d38e548b659..240b2993ae53 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.h
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.h
@@ -135,6 +135,9 @@ static inline struct cca_host_comm_data *to_cca_comm_data(struct pci_dev *pdev)
 }
 
 int cca_pdev_create(struct pci_dev *pdev);
+int cca_pdev_collect_identity(struct pci_dev *pdev);
+bool cca_pdev_needs_key(struct pci_dev *pdev);
+int cca_pdev_set_public_key(struct pci_dev *pdev);
 void cca_pdev_stop_and_destroy(struct pci_dev *pdev);
 
 #endif
-- 
2.43.0


