Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B40C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 14:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2QnWjTSHwxB92B00qL7pBKZb5JtqRbD8zPu116lDU4=; b=kKelAGuNT+1U06oducJKZwsU5n
	kudXRVp8e8sMBS3dPoyavsmuWrEycoyfjacTRmbPgZWoZcnDJEgLQLlzdBJT4aweE11W76uOcbPIt
	T1KUuylsjMAUNOej3sEmNqctm50YDBBgFBcrnaI4dKp92RPtK+lfV+qnmTE9Vt+ibD7p4z5SuEfGa
	4jTzgtutb+zeXaothtbOPwVP/JtPwXYhWnuqT4TT39Tl0YRlAIZirDrorvc0uaFhT8ltqEGV/eoat
	iht8KyzQdCXxuGvHZQhdAp9I6hUvmxAHDnijjO5tXqpcotHzbXWep96PPZ4s2daYWnJ+scj3o6x1N
	tg2/yRrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOye-00000008dkR-0mFe;
	Tue, 18 Feb 2025 14:53:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOia-00000008Zjv-0ohf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 14:37:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E27BA41054;
	Tue, 18 Feb 2025 14:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7882BC4CEEC;
	Tue, 18 Feb 2025 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739889418;
	bh=96dzHbNUlonjbIF4OjJogOraBYUUAqyVClMsMXe91/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mi1FAJjdE5tCGT+xgGO+2PtN+j4OMI4wQjoObwvkV+7oSqqLTI9nt/kXTO9ajuliB
	 W2DfOFP4siqKsKWg4IeVTVFVbLPJ/WoifbO7m8VcwmYUPuTLsCOHm0YgMLEfdYt859
	 odnppm7yEz+HFsZJz+B5cQZQv6lZdMNw6r7GXqK8OprqJrfmWvLlJN+ancb+33hKZC
	 rz+S67v0YrRRukViKCmg9n2FYz0r0i77dwaBsm19YU/tKDcrUxYLFdHAKcSBx6RhZa
	 N/m7NjSYWHK5gYT6varQ3sF+UPFvLFbzTU9WY8jho2OJMqlHhIjFbzf0zGbBDfJe6A
	 aZ4uQXgkWheNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8F5C02198;
	Tue, 18 Feb 2025 14:36:58 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Tue, 18 Feb 2025 20:06:43 +0530
Subject: [PATCH 4/4] PCI: qcom-ep: Mask PTM_UPDATING interrupt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-pcie-qcom-ptm-v1-4-16d7e480d73e@linaro.org>
References: <20250218-pcie-qcom-ptm-v1-0-16d7e480d73e@linaro.org>
In-Reply-To: <20250218-pcie-qcom-ptm-v1-0-16d7e480d73e@linaro.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>, 
 Jing Zhang <renyu.zj@linux.alibaba.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>
Cc: Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=X8FrHGG/Y5bqtzA78r7NFQEcJV50dm29EwABf+RgvWo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBntJsHhjGbHY6Q7I/y/ze6vd3blhN1A0HrKeF+F
 yr/ctlRT0KJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ7SbBwAKCRBVnxHm/pHO
 9UzoCACPUS9F6y/oWa2xHAIMf40x74TmzYyirduM/fPhPjn597iCw0IwZxVLOEI3IRYlnVT1RDo
 mcd10VKMQ8VlNnJ6x6frBvsGlur7q3MQUIsXcV+THeCgIKy3OgtpFTtTK6bhZn37Zrd+x0PcNpV
 y1yl7ZfgaYktanFCAigjXnpuMsmP+tuxXilWIwARjnCON+sVJ9qVyGaa6yRoUR/YCWUbQmLTM2H
 PAbIM1OB/mBew1IK24SX65V+vKmT3MjdFlhSMmcrLDugije2FR0DUSTUqffXehJjYmMZ1OHV+eR
 MxuVOFB27w1mdmz7fWLLwKEMcOgDestH4kocGjtFMi3tE/8U
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_063700_392136_6E7C14B1 
X-CRM114-Status: GOOD (  11.75  )
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
Reply-To: manivannan.sadhasivam@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

When PTM is enabled, PTM_UPDATING interrupt will be fired for each PTM
context update, which will be once every 10ms in the case of auto context
update. Since the interrupt is not strictly needed for making use of PTM,
mask it to avoid the overhead of processing it.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index c08f64d7a825..940edb7be1b9 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -60,6 +60,7 @@
 #define PARF_DEVICE_TYPE			0x1000
 #define PARF_BDF_TO_SID_CFG			0x2c00
 #define PARF_INT_ALL_5_MASK			0x2dcc
+#define PARF_INT_ALL_3_MASK			0x2e18
 
 /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
 #define PARF_INT_ALL_LINK_DOWN			BIT(1)
@@ -132,6 +133,9 @@
 /* PARF_INT_ALL_5_MASK fields */
 #define PARF_INT_ALL_5_MHI_RAM_DATA_PARITY_ERR	BIT(0)
 
+/* PARF_INT_ALL_3_MASK fields */
+#define PARF_INT_ALL_3_PTM_UPDATING		BIT(4)
+
 /* ELBI registers */
 #define ELBI_SYS_STTS				0x08
 #define ELBI_CS2_ENABLE				0xa4
@@ -497,6 +501,10 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 		writel_relaxed(val, pcie_ep->parf + PARF_INT_ALL_5_MASK);
 	}
 
+	val = readl_relaxed(pcie_ep->parf + PARF_INT_ALL_3_MASK);
+	val &= ~PARF_INT_ALL_3_PTM_UPDATING;
+	writel_relaxed(val, pcie_ep->parf + PARF_INT_ALL_3_MASK);
+
 	ret = dw_pcie_ep_init_registers(&pcie_ep->pci.ep);
 	if (ret) {
 		dev_err(dev, "Failed to complete initialization: %d\n", ret);

-- 
2.25.1



