Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FA7C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 07:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zu3Rr90y+tiM/8UlA4hAOXkaFy8wswdz0HsN6oicuAI=; b=FSHKuB55Hfn3IQ95kjkVwwprk3
	mk69+2nj9Dr86uUzK91eMz7FKqalOIoiQ/yGTCw0O5CFKFrNBCwU5RXT/qv+NDeQ/6LZXQil49ADa
	zx5Jy5Ne6tR3/ZlkLR5IKw5LB9lGVLYhrGMvFjU2JkFQzmnNwDbSbW0ObIE2ClViFLpzZqZRRPQvy
	Eg8oREEPyBFZGngv7vUbJgUgzG34fX+uOi0x5L6Hamjsamv6csLt8n5fw3kMOPCDHTdUHbGSmLzwj
	yYN8DFF973WAj7iXxgj661JwitYB96/XlRpDS9jQ7jzNr9PMadXirLhxG15aKBipmzGHh13MtCmUg
	saMwZnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIjMA-00000005ROd-1UbH;
	Sat, 24 May 2025 07:31:46 +0000
Received: from smtp-78.smtpout.orange.fr ([80.12.242.78] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIjK0-00000005QuT-3sUa;
	Sat, 24 May 2025 07:29:34 +0000
Received: from localhost.localdomain
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id IjJtuiv3wVLIhIjJtu03o1; Sat, 24 May 2025 09:29:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1748071767;
	bh=Zu3Rr90y+tiM/8UlA4hAOXkaFy8wswdz0HsN6oicuAI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=M2xlF3EbgDjP+m9zcGtmTntP7L6mbLUqQBpHne6e435s2uUnBR3w6T2k2JWT344oO
	 3UTgq9e0u/oJUn8f66BhmWNQNlgxRR3dWpd60Wc4CdnMPn0QaWLJqUpfVXZxGY7xMR
	 1WJLsXo/t/EqcQCRgibLgjg2uBiBZT0QTPtGC9CTZdkyaCY7dmvSCEzH+2/Ih1lgLk
	 OvMv4awXIjtr2HV3iVfPQzCNoDSG/U6AZYIgxHx6Vhf1LNMw3ErvJO4eVDCL2AJjfS
	 N6A6K73uC2JJBQrC8B4QHNiE0Ihb+qWtyONpWDMmAz8aGkvy9UhY4JXTrXT1TncirF
	 PPvdEzTZAekVw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 24 May 2025 09:29:27 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH v4 net] net: airoha: Fix an error handling path in airoha_alloc_gdm_port()
Date: Sat, 24 May 2025 09:29:11 +0200
Message-ID: <1b94b91345017429ed653e2f05d25620dc2823f9.1746715755.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_002933_370469_4EC584EC 
X-CRM114-Status: GOOD (  13.30  )
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

If register_netdev() fails, the error handling path of the probe will not
free the memory allocated by the previous airoha_metadata_dst_alloc() call
because port->dev->reg_state will not be NETREG_REGISTERED.

So, an explicit airoha_metadata_dst_free() call is needed in this case to
avoid a memory leak.

Fixes: af3cf757d5c9 ("net: airoha: Move DSA tag in DMA descriptor")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Reviewed-by: Simon Horman <horms@kernel.org>
---
Changes in v4:
  - Add A-b and R-b tags
  - Rebase against latest -next (because v3 now gets "Hunk #1 succeeded
    at 2869 (offset -4 lines)")

Changes in v3:
  - None
v3: https://lore.kernel.org/all/5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr/

Changes in v2:
  - New patch
v2: https://lore.kernel.org/all/5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr/

Compile tested only.

In the previous iteration, this patch was part of a serie. But it
should be related to 'net', while the rest of the serie was for
'net-next'. So it is resent as a stand-alone patch, as a v4.

---
 drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 16c7896f931f..af8c4015938c 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2869,7 +2869,15 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 	if (err)
 		return err;
 
-	return register_netdev(dev);
+	err = register_netdev(dev);
+	if (err)
+		goto free_metadata_dst;
+
+	return 0;
+
+free_metadata_dst:
+	airoha_metadata_dst_free(port);
+	return err;
 }
 
 static int airoha_probe(struct platform_device *pdev)
-- 
2.49.0


