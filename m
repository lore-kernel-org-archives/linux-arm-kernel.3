Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB55CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 16:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pGjhdZ2H4FIapSRVwvy1WRGdzXReM0nQQnqulx78mw=; b=A0Z6PwdVBJuO2poMmOfB2oDbag
	gJGbdrVt4Zyxdvni/NStA/UTryPMXTgqzPyp1HdygLAaCrX9RSpD5w8qkk87pGKS+Ylf3xLLy3vYY
	0WpiG8tUnseLjbgK/w/omOUtkmnzOe8kgT61JuTnYXqJoTcsctD9svt8ROLT9DcsspPJd7dywD/2y
	fEshO/J7ks/HgaZaPDteW5tabbHz+CCxgaUHpXCkkYtTSK7JEJgv2Mz/nB34pHDbcMB9HJoxfSoJV
	hV1Ikf0gumKIb9bvdLdtgouPrKjfRYdjeqaeXis61bub+nri42RhD+YTzuOcKgIQVXcA+jGsLiIuB
	pH2IUvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNzh-00000006z46-272t;
	Fri, 08 May 2026 16:24:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNze-00000006z3I-30B5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 16:24:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23B2C1E5E;
	Fri,  8 May 2026 09:23:55 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7ECBF3F763;
	Fri,  8 May 2026 09:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778257440; bh=/UBLQNQv/jESKVCey7P8WZJaGnOhYl64JzXcUuHLQyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U9In9eVzRoyWBnl/EdZ/eBCvm3lpoZfcWCHQN4ev0L4+Ug8VqM8tpEGUUDon/UnV0
	 p8eCYtPD6rbrxpkpEMCeRAcGAikvWdWEAPN3sDbqvB+MMjBnmuiYWzORDhQfllSEUZ
	 9KivCJVDol8B3ZdxF27DQflk1uTSS1Dn4WHkMMmM=
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	zengheng4@huawei.com
Cc: wangkefeng.wang@huawei.com,
	xry111@xry111.site,
	catalin.marinas@arm.com,
	yang@os.amperecomputing.com,
	reinette.chatre@intel.com,
	will@kernel.org,
	thuth@redhat.com,
	ben.horgan@arm.com,
	mrigendra.chaubey@gmail.com,
	fenghuay@nvidia.com,
	ahmed.genidi@arm.com
Subject: [PATCH v3 1/4] arm_mpam: Fix false positive assert failure during mpam_disable()
Date: Fri,  8 May 2026 17:23:38 +0100
Message-ID: <20260508162341.3762549-2-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508162341.3762549-1-james.morse@arm.com>
References: <20260508162341.3762549-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_092403_150852_EC33DC15 
X-CRM114-Status: GOOD (  16.21  )
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

mpam_assert_partid_sizes_fixed() is used to document that the caller
doesn't expect the discovered PARTID size to change while it is walking
a list sized by PARTID. Typically the MSC state is not written to until
all the MSC have been discovered and this value is set.

However, if discovering the MSC fails and schedules mpam_disable(),
then the MSC state is written to reset it. In this case the
discovered PARTID size may be become smaller - but only PARTID 0
will be used once resctrl_exit() has been called.

Skip the WARN_ON_ONCE() if mpam_disable_reason has been set.

Fixes: 3bd04fe7d807bb ("arm_mpam: Extend reset logic to allow devices to be reset at any time")
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 41b14344b16f..bef5e9e9e844 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -164,11 +164,17 @@ static void mpam_free_garbage(void)
 /*
  * Once mpam is enabled, new requestors cannot further reduce the available
  * partid. Assert that the size is fixed, and new requestors will be turned
- * away.
+ * away. This is needed when walking over structures sized by PARTID.
+ *
+ * During mpam_disable() these structures are not fixed, but the MSC state
+ * is still reset using whatever sizes have been discovered so far. As only
+ * PARTID 0 will be used after mpam_disable(), any race would be benign.
+ * Skip the check if a mpam_disable_reason has been set.
  */
 static void mpam_assert_partid_sizes_fixed(void)
 {
-	WARN_ON_ONCE(!partid_max_published);
+	if (!mpam_disable_reason)
+		WARN_ON_ONCE(!partid_max_published);
 }
 
 static u32 __mpam_read_reg(struct mpam_msc *msc, u16 reg)
-- 
2.53.0


