Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E6AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 12:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z29LXW8H6j5+YRRi20VzwXPPtbzAx8PDXEJJyuBSweA=; b=HbDbV1PHRVrhKmyIdAUhOp1ikY
	IOiGmO7XOSe9cYSgnxc7zFwLTq1D91q2M3MeljzpQwktL3+PG7YeNVZ1oDAxRpHnIu47bIAVqhhkF
	XWacZXZpqbMXq/dz5XSs9fKtARci5SUkMUlorh4HWwGj122aGwzQLmflXE5cWu4/wiKcn1G+RJK9d
	pOAORljA4Rm9ChPz19aY9ZhgRjr9NjiqCz7obKRgucGHIm2kfXgEp5qoOZ6dX5uw70LyCnBw6FB2Z
	2KwwHgxC8+FhktxyYS1MuE4Om7c3lRtmESA/SJz0GEvPupid3dAqx78dQwFP29TrqhOfvwHnx/Bzr
	mu/GT51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWWm-0000000E8wu-27wd;
	Fri, 07 Mar 2025 12:10:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWP7-0000000E7to-3ysU;
	Fri, 07 Mar 2025 12:02:15 +0000
X-UUID: fca379b2fb4b11ef83f2a1c9db70dae0-20250307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=z29LXW8H6j5+YRRi20VzwXPPtbzAx8PDXEJJyuBSweA=;
	b=iy8T8atnxWBpiv4K8S5gBAoe6cHhhxTIYMQ0ui2oZyoX3fRif1h37NXcMYc2piKPF3vxAnqvXTULZ+OoaYayrP/Bsm0d8YE4c/WgaRB/aBqmBOaGHMdREBv3hofNtqS9aBiCEbuNeQEDbVjE+J3kg799+swipg86lduTxnsP3hM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f3829ec8-3043-426c-8809-cf118eeade08,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:50cad149-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fca379b2fb4b11ef83f2a1c9db70dae0-20250307
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <qun-wei.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 218018552; Fri, 07 Mar 2025 05:02:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 20:02:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 20:02:01 +0800
From: Qun-Wei Lin <qun-wei.lin@mediatek.com>
To: Jens Axboe <axboe@kernel.dk>, Minchan Kim <minchan@kernel.org>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Vishal Verma
	<vishal.l.verma@intel.com>, Dan Williams <dan.j.williams@intel.com>, Dave
 Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chris
 Li <chrisl@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, "Huang, Ying"
	<ying.huang@intel.com>, Kairui Song <kasong@tencent.com>, Dan Schatzberg
	<schatzberg.dan@gmail.com>, Barry Song <baohua@kernel.org>, Al Viro
	<viro@zeniv.linux.org.uk>
CC: <linux-kernel@vger.kernel.org>, <linux-block@vger.kernel.org>,
	<nvdimm@lists.linux.dev>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Casper Li <casper.li@mediatek.com>, Chinwen Chang
	<chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, James
 Hsu <james.hsu@mediatek.com>, Qun-Wei Lin <qun-wei.lin@mediatek.com>
Subject: [PATCH 0/2] Improve Zram by separating compression context from kswapd
Date: Fri, 7 Mar 2025 20:01:02 +0800
Message-ID: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_040213_989853_F0364D87 
X-CRM114-Status: GOOD (  15.70  )
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

This patch series introduces a new mechanism called kcompressd to
improve the efficiency of memory reclaiming in the operating system. The
main goal is to separate the tasks of page scanning and page compression
into distinct processes or threads, thereby reducing the load on the
kswapd thread and enhancing overall system performance under high memory
pressure conditions.

Problem:
 In the current system, the kswapd thread is responsible for both
 scanning the LRU pages and compressing pages into the ZRAM. This
 combined responsibility can lead to significant performance bottlenecks,
 especially under high memory pressure. The kswapd thread becomes a
 single point of contention, causing delays in memory reclaiming and
 overall system performance degradation.

Target:
 The target of this invention is to improve the efficiency of memory
 reclaiming. By separating the tasks of page scanning and page
 compression into distinct processes or threads, the system can handle
 memory pressure more effectively.

Patch 1:
- Introduces 2 new feature flags, BLK_FEAT_READ_SYNCHRONOUS and
  SWP_READ_SYNCHRONOUS_IO.

Patch 2:
- Implemented the core functionality of Kcompressd and made necessary
  modifications to the zram driver to support it.

In our handheld devices, we found that applying this mechanism under high
memory pressure scenarios can increase the rate of pgsteal_anon per second
by over 260% compared to the situation with only kswapd.

Qun-Wei Lin (2):
  mm: Split BLK_FEAT_SYNCHRONOUS and SWP_SYNCHRONOUS_IO into separate
    read and write flags
  kcompressd: Add Kcompressd for accelerated zram compression

 drivers/block/brd.c             |   3 +-
 drivers/block/zram/Kconfig      |  11 ++
 drivers/block/zram/Makefile     |   3 +-
 drivers/block/zram/kcompressd.c | 340 ++++++++++++++++++++++++++++++++
 drivers/block/zram/kcompressd.h |  25 +++
 drivers/block/zram/zram_drv.c   |  21 +-
 drivers/nvdimm/btt.c            |   3 +-
 drivers/nvdimm/pmem.c           |   5 +-
 include/linux/blkdev.h          |  24 ++-
 include/linux/swap.h            |  31 +--
 mm/memory.c                     |   4 +-
 mm/page_io.c                    |   6 +-
 mm/swapfile.c                   |   7 +-
 13 files changed, 446 insertions(+), 37 deletions(-)
 create mode 100644 drivers/block/zram/kcompressd.c
 create mode 100644 drivers/block/zram/kcompressd.h

-- 
2.45.2


