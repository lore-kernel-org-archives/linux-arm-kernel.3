Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8992C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 04:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LoiV5W5f8BCM/x9HzwLXWH+Or83Y9YLM+keuGxJmE0w=; b=itEn5fswcAwFuRox/mmDqhLvTH
	eTeGk0IXXnHjCu6UuSVs8NoFGcunT3+DKdKlm7CRT22uV6YapGL3F1x+wDjlPknlqSWmBWAimx4YX
	7t+janHW/HdNxh6urF+Zx/IkONcKYkqCW6H77du0PBK2PkPG15dCCJCjWuAMo4jXDW8ftNDwMIXHK
	0+RUpul0Ho4D0ePJbaq21Aei2xfWMUEcwgKGt3fdiAVnRxproP5t1QTas2w+naxYdFc+W3yDtfWKi
	Xp8gIiHHp5suC61XABjxycxkCDSz7/EojEbOMkRaQAZheHXtUJpinJ3OW6GEIywF1NIkWFBtwpxWK
	YiFz8INw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trqv8-00000004ZD7-2f1k;
	Tue, 11 Mar 2025 04:08:46 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trqqE-00000004YV4-1hKL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 04:03:45 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZBg4q6F8rzvWq2;
	Tue, 11 Mar 2025 11:59:39 +0800 (CST)
Received: from kwepemj500003.china.huawei.com (unknown [7.202.194.33])
	by mail.maildlp.com (Postfix) with ESMTPS id DF0EF140360;
	Tue, 11 Mar 2025 12:03:29 +0800 (CST)
Received: from DESKTOP-KKJBAGG.huawei.com (10.174.178.32) by
 kwepemj500003.china.huawei.com (7.202.194.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Mar 2025 12:03:28 +0800
From: Zhenyu Ye <yezhenyu2@huawei.com>
To: <maz@kernel.org>, <yuzenghui@huawei.com>, <will@kernel.org>,
	<oliver.upton@linux.dev>, <catalin.marinas@arm.com>, <joey.gouly@arm.com>
CC: <linux-kernel@vger.kernel.org>, <yezhenyu2@huawei.com>,
	<xiexiangyou@huawei.com>, <zhengchuan@huawei.com>, <wangzhou1@hisilicon.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvm@vger.kernel.org>,
	<kvmarm@lists.linux.dev>
Subject: [PATCH v1 0/5] Support the FEAT_HDBSS introduced in Armv9.5
Date: Tue, 11 Mar 2025 12:03:16 +0800
Message-ID: <20250311040321.1460-1-yezhenyu2@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.178.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemj500003.china.huawei.com (7.202.194.33)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_210342_615428_5FC117A4 
X-CRM114-Status: GOOD (  13.43  )
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

From: eillon <yezhenyu2@huawei.com>

This series of patches add support to the Hardware Dirty state tracking
Structure(HDBSS) feature, which is introduced by the ARM architecture
in the DDI0601(ID121123) version.

The HDBSS feature is an extension to the architecture that enhances
tracking translation table descriptors' dirty state, identified as
FEAT_HDBSS.  The goal of this feature is to reduce the cost of surveying
for dirtied granules, with minimal effect on recording when a granule
has been dirtied.

The purpose of this feature is to make the execution overhead of live
migration lower to both the guest and the host, compared to existing
approaches (write-protect or search stage 2 tables).

After these patches, users(such as qemu) can use the 
KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl to enable or disable the HDBSS
feature before and after the live migration.

See patches for details, Thanks.

eillon (5):
  arm64/sysreg: add HDBSS related register information
  arm64/kvm: support set the DBM attr during memory abort
  arm64/kvm: using ioctl to enable/disable the HDBSS feature
  arm64/kvm: support to handle the HDBSSF event
  arm64/config: add config to control whether enable HDBSS feature

 arch/arm64/Kconfig                    | 19 +++++++
 arch/arm64/Makefile                   |  4 +-
 arch/arm64/include/asm/cpufeature.h   | 15 +++++
 arch/arm64/include/asm/esr.h          |  2 +
 arch/arm64/include/asm/kvm_arm.h      |  1 +
 arch/arm64/include/asm/kvm_host.h     |  6 ++
 arch/arm64/include/asm/kvm_mmu.h      | 12 ++++
 arch/arm64/include/asm/kvm_pgtable.h  |  3 +
 arch/arm64/include/asm/sysreg.h       | 16 ++++++
 arch/arm64/kvm/arm.c                  | 80 +++++++++++++++++++++++++++
 arch/arm64/kvm/handle_exit.c          | 47 ++++++++++++++++
 arch/arm64/kvm/hyp/pgtable.c          |  6 ++
 arch/arm64/kvm/hyp/vhe/switch.c       |  1 +
 arch/arm64/kvm/mmu.c                  | 10 ++++
 arch/arm64/kvm/reset.c                |  7 +++
 arch/arm64/tools/sysreg               | 28 ++++++++++
 include/linux/kvm_host.h              |  1 +
 include/uapi/linux/kvm.h              |  1 +
 tools/arch/arm64/include/asm/sysreg.h |  4 ++
 tools/include/uapi/linux/kvm.h        |  1 +
 20 files changed, 263 insertions(+), 1 deletion(-)

-- 
2.39.3


