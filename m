Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BEACCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TadWLUGO9wZq/9F37BtuY/ph2LiackkZKNTrWCxt6gI=; b=AWsRarWXOEHkG5iZ/GrPb8CMwB
	/DL1n2uGvKZgiCBHYZsWLXWvV994iuHEjVvul52HE6molMYpdHpGngWVBWp1IKFgH+V+7T1WbOjZP
	0FM1hp2nqq17bhXbBEkFtD0yWaz2T11v71icsa6OqBFwgYEo+lRbjQfd0j8mUSaUt3yC46QTPlaBR
	LYDkTesVWqsph+1mU9EFeNV+2bPypi6JxZv22LIB9/4kOHqO9G9IsVrQYX7KzfKTUcJWLXTcDbLMK
	nV9GZS1Dg5GgapBV6Ewbhk1l9aSskh5t+bL+BLRQJgTDhzuhZ8ZFfGo6mKVf8rPBhG4Hi8efFMA4i
	aWAuriOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6QSq-00000003Z5S-1q3U;
	Wed, 08 Oct 2025 09:28:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6QSo-00000003Z5J-49KB;
	Wed, 08 Oct 2025 09:28:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D73261EDE;
	Wed,  8 Oct 2025 09:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B0CC4CEF4;
	Wed,  8 Oct 2025 09:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759915680;
	bh=RC03KKut/tFuLMRGV1rLueDM9whbJfJ/nYBgSVrijaI=;
	h=From:Date:Subject:To:Cc:From;
	b=j3MA+Gp5znabotZ8h7cH079Ei8Vdc0RhbxL2qLaP5EttGXqQc+G7DmIhYPpIn31ps
	 55NF8WFaLMgpFlMROe0Tl9DGKDB49pSRQ6OZa0sr50ScTM3aMTFXO/PcT2fGubkK6t
	 g0x4MgUdE4Y1phFhBDrkIcBj75BLk6Kzxle1Ci14PqRfx0gj18NQrHOJjSoUtc0SuG
	 M7pKeFyTKEpM9DEqJkrnGAdXxhACMpkhworVSE0g8GyDOHSJ2weQ0ubGmEznTpBB+i
	 XZ3UGgtMGg0Eta5iEh01cfc7cpR7qCUH3IKbulXniVLqpMHF1+UErv4gTzA8tjL8QQ
	 F6CfjkFcqk0zQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 08 Oct 2025 11:27:43 +0200
Subject: [PATCH net v2] net: airoha: Fix loopback mode configuration for
 GDM2 port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-airoha-loopback-mode-fix-v2-1-045694fe7f60@kernel.org>
X-B4-Tracking: v=1; b=H4sIAI4u5mgC/4WNQQ6DMAwEv4J8rqsEBLQ98Y+KQxoMWNAYOQi1Q
 vy9ER/ocWe1sztEUqYIj2wHpY0jS0ghv2TgRxcGQu5ShtzkpTWmRMcqo8NZZHk5P+FbOsKeP1i
 4uzemqIytCdJ8UUr4VD8h0AptgiPHVfR73m32rP6bN4sWu+Tt65vzfV01E2mg+So6QHscxw9Sm
 pBdxgAAAA==
X-Change-ID: 20251005-airoha-loopback-mode-fix-3a9c0036017e
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

Add missing configuration for loopback mode in airhoha_set_gdm2_loopback
routine.

Fixes: 9cd451d414f6e ("net: airoha: Add loopback support for GDM2")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Use human readable marcos to configure loopback mode register
- Link to v1: https://lore.kernel.org/r/20251005-airoha-loopback-mode-fix-v1-1-d017f78acf76@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c  | 4 +++-
 drivers/net/ethernet/airoha/airoha_regs.h | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 81ea01a652b9c545c348ad6390af8be873a4997f..833dd911980b3f698bd7e5f9fd9e2ce131dd5222 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1710,7 +1710,9 @@ static void airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 	airoha_fe_wr(eth, REG_GDM_RXCHN_EN(2), 0xffff);
 	airoha_fe_rmw(eth, REG_GDM_LPBK_CFG(2),
 		      LPBK_CHAN_MASK | LPBK_MODE_MASK | LPBK_EN_MASK,
-		      FIELD_PREP(LPBK_CHAN_MASK, chan) | LPBK_EN_MASK);
+		      FIELD_PREP(LPBK_CHAN_MASK, chan) |
+		      LBK_GAP_MODE_MASK | LBK_LEN_MODE_MASK |
+		      LBK_CHAN_MODE_MASK | LPBK_EN_MASK);
 	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(2),
 		      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
 		      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index e1c15c20be8e13197de743d9b590dc80058560a5..69c5a143db8c079be0a6ecf41081cd3f5048c090 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -151,6 +151,9 @@
 #define LPBK_LEN_MASK			GENMASK(23, 10)
 #define LPBK_CHAN_MASK			GENMASK(8, 4)
 #define LPBK_MODE_MASK			GENMASK(3, 1)
+#define LBK_GAP_MODE_MASK		BIT(3)
+#define LBK_LEN_MODE_MASK		BIT(2)
+#define LBK_CHAN_MODE_MASK		BIT(1)
 #define LPBK_EN_MASK			BIT(0)
 
 #define REG_GDM_TXCHN_EN(_n)		(GDM_BASE(_n) + 0x24)

---
base-commit: 1b54b0756f051c11f5a5d0fbc1581e0b9a18e2bc
change-id: 20251005-airoha-loopback-mode-fix-3a9c0036017e

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


