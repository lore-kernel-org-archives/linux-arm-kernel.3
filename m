Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CE0C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 10:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzSH/o0yISBtN/3+MZcetAOZsEZpTvcCbzXAjwOkb8Q=; b=MEu9S3OrvXq5fXmkcuIUtj8PiR
	VogBlYmkmScGuOkee5ixPb3tSwRvcq3aTuZmJl1lnH0yMELLN4bShxB2viY3qNnTWhtxwkxWS+Cc0
	R8e/F65NBMpxHvsKlZN5q5V5LePabk5Nb5FIYy/e+sCY/WmtbT9aUskpnRLfIcjlBEN5Qoogxl088
	8DpSgkCz3r81HPTwNofSRDtwjTk8E0zAWAvoWnUtcMAd5CruC1A4FVrkXDQwLAf/gLZhtF9U4GmdD
	6/X/g5c0mHbgjgd8CWHgdBVmibb7TNBlsBse7uJ0JPgaCsDYRB0V7k1VzaUq7riWrJQLtnJo5UjTH
	IAxkjxig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6ww-0000000D8Ei-2IER;
	Fri, 28 Mar 2025 10:28:30 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6tC-0000000D7TD-3n3x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 10:24:40 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52SAOBEY2125516
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 28 Mar 2025 05:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743157451;
	bh=WzSH/o0yISBtN/3+MZcetAOZsEZpTvcCbzXAjwOkb8Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gsGV9xaAHMmPy1rHi1dOhCeZf0FE7F+3XKD2NykL5ccYevwcPWBR+9GToP5hK7M8d
	 G1hmiYmginzjO83ypN57ryTPqRYDDoyfk8y7MnUsIxCAPKuad5dQDjdEQ9+r+xn8C3
	 O9EUSdLsDqSJiRp35M7YbyLKJaeUTJm+Cyxag3ZI=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SAOB4H079346;
	Fri, 28 Mar 2025 05:24:11 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 05:24:11 -0500
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 05:24:11 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SAOAAv080265;
	Fri, 28 Mar 2025 05:24:10 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 52SAO9gB024929;
	Fri, 28 Mar 2025 05:24:10 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <dan.carpenter@linaro.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <namcao@linutronix.de>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <horms@kernel.org>,
        <jacob.e.keller@intel.com>, <m-malladi@ti.com>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v3 1/3] net: ti: icssg-prueth: Fix kernel warning while bringing down network interface
Date: Fri, 28 Mar 2025 15:54:01 +0530
Message-ID: <20250328102403.2626974-2-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328102403.2626974-1-m-malladi@ti.com>
References: <20250328102403.2626974-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_032439_030944_01ECE41F 
X-CRM114-Status: GOOD (  10.90  )
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

During network interface initialization, the NIC driver needs to register
its Rx queue with the XDP, to ensure the incoming XDP buffer carries a
pointer reference to this info and is stored inside xdp_rxq_info.

While this struct isn't tied to XDP prog, if there are any changes in
Rx queue, the NIC driver needs to stop the Rx queue by unregistering
with XDP before purging and reallocating memory. Drop page_pool destroy
during Rx channel reset as this is already handled by XDP during
xdp_rxq_info_unreg (Rx queue unregister), failing to do will cause the
following warning:

warning logs: https://gist.github.com/MeghanaMalladiTI/eb627e5dc8de24e42d7d46572c13e576

Fixes: 46eeb90f03e0 ("net: ti: icssg-prueth: Use page_pool API for RX buffer allocation")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 46f500b90b17..3c0ea9044e18 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -1215,9 +1215,6 @@ void prueth_reset_rx_chan(struct prueth_rx_chn *chn,
 					  prueth_rx_cleanup, !!i);
 	if (disable)
 		k3_udma_glue_disable_rx_chn(chn->rx_chn);
-
-	page_pool_destroy(chn->pg_pool);
-	chn->pg_pool = NULL;
 }
 EXPORT_SYMBOL_GPL(prueth_reset_rx_chan);
 
-- 
2.43.0


