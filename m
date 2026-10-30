Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B20D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r+f7TX/F;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vESj5NoO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FGYjc1WDwG+DBcG/E4vUnJWguzsaM5whGyM2s0RYAtc=; b=r+f7TX/F+ntaAklge8c5+RSgJU
	O7pkXhA59YMfqTeNk/YBu6vLvtHjxFuwaETWvPIOXw28d/MJS2osxZqBdKStVF9pwtWXBbB0mwuBK
	Yv7HexVHyV3tFkZhQS6xelS2cVceUQo3r7jJK17tUOY+RGl8rasVikjKaRm6SCFexwFEHYRi4naLD
	q5CMNVVGrv5Db9uwwebP1Oz1hU0nSjLENe2RGbcVqeIpceTvJfafUgX5vBtaLTT3a5qPWoktCvYNw
	4q00dmJqSdcTV7BNYtrOdxO/pJSJW3+3xCTg1VZ2MH7NsquAeToBykBZNBjWvqSyVfqc7n4h+eQri
	j3BUu04Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiS1-0000000BBYL-31eI;
	Fri, 30 Oct 2026 08:59:05 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiRy-0000000BBXO-1418
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=vESj5NoO9/PGNU5IPaSAr/gcfFf3Zo+H1wZENYuWd53kNzWAS2SWOrPoG3XSNdK1bdgWKAeTrUqBz
	 adewOlM3Zbh+T8ozXp63XcPt/8lDnakq1sayQFm8ImhpM7bWRSbxsBs1dNvW4BrWKJUcDGZyzqe39z
	 ZfGISGs61E2087Ho=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66ae45c4d08a-40501;
	Fri, 30 Oct 2026 16:58:54 +0800 (CST)
X-RM-TRANSID: 2ee66ae45c4d08a-40501
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36ae45c4ca2e-54c00;
	Fri, 30 Oct 2026 16:58:54 +0800 (CST)
X-RM-TRANSID: 2ee36ae45c4ca2e-54c00
From: laixiangwu <laixiangwu@cmss.chinamobile.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	laixiangwu <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] net: ti: icssg-prueth-sr1: Fix device_node refcount leak in prueth_probe()
Date: Fri, 30 Oct 2026 16:58:51 +0800
Message-ID: <20261030085851.2019-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_015902_889508_534EA13A 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

prueth_probe() takes references on the eth0_node/eth1_node device nodes
with of_node_get() and stores them in prueth->eth_node[]. If either of
the "ti,mii-g-rt" or "ti,mii-rt" syscon regmap lookups fails, probe()
returns -ENODEV without dropping those references, leaking the device
nodes.

Jump to the existing put_cores label so the error path releases the
eth0_node/eth1_node references like all the other failure paths in the
function do.

Fixes: e654b85a693e ("net: ti: icssg-prueth: Add ICSSG Ethernet driver for AM65x SR1.0 platforms")
Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
index b8115ca47..ef1dc32ff 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -963,13 +963,15 @@ static int prueth_probe(struct platform_device *pdev)
 	prueth->miig_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-g-rt");
 	if (IS_ERR(prueth->miig_rt)) {
 		dev_err(dev, "couldn't get ti,mii-g-rt syscon regmap\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto put_cores;
 	}
 
 	prueth->mii_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-rt");
 	if (IS_ERR(prueth->mii_rt)) {
 		dev_err(dev, "couldn't get ti,mii-rt syscon regmap\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto put_cores;
 	}
 
 	if (eth0_node) {



