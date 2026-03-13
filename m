Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B34105F797
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=za6ghEJCrb+lYRv/i2BVEq0wST7kfXUfGRgAgHvjBPo=; b=sgXdbqtZt4Fvr8FGvz1TGqjYaT
	M+qEH9Se+lRPAaIwYWlXFkF6ntAGITiTrSTKKvT+T3MhgdbAuvQN2EwF/9M3oUBS+PKhbfy1/b6+V
	fgt6ChXSaipUt3FucAKcNI6thPPiJLF7kQOKFN3QG8Q3CCD6z6DGYtG9Egg9gEE5jpKQbz7r3uoqk
	kzbH2sOnSaGulDHyuyasTWTB9BEznxaZNC3vJnKuoNpVOn3N9jXcB8gAmg8q9TDEs48SLB0nkI2yR
	LmUB1WzRHqzmHw+T9tNlBDDUfutBVlRxog8gHSX+SBlHfwmQMv+ySG6DUW0TZNsVOq8ziqjoeUUKC
	7PGDcdZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zzz-0000000HWyq-1EXR;
	Fri, 13 Mar 2026 10:44:07 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zzv-0000000HWv1-3gf0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:44:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=za6ghEJCrb+lYRv/i2BVEq0wST7kfXUfGRgAgHvjBPo=;
	b=VVYaNNzBGJeWm6Nq4ii1z7XmAMVbw3/1TNxZsmYnmTUaFrgo/lDtAN+XVJw0+KtOu9f+UsGQj
	xuVoETgBVp1Sfy8IwYas845hbPq0iRt3Ng7hS0yi96jjAHilLZ34V73WM17dAgDAKJAvsJNjYDI
	pz72pWIL+ztYTGrFonR6enw=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fXLYS5pPRznTWB;
	Fri, 13 Mar 2026 18:38:20 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 60B804056E;
	Fri, 13 Mar 2026 18:43:55 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 13 Mar 2026 18:43:54 +0800
From: Qinxin Xia <xiaqinxin@huawei.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jpb@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<xiaqinxin@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
Subject: [RFC PATCH 0/5]  Add debugfs support for ARM SMMUv3
Date: Fri, 13 Mar 2026 18:43:46 +0800
Message-ID: <20260313104351.3502293-1-xiaqinxin@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_034404_400792_C8367FBC 
X-CRM114-Status: UNSURE (   9.40  )
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

This patch series introduces a debugfs interface for the ARM SMMUv3
driver, enabling developers and system administrators to inspect the
internal state of the SMMU for debugging and diagnostic purposes.

The debugfs entries are organized under:

  /sys/kernel/debug/iommu/arm_smmu_v3/

For each SMMU instance, a subdirectory named smmu3.<phys_addr> is
created (e.g. smmu3.0x0000000100100000). Inside, the following files are
available:

  capabilities  - Display SMMU feature capabilities and configuration
                  (stage support, coherency, ATS, PRI, queue depths)
  registers     - Show key control registers (CR0, CR1, CR2) and
                  command/event queue pointers (PROD/CONS)
  stream_table/ - Directory per PCI device or platform device, named
                  as <bus:dev:func>:<stream-id>; contains:
      ste       - Stream Table Entry (STE) details and raw data
      context_descriptors/
          all   - All valid Context Descriptors (CDs) for the device

The interface is designed with scalability in mind; additional
debugging features (e.g., queue dumping, event injection) can be added
later without breaking existing entries. Proper locking and error
handling ensure that the SMMU driver remains stable even when debugfs
accesses fail.
 
Qinxin Xia (5):
  iommu/arm-smmu-v3: Add basic debugfs framework
  iommu/arm-smmu-v3: Add register display to debugfs
  iommu/arm-smmu-v3: Add Stream Table Entry display to debugfs
  iommu/arm-smmu-v3: Add stream table directory structure to debugfs
  iommu/arm-smmu-v3: Add Context Descriptor display to debugfs

 drivers/iommu/Kconfig                         |  11 +
 drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
 .../arm/arm-smmu-v3/arm-smmu-v3-debugfs.c     | 516 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  13 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  18 +
 5 files changed, 559 insertions(+)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c

-- 
2.33.0


