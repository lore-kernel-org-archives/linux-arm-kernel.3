Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC963C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 09:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RLfBc0WOFadngRqCzOfSP857klROacANH1eVoltCHBA=; b=aCePwWBwxeXAZOilLsLr+gqy5X
	pUhyZO02IyxYIVIcr8GTOP62fsmACfJTclCRoYQqYRoljysRIQ9rgUtrsxgfo8ODxx9vXWiQ897Tk
	/wVVWlb2xhkrMdgPDv3E7w3OQWpQn4rBRIiwt47zE5aVxYjgfx4nW/McaHh4+WrOzpwds62P16Faz
	bzV2yPHkGwI860LrzeKt4z+ayBZMRrSQScMonX7mFDP5Cj+iKfkG+huLas1FGhfWnnaqAHWm0hLQU
	ihZa0FbY7Vo35/2fCxK8SqzAEwtprdHMIQCyAsOnQ2dddpuMOJiA4MXtA3blTQtAqPQzd9i2kZ08d
	TNxc+u8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti996-00000006nci-01wL;
	Wed, 12 Feb 2025 09:35:04 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti97R-00000006n80-3PT6;
	Wed, 12 Feb 2025 09:33:24 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4YtCgq66YKz1V6dV;
	Wed, 12 Feb 2025 17:29:27 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id 428F7180069;
	Wed, 12 Feb 2025 17:33:14 +0800 (CST)
Received: from localhost.localdomain (10.90.30.45) by
 dggpemf200006.china.huawei.com (7.185.36.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Feb 2025 17:33:13 +0800
From: Yunsheng Lin <linyunsheng@huawei.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>
CC: <zhangkun09@huawei.com>, <liuyonglong@huawei.com>,
	<fanghaiqing@huawei.com>, Yunsheng Lin <linyunsheng@huawei.com>, Alexander
 Lobakin <aleksander.lobakin@intel.com>, Robin Murphy <robin.murphy@arm.com>,
	Alexander Duyck <alexander.duyck@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, IOMMU <iommu@lists.linux.dev>, MM
	<linux-mm@kvack.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <netdev@vger.kernel.org>,
	<intel-wired-lan@lists.osuosl.org>, <bpf@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH net-next v9 0/4] fix the DMA API misuse problem for page_pool
Date: Wed, 12 Feb 2025 17:25:47 +0800
Message-ID: <20250212092552.1779679-1-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.30.45]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemf200006.china.huawei.com (7.185.36.61)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_013322_245905_FFF51E1C 
X-CRM114-Status: GOOD (  14.16  )
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

This patchset fix the dma API misuse problem as mentioned in [1].

From the below performance data, the overhead is not so obvious
due to performance variations in arm64 server and less than 1 ns in
x86 server for time_bench_page_pool01_fast_path() and
time_bench_page_pool02_ptr_ring, and there is about 10~20ns overhead
for time_bench_page_pool03_slow(), see more detail in [2].

arm64 server:
Before this patchset:
              fast_path              ptr_ring            slow
1.         31.171 ns               60.980 ns          164.917 ns
2.         28.824 ns               60.891 ns          170.241 ns
3.         14.236 ns               60.583 ns          164.355 ns

With patchset:
6.         26.163 ns               53.781 ns          189.450 ns
7.         26.189 ns               53.798 ns          189.466 ns

X86 server:
| Test name  |Cycles |   1-5 |    | Nanosec |    1-5 |        |      % |
| (tasklet_*)|Before | After |diff|  Before |  After |   diff | change |
|------------+-------+-------+----+---------+--------+--------+--------|
| fast_path  |    19 |    19 |   0|   5.399 |  5.492 |  0.093 |    1.7 |
| ptr_ring   |    54 |    57 |   3|  15.090 | 15.849 |  0.759 |    5.0 |
| slow       |   238 |   284 |  46|  66.134 | 78.909 | 12.775 |   19.3 |

And about 16 bytes of memory is also needed for each page_pool owned
page to fix the dma API misuse problem 

1. https://lore.kernel.org/lkml/8067f204-1380-4d37-8ffd-007fc6f26738@kernel.org/T/
2. https://lore.kernel.org/all/f558df7a-d983-4fc5-8358-faf251994d23@kernel.org/

CC: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: Robin Murphy <robin.murphy@arm.com>
CC: Alexander Duyck <alexander.duyck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: IOMMU <iommu@lists.linux.dev>
CC: MM <linux-mm@kvack.org>

Change log:
V9.
  1. Drop the fix of a possible time window problem for NPAI recycling.
  2. Add design description for the fix in patch 2.

V8:
  1. Drop last 3 patch as it causes observable performance degradation
     for x86 system.
  2. Remove rcu read lock in page_pool_napi_local().
  3. Renaming item function more consistently.

V7:
  1. Fix a used-after-free bug reported by KASAN as mentioned by Jakub.
  2. Fix the 'netmem' variable not setting up correctly bug as mentioned
     by Simon.

V6:
  1. Repost based on latest net-next.
  2. Rename page_pool_to_pp() to page_pool_get_pp().

V5:
  1. Support unlimit inflight pages.
  2. Add some optimization to avoid the overhead of fixing bug.

V4:
  1. use scanning to do the unmapping
  2. spilt dma sync skipping into separate patch

V3:
  1. Target net-next tree instead of net tree.
  2. Narrow the rcu lock as the discussion in v2.
  3. Check the ummapping cnt against the inflight cnt.

V2:
  1. Add a item_full stat.
  2. Use container_of() for page_pool_to_pp().

Yunsheng Lin (4):
  page_pool: introduce page_pool_get_pp() API
  page_pool: fix IOMMU crash when driver has already unbound
  page_pool: support unlimited number of inflight pages
  page_pool: skip dma sync operation for inflight pages

 drivers/net/ethernet/freescale/fec_main.c     |   8 +-
 .../ethernet/google/gve/gve_buffer_mgmt_dqo.c |   2 +-
 drivers/net/ethernet/intel/iavf/iavf_txrx.c   |   6 +-
 drivers/net/ethernet/intel/idpf/idpf_txrx.c   |  14 +-
 drivers/net/ethernet/intel/libeth/rx.c        |   2 +-
 .../net/ethernet/mellanox/mlx5/core/en/xdp.c  |   3 +-
 drivers/net/netdevsim/netdev.c                |   6 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   2 +-
 include/linux/mm_types.h                      |   2 +-
 include/linux/skbuff.h                        |   1 +
 include/net/libeth/rx.h                       |   3 +-
 include/net/netmem.h                          |  31 +-
 include/net/page_pool/helpers.h               |  15 +
 include/net/page_pool/memory_provider.h       |   2 +-
 include/net/page_pool/types.h                 |  46 +-
 net/core/devmem.c                             |   6 +-
 net/core/netmem_priv.h                        |   5 +-
 net/core/page_pool.c                          | 423 ++++++++++++++++--
 net/core/page_pool_priv.h                     |  10 +-
 19 files changed, 504 insertions(+), 83 deletions(-)

-- 
2.33.0


