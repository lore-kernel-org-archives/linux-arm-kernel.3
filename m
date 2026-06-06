Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A423ACD8C85
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 07:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Hi26MYjuAXv+lAIB99rWxPcRNW1nP+Lo1MKB1YaTkU=; b=yjFDEkhJYSYbUEuS+s90BYn45K
	zGJK78h2OQofMK7ecF0hQi+kZ4TdGtoaTkaXLXcYT0SGGSW3q4eSL24Xbc7tjeE0kHEd6F/GvUleB
	6WTwmSZD2Gs2WDEWKHNWbYB1ug85O3K8CFk8TtGwxh4fEc/3rcF7pAA2rIPW1/iAaSAQAxEhjTv90
	NrXS6bYUxfGS5599nRhteQEnNdt4a2EymxJ/F1XhultkVFCJz9lVMg8rw57t+a3yQ62G3R377GcNM
	50g1ck6JVqnM61z7dZEUPe38u2xFOVr7hxUHKDXkoCvv33nWs+uWjrDWqoTvQcA/mIS2o3UowtwiO
	r/e/i72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVl6K-00000001Upf-2slD;
	Sat, 06 Jun 2026 07:05:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVl6J-00000001UpW-1Vr0;
	Sat, 06 Jun 2026 07:05:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CD3C600AE;
	Sat,  6 Jun 2026 07:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16ED11F00893;
	Sat,  6 Jun 2026 07:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780729544;
	bh=7Hi26MYjuAXv+lAIB99rWxPcRNW1nP+Lo1MKB1YaTkU=;
	h=From:Date:Subject:To:Cc;
	b=JGbMGLGKIMpgpJuVJQoRvYr2BQs2XnS+wGt2NBV5McjAmRdKsv7nMt4SORrRDJpgj
	 6ZSToCUcsnGbADr13PgKubnSXjlW3vYHC6pGLB6H/tor1G1JZhIBm+kGNcPLIBWnRK
	 1QhbrBSkA8DjlLgWAo5XMos59sSxZ3pOdPodA6yXcTUqLZs0l6Pxcdv3dxokgGqwWs
	 nPMDbY56RxT29KjoQD6QwePPjU6H6PFiVc4bOSj2GVPw0f7ODiScfVfqDg8vxq0P71
	 VUz1zE+EfYSzYSbN+pTLWT6rBNflcdig9gsZM6FxYIxJfiryhF7NylC8FxxZIlY3a8
	 Ovo9F+CLHCTCw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 06 Jun 2026 09:05:24 +0200
Subject: [PATCH net-next] net: airoha: simplify WAN device check in
 airoha_dev_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-airoha-eth-simplify-dev-init-v1-1-f08f8e404049@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQrCMBBF0V8ps3YgVqvgr4iLkLyaBzotSSgtp
 f9ukLs6m7tLQSaKPLpdMhYWTtZwPnUSkrc3lLFZetffXEs985S8oiYt/M4fjptGLEpj1SEOl3A
 PwbkrpC3mjJHrf/8UQ1XDWuV1HD/FReFHeAAAAA==
X-Change-ID: 20260606-airoha-eth-simplify-dev-init-5d53c7cc004e
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
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

airoha_register_gdm_devices() iterates eth->ports[] in order, so GDM2's
netdev is always registered before GDM3/GDM4. This means the explicit
check for eth->ports[1] && eth->ports[1]->devs[0] is a redundant
special-case of what airoha_get_wan_gdm_dev() already covers, since
GDM2 is always marked as WAN during its own ndo_init.
Remove the redundant check and rely solely on airoha_get_wan_gdm_dev()
which handles both the GDM2-present and GDM2-absent cases.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 5a8e84fa9918..b333a7b309c2 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2004,18 +2004,10 @@ static int airoha_dev_init(struct net_device *netdev)
 
 	switch (port->id) {
 	case AIROHA_GDM3_IDX:
-	case AIROHA_GDM4_IDX: {
-		struct airoha_eth *eth = dev->eth;
-
-		/* GDM2 supports a single net_device */
-		if (eth->ports[1] && eth->ports[1]->devs[0])
-			break;
-
-		if (airoha_get_wan_gdm_dev(eth))
+	case AIROHA_GDM4_IDX:
+		if (airoha_get_wan_gdm_dev(dev->eth))
 			break;
-
 		fallthrough;
-	}
 	case AIROHA_GDM2_IDX:
 		/* GDM2 is always used as wan */
 		dev->flags |= AIROHA_PRIV_F_WAN;

---
base-commit: 903db046d5579bef0ea699eae4b279dd6455fc9f
change-id: 20260606-airoha-eth-simplify-dev-init-5d53c7cc004e

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


