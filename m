Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2A9CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+PbXGB0TDM7IhkzkJIjOygQNh/MJDUUvfzIy9iSoDtk=; b=L2j5xHe8mYQ1nVxAQp3mm7fC/t
	fpkq6A+HlNkKdRtNoo0mmq8VVnXYhjMXwnAzGxXcQHWma2kCr/CQRO9xLivkROJeV4/XsEHvpYppD
	OdTGFLaiOeSvKDHH3XRwvuZmhfwJDQHcIk1hqyKikF45abvZiQBbjCpn6pFvCsZtd5zjRWjf1ABjM
	2hqe5rds9uO9xjr2/D8nUUC/n0ke99Qtsqj8dIl8+IVHKJkkmU6SYF8eUvHrQMhAYlfISdDKRTBZF
	2L9gxatNJzZaBNoV+lQA8WUJ0uKnCZ8fIWK1/484GkhoHNdwjVHGXp8aLxsBvE32MwtXPDgcGF1Qg
	lM/gOx/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsIB-00000004xQc-2hgI;
	Tue, 09 Sep 2025 06:57:27 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvpHP-000000041If-3aDm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 03:44:29 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cLV1m65CqzRkDx;
	Tue,  9 Sep 2025 11:39:40 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id C2D111800B1;
	Tue,  9 Sep 2025 11:44:17 +0800 (CST)
Received: from huawei.com (10.50.165.33) by dggpemf500013.china.huawei.com
 (7.185.36.188) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 9 Sep
 2025 11:44:17 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <oliver.upton@linux.dev>, <yuzenghui@huawei.com>, <maz@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <liuyonglong@huawei.com>,
	<wangzhou1@hisilicon.com>, <yangjinqian1@huawei.com>
Subject: [PATCH v2 0/3] KVM: arm64: make EL2 feature fields writable in ID_AA64MMFR1_EL1
Date: Tue, 9 Sep 2025 11:44:12 +0800
Message-ID: <20250909034415.3822478-1-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_204428_043071_224CC398 
X-CRM114-Status: UNSURE (   7.06  )
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

Allow userspace to downgrade EL2 features (VH, TWED, HCX) to ensure VM live
migration compatibility between hosts with varying feature support.

v1: https://lore.kernel.org/linux-arm-kernel/20250325121126.1380681-1-yangjinqian1@huawei.com/

Change Log:
v1->v2:
  -Added support for downgrading TWED and VH fields.
  -Added corresponding test cases to the set_id_regs selftest.

Jinqian Yang (3):
  KVM: arm64: Make ID_AA64MMFR1_EL1.HCX writable from userspace
  KVM: arm64: Make ID_AA64MMFR1_EL1.TWED writable from userspace
  KVM: arm64: Make ID_AA64MMFR1_EL1.VH writable from userspace

 arch/arm64/kvm/sys_regs.c                       | 3 ---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.33.0


