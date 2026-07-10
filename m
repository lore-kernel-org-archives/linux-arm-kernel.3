Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE3FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2KQaBGwv6Yq/iLMBzavAjnYnJ1JJOUWgaJc1KFpZiw=; b=M2Ja5AquhpdGaZ3W2MV9jy1QjO
	yr7UB/UgbMOhE+QTnfUlQmRETDoXhlrjJ2vAWAKzfeZkzy6TBpeuOPOQutDbAB7jf0NbwlM+hLOYZ
	baQXWr+1wAEO8IBq6OTm/KKzxUuh6wdC6kIBX3vqYDfi4sAYTN690gJekQ7wDb6hQIE1bDcIbYCG8
	aojSpgcFbp9O+H9gew3bplyz7WAkJ5EY4R0CcrL+MFV/EoOBCaxXrZ8+D2kbQTf1P10PdQG4thlUK
	Xl3sltiPYDiC4kXnxt+NYjQk3kJliUp4DY/vPYmQWOJgQkkoObVeMy9RYGyZcnjVm5OaTaK92NMJB
	ir79jPDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9q8-00000004s0Q-1w2z;
	Fri, 10 Jul 2026 11:56:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9q0-00000004rt4-2JUj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:56:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBBFC1F60;
	Fri, 10 Jul 2026 04:56:07 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C94B23F85F;
	Fri, 10 Jul 2026 04:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783684572; bh=8TVx75ha39M0Z5Dj+uNRxEhIdCRJjUHu/0cTQP+NjGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z2GZVF0DtmISB+PC2UM+RHAzQQwDqcbUsx6qrdNfe/rhQ1VYG3a7CJRKY+tV1AD1h
	 FM3zBVDTXOpz/NrZVoT4Zm2PIaGIlAWTzCThdhIT7kpf6cXJ1vJoKE3aAonjicbYwr
	 iTY/v1lcvQkPpSvFWKnI5qKUbwClbp64NB3ESmsM=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com
Subject: [PATCH v1 10/11] arm_mpam: Don't loop forever if there is the maximum possible amount of PARTIDs
Date: Fri, 10 Jul 2026 12:55:44 +0100
Message-ID: <20260710115546.29644-11-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710115546.29644-1-ben.horgan@arm.com>
References: <20260710115546.29644-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_045612_636676_665D1234 
X-CRM114-Status: GOOD (  11.58  )
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

On a theoretical platform with the maximum possible number of usable
PARTIDs, 0XFFFF, the loops iterating over PARTID in mpam_reset_ris() and
mpam_reprogram_ris() will never reach their termination condition leading
to a system hang when register the cpu hotplug handlers when MPAM is
enabling.

Fix these loops.

Fixes: f188a36ca241 ("arm_mpam: Reset MSC controls from cpuhp callbacks")
Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c9adc450f087..9412ffde1cf1 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1735,7 +1735,7 @@ static int mpam_save_mbwu_state(void *arg)
  */
 static int mpam_reset_ris(void *arg)
 {
-	u16 partid, partid_max;
+	u16 partid_max;
 	struct mpam_config reset_cfg = {};
 	struct mpam_msc_ris *ris = arg;
 
@@ -1745,7 +1745,7 @@ static int mpam_reset_ris(void *arg)
 	spin_lock(&partid_max_lock);
 	partid_max = mpam_partid_max;
 	spin_unlock(&partid_max_lock);
-	for (partid = 0; partid <= partid_max; partid++)
+	for (u32 partid = 0; partid <= partid_max; partid++)
 		mpam_reprogram_ris_partid(ris, partid, &reset_cfg);
 
 	return 0;
@@ -1792,7 +1792,6 @@ static int __write_config(void *arg)
 
 static void mpam_reprogram_msc(struct mpam_msc *msc)
 {
-	u16 partid;
 	bool reset;
 	struct mpam_config *cfg;
 	struct mpam_msc_ris *ris;
@@ -1816,7 +1815,7 @@ static void mpam_reprogram_msc(struct mpam_msc *msc)
 		arg.comp = ris->vmsc->comp;
 		arg.ris = ris;
 		reset = true;
-		for (partid = 0; partid <= mpam_partid_max; partid++) {
+		for (u32 partid = 0; partid <= mpam_partid_max; partid++) {
 			cfg = &ris->vmsc->comp->cfg[partid];
 			if (!bitmap_empty(cfg->features, MPAM_FEATURE_LAST))
 				reset = false;
-- 
2.43.0


