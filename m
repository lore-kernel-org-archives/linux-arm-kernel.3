Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270B1C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6DRyDcyPSgFT59lfHen3lkJueNSOvm0dbM7e8Gn/vj0=; b=19LyhA2sNO8ZQWMdqtMZ/o0cf4
	11Qcevhe/ysv01TTcPPoc2c4Gi5HC8iwJzH06S67p+uuEz3zmLeRtKuWil3DdCsob2aOlOL9yG0mq
	/YmSBPW2ABYpTtYwRdtzzi51jAZyichnuzlA0rkAs8DkvRaMKUcY3v1fyDSP2S6pgNEC6UGBO2413
	I/gCIv/23h9R1837DYkFOu/2AYK7QeQtYVL1mRcS/AuWGhYMbDk57W4y0qIfb+UtHZxbguBKIp/Nl
	jbPDqkJwDTmbrBKjOlXP9IE3XTDF7IrXR7sgTfXMz60zHGp6Qb/NLGl+ZlS3GZRNtkYo/rk8Jw+c0
	Zdb72fgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9No7-00000006EYN-2Ykq;
	Mon, 28 Apr 2025 12:41:59 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NEl-000000065yC-3cmx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:05:29 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SC54pA3531175
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 07:05:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745841904;
	bh=6DRyDcyPSgFT59lfHen3lkJueNSOvm0dbM7e8Gn/vj0=;
	h=From:To:CC:Subject:Date;
	b=yumF25c5X2+yq5LAxgos6DOvdGR4oAomJEyMeMOaLdLEdrB2s+EE1etwCakwi0gEX
	 hR6uHys9JOLhsKj3M//6mu1dBgLw3Sfh7s4VIuogw+PsrOUo01MNuytjijfs17eWGl
	 1h9N9nG+Zr1WOgbjM3zI4Vr5+IjnGlBeZy8bholE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SC54dB061149
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 07:05:04 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 07:05:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 07:05:04 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SC54iK023623;
	Mon, 28 Apr 2025 07:05:04 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 53SC52ih026319;
	Mon, 28 Apr 2025 07:05:03 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <dan.carpenter@linaro.org>, <m-malladi@ti.com>, <john.fastabend@gmail.com>,
        <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net 0/4] Bug fixes from XDP patch series
Date: Mon, 28 Apr 2025 17:34:55 +0530
Message-ID: <20250428120459.244525-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_050527_959729_F058A0DB 
X-CRM114-Status: UNSURE (   8.27  )
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

This patch series fixes the bugs introduced while adding
xdp support in the icssg driver, and were reproduced while
running xdp-trafficgen to generate xdp traffic on icssg interfaces. 

Meghana Malladi (4):
  net: ti: icssg-prueth: Set XDP feature flags for ndev
  net: ti: icssg-prueth: Report BQL before sending XDP packets
  net: ti: icssg-prueth: Fix race condition for traffic from different
    network sockets
  net: ti: icssg-prueth: Fix kernel panic during concurrent Tx queue
    access

 drivers/net/ethernet/ti/icssg/icssg_common.c | 22 ++++++++++++++++++--
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 16 ++++++++------
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |  1 +
 3 files changed, 31 insertions(+), 8 deletions(-)


base-commit: cc17b4b9c332cc654b248619c1d8ca40d80d1155
-- 
2.43.0


