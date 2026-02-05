Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43C9E91260
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 06:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F9Zw0XzlsqtrFcnvP0xl+A5lBqr0v+6APGOlL8zpJrQ=; b=vK3910m0w6n35v1Wz9jkwsDt3t
	PrsiCWaCZdmiKHAHsqhbvlFAfwjEMy1OlMLHSMvZC9834TEIv8zRiLBdYxJ/Cq9QSlOeo2DwqBIQp
	TiYIa63HoNBmpiYJgpPtcFZBjixyuOxBRBqz2x8wiF9FiVUugnwynGmqD7HUJ/eWgQWqKVbdKJ0H5
	PxWvzSu4v1Ou0Xnq9sokSe90IV0igNsnlhgBC2703HEn1pRTdFgaNt1yiATd8iTD/mvFr6t9wIgjf
	thgEm7g5MD84plQkIqeUDc0ckIoydbMpwsciZhsyjNQzYG+U0pioc6cUKpL9I0gOFnogM4BdtbNTz
	5rxI2CWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnso6-00000009VrY-0glU;
	Thu, 05 Feb 2026 06:25:38 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnso2-00000009Vq9-0PzO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 06:25:35 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-8c655e0ee70so50734685a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 22:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770272732; x=1770877532; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F9Zw0XzlsqtrFcnvP0xl+A5lBqr0v+6APGOlL8zpJrQ=;
        b=G8VjDxB/+YqagqIpUB3ZXtXBBa2vyNXLijgIaOhLxzfpNHtNSI1BqwoMW2ZfANFw30
         75tlneIM1/n3rmp9Ulub0anPNB38wKth0MCj5m3fGJ9+Yaz+xWMqtj4cvhJvKYaF/bk9
         r6+fRvYSqAE4sfX0gqso5qOfuHZpiEHiHwTghcL+FYGBmU+3kf2tKpq5V6TazCbw2Mb2
         PUZFxrxZvxZDMfL+v+jp8PMryEYJSDa8CSPVZejLPWiVDd2lXg0nRXKAB1szmcyK40WG
         R7MWbUTpKA8GK1W38qEVA0P9+OrnZkpvaRZwN0KRiUGFTxPxTglszaLvs48qU5+EFljN
         iaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770272732; x=1770877532;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9Zw0XzlsqtrFcnvP0xl+A5lBqr0v+6APGOlL8zpJrQ=;
        b=fEyPZ+ClWKGUTchS9oZu0m6HroZwkjvVgZyjGcUfMRibc+8izKyRfMpkoxK5B0/Gg3
         FAXGZp7tf2Esp9QxhDCYpQ94O+sQsPtJW7bskLWIuv4SIWOkgjS6WqN8aYsJ0+rPbf6K
         JwLTvP4RLWli3cT0gxD1t5prMsy/0jv1DTI/KPWR8rUnfrug2u8my4PxdZ0FewfRZYtL
         gtHvl8s7w3zrrT2RJ+DMKWWj3GvUMN9cQuuU4JdTl5d/G8lwbazlaICgiix7wKYIkYHc
         57No5EK9uiKY1SYfqxgEYQ/YX29CeLkLdVXXfMXPBNUyeiPu7RDf/6sAT0MapYwz4Xk2
         jBkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX70Q7BDpPDFUCpdGmaHxzXLMPWXDoPIfQ7C/1KPfAtzagy0+5ZbLzu/oKZv8N2Yf3bEP9g72NREoTODVdWqf9X@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+R3s2IhSa+0ObyrNkg9hbX3i7fkow+fv1QAOUlAT0c0zvp+Rz
	yBk+soBazzUDX4BetXAsmH08lICVPSjRF67rviR0RCjqdS+M9PMU3dJl
X-Gm-Gg: AZuq6aIT6N1sPC+4mjtq2Re8fZHDI8+txi6A/jcwGARJ2k2XpeEh8fm/W09cCyQUUIQ
	E8hGYj3c9I63qorcWoIPx+gF/aIovWDO7lqO5MKWOmUeCZFzDpvuAJiluyPTa4oD+U3qlHBrfgz
	qIW23WU8Kwf+V1Ie1YLuMExUE1oa6LSwNcCbK4jEe9FC7KbF9dzdSd9ts/UMZVKq497tedEHXGs
	SC/hpwVH5OLYDRqrkRJWL6d5jcxAkfeWa1n1sDVVg2qIqv+mS+4itFi6nUelrWlERWoKZhoaIHi
	hQTv7dp1YqFNYdJzL9Tm9rbfkshS3vOeF55SzZlKZ87Nvd4PDaIaI0eO6nUKrLSwCgbVQlCo+z/
	T+ABbOO0eCjjJ/3f5pJQXkONBvZfGcHAhgX5/nVCW5Nyux+gK13Oi2TF1j1JPUnyeycTZ/x/3Pm
	QwURPR8LxlgK2uffHG77mOax/z/UR51Rs=
