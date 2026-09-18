Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5328FC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gG40vWHBDzRNuDduQRHXhQvuyYuA7yeg6VU2SX0QVGo=; b=PzemX+T9hkXHVC
	MrQjgTk7PRqgNo02c+BUVH9QIxoVn6L2nGpq3VULr3+Oh/G1tJttZjUSYddtzzEPn5Sq/x2vrN5Z0
	XZQuTlTAlXGZP3gyhXdBJk2X31pbZddtVLXTiiEo9VKRf1YN3AKKhxHYWkVRt7GgKu5tLv3dffxsq
	umsd3KDy39t1dmda3NrAnDmWyg0hnpJA4VbYrlVEqTYKZ5kBWDW//QrDTGuIFm3/N2/iXfz2HKEqT
	o/pWMptHTbR+49ktdZkDmbW3HoVJljMtSO5afEa7FDy3gA5nDjgQaJntiouOjt8g3EbXJZTY8DWFu
	yqU7mMmmWNVroxlRECAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZJl-0000000EfwH-3OtG;
	Fri, 18 Sep 2026 14:11:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZJb-0000000EfrO-3e9p
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 14:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gG40vWHBDzRNuDduQRHXhQvuyYuA7yeg6VU2SX0QVGo=; b=BuZ82M6OquLzkh/ga5weVschbe
	yGW4rLqfaGwBhGfnmgti6NlkolCMSyVAEctJtHao1Jiyt2hhzgpCkLXwWhyJaBAq/lQ/yIH1AjMCj
	jFIuTxBeRujBi5L5Gf30QUecDVz3kSd4ED3UwM+M0FqVi4kw8P+91G5XR0gi1PWczneQP1xukXBFn
	bMt87ZtHGftVxG9XwpXbUcY54uJM2pc8ha+DM3EdAGTTIIDdFyNiPEA1PKX17PqF9hHuFUJVt68xr
	4yTGRvU8D4AJA9zGKJCQvBxaTqcjWdRGCBy2KsfE9DuGfX/KGJOy4vHGoew6wvqWGjEzBTCVPDwkh
	+Wk4ToPg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7ZJY-0000000ABeH-36wd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:11:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0DE2168F;
	Fri, 18 Sep 2026 07:11:38 -0700 (PDT)
Received: from e142021.Arm.com (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A87433F86C;
	Fri, 18 Sep 2026 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789740702; bh=FKj7gJ++G++n7fDeDo9/Cdn7Ipnxnl9yUVmYKTr5z1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iMLKelrQtB4f/cgVg0lvweqH3GjnXOudFJBq2gCVmJ7PhvUPhqj8CnNqNfA2ypH6W
	 8tW7i8jXYCKyv/9USa11d7pXv6ngt5+T8K0l525RFlHLVGRQxzfCLg3gtIge4HnBeR
	 OosPNEe4A0+PbOS2PKb0b1TdDyEB7NojvbcGBkJE=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v4 6/8] firmware: smccc: lfa: Register DT interrupt
Date: Fri, 18 Sep 2026 16:11:09 +0200
Message-ID: <20260918141112.2115555-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918141112.2115555-1-andre.przywara@arm.com>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_151145_158348_F234EFD7 
X-CRM114-Status: GOOD (  13.28  )
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
 drivers/firmware/smccc/lfa_fw.c | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index 7a55b4a6785d8..a23df331ffde9 100644
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
@@ -871,6 +873,37 @@ static void lfa_remove_acpi(struct device *dev)
 }
 #endif
 
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
+	return devm_request_threaded_irq(dev, irq, NULL, lfa_irq_handler_thread,
+					 IRQF_COND_ONESHOT, NULL, NULL);
+}
+
 static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 {
 	struct arm_smccc_1_2_regs reg = { 0 };
@@ -913,6 +946,12 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 			pr_info("registered LFA ACPI notification\n");
 		if (err != -ENODEV)
 			return err;
+	} else {
+		err = lfa_register_dt(&sdev->dev);
+		if (!err)
+			pr_info("registered LFA DT notification interrupt\n");
+		if (err != -ENODEV)
+			return err;
 	}
 
 	return 0;
-- 
2.43.0


