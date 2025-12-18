Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4C6D6ACDE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 10:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGmzm05T3B8bd0IZiCZjN5Fy0FCk0PyPaPjT6rtFhGs=; b=rwN6BpnyGK5FGXSaflFrcemDpo
	6PqQyYKOQPhEqvgZQKvRSzgV5T4KqEgVsdBYqSZxYCKeFLTgmenkHB90ezYWUamf1V0tUYKOUdkjs
	wNKRbMFACdi97izkLg0/xqWKFHzNYZAnYwbx9/YdGVSnXgFdQhPwnWmrGE3dt4/H1BvEf4FmsgbwK
	0ZVF9Q+LNRdaWVGcw7A5tUQf7B/OnubXNPV7xVQqPNn08F5dnr+biPJfHv6hUizMN+d7nw50Edqzu
	4NyOxM7EejGYnfYQy6YIxEpFJORdvRPPE08mJ9C++H8kUs2/uWHNjxf9JEsAvqBFUYFr2aJ0PslPj
	izRAbFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWB2T-00000008Cq3-0Ndj;
	Thu, 18 Dec 2025 10:15:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWB2R-00000008Cp0-0JcG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 10:15:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FCF960126;
	Thu, 18 Dec 2025 10:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8EC7C4CEFB;
	Thu, 18 Dec 2025 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766052914;
	bh=O2IYaXBjmzGVATucF4s0OnNh/D79299lGX0XG+UCCJI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fvxw4WEQaz44c9aV3tXuTMKcjMx3lwFdnz9x1vkVlLwafeGqA3hugyiaQRJxmz4W8
	 5GaGMLdA4+c7xEr6NX3I+MH4FH9/BxY1o5GTo+Q9ZkU4kK/+PH1nNDJ1ed4QEWfXkA
	 2aDbWC5tkknMLaFV9H1p1R1jvHaCtdWTRgS5hI6rw9Oz5supUkm9MHtlGgfxqFnOX/
	 l4JIQUxwJlrn2yg2iN76Kx6iqI4IyOWAMwrViTe6Ar6cvvfl3PPZ0F14ZALlCM9v8h
	 VIbqtKfWh/W0hwVuMuYYQmKONdcgj2BqklrBg9IW0hULUsbYmePPtHp+jblJRNmjC8
	 F/FDdN139IUDg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 18 Dec 2025 11:14:28 +0100
Subject: [PATCH v2 2/7] ACPICA: Add Arm IORT IWB node definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-gicv5-host-acpi-v2-2-eec76cd1d40b@kernel.org>
References: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
In-Reply-To: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Marc Zyngier <maz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Jose Marinho <jose.marinho@arm.com>
X-Mailer: b4 0.14.3
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

The IORT IUWB node is defined in IORT issue E.g
See https://developer.arm.com/documentation/den0049/eg

Link: https://github.com/acpica/acpica/commit/a90dc2f5
Signed-off-by: Jose Marinho <jose.marinho@arm.com>
Signed-off-by: Bob Moore <robert.moore@intel.com>
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


