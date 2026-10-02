Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE32CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4w2JGJK3H23rwfqty7f6gXPFqv5tP9VrMdkhjP/qNOg=; b=OFEFMhnrRuVFEMceX4FUygAFed
	S2qnMQHzXZL7Ig089RdPIHhl16AauqkaLwv3I+GV3D4iElWn6Lt1/+WtxVsh24wuOZMhViD/JNnMT
	dUkLDMbu0bZgjnNUy7Ow5WrHKYVNxAmvXHC2+uUHAINJLNydn+ksD0EXeXO+1K+D6Ymi2asvp250q
	Bjxktn7TGT5jjC2k106HBgDzQAknjb7WVDoQ5BYwCqFfTRxIka7cMS1dQsAUPksRDii2t/xM8Y753
	g4lcPyS9U1RjGUD9TWXq0mJEJNQk0ua1KO9dMKU/v3g+uHWmGoohyOD5GOS3i0j5wDktVNmlEnhpW
	qVq6yLJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChF0-0000000CBO0-2JfM;
	Fri, 02 Oct 2026 17:40:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEx-0000000CBF5-2TCs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2215143D;
	Fri,  2 Oct 2026 10:40:07 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26F5D3F85F;
	Fri,  2 Oct 2026 10:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962811; bh=sn2KJ5kdRHSUYi8TGj5JUFHXS36p8J8xOVUPerVRfF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hgG2wgTgzaKT9vsro0jPSAIR3J9F1NfrctZFeWAWrT61u03GGA8CcDXgWe/7umWj1
	 rchXLg/3DSVIh3WRBgPQv4PPM3fwtQmkpXNuvf7FsQns69Rr5zoXGR7D4e7RfUCccR
	 H3P62Dn7JwZou88wl2n/uhN+j/UMYC1QuaZwPQvU=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 08/27] arm_mpam: resctrl: Correct check that existing class is L3
Date: Fri,  2 Oct 2026 18:39:21 +0100
Message-ID: <20261002173941.292319-9-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104011_673567_1377B73C 
X-CRM114-Status: GOOD (  14.37  )
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

The class used to back mbm_total_bytes can be either at the L3 or the
memory. If a platform had candidate classes at both the memory and the L3
then, as the check for whether the existing class is L3 or not in
counter_update_class() is broken, the class that will be chosen depends on
which order the classes are considered and so the probe order.

Fix the check.

Fixes: 1458c4f05335 ("arm_mpam: resctrl: Add support for csu counters")
Tested-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
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
2.53.0


