Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D738CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jh8bWKGmPuYwh7hitiYl8VrG4BgLt5boypsRwdeG7jU=; b=AhudzfzjJ4a/D17/IEzlggnh9i
	WpvCcc/uFOeE4ywop11lmHF1rB5yA+7WtjdeWwpngSd8Wb3nblwmKFnRejF9sHukVRXB+/vOViHi7
	30SYGqE3GUV9PH5ztUNgWntXXJs8maz2Z9MMXtb+vzrSaNhj/fNlYEZ7K2Yv8R3tyW5Ju/NiMHyan
	MmKG97aNY0ZDSZeIO3z6qtnzxRBoB9QXBfOtzV0xgichKhqKsDi90tvnE61dXKfG2KUmLQZzEnM02
	sqKKgNuT9oGRbkYbCBoq26PEEBk6sKv634Jv+EeTiJEXD0535B2RR/cWxLpFf+ZD9ug6F/koOlB3K
	QyOzgAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf5p-00000009UEj-0SPT;
	Thu, 11 Jun 2026 13:05:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf5n-00000009UDi-0t7g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:05:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A6D9B60145;
	Thu, 11 Jun 2026 13:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F0B1F00899;
	Thu, 11 Jun 2026 13:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781183106;
	bh=Jh8bWKGmPuYwh7hitiYl8VrG4BgLt5boypsRwdeG7jU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RZfHvLPQHXz8EFq+1KFjW5RZM4m6LxLllLy3SzvDbAIUJwE+YQ8T1n9CAa8nqyRM+
	 6LJ7DFdTBWoPKzuQz2jfU/7Q0vOvmeX2dttEP2xwUWLicIs9z8gF1ub70aVRwkkD58
	 6DifoIidfFQvM+XIhzykVsF1dfGgktHnIGkvBaHqBzsHQNxttXoXA+libNY2rxZe+d
	 0kyyxZJG8M/Rd2W3KMrH2S0hCzHL6XY4785NwCWghRyZwGyXAEyzg9p1XJ+Mank8wu
	 lncyfApIxR0nIHbTuX8wGhlN0/Ml0c4O1OOCo1kywsmDmqrP3QvEjxeCjKdI4W22w2
	 hGMe6cwu8H2Tg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v7 4/6] virt: coco: arm-cca-guest: Rename TSM report source file
Date: Thu, 11 Jun 2026 18:34:27 +0530
Message-ID: <20260611130429.295516-5-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611130429.295516-1-aneesh.kumar@kernel.org>
References: <20260611130429.295516-1-aneesh.kumar@kernel.org>
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

The Arm CCA guest driver currently only implements TSM report support, but
follow-up changes will add more TSM-related functionality to the same
module.

Rename arm-cca-guest.c to arm-cca.c and build it as an object of the
arm-cca-guest module. This leaves room for the module to grow additional
source files.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/arm-cca-guest/Makefile                    | 2 ++
 .../virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c}  | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (97%)

diff --git a/drivers/virt/coco/arm-cca-guest/Makefile b/drivers/virt/coco/arm-cca-guest/Makefile
index 69eeba08e98a..778146148515 100644
--- a/drivers/virt/coco/arm-cca-guest/Makefile
+++ b/drivers/virt/coco/arm-cca-guest/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_ARM_CCA_GUEST) += arm-cca-guest.o
+
+arm-cca-guest-y += arm-cca.o
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca.c
similarity index 97%
rename from drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
rename to drivers/virt/coco/arm-cca-guest/arm-cca.c
index 8b6854e7a188..0bbd1fa53ee4 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
@@ -184,7 +184,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
 	return ret;
 }
 
-static const struct tsm_report_ops arm_cca_tsm_ops = {
+static const struct tsm_report_ops arm_cca_tsm_report_ops = {
 	.name = KBUILD_MODNAME,
 	.report_new = arm_cca_report_new,
 };
@@ -205,7 +205,7 @@ static int __init arm_cca_guest_init(void)
 	if (!is_realm_world())
 		return -ENODEV;
 
-	ret = tsm_report_register(&arm_cca_tsm_ops, NULL);
+	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
 	if (ret < 0)
 		pr_err("Error %d registering with TSM\n", ret);
 
@@ -219,7 +219,7 @@ module_init(arm_cca_guest_init);
  */
 static void __exit arm_cca_guest_exit(void)
 {
-	tsm_report_unregister(&arm_cca_tsm_ops);
+	tsm_report_unregister(&arm_cca_tsm_report_ops);
 }
 module_exit(arm_cca_guest_exit);
 
-- 
2.43.0


