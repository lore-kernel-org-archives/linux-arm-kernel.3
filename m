Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAE0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcDDnr0HcvR3xlUYMGMIymwYYVJz0OOwGn3qBVIuusc=; b=mHDP6HsWEXq9b8r3gY+tiJ5HLD
	oc5MfAz7XMYfzwuyzdgzpwQuGigmuhEskK9GWzRELGpQOd6BqiI5aKCjA5OdpbYI3I3XriOAPnyEd
	RMJINAnQ5+KqmI72qEYwrcSF5D1puaUiiCcbpQfaSZw3NgYVwS/j8FdXUKO9ngsp9EjG6+7/loLGx
	Dd0sKwTFOU3d3ZYp+EPGb66EHYFfseaniQwg26Ts+fi58Ge3UlB7gMKxuLmoa+TMtY3ZIJpKwzdMA
	pDTT9t5okWYoIsllU54PI+PnrCF+pwturrPOunsrZiMQ5l/I1Pr1JoxxEoAKJ1/7FMxZtMDWfHwNl
	74Oxa9vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9pp-00000004rkv-1JBN;
	Fri, 10 Jul 2026 11:56:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9pm-00000004rjy-1lk0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:55:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 966141EA6;
	Fri, 10 Jul 2026 04:55:53 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A42933F85F;
	Fri, 10 Jul 2026 04:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783684557; bh=HDM4yjwF3ewZgXyeAirDLJ8wrUsfMzbhBvuPa4qtLv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VsUK0KH3Zcuu32dIqSPPH27+OGK1LiJAGY9Cgr5YxZBYv4dIDQe2/YgrEER+Q/HEF
	 NNDssTIOzGvHglvgobuW6C8+pSxJCH2kgkXLpQBdW1EGPz23Y69r99u60jnrIfCKuv
	 +Enw3QBiG0JoVjHFpN60R6A3QVgDFO2cTczr/eSY=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com
Subject: [PATCH v1 01/11] arm_mpam: Move MPAMF_ECR write helpers to allow reuse
Date: Fri, 10 Jul 2026 12:55:35 +0100
Message-ID: <20260710115546.29644-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710115546.29644-1-ben.horgan@arm.com>
References: <20260710115546.29644-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_045558_503395_82B6056F 
X-CRM114-Status: GOOD (  11.70  )
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
---
 drivers/resctrl/mpam_devices.c | 38 +++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b69f99488111..82966ca2a631 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1813,6 +1813,25 @@ static void mpam_reprogram_msc(struct mpam_msc *msc)
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
@@ -2435,25 +2454,6 @@ static char *mpam_errcode_names[16] = {
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


