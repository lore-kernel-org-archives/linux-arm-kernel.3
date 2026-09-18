Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3D3C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCmI3leX1pSmZveS+R3odec3VGT0tP4oB9BLzPo+eRY=; b=MEKFyvyiXQSBNCKDOgUs+J0mtV
	Zv8hWa9Z92z0/+Vh4lnI0AhjW6PjmAU6Z2XYFrNHrij9h1R5iNm83w71xDr2IhXUYphmjD9/3frrD
	FiyLs1Fwn8boTV55iTDE/WO5FZWpF2XGMNhOFerMlzm12OH+nuC8LiYPriN2KtI/cSguVjgA4l0Zs
	onWorpclhThd8hp6KGINzlVJL70RaAhQFqFIyq4iM9D7PdMWgJHyymg0Mq/pALNDshI7ufJ7lHp8I
	pPodsqtqElj9pJzPL7fud878ikAH2F6+SD8Okk8LcD3YpAxDbknjkc4UvyapNKnFknea1T5GKjBxb
	0F/wnjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TsJ-0000000Dnam-2mw0;
	Fri, 18 Sep 2026 08:23:17 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TsG-0000000DnYm-2xAr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:23:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FCmI3leX1pSmZveS+R3odec3VGT0tP4oB9BLzPo+eRY=;
	b=lgtSmOePElVqGFDjBJrpu3DHav4matcZPo1VeybjopEa14RMmu82Kgom9oIHG8JEEL5tvBfJh
	u8LwzRvTffwM6z3rWwSWOxrg25XVXbZV3YZILfNe2Sg6V7LHDgJUqpnlDQuyjaAl0xh0Y3YU5sA
	OhtH8z7IuD/QWllOzQvQ/HM=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hmQML6MVTzKm5t;
	Fri, 18 Sep 2026 16:11:58 +0800 (CST)
Received: from dggpemr200003.china.huawei.com (unknown [7.185.36.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 75A8040563;
	Fri, 18 Sep 2026 16:23:02 +0800 (CST)
Received: from huawei.com (10.50.159.234) by dggpemr200003.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 18 Sep
 2026 16:23:01 +0800
From: Yize Wang <wangyize7@huawei.com>
To: <maz@kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <oupton@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<fuad.tabba@linux.dev>, <joey.gouly@arm.com>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>, <yuzenghui@huawei.com>, <mark.rutland@arm.com>,
	<zhengchuan@huawei.com>, <jiangjiacheng@huawei.com>, <wangyize7@huawei.com>,
	<yize_w1110@163.com>
Subject: [PATCH 1/2] KVM: arm64: Add batch group constant and data structure to UAPI header
Date: Fri, 18 Sep 2026 16:18:14 +0800
Message-ID: <20260918081930.4014735-2-wangyize7@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918081930.4014735-1-wangyize7@huawei.com>
References: <20260918081930.4014735-1-wangyize7@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.159.234]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemr200003.china.huawei.com (7.185.36.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_012313_232668_2EF8A8AA 
X-CRM114-Status: UNSURE (   7.81  )
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

Add KVM_DEV_ARM_VGIC_GRP_BATCH_REGS group ID, KVM_DEV_ARM_VGIC_BATCH_MAX
limit, and struct kvm_dev_arm_vgic_batch_entry for batch VGIC register
access. These UAPI definitions allow userspace to read/write multiple
VGIC registers in a single ioctl call.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: Yize Wang <wangyize7@huawei.com>
---
 arch/arm64/include/uapi/asm/kvm.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 019e5e3d892e..f84530274edd 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -418,12 +418,22 @@ enum {
 #define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO  7
 #define KVM_DEV_ARM_VGIC_GRP_ITS_REGS 8
 #define KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ  9
+#define KVM_DEV_ARM_VGIC_GRP_BATCH_REGS 10
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT	10
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
 			(0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INTID_MASK	0x3ff
 #define VGIC_LEVEL_INFO_LINE_LEVEL	0
 
+#define KVM_DEV_ARM_VGIC_BATCH_MAX	4096
+#define KVM_DEV_ARM_VGIC_ATTR_FLAG_LOCKED 12
+struct kvm_dev_arm_vgic_batch_entry {
+	__u32 group;
+	__u64 attr;
+	__u32 val;
+	__s32 error;
+};
+
 #define   KVM_DEV_ARM_VGIC_CTRL_INIT		0
 #define   KVM_DEV_ARM_ITS_SAVE_TABLES           1
 #define   KVM_DEV_ARM_ITS_RESTORE_TABLES        2
-- 
2.43.0


