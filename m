Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BEBD43379
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qmf7GYd3El0jO4DqBEcTjSXNyfg7jTSBuFWMnS0kbwI=; b=fsCh9nPiiJHNzPy2+x6epS0aaf
	yjBDaVLuoV4l7dHT7yuHF073SztlI1szRIByqeWQkZ3pEtK0hyCSXDxGpieygoH+BISSWWcrD0N/l
	J2jnZ/ZvAqUcOzHO5KFltLxXvyK9t2gUZnKrO/5VMGB+adREqnEXH37CFHhVQDQEyj95VFWAr+uEL
	lB2KvPoAAjMTcS7etjAWrmTu7X28lQxgs/xcjK2Mf+joGtkLu9O+ZIwbGdWJUhPI6/s2Jzp9aC22r
	RVOGDbbG1OEs6HvNW7OnOsGH8gxKMFO1E1mtMEy2V6Um5/pn8cJ4lc31yOPyTXC9cHwzXsf+9oCV2
	cS+CcflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95iA-00000007hl6-32aN;
	Thu, 07 Nov 2024 16:50:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94VV-00000007SL6-40Y0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 15:33:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6632A5C4389;
	Thu,  7 Nov 2024 15:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B255C4CECC;
	Thu,  7 Nov 2024 15:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730993592;
	bh=b2xKdidBH48y+1hjUYSNmGCdaQIGQdqE3pXSKipDMPc=;
	h=From:To:Cc:Subject:Date:From;
	b=LUwBRMfX2EQZ8YknvydxZ7++w9PLidGNiajYSyTi3cygoA7t2zRgiho6AOcDZ9WiD
	 cj6Eg7Bz3kgMkfRqZouFi83/NuorOzc4GEclfKzZUe6h0YogWoosAzECkB3mC3EULA
	 kR4WxQNm9XVMKZ/Ww+jwzhFJ9TR4oTr4sNf6RT232XrxvnpRoPOiKbJEUGZrzSSZFn
	 rNkVAVN9pnww6DmYhNHqSNXgUtZbW3BlfJ8l88yMNG7toSKxBFgGEQTO2ourPp4z5z
	 3Suo10102Sj+qeHd4bsgywz0WxGSJm9u8zQN3OQxgLuZOtZqtzp/GdLnAsGGZJrZ1/
	 +5jNIKwRRNi4Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: mvebu: Use for_each_of_range() iterator for parsing "ranges"
Date: Thu,  7 Nov 2024 09:32:55 -0600
Message-ID: <20241107153255.2740610-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_073314_062566_E5CCCFC0 
X-CRM114-Status: GOOD (  13.29  )
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

The mvebu "ranges" is a bit unusual with its own encoding of addresses,
but it's still just normal "ranges" as far as parsing is concerned.
Convert mvebu_get_tgt_attr() to use the for_each_of_range() iterator
instead of open coding the parsing.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Compile tested only.
---
 drivers/pci/controller/pci-mvebu.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index 29fe09c99e7d..d4e3f1e76f84 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1179,37 +1179,29 @@ static int mvebu_get_tgt_attr(struct device_node *np, int devfn,
 			      unsigned int *tgt,
 			      unsigned int *attr)
 {
-	const int na = 3, ns = 2;
-	const __be32 *range;
-	int rlen, nranges, rangesz, pna, i;
+	struct of_range range;
+	struct of_range_parser parser;
 
 	*tgt = -1;
 	*attr = -1;
 
-	range = of_get_property(np, "ranges", &rlen);
-	if (!range)
+	if (of_pci_range_parser_init(&parser, np))
 		return -EINVAL;
 
-	pna = of_n_addr_cells(np);
-	rangesz = pna + na + ns;
-	nranges = rlen / sizeof(__be32) / rangesz;
-
-	for (i = 0; i < nranges; i++, range += rangesz) {
-		u32 flags = of_read_number(range, 1);
-		u32 slot = of_read_number(range + 1, 1);
-		u64 cpuaddr = of_read_number(range + na, pna);
+	for_each_of_range(&parser, &range) {
 		unsigned long rtype;
+		u32 slot = upper_32_bits(range.bus_addr);
 
-		if (DT_FLAGS_TO_TYPE(flags) == DT_TYPE_IO)
+		if (DT_FLAGS_TO_TYPE(range.flags) == DT_TYPE_IO)
 			rtype = IORESOURCE_IO;
-		else if (DT_FLAGS_TO_TYPE(flags) == DT_TYPE_MEM32)
+		else if (DT_FLAGS_TO_TYPE(range.flags) == DT_TYPE_MEM32)
 			rtype = IORESOURCE_MEM;
 		else
 			continue;
 
 		if (slot == PCI_SLOT(devfn) && type == rtype) {
-			*tgt = DT_CPUADDR_TO_TARGET(cpuaddr);
-			*attr = DT_CPUADDR_TO_ATTR(cpuaddr);
+			*tgt = DT_CPUADDR_TO_TARGET(range.cpu_addr);
+			*attr = DT_CPUADDR_TO_ATTR(range.cpu_addr);
 			return 0;
 		}
 	}
-- 
2.45.2


