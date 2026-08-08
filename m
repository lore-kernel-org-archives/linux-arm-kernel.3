Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA6AC5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 09:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gC2ItiHuCYFgaLZeaOk4o80zqG6tRez0H0meLhFxwtI=; b=J7UOG0/eI/vvQ6qcmWzF/1mE7/
	CY/SCI0PRljt3I/QhLKd5kblZEljFZVjjoUYadEeqyDtoMBHBHMtWaZTdf23tTVAtpowA1fxUxFaf
	OlXavoB5esTZ8Yh1mytdTm7Fbaz251AJa665FpwnMBKIU6tXn5w0bcwogztcL2aL6o59q8/l99BLX
	8+bmfg7/y/n5AOoIdQdTwavyo3JhBrF5NHZS1tAby5NA4CjY5YlcksHd0jLOF6RdUvn2LkZLu1UJq
	3La/Jw0ffmvAye/eZamyCc4B+WPhOaAg+GLYA7GuXpUun6RDGcBUL2vdFYTc0Cmx1IJX4Y3pBe8ju
	fGQ2+cgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdO1-00000009DfT-0ueU;
	Sat, 08 Aug 2026 09:30:37 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdNz-00000009Deh-0jQV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 09:30:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cedda2ce6fso3232715ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 02:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786181434; x=1786786234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gC2ItiHuCYFgaLZeaOk4o80zqG6tRez0H0meLhFxwtI=;
        b=S+TyMf1xisGxQivmb4h/5rqgo2TgwHVomMTksNh48li9ydxSnYa7cY8tfu63ja4Rqu
         PVqJVfWg1Wq1j7JNFurpmkbzDS+iL6WoJgKDpYpQMCpq7dy4OD+6W36oxam82yIHcP7H
         57u0YDfA9U4BaAJxWZk74Ww51pspbA89FK9yJxuAyKzsrwqhofTJ/ZuWysm+mCsmRqfm
         VNiIDkvHswfqXw6ma3J3pAlXwpQM3yZwYzYQ5rA+6QTkR8snHneio26vfPHUYNHKB6mE
         7YZBt2OZHoWN2MjW2fZXowQnIGN/q18yJvq5f/m8xgOPSyPgviw8juNyYAL7AC9m346l
         dX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786181434; x=1786786234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gC2ItiHuCYFgaLZeaOk4o80zqG6tRez0H0meLhFxwtI=;
        b=OqG6d0ZY4g2x7HJP7BNbG348KNE3l2IerwO4djadqQOGbpWOGciq/O/AeqrUqS5LzB
         g3rtgHF3byPfCUNj1wZJ+BsgQKo1NCyEGTDrc+ZcsI2e3NXmOz+89eagadG9ndvYsRc9
         MxGNq/7zc2c06z0k8e6fF0JLJfOFVMBB+5gnY7i6hyypEPMA9NWgL3Ot5yjTCd+brq8u
         gZg0JByLpDziAv+KKjq9jUn1PisflsN2RFh7Cc38rvf3B2GK8nThpKOwYe2hJydTnKHU
         RmiIk2gpLm4uQ83n+GeqBH4W7UvStpersoqZ5se7ovfwawmjlV7PkNPzVJ/2bmcnyNVB
         9Q5w==
X-Forwarded-Encrypted: i=1; AHgh+Rqs2Oq6hRZykQ/qIsJwKAmgk+kmmiNoMMupfSj9tAuSkdt1P91npzymrtSYWpqFjLiddJFsP82yY13kgAkevpad@lists.infradead.org
X-Gm-Message-State: AOJu0YxPUJInYIwyK5f6X/TALaoyNiWmQ9HfHWcWvSZugzesIY8zVQ5a
	1TXlZuOCN4q6lFoHM8YUm+n3v3eLWfrNa4fNNs75uzkvK+3GaXj13oUT
X-Gm-Gg: AR+sD13LnBN40VA9T6pGeKArV2iJ0vEEfJHj7pCqYOzEDPvZUskyHL0kuC1WfduzCkZ
	W5Nl8RaV3BXKJcePaMogeCx7kXi8sxOtsXRERA1ShRNOxfnCBtAOSaajA6VnCYWGkkz1cOteFmE
	pkDEyanOMr/9LiuCgCa6cZ8gaUcwIfi6psc4TFHJ2W7Y2zmC7f+C1f0VpDTt9WF+ObMmxQaNyLu
	FJ+t7lorLbfO1w91to4tzQJeOS/g1Zm+PS3mniYYeRn9wJWDzZjTgChNG3aGK2j61Qp3kPrhWTm
	JHbjz1WAEZV2EAsamO4lruXfqDv9XeC/pznSsH3bAhulQDUGpU5YqiThONEJtEh7X3NOYNOjvOj
	xsdhfjOQT7bziOGhUvESDUXWcUsqfUkC6bwTgI/zA4LBRD+btZhYqH7Ej4+GKoJgSQXWOBOerJJ
	u6tIzeYFNmQlnsQt7a274zmOz6wT6C9JnBixQpR2rSZpsxWygsQEcGvGU663u9DuLDE7WV
X-Received: by 2002:a17:903:3201:b0:2d0:401c:2ebb with SMTP id d9443c01a7336-2d0ca7125cemr362470225ad.4.1786181434060;
        Sat, 08 Aug 2026 02:30:34 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccac0f1sm17098055ad.7.2026.08.08.02.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:30:33 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Heiko Stuebner <heiko@sntech.de>,
	John Keeping <john@keeping.me.uk>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] crypto: rockchip: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 17:30:16 +0800
Message-ID: <20260808093016.2738659-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_023035_394974_DE70B668 
X-CRM114-Status: GOOD (  13.22  )
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

rk_crypto_pm_init() calls pm_runtime_use_autosuspend(), but the
autosuspend setting is not undone if pm_runtime_set_suspended() fails
or when runtime PM is later torn down by rk_crypto_pm_exit().

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Undo the autosuspend setting when pm_runtime_set_suspended() fails and
in rk_crypto_pm_exit() before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: a216be3964c1 ("crypto: rockchip - introduce PM")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/crypto/rockchip/rk3288_crypto.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto.c b/drivers/crypto/rockchip/rk3288_crypto.c
index b77bdce8e7fc..cfca472f996f 100644
--- a/drivers/crypto/rockchip/rk3288_crypto.c
+++ b/drivers/crypto/rockchip/rk3288_crypto.c
@@ -150,14 +150,17 @@ static int rk_crypto_pm_init(struct rk_crypto_info *rkdev)
 	pm_runtime_set_autosuspend_delay(rkdev->dev, 2000);
 
 	err = pm_runtime_set_suspended(rkdev->dev);
-	if (err)
+	if (err) {
+		pm_runtime_dont_use_autosuspend(rkdev->dev);
 		return err;
+	}
 	pm_runtime_enable(rkdev->dev);
 	return err;
 }
 
 static void rk_crypto_pm_exit(struct rk_crypto_info *rkdev)
 {
+	pm_runtime_dont_use_autosuspend(rkdev->dev);
 	pm_runtime_disable(rkdev->dev);
 }
 
-- 
2.43.0


