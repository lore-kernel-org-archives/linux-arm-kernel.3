Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B9560A8C31
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q0ANFMsh;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NEOoWnEg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bylAnhzRKk+oY7TjttZCTS4qJlXA0vQgiLrrZihE+M8=; b=q0ANFMshEz4vWSIcCnQticsnl3
	JMQMzSjEneDkuUzGdQg2o9xC/ahuAomsUzg0rstDaEwNffBGySuZl5CVCTBTH7qxcJ5PdKr6eZOgV
	cw8ZjnsGOdsApW9o9S6KAdujf+uQyRtwCaqYW0JcpK8TvDU6YrAJbYz4nLtNRTf38ZTvEmuV9LKyY
	s5dDAg5TVnqbjm3QnCWc/dz+YQU5FXcQ7sn19+wJGSRVcnjPIGwQ+iG+wDoHBrk7aqruEZ5QQSh7Z
	jbCu0Ey+qYOIeuemZ3XAU7T4W9B5u3QMibWf4kFr51QH3nEs598R1jls8hROQW54GHPhMYKCwjPyr
	HinV4srg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvJ3-0000000HLqm-1AC1;
	Mon, 02 Nov 2026 16:54:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvJ0-0000000HLnm-37Fk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:54:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22D7E2659;
	Mon,  2 Nov 2026 08:54:43 -0800 (PST)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B5F33F59E;
	Mon,  2 Nov 2026 08:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793638486; bh=HmbbqTV9MwGz3CuQNcHgWpUqagEY1pBDXMq+5aNIOq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NEOoWnEg3oyv9l1BVYwa7B9lyu3SzmOFz8zvR3VasAsy+HZAlXnu+EhMzKiUmd7r4
	 xUfsmiWMyRLmNVh6aNT2zxWFYQzE7dNxO2S3SdTzEGa0aY7mBzuSGeQB9nmKYTjSLa
	 Nj39q4v457H6Vz/4NWiKo8oCV8fVn8mdOoFJCp1k=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v5 RESEND 5/6] firmware: smccc: lfa: Register DT interrupt
Date: Mon,  2 Nov 2026 17:54:19 +0100
Message-ID: <20261102165421.3651202-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102165421.3651202-1-andre.przywara@arm.com>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_085446_877851_24B0DC65 
X-CRM114-Status: GOOD (  14.11  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


