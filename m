Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A5ECA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 07:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DsH0G6S1GKPGvSb0ocmL5fv+2ES1Y4yXt8zV4U+kiqc=; b=Me2JyckjWbhkKuJj+yhW7BN2IM
	AA9hFyiKLmTUB/HaRxD8NZVBsQYHo0jjHJyMC+UvnVy1YKiaE3CoT8q86+6pHId4EG72C52Btcz/W
	WPOCSeLwpOMSsh4bTWPZi32aJwmSuhIq1x1wYu8NKLrezt4iRqb0ox/JH7QRNxF0UV8HcB29jWYyn
	1ZMU1E072buscMpkqInEzb8HVi7u8LlFZsAa9U+lS3YDCNBSxggam6AMZkstsvaLZPsg/2qsEWszu
	fKFhtlJIKrUgfmUYy+VIW6BG2d1lIcqHtqEUZGJdtiBNFA1EUkdKra8BUC/YPLMJdUDedhEMuar0Y
	unKp+M+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzGI-00000000Asa-13qG;
	Tue, 06 Oct 2026 07:06:54 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzGF-00000000As8-0BnT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 07:06:52 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-82395ae2ea8so2502488a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 00:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791270410; x=1791875210; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DsH0G6S1GKPGvSb0ocmL5fv+2ES1Y4yXt8zV4U+kiqc=;
        b=cZo9947fZIaQCdoQ1Pb0Gy5126uWs050NWvvFdd9ybIWvsajTQucxRL4iDsmhrchU1
         76Da3nt6t5NPEfJZnxB7Qs7CZScH7NyrCXl8R3XyydZIjlx9wdexGpv3wVWT5YuNURET
         ndXXmR9Zoe3FG2Js1pKCrrN8cqZVW1VRvfm33CbrBAm/dRveNwiDuP9xkWvG2tZk/DhO
         ApLByqYE/rlfhKW4SOVBcrlGUOObHtP7pla6tP/aS/f9L6TTRr/bRaoIw1kzT1Esr+I9
         S6QJTFIe6inLBdq8e/FKQA7YkcEl19botnN4HgDF6eN7WLg+uYKv9DCIH3JKJz4xPoA6
         d0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791270410; x=1791875210;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DsH0G6S1GKPGvSb0ocmL5fv+2ES1Y4yXt8zV4U+kiqc=;
        b=hUzno4114jDok/WtyLewJA4/ZVw8S1/kEbLPmEC3kqQCMeG9TWkr1kVoMGbf6QBSV3
         Bee5cVJPQkokxKN6dru8HdDpY+c4D/xHQOiOxzSBlaW/hV8UHKGEoW29EHu5OaZ4vxGE
         BwpSCcnGM52bzQTvv3pGq0f66kDTjJ1Tk7FCOXLAFDvo98DAZ3X3bw73YomdtqAEl3jD
         SC16QObjj9mmGDwOwJEjncrsL6ZeGMZpB5ksOgsMYXDJ2FOdQ/3TAq7x20t8cFjaS0Lg
         BNkHmO6KNJFt6kkl4pf+wj8pw1qMQJD3OYZpJQZ8fn507CmxKSneGPYL2FU3xXLzoPkI
         Ufnw==
X-Forwarded-Encrypted: i=1; AKwUvBz5s0gm5Df3U92WLeNPJV4rtKpRBdqqasd5bGPK07pJSaNWwq0PerzH2v1Moq2YsNC5IMMJ+eOibcEdHzgB+ZRP@lists.infradead.org
X-Gm-Message-State: AFuF++nwJkBrTwRcREQ8WLkOPGnuvJnuqCrG88U2WJShEu6fTOYR1V8R
	XzOqn7QF4oOlbSHcx8l0kBVBlPFP/211/nwMePklrEXqrSOcLqGC8ZzS
