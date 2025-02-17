Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171C7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 03:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cBaakO5aECxCfpozEeyD08tv2wxTJj0NOmen0Rs1b68=; b=E3nlBJS5AJJIiXWpAdTn7Q2YKV
	qUMDfLUgcMTIdzQr/dfSuSHEGc70Ypv+f2zeWZtLry+GC+OW6tGa9Ca8AdJ+RZuirNW25IITpW/6W
	+AdxN2G+HeRW8i1Y5k1MYOB/ymCAj2+9kFv58fNDBZ1LCfvc3YgyhfMXtMQzUSjN+zFOAC/o+Sp39
	mr+UUNCClpe0KrzBjdLIIHvc50hQ8Su1b1Q36yPGVjY8yEH7kA6cQkK641dNmnDrkPks5s3gHZDGn
	zSLQvQWskxMi4wmi96U32Wb3bMNsKz9P8yJqZ04E3zlj8oUOYXVubNikqwb1swGVxggfNlRxpW2KJ
	L+dY1vcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjrYL-000000036no-2KsL;
	Mon, 17 Feb 2025 03:12:13 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjrVR-000000036MO-0MPe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 03:09:15 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Yx6xB3STfz22sww;
	Mon, 17 Feb 2025 11:06:06 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 5A7A21A0188;
	Mon, 17 Feb 2025 11:09:04 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 17 Feb
 2025 11:09:03 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <Dave.Martin@arm.com>, <james.morse@arm.com>
CC: <bobo.shaobowang@huawei.com>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH mpam mpam/snapshot/v6.14-rc1 0/5] arm_mpam: Introduce the Narrow-PARTID feature for MPAM driver
Date: Mon, 17 Feb 2025 11:18:47 +0800
Message-ID: <20250217031852.2014939-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_190913_281880_9F39C0C3 
X-CRM114-Status: GOOD (  10.76  )
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

The patch set is applied for mpam/snapshot/v6.14-rc1 branch of
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
repository.

The narrow-partid feature in MPAM allows for a more efficient use of
PARTIDs by enabling a many-to-one mapping of reqpartids (requested PARTIDs)
to intpartids (internal PARTIDs). This mapping reduces the number of unique
PARTIDs needed, thus allowing more tasks or processes to be monitored and
managed with the available resources.

For a mixture of MSCs system, for MSCs that do not support narrow-partid,
we use the PARTIDs exceeding the number of closids as reqPARTIDs for
expanding the monitoring groups.

In order to keep the existing resctrl API interface, the rmid contains both
req_idx and PMG information instead of PMG only under the MPAM driver. The
req_idx represents the req_idx-th sub-monitoring group under the control
group. The new rmid would be like:

    rmid = (req_idx << shift | pmg).

The new conversion relationship between closid/rmid and (req)PARTID/PMG is:

    (req)PARTID = (rmid.req_idx * n) + closid
    PMG = rmid.pmg

Each intPARTID has m reqPARTIDs, which are used to expand the number of
monitoring groups under one control group. Therefore, the number of
monitoring groups is no longer limited by the range of MPAM PMG, which
enhances the extensibility of the system's monitoring capabilities.

---
Compared with RFC-v4:
  - Rebase the patch set on the v6.14-rc1 branch.

Compared with RFC-v3:
  - Add limitation of the Narrow-PARTID feature (See Patch 2).
  - Remove redundant reqpartid2closid() and reqpartid_pmg2rmid().
  - Refactor closid_rmid2reqpartid() partially.
  - Merge the PARTID conversion-related patches into a single patch for
    bisectability.
  - Skip adaptation of resctrl_arch_set_rmid() which is going to be
    removed.

Compared with RFC-v2:
  - Refactor closid/rmid pair translation
  - Simplify the logic of synchronize configuration
  - Remove reqPARTID source bitmap

Compared with RFC-v1:
  - Rebase this patch set on latest MPAM driver of the v6.12-rc1 branch.
---

Dave Martin (1):
  arm_mpam: Set INTERNAL as needed when setting MSC controls

Zeng Heng (4):
  arm_mpam: Introduce the definitions of intPARTID and reqPARTID
  arm_mpam: Add limitation for the Narrow-PARTID feature
  arm_mpam: Provide conversion method for new closid/rmid pairs
  arm_mpam: Automatically synchronize the configuration of all
    sub-monitoring groups

 drivers/platform/arm64/mpam/mpam_devices.c  |  61 ++++++--
 drivers/platform/arm64/mpam/mpam_internal.h |   5 +
 drivers/platform/arm64/mpam/mpam_resctrl.c  | 157 ++++++++++++++------
 3 files changed, 172 insertions(+), 51 deletions(-)

--
2.25.1


