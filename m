Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3FFC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 05:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atiTdhI78JQ+M1h1EEiAmlBcUf8Fbkaf+mVs/42GC6Q=; b=NVlJ+WOedgm+y91Bm18cqiSFXX
	dTd6QxFuAwLHf6w9PKzo97TB9EAE4TVN3V+YrFiyF2nudkWrlHmrj3hrzPTVJlipYbT8g4i7kzmKg
	Nj4m715AMGeXtN0mkriY5Csf+KERZvs7mTB+QpGTW/BPBF4Kuaar8ycL7CssDJMAdB+Mruow+nP3O
	kU5takJYyiQA1ZBj+kjAY6sSLhz+rzefJbgBHzoguT96o5wSmK5oXZwQETwtaqht8FGa9XUkbPuBr
	nQF71Cc2g0X/AbYCqjCz+DqGvIc8W0Kf33SBMX0VbNQjjkVBQ1gWJwz3oJvyXq90WHBxhJ5N+7EpB
	8PfXX94A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Wk0-00000000wdS-36yT;
	Mon, 21 Sep 2026 05:39:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Wju-00000000wa2-1rK5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 05:38:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DCA6A6021C;
	Mon, 21 Sep 2026 05:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7102C1F000FF;
	Mon, 21 Sep 2026 05:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789969133;
	bh=atiTdhI78JQ+M1h1EEiAmlBcUf8Fbkaf+mVs/42GC6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KGI3WDD02LC91S2+WAdaTGXlW3fiqNXY1mg+e1enGSpF7z4+BWHCc3nI5pGax7Gc8
	 20SohOuILi0mbYYO1sBqtOzkNygsBEwIWzqA3UItCUI2oosg7PfLQVZn74e0JqJKt0
	 QEwqn1cLPH8m9v/3ybo4szDbSTYOVRHssXdp3/GWwjTp0jUgrZnbCxMy4C5s3ffACp
	 dX526Fxz9dhcs3iFFgjwQ4TyAYtao1K9X1zIFd2/L+q+8CYtl8E6nzIGCsP9qJx8BC
	 vwpdWV06agCfbW/sOKXxyP40L3OWrCcPwwtd/ISydj7zEz+LGPvLUwnJap0wZUs2G4
	 67cTkULnide0Q==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
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
	Andre Przywara <andre.przywara@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v12 5/7] virt: coco: arm-cca-guest: Rename TSM report source file
Date: Mon, 21 Sep 2026 11:08:05 +0530
Message-ID: <20260921053807.354802-6-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921053807.354802-1-aneesh.kumar@kernel.org>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
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

Rename arm-cca-guest.c to main.c and build it as an object of the
arm-cca-guest module. This leaves room for the module to grow additional
source files.

Also rename the arm_cca_tsm_ops instance to arm_cca_tsm_report_ops to
distinguish the report operations from other TSM functionality that will
be added.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/virt/coco/arm-cca-guest/Makefile                    | 2 ++
 drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => main.c} | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => main.c} (97%)

diff --git a/drivers/virt/coco/arm-cca-guest/Makefile b/drivers/virt/coco/arm-cca-guest/Makefile
index 69eeba08e98a..7564f4fcc4a4 100644
--- a/drivers/virt/coco/arm-cca-guest/Makefile
+++ b/drivers/virt/coco/arm-cca-guest/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_ARM_CCA_GUEST) += arm-cca-guest.o
+
+arm-cca-guest-y += main.o
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/main.c
similarity index 97%
rename from drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
rename to drivers/virt/coco/arm-cca-guest/main.c
index b741643d1364..80659f0885e9 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/main.c
@@ -156,7 +156,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
 	return ret;
 }
 
-static const struct tsm_report_ops arm_cca_tsm_ops = {
+static const struct tsm_report_ops arm_cca_tsm_report_ops = {
 	.name = KBUILD_MODNAME,
 	.report_new = arm_cca_report_new,
 };
@@ -177,7 +177,7 @@ static int __init arm_cca_guest_init(void)
 	if (!is_realm_world())
 		return -ENODEV;
 
-	ret = tsm_report_register(&arm_cca_tsm_ops, NULL);
+	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
 	if (ret < 0)
 		pr_err("Error %d registering with TSM\n", ret);
 
@@ -191,7 +191,7 @@ module_init(arm_cca_guest_init);
  */
 static void __exit arm_cca_guest_exit(void)
 {
-	tsm_report_unregister(&arm_cca_tsm_ops);
+	tsm_report_unregister(&arm_cca_tsm_report_ops);
 }
 module_exit(arm_cca_guest_exit);
 
-- 
2.43.0


