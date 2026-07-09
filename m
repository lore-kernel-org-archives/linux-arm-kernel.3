Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9876C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jijx0ahIqC44fYp2NoWKu1QyFuyycAV3i8HM+hvqKxw=; b=fbxEq5VBPVzpik148B1kgFK9ss
	U7e4MROmKuuxBin2UanZi3r5Wr+CnZeNLKCrciads7HNn+QGa5dbf/mPuJoOwFrThVLLCYhfCZ7ii
	uNVh/m5aXB5mI3rN66qVFJwE5ySKcGZU1hnm9H9ZpF/t64ISAlqgcpi4ckWojimkX2WbEjdiJ0fa7
	1BNV+2bEK+6ySajjGjJ31nQv4ZkjIO59Bu1GdK4ISwclyRxZmWe5fK2gnRy8619HmA+6bvxurrOow
	BKu12UDCMvYZSAj5JW4PvQm8EQNuqXS6wjHKef4RqGjF3+mzMepqfnkhCVLIGpcuqDJVhNdU1FY4l
	WZdrjcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmBO-00000001zjI-0DKi;
	Thu, 09 Jul 2026 10:40:42 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmBJ-00000001zfT-1lxl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:40:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Jijx0ahIqC44fYp2NoWKu1QyFuyycAV3i8HM+hvqKxw=;
	b=hekE5s7/JixoudAh6w1oWWluEXM2AkY87QjnrtSve1WJVveQejQqAtr1uZpbW+EeG3DiIsLpZ
	RV3VgjS9Bkl23R338jnPsf58fP5YlptfIlnkpxuIJCGALINBbums44J9c6rQuTWHqJzvfQSOYlF
	IPBuQ6moWkjbHPDvTvUlLiY=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gwrpp6x5Jz1cyPZ;
	Thu,  9 Jul 2026 18:31:14 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 378DE40586;
	Thu,  9 Jul 2026 18:40:28 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 9 Jul
 2026 18:40:27 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <zhengtian10@huawei.com>
CC: <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<yangjinqian1@huawei.com>, <caijian11@h-partners.com>,
	<liuyonglong@huawei.com>, <yezhenyu2@huawei.com>, <yubihong@huawei.com>,
	<linuxarm@huawei.com>, <joey.gouly@arm.com>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>, <leo.bras@arm.com>
Subject: [PATCH v4 1/6] KVM: arm64: Enable eager hugepage splitting if HDBSS is available
Date: Thu, 9 Jul 2026 18:40:21 +0800
Message-ID: <20260709104026.2612599-2-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260709104026.2612599-1-zhengtian10@huawei.com>
References: <20260709104026.2612599-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_034037_946434_8FB5AFA2 
X-CRM114-Status: GOOD (  11.77  )
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

From: Leonardo Bras <leo.bras@arm.com>

FEAT_HDBSS speeds up guest memory dirty tracking by avoiding a page fault
and saving the entry in a tracking structure.

That may be a problem when we have guest memory backed by hugepages or
transparent huge pages, as it's not possible to do on-demand hugepage
splitting, relying only on eager hugepage splitting.

So, at stage2 initialization, enable eager hugepage splitting with
chunk = 256K * PAGE_SIZE if the system supports HDBSS.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/mmu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6c941aaa10c6..e086c01a9325 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1027,8 +1027,12 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 	for_each_possible_cpu(cpu)
 		*per_cpu_ptr(mmu->last_vcpu_ran, cpu) = -1;

-	 /* The eager page splitting is disabled by default */
-	mmu->split_page_chunk_size = KVM_ARM_EAGER_SPLIT_CHUNK_SIZE_DEFAULT;
+	 /* The eager page splitting is disabled by default if system has no HDBSS */
+	if (system_supports_hdbss())
+		mmu->split_page_chunk_size = 256 * 1024 * PAGE_SIZE;
+	else
+		mmu->split_page_chunk_size = KVM_ARM_EAGER_SPLIT_CHUNK_SIZE_DEFAULT;
+
 	mmu->split_page_cache.gfp_zero = __GFP_ZERO;

 	mmu->pgd_phys = __pa(pgt->pgd);
--
2.33.0


