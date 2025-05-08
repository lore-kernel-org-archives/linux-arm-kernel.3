Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63191C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wv0gFF8cjp95WfH6O3Ya/mrYzGv/I0yS3WPyMfk6Brg=; b=txWRkssnn8hRYnUygJAed0RP6L
	kbmI1T8xR+UN9JepXmfO/eOv6KKosrBobE07sv8UcmfphDysM/qbQj5g5QewZHYohJzum5UtDSs2p
	UaRPWZWlrRDWVnwedsnhR0U0xCBuyQ1oWKDeRwyVWPFejnW9CBNDc2okI9WcFvJP+ENFNYXxhDjg6
	nTMOjmEkiHqhjOMCzCHQrWYy5E+tnDwl43uayvvyb2QAQdpW5ztwwfY9raf3AI/wj76EornTSDeuQ
	MY63H8SaM3ARp4y5WNj0uyDTBjPSZ8YR9dZglSbsHkgHqHoqVJtpgZe3oEU3lLBPFdL3mxryGmov6
	VcD/rR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3EW-00000001968-0gNV;
	Thu, 08 May 2025 15:32:24 +0000
Received: from smtp-75.smtpout.orange.fr ([80.12.242.75] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2ch-000000010Fx-3RnT;
	Thu, 08 May 2025 14:53:20 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id D2cYuomdl816KD2chuwCl7; Thu, 08 May 2025 16:53:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746715999;
	bh=wv0gFF8cjp95WfH6O3Ya/mrYzGv/I0yS3WPyMfk6Brg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=pu5pjZTDSnmp0qso0Hk3SEed2asw3XttZ7HJHAHaP6vC+ctFHmgBFaNJiHioxbe8M
	 P+5LSgtiH68FxbU0PmdZJ9Sm4eJlLbqi0SHUtHmEOsfGXtGVc74s+ApyMPGlLxwu9i
	 t+xt59oHMhRO8lvnh6HvNrx30QP/ym0t+gjt5j/EkHkB9X8+Mnf4C6f+u+bDHN8bCZ
	 nLyG/SWrTVW+LT2lLzq/feEMwt9dJRCgriFHY7mZJ2pt3nYQok0gWHQ734V/XKp43w
	 NPABeWQ0CyqEICvykLofJZt4NJbI05H58kjeuuyeUI1YjQaGILFw9VhfQ3fjlPgNLw
	 7DRBVV8A+4jeQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 08 May 2025 16:53:19 +0200
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
Subject: [PATCH v2 2/4] net: airoha: Fix an error handling path in airoha_probe()
Date: Thu,  8 May 2025 16:52:26 +0200
Message-ID: <3791c95da3fa3c3bd2a942210e821d9301362128.1746715755.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr>
References: <5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_075319_997208_B000D06E 
X-CRM114-Status: GOOD (  10.17  )
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

If an error occurs after a successful airoha_hw_init() call,
airoha_ppe_deinit() needs to be called as already done in the remove
function.

Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Changes in v2:
  - Call airoha_ppe_init() at the right place in the error handling path
    of the probe   [Lorenzo Bianconi]

Compile tested only.
---
 drivers/net/ethernet/airoha/airoha_eth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index af8c4015938c..d435179875df 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2967,6 +2967,7 @@ static int airoha_probe(struct platform_device *pdev)
 error_napi_stop:
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_qdma_stop_napi(&eth->qdma[i]);
+	airoha_ppe_init(eth);
 error_hw_cleanup:
 	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
 		airoha_hw_cleanup(&eth->qdma[i]);
-- 
2.49.0


