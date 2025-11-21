Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FE8CFA762
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 09:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrY+pCES8Lr8ar4CYQXHO9RG4hQV+PjFmGgWq4oPIAA=; b=nQRSd5lPHBY5QNK/9AmNHZBiJT
	lY8fj8nKpjElUGosNY9dr1Awjfd9ZyEU7zOUmqspsx37WWttKWG5r4AihF5tKSR/1PNAuGG7nqM8F
	n+CqvMiqjkooxaRBZQ/RPWlXXa4rPFePB/JSPpUtsrpoAGj/XAwr5fAee0BRHSoraD/KpiqGjNbpL
	i3i7ksG2/T822+DmghXQGgv8XO7IG34+dQuLpfRQW1sI8HTllp+J6OFjLI2L9hNCIXPVNB+K3O4qB
	przYAuO5mOxxeZQca/WmlLRDcjvKEuyAjeKs9ALBfbixI/zkyE8xU3WC8q3FWdIAXleaPM5BCY9Ri
	N+pU7PCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNMy-000000088kD-3BSD;
	Fri, 21 Nov 2025 09:23:56 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNMu-000000088hi-3p7H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 09:23:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UrY+pCES8Lr8ar4CYQXHO9RG4hQV+PjFmGgWq4oPIAA=;
	b=JEy7kf+6F/tBqxGKMOknAV8OX/p+URTD23jg7dHml3kKmPLxmWb7Q3OnpmdoOkZ+jXnAhxHe4
	r6wP+AJNXuTiYE+3it6noIqKNu2gqN2hHYsgSlhxPqOMlYYyxdC7exPJXl7wm94Yp2vdfhHoeKv
	MqwohDLKTjAXmoxMMMhW5Ao=
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dCV9418fTzKmWx;
	Fri, 21 Nov 2025 17:22:00 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id B206614022D;
	Fri, 21 Nov 2025 17:23:45 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 21 Nov
 2025 17:23:44 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oliver.upton@linux.dev>, <catalin.marinas@arm.com>,
	<corbet@lwn.net>, <pbonzini@redhat.com>, <will@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <zhengtian10@huawei.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yezhenyu2@huawei.com>,
	<xiexiangyou@huawei.com>, <zhengchuan@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<suzuki.poulose@arm.com>
Subject: [PATCH v2 5/5] KVM: arm64: Document HDBSS ioctl
Date: Fri, 21 Nov 2025 17:23:42 +0800
Message-ID: <20251121092342.3393318-6-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20251121092342.3393318-1-zhengtian10@huawei.com>
References: <20251121092342.3393318-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_012353_432555_D2F6A1CB 
X-CRM114-Status: UNSURE (   8.22  )
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

A new ioctl (KVM_CAP_ARM_HW_DIRTY_STATE_TRACK) provides a mechanism for
userspace to configure the HDBSS buffer size during live migration,
enabling hardware-assisted dirty page tracking.

Signed-off-by: eillon <yezhenyu2@huawei.com>
Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
---
 Documentation/virt/kvm/api.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 57061fa29e6a..25d60ff136e9 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8703,6 +8703,21 @@ This capability indicate to the userspace whether a PFNMAP memory region
 can be safely mapped as cacheable. This relies on the presence of
 force write back (FWB) feature support on the hardware.

+7.44 KVM_CAP_ARM_HW_DIRTY_STATE_TRACK
+:Architectures: arm64
+:Type: VM
+:Parameters: args[0] is the allocation order determining HDBSS buffer size
+:Returns: 0 on success, negative value on failure
+
+Enables hardware-assisted dirty page tracking via the Hardware Dirty State
+Tracking Structure (HDBSS).
+
+When live migration is initiated, userspace can enable this feature by
+setting KVM_CAP_ARM_HW_DIRTY_STATE_TRACK through IOCTL. KVM will allocate
+per-vCPU HDBSS buffers.
+
+The feature is disabled by invoking the ioctl again.
+
 8. Other capabilities.
 ======================

--
2.33.0


