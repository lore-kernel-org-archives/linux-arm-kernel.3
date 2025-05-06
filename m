Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497E5C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kvvixGItnP8EXItNCvGOcFRVOXqkBwtBwhbiCKvfChM=; b=4Fb1SIlguJwnBKcUFTxut4PHJN
	iiWbtIndZOUEgZI6XSkBVVNKQ4ZMrEOT8Gq8KZg1NwpBXE5dtUwDnOrZMnZbVScXtVOg50HftLsdn
	XIArFrJ3KhUs7Ip6zoW6p3NMv/Tda0QF3EcVCahy/cwBnUK1sYheCaF68mSaFqro3ZiUjPtB8pAQw
	hkNKe/vVM+JUg7O86H+CJzOo3PqUVqe4h6YJN85MXnpsqHAOd2tYVhn1AEe0rHEhkAy8RVBoK5MTW
	TdeK+Q5q6xUUFUl+mkjLB4O91UWlwqfMV9Jj+E9NbFf8vmHshnXDQgZro/taEkogFxd6iTcOI+/IS
	6l+pGwpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIUO-0000000C9e4-2fCy;
	Tue, 06 May 2025 13:37:40 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCG81-0000000BfT7-2ZGD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:06:26 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546B5pWU505365
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 06:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746529551;
	bh=kvvixGItnP8EXItNCvGOcFRVOXqkBwtBwhbiCKvfChM=;
	h=From:To:CC:Subject:Date;
	b=OJkJakUPKklp+XK+d4qOPDKY+LCananYXCsGJaA1/TdIVSIKFfSoswF9F7OpHsTI/
	 ORP9UfQF/aqrRQygaVlpP8RHpMyw70xLn2J1YivG3sCgG22bjnVTBPTf1QYjxnud0Y
	 mXPIljeRcBY9n7GYpEYMXw18zYVNi65xV9yWlONg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546B5pVS024284
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 06:05:51 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 06:05:51 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 06:05:51 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546B5prY127657;
	Tue, 6 May 2025 06:05:51 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 546B5no5010330;
	Tue, 6 May 2025 06:05:50 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <namcao@linutronix.de>, <horms@kernel.org>, <m-malladi@ti.com>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v2 0/3] Bug fixes from XDP patch series
Date: Tue, 6 May 2025 16:35:43 +0530
Message-ID: <20250506110546.4065715-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_040625_693623_9626D71E 
X-CRM114-Status: UNSURE (   7.40  )
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

v1: https://lore.kernel.org/all/20250428120459.244525-1-m-malladi@ti.com/

Meghana Malladi (3):
  net: ti: icssg-prueth: Set XDP feature flags for ndev
  net: ti: icssg-prueth: Fix kernel panic during concurrent Tx queue
    access
  net: ti: icssg-prueth: Report BQL before sending XDP packets

 drivers/net/ethernet/ti/icssg/icssg_common.c | 15 +++++++++++++--
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 16 ++++++++++------
 2 files changed, 23 insertions(+), 8 deletions(-)


base-commit: 8c2e6b26ffe243be1e78f5a4bfb1a857d6e6f6d6
-- 
2.43.0


