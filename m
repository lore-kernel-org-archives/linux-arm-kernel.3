Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19F7C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 11:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UrJwRS5j0Znv8WvcVKXlmtyolIJX3daZq7dyAqxKQS4=; b=U3k5TFwn0fU/SHDkyHC6sNvk76
	OVrIy+5tEgUdFGXLEDRTL+dgT3SQWy1y2ZSKg4IStjXIhr4WgtAWK+rcsjC7cv4wyJ4K862gAnNa7
	VeoEvYFt43edn0SVLaWPp4++/Gr5pyrrGUyUVkuUj/M5E386+Wdhb35eV3OgRsVpQhmqqW3rm4l6D
	3f+bm4wF1FRyUbXwPPm2/Pm1UKDsNw+TcOJkNP7r1f/M47tNy0aetUQ9WQaxi2Fwle2xLcFH07Sj3
	Fha80oLDEJhHw9gH+MDhFtnVw4tPTwihSaBlXTjEtK9nyLORZJ4j4pToLtkyF6i9NYdcde/D0FeOT
	xZRMT/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWNJ-0000000DI1T-28mZ;
	Mon, 24 Feb 2025 11:11:49 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWDU-0000000DGJM-2PJt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 11:01:41 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51OB174G874420
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2025 05:01:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740394867;
	bh=UrJwRS5j0Znv8WvcVKXlmtyolIJX3daZq7dyAqxKQS4=;
	h=From:To:CC:Subject:Date;
	b=bVluDuFu35aMtK+DaebNDRkm+5h3txflRDrM7o2icA9EPwTddFpXH9qdhbB9vHqOF
	 pIs5ILC2tGzJXUuBLOhrDEnR51Ex+Bj/CYw5hj5kB5GFWcAWMxpA/LfihhyTxqMgq1
	 9+j4xElOK7g4OMf2v7J7V5XrFngbtO3L9/cf1xW0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51OB17lt106562
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Feb 2025 05:01:07 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Feb 2025 05:01:06 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Feb 2025 05:01:07 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51OB16qV093011;
	Mon, 24 Feb 2025 05:01:06 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 51OB16T6002030;
	Mon, 24 Feb 2025 05:01:06 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <rogerq@kernel.org>, <danishanwar@ti.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <u.kleine-koenig@baylibre.com>, <matthias.schiffer@ew.tq-group.com>,
        <dan.carpenter@linaro.org>, <m-malladi@ti.com>,
        <schnelle@linux.ibm.com>, <diogo.ivo@siemens.com>,
        <glaroque@baylibre.com>, <macro@orcam.me.uk>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH net-next v3 0/3] net: ti: icssg-prueth: Add native mode XDP support
Date: Mon, 24 Feb 2025 16:30:59 +0530
Message-ID: <20250224110102.1528552-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_030140_703140_E57350E5 
X-CRM114-Status: GOOD (  11.56  )
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

v2: https://lore.kernel.org/all/20250210103352.541052-1-m-malladi@ti.com/

Changes since v2 (v3-v2):
0/3:
- Update cover letter subject line to add details of the driver as suggested by
Jesper Dangaard Brouer <hawk@kernel.org>
1/3:
- few cosmetic changes for all the patches
2/3:
- Fix leaking tx descriptor in emac_tx_complete_packets()
- Free rx descriptor if swdata type is not page in emac_rx_packet()
- Revert back the size of PRUETH_NAV_SW_DATA_SIZE
- Use build time check for prueth_swdata size
- re-write prueth_swdata to have enum type as first member in the struct
and prueth_data union embedded in the struct
3/3:
- Use page_pool contained in the page instead of using passing page_pool
(rx_chn) as part of swdata
- dev_sw_netstats_tx_add() instead of incrementing the stats directly
- Add missing ndev->stats.tx_dropped++ wherever applicable
- Move k3_cppi_desc_pool_alloc() before the DMA mapping for easier cleanup
on failure
- Replace rxp->napi_id with emac->napi_rx.napi_id in prueth_create_xdp_rxqs()

All the above changes have been suggested by Roger Quadros <rogerq@kernel.org>

Roger Quadros (3):
  net: ti: icssg-prueth: Use page_pool API for RX buffer allocation
  net: ti: icssg-prueth: introduce and use prueth_swdata struct for
    SWDATA
  net: ti: icssg-prueth: Add XDP support

 drivers/net/ethernet/ti/Kconfig               |   1 +
 drivers/net/ethernet/ti/icssg/icssg_common.c  | 421 ++++++++++++++----
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  | 128 +++++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |  47 +-
 .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  |  23 +-
 5 files changed, 529 insertions(+), 91 deletions(-)


base-commit: e13b6da7045f997e1a5a5efd61d40e63c4fc20e8
-- 
2.43.0


