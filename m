Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C31E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 08:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DjwmTo1bI7sOlX9rvb+Omot+RneXBZJwhT76OAJOaKc=; b=MaxX0n1RdJb+199Bi352TEyuxE
	3fMa+zZLC0wwooHXjJaZ84eGYQvGVXoithQSzmNsO+bBVO1Zv2vFcJhUSXlL3kf54uzLMRCifRWm3
	Rw4vvo4FJozWenIG93XAcnFLcN2OTPJD/rtcwI+6/8qnxXTxXTt+GhVq9dBOoJnANtkEMjh9mWf3/
	hbNTH3njOCop7WgiIlPJdAst8VyWQCgDPKBIdFqzamkltZx9inhEhu0+dyISKCOlzzOZzeOJLajY7
	N+JNTxkc/v4NWz0/gOLFTDz7RXkdulEePW7gbwLvMG2/u66fRg9MJarv3gMY6ltFpzngrIYKK/0Gp
	F3DKCA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTiF-00000000v7L-15Rc;
	Fri, 06 Dec 2024 08:29:23 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJThD-00000000uuq-2P3C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 08:28:21 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9701:674a:6aea:a85b])
	by xavier.telenet-ops.be with cmsmtp
	id lLUC2D00a0YidY701LUCQk; Fri, 06 Dec 2024 09:28:13 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJTh5-000Oma-RK;
	Fri, 06 Dec 2024 09:28:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJTh1-00FqMu-H0;
	Fri, 06 Dec 2024 09:28:07 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: nomadik: Add missing sentinel to match table
Date: Fri,  6 Dec 2024 09:28:06 +0100
Message-Id: <34b6ee90437fe19526d9388f2f304d175596cb1f.1733473582.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_002819_748041_E55CB145 
X-CRM114-Status: UNSURE (   9.49  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The OF match table is not NULL-terminated.
Fix this by adding a sentinel to nmk_i2c_eyeq_match_table[].

Fixes: a0d15cc47f29be6d ("i2c: nomadik: switch from of_device_is_compatible() to of_match_device()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/busses/i2c-nomadik.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index efb33802804fdde8..d2877e4cc28d42c9 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1075,6 +1075,7 @@ static const struct of_device_id nmk_i2c_eyeq_match_table[] = {
 		.compatible = "mobileye,eyeq6h-i2c",
 		.data = (void *)NMK_I2C_EYEQ_FLAG_32B_BUS,
 	},
+	{ /* sentinel */ }
 };
 
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
-- 
2.34.1


