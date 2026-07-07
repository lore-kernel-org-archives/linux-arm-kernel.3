Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9469AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 17:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNXbq9Cu+WTMH+abx/696AHzFIv8/SkoGRDgk6ijN8c=; b=WUaUTuStnvgc0gNqBktX0dKXKQ
	3OSfKbylzWXgqN5es8/FThhe+bML0qMPPpHibOC5bROChVna1qOM3VHeCbaNX/ixXTRCAXcpti5/3
	JnYtRfy3J8zajYI1x2qI3UU7AWQVkbQ2c7HxKjo1OiEMtab0QahZSF4/6Jd4fwRMF2c8XdaQOYQiz
	0v86NWRlsU8D/ohAnJfAxGwH8hKydxTii03jQWo7OF8On3GEwQV94UjEWj3tqJIu2G54N2JdwlFTm
	eQzrg6+BZCFC+0DZpyMdDHF8vOlOIONV46DZeI5M55/Yg7LcQd+ntEV03ufSNJI4Xm6z3gXT6epMl
	FRFKhlMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9qd-0000000Fa7R-39mh;
	Tue, 07 Jul 2026 17:44:43 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9qb-0000000Fa5w-06vM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 17:44:42 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260707174439euoutp02bb02fe3669d5b7131fdb0d763c00914d~AEvEuT2yI2061020610euoutp02o
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 17:44:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260707174439euoutp02bb02fe3669d5b7131fdb0d763c00914d~AEvEuT2yI2061020610euoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783446279;
	bh=GNXbq9Cu+WTMH+abx/696AHzFIv8/SkoGRDgk6ijN8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tNlfMC7TWCquHCU6lnZSXb3kReavyuQAQxZFlA+sF64kY8S5odkbRnoXNs9WltHNy
	 HLzIvfcsav6HMb3Czbd+84QWfzvr5R8IBPLKSaStnq0wSfRMUtvBv2eRg5T6Hesllb
	 SKvxw8PolsqVaYqtnSgRMNkHSIy2Ydkyg8NGkD4M=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260707174438eucas1p132b5c02ceed2493cc7de98ab28c390ee~AEvDeEAs-0453604536eucas1p1Z;
	Tue,  7 Jul 2026 17:44:38 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260707174437eusmtip24d81a31a7f75f7524d8d04fbaa19b62b~AEvCzl9WA1305113051eusmtip2a;
	Tue,  7 Jul 2026 17:44:37 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: k.tegowski@samsung.com, k.domagalski@samsung.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jakub
	Raczynski <j.raczynski@samsung.com>
Subject: [PATCH net 1/2] net/stmmac: Protect against zero queue DTS config
Date: Tue,  7 Jul 2026 19:44:30 +0200
Message-Id: <20260707174431.1264520-2-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707174431.1264520-1-j.raczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260707174438eucas1p132b5c02ceed2493cc7de98ab28c390ee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260707174438eucas1p132b5c02ceed2493cc7de98ab28c390ee
X-EPHeader: CA
X-CMS-RootMailID: 20260707174438eucas1p132b5c02ceed2493cc7de98ab28c390ee
References: <20260707174431.1264520-1-j.raczynski@samsung.com>
	<CGME20260707174438eucas1p132b5c02ceed2493cc7de98ab28c390ee@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_104441_330340_BB426BC9 
X-CRM114-Status: GOOD (  13.29  )
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

Commit 8a7bca6de6de protected against inputing number of tx/rx_queues_to_use
over kernel supported limit in DTS config. AI review mentioned that we also
should protect against zero queue input, because this would cause issues
down the line. Missing config is not an issue as stmmac_plat_dat_alloc()
does apply '1' by default.

Fix this by adding check for zero queues input during DTS parsing

Fixes: 8a7bca6de6de ("net/stmmac: Apply MTL_MAX queue limit if config missing")
Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index dc5f951a311d..9112cd69b9b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -158,6 +158,8 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 	if (!of_property_read_u32(rx_node, "snps,rx-queues-to-use", &value)) {
 		if (value > MTL_MAX_RX_QUEUES)
 			value = MTL_MAX_RX_QUEUES;
+		else if (value == 0)
+			value = 1;
 		plat->rx_queues_to_use = value;
 	}
 
@@ -212,6 +214,8 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 	if (!of_property_read_u32(tx_node, "snps,tx-queues-to-use", &value)) {
 		if (value > MTL_MAX_TX_QUEUES)
 			value = MTL_MAX_TX_QUEUES;
+		else if (value == 0)
+			value = 1;
 		plat->tx_queues_to_use = value;
 	}
 
-- 
2.34.1


