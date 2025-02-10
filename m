Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D596C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xqlYCFRr7znYUe3dXWqah+daPf6vzdIUhiZ4PmBjuEI=; b=Tng6OU01rcH1MP4b+AWTTYugR9
	f7clFAdCBOke8t/wKDg2028wYR8MtsDstPgNSLhFWwvHWlYDj5zliDm2c8pKKnH76ClReDE/ny2J0
	6aJeZME2c0StPKV3JPJaxOWscWJFlBZoC38u2i7mMV1plGqBC/wQEXR1chLTJNecjJ1LGbTSvy+My
	d0hlnLobW6yWGrvQm2YcWx4UraL98YlnLfpABrmRSBIB/u94jv8zeW1PY83TxZyHoZoDkin39tpoC
	h9RcotHbvou04bpPM+YmiyA57ixJLxgoEFG6U//KMdlep6ETBaP7+Q7xFBAiKUzCn+Mu+5XAGHVbm
	X2wFZb/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRAs-0000000H2w1-2Q95;
	Mon, 10 Feb 2025 10:37:58 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thR7Y-0000000H1xN-2uge
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 10:34:33 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AAXwEJ3393375
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 04:33:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739183638;
	bh=xqlYCFRr7znYUe3dXWqah+daPf6vzdIUhiZ4PmBjuEI=;
	h=From:To:CC:Subject:Date;
	b=HdLthlgv/gsJz9xzuJSVgeENYwLh0WiujXZpqKl0qigdKg0XNcY61UOIqxbOKC6MI
	 lQW0t+3KISxODdWGi0wDcYMY80PtNBEHr6sZzZjf4KroXtL9t44/LmeXVzpCexv/DB
	 YUxat/TJprDDVAvPsbNoNcluBezDqQ+E1a2ocfAU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51AAXwId027014
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 04:33:58 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 04:33:58 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 04:33:57 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AAXvtG108867;
	Mon, 10 Feb 2025 04:33:57 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 51AAXuKc021822;
	Mon, 10 Feb 2025 04:33:57 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <rogerq@kernel.org>, <danishanwar@ti.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <u.kleine-koenig@baylibre.com>, <krzysztof.kozlowski@linaro.org>,
        <dan.carpenter@linaro.org>, <m-malladi@ti.com>,
        <schnelle@linux.ibm.com>, <glaroque@baylibre.com>,
        <rdunlap@infradead.org>, <diogo.ivo@siemens.com>,
        <jan.kiszka@siemens.com>, <john.fastabend@gmail.com>,
        <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
        <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
Subject: [PATCH net-next v2 0/3] Add native mode XDP support
Date: Mon, 10 Feb 2025 16:03:49 +0530
Message-ID: <20250210103352.541052-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_023432_814536_31A16908 
X-CRM114-Status: GOOD (  10.87  )
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

This series adds native XDP support using page_pool.
XDP zero copy support is not included in this patch series.

Patch 1/3: Replaces skb with page pool for Rx buffer allocation
Patch 2/3: Adds prueth_swdata struct for SWDATA for all swdata cases
Patch 3/3: Introduces native mode XDP support

v1: https://lore.kernel.org/all/20250122124951.3072410-1-m-malladi@ti.com/

Changes since v1 (v2-v1):
- Add missing SoBs for all patches
1/3:
- Recycle pages wherever necessary using skb_mark_for_recycle()
- Use napi_build_skb() instead of build_skb()
- Update with correct frag_size argument in napi_build_skb()
- Use napi_gro_receive() instead of netif_receive_skb()
- Use PP_FLAG_DMA_SYNC_DEV to enable DMA sync with device
- Use page_pool_dma_sync_for_cpu() to sync Rx page pool for CPU
3/3:
- Fix XDP typo in the commit message
- Add XDP feature flags using xdp_set_features_flag()
- Use xdp_build_skb_from_buff() when XDP ran
All the above changes have been suggested by Ido Schimmel <idosch@idosch.org>

Roger Quadros (3):
  net: ti: icssg-prueth: Use page_pool API for RX buffer allocation
  net: ti: icssg-prueth: introduce and use prueth_swdata struct for
    SWDATA
  net: ti: icssg-prueth: Add XDP support

 drivers/net/ethernet/ti/Kconfig               |   1 +
 drivers/net/ethernet/ti/icssg/icssg_common.c  | 427 ++++++++++++++----
 drivers/net/ethernet/ti/icssg/icssg_config.h  |   2 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  | 129 +++++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |  50 +-
 .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  |  23 +-
 6 files changed, 540 insertions(+), 92 deletions(-)


base-commit: acdefab0dcbc3833b5a734ab80d792bb778517a0
-- 
2.43.0


