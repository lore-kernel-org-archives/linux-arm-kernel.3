Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB54C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 13:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=datT6Fd6IFFmFFfqGG381FQSaFzuKnTNvtwC+oLmUVI=; b=LUbmilirI5SxzSOEluz/+HWXLw
	+h4YAs+QNt2L5wc93ouvb27I+Ry3DT6+ysYyJqhYDvmno2mLtEzBxbUPQnorkbu27e4//3RWNeupI
	KrkL9PzB7ubrqU3BzU2dBp7Qiy7k+Uy+/6D/qL9gpZIym82OQXiuGKO3kOt8qVMH8GDPLBue4BA8b
	CnoH0i8Yfvk7mt4Yttn1fL/Gd+NV3R25i6tvlkqnKr/m63cblongdHPvLLbyLOVYjEwKTBPv/ulOc
	4rAZRH+RDGbYy5RSKpRGbVowflB0tkdIZP3GDr0OT+G73R87xD8KJZExJkSHgQNOAmyvA+fEaJb23
	LaldUYOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHks-0000000CqhW-3Uh2;
	Tue, 05 Aug 2025 13:31:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHST-0000000CnlF-0X9h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 13:12:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FF75A5638F;
	Tue,  5 Aug 2025 13:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52499C4CEF0;
	Tue,  5 Aug 2025 13:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399520;
	bh=G30icMWKligdm4rxiwBEu77y6DCF8r1SkJgxI7mqJcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b8gUxI89iTZY585tV6CRrJinpRw/RwYN10j4A/GyfrEZYY/wb6xBTcCokTWVMjhnd
	 w9UCTKcACkEGjhSJBlLH1AsWvHk5wpv3LSXRb+dmumzD2l1akLDRdrOj0yOiVV/UG1
	 QjEAk8629TADCwRiiU2jcbJKX7ajlLgfaUjw5X4XTyjxNAs4lxfOkJC4oSVgBY4Njr
	 b9ud7AWKasjWLQmhTjAnuMMPXbWGrptrXvBJKIyXtaQfhciIqs1qKMZz6jZpM2oWhk
	 p2uGVDgnXqQjRLuOs2o5Ici23hENbL2Hk8H39KnYZtYVcPhD4C71+NpgGojeL3dqLU
	 YFWHHZFBqKKag==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Sasha Levin <sashal@kernel.org>,
	toan@os.amperecomputing.com,
	kwilczynski@kernel.org,
	mani@kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.16-6.6] PCI: xgene-msi: Resend an MSI racing with itself on a different CPU
Date: Tue,  5 Aug 2025 09:09:34 -0400
Message-Id: <20250805130945.471732-59-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_061201_299021_2810DD83 
X-CRM114-Status: GOOD (  17.75  )
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

From: Marc Zyngier <maz@kernel.org>

[ Upstream commit 3cc8f625e4c6a0e9f936da6b94166e62e387fe1d ]

Since changing the affinity of an MSI really is about changing
the target address and that it isn't possible to mask an individual
MSI, it is completely possible for an interrupt to race with itself,
usually resulting in a lost interrupt.

Paper over the design blunder by informing the core code of this
sad state of affairs.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Link: https://lore.kernel.org/r/20250708173404.1278635-11-maz@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees. Here's my
detailed analysis:

## Key Evidence for Backporting:

1. **Fixes a Real Bug - Lost Interrupts**: The commit addresses a race
   condition where MSI interrupts can be lost when CPU affinity changes
   occur. The commit message explicitly states this results in "a lost
   interrupt" which is a serious issue that can cause system malfunction
   or hangs.

2. **Minimal and Contained Change**: The fix consists of a single line
   addition:
  ```c
  irqd_set_resend_when_in_progress(irq_get_irq_data(virq));
  ```
  This is an extremely small, targeted fix that only affects the xgene-
  msi driver's interrupt allocation path.

3. **Part of a Broader Fix Pattern**: This commit follows the same
   pattern established for other interrupt controllers:
   - Commit 9c15eeb5362c4 introduced this mechanism for fasteoi handlers
     in 2023
   - Commit 2c9e7f857400 extended it to handle_simple_irq() flow
   - This commit applies the same proven workaround to the xgene-msi
     driver

4. **Addresses Hardware Design Limitation**: The commit message
   describes this as papering over a "design blunder" - the hardware
   inability to mask individual MSIs combined with affinity changes
   creates an unavoidable race condition. This is not a new feature but
   a critical workaround for existing hardware defects.

5. **History of Race Conditions in This Driver**: The xgene-msi driver
   has had race condition issues before (commit a93c00e5f975 fixed a
   different race in 2021), indicating this subsystem needs these types
   of fixes for stability.

6. **No Architecture Changes**: The fix uses existing kernel
   infrastructure (irqd_set_resend_when_in_progress) without introducing
   new APIs or changing kernel architecture.

7. **Low Risk of Regression**: The change only affects the specific
   xgene-msi driver and only adds a resend mechanism when interrupts are
   already in progress - it doesn't change the normal interrupt handling
   path.

## Stable Tree Criteria Met:
- ✅ Fixes a real bug (lost interrupts)
- ✅ Small change (1 line)
- ✅ Not a new feature
- ✅ Isolated to specific driver
- ✅ Uses established kernel mechanisms
- ✅ Addresses hardware limitation that affects deployed systems

The fix prevents interrupt loss during CPU affinity changes on X-Gene
MSI controllers, which is exactly the type of bug fix that stable
kernels should receive to maintain system reliability.

 drivers/pci/controller/pci-xgene-msi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index b05ec8b0bb93..50647fa14e69 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -200,6 +200,7 @@ static int xgene_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	irq_domain_set_info(domain, virq, msi_irq,
 			    &xgene_msi_bottom_irq_chip, domain->host_data,
 			    handle_simple_irq, NULL, NULL);
+	irqd_set_resend_when_in_progress(irq_get_irq_data(virq));
 
 	return 0;
 }
-- 
2.39.5


