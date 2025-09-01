Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B88CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Buk597jvrgQ2xs9epW7IszzJTNW3HheS0YxncjEWE5o=; b=bGbkW54e5Tu7L4wUMfkkwtk9LY
	AXiQ+iHxjcEFS59qZQJOlh/m59ZGf3x920rAnpTJJwuoqBNHSdjM5MqC14FJI1jh71B7cez1RjFjV
	uM0Cm/hVO7Axy/esFqhxCbD9btpBmwVouXXOIYOlw+mnWhUY31nMpvsqUYhMosrtC5rkC1FuTLSkG
	fyueE6z2F834tKF9pijdlYbTtaR8tTqQUG7gX3LxBNS0kkl9YMmkzDSI0Ov6avQztIZzl7wLcwneP
	5V8SV70smj+MzIGJrgQsfjm+caDlOVXA+ExObP3jNaDH4BlI5AzBALaVECW0+ypuGNBWuaN9QXPkt
	pygfUvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFH8-0000000EZpe-0oN1;
	Tue, 02 Sep 2025 00:53:30 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utC6f-0000000Dyq1-3WKD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 21:30:30 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77256e75eacso1416487b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 14:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756762229; x=1757367029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Buk597jvrgQ2xs9epW7IszzJTNW3HheS0YxncjEWE5o=;
        b=mxYYb5D/V9fk04gIVPnB4L6q7C9NVycuoMBWWTdyC+6axokNM7hIQ3g9ynRtcNOtpq
         2Ts8PtmwYmLNpHp8DMEP9G/o36bkyqWHf9MLcCLO4JQxSA/vsSrpYLO9ArIa/Pn5XrU9
         8+aAZFvZ7zaGh7n3F17Qutg1eak+a5T6d5RnIur8lQZuuCdN71vTEFtGIugysuVYM951
         ZRJELB2ctWqs3Pbta3CEc7sf1gcqGG5IIFjoAl0jZxTolMBIqRs9L0TBBfBGCO0mdqYQ
         WPsQAZA69LLi3t0dppL+h1H+lZZaMYPY3FMxLYdBrL3T56VlyuXlZkK+XYdgyDNoUTjQ
         KWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756762229; x=1757367029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Buk597jvrgQ2xs9epW7IszzJTNW3HheS0YxncjEWE5o=;
        b=qK2osY7IitGULqLFn13ZiU+SgUTcE3Uebwdk7bUvzaUlu/MwzfNlsvWDUpf8oLeL+E
         ssE4nmtDAFTuzBXDbebRNILmk6Oq0pR4LGkFGKwAd31q8s7y5mZs2RKXj/WwqqXFNsJY
         X/4IjqDqF48+VFQ28tTCeIhVhr/CNdg9/FcHe+n94vnCFBNYgDtmLuxj2UpK8ULwTCU/
         xM9w72nlfr41a7NLK5UucQG+Ur7/80ZhWYOnxfBVSYiu3yVEY5m+u6RDMfdwUNlkZphT
         SjTU6LTExWSoDCU+V4OCdB7N1RwSBotlegutpevasWtxeL2rX2BRmMeQg6Nyapq8iktR
         I8EA==
X-Forwarded-Encrypted: i=1; AJvYcCWT8ptlBPhZTeetqOLW0pbsCCSOmZTH9m1yc5840gzxqo7qU2dj+ukcGJEdRbz2PobYwtpDIXT3Bwqaw8WMmswX@lists.infradead.org
X-Gm-Message-State: AOJu0YxHG4cWqTDxaLdEKN8/qWFeoEz5ef5u1gwB3llHbGRKtyDpqMSb
	S2Su74393SE/QBoInNhgCR13HEUfH7uz9sY/R0tPZzHccZaC9Tx14wPM
X-Gm-Gg: ASbGncu+6eLH002MO1peSFsXLiC5BXHMmc32KffeVhQCZX+6ZtkzlHVjpFGv3/o2oDL
	KZK6HEtfRfoR5TOlZcI2ApZgv2whU9Yh3vvQ/7Ek8dwaPsANNHsXlDlVIo1KKMWvTWBHDxRcpYk
	9QUyUlMtmca5nl1WyZ5WGYVdqVCJU7MwvEJp81F+DlCNgbNMef2rvXdTs0a0fUDXuzF5v9be974
	w6WrjO2daT23BXfyCvOXBGoWH4+9f0OYRnKsuAhgh0x7x2nn43m/zPccz1LVcg0ZrPM01JMYGYU
	12Boo8mswaR4okrjl3Q38WBm/v/Q64RQ86lSWGDzhDkdaalTTKc6JPuvJawKvGD7fWY8bLA3a5F
	H1UaX2+c9g+4uMJq8HMbrdJ+zMG/pF1W1Und/WSB5rxsZBzRBEWQP8Y3R4PoHc/8YSbL99HUdrm
	Co1RLK4w==
X-Google-Smtp-Source: AGHT+IFN3sRBrYv7sa0/dX4BXu8HUXYGyswj8+xHvnww0Gcrn6J3aKcCx0FqnyXWEbmGXU3N6SSy4g==
X-Received: by 2002:a05:6a00:8d4:b0:76e:99fc:db8d with SMTP id d2e1a72fcca58-7723e1eee4amr9456360b3a.3.1756762228931;
        Mon, 01 Sep 2025 14:30:28 -0700 (PDT)
Received: from archlinux ([2601:644:8200:acc7::9ec])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a5014desm11594055b3a.92.2025.09.01.14.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 14:30:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Daney <david.daney@cavium.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/CAVIUM THUNDER NETWORK DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] net: thunder_bgx: add a missing of_node_put
Date: Mon,  1 Sep 2025 14:30:18 -0700
Message-ID: <20250901213018.47392-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_143029_880740_F2E52CE4 
X-CRM114-Status: GOOD (  13.43  )
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

phy_np needs to get freed, just like the other child nodes.

Fixes: 5fc7cf179449 ("net: thunderx: Cleanup PHY probing code.")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../net/ethernet/cavium/thunder/thunder_bgx.c  | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index 90c718af06c1..9efb60842ad1 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1493,13 +1493,17 @@ static int bgx_init_of_phy(struct bgx *bgx)
 		 * this cortina phy, for which there is no driver
 		 * support, ignore it.
 		 */
-		if (phy_np &&
-		    !of_device_is_compatible(phy_np, "cortina,cs4223-slice")) {
-			/* Wait until the phy drivers are available */
-			pd = of_phy_find_device(phy_np);
-			if (!pd)
-				goto defer;
-			bgx->lmac[lmac].phydev = pd;
+		if (phy_np) {
+			if (!of_device_is_compatible(phy_np, "cortina,cs4223-slice")) {
+				/* Wait until the phy drivers are available */
+				pd = of_phy_find_device(phy_np);
+				if (!pd) {
+					of_node_put(phy_np);
+					goto defer;
+				}
+				bgx->lmac[lmac].phydev = pd;
+			}
+			of_node_put(phy_np);
 		}
 
 		lmac++;
-- 
2.51.0


