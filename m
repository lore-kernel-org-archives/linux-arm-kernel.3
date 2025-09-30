Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6F6CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 12:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FvXw5gf1FTJcHDUr+9qLaj7NX8ubdoIWyGKeOiODosk=; b=GFytjeJZiZVN8nrXqt0SdkidCY
	xNgrf0Hzd+yI4cl9HJGnkUwh0jO0QiIwN8XjH8ztDoOQ16iPJTYgkgNVNfMhUFbW99tPbui5+/dHs
	h61zmiwB0qIai4VqJnYrHpXLnNFE82Bn6S5NuTEnEkMKzfn0Yu1zsnAtuKD1MAqVdCewGdHYG5Dea
	E5c3hsPEwSVfptLt6dYrynp1TJaMMTJBNBJm7xOPRUYR0/B7YsJPVLbkN4eCb0Ze709uQ2sL5uoss
	yhq1zW0GmslZgErBqlORiKfByqJRhF6VhoTpY7vXd0Z5Azzpw9TmvqLzhAyNKTw2hG3L4K5OSJXjM
	nPg2+cIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZHc-00000005EHt-0ZlQ;
	Tue, 30 Sep 2025 12:16:40 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZHZ-00000005EGB-0BmE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 12:16:38 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58UCGMc72911951;
	Tue, 30 Sep 2025 07:16:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759234582;
	bh=FvXw5gf1FTJcHDUr+9qLaj7NX8ubdoIWyGKeOiODosk=;
	h=From:To:CC:Subject:Date;
	b=MIE7i7nfgPz/HFll/CT4WhrKWQIIqIVNe/GYHwG6zwD1kt4i3SGdFXdCval7jiXS4
	 R3FB9drFRpdbkfAlX8COBkkyNYc38I4QVRb1N+4M92AYUEO0lFQ/9WYRBEVF7p10/a
	 LQK71qsZeKnVy4ltUbq3UPPBONbg6ZZi9NRKxHUY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58UCGMD33905823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 30 Sep 2025 07:16:22 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 30
 Sep 2025 07:16:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 07:16:21 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58UCGLsD3150256;
	Tue, 30 Sep 2025 07:16:21 -0500
From: Nishanth Menon <nm@ti.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Paolo
 Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet
	<edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>
CC: Santosh Shilimkar <ssantosh@kernel.org>, Simon Horman <horms@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, Nishanth Menon <nm@ti.com>
Subject: [PATCH V2 0/3] soc: ti: Fix crash in error path when DMA channel open fails
Date: Tue, 30 Sep 2025 07:16:06 -0500
Message-ID: <20250930121609.158419-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_051637_216104_221178FC 
X-CRM114-Status: GOOD (  10.86  )
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

Hi,

This is a respin of V1 of the series, to address a crash seen in
kernelci.org automated testing[1].

Changes in V2:
- Took Simon's suggestion in refactoring code to make
  knav_dma_open_channel return NULL and fix the callers accordingly.

Since the series does have inter-dependencies, I suggest the full series
could either go via net tree OR via SoC tree (if net maintainers dont
mind acking it). Personally, I have no issues of getting it via the net
tree.

I dropped the fixes tag here, any better suggestion to hit stable will
be nice to know, since the code is refactored a bit here.

V1: https://lore.kernel.org/all/20250926150853.2907028-1-nm@ti.com/

[1] https://dashboard.kernelci.org/log-viewer?itemId=ti%3A2eb55ed935eb42c292e02f59&org=ti&type=test&url=http%3A%2F%2Ffiles.kernelci.org%2F%2Fti%2Fmainline%2Fmaster%2Fv6.17-rc7-59-gbf40f4b87761%2Farm%2Fmulti_v7_defconfig%2BCONFIG_EFI%3Dy%2BCONFIG_ARM_LPAE%3Dy%2Bdebug%2Bkselftest%2Btinyconfig%2Fgcc-12%2Fbaseline-nfs-boot.nfs-k2hk-evm.txt.gz
Nishanth Menon (3):
  net: ethernet: ti: netcp: Handle both ERR_PTR and NULL from
    knav_dma_open_channel
  soc: ti: knav_dma: Make knav_dma_open_channel return NULL on error
  net: ethernet: ti: Remove IS_ERR_OR_NULL checks for
    knav_dma_open_channel

 drivers/net/ethernet/ti/netcp_core.c | 10 +++++-----
 drivers/soc/ti/knav_dma.c            | 14 +++++++-------
 2 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.47.0


