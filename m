Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1585CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 16:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLY3Cxn355Pp2HXjqitBjad1ls201nNuDAsHTuCdq5o=; b=QC4Yvf70shFSZPTdlS65l7l6HT
	/+2G+rS1y9tJ32eOdScki67a54TEG3tHwQ9AlsE5s3SPrlr29vT5f9gxtPfB33epMYbX47keAIEJI
	yzMUFeylumII5V+XYkXXzZ5A8ggG3pO2OuwTNAI6etvvl8rUj3d66Fu+vpoTY30oYyEHGL6RoOkuX
	z70on8P+em9Xu7iqMzbCLZ8ov/VHv9EqaQeAUDvbue+0c7QaE9U9hcKeteUxiFduGaTju3ZTTeFO4
	sSYbRRBEUAmhJlEEXcKbWyTQmAQ9hnDa15QOp1KI3eIxudHpw/p1PCdTpznvcf0eOS9ZPtPDGX4zx
	82xdX7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNzj-00000006z5L-2mAF;
	Fri, 08 May 2026 16:24:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNzf-00000006z3Z-3iiY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 16:24:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71C5F1E7D;
	Fri,  8 May 2026 09:23:57 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CED403F763;
	Fri,  8 May 2026 09:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778257442; bh=YO55I0yn0I6BsYQRV+sPGwF7VaB+Agwv5B9KA1bPS18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dz92HdUJB0VlYOScG1Db+9H2H5xCh2I93kuH+gGn1hvKaOjIdkR1iEyWUw0ne5zOK
	 24JuBA9xceihx0hc9ANKtj3tOIOrXgA7qJp0DCT12eVogzlTqJqJP/ovoSyAHlEAFF
	 rxY0vSlDj0NQzbMWY2V3THeS7AizCcwhDiX2rZ9E=
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
Subject: [PATCH v3 2/4] arm_mpam: Check whether the config array is allocated before destroying it
Date: Fri,  8 May 2026 17:23:39 +0100
Message-ID: <20260508162341.3762549-3-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508162341.3762549-1-james.morse@arm.com>
References: <20260508162341.3762549-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_092403_966954_2F24B87E 
X-CRM114-Status: GOOD (  12.41  )
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

__destroy_component_cfg() is called to free the configuration array.
It uses the embedded 'garbage' structure, which means the array has
to be allocated.

If __destroy_component_cfg() is called from mpam_disable() before the
configuration was ever allocated, then a NULL pointer is dereferenced.

Check for this case and return early if the configuration is not
allocated.

__destroy_component_cfg() also frees the mbwu_state as this is allocated
by __allocate_component_cfg(). As the mbwu_state is allocated after
comp->cfg is set, and is also under mpam_list_lock, only the first
pointer needs checking.

Fixes: 3bd04fe7d807bb ("arm_mpam: Extend reset logic to allow devices to be reset any time")
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index bef5e9e9e844..916d8fd45ed5 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2591,6 +2591,9 @@ static void __destroy_component_cfg(struct mpam_component *comp)
 
 	lockdep_assert_held(&mpam_list_lock);
 
+	if (!comp->cfg)
+		return;
+
 	add_to_garbage(comp->cfg);
 	list_for_each_entry(vmsc, &comp->vmsc, comp_list) {
 		msc = vmsc->msc;
-- 
2.53.0


