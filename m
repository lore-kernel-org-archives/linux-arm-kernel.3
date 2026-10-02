Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C42CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIr2K4OlpGfdHN+45sQ3hMqApyWHZLHTipM5/eFJ0SY=; b=hC/uFDfdiRSDb27P328qgv8kiZ
	MNkr6p7ht59RNccOGzg4vIzQiP1Gu6I1UEVhtl3L6k3RK7Jh4sB1ei3KIUFp6ogPczfDQckGpVjmW
	2tPgMoyLNuT+doK0C99Fn6HNbmkLVeMO1TzcicpxIS2PkG9L2VUvzzKVtTq4slJTzS4xuqy+N5XQZ
	2dM/Q6BhfhMYX1sRVIWJ/LXnR8btOmnAkCp4RLpJJcf3765i5gyL82RySFcGS0TCBUWPHdiecdjZ0
	zJeOyLrRz/UC4jUfJ6lV2XzTHmg9+LHpvlSkr026ZDvXTjV+ZeDSKEk+AmWKSpM907ECXQ1JhpVLa
	JnkkyS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEq-0000000CBDf-27pC;
	Fri, 02 Oct 2026 17:40:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEo-0000000CBCV-193c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F00F1476;
	Fri,  2 Oct 2026 10:39:58 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF6D93F85F;
	Fri,  2 Oct 2026 10:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962801; bh=xDp+EMpHKb9Oc/0Rzb52wwtXV36oTNF/CC3uPYa9E+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OAvoCMIF+y8a8dhdIAlUhwvB8oFpS5evrT80RSlLie11NskZbtwyB2IL3MILFzPA+
	 Qi6jhgIRchrCte0JWCU7sB3vuxwLNc4ICkjC0eMPf9YWk1Lu+jB9vH8oL+gxZX2lDc
	 vXysDt6lvmkhPcv0VOYJQcfu7G5jGzVBqB8DsvcU=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 01/27] arm_mpam: Move MPAMF_ECR write helpers to allow reuse
Date: Fri,  2 Oct 2026 18:39:14 +0100
Message-ID: <20261002173941.292319-2-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104002_356058_D9A80FF5 
X-CRM114-Status: GOOD (  12.40  )
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

From: Ben Horgan <ben.horgan@arm.com>

In preparation for calling mpam_enable_msc_ecr() from the CPU hotplug
handlers move it higher in the file. Move mpam_disable_msc_ecr() too to
keep them together.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
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
2.53.0


