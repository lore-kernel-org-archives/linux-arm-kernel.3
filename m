Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32497C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pI1J7N1+0Y/mfVZi0xbTbpY3umgoBQDbW0W9B4r5geE=; b=DOL8UI/EZBzfnuI1OAEVjttpQE
	1cbzn8N+gg+jEX+joXlpatcJMsR6oN5iHa9n5W1wAXiDbkRbG74O3RbX3j1YsaPoxxXcSuvR0CXpD
	W0iSzoEEBW6hSte8BleZFtTfqrG0AcXqyNpSq7l/cxWUgO+TFf8yncaR3be6E6ZQsHGG24Fk7n+UZ
	eeoSGRnmACfzRuvQ4jrDNWeByG9XuUvmSq9KG7RiB6aa0qK3ilf7+nQo3eELb/uLQ+Ej6A9WLu/oA
	u7kPY4n7v0GhZ4qYkTeYI1KutEg/BEnilBXNnUZ5/yx9qi3v0Nwm5DY3WCFGIyDA1LlmjQE9tCoPv
	Gwv9uZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLTQ-0000000ExCY-41FW;
	Fri, 24 Jan 2025 15:19:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLS5-0000000Ewor-0Ea1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:18:35 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YfhGt4cp3z688Br;
	Fri, 24 Jan 2025 23:16:22 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id F3C88140119;
	Fri, 24 Jan 2025 23:18:21 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 Jan 2025 16:18:13 +0100
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <kvmarm@lists.linux.dev>, <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<cohuck@redhat.com>, <eric.auger@redhat.com>, <sebott@redhat.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
	<jonathan.cameron@huawei.com>, <anthony.jebson@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>
Subject: [PATCH v5 0/4] KVM: arm64: Errata management for VM Live migration
Date: Fri, 24 Jan 2025 15:17:28 +0000
Message-ID: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_071833_380745_4737B2A5 
X-CRM114-Status: GOOD (  11.27  )
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

Hi,

v4 --> v5
https://lore.kernel.org/kvmarm/20241218105345.73472-1-shameerali.kolothum.thodi@huawei.com/

-Addressed comments from Marc,
 -Added an hypercall to retrieve version and number of supported target
  impl CPUs.
 -Added a check for KVM hypercall services availability.
-Removed R-by tags from Connie & Sebastian as patches 2 & 4 changed a bit.
 Please take another look.

This can be sanity tested by the Qemu branch here,
https://github.com/hisilicon/qemu/tree/v9.0-nv-rfcv4-vcpu-model-v2-target-cpu-errata
(branch based on Eric's/Connie's NV + custom CPU series)
Eg: to specify target impl CPUs,
-machine virt,.., x-target-impl-cpus=0xMIDR1:0xREVIDR1-0xMIDR2:REVIDR2

Please take a look and let me know your feedback.

Thanks,
Shameer

v3 --> v4(Minor updates)
https://lore.kernel.org/kvmarm/20241209115311.40496-1-shameerali.kolothum.thodi@huawei.com/

 -Changed MIDR/REVIDR to 64 bits based on feedback from Connie
  and Marc(Patch #3).
 -Added R-by tags from Sebastian (Thanks!).

RFC v2 --> v3
https://lore.kernel.org/kvmarm/20241024094012.29452-1-shameerali.kolothum.thodi@huawei.com/

 -Addressed comments from Oliver(Thanks!).
 -Using implementation CPUs MIDR/REVIDR when it is set for
  _midr_range() functions(Patch 1 & 3)
 -New hypercall for retrieving implementation CPUs(Patch #2).
 -Dropped RFC.

RFC v1 --> RFCv2:
https://lore.kernel.org/kvmarm/20241011075053.80540-1-shameerali.kolothum.thodi@huawei.com/
 -Introduced hypercalls to retrieve target CPUs info from user space VMM.
  see patch #1 for details.
 -Patch #2 uses the hypercall to retrieve the target CPU info if any.
 -Use the target CPUs MIDR/REVIDR in errata enablement. See patch #3.

Background from v1:

On ARM64 platforms most of the errata workarounds are based on CPU
MIDR/REVIDR values and a number of these workarounds need to be
implemented by the Guest kernel as well. This creates a problem when
Guest needs to be migrated to a platform that differs in these
MIDR/REVIDR values even if the VMM can come up with a common minimum
feature list for the Guest using the recently introduced "Writable
ID registers" support.

(This is roughly based on a discussion I had with Marc and Oliver
at KVM forum. Marc outlined his idea for a solution and this is an
attempt to implement it. Thanks to both and I take all the blame
if this is nowhere near what is intended/required)

Shameer Kolothum (4):
  arm64: Modify _midr_range() functions to read MIDR/REVIDR internally
  KVM: arm64: Introduce hypercall support for retrieving target
    implementations
  KVM: arm64: Report all the KVM/arm64-specific hypercalls
  arm64: paravirt: Enable errata based on implementation CPUs

 Documentation/virt/kvm/arm/hypercalls.rst | 59 +++++++++++++++++++++++
 arch/arm64/include/asm/cputype.h          | 50 +++++++++++++------
 arch/arm64/include/asm/mmu.h              |  3 +-
 arch/arm64/include/asm/paravirt.h         |  3 ++
 arch/arm64/kernel/cpu_errata.c            | 37 ++++++++++----
 arch/arm64/kernel/cpufeature.c            |  8 +--
 arch/arm64/kernel/image-vars.h            |  2 +
 arch/arm64/kernel/paravirt.c              | 58 ++++++++++++++++++++++
 arch/arm64/kernel/proton-pack.c           | 17 +++----
 arch/arm64/kvm/hypercalls.c               |  6 ++-
 arch/arm64/kvm/vgic/vgic-v3.c             |  2 +-
 drivers/clocksource/arm_arch_timer.c      |  2 +-
 include/linux/arm-smccc.h                 | 17 +++++++
 13 files changed, 222 insertions(+), 42 deletions(-)

-- 
2.47.0


