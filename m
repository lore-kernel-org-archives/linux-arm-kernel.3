Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE81CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bylAnhzRKk+oY7TjttZCTS4qJlXA0vQgiLrrZihE+M8=; b=r2O3yyEqcsuSrz
	YI9d466FW+ecPH/ld2i4o+I6woE8HI5LC0AVPprhf+TO+9s3Ci1hH4+kTD8nH1iDpyHuIcDgFXMzW
	DQwKWr+fMzXCrQgeP++lWjHmXTRq7kuV4aqpMPNjC0QpOVSZn174hyWg8ptTYNQA92aDStoePQara
	fHzkblsE9Bl4TE+z5EnmFiIH1/5aznt0wToDT3x3ha7vKQOb9DwXrPO198dMXTp6Whgw5aPzLxUdc
	sEgQcKYOglSd8CohRzRPYbtT/OPXMMB+Sv3wUTtbFIYpbfbrLPyW//SSWS7G0uQk/gdXagXrFTWCF
	FJb6LrD++eAaQI/iRuTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmej-00000003fEU-2c0w;
	Fri, 16 Oct 2026 18:27:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmei-00000003fDD-30iy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 18:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bylAnhzRKk+oY7TjttZCTS4qJlXA0vQgiLrrZihE+M8=; b=kLlyxW9Mg1hRBdJBI3/eafDXUJ
	Bk2902NKDpt+kb3eDMcEf5ykYiEflIrdc/EUC8BBXMvyHn1RpMGHw49WOTkb5MbHr0KpPQH18ghc8
	Y9ONwo5vC4FmeOwZL8W7T/MNQe9gFDzqB0IfxE8j6Rz1nWXQE7nAwd7HP7LCchHz9F2Wp+x2ploQY
	7r93VlsvVeyNgSl0p1ySFdj2glV8M7+Zoys//hsYtVVohdfmTCPAOcx8mZYGDL7A0aPCRu79vnHgO
	pCbUSCqF+4Kd2zmJx9sn0X9iTSld8HIPIdUje95Dfh3ls50uM+gHwr55ULXlJouwcEqcUcYtALIYk
	D3SFekpg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHmef-00000001qEw-2CfM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:27:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A78A114BF;
	Fri, 16 Oct 2026 11:27:40 -0700 (PDT)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A8C73F7B4;
	Fri, 16 Oct 2026 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792175263; bh=HmbbqTV9MwGz3CuQNcHgWpUqagEY1pBDXMq+5aNIOq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lwFSMYMYNCSSkLv5mBffjvHCDb5PeL+fS8vIDB3aUUfCaZ0s65NrJGO+oXVO7/J0Y
	 nZJ9PP+VmGfZvNG7EF2aF92blbqMHGfW5pa0QYHRodfVgykZfqht4Ze1zGOs+j5hnx
	 p6MojAVPB9saACdTYMktWlByRXqxZ2/gEvulnhko=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v5 7/8] firmware: smccc: lfa: Register DT interrupt
Date: Fri, 16 Oct 2026 19:27:11 +0100
Message-ID: <20261016182714.1835813-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016182714.1835813-1-andre.przywara@arm.com>
References: <20261016182714.1835813-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_192745_874526_BC119C39 
X-CRM114-Status: GOOD (  14.19  )
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
 drivers/firmware/smccc/lfa_fw.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index 65f28ffc9d108..3ff368dca9497 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -46,6 +46,8 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/nmi.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/psci.h>
 #include <linux/rwsem.h>
 #include <linux/stop_machine.h>
@@ -182,6 +184,7 @@ static struct kset *lfa_kset;
 static struct workqueue_struct *fw_comps_update_wq;
 static struct work_struct fw_comps_update_work;
 static struct attribute *component_default_attrs[LFA_ATTR_NR_IMAGES + 1];
+static unsigned int lfa_irq;
 
 /*
  * A successful component activation might change the number of available
@@ -913,6 +916,31 @@ static void lfa_remove_acpi(struct device *dev)
 }
 #endif
 
+static irqreturn_t lfa_irq_handler_thread(int irq, void *dev_id)
+{
+	activate_pending_components();
+
+	return IRQ_HANDLED;
+}
+
+static int lfa_register_dt(struct device *dev)
+{
+	struct device_node *np;
+
+	np = of_find_compatible_node(NULL, NULL, "arm,lfa");
+	if (!np)
+		return -ENODEV;
+
+	lfa_irq = irq_of_parse_and_map(np, 0);
+	of_node_put(np);
+	if (!lfa_irq)
+		return -ENODEV;
+
+	return devm_request_threaded_irq(dev, lfa_irq, NULL,
+					 lfa_irq_handler_thread, IRQF_COND_ONESHOT,
+					 NULL, NULL);
+}
+
 static bool lfa_smccc_has_all_functions(void)
 {
 	struct arm_smccc_1_2_regs regs = { 0 }, res;
@@ -980,6 +1008,10 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 		err = lfa_register_acpi(&sdev->dev);
 		if (!err)
 			pr_info("registered LFA ACPI notification\n");
+	} else {
+		err = lfa_register_dt(&sdev->dev);
+		if (!err)
+			pr_info("registered LFA DT notification interrupt\n");
 	}
 
 	/*
@@ -999,6 +1031,7 @@ static void lfa_smccc_remove(struct arm_smccc_device *sdev)
 {
 	if (!acpi_disabled)
 		lfa_remove_acpi(&sdev->dev);
+	devm_free_irq(&sdev->dev, lfa_irq, NULL);
 	clean_fw_components_tree();
 	flush_workqueue(fw_comps_update_wq);
 	destroy_workqueue(fw_comps_update_wq);
-- 
2.43.0