X-Gm-Gg: AYBFou09nDY/NxsfDg9wUyporP+TxkLEC4Ok8VNFTezMVVODMgU0gtYkPlsIyy3UfV5
	/7JzYPCTIhUwFkOWO0LsrCWmPRm6ouDaJiXGTAcbQJaUR2ekECQDroJkAPMTiRR5twjV2EDpRM7
	aSnWT4IXYCCYd7KLm4P5IPG26sH5qU3c8Pe4HoCFcyZWOiMUlPIKUpwyD415ajr8k7uzl/gb7O1
	6lecIUpeDyWMze3lFxTw9OBzmKEaEIus/TL2Bn6fR8tInXiazEw/amoA5GrJ9Yl6itubVj8R7Oy
	yAYXUyaZlBeYbMBs7TGg3X5PnKAuVuFFStFIKbV4rl5h+Bc7EaGxx33rZsvW89GmozR0h78b6Pt
	FEzrDuQTMUGFzu2Eiec9qAn+Ki/+5PGFzFzmTLjEvOeAxfLGVkKSG+T3hW/7BEsnGy0G66X32Ff
	hSnbjO/xvR05mzisvMJSwg0PREACI49K3rQPx4oQBUhUk9lGfolZ3YfX2R+RwwvZvhQiED7a7QE
	1Pj3u+EEELmeS2UtCBZcLunu6OStxIOuXT5Bi6SCmKqWGjkATHixs63l2ovp4mVN4PCB50/Juvj
	WXeUmfudKdzFTbNCS5GdgT8xIYiYSFXPE9kl157j517CS3euWkFDi0TMj/3cy4hz1KMtKEzbaK2
	eZUsdjOz46dyvUhY/pJfODA==
X-Received: by 2002:a05:6830:918:b0:81f:1790:6ad8 with SMTP id 46e09a7af769-823fe60d648mr10940977a34.31.1791270409780;
        Tue, 06 Oct 2026 00:06:49 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-828209a9efbsm1939854a34.21.2026.10.06.00.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:06:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 06 Oct 2026 01:06:48 -0600
Subject: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OwW7DIBBEf8XiXKoFgoGc+h9VDgveJisVuwHiJ
 or870Vuzz3OjObNPEWlwlTFcXiKQitXXuYu9Msg0gXnM0meuhYa9AjBgKwtZ0ySy1Xe5m+eJwm
 R/BhAjcZPove+Cn3wfWe+i5maOP2aha63zm9/ScRKMi05czsOk0UAF0M8WJeCshgVWqO1Ix9Mo
 AMojxgc7qwL17aUx/55VTvsn3urkkpC8gjWuFEl93bOyJ+vfVqctm37AaB4rr0DAQAA
X-Change-ID: 20260930-stmmac-irq-unwind-0be86901638d
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Serge Semin <fancer.lancer@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 Nicolai Buchwitz <nb@tipi-net.de>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_000651_118559_4015D48F 
X-CRM114-Status: GOOD (  12.15  )
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

The safety IRQ is requested after the MAC and optional WoL IRQs. If its
request fails, stmmac_free_irq() frees the unregistered safety IRQ and
leaks the WoL handler. This can warn about an already-free IRQ and make
the next open fail.

Move the safety and WoL cleanup labels into reverse acquisition order.

Fixes: 5c2215167d12 ("net: stmmac: Add driver support for common safety IRQ")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
---
Changes in v2:
- Drop the claim that later per-queue IRQ failures also had broken
  cleanup; those paths already released both IRQs.
- Add Nicolai Buchwitz's Reviewed-by.
- Link to v1: https://patch.msgid.link/20260930-stmmac-irq-unwind-v1-1-0c8a053761c7@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b837e8e27a35..0403d434c9b9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3799,13 +3799,13 @@ static void stmmac_free_irq(struct net_device *dev,
 			free_irq(msi->sfty_ce_irq, dev);
 		fallthrough;
 	case REQ_IRQ_ERR_SFTY_CE:
-		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
-			free_irq(priv->wol_irq, dev);
-		fallthrough;
-	case REQ_IRQ_ERR_SFTY:
 		if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
 			free_irq(priv->sfty_irq, dev);
 		fallthrough;
+	case REQ_IRQ_ERR_SFTY:
+		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
+			free_irq(priv->wol_irq, dev);
+		fallthrough;
 	case REQ_IRQ_ERR_WOL:
 		free_irq(dev->irq, dev);
 		fallthrough;

---
base-commit: d5a007b9b457c915ab1a53227e8939e4018aa97a
change-id: 20260930-stmmac-irq-unwind-0be86901638d

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


