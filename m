Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390EDC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9c5jWDb9lpLOrxclM42NYklfEOIYuzd0qNvSdRFn9Q=; b=U5m1drtsnWxPM/lA3/WAPPg9Hh
	sJDmXPSiE6wSwYPV+Rcch6rCogWQkLZOX5PDM6XMnwAe6AwQ9cfdvaf8sEY1aLhbWYLglwGk24WZJ
	c8rXSagIP7oi3qKJjeBh/PHZUurqfLrmr1oOzS4xtkP1u+hZTWavaQ5ylWIwTsj/KvqKV61R1RoU2
	ehpA51D2dyu9OdStAT5aEjTYBxzIFHFzXtKUDZUITMyepSmo8Hvi2Pp0f+IZZqqD9aDblLK55w04r
	aj5dFdz22nuT6Q0Wr1Y47OVEstYStXhL5M7QxIv1Vk3rmXAohS3VHTU3qZphD8ne9GkxgFRxOjGYH
	ixyLLmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXX-0000000BbAY-3ydF;
	Thu, 17 Sep 2026 14:56:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXL-0000000Bb4Z-3FWD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:56:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20CDC1596;
	Thu, 17 Sep 2026 07:56:25 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A2A73F86F;
	Thu, 17 Sep 2026 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789656988; bh=THmIJ0mblTEQm05OX560oWA4k2851WiXGCm+VIxUKlk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PSr5zSjzi/w1B/nV+rS3TWGaNq0+wreF4ePi5JzUbMnKFesvnOnOEnfc462c8CMa0
	 RfgpGj/V2P0iaAoij3XMDIMZv2IL9XFG5+jUY2MmvKnmXTzXQsYgdBp+y7y9G3XvzX
	 lptBvwc2R/tUyKplAO80RB1LOdMEu0rDdxq/MaEg=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v2 01/12] arm_mpam: Move MPAMF_ECR write helpers to allow reuse
Date: Thu, 17 Sep 2026 15:56:06 +0100
Message-ID: <20260917145617.2202986-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_075631_858515_C8A0DF26 
X-CRM114-Status: GOOD (  11.18  )
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

In preparation for calling mpam_enable_msc_ecr() from the CPU hotplug
handlers move it higher in the file. Move mpam_disable_msc_ecr() too to
keep them together.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
---
 drivers/resctrl/mpam_devices.c | 38 +++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..580d7ed38569 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1817,6 +1817,25 @@ static void mpam_reprogram_msc(struct mpam_msc *msc)
 	mutex_unlock(&msc->cfg_lock);
 }
 
+static int mpam_enable_msc_ecr(void *_msc)
+{
+	struct mpam_msc *msc = _msc;
+
+	__mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
+
+	return 0;
+}
+
+/* This can run in mpam_disable(), and the interrupt handler on the same CPU */
+static int mpam_disable_msc_ecr(void *_msc)
+{
+	struct mpam_msc *msc = _msc;
+
+	__mpam_write_reg(msc, MPAMF_ECR, 0);
+
+	return 0;
+}
+
 static void _enable_percpu_irq(void *_irq)
 {
 	int *irq = _irq;
@@ -2443,25 +2462,6 @@ static char *mpam_errcode_names[16] = {
 	[12 ... 15] = "Reserved"
 };
 
-static int mpam_enable_msc_ecr(void *_msc)
-{
-	struct mpam_msc *msc = _msc;
-
-	__mpam_write_reg(msc, MPAMF_ECR, MPAMF_ECR_INTEN);
-
-	return 0;
-}
-
-/* This can run in mpam_disable(), and the interrupt handler on the same CPU */
-static int mpam_disable_msc_ecr(void *_msc)
-{
-	struct mpam_msc *msc = _msc;
-
-	__mpam_write_reg(msc, MPAMF_ECR, 0);
-
-	return 0;
-}
-
 static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
 {
 	u64 reg;
-- 
2.43.0


