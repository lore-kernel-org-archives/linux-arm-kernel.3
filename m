Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5789CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 08:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jTDLB1azfarwF5n/5KTJzb1SYDTKLL2v2/t9vmMWvFU=; b=UmpKQAh+h05HCw83f7Z20ZKA0w
	n7iNgRBzbGCZyyoP73bIDuaLskfMKUvgoGjyO8nHlSMiv3JK97XlOpu6583JPdqIjgejasOo7JwIb
	UkBBFCgluPedZcvqxOv5xhXs6Dgxb2QjzUAqAoAFsLZUNKdjoAvV2pIB7vnkQaAVjOBp/XaCJ/KlH
	acw93310oQ73SDC/PGWqiZrU3C9RB3P2fHNTfTtAUAIOGbQOBn7cRihPPN1bpVrVNvYnIxbpN7tIO
	qsqILquJl5DWDqQ6ZCCe+t0lZtnixx1KjISaXmEMyZzmMkeotL9AzR5e70qVg1BODtvQSDOm0s6v0
	H+Aq640g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7y0-00000000pwk-22EV;
	Thu, 18 Jun 2026 08:19:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7xy-00000000pvs-3oAH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Jun 2026 08:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=jTDLB1azfarwF5n/5KTJzb1SYDTKLL2v2/t9vmMWvFU=; b=WQ4Mr+xYv42znSMHnMct1hgnbj
	QBOhw9Po7SsyyhW4bi045rT/REQ/WW/tbCoFc5LAfK+FevHhSXJqhM5Z2KCtylOQDTaqGTrxxwDvT
	3uqqF2zdiTaJBCTqSc+VGLdgz9LJmwJbUqW+61GrKqM2uTfB78n5mZkA5WkN5MNBoW+mFhYrbTTiU
	RgBEoQDSwCWWXuPJmB5u/22fekibSRKA0cZutSguuKluXXh2XfRTyJw8rYSWsrpZn4NrHZaBP6Dd1
	E6zX/Bwk45/h85uv989pkEkCTuYjpa2DJ0eVBgsZIuY/EfGFM8QJiTKcULlvXaXQSGNwcK2SG18P6
	hfZKj2og==;
Received: from mx21.baidu.com ([220.181.3.85] helo=outbound.baidu.com)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7xS-0000000E7b4-1R2y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 08:19:07 +0000
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Thierry Reding <thierry.reding@kernel.org>, Krishna Reddy
	<vdumpa@nvidia.com>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>, Nate Watterson
	<nwatterson@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH] iommu/arm-smmu-v3: Fix VCMDQ indexing in tegra241_vintf0_handle_error
Date: Thu, 18 Jun 2026 15:59:45 +0800
Message-ID: <20260618075945.2217-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: bjkjy-exc5.internal.baidu.com (172.31.50.49) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1781769595;
	bh=jTDLB1azfarwF5n/5KTJzb1SYDTKLL2v2/t9vmMWvFU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=MDNDMRreDvxOTeIPpXBFfo8K9BpR69P+Sum2hHLZFAiFWIJ4cDubAu4l9YQczlECA
	 365yLLDM+91Wusj528f6z0CGu9KdVNpi2Lbb1sijjh9lXwkuNBoqUKxCcJ4zlUllpP
	 CfYRIU9Lb+tk0BKe2V4/Ms+PCOoV3tsYIY+kPgxfZKYFZe7L3b+DDEq3sx1eCt3OGj
	 bsdJ5/AxjB1Hjn7bP1I5LEMYhXhnm18kmj6XO6595R5xtlK/wgEP8UtINYbRBtBF6d
	 aJDv+4Jux7oUAQbtaEObmNkX8zqc+TznnQIgONeo75VQshaoab3rRzsNVNGJsnXTSE
	 hQ2baI8RBpkCQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_091850_562819_0388921B 
X-CRM114-Status: GOOD (  10.95  )
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

From: Li RongQing <lirongqing@baidu.com>

In tegra241_vintf0_handle_error(), the driver loops through the
LVCMDQ_ERR_MAP_64(i) registers to detect and handle error flags for
each virtual command queue (VCMDQ).

However, the code erroneously uses the register-local bit offset
returned by __ffs64(map) directly as the global logical queue index
(lidx) into the vintf->lvcmdqs[] array. When 'i' is greater than 0
(i.e., handling queues 64 and above), this logic incorrectly targets
the queues in the first block (0-63) instead of the intended queues
(i * 64 + bit). This leads to handling errors on the wrong VCMDQ
structures and clearing the wrong hardware error status.

Fix this by properly decoupling the register-local bit offset from the
global array index. Use the local bit offset to clear the local map
snapshot, and use 'i * 64 + bit' to correctly index the global
vintf->lvcmdqs[] array.

Fixes: 918eb5c856f6 ("iommu/arm-smmu-v3: Add in-kernel support for NVIDIA Tegra241 (Grace) CMDQV")
Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 67be62a..33ec466 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -317,13 +317,14 @@ static void tegra241_vintf0_handle_error(struct tegra241_vintf *vintf)
 		u64 map = readq_relaxed(REG_VINTF(vintf, LVCMDQ_ERR_MAP_64(i)));
 
 		while (map) {
-			unsigned long lidx = __ffs64(map);
+			unsigned long bit = __ffs64(map);
+			unsigned long lidx = i * 64 + bit;
 			struct tegra241_vcmdq *vcmdq = vintf->lvcmdqs[lidx];
 			u32 gerror = readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERROR));
 
 			__arm_smmu_cmdq_skip_err(&vintf->cmdqv->smmu, &vcmdq->cmdq);
 			writel(gerror, REG_VCMDQ_PAGE0(vcmdq, GERRORN));
-			map &= ~BIT_ULL(lidx);
+			map &= ~BIT_ULL(bit);
 		}
 	}
 }
-- 
2.9.4


