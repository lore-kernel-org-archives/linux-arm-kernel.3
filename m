Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F1BE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKFvxnaUtZIq4z8ojsgFldqznVIvmDuULSreEtH0U88=; b=gyt/7j3VfoABaJqI2IStho48E8
	cL4zr3N4fIYbkjWDK3d/57spHB2okIUXrSk4vwvFP3CuL3XfhbnpSCwPFw8gRl5IV3/iat+WYTRns
	ox5rLMg4TleWVu/FPFSSQmlxfeLkLQY0wme62ncs9erXOnFvCNE5VRbYNkTFfueg8NhgvQp8HLyxA
	61bx/lfPGqJ9x0PC+JXWVCsYaXQox/u4RijI6O0WPhnCrrcUGrgu1wX1Y/wqtLoLHv36CozyNGHFL
	EanAgHIUjXpvbq81uZ/twRxoU+q9wFSdJ3TnQxKX5EjT0aPc7uKDf0XpwHsuqHyjhp0ZLTDvBsDLn
	KyvXvwqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7yt-00000009dHP-31f3;
	Mon, 16 Dec 2024 10:05:39 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7uk-00000009cPg-2ziK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:01:23 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BGA0vwO3794076
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 16 Dec 2024 04:00:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734343257;
	bh=PKFvxnaUtZIq4z8ojsgFldqznVIvmDuULSreEtH0U88=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Yje4NHgsYMA1gTeiRuI/Nsqp+OnhzgMLQRTiI40Lnp/lqlc3LBnJ8Y/GZ2daFKHIf
	 KPQ1Upl6ITcBr8t9WRtxRuxN4rMje4X8gZMB+OqqRloTtI5JEdRGuH7NTc4kUs+9nG
	 QbkEmbFfssCb435QzSnlLgdIf4VBYdm2PW8atypY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BGA0vBB095920;
	Mon, 16 Dec 2024 04:00:57 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Dec 2024 04:00:57 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Dec 2024 04:00:57 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BGA0vv1079571;
	Mon, 16 Dec 2024 04:00:57 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4BGA0uXF000622;
	Mon, 16 Dec 2024 04:00:56 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <aleksander.lobakin@intel.com>, <lukma@denx.de>, <m-malladi@ti.com>,
        <diogo.ivo@siemens.com>, <rdunlap@infradead.org>,
        <schnelle@linux.ibm.com>, <vladimir.oltean@nxp.com>,
        <horms@kernel.org>, <rogerq@kernel.org>, <danishanwar@ti.com>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <srk@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH net-next 1/4] net: ti: Kconfig: Select HSR for ICSSG Driver
Date: Mon, 16 Dec 2024 15:30:41 +0530
Message-ID: <20241216100044.577489-2-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216100044.577489-1-danishanwar@ti.com>
References: <20241216100044.577489-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_020122_788890_BE4673D8 
X-CRM114-Status: UNSURE (   9.87  )
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

HSR offloading is supported by ICSSG driver. Select the symbol HSR for
TI_ICSSG_PRUETH. Also select NET_SWITCHDEV instead of depending on it to
remove recursive dependency.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/ti/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/Kconfig b/drivers/net/ethernet/ti/Kconfig
index 0d5a862cd78a..ad366abfa746 100644
--- a/drivers/net/ethernet/ti/Kconfig
+++ b/drivers/net/ethernet/ti/Kconfig
@@ -187,8 +187,9 @@ config TI_ICSSG_PRUETH
 	select PHYLIB
 	select TI_ICSS_IEP
 	select TI_K3_CPPI_DESC_POOL
+	select NET_SWITCHDEV
+	select HSR
 	depends on PRU_REMOTEPROC
-	depends on NET_SWITCHDEV
 	depends on ARCH_K3 && OF && TI_K3_UDMA_GLUE_LAYER
 	depends on PTP_1588_CLOCK_OPTIONAL
 	help
-- 
2.34.1


