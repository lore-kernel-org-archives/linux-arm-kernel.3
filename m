Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FE8F55457
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 04:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jS9KMSv+2m6fUiDF1tdjjHI4QTWcbBOKczvR19neBjk=; b=M2s/GqTDIiVlUhaOkpDgedXIhi
	5a6Z8QEVNUzTQtcnY8PQUiafQSTbSnCGAF2bF4wEDHTe3NBlchMwydveEkpFdyNXxRk4UMQcBkVPB
	NWF4shxsuiSVfRrpDCb+iWaxJVe09Bc07mZV6BNTTp1aGVRl4TvGBca3yk6DMrrZ64NgQQU+0brgh
	tPisL+TZF3raDQiA5xjPg0qXr2OT34j4zENTWpATiudcMYeTcj9gmqpXEkUlMd3bOhgq5yetOF1pD
	EAJjsiSVWhFNGd6uOpVLH7o8clKVGEMsuccdlrMSwVidQu6vSGT5fUl3Ec3Q1vUe/J54eLNNYYVtd
	7x5xnhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv68d-00000003ArW-3s34;
	Wed, 25 Feb 2026 04:04:39 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv68Z-00000003Anf-2iaD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 04:04:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jS9KMSv+2m6fUiDF1tdjjHI4QTWcbBOKczvR19neBjk=;
	b=zDuE/x4D/8nwKSb3wILbY6/6Y42DWJ5ub8M3+5beICBah5xaqHer4BfmYbmfvG10LcJCId9pU
	sCA5e7zzRQKD4Z+bNxR9rL5bPhr4dNGSHfp5KoVsN4EGrIU8ODCfbIbba7mQaf89YkfjpG1EQ6Q
	ZpHiMvdgLtJA5bTs1N9ixKw=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fLLSq15KRzmV6k;
	Wed, 25 Feb 2026 11:59:39 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id C4A8340565;
	Wed, 25 Feb 2026 12:04:26 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 25 Feb
 2026 12:04:25 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<corbet@lwn.net>, <pbonzini@redhat.com>, <will@kernel.org>,
	<zhengtian10@huawei.com>
CC: <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<liuyonglong@huawei.com>, <Jonathan.Cameron@huawei.com>,
	<yezhenyu2@huawei.com>, <linuxarm@huawei.com>, <joey.gouly@arm.com>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>,
	<suzuki.poulose@arm.com>, <leo.bras@arm.com>
Subject: [PATCH v3 5/5] KVM: arm64: Document HDBSS ioctl
Date: Wed, 25 Feb 2026 12:04:21 +0800
Message-ID: <20260225040421.2683931-6-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260225040421.2683931-1-zhengtian10@huawei.com>
References: <20260225040421.2683931-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_200435_869095_573B961D 
X-CRM114-Status: UNSURE (   9.55  )
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
 Documentation/virt/kvm/api.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index fc5736839edd..2b5531d40d02 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8896,6 +8896,22 @@ helpful if user space wants to emulate instructions which are not
 This capability can be enabled dynamically even if VCPUs were already
 created and are running.

+7.47 KVM_CAP_ARM_HW_DIRTY_STATE_TRACK
+----------------------------
+
+:Architectures: arm64
+:Type: VM
+:Parameters: args[0] is the allocation order determining HDBSS buffer size
+             args[1] is 0 to disable, 1 to enable HDBSS
+:Returns: 0 on success, negative value on failure
+
+Enables hardware-assisted dirty page tracking via the Hardware Dirty State
+Tracking Structure (HDBSS).
+
+When live migration is initiated, userspace can enable this feature by
+setting KVM_CAP_ARM_HW_DIRTY_STATE_TRACK through IOCTL. KVM will allocate
+per-vCPU HDBSS buffers.
+
 8. Other capabilities.
 ======================

--
2.33.0


