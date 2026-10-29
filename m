Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B5D606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CpA3qCSU;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=eYelVYeK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qNHQ/CjqKp6Qo9XYbCd8OHdzmqMQwGutPp8zz1Kaeis=; b=CpA3qCSUgPzKSUwHZ3lfJZkOQL
	iMiue9eOwv/2k9zrefjB/mR0MZao+ZNU0oCdrWnBX2VkoTSXtL21uWtyficgvEtEkCHgsJY+CGiLK
	yAD+ZHcB/vx9e2Qf4b50oXoqkHO4Nd12LawIVMCf4PMSqUVzoNNq4WapXxd7LtGnKqkFCxdAlnqi+
	IgEQ2mZTOmnaGLo4NGIizweuVAUPynO0ifH1xSZMTuIQKGo+NyeYJLGuQqwLvnmrLZ1QqC/sSWnbX
	BpFJXMyg8Zu4Df+MguD2jyeOCMbT1rU/wH1MvD1XeckB2qWa6Hof8+4pjLHO01fiPFEl2nGoCosPY
	ybzozm/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPNz-00000009BgL-2RwQ;
	Thu, 29 Oct 2026 12:37:39 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPNF-00000009AWe-0bDF;
	Thu, 29 Oct 2026 12:36:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qNHQ/CjqKp6Qo9XYbCd8OHdzmqMQwGutPp8zz1Kaeis=;
	b=eYelVYeKjnXwWuyoa6znSSGsY8G8Dwya5YJDIaSfuAg+6yuJctINj/RmCrH39XuA3mo5Op9KP
	xEWjDrv+y3TVddIRpGWv4vA0o9zEgle/cgCi6vJkAvPUDwkb7ysOkxcqDcAZ6In3EFouxDcHUKM
	aKG+pCOczjkZcunfYzaqegw=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHv3Y3MzmVBy;
	Thu, 29 Oct 2026 20:36:43 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8816640572;
	Thu, 29 Oct 2026 20:36:50 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:49 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 16/19] arm_mpam: resctrl: Report counter assignment per resource
Date: Thu, 29 Oct 2026 20:36:08 +0800
Message-ID: <20261029123611.1108424-17-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029123611.1108424-1-ruanjinjie@huawei.com>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_053653_359880_63790292 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

resctrl_arch_mbm_cntr_assign_enabled() says assignment is on by checking
whether the resource is the L3. A platform whose L3 has no bandwidth
counters is then told assignment is on, although no counters were set
up.

Report the per-resource flag MPAM sets when it sets up the assignable
counters. Other resources can then report their own state.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 4de3ad5a8ca2..b5416f589698 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -130,7 +130,7 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 
 bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
 {
-	return (r == &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res);
+	return r->mon.mbm_cntr_assignable;
 }
 
 int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
-- 
2.34.1


