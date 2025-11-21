Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67080CFA761
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2FNmGdRA6WNkSW3gQDN3+WluFUlUMpgBNvvjHe+ozws=; b=IATfem1JSnKVtfGCLKUcZylgCJ
	LmQUdyiTlIOJWbYOj62QQPeO6E/33J8UoE1v6WoJoWJxVuRe1xR4cntxQwOlqX91ylF9/c8J4MOT/
	W1mwu8vZsL+2D7SQxfdZYy+255W4iyiqr1fgMDbzczv+0IR9XevY5ipwI26IemsDPbpzPrrtShRQr
	sdxhWRsktUz2bCmmNjxa11SALZ9WItHoV0U81Sh5vBLkKjDNkFEYEG3FTC3vMkAP++0hwe+PVloFd
	8SDEoIQw5QOzfawpra20HmiJxPeUqovXMtIzr+AE/M0F7miEnQjmKH2g2lQz094SS0RnLwkd+xGJI
	m6Jh0JNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNN5-000000088mH-1adK;
	Fri, 21 Nov 2025 09:24:03 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNMv-000000088hk-0z2t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 09:23:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2FNmGdRA6WNkSW3gQDN3+WluFUlUMpgBNvvjHe+ozws=;
	b=ozJXLhj6qKROoOq+Bbf5eCE0ySKbEVe0eFVDWD/2NDiAYI7utwPDBHlEEAzurSA2GkdIXdVXT
	zKejclK2pnorcdLX5muQcRwK9J4d/+pnoQfVEP6sPTiIopiImF0IP81WLWpiUwUujyavJZPrWwU
	mTG2AV+Dhxw8dUbY0bLSFqk=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4dCV912sbxz1prkV;
	Fri, 21 Nov 2025 17:21:57 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 369DA180BCF;
	Fri, 21 Nov 2025 17:23:43 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 21 Nov
 2025 17:23:42 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oliver.upton@linux.dev>, <catalin.marinas@arm.com>,
	<corbet@lwn.net>, <pbonzini@redhat.com>, <will@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <zhengtian10@huawei.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yezhenyu2@huawei.com>,
	<xiexiangyou@huawei.com>, <zhengchuan@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<suzuki.poulose@arm.com>
Subject: [PATCH v2 0/5] Support the FEAT_HDBSS introduced in Armv9.5
Date: Fri, 21 Nov 2025 17:23:37 +0800
Message-ID: <20251121092342.3393318-1-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_012353_600299_351CC5EE 
X-CRM114-Status: GOOD (  12.26  )
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

This series of patches add support to the Hardware Dirty state tracking
Structure(HDBSS) feature, which is introduced by the ARM architecture
in the DDI0601(ID121123) version.

The HDBSS feature is an extension to the architecture that enhances
tracking translation table descriptors' dirty state, identified as
FEAT_HDBSS. The goal of this feature is to reduce the cost of surveying
for dirtied granules, with minimal effect on recording when a granule
has been dirtied.

The purpose of this feature is to make the execution overhead of live
migration lower to both the guest and the host, compared to existing
approaches (write-protect or search stage 2 tables).

After these patches, users(such as qemu) can use the
KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl to enable or disable the HDBSS
feature before and after the live migration.

This feature is similar to Intel's Page Modification Logging (PML),
offering hardware-assisted dirty tracking to reduce live migration
overhead. With PML support expanding beyond Intel, HDBSS introduces a
comparable mechanism for ARM.

eillon (4):
  arm64/sysreg: Add HDBSS related register information
  KVM: arm64: Support set the DBM attr during memory abort
  KVM: arm64: Add support for FEAT_HDBSS
  KVM: arm64: Enable HDBSS support and handle HDBSSF events

Tian Zheng (1):
  KVM: arm64: Document HDBSS ioctl

 Documentation/virt/kvm/api.rst       |  15 ++++
 arch/arm64/Kconfig                   |  14 ++++
 arch/arm64/include/asm/cpucaps.h     |   2 +
 arch/arm64/include/asm/cpufeature.h  |   5 ++
 arch/arm64/include/asm/esr.h         |   2 +
 arch/arm64/include/asm/kvm_arm.h     |   1 +
 arch/arm64/include/asm/kvm_host.h    |  14 ++++
 arch/arm64/include/asm/kvm_mmu.h     |  17 +++++
 arch/arm64/include/asm/kvm_pgtable.h |   4 +
 arch/arm64/include/asm/sysreg.h      |  12 +++
 arch/arm64/kernel/cpufeature.c       |   9 +++
 arch/arm64/kvm/arm.c                 | 107 +++++++++++++++++++++++++++
 arch/arm64/kvm/handle_exit.c         |  45 +++++++++++
 arch/arm64/kvm/hyp/pgtable.c         |   6 ++
 arch/arm64/kvm/hyp/vhe/switch.c      |   1 +
 arch/arm64/kvm/mmu.c                 |  10 +++
 arch/arm64/kvm/reset.c               |   3 +
 arch/arm64/tools/cpucaps             |   1 +
 arch/arm64/tools/sysreg              |  28 +++++++
 include/linux/kvm_host.h             |   1 +
 include/uapi/linux/kvm.h             |   1 +
 tools/include/uapi/linux/kvm.h       |   1 +
 22 files changed, 299 insertions(+)

--
2.33.0


