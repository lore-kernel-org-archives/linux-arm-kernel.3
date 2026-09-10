Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865C8C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7scpEVVr4UU62YzdzYFb4j0SlzJSeqGX0ORVVeED+nw=; b=neDzKjTJ/mpveGXJY0/YMnkuhs
	wLwaqg9HeTp0QVKfHjx8yCmeVd0RmjiBr9be1Ncn4o+h4KXqSUIManRPQLmory9PYaRJNRgJWuSyM
	AVtSsJEEfVIyRUHef/p2tBGg37XYTs5esjJkaJEaI4uK6p9mhpEgm6qLeY2FP1J9d50O9rK7ls4B9
	KgwZENW8zN47k4JmjMLEg7mkT5mRtsccvLIS5ACxlT+LkcPEUM9W0hRtpKLZ8WzsWNlR4IugxQg+k
	0u15rxK6xiIahrmenzwDgjvrPWUy5IrJKDnDSVkRiSxFRrN+ql90Faga2WrAJcWvSi5aymwn7jvsh
	+alMMo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fQi-0000000EZeY-2Vgt;
	Thu, 10 Sep 2026 14:07:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fQd-0000000EZXp-03Si
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:07:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7287160213;
	Thu, 10 Sep 2026 14:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A321F0089B;
	Thu, 10 Sep 2026 14:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049222;
	bh=7scpEVVr4UU62YzdzYFb4j0SlzJSeqGX0ORVVeED+nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SyQiX9GXEjjt2r/KKPAuTr18MSFEFjkQhuO1GnsboRPFfeyD6Vfrcj5zGP342Hpcn
	 Vb9DMA+iGTmteG3jFNDRH2l/EJlnb7w9Hy/yttWSz9uzW2rwPVtknfqtBuvjfzjJKP
	 TNOQA8tqDfddmWhmP4g/rp93U+cZpQ5I6LckzJmB++30zG2B4KZ6GqF0CUvwzPkSR3
	 r4vyeDVLTiiq+iRX9RlWZoX2dn2GsyXC8q0dYKBf0I5fGH31YVxakjb3JI+J0BYMqm
	 VdRhoA7nstQFRxjZ+/ttRSpn38JZw6zYnRzRL0yy7yvADDdiXxnXdSCcZ0ffScjXnz
	 u95B0wYR8BwYw==
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
Subject: [PATCH v5 15/15] coco: host: arm64: Enable PCI TSM connect callbacks
Date: Thu, 10 Sep 2026 19:35:08 +0530
Message-ID: <20260910140509.868402-16-aneesh.kumar@kernel.org>
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

The previous patches build up the Arm CCA host device-assignment flow: RMM
pdev creation and teardown, device communication, public-key setup, peer
stream coordination, RMM stream connect/disconnect, and support for both
endpoint and RC endpoint stream types.

Now that the connect and disconnect paths contain the complete setup and
teardown sequence, register them in pci_tsm_ops and drop the __maybe_unused
annotations.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/arm-cca-host/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/virt/coco/arm-cca-host/main.c b/drivers/virt/coco/arm-cca-host/main.c
index b7b0cc0a016c..e8afd54c23f6 100644
--- a/drivers/virt/coco/arm-cca-host/main.c
+++ b/drivers/virt/coco/arm-cca-host/main.c
@@ -295,7 +295,7 @@ static inline bool cca_pdev_need_sel_ide_streams(struct pci_dev *pdev)
 	return pci_pcie_type(pdev) == PCI_EXP_TYPE_ENDPOINT;
 }
 
-static int __maybe_unused cca_tsm_connect(struct pci_dev *pdev)
+static int cca_tsm_connect(struct pci_dev *pdev)
 {
 	struct pci_dev *rp = pcie_find_root_port(pdev);
 	struct cca_host_pf0_ep_dsc *pf0_ep_dsc;
@@ -385,7 +385,7 @@ static int __maybe_unused cca_tsm_connect(struct pci_dev *pdev)
 	return ret;
 }
 
-static void __maybe_unused cca_tsm_disconnect(struct pci_dev *pdev)
+static void cca_tsm_disconnect(struct pci_dev *pdev)
 {
 	struct pci_ide *ide;
 	struct cca_host_pf0_ep_dsc *pf0_ep_dsc;
@@ -414,6 +414,8 @@ static void __maybe_unused cca_tsm_disconnect(struct pci_dev *pdev)
 static struct pci_tsm_ops cca_link_pci_ops = {
 	.probe = cca_tsm_pci_probe,
 	.remove = cca_tsm_pci_remove,
+	.connect = cca_tsm_connect,
+	.disconnect = cca_tsm_disconnect,
 };
 
 static void cca_link_tsm_remove(void *tsm_dev)
-- 
2.43.0


