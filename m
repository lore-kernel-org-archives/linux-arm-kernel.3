Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967F8FD7076
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=584ZsP1PhLRw9ZE8INKWXu5KoUvOf1O9oMLiLK1Co4M=; b=rZ2nFBMeF1D4wX
	n4fcWRDuIltQGH5HABzZOc8TpibxbKYbQFVwtFlXxUChNnJOZTSE+NJOKgxAaQemyiF6K4YjTy2RV
	lhF6VPvxzHVutZnYFGzoQnsHkNbdQnwaqAma8IlTsTSGahC0nni5HWU/W6UTuKcw3YzFb0tanPY4V
	YEBwnmiaAUtwy/aCey1fcwsZ6HvjLXBZeM8Utl2sVFHxl1OekOoy5/chRmdaGHX9YhZuIHPeW4MyT
	MKmRB9F5Ct5MnMK/Ouv7KWnFdCsyhsanNigH5IjoFEEgBsjZAutIZbGxCzdbCKnc0gL143L1zUSJ0
	m1Ged0Tl5fSRaxsxRuJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rkc-000000062FF-1zzF;
	Tue, 17 Mar 2026 10:34:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RkT-0000000629W-1cba
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 10:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=584ZsP1PhLRw9ZE8INKWXu5KoUvOf1O9oMLiLK1Co4M=; b=HEiLjMWGKQOrTYMQSUmv/Dy0fx
	UHpZCPor9nJ78ef0vn08pZFiLRH7IpManS84aGTb3VaohYrvxVR0MjJOgAI7TAXlXG1otsojwiXHK
	Wx11TqnNsOIeKJiOSkVPA8qsrVkKCuCuAEInmg2y8IpT1pGKMOh7kXe0+Xw/piAhGSHIojHIZrD6Z
	1BMwFzd1WNzYJXwRS7F12pRtdYosEqw/rmnMp4VDauA/6ELCJTuaS1GRqz1hB3Wot6k9HtKIO6uA4
	bf48PTbXoYZCCi00THUmjtNz+dUjlQyd0XToFCyRKzFCggRVTQNXMWD3+QzqWnoHGzdsXMnhCPQVS
	TBnrSWww==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RkQ-00000008iMG-04J5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:34:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D62BB1476;
	Tue, 17 Mar 2026 03:33:54 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82C173F7BD;
	Tue, 17 Mar 2026 03:33:58 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v2 7/8] firmware: smccc: lfa: Register DT interrupt
Date: Tue, 17 Mar 2026 11:33:33 +0100
Message-ID: <20260317103336.1273582-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317103336.1273582-1-andre.przywara@arm.com>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_103402_309412_50D70099 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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
index 5dc531e462eb..ecd056901b8d 100644
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
@@ -841,6 +843,43 @@ static void lfa_remove_acpi(struct device *dev)
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
 static int lfa_faux_probe(struct faux_device *fdev)
 {
 	int ret;
@@ -854,6 +893,12 @@ static int lfa_faux_probe(struct faux_device *fdev)
 		}
 	}
 
+	ret = lfa_register_dt(&fdev->dev);
+	if (!ret)
+		pr_info("registered LFA DT notification interrupt\n");
+	if (ret != -ENODEV)
+		return ret;
+
 	return 0;
 }
 
-- 
2.43.0


