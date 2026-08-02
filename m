Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCD4C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 22:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K+YpikDeGg3PaK1+XecbhoXs6xNS16wdVuw+OggeHyc=; b=K4LUykVM2uF6nizKk9CsB3rOGP
	NC0l9xV0+6Kv8urgTrLstUlfORszLUD9sHVat72R2pJ/ebwfWu5fllDMOMg987MYQ99hPOC2yK3a2
	35yrfJ4Ehh0W3xYmULE/J8+L5A/rHYCJ2axyxAPu6i/xmzi+2mLMp42KG3rcYKtIyktdsjBbkM+3B
	nhvNU4eqOC2BgwbNQd98imL/4T4G4EawkhLD7kclbwWJIWeyf88wf/dOC4jKpzeWa78xj+UpZM1Ie
	DEGGSX0ro1/2onu6gp0k0Q76cVgQxeHRbBIa7v+qpVxYJdU0HaXgkMfWzWHVCUmYNIukVqQ4IlYVN
	XeDhciHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqeaO-0000000G5nS-1LLE;
	Sun, 02 Aug 2026 22:23:12 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqeaM-0000000G5n8-2S18
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 22:23:11 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-51c0ecfaee7so16198161cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 15:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785709389; x=1786314189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+YpikDeGg3PaK1+XecbhoXs6xNS16wdVuw+OggeHyc=;
        b=jec2INaVrte78l8vNqav2KDdfvDSCnDet9IAgL9R6tNq9wGvoOzMbO4r7f37Nm/C30
         7//xFvwhsrTJbU0wlIa2cZXm7rZiKk9CHnYdu6tuQhirf12ec/IyJ/9ULr5vtYhqcdSZ
         R6bQ8Rcq13yBKACeHNhBHqfDPE9c2LLRyyJtnUB9vLHEPkO1a9kH2SabW766/90yrZDD
         L3KhyNa9GT5S65eMyv/giZmbZSDjT26UsWZgiIoWiWHBnkN9+Qj76lo5lhFyhW27j3mA
         E3N+wyRkj+pAK3xQDQW88xWqVuyKAfdFBZMFKESJDXMEjcbMKJxBkmIpU1TJK5slpDNW
         ccJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785709389; x=1786314189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+YpikDeGg3PaK1+XecbhoXs6xNS16wdVuw+OggeHyc=;
        b=U1ZBWKrD1dQfB0G+ID3wNf7DSttI1Y65tR4wC7Y8WJg1wU1jmhmrFehN6mU7AvyJMN
         Mkip0JDoKOs8G/buT3wwyswZZ1oymn4OR7K/efqelIjDp5bDR3Swnk8OCX2lTncwdTFt
         aTZqfMImLbaG5LEDL0cLMoe9E4yQPuJ7u2odEkzzrmV2mAsWMytXOBJJLs97uOSPRdOI
         e7Foj6Di9gvMPKNj065V3NZL+6EQT9iUArkpe5uWIsjrgGNzRMZ+WRYjPO+cIMl/mvj1
         SyMHeekeuKga24s77rHU0QV0C+oBVFixTQumW/KaPXQSAMwXK3JwtvnQHGXup4xnYx3E
         3/MQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTFpmvbZV5XBXFAtTbtybLKzVNjhVFmYhEZdwMe4jgB3aaoFr6PEznI1hTahVlHHnX0Imqpzn45cSVdG+b9a+Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4CezpMXO5MoPJr+o1UsH5rNSEaF8IuaU7dPqh4QGP1hHoWyCd
	Z2BP7eaNj+tuyCJnsIFZq2R2dqOsvO8jBFp9t8zUL43IJn9WdhbmdPS8
X-Gm-Gg: AR+sD10bISRk7BDBWExr4gYY9kc7+ecRpn8I8XAZOANa4tiXvGcBFCH88xy9RGbMl5o
	lNeuSzCBOyzMbuxCwHC/6NE2yCh+X7zDyMPYD2CidfCTU2s63l5GAYjo1BqUkAq6QkSjZc+XsEw
	uRubAqFOXQwFYtWnIGetz+oU3qpaCHrozF4Z1D1rP7JHPlc1BdCToofAWX+/VL59swgKf+46RZN
	2s9/OFGxD6oM5FFDXi2H3XHDN+gCFd4CYfgyryeuIoAG6oO0HCkWLAqYgIiWD+ixFhMq55lYMm3
	GyRrgWY6DRryjhnx8+KU3UOrDYWVfS+7KrU2I5n75db66XlAT0hti3wOkdMl4slUz4vxscoHGKd
	1Uf0wXJNFRLCdug9QzNLw5e6HoyLTAgOewYklXABHMRxws6PCSGg4UCXTF7KiBC/Efo2QDPMOud
	rjwNoTAfMjFzGt6WgYB6uJ+CsW3Z72v4vpKSZGsOe3VsR2jGTpuhr1ptQQVsb85jLxr6BYAby1t
	Kzei3y1NPkdr5zwZ7WF4JB3NWBpNBxGZH43j1Q9bfhuCOjC2boxlLDbIl8inOs=
X-Received: by 2002:a05:622a:2612:b0:517:642c:8196 with SMTP id d75a77b69052e-52b566db0admr173984281cf.12.1785709389063;
        Sun, 02 Aug 2026 15:23:09 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908434a250csm61249026d6.13.2026.08.02.15.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 15:23:08 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: olivia@selenic.com,
	herbert@gondor.apana.org.au,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-crypto@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dakr@kernel.org,
	o-takashi@sakamocchi.jp,
	bhelgaas@google.com,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] hwrng: imx-rngc: Disable clock on registration failure
Date: Sun,  2 Aug 2026 18:22:59 -0400
Message-ID: <20260802222259.577200-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_152310_621260_F686A3C8 
X-CRM114-Status: GOOD (  11.52  )
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

The RNGC clock is enabled manually before runtime PM is configured. If
devm_hwrng_register() fails, probe returns without disabling the clock.
The devm_pm_runtime_enable() cleanup only disables runtime PM and does not
call imx_rngc_suspend().

Disable the clock before returning from this failure path.

Fixes: 7a96a64e8689 ("hwrng: imx-rngc - add runtime pm")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/char/hw_random/imx-rngc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
index 28c56c2d1bf6..a2db26d7f790 100644
--- a/drivers/char/hw_random/imx-rngc.c
+++ b/drivers/char/hw_random/imx-rngc.c
@@ -313,8 +313,10 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
 	devm_pm_runtime_enable(&pdev->dev);
 
 	ret = devm_hwrng_register(&pdev->dev, &rngc->rng);
-	if (ret)
+	if (ret) {
+		clk_disable_unprepare(rngc->clk);
 		return dev_err_probe(&pdev->dev, ret, "hwrng registration failed\n");
+	}
 
 	dev_info(&pdev->dev,
 		"Freescale RNG%c registered (HW revision %d.%02d)\n",
-- 
2.43.0


