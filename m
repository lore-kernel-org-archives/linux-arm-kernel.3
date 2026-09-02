Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FEEC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 21:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6zMLlM2fX1xLcX/WTGlvxUY5Z2fLG31XCRQQllFSHGs=; b=xicHxypxKN9zNBHJho1yva9URb
	PLhFrv4v/X7wUHwD91cvnDzLQnGqtCDu8tE5clO4epGJS/M1H/5UNAU/c65BBXE5xYu5/LuKFNL4n
	aNEnLXbHw7g8B9JboEB8/SuWrEqmSc2QcooNtMRih2qu9qa4srkqGIayHAti8MalVDyQ+oE72puzM
	Ne//Rm395Xcb0Hbmb6moX9MCkquKhmu1MRFF6mRtAbdA4BLFyMATS8/EpDTVJJjrcSpdGV9BE41U9
	TmZ5pqSIoaEeX6Eqre8fgwu2tN5Reyg5v1RaPQ91PnzAbP/WktPYLEiR8frknisSzpPdtZszIfbXc
	Zyq9W7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1s6X-0000000FuL1-1VcY;
	Wed, 02 Sep 2026 21:02:45 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1s6V-0000000FuKM-2KiT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 21:02:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2d94c868ea5so16712075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788382962; x=1788987762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zMLlM2fX1xLcX/WTGlvxUY5Z2fLG31XCRQQllFSHGs=;
        b=Svpy+rf2kYmUly4SPh3lSsBq/Alj7XzXyOuBUR5O9bijhn5odNUa9bpX6Hcm5SsKEk
         GculqozhdcP95Vt3H++RnJnObpnakPK2HUIz7TDlyg52AoNV7t8e2edBAm84fc+LW4t+
         RYDpVP4MCOf+ohqVSHE31n/dnc4Q+Zh+85Mb9fDUu0aH/Q9qKN+M0O/ukZkF0no4w3zs
         mhCkaBfJO2Hy0fxG+FKB5GWzzIzylMvplhvaRuZC8czjO+s9DV6zsQDHhsCAQJd9bJ1P
         IhiblbhoDUjWEz6Pqqxa5wisSwSG1R+YTRIvC/T9eyj2Mw9SaxYsVrkJR85QssT3hzv6
         W/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788382962; x=1788987762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zMLlM2fX1xLcX/WTGlvxUY5Z2fLG31XCRQQllFSHGs=;
        b=oAwuCz/vHHpCRuF8g202sCIaUxsaFFdGpWrCuJ43sGEOdA7obSUnDRo4jpFcEcKdkM
         UVbA/HtHsyaFJhubn8+T/t3FybNUIAi6f/xXaq8wSp7pOhgNwO0P5bDdXunZ7hjw3m5j
         osEOCwtOs1Q96X6u0M0wYuZqFqqL7pTywF8YCe+0KVHS4ZL8wtGZvWs+jsrTwepjKZGq
         dAWgmxbSGUXdDF8CNhs+Si+rflb8fhvtiXzRZMiotuY+3O7TQR9NBhO+9AfOuOfj8+XH
         bYEA0XYtjw6YJn09JWrAl8axJweEg5sDkSpp6mjtCfVHKTHnHesS0OeQKuFpyueA5aTr
         sicA==
X-Forwarded-Encrypted: i=1; AKwUvBxrudi3wCbjD1Iishf7lfZFxMnrOzTJNWoERsiVG7ypUateW1sFu2TkA98KUh+DFnqDOSPTtTj1tm8QHUUKYfpG@lists.infradead.org
X-Gm-Message-State: AFuF++mkO5H8y72O8Q5/fL8SAskvEfchRAY1bO/V2xp1m2XkpqfPrEgh
	7rfPbgsThoJ7Xew0qikH3gvfbU0DSSnheZvhMagF/27j8DcZnbvlP0mA
X-Gm-Gg: AYBFou3uyiKdK4xXashVCwoFbO3L0gKmLob95IhrI4YA+74+y4me/U8Sz9ihH21UW+a
	5DkrK+Z4teLafYk7YQ6pZ+JSOCGTu+4eo4g2ofpQ+OGHxM5a+UN6G7BeoJ6vPo9znrwZTvWe+J3
	1E/P6HoFurRnOibvqkRKvR/BXAOdBTGIlnpYob26Xbw3fq7miFR/tdmeRBglA5St6uxqOKQs1AP
	dKoq0CokbypgEuA26REXwpLilehBFOFSBJpeJwm2EB0GxzIAipxUuBMRosYNLtuW22foUoWr7W5
	ztJJlC9fpZBKwEe4eZlT3PA4vDt4XOYbNJ7ArzPpEIP3Mn5SaKtVh5dCoKHsWQ9Tooy8iNwQjBS
	9+eJDnmqbGwO9fUSPLYBOLEks1+YX0+YumTfPhw0HRgxMDhaPOaaMNLpslIxpU1fYT6hhM/DigP
	Jvyxj7+wr6phMa8CNlsmZUeDnMlmHyGwNsCd8uKOoS9LLpVNZgMXS2bMKgGri9VM/JDiXkWUv60
	d9Syt7HDDQkkfim1Bb91Ax9okjdMS4jxj3VC1OpCtb7QX8A+c3+c17wL8GVwc4/6vrNZUlUDAtZ
	r+Bnk3TLrmzic4sVJwUV9uagqP1tA7bTGq0Xsw==
X-Received: by 2002:a17:90b:2d83:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-39aee049464mr12342955a91.15.1788382961730;
        Wed, 02 Sep 2026 14:02:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083f04d1sm1141515a91.8.2026.09.02.14.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:02:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Esben Haabendal <esben@geanix.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 net] net: ll_temac: Return actual error from of_get_mac_address()
Date: Wed,  2 Sep 2026 14:02:38 -0700
Message-ID: <20260902210238.283494-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_140243_597744_F2102F7B 
X-CRM114-Status: GOOD (  13.95  )
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

When of_get_mac_address() fails, return the actual error code (rc)
instead of the hardcoded -ENODEV. This preserves the original error
information, which may be more specific (e.g., -EINVAL, -EPROBE_DEFER)
and helps callers handle the failure appropriately.

Use dev_err_probe() to avoid printing an extra error message in case of
-EPROBE_DEFER.

Fixes: 8425c41d1ef7 ("net: ll_temac: Extend support to non-device-tree platforms")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/xilinx/ll_temac_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/ll_temac_main.c b/drivers/net/ethernet/xilinx/ll_temac_main.c
index 711ed9c2631b..7a4890e45eb1 100644
--- a/drivers/net/ethernet/xilinx/ll_temac_main.c
+++ b/drivers/net/ethernet/xilinx/ll_temac_main.c
@@ -1579,10 +1579,8 @@ static int temac_probe(struct platform_device *pdev)
 	if (temac_np) {
 		/* Retrieve the MAC address */
 		rc = of_get_mac_address(temac_np, addr);
-		if (rc) {
-			dev_err(&pdev->dev, "could not find MAC address\n");
-			return -ENODEV;
-		}
+		if (rc)
+			return dev_err(&pdev->dev, rc, "could not find MAC address\n");
 		temac_init_mac_address(ndev, addr);
 	} else if (pdata) {
 		temac_init_mac_address(ndev, pdata->mac_addr);
-- 
2.55.0


