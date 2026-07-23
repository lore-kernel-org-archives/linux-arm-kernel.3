Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5883CC531CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 13:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2tQlw9S+XzARxKHtU5qzXROAftVW1WJXlzvs1ldIH54=; b=IH3rDPN3GRr17XKmVqSrpM7zFM
	38NxUehG4Yhp0Z0tJ1MAGbh4mAdGG6Dlnk7FGZgnqq9iHHR/envt6I7ND0urmu0s6unew+JmY7qh8
	46dYiLkYesQRUshmN8E3thOBc9X0l+66nQ5atsB8qFyr38NJ9sfBjpOspUmDYMGOzWXpPniTm5dQU
	cUvBEGHiPNh5xohvL5TVXSSfgfG4cA/LGg9GBtuRBILbcYwj6meESpoUuRnbcqr0KotlATiOPz3sc
	tkZwQkkRKe/UHkMNXHPAq19iNx7Wmzi2NwFGNrd7ED/yG77I9eg6W25NspziDJmAdFrxrlfrWvSjE
	K3K3aIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmt5K-0000000EJnf-0PXp;
	Thu, 23 Jul 2026 13:03:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmt5J-0000000EJnR-28GD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 13:03:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1D23600B1;
	Thu, 23 Jul 2026 13:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511281F000E9;
	Thu, 23 Jul 2026 13:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784811812;
	bh=2tQlw9S+XzARxKHtU5qzXROAftVW1WJXlzvs1ldIH54=;
	h=From:To:Cc:Subject:Date;
	b=hsNNvqzjqSV/2XQBrnVLUEmrGXTL9nkdCXw9xQhGNrVhxMpZF+XSqM3+kDxxpSOs+
	 KLhGCe1CcUoRDCNDB1EuEHdMUS6q2FcIOLX0W6pte48TiiUJgzgN3WrO4RbDQBC0/G
	 csQBSUvaqx09h2ZXPAfQkPmmLSFSNOkfQpE5KUo64D24KgBIwqsWZKYw6sRzcwbvMZ
	 1wQureyP+bcNS/gmGvoO39n2baiMo+J1Ed75V6w8qMEXZ4QlvRKycuvSOSY4Ft2Jyc
	 DHLsBDElrX+fVBdnOefnbPrsoXLG1pSI5zd3TlV6pDKaqE77NTS04bt1b5YRn5WTGF
	 3A2/mdeT7E7iA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] arm64: mm: Treat all devices as dma-coherent when CLIDR_EL1.LoC == 0
Date: Thu, 23 Jul 2026 14:03:21 +0100
Message-ID: <20260723130322.3179-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
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

On systems where CLIDR_EL1.LoC == 0, no cache maintenance is required
when cleaning or invalidating to the Point of Coherency and therefore
all DMA agents can be treated as coherent.

Extend arch_setup_dma_ops() to take CLIDR_EL1.LoC into account when
setting the DMA ops for a device, emitting a warning message if the
firmware advertises a non-coherent device on a fully coherent system.

Cc: Steffen Eiden <seiden@linux.ibm.com>
Cc: Andreas Grapentin <gra@linux.ibm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/mm/dma-mapping.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 994b7b36e2b9..7f6f2f40dba2 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -42,6 +42,11 @@ void arch_setup_dma_ops(struct device *dev, bool coherent)
 {
 	int cls = cache_line_size_of_cpu();
 
+	if (!coherent && !CLIDR_LOC(read_sysreg(clidr_el1))) {
+		dev_warn(dev, "CLIDR_EL1.LoC == 0, treating as coherent\n");
+		coherent = true;
+	}
+
 	WARN_TAINT(!coherent && cls > ARCH_DMA_MINALIGN,
 		   TAINT_CPU_OUT_OF_SPEC,
 		   "%s %s: ARCH_DMA_MINALIGN smaller than CTR_EL0.CWG (%d < %d)",
-- 
2.55.0.229.g6434b31f56-goog