X-Received: by 2002:a05:620a:857:b0:8ca:407a:c331 with SMTP id af79cd13be357-8ca407ac3c3mr188804185a.84.1770272731372;
        Wed, 04 Feb 2026 22:25:31 -0800 (PST)
Received: from localhost.localdomain ([128.224.253.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89521d36589sm34824116d6.53.2026.02.04.22.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 22:25:31 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
Date: Thu, 05 Feb 2026 14:25:09 +0800
Subject: [PATCH net-next v2] net: ti: icssg: Remove dedicated workqueue for
 ndo_set_rx_mode callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-icssg-prueth-workqueue-v2-1-cf5cf97efb37@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMQ3hGkC/3WNQQ6CMBBFr0Jm7ZgyEBRX3sOwKDDARG2xLYgh3
 N2GuHX58vLfX8GzE/ZwSVZwPIsXayLQIYFm0KZnlDYykKJCkcpQGu97HN3EYcC3dffXxBNjlxe
 Ka32iNCOI49FxJ8sevoHhgIaXAFU0g/hg3Wd/nNPd/+L5v/icosJSn0vq8prKrL32Ty2PY2OfU
 G3b9gWnlNJxxgAAAA==
X-Change-ID: 20260203-icssg-prueth-workqueue-f460eba72132
To: netdev@vger.kernel.org
Cc: Kevin Hao <haokexin@gmail.com>, MD Danish Anwar <danishanwar@ti.com>, 
 Roger Quadros <rogerq@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Meghana Malladi <m-malladi@ti.com>, Jacob Keller <jacob.e.keller@intel.com>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 Himanshu Mittal <h-mittal1@ti.com>, Simon Horman <horms@kernel.org>, 
 Byungchul Park <byungchul@sk.com>, 
 Markus Elfring <elfring@users.sourceforge.net>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_222534_249633_C7559695 
X-CRM114-Status: GOOD (  23.37  )
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

Currently, both the icssg-prueth and icssg-prueth-sr1 drivers create
a dedicated 'emac->cmd_wq' workqueue.

In the icssg-prueth-sr1 driver, this workqueue is not utilized at all.

In the icssg-prueth driver, the workqueue is only used to execute the
actual processing of ndo_set_rx_mode. However, creating a dedicated
workqueue for such a simple use case is unnecessary. To simplify the
code, switch to using the system default workqueue instead.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
While addressing an issue in the cpsw driver, I based my fix [1] on the
implementation of the emac_ndo_set_rx_mode() function in icssg. During review,
Jakub pointed out that the dedicated workqueue for the ndo_set_rx_mode
callback might be unnecessary [2]. I subsequently used the system workqueue for
this purpose in the cpsw driver, and it performed as expected. Therefore,
I believe the same approach can be applied to the icssg driver. This
patch aim to remove this dedicated workqueue for icssg drivers.

Please note: I do not have access to a board that supports the CSSG PRU
Ethernet controller, so this change has only been build-tested.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=c0b5dc73a38f954e780f93a549b8fe225235c07a
[2] https://lore.kernel.org/all/20260127190836.6a420768@kernel.org/
---
Cc: MD Danish Anwar <danishanwar@ti.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Meghana Malladi <m-malladi@ti.com>
Cc: Jacob Keller <jacob.e.keller@intel.com>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Himanshu Mittal <h-mittal1@ti.com>
Cc: Simon Horman <horms@kernel.org>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-arm-kernel@lists.infradead.org
---
Changes in v2:
- Given the issue identified by the AI [3], squash these two patches into
  one as suggested by Jakub.

- Include the cpsw fix link and the link to Jakub's email in the cover letter,
  as requested by Meghana.

- Link to v1: https://lore.kernel.org/r/20260204-icssg-prueth-workqueue-v1-0-9a892f4b293d@gmail.com

[3] https://netdev-ai.bots.linux.dev/ai-review.html?id=02da18ab-455d-4d98-88bb-d8a975623c3f
---
 drivers/net/ethernet/ti/icssg/icssg_common.c     |  1 -
 drivers/net/ethernet/ti/icssg/icssg_prueth.c     | 13 ++++---------
 drivers/net/ethernet/ti/icssg/icssg_prueth.h     |  1 -
 drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c |  9 +--------
 4 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 090aa74d3ce7257ae52158b2ff9a2a1239bfcfc8..0cf9dfe0fa362b4ff986b6815952f95b79cb476d 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -1720,7 +1720,6 @@ void prueth_netdev_exit(struct prueth *prueth,
 	netif_napi_del(&emac->napi_rx);
 
 	pruss_release_mem_region(prueth->pruss, &emac->dram);
-	destroy_workqueue(emac->cmd_wq);
 	free_netdev(emac->ndev);
 	prueth->emac[mac] = NULL;
 }
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index f65041662173c1968f7e70dc4a3d897523f24095..0939994c932f5322eebbaa1b2fe43e20d3dca5ae 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1099,7 +1099,7 @@ static void emac_ndo_set_rx_mode(struct net_device *ndev)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
 
-	queue_work(emac->cmd_wq, &emac->rx_mode_work);
+	schedule_work(&emac->rx_mode_work);
 }
 
 static netdev_features_t emac_ndo_fix_features(struct net_device *ndev,
@@ -1451,11 +1451,6 @@ static int prueth_netdev_init(struct prueth *prueth,
 	emac->port_id = port;
 	emac->xdp_prog = NULL;
 	emac->ndev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
-	emac->cmd_wq = create_singlethread_workqueue("icssg_cmd_wq");
-	if (!emac->cmd_wq) {
-		ret = -ENOMEM;
-		goto free_ndev;
-	}
 	INIT_WORK(&emac->rx_mode_work, emac_ndo_set_rx_mode_work);
 
 	INIT_DELAYED_WORK(&emac->stats_work, icssg_stats_work_handler);
@@ -1467,7 +1462,7 @@ static int prueth_netdev_init(struct prueth *prueth,
 	if (ret) {
 		dev_err(prueth->dev, "unable to get DRAM: %d\n", ret);
 		ret = -ENOMEM;
-		goto free_wq;
+		goto free_ndev;
 	}
 
 	emac->tx_ch_num = 1;
@@ -1566,8 +1561,6 @@ static int prueth_netdev_init(struct prueth *prueth,
 
 free:
 	pruss_release_mem_region(prueth->pruss, &emac->dram);
-free_wq:
-	destroy_workqueue(emac->cmd_wq);
 free_ndev:
 	emac->ndev = NULL;
 	prueth->emac[mac] = NULL;
@@ -2236,6 +2229,7 @@ static int prueth_probe(struct platform_device *pdev)
 			prueth->emac[i]->ndev->phydev = NULL;
 		}
 		unregister_netdev(prueth->registered_netdevs[i]);
+		disable_work_sync(&prueth->emac[i]->rx_mode_work);
 	}
 
 netdev_exit:
@@ -2295,6 +2289,7 @@ static void prueth_remove(struct platform_device *pdev)
 		phy_disconnect(prueth->emac[i]->ndev->phydev);
 		prueth->emac[i]->ndev->phydev = NULL;
 		unregister_netdev(prueth->registered_netdevs[i]);
+		disable_work_sync(&prueth->emac[i]->rx_mode_work);
 	}
 
 	for (i = 0; i < PRUETH_NUM_MACS; i++) {
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index 10eadd35665045a98a0c0a639606b7c2691195de..3d94fa5a7ac10992d35fdb63458f8cb6eb3a5a22 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -236,7 +236,6 @@ struct prueth_emac {
 	/* Mutex to serialize access to firmware command interface */
 	struct mutex cmd_lock;
 	struct work_struct rx_mode_work;
-	struct workqueue_struct	*cmd_wq;
 
 	struct pruss_mem_region dram;
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
index 7bb4f0d850cc72d997e5ead38cf56f1dbc2355a1..b8115ca47082f9676067bb65c6eb3a441290fd7c 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -783,11 +783,6 @@ static int prueth_netdev_init(struct prueth *prueth,
 	emac->prueth = prueth;
 	emac->ndev = ndev;
 	emac->port_id = port;
-	emac->cmd_wq = create_singlethread_workqueue("icssg_cmd_wq");
-	if (!emac->cmd_wq) {
-		ret = -ENOMEM;
-		goto free_ndev;
-	}
 
 	INIT_DELAYED_WORK(&emac->stats_work, icssg_stats_work_handler);
 
@@ -798,7 +793,7 @@ static int prueth_netdev_init(struct prueth *prueth,
 	if (ret) {
 		dev_err(prueth->dev, "unable to get DRAM: %d\n", ret);
 		ret = -ENOMEM;
-		goto free_wq;
+		goto free_ndev;
 	}
 
 	/* SR1.0 uses a dedicated high priority channel
@@ -883,8 +878,6 @@ static int prueth_netdev_init(struct prueth *prueth,
 
 free:
 	pruss_release_mem_region(prueth->pruss, &emac->dram);
-free_wq:
-	destroy_workqueue(emac->cmd_wq);
 free_ndev:
 	emac->ndev = NULL;
 	prueth->emac[mac] = NULL;

---
base-commit: 0f8a890c4524d6e4013ff225e70de2aed7e6d726
change-id: 20260203-icssg-prueth-workqueue-f460eba72132

Best regards,
-- 
Kevin Hao <haokexin@gmail.com>


