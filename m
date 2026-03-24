Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD084F54ADA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j5VpEbBkDbHR3AeO/vQBdMQoHwJEuruD/Gx0kzZogT8=; b=Y4N6tG0nBkE58dI5MWrDqdEG6u
	pBRn5CSE8mZGVc3xIZoV4RGMTFvV8XeY/ZZIz3RcHKUE5C5TdlXXK8YcwZMBKkfXX/Kfs13+CRF4Y
	E6BhNUslR8PFoAGhUi2ViK53KAPVztMY932wwrvTm52Cx6sep14MGtk+jcpSy8m8oN4yVYFaYomYn
	vow+xq1oP5zleG7nc4yT9XSawGsfJc3OQHVePc6MGNit0dC4nE9TOy5Hh5SQV3q5cl5n77VCH3aBr
	QTSsOm4Yxs1VzymBv7LE4JyUlQvEbu2W29fx9OPAFD/PXjZC8YIPl6uwP685/dU+vjK5cZFZTszyo
	u98XSlqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w552O-00000001w65-1wpv;
	Tue, 24 Mar 2026 16:55:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w552L-00000001w5U-4AtQ;
	Tue, 24 Mar 2026 16:55:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 204A0600AC;
	Tue, 24 Mar 2026 16:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1F9C19424;
	Tue, 24 Mar 2026 16:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774371324;
	bh=5r1QnMw+vkFTIcuRXJoKO+7ZYkPN9lBP+lg9RoD/6+Q=;
	h=From:Date:Subject:To:Cc:From;
	b=D/kJTgvUz5mozx+5jbyi1MlCtHBa4WEuewqhAmz9RmsYoxATT+Kbn+6fsG5HBSdzd
	 0rdqiRd/JBd5bH64ACfjWJ3Z1KvsqRXUTfnDUo9wrBQWvZDeNg22/aQdqFf4zmCrMu
	 H8EZvPuM3Y4NnwnRh1yl6gOtO1XiUez5reaFcAXdXfpTTsIxXVvv0eC4tgDEmGRRt/
	 ikFb7MjHJsltALhzwuL021lajda81fyZlvkRx8uGF27zymG7IOeHwFIHL5g0iuyzIy
	 Bt5X90OaSMZYYoKvFD7HZ/ieWG/uW1L9CT5h4ejBpfVD3+mLrHRlVwLBEPO1Qx1OAO
	 NH2gy30SJpFxQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 24 Mar 2026 17:54:45 +0100
Subject: [PATCH net-next] net: airoha: Grab flow_offload_mutex running
 airoha_register_gdm_devices()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-airoha-regiser-race-fix-v1-1-6014df55886b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAMAzAviI9W9imTvEr4mFot/Wi0oEIw79bP
 CaQVCgkTAXmpoLQzYXPQ8G2DWw5HImQd2VwxnnTOYuB5cwBhRJrihI2wsgPRpqGPnq7j96A1pe
 Q6v+8rO/7Abp+PClpAAAA
X-Change-ID: 20260321-airoha-regiser-race-fix-fe854f61d760
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

Netfilter flowtable can theoretically try offload flower rules as soon
as a net-device is registered while not all the other ones are
registered/initialized, triggering a possible NULL pointer dereferencing
of qdma pointer in airoha_ppe_set_cpu_port routine. In order to avoid any
possible race, grab the flow_offload_mutex running
airoha_register_gdm_devices().

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 15 +++++++++++----
 drivers/net/ethernet/airoha/airoha_eth.h |  2 ++
 drivers/net/ethernet/airoha/airoha_ppe.c |  2 +-
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 82e53c60f561f6314fbf201ba8bc8711e40edc68..c1476032f78cbac95c9813bbeae6bec2c9c0a685 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2943,21 +2943,28 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 
 static int airoha_register_gdm_devices(struct airoha_eth *eth)
 {
-	int i;
+	int i, err = 0;
+
+	/* Netfilter flowtable can try offload flower rules while not all
+	 * the net-devices are registered/initialized. Grab flow_offload_mutex
+	 * to avoid any possible race.
+	 */
+	mutex_lock(&flow_offload_mutex);
 
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];
-		int err;
 
 		if (!port)
 			continue;
 
 		err = register_netdev(port->dev);
 		if (err)
-			return err;
+			break;
 	}
 
-	return 0;
+	mutex_unlock(&flow_offload_mutex);
+
+	return err;
 }
 
 static int airoha_probe(struct platform_device *pdev)
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 7df4dbcd8861856c54c2a38bc89c69180ac2f6dc..9d97a54dbfdf9107a10bdb09cf144e5cf1ac9bdb 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -548,6 +548,8 @@ struct airoha_gdm_port {
 	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
 };
 
+extern struct mutex flow_offload_mutex;
+
 #define AIROHA_RXD4_PPE_CPU_REASON	GENMASK(20, 16)
 #define AIROHA_RXD4_FOE_ENTRY		GENMASK(15, 0)
 
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 7666b1d2f4f6ea758683181ab90d6fffb7bcd19d..96d092f7214ee3e80843a14528df66cabf79bc58 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -15,7 +15,7 @@
 #include "airoha_regs.h"
 #include "airoha_eth.h"
 
-static DEFINE_MUTEX(flow_offload_mutex);
+DEFINE_MUTEX(flow_offload_mutex);
 static DEFINE_SPINLOCK(ppe_lock);
 
 static const struct rhashtable_params airoha_flow_table_params = {

---
base-commit: b1c803d5c8167026791abfaed96fd3e6a1fcd750
change-id: 20260321-airoha-regiser-race-fix-fe854f61d760

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


