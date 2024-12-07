Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06348E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 09:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D9D3TUzyUt4lYAL7fWHIpBQkllQEe3Efsl5Za9vMQos=; b=Rgfikswtv8bcX1oVKXOABFeUCR
	L4CMNQ6+5SgS88roYaDjiCj6GfbSOsTqbXblQrPJJBv4QSAZkKckmWsXpudyuXfLEwJeIne6AGBcP
	oxqkHzDR51xHrEYd/OzEVAX8Bkzi6i7gm+jrzK3h9LvqVMRn7ihEFu7bg4h5Q1nHZlABVtPEakyqX
	pcF8P2IJg2jZL+E4pN5bU69SRbJ8sb6SHAEsd1fgfKvRiCTLHrkOEPJjirNjx8xmaq7QlP0ZVKHrJ
	gZ+QkkZLO70piSX3a80DB0qBgMdX6dTSwpD3RH0wfyZoIjCybpkH5Ed1qmvW3Md0BVdHbGHyWf/2R
	451ZEYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJqug-00000003lQP-47GZ;
	Sat, 07 Dec 2024 09:15:47 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJqod-00000003kZu-45Ia
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 09:09:35 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Y52Lq5mj3zhZVn;
	Sat,  7 Dec 2024 17:06:59 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 0CF671402C4;
	Sat,  7 Dec 2024 17:09:20 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 7 Dec
 2024 17:09:19 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <Dave.Martin@arm.com>, <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<jonathan.cameron@huawei.com>, <xiexiuqi@huawei.com>
Subject: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 0/5] arm_mpam: Introduce the Narrow-PARTID feature for MPAM driver
Date: Sat, 7 Dec 2024 17:21:31 +0800
Message-ID: <20241207092136.2488426-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_010932_239957_72AC11AB 
X-CRM114-Status: UNSURE (   9.26  )
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

The patch set is applied for mpam/snapshot/v6.12-rc1 branch of
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

    (req)PARTID = (rmid.req_idx * n) + closid,
    PMG = rmid.pmg.

Each intPARTID has m reqPARTIDs, which are used to expand the number of
monitoring groups under the control group. Therefore, the number of
monitoring groups is no longer limited by the range of MPAM PMG, which
enhances the extensibility of the system's monitoring capabilities.

---
Compared with v1:
  - Rebase this patch set on latest MPAM driver of the v6.12-rc1 branch.

Compared with v2:
  - Refactor closid/rmid pair translation
  - Simplify the logic of synchronize configuration
  - Remove reqPARTID pool
---

Dave Martin (1):
  arm_mpam: Set INTERNAL as needed when setting MSC controls

Zeng Heng (4):
  arm_mpam: Introduce the definitions of intPARTID and reqPARTID
  arm_mpam: Read monitor value with new closid/rmid pair
  arm_mpam: Automatically synchronize the configuration of all
    sub-monitoring groups
  arm_mpam: Adapting the closid/rmid matching determination functions

 arch/arm64/include/asm/mpam.h               |   6 +-
 drivers/platform/arm64/mpam/mpam_devices.c  |  61 +++++++--
 drivers/platform/arm64/mpam/mpam_internal.h |   5 +
 drivers/platform/arm64/mpam/mpam_resctrl.c  | 142 +++++++++++++++-----
 4 files changed, 170 insertions(+), 44 deletions(-)

--
2.25.1


