Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594D9C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnrB5Bpt7C1wKGQ1bT4hVs2mxzWisqB23qGSiFlCsD0=; b=rDz3eWAhiIlFEB
	iaZcZUEbCoV7j4wkOCJY8nTuVtNEN7UdQoR/Ny7somdg7fM5pkxdKWlQDcwbxNFZQg7JwhDv6poE/
	ituxwXi0rfFIvlyzWEWfqkdIcZZDm/v6q/R0yMS6V1Rhr2zmM0fCmn7HPG9Een6ZshP8f9/kYDb2O
	7YRVq6i6MRMdmQjAYWhI/95QfJ2X8NizCAPR86oL2JBd2Npj6PckI9Fkv2T69XC2l/cAlH3TkJHnl
	Pt8PXbCeJfpffHyIG/fg2TkBztT/KKvH6/bDHMLINvgzCgBqAiiyMUH1DNPWhRlcj4ylPjdrpRSBa
	auPZBj5nRwS1rk6mA+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjdY-0000000CeEV-0oew;
	Mon, 06 Jul 2026 13:45:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjdV-0000000CeB9-22AV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:45:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68ED732C5;
	Mon,  6 Jul 2026 06:45:19 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A5F43F7B4;
	Mon,  6 Jul 2026 06:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783345523; bh=6oc6/bTeLii+gyqGBfBpO03hrZDYqWCiYlS78ZWZRog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pIHUxxuZR1rObtPAOIEdgjBSpmKUUdDPZooQyDqi7SIzeFBLRBCVoh3TuEqgBDax+
	 Wu5zjFzwVXxOpmiN8DvWH1+6KtMvBybzNzGL37pPpKflsWIONMD1OJ5gSWbXuVQpjl
	 NVLSysislYV4F3sDp/NvPLwuVK186aLO5s0Y8Y2Y=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v3 6/8] firmware: smccc: lfa: Register DT interrupt
Date: Mon,  6 Jul 2026 15:44:46 +0200
Message-ID: <20260706134455.132091-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706134455.132091-1-andre.przywara@arm.com>
References: <20260706134455.132091-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_064525_563607_73DCC05E 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Arm Live Firmware Activation spec describes an asynchronous
notification mechanism, where the platform can notify the host OS about
newly pending image updates.
In the absence of the ACPI notification mechanism also a simple
devicetree node can describe an interrupt.

Add code to find the respective DT node and register the specified
interrupt, to trigger the activation if needed.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index ce4f966db475..2a9c2a90b1bb 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -16,6 +16,8 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/nmi.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/psci.h>
 #include <linux/stop_machine.h>
 #include <linux/string.h>
@@ -832,6 +834,43 @@ static void lfa_remove_acpi(struct device *dev)
 }
 #endif
 
+static irqreturn_t lfa_irq_handler(int irq, void *dev_id)
+{
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t lfa_irq_handler_thread(int irq, void *dev_id)
+{
+	int ret;
+
+	while (!(ret = activate_pending_image()))
+		;
+
+	if (ret != -ENOENT)
+		pr_warn("notified image activation failed: %d\n", ret);
+
+	return IRQ_HANDLED;
+}
+
+static int lfa_register_dt(struct device *dev)
+{
+	struct device_node *np;
+	unsigned int irq;
+
+	np = of_find_compatible_node(NULL, NULL, "arm,lfa");
+	if (!np)
+		return -ENODEV;
+
+	irq = irq_of_parse_and_map(np, 0);
+	of_node_put(np);
+	if (!irq)
+		return -ENODEV;
+
+	return devm_request_threaded_irq(dev, irq, lfa_irq_handler,
+					 lfa_irq_handler_thread,
+					 IRQF_COND_ONESHOT, NULL, NULL);
+}
+
 static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 {
 	struct arm_smccc_1_2_regs reg = { 0 };
@@ -877,6 +916,12 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 		}
 	}
 
+	err = lfa_register_dt(&sdev->dev);
+	if (!err)
+		pr_info("registered LFA DT notification interrupt\n");
+	if (err != -ENODEV)
+		return err;
+
 	return 0;
 }
 
-- 
2.43.0


