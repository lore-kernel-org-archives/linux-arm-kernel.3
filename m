Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20959C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 20:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MYe7aSMySa0ucT08nhb3OZlqYbxJUD++vh68yJRzj6M=; b=Xmi096cOgp3cUiS5jFc75ejgTv
	HHjSRZK9i/Mn8diLYcIP9r/8LzLFPd0aUSKpPGdMuyERQrqzOLcdYNjwXAlHTo+KguapNn7z8b51u
	b3eZvZ4QXda9hXvExehhEoquXS22RglBz7YB5eHdQWguX4Z25hlfnktKzayD3x+ipgb4+j98h9TtE
	J+B7xg5SFfjaOVKnymdbnjQtmuyw1V+M07A4CQ/F/aYCGNA2UuLkM2QL019zHjhuOAa/kDguPX6es
	Ldj45lCoDiguzvPyanOJcj7riClBxQy2ihaV24ZNYTOvJTnRCijHjFwL+LmtUQ0t14z99fJhrPa05
	kd4ufb1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFf21-00000001mNj-36qr;
	Thu, 15 May 2025 20:18:17 +0000
Received: from smtp-17.smtpout.orange.fr ([80.12.242.17] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFekL-00000001kBV-3Qwx;
	Thu, 15 May 2025 20:00:05 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id FekBuCN6oIqMPFekCugnJy; Thu, 15 May 2025 21:59:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1747339196;
	bh=MYe7aSMySa0ucT08nhb3OZlqYbxJUD++vh68yJRzj6M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=E7BM5X20UrwkEoUQAe0akEYh/tAT6ODI+2Oc/9Zi6/yaf7wCBUufOmzwAsAZhcbZR
	 9EgyqFCZ22tONOH0iqWDXw9v1xOKD2p27aOT2oJRtZyqOnQF/TZNzH1upW5SLFaoO1
	 nASJ0dTx9oSlX1a/qPD2FvxfClJHSu5nQrv4N8Y+DCe4WJ04jvjw9dq0Bp2htyYABD
	 SMqiEpVPcKXnGIdWS7RiOdM/6YjXCd/nhWE2sHCifxJkoF5sbjjKWXCre8JtDyCs88
	 K35SYFUK6ZSLXgkFs4pvltoWu6X9uv4WsQNzgOzUArPzmHb8wUNjN+HWdPdwallz5B
	 nJ6Cn7upIXDGw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 15 May 2025 21:59:56 +0200
X-ME-IP: 90.11.132.44
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
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH v3 1/4] net: airoha: Fix an error handling path in airoha_alloc_gdm_port()
Date: Thu, 15 May 2025 21:59:35 +0200
Message-ID: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_130003_058552_36196AF1 
X-CRM114-Status: GOOD (  11.86  )
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
---
Changes in v3:
  - None

Changes in v2:
  - New patch
v2: https://lore.kernel.org/all/5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr/

Compile tested only.
---
 drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 16c7896f931f..af8c4015938c 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2873,7 +2873,15 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
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


