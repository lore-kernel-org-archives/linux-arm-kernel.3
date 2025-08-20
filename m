Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FBFCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L/Ek9ahyvLJXOjuQE8zTuiaLTzC0yOsevKndUWOy+RE=; b=EAGwEHcnKtLb98qK0k8PD/b1tI
	OuHf4Ro8E5mmze1q1Ajn3n0QCeFJaixMGgTe4OWOJrUtxk/7Itkv6TK2H81XsuJPi1TP0lBPgqWdh
	1EQNpn6gStfnjj742d0KaL7wTCL4RsWBzw9iN9a/Nb6lOOP8PxPNB91w1R6SUvww5OphHcM7H+SzE
	PW91OjzUNRFFSVZeLrCSZn71Am7TmWmSTsB2Mjt5ZzCK9i8IdbAE5e1caugES3ihYpe2vzfq5AumN
	EiGdCTvwLIsMkYGonevHJ+rjoouSXe5/8fLMG8O/UhAqj35jBxDeW1r/Ajy0xZzyCAlrU+f14pwee
	qCRsKwgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojR2-0000000Dvt3-22T4;
	Wed, 20 Aug 2025 14:05:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoig7-0000000DjYL-3W5x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 13:16:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0524B152B;
	Wed, 20 Aug 2025 06:16:25 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52B843F58B;
	Wed, 20 Aug 2025 06:16:32 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	James Morse <james.morse@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH] arm_mpam: Relax num_rmids parameter advertised to userspace
Date: Wed, 20 Aug 2025 14:15:21 +0100
Message-Id: <20250820131621.54983-1-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_061635_915551_5BF015BE 
X-CRM114-Status: GOOD (  15.02  )
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

On MPAM systems, monitoring groups are identified in the hardware by a
(PARTID, PMG) pair.  Two monitoring group identifiers are the same only
if the PARTIDs and PMGs both match.  This means that the number of
monitoring groups that can be created in each control group is the same
as the number of distinct PMG values supported by the hardware.  The
number of monitoring groups that exist in other control groups at the
same time makes no difference to this.

Currently, the MPAM driver takes the cautious approach and always
num_rmids = 1.

Relax this limit, by advertising the number of distinct PMG values
supported by the hardware.

Code/Data Prioritization (CDP) makes no difference, since although this
doubles the number of (PARTID, PMG) pairs available to a control group,
each monitoring group now consumes two pairs instead of one.

Suggested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Signed-off-by: Dave Martin <Dave.Martin@arm.com>
---

This patch is based on:

git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.16-rc5

 drivers/platform/arm64/mpam/mpam_resctrl.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index f1e565cd1aac..f4f6fa9acfff 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -1208,12 +1208,17 @@ static void mpam_resctrl_monitor_init(struct mpam_class *class,
 		/*
 		 * Unfortunately, num_rmid doesn't mean anything for
 		 * mpam, and its exposed to user-space!
-		 * num-rmid is supposed to mean the number of groups
-		 * that can be created, both control or monitor groups.
-		 * For mpam, each control group has its own pmg/rmid
-		 * space.
+		 *
+		 * num-rmid is supposed to mean the minimum number of
+		 * monitoring groups that can exist simultaneously, including
+		 * the default monitoring group for each control group.
+		 *
+		 * For mpam, each control group has its own pmg/rmid space, so
+		 * it is not appropriate to advertise the whole rmid_idx space
+		 * here.  But the pmgs corresponding to the parent control
+		 * group can be allocated freely:
 		 */
-		l3->num_rmid = 1;
+		l3->num_rmid = mpam_pmg_max + 1;
 
 		switch (type) {
 		case QOS_L3_MBM_LOCAL_EVENT_ID:

base-commit: b8e4905233fe45814b3c73be7e091f172cfb86ce
-- 
2.34.1


