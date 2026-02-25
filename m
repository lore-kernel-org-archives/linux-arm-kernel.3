Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7346EF55449
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 04:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KFA0LtrJmju9DoOCjjWqc6FESXlRgEEAoBovtEGD878=; b=YISDU4lEyj0I0PEEpWdVM3dT3r
	hjJjMXjB/YiyitW08YIb0RBUpTATh3/iVs937mEvNRzdrOhMB25meMKubiv3xsUdVsxIPYa6eEgO3
	ZRF9kcy1tr0WPyvjH3Nlzyd6hN4qYhSXzdHYaswckyGG/ozDi867DMwPBmWBa0fj0uqBzhwP3Z1HA
	umXO48QOA8CS8m0oY7Mfugg1Lz01QeV7ajEz70SS7P5M4z9TcUtTTInVJO4LhZqX3OA3jjZu5Ww7C
	SJE/avuMlI5ww4OCHYlcbsaGr+qlhEYMKXtWjrNiI8CPZxZzAC5NncK+Gmntp4ndUDtUsZT4F6skL
	rVLNuStw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv68d-00000003ArA-2dMj;
	Wed, 25 Feb 2026 04:04:39 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv68Z-00000003Ani-1TZU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 04:04:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KFA0LtrJmju9DoOCjjWqc6FESXlRgEEAoBovtEGD878=;
	b=d3Fo55HYLZ5YNgsnlNFs+x7lvG6j5XhcIcLkMkciwSwEfmpBAmMpRbx0/K+fYxQtv6kHmqHpg
	Ob73DcFvqR6IbGxdE6UMa7sb/GG1ZOB9aRhJt9xCwl4P3nOz3/81/6YAua1iVC//n13Tw1efNma
	H465TfzKJCm719y2F/p8jgQ=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4fLLSm6860z1cyQ3;
	Wed, 25 Feb 2026 11:59:36 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 50D004048B;
	Wed, 25 Feb 2026 12:04:23 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 25 Feb
 2026 12:04:22 +0800
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
Subject: [PATCH v3 0/5] Support the FEAT_HDBSS introduced in Armv9.5
Date: Wed, 25 Feb 2026 12:04:16 +0800
Message-ID: <20260225040421.2683931-1-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_200435_717159_7410E955 
X-CRM114-Status: GOOD (  14.32  )
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
FEAT_HDBSS. This feature utilizes hardware assistance to achieve dirty
page tracking, aiming to significantly reduce the overhead of scanning
for dirty pages.

The purpose of this feature is to make the execution overhead of live
migration lower to both the guest and the host, compared to existing
approaches (write-protect or search stage 2 tables).

After these patches, users(such as qemu) can use the
KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl to enable or disable the HDBSS
feature before and after the live migration.

v2:
https://lore.kernel.org/linux-arm-kernel/20251121092342.3393318-1-zhengtian10@huawei.com/

v2->v3 changes:
- Remove the ARM64_HDBSS configuration option and ensure this feature
is only enabled in VHE mode.
- Move HDBSS-related variables to the arch-independent portion of the
kvm structure.
- Remove error messages during HDBSS enable/disable operations
- Change HDBSS buffer flushing from handle_exit to vcpu_put,
check_vcpu_requests, and kvm_handle_guest_abort.
- Add fault handling for HDBSS including buffer full, external abort,
and general protection fault (GPF).
- Add support for a 4KB HDBSS buffer size, mapped to the value 0b0000.
- Add a second argument to the ioctl to turn HDBSS on or off.

Tian Zheng (1):
  KVM: arm64: Document HDBSS ioctl

eillon (4):
  arm64/sysreg: Add HDBSS related register information
  KVM: arm64: Add support to set the DBM attr during memory abort
  KVM: arm64: Add support for FEAT_HDBSS
  KVM: arm64: Enable HDBSS support and handle HDBSSF events

 Documentation/virt/kvm/api.rst       |  16 +++++
 arch/arm64/include/asm/cpufeature.h  |   5 ++
 arch/arm64/include/asm/esr.h         |   7 ++
 arch/arm64/include/asm/kvm_host.h    |  17 +++++
 arch/arm64/include/asm/kvm_mmu.h     |   1 +
 arch/arm64/include/asm/kvm_pgtable.h |   4 ++
 arch/arm64/include/asm/sysreg.h      |  11 +++
 arch/arm64/kernel/cpufeature.c       |  12 ++++
 arch/arm64/kvm/arm.c                 | 102 +++++++++++++++++++++++++++
 arch/arm64/kvm/hyp/pgtable.c         |   6 ++
 arch/arm64/kvm/hyp/vhe/switch.c      |  19 +++++
 arch/arm64/kvm/mmu.c                 |  70 ++++++++++++++++++
 arch/arm64/kvm/reset.c               |   3 +
 arch/arm64/tools/cpucaps             |   1 +
 arch/arm64/tools/sysreg              |  29 ++++++++
 include/uapi/linux/kvm.h             |   1 +
 tools/include/uapi/linux/kvm.h       |   1 +
 17 files changed, 305 insertions(+)

--
2.33.0


