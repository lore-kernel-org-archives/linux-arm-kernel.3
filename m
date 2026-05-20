Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7FACD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=33OqFd8g72qHJlgMt7tJeKJrOpeLXL7bOsaTmhD+TmQ=; b=KzqzH03qi6GaF95/o+AAczR89W
	Qtv1DxLz8S714PsIm0L+4RY62U0hSDJWwPX7j4x42dU9ipbLsiwhBXuJtKRSSExTH8n0gAX1TIf0l
	9lAk4j9UxiqhtI8vnapbuQZTwxjHW/AKEOEys8JgcBgegc8IYpMJAg3Ft37czY9thxPVa52UnNBxH
	Rkull06qiJdIZ77WrhhPLeomYlnXXmUBkgUhT96+YlSm7sY3nb08t9feBnMqhItZk8DglNt5NMf0C
	9OapaxZAoSfd001j80qil6kMLTPH8n2ssalQKhIXZ8vAm2GwduZyLqXxXowGT40GQ3y3Lr1HpS2y4
	GEBFp0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhrK-00000004njg-1IqC;
	Wed, 20 May 2026 14:25:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhrH-00000004niu-3ru3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 14:25:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E875D44408;
	Wed, 20 May 2026 14:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC46CC2BCB0;
	Wed, 20 May 2026 14:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779287114;
	bh=BnMsVWcwl4AFbezmgy6BVdcgEuOZPKK25nQ5D6YYan8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=FSTivjF3qnEkoR4a1VMkETSnoNUlSeaOa7nZBdulljcMl8yjnG8G0K2kLzisnfyHI
	 kz0DjDQQ7ekIvdzVztIWZ865sGO70Tru8z4GZPtd0sx1EYXQZWY8KUEiZemX8xUarX
	 7iy9iNrepnMR53XQh4D5ygqb31zp/nNQRHh4AUk2p5zU0cRRn8Zo7l4iEE6KfctLvW
	 CfkAaLFIjzYVriCClpQPwssIwcPGu1YbcbLyEBXo7Uyx2yt0Tcbyyw9BybNfXMq4lZ
	 DRWZXEXpPkjfqQadgn5Wepak5Ew7LtZfzMHGhdQttgmD1TTGCiOfWWjXJ9vq8ig3w2
	 9l6bDmCOSWY3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD48CD4F54;
	Wed, 20 May 2026 14:25:14 +0000 (UTC)
From: Abid Ali via B4 Relay <devnull+dev.taqnialabs.gmail.com@kernel.org>
Date: Wed, 20 May 2026 14:25:12 +0000
Subject: [PATCH] net: stmmac: mmc: Remove duplicate mmc_rx crc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-xgmac-mmc_rx_crc-cleanup-v1-1-7133f529859f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEfEDWoC/x3MQQqEMAxA0atI1gY6BUXmKjJIJqYamFZJcSiId
 7e4fIv/T8hiKhnezQkmf826pYpX2wCvlBZBnavBO9+7zjssSyTGGHmyMrEx8k8oHTtSYKE+EA3
 0hZrvJkHLsx4/13UDz9N5oWoAAAA=
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abid Ali <dev.taqnialabs@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779287113; l=1169;
 i=dev.taqnialabs@gmail.com; s=20260425; h=from:subject:message-id;
 bh=utjrD6shew6tFykTsrj0bAnoJoit1s0RWNNHVzKqLU8=;
 b=NXVGghpu3DrYDgU1IEKAByx2WJBLoEnBEgQZdMPa5C1VCDN5XDktpigly5SEq3LSFM1EXKlCn
 ZO/KUbnUElnAF4ecknXrNJjeTn+7H0lnAzl2cm4akf7MlUABjM4th4k
X-Developer-Key: i=dev.taqnialabs@gmail.com; a=ed25519;
 pk=4Syx51HH/MOySSUpi79M2ToLOdwt1yiNb338eKZBJNk=
X-Endpoint-Received: by B4 Relay for dev.taqnialabs@gmail.com/20260425 with
 auth_id=752
X-Original-From: Abid Ali <dev.taqnialabs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_072515_990081_6B35460A 
X-CRM114-Status: UNSURE (   7.96  )
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
Reply-To: dev.taqnialabs@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abid Ali <dev.taqnialabs@gmail.com>

Double read of mmc_rx_crc_error in XGMAC is removed.

Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/mmc_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
index 1b3b114e7..d81581dfa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
@@ -479,8 +479,6 @@ static void dwxgmac_mmc_read(void __iomem *mmcaddr, struct stmmac_counters *mmc)
 			     &mmc->mmc_rx_multicastframe_g);
 	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_CRC_ERR,
 			     &mmc->mmc_rx_crc_error);
-	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_CRC_ERR,
-			     &mmc->mmc_rx_crc_error);
 	mmc->mmc_rx_run_error += readl(mmcaddr + MMC_XGMAC_RX_RUNT_ERR);
 	mmc->mmc_rx_jabber_error += readl(mmcaddr + MMC_XGMAC_RX_JABBER_ERR);
 	mmc->mmc_rx_undersize_g += readl(mmcaddr + MMC_XGMAC_RX_UNDER);

---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260520-xgmac-mmc_rx_crc-cleanup-afcea6faa8ab

Best regards,
-- 
Abid Ali <dev.taqnialabs@gmail.com>



