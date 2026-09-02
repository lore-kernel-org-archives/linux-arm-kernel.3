Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C2FC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=su8f7z9MxgZCnokn/xOHdJfmTH3hN7dUrnNTcANi9P0=; b=hyZwJVwMF6ar/+loD6270J3vRp
	iy0LyJpKw98paKDpOTgv7dLw0zXEDH/gZ52Jkh5ao0rq7JPawcrn4kI1P0v7EVGqxrwwMWR+i75Xk
	OD+1bYvX2Dw3VsD1M1MqkwKvzn5HNntZzeEnZebbuBAg50Hc+1kBIJKwoU1ynPtj3LqvvpYgyC9cq
	O6t+/E318ac2qqP4fELYvW98AMnepS/kEw5U77rxGX51CRAp7AKkiavFYl7mo/Bd7jzwmnkYNRuVB
	AmAvp1a+dP5DIsRF5IdiCoChufCEQHeFEnyS0HA6spcHHMrXmIz58URn9ogai+VievIaOOqVnOzVs
	WWW7i7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1m6L-0000000Ey1D-2I65;
	Wed, 02 Sep 2026 14:38:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1m6I-0000000Ey0m-1ilJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 14:38:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7277D165C;
	Wed,  2 Sep 2026 07:37:59 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A0693F882;
	Wed,  2 Sep 2026 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788359883; bh=4kIIOKwfvEzTXQVgo2KNecr6WiHLfmpMtBCTGPwAT5s=;
	h=From:To:Cc:Subject:Date:From;
	b=lYI/BE3g3q4vYgmH00Xx4JrOJ6qsedssB1fSmKr0MfomQP5RCVSXM5GMCaFb9wLmy
	 KnXBgdCMno5q3RUT7NHVogsZ7jgiQ8QAnfrRgwkhDrmt+H0x7WtGh+J7qV2vCViTn7
	 0QycnNyC5M0Yn9H/LICY6iNylLQJs0FPGe09yoHk=
From: Andre Przywara <andre.przywara@arm.com>
To: James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Tony Luck <tony.luck@intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Yin Li <yin.li@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm_mpam: resctrl: Catch and propagate error from get_cpu_cacheinfo_id()
Date: Wed,  2 Sep 2026 16:37:57 +0200
Message-ID: <20260902143757.3469690-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_073806_482858_0273C324 
X-CRM114-Status: GOOD (  13.63  )
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

get_cpu_cacheinfo_id() can fail, in which case it returns a negative
error value.

Check the returned value for this error condition, before passing the
value on to other code, which would hide the negative number in some high
value in the unsigned type.

Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9d223057953ab..a5e661eff86d7 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
 /* Find the L3 cache that has affinity with this CPU */
 static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
 {
-	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
+	int cache_id = get_cpu_cacheinfo_id(cpu, 3);
+
+	if (cache_id < 0)
+		return -ENOENT;
 
 	lockdep_assert_cpus_held();
 
-- 
2.43.0


