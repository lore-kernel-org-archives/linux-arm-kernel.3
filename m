Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354DCC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 10:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wryz06ecjFza6cdQ2QRwPLmlZLKpml5XtzADdJCKhPA=; b=ixRThcAi5aRM3SwjbIH6JeYrBv
	3hw7nfsMnejt5++XBp6TU39ATk3Jg7fAV2+fFBFcPta1RndR+Var2nb7+0fd48R64Q9PuZznIBXEf
	XZlVDLcR4DThKymbXW1/tqhzo+BS6+mewd/dTg7ToBxe1Fh7mEyMMhs8B+fgFEMrKHKK3zqj4tC+a
	s1XFy3a8I+UQfatWiyGTU9jjx8fLwMBfwUoKjugIXbz4XjQoqK5NQOJl3RW12xrgN1RGpbki28iOy
	s1HuGJ76N02rzzWGMictxxLR4JN3KE8HnBTO0a9Gw5by9XDijULlS1Jj1cquHyRUnFHyfEtND/cGM
	2oeC8y1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmFn-00000007jSN-03sz;
	Wed, 05 Mar 2025 10:45:31 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplmB-00000007dxP-1Jiv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 10:14:56 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525AERd83282294
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 04:14:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741169667;
	bh=Wryz06ecjFza6cdQ2QRwPLmlZLKpml5XtzADdJCKhPA=;
	h=From:To:CC:Subject:Date;
	b=jbccJB8XF/zh1BcKSkCM2IiV+JgfYNcqsIx4us/h9XLZR6J7TacJZFvPgI9FvQlKU
	 v2g0rxH3E1qb1ag32px9h7yUfQWmuncdYwUiRcyTdPmYjFgmeHqius26aEA2lslg2f
	 8Hd8MhRA4IHT6EBBiQ3tB+c3B/JU+skgRQgqGAqc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 525AERaX085764
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Mar 2025 04:14:27 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 04:14:27 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 04:14:26 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525AEQH4042146;
	Wed, 5 Mar 2025 04:14:26 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 525AEP4Q005713;
	Wed, 5 Mar 2025 04:14:26 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <rogerq@kernel.org>, <danishanwar@ti.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <matthias.schiffer@ew.tq-group.com>, <krzysztof.kozlowski@linaro.org>,
        <dan.carpenter@linaro.org>, <m-malladi@ti.com>,
        <diogo.ivo@siemens.com>, <s.hauer@pengutronix.de>,
        <glaroque@baylibre.com>, <schnelle@linux.ibm.com>, <arnd@kernel.org>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
Subject: [PATCH net-next v4 0/3] net: ti: icssg-prueth: Add native mode XDP support
Date: Wed, 5 Mar 2025 15:44:19 +0530
Message-ID: <20250305101422.1908370-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_021455_452519_2349E116 
X-CRM114-Status: UNSURE (   9.89  )
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

This series adds native XDP support using page_pool.
XDP zero copy support is not included in this patch series.

Patch 1/3: Replaces skb with page pool for Rx buffer allocation
Patch 2/3: Adds prueth_swdata struct for SWDATA for all swdata cases
Patch 3/3: Introduces native mode XDP support

v3: https://lore.kernel.org/all/20250224110102.1528552-1-m-malladi@ti.com/

Changes since v3 (v4-v3):
1/3:
- Get rid of skb from Rx management code in SR1 as suggested by 
Roger Quadros <rogerq@kernel.org>
2/3:
- remove SWDATA size information from commit message
- Fix handling of packets for non-skb type inside emac_tx_complete_packets()
- Remove incrementing budget for incorrect swdata type
- use PRUETH_SWDATA_CMD in emac_send_command_sr1()
All the above changes are suggested by Roger Quadros <rogerq@kernel.org> and
Dan Carpenter <dan.carpenter@linaro.org>
3/3:
- few cosmetic changes inside emac_xmit_xdp_frame() func
- change xdp_state type to u32 from int
Above changes are suggested by Dan Carpenter <dan.carpenter@linaro.org>
- Few improvements in emac_run_xdp case handling as suggested by 
Roger Quadros <rogerq@kernel.org>

Roger Quadros (3):
  net: ti: icssg-prueth: Use page_pool API for RX buffer allocation
  net: ti: icssg-prueth: introduce and use prueth_swdata struct for
    SWDATA
  net: ti: icssg-prueth: Add XDP support

 drivers/net/ethernet/ti/Kconfig               |   1 +
 drivers/net/ethernet/ti/icssg/icssg_common.c  | 417 ++++++++++++++----
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  | 131 +++++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |  47 +-
 .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  |  58 ++-
 5 files changed, 541 insertions(+), 113 deletions(-)


base-commit: f77f12010f67259bd0e1ad18877ed27c721b627a
-- 
2.43.0


