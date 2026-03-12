Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D23DFED2E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFt0wV0dGz06pYWhrhL9XwF8NljX3erbOsb9IGlzi/s=; b=G9kbgZYFyV/2ttHBPFVOR7+Oui
	6ORnkhF45xUyVlKyY0oXcAPxWpCNAHEa0vJ9ZKbYq7Nd9QZXs1c7Bjp3G0P9R9d8yhyi71TahmFHr
	54zRkWQVWziG/axjvKKHevPZ7cjxbz53FVJCswcQxKZii3+x+41cMKOmtFZ7tGSUMn/AAODiSrkh9
	Vux502pvdZOZD2/vbsZZgZuGLJxuJp/wCWr2H5yHTwPOi/n5gZJG0dmiRtMdk3QaPDPvfHwilTQdL
	fOQUd76OnZaVeTZoJEzUNlKAPnM2vtFD+icsN/7MVlUKYGegyw8Ju/sbfbEn0vjophe06EQ2H7crh
	rjWDFzyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b0B-0000000DZSb-1Nmm;
	Thu, 12 Mar 2026 08:02:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b07-0000000DZQR-2Gfw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:02:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31CE544332;
	Thu, 12 Mar 2026 08:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27E6C2BCB0;
	Thu, 12 Mar 2026 08:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302555;
	bh=za/IJI/M4boNse0krvOPCedzdOn+suKa0F46ZZO+gZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RI+nA7ukMybNnkm3lH6oVEgqiYcpyFBnzTFL2NOQgUdbOm74tb7wEhZUC/D/XXy4r
	 +4cOwBl14c/GXbc4AtgSZpsLAhoEMvkVKLvlFz9ROvUyWhAaSnUhdhHQXcYjq7M78W
	 Av0vAr7sM9UvyMb9lFS79sYWoDMUd6NLqRoa+YyjVuf+jMmVGR1ojevgW5QXjSRNrG
	 CbbiQOggMSfgBdEaMxXQq6/uPscz4Ad8mxTS/+5+dYVemLKkDPhXZdq7WIcYXPYw4D
	 dblKI6MXASVTOqJvhlmyOwyP2MQkwDstJZm4wvBSzxNHs3Oqf7H76ozgOHcPIrafMr
	 u0jbUW/HX0chw==
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
Subject: [RFC PATCH v3 06/10] coco: host: arm64: Instantiate RMM pdev during device connect
Date: Thu, 12 Mar 2026 13:31:25 +0530
Message-ID: <20260312080129.3483585-7-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080129.3483585-1-aneesh.kumar@kernel.org>
References: <20260312080129.3483585-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_010235_710955_B0FD3208 
X-CRM114-Status: GOOD (  11.99  )
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

An RMM pdev object represents a communication channel between the RMM
and a physical device, for example a PCIe device. With the required
helpers now in place, update the connect callback to create an RMM pdev
object.

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
 drivers/virt/coco/arm-cca-host/arm-cca.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/virt/coco/arm-cca-host/arm-cca.c b/drivers/virt/coco/arm-cca-host/arm-cca.c
index 4ed5e8ec9e91..987c1be566ba 100644
--- a/drivers/virt/coco/arm-cca-host/arm-cca.c
+++ b/drivers/virt/coco/arm-cca-host/arm-cca.c
@@ -67,8 +67,8 @@ static void cca_tsm_pci_remove(struct pci_tsm *tsm)
 	}
 }
 
-static __maybe_unused int init_dev_communication_buffers(struct pci_dev *pdev,
-							 struct cca_host_comm_data *comm_data)
+static int init_dev_communication_buffers(struct pci_dev *pdev,
+					  struct cca_host_comm_data *comm_data)
 {
 	int ret = -ENOMEM;
 
@@ -172,6 +172,16 @@ static int cca_tsm_connect(struct pci_dev *pdev)
 	if (rc)
 		goto err_tsm;
 
+	rc = init_dev_communication_buffers(pdev, &pf0_dsc->comm_data);
+	if (rc)
+		goto err_comm_buff;
+	rc = cca_pdev_create(pdev);
+	if (rc)
+		goto err_pdev_create;
+
+	rc = cca_pdev_ide_setup(pdev);
+	if (rc)
+		goto err_ide_setup;
 	/*
 	 * Once ide is setup, enable the stream at the endpoint
 	 * Root port will be done by RMM
@@ -179,6 +189,12 @@ static int cca_tsm_connect(struct pci_dev *pdev)
 	pci_ide_stream_enable(pdev, ide);
 	return 0;
 
+err_ide_setup:
+	cca_pdev_stop_and_destroy(pdev);
+err_pdev_create:
+	free_dev_communication_buffers(&pf0_dsc->comm_data);
+err_comm_buff:
+	tsm_ide_stream_unregister(ide);
 err_tsm:
 	pci_ide_stream_teardown(rp, ide);
 	pci_ide_stream_teardown(pdev, ide);
@@ -205,6 +221,9 @@ static void cca_tsm_disconnect(struct pci_dev *pdev)
 	ide = pf0_dsc->sel_stream;
 	stream_id = ide->stream_id;
 
+	cca_pdev_stop_and_destroy(pdev);
+	free_dev_communication_buffers(&pf0_dsc->comm_data);
+
 	pci_ide_stream_release(ide);
 	pf0_dsc->sel_stream = NULL;
 	clear_bit(stream_id, cca_stream_ids);
-- 
2.43.0


