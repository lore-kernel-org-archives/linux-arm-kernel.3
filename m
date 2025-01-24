Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EC9C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5O3jUBPcr6JkxwloUFeyP3Bie30h8kTmm8MQ3fN/H4=; b=syx8UcYjj14aon26tkQOju3W94
	Fp8TAvWlRNu/yCCRaphRWg5LKAkqIZEKugmMJtJytCXqR3kvU0/bE2UD42xyGe02tHL05rMg22XWp
	gJRO7w/uIERQGHB9hrLpf6jOi74tBsJpcu2nfGfIzy9h1my+JMvXAvYbJnXKV9pQtLmhSk1pAnivb
	VwEs4a24jop2ZcoN4rINHfhaHd2MvEjoXPWePRk9/XqcjnhWAhEFlpbIG3lRVrYD4ZLjEkL4P8pw7
	AEJ+V2Xe8TOGoWeLfpQ1fFibkedmkSzi3LqNkDoXIUfdBKD/zhxRbaopk1iDkR3vVUJP3zodsNif8
	K1t0Wj/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLXQ-0000000Exzs-094C;
	Fri, 24 Jan 2025 15:24:04 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLST-0000000Ex33-07sg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:18:58 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YfhHX1VFLz6K5xf;
	Fri, 24 Jan 2025 23:16:56 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 7DA65140736;
	Fri, 24 Jan 2025 23:18:55 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 Jan 2025 16:18:47 +0100
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <kvmarm@lists.linux.dev>, <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<cohuck@redhat.com>, <eric.auger@redhat.com>, <sebott@redhat.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
	<jonathan.cameron@huawei.com>, <anthony.jebson@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>
Subject: [PATCH v5 3/4] KVM: arm64: Report all the KVM/arm64-specific hypercalls
Date: Fri, 24 Jan 2025 15:17:31 +0000
Message-ID: <20250124151732.6072-4-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com>
References: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_071857_209373_05CC6865 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

Currently ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID returns the
bitmap corresponding to KVM_REG_ARM_VENDOR_HYP_BMAP and it only
returns _KVM_FEATURES_FUNC_ID and _KVM_PTP_FUNC_ID. Change that
to return all the KVM/arm64-specific hypercalls exposed by
KVM/arm64 to guest operating systems.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 arch/arm64/kvm/hypercalls.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
index 27ce4cb44904..6132cb542200 100644
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@ -359,7 +359,11 @@ int kvm_smccc_call_handler(struct kvm_vcpu *vcpu)
 		val[3] = ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3;
 		break;
 	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
-		val[0] = smccc_feat->vendor_hyp_bmap;
+		val[0] = GENMASK(ARM_SMCCC_KVM_FUNC_MMIO_GUARD,
+				 ARM_SMCCC_KVM_FUNC_FEATURES);
+		/* Function numbers 8-63 are reserved for pKVM for now */
+		val[2] = GENMASK((ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_CPUS - 64),
+				 (ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_VER - 64));
 		break;
 	case ARM_SMCCC_VENDOR_HYP_KVM_PTP_FUNC_ID:
 		kvm_ptp_get_time(vcpu, val);
-- 
2.47.0


