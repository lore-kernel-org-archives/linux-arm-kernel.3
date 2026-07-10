Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0EFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/ZoD6iPlaAlq/Lq7g+FV6zRioZrimVW1M9DqeMIS2Q=; b=lKKkX/YAs6jJna2T3UxiTzVmnh
	Ur83HbfYVsHKnqXSovunKUBZOBLR7oG37o+zwCikw5nUblrbybQWnxLaxTQPN0+sDXK1O4i/KK0k2
	RPU8y+sjOuuQG1SFEVuJtfBgrFR0P8yhAIN/xPOPxmYdwXIK6rr587ogFOHgVm/ymGog+f5jhYqRA
	9eZMnpKH7lFRvCEvBOS+uC52ImMPXjn49vhZ+e9nK3v6Fd6UcLLp4rZntyNcci7PbQyEnhLZSjXHb
	vYX9KzbgrHH8R/e3+qq6ITVSTT8kGZgm3lKJmRmft9DoIzRjoaU4o8SePef3kKqQD318QFQUJYocq
	giJT91gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9q8-00000004rzq-16rc;
	Fri, 10 Jul 2026 11:56:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9px-00000004rl4-2YJw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:56:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 999691EA6;
	Fri, 10 Jul 2026 04:56:04 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C22E3FD88;
	Fri, 10 Jul 2026 04:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783684568; bh=z6Yw8rX9lhuvUYL7iVZ70LrMuiszLXXFpXGsedcDnR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lhZR2iH00PsmgnjR/ZIgIHLdfYAnVujMShZGqrn9jW2TddzI8yWMaIPFdZEU++Rx/
	 G26O5blQhXl9E0BKdjkF7cZj2MBNPg629ClIF42MP9ltsgfJI6yzk4pogqcyn/yJqx
	 lzMjBxsbQY3l1HNSPfmZVu8xihfGXwD3zfDp7/lI=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com
Subject: [PATCH v1 08/11] arm_mpam: resctrl: Correct check that existing class is L3
Date: Fri, 10 Jul 2026 12:55:42 +0100
Message-ID: <20260710115546.29644-9-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710115546.29644-1-ben.horgan@arm.com>
References: <20260710115546.29644-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_045609_690611_A7F3A8A2 
X-CRM114-Status: GOOD (  13.71  )
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
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 226ff6f532fa..59dea750ff56 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -931,7 +931,7 @@ static void counter_update_class(enum resctrl_event_id evt_id,
 	struct mpam_class *existing_class = mpam_resctrl_counters[evt_id].class;
 
 	if (existing_class) {
-		if (class->level == 3) {
+		if (existing_class->level == 3) {
 			pr_debug("Existing class is L3 - L3 wins\n");
 			return;
 		}
-- 
2.43.0


