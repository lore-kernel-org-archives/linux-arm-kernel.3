Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C885DCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kd93NqVShxtW1B6/oVtCTj9E0dVWdTivuNuvZCaYUPI=; b=BFN9JIs15rmLST70VMV3I2p5ha
	DP1l4j5Yei4m7Mla3os3h14c+DQF3S2jt5mNkDYfYbexgSoZfVqbPO7WoRJzPGICws+7uKtj2HV49
	PUYL7JPYDh02V2HxmmjJgGTQKMrk11FMDd7dADQYPr28ZDTinR7iZIIJuXTwvB04yx9XdGxBtqDV4
	VR8j8Yx77kLUfyT5Au9AeoAYB86yTQlKtzfyyt5+PtFWhlIb4qdPXQ2KqyGtmC7uKsQCAXy084stQ
	aWJeRtXV9Jtsbsrew3aM/u73wlHhID6ObOrNk8eOYonNTHzfhQMZv+7QnCA8DzjUTZZbgrwLFIP/X
	LoE8sg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgnU-0000000Fk1v-3Ai9;
	Tue, 28 Oct 2025 10:19:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgnR-0000000Fk0W-24bO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2513437A7;
	Tue, 28 Oct 2025 10:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73ED4C4CEF7;
	Tue, 28 Oct 2025 10:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761646760;
	bh=KkOSLYci++vNRNEQTXDYGgJqFXUhVXvlHo6io3wLa/k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cPuh0EB0azQbYctGin8hqnUkPiYwN2MTm0rtBoagUm5KGBcfPOxcUIRMkkiPWhlbg
	 9nXKlDYoqPaGGRTLqqNsUiJ7EV4vHI/7s1ImXFl3lDsy/nJ/VQtjxgtLdmMdPPjbzC
	 /IO6krhU/I6Qh91mifyLsmQxD00sHLn0t3iJZn7yU42/4d8T+ed6pM89Gfaf00CNpx
	 x4Wr4gV1N3YR+euOSAdoxcOZ7+qf+6unzfRiHWVLYoUM0eIHbaC1DIgoEccjxTRRD2
	 AmoUtju3D2HfCFAbTnFSKM9+XRKKsa1MSBqb8WK/4LpHZC8NC2p7nFMjpjHolOny9H
	 TjjoTaXS5vC/w==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 28 Oct 2025 11:19:00 +0100
Subject: [PATCH not for merging 2/7] ACPICA: Add Arm IORT IWB node
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-gicv5-host-acpi-v1-2-01a862feb5ca@kernel.org>
References: <20251028-gicv5-host-acpi-v1-0-01a862feb5ca@kernel.org>
In-Reply-To: <20251028-gicv5-host-acpi-v1-0-01a862feb5ca@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Marc Zyngier <maz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Jose Marinho <jose.marinho@arm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_031921_570063_FCB01056 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

From: Jose Marinho <jose.marinho@arm.com>

ACPICA commit d68693b24e5235a7da4d57e690d3c13380c14c16

The IORT IUWB node is defined in IORT issue E.g
See https://developer.arm.com/documentation/den0049/eg

Link: https://github.com/acpica/acpica/commit/d68693b2
Signed-off-by: Jose Marinho <jose.marinho@arm.com>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
 include/acpi/actbl2.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index fdabc6c64a9c..ba1a36d23e32 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -680,6 +680,7 @@ enum acpi_iort_node_type {
 	ACPI_IORT_NODE_SMMU_V3 = 0x04,
 	ACPI_IORT_NODE_PMCG = 0x05,
 	ACPI_IORT_NODE_RMR = 0x06,
+	ACPI_IORT_NODE_IWB = 0x07,
 };
 
 struct acpi_iort_id_mapping {
@@ -858,6 +859,12 @@ struct acpi_iort_rmr_desc {
 	u32 reserved;
 };
 
+struct acpi_iort_iwb {
+	u64 base_address;
+	u16 iwb_index;		/* Unique IWB identifier matching with the IWB GSI namespace. */
+	char device_name[];	/* Path of the IWB namespace object */
+};
+
 /*******************************************************************************
  *
  * IVRS - I/O Virtualization Reporting Structure

-- 
2.50.1


