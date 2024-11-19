Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9B2D4415F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aMgRaVYT4tw0E6Bt5B0+RPI6uUDSQj5jUWMNrKrb8e4=; b=WHK9uT4kbM7C8ODKhYubmr0Nmc
	fyKX/Q/MtVTxC6KKI2fY3sk94dGYu222FiJWKTVg2JycZcUBnjVk25Xna+Ki8yMU0XvMbgbMsn0fd
	jYRIZhgqXfKbNlqZIZCdPES3awCJKe5Ykup7RE+JYXA8Qabi7m9zq+1tv7i51PeE0eAgZiYzPmmJu
	fnvIHYCZlOoeuEolcXr9qE0LEX7MzgZQKN5NP3WlGdyBhgDNNmvjCA8Np06tDqie+Pdnfci09oYzR
	gfguCWslYfWEw0uu/BbsY2Y7+ojHEGvFkFcGE7C2ZzWYeM0lUfBY9jNGyGpHXxicK0cxwoJnoECMv
	5YSgKiSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOUv-0000000CYUU-1Kax;
	Tue, 19 Nov 2024 13:42:29 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOQz-0000000CXRY-1HpY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 13:38:28 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Xt59q3yKWz1T57n;
	Tue, 19 Nov 2024 21:36:15 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id F3C501400CB;
	Tue, 19 Nov 2024 21:38:13 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 19 Nov
 2024 21:38:13 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <james.morse@arm.com>, <Dave.Martin@arm.com>
CC: <linux-kernel@vger.kernel.org>, <jonathan.cameron@huawei.com>,
	<xiexiuqi@huawei.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v2 0/6] arm_mpam: Introduce the Narrow-PARTID feature for MPAM driver
Date: Tue, 19 Nov 2024 21:50:58 +0800
Message-ID: <20241119135104.595630-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_053825_727342_141644A5 
X-CRM114-Status: GOOD (  14.81  )
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

The patch set is applied for mpam/snapshot/v6.12-rc1 branch of
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
repository.

This patch set is fully compatible with x86 RDT functionality.

The narrow-partid feature in MPAM allows for a more efficient use of
PARTIDs by enabling a many-to-one mapping of reqpartids (requested PARTIDs)
to intpartids (internal PARTIDs). This mapping reduces the number of unique
PARTIDs needed, thus allowing more tasks or processes to be monitored and
managed with the available resources.

Intpartid(Internal PARTID) is an internal identifier used by the hardware
to represent a specific resource partition. It is a low-level identifier
that the hardware uses to track and manage resource allocation and
monitoring.

Reqpartid(Request PARTID) is an identifier provided by the software when
requesting resources from the memory system. It indicates the desired
partition for resource monitoring. By using reqpartids, software can
monitor specific resources or allow the system to subdivide smaller
granularity partitions within existing partitions to serve as monitoring
partitions.

For the new rmid allocation strategy, it will check whether there is an
available rmid of any reqPARTID which belongs to the input intPARTID.

The MPAM driver statically assigns all reqPARTIDs to respective intPARTIDs,
with a specific illustration as follows:

m - Indicates the number of reqPARTIDs per intPARTID
n - Indicates the total number of intPARTIDs
(m * n) - Represents the total number of reqPARTIDs

intPARTID_1 = 0
    ├── reqPARTID_1_1 = 0
    ├── reqPARTID_1_2 = 0 + n
    ├── ...
    └── reqPARTID_1_m = 0 + n * (m - 1)

intPARTID_2 = 1
    ├── reqPARTID_2_1 = 1
    ├── reqPARTID_2_2 = 1 + n
    ├── ...
    └── reqPARTID_2_m = 1 + n * (m - 1)

...

intPARTID_n = (n - 1)

Each intPARTID has m reqPARTIDs, which are used to expand the number of
monitoring groups under the control group. Therefore, the number of
monitoring groups is no longer limited by the range of MPAM PMG, which
enhances the extensibility of the system's monitoring capabilities.

---
compared with v1:
  - Rebase this patch set on latest MPAM driver of the v6.12-rc1 branch.
---

Dave Martin (1):
  arm_mpam: Set INTERNAL as needed when setting MSC controls

Zeng Heng (5):
  arm_mpam: Introduce the definitions of intPARTID and reqPARTID
  arm_mpam: Create reqPARTIDs resource bitmap
  arm_mpam: Enhance the rmid allocation strategy
  arm_mpam: Call resctrl_sync_config() when allocate new reqPARTID
  fs/resctrl: Add the helper to check if the task exists in the target
    group

 arch/x86/kernel/cpu/resctrl/core.c          |  20 +++
 drivers/platform/arm64/mpam/mpam_devices.c  |  80 +++++++++--
 drivers/platform/arm64/mpam/mpam_internal.h |   6 +
 drivers/platform/arm64/mpam/mpam_resctrl.c  | 145 +++++++++++++++++++-
 fs/resctrl/internal.h                       |   4 -
 fs/resctrl/monitor.c                        |  16 ++-
 fs/resctrl/pseudo_lock.c                    |   7 +-
 fs/resctrl/rdtgroup.c                       |  84 ++++++++----
 include/linux/resctrl.h                     |  30 ++++
 9 files changed, 342 insertions(+), 50 deletions(-)

--
2.25.1


