Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DCFC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s168HX2y2tjF7cTtvq4FItoQMlDg2AHXO+wYtF4ZRYA=; b=taeSW70QalVjngDxnGtM23E0X6
	jnurlm9MzDyWKosBXeQTeAdt44jizaZNoRmoPt32lX1sGwRxnhWUth5a/iPbvC3HODF2F2VTho8kL
	upJJYAfy0jfb6zmyKDDmXvPQnR+tPNAJ4IZ+vOZCA9+kO3uWfom1vtXxl7tGxpcJp89S6I9DQaYV/
	y8AOysUIzRtTP/S6gRS15Lra+vtaLNP8HZiASWpHP9I9b2ETcorinxC/d+p4fv2wj0fMCgpXvIdEG
	mGbKgCrYuVADRvg2XBf1LyOgviD19q1wC5FBm+PhUuA4tP/6dcZuPt8HU5+gBo5rT9AWNwBBPE5MO
	oJzE4wwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpmk-000000086Qh-3R4a;
	Sat, 22 Feb 2025 13:43:14 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpiO-000000085z2-0XM2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 13:38:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BDA736115C;
	Sat, 22 Feb 2025 13:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F325C4CEEC;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231522;
	bh=8Zkxgch9g5+DTeW63q//4eNTvjzsWBLujizGZ2Rb/XA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nC6VFvdjzBsZDWH5RX70Kx6s9SAooZ8ghZyHjSSeXQPwlCjS5qFhlH+WnzNANaYf6
	 26OHYklHnhoasCg2j2Xx4DwkpoQ4kRotv7CQN0HcWZlH/uW+sBDpPha0+8nQAq5V2X
	 RXy6gk8iE0C66rvbffgrw0PaKw0/NJXk5og/r2Zfx7c7JYCy4mpXOz13sP0J23+5sT
	 SjGYQolx0YS0O61HXeHM/9FKywwA+0L4fY4V5MaV7YzoTNxc77PoXffOUcznP+T5PS
	 goPAwG3EU+EHSPGsqBz0ghfJqPn3OsxAm7n0kfTOlFpDL1QDtA97eP3lgyj37g7N/u
	 bC5UMNCWiD2hA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74951C021B8;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 22 Feb 2025 13:38:36 +0000
Subject: [PATCH 4/4] i2c: pasemi: Log bus reset causes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-pasemi-fixes-v1-4-d7ea33d50c5e@svenpeter.dev>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
In-Reply-To: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=Jxw9FakomFtq1Asfv39ujqR2viJkk3GlzvSkFwhw82g=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/rOy/G9bPs878o/+CTRkbdfmm/Lhezdx5g13m4KbKiT/
 8G38L5BRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiGxQZ/qnyVAicXbnM/M1T
 hl+P9OxCS5f+WvFccDXf9t2Pfm+YK5DG8D+rcuO/gvTpxdKxP2UqBZRYb+95m3Jgi/zta3tq3zI
 JZbIAAA==
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

This ensures we get all information we need to debug issues when users
forward us their logs.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 8f0ba975172f..ae0181a76470 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -21,6 +21,7 @@
 /* Register offsets */
 #define REG_MTXFIFO	0x00
 #define REG_MRXFIFO	0x04
+#define REG_XFSTA	0x0c
 #define REG_SMSTA	0x14
 #define REG_IMASK	0x18
 #define REG_CTL		0x1c
@@ -84,7 +85,7 @@ static void pasemi_reset(struct pasemi_smbus *smbus)
 
 static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 {
-	unsigned int status;
+	unsigned int status, xfstatus;
 	int timeout = TRANSFER_TIMEOUT_MS;
 
 	status = reg_read(smbus, REG_SMSTA);
@@ -95,15 +96,21 @@ static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 		status = reg_read(smbus, REG_SMSTA);
 	}
 
+	xfstatus = reg_read(smbus, REG_XFSTA);
+
 	if (timeout < 0) {
-		dev_warn(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);
+		dev_warn(smbus->dev, "Bus is still stuck (status 0x%08x xfstatus 0x%08x)\n",
+			 status, xfstatus);
 		return -EIO;
 	}
 
 	/* If any badness happened or there is data in the FIFOs, reset the FIFOs */
 	if ((status & (SMSTA_MRNE | SMSTA_JMD | SMSTA_MTO | SMSTA_TOM | SMSTA_MTN | SMSTA_MTA)) ||
-		!(status & SMSTA_MTE))
+		!(status & SMSTA_MTE)) {
+		dev_warn(smbus->dev, "Issuing reset due to status 0x%08x (xfstatus 0x%08x)\n",
+			 status, xfstatus);
 		pasemi_reset(smbus);
+	}
 
 	/* Clear the flags */
 	reg_write(smbus, REG_SMSTA, status);

-- 
2.34.1



