Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85761FF8865
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4unWz4maZvtP2Q/GuF1Z/etqGKXGNwJzbXUS6cBGR3E=; b=V/bVlJcX1tZxpZnoxdYRVscj5Z
	j1R6ha+W2MFnZ3OF5c7tnKGhg+GANlBWjsnUn95exfnwaf7VTkHXvZ/dTQ3NmyAc4bPpISnjX3QUJ
	izpB27ecJNZfBcBoKLj0EzGmN3gkXX9kQPmClsiFSbvPj0lal1jJmjjlPA6fuIKeiFM+q573zgibl
	vhgxfwNbq5dN07UdZajxj1yEITt5vu8RiJGADmTqwp4lWFPigJJKmF/t+02+thENEvyQozz5PI06s
	R5W6jrsr9/xaQ/UG/7zkZI8Bh4PhD6pNXY5obEvjGNSKRLReJYL0mSCBqrm7LXwcK56NSmdFI2Chh
	9zYpivWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFp2-0000000GIBS-3CBx;
	Mon, 27 Apr 2026 06:52:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFp0-0000000GI9v-1lJO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:51:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D60DA6014B;
	Mon, 27 Apr 2026 06:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D439AC2BCB6;
	Mon, 27 Apr 2026 06:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777272717;
	bh=VdMmOEU+WLMyu9cmy2MbebMhWXlrd9XagLeJX1bJz2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mHDcAh0MjFFeCWsaT8LYI3QxIrELTsBuhydteOCg89CSXExibrFJGp9JHQD0mro0A
	 gvfeLdJ3KCcsVRL7u6phEJL50TC0CnBxBDiVcG8yddDXuHW/UrehMu0dF7dB0RY7ci
	 dwJnorCauY+KnLrstUcajhrgnmkKVfahoJmwIWpgYv3Kh+ti/CFM6pn4dYWB2JioEl
	 yITWmUYSAubJYKkDqs6xen8abOLlyi04nf+pys2kjNiGkI0wiaP6AZ/e840rZYzKZU
	 nBkVmq+KrA6uNSONIXOuoe0LgHCtJkO0cU1RWja2cz8W437/e7KylIz7FvReSf4VCf
	 k3zMy3wvToIWQ==
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
Subject: [RFC PATCH v4 04/14] coco: host: arm64: Add helper to stop and tear down an RMM pdev
Date: Mon, 27 Apr 2026 12:21:11 +0530
Message-ID: <20260427065121.916615-5-aneesh.kumar@kernel.org>
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

Add helper to stop and tear down an RMM pdev
- describe the RMI_PDEV_STOP/RMI_PDEV_DESTROY SMC IDs and provide
  wrappers in rmi_cmds.h
- implement pdev_stop_and_destroy() so the host driver stops the pdev,
  waits for it to reach RMI_PDEV_STOPPED and destroys it

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rmi_cmds.h       |  9 +++++
 drivers/virt/coco/arm-cca-host/rmi-da.c | 47 ++++++++++++++++++++++++-
 drivers/virt/coco/arm-cca-host/rmi-da.h |  1 +
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
index 6664c439173f..8024e9d89e55 100644
--- a/arch/arm64/include/asm/rmi_cmds.h
+++ b/arch/arm64/include/asm/rmi_cmds.h
@@ -756,4 +756,13 @@ static inline unsigned long rmi_pdev_abort(unsigned long pdev_phys)
 	return res.a0;
 }
 
+static inline unsigned long rmi_pdev_stop(unsigned long pdev_phys)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_PDEV_STOP, pdev_phys, &res);
+
+	return res.a0;
+}
+
 #endif /* __ASM_RMI_CMDS_H */
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.c b/drivers/virt/coco/arm-cca-host/rmi-da.c
index dc159d9f2c24..8a43a1f1c036 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.c
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.c
@@ -399,7 +399,7 @@ static void pdev_state_transition_workfn(struct work_struct *work)
 	WARN_ON(state != setup_work->target_state);
 }
 
-static int __maybe_unused submit_pdev_state_transition_work(struct pci_dev *pdev,
+static int submit_pdev_state_transition_work(struct pci_dev *pdev,
 		enum rmi_pdev_state target_state)
 {
 	enum rmi_pdev_state state;
@@ -425,3 +425,48 @@ static int __maybe_unused submit_pdev_state_transition_work(struct pci_dev *pdev
 		return -1;
 	return 0;
 }
+
+static inline int rmi_pdev_destroy(unsigned long pdev_phys,
+			   unsigned long *rmi_ret)
+{
+	struct rmi_sro_state *sro __free(sro) =
+		rmi_sro_init(SMC_RMI_PDEV_DESTROY, pdev_phys);
+	if (!sro)
+		return -ENOMEM;
+
+	*rmi_ret = rmi_sro_execute(sro);
+
+	return 0;
+}
+
+void cca_pdev_stop_and_destroy(struct pci_dev *pdev)
+{
+	int ret;
+	unsigned long rmi_ret;
+	struct cca_host_pdev_dsc *pdev_dsc = to_cca_pdev_dsc(pdev);
+	struct cca_host_pf0_ep_dsc *pf0_ep_dsc = to_cca_pf0_ep_dsc(pdev);
+	phys_addr_t rmm_pdev_phys = virt_to_phys(pdev_dsc->rmm_pdev);
+
+	if (WARN_ON(rmi_pdev_stop(rmm_pdev_phys)))
+		return;
+
+	ret = submit_pdev_state_transition_work(pdev, RMI_PDEV_STOPPED);
+	if (ret)
+		return;
+
+	ret = rmi_pdev_destroy(rmm_pdev_phys, &rmi_ret);
+	if (WARN_ON(ret || rmi_ret))
+		return;
+
+	if (pf0_ep_dsc) {
+		kfree(pf0_ep_dsc->cert_chain.public_key);
+		kvfree(pf0_ep_dsc->cert_chain.cache);
+		kvfree(pf0_ep_dsc->vca);
+		pf0_ep_dsc->cert_chain.cache = NULL;
+		pf0_ep_dsc->vca = NULL;
+	}
+
+	if (!rmi_undelegate_page(rmm_pdev_phys))
+		free_page((unsigned long)pdev_dsc->rmm_pdev);
+	pdev_dsc->rmm_pdev = NULL;
+}
diff --git a/drivers/virt/coco/arm-cca-host/rmi-da.h b/drivers/virt/coco/arm-cca-host/rmi-da.h
index 9f72ff8f28bf..784eb1fff95d 100644
--- a/drivers/virt/coco/arm-cca-host/rmi-da.h
+++ b/drivers/virt/coco/arm-cca-host/rmi-da.h
@@ -133,5 +133,6 @@ static inline struct cca_host_comm_data *to_cca_comm_data(struct pci_dev *pdev)
 }
 
 int cca_pdev_create(struct pci_dev *pdev);
+void cca_pdev_stop_and_destroy(struct pci_dev *pdev);
 
 #endif
-- 
2.43.0


