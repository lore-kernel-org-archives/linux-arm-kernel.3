Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3B5C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4BUYtvlMvzzBZ9m7B6JXsyFnlRgDwwn0BD4SCuxRYE=; b=XqCKiku94Zp/gJH2zxaAEwdCCB
	sERFaKuxBawDzvg80TFPNF9R01BxHz11xedYCjdTI1RyjfBn1dFL54Ba51bx5sljVqG6aTKPtelxf
	ogY7DJ/knPW3dCZJzUuo8TAntz1EGNBCPzhAH9fdpbJ8UYHU7SGgdWkb+8cBEI6Ko5BhmPRZNkaS8
	TyIbZLDQas1e68di/O3oQENeHc2qvVaKQDYVryG32693F9+4ZSk1t8IuOx8TQImDy7bK+eopfrZRE
	96Sjg1Pbx9mjEVXaQg1bSn0NGGLz2y8h+2ijn/W3ep4ce1ZYUnJGdwpOB26GKRMSggzWDHVc3H5bG
	2hK/ctBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXe-0000000BbGF-0JGp;
	Thu, 17 Sep 2026 14:56:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DXV-0000000Bb95-0ZfC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:56:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19E082008;
	Thu, 17 Sep 2026 07:56:37 -0700 (PDT)
Received: from e134344.cambridge.arm.com (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B9EB3F86F;
	Thu, 17 Sep 2026 07:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789657000; bh=u2/TSWpxe41vfNNykjOzkfh2PggVplqWQaKV/Iwvjkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pJZTWcC3qLI4PbTSiaE1hVkqZ127fjuB9Cu9o6gfui5tmS5VuOINoyXH8rJzPlgvS
	 uya6HPBlvw76OVRkz445MJ4pj4PMRhoNSo7ewbx6gpTm0h5hQ+wYJ7pWaxA4d0pGI/
	 SccKbZ4S3fCJjL/ZZseRXMArTNVdFRETmhNXlNg8=
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
Subject: [PATCH v2 08/12] arm_mpam: resctrl: Correct check that existing class is L3
Date: Thu, 17 Sep 2026 15:56:13 +0100
Message-ID: <20260917145617.2202986-9-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145617.2202986-1-ben.horgan@arm.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_075641_223129_5328259F 
X-CRM114-Status: GOOD (  13.14  )
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

The class used to back mbm_total_bytes can be either at the L3 or the
memory. If a platform had candidate classes at both the memory and the L3
then, as the check for whether the existing class is L3 or not in
counter_update_class() is broken, the class that will be chosen depends on
which order the classes are considered and so the probe order.

Fix the check.

Fixes: 1458c4f05335 ("arm_mpam: resctrl: Add support for csu counters")
Tested-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9d223057953a..b825bd90d4bd 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1076,7 +1076,7 @@ static void counter_update_class(enum resctrl_event_id evt_id,
 	struct mpam_class *existing_class = mpam_resctrl_counters[evt_id].class;
 
 	if (existing_class) {
-		if (class->level == 3) {
+		if (existing_class->level == 3) {
 			pr_debug("Existing class is L3 - L3 wins\n");
 			return;
 		}
-- 
2.43.0


