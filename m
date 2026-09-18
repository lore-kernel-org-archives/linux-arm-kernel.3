Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BFDC982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xcW4bfYK1y52qnBlOd8nVvzkoV8g+r3/FI00akVKRxo=; b=vj0KUBrNjgkBhKutVwSivxbU9t
	ewZ5VmFy6OgXrTvVuMoJN9TR+SoOqfOeEEZjN7D90Y1lJRSXALbGF6uMxSEIxMQQo3bt+jtt4YN4+
	FctzLuNxLqhbU10BMTQODfh0G0tMNF5+M0HvK8MOf7488LCDmuANGoRtGsqiJ44hPCAIE1xB063NB
	ODVLm1vQouEJHVRD3M5QJP2RylMFRHVl40LhBxEo5WoonAfzGXEzEcNkNmVct09K2ADzsyS7Iittu
	S/fMnsGtVLBzGUwZsVrFKN18asvHPQKWeYBRTYLJpOF4joxhROz597p6BlvOHWghk8x7WBRNn2j1T
	L6Ci/BeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TsX-0000000DngL-2Hj0;
	Fri, 18 Sep 2026 08:23:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TsR-0000000DndH-2OFe
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 08:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=xcW4bfYK1y52qnBlOd8nVvzkoV8g+r3/FI00akVKRxo=; b=mlF8bYhlRKFL7E7cLKNXZs7hd6
	NydggKTZWiptvTi3DX7HiLuJFcEE3frNWofa/pmAedpBHSmjxjvNKV7EdGbtxzWKKGn4Zr/YEitgM
	i9aBbq8A2XMMVhTcJWdi7ibFOKcthmjxl6HbDqPyafkV1QS6p1y0WXP1/QiBAYFk6KZ/sJqLV9xTe
	7h+tV3gtY9OROzCZZ3aGz33mvIlkujYlR3IGY2PonnduLmg8dIFc4xXfocOAq8mHFIJgqm5LWzQ/F
	7Jeoslssh+RjpqXdoTzeZ7dA7/71+eo9rXVMlaai0g4QZBKOVjdR7FeEHOYibCaMITYHe12hu8HzR
	1EbS38xA==;
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7TsO-00000009mb5-00av
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:23:22 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xcW4bfYK1y52qnBlOd8nVvzkoV8g+r3/FI00akVKRxo=;
	b=PtUEALXxZaVfFUg9j3OaGZ0WIKweMClyanE+BmBBWLO+Lppb/qvbIn4DiGKeN4qs9nDYtU/gp
	IBPTVE+KH7AcM1lDETlBe2OAxU91vsBSum8Ih9Sy3vjiM90mzFu0GMjfvVwYSyyeWz/FEEr3OSX
	ptqCyEksOFBoQuIV4VF1IeI=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hmQMK5QRwzKm6V;
	Fri, 18 Sep 2026 16:11:57 +0800 (CST)
Received: from dggpemr200003.china.huawei.com (unknown [7.185.36.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 53D9C4057A;
	Fri, 18 Sep 2026 16:23:01 +0800 (CST)
Received: from huawei.com (10.50.159.234) by dggpemr200003.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 18 Sep
 2026 16:23:00 +0800
From: Yize Wang <wangyize7@huawei.com>
To: <maz@kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <oupton@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<fuad.tabba@linux.dev>, <joey.gouly@arm.com>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>, <yuzenghui@huawei.com>, <mark.rutland@arm.com>,
	<zhengchuan@huawei.com>, <jiangjiacheng@huawei.com>, <wangyize7@huawei.com>,
	<yize_w1110@163.com>
Subject: [PATCH 0/2] Batch register access for live migration optimization
Date: Fri, 18 Sep 2026 16:18:13 +0800
Message-ID: <20260918081930.4014735-1-wangyize7@huawei.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.159.234]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemr200003.china.huawei.com (7.185.36.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_092320_426755_E64E7545 
X-CRM114-Status: UNSURE (   7.20  )
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

This series adds batch register access support to KVM/arm64 to reduce
syscall overhead during VM live migration.

Currently, QEMU issues one ioctl per register when saving/restoring VGIC
state. On large VM configurations this means tens of thousands of syscalls,
where lock acquisition and context switch overhead dominates migration
downtime. Thus, we provide a batch register method to allow userspace
read/write multiple distributor and redistributor registers in a single call.
In this way, we can significantly reduce syscalls and migration downtime.

Test the VM migration time under pressure conditions.
The VM specifications for migration are as follows:
- VM use 4-K page;
- the number of VCPU is 160;
- the total memory is 320Gigabit;
- use 'Redis SET-benchmark' to pressurize VM;

Performance results (3-run average, ms):
    | Metric              | Without patch | With patch | Improvement |
    |---------------------|---------------|------------|-------------|
    | Migration downtime  |        536    |     321    |     40%     |
    | Source (total)      |        344    |     230    |     33%     |
    |   - VGIC put        |        158    |      40    |     75%     |
    |   - VGIC get        |        120    |      19    |     84%     |
    | Destination (total) |        192    |      91    |     53%     |
    |   - VGIC put        |        132    |      27    |     80%     |

Yize Wang (2):
  KVM: arm64: Add batch group constant and data structure to UAPI header
  KVM: arm64: Add VGIC v3 batch register access implementation

 arch/arm64/include/uapi/asm/kvm.h     |  10 +++
 arch/arm64/kvm/vgic/vgic-kvm-device.c | 113 +++++++++++++++++++++++++++++++---
 2 files changed, 114 insertions(+), 9 deletions(-)
 

