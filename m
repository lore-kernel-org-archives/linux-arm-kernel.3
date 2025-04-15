Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C195C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPu7srPL9By2zZEVIfL1Lj4E5YPu0Ndbglz1s4g9Cc4=; b=3NiyAV7AC5I4l9qLiDIYZgpu7t
	4KEyPAXESz66lFOoRBwIFeD+frXbHP+bS40AuM1bMdAA5foyUUxCHRyQyDhy5WCxIU7p5mcYitSye
	veNf54NoJNK0cbtMqW12xCwIk/gRanityL3XPXQ7oQGg35UgddBO4K4biYjv1VE/+JS+DtmDoL0ma
	72/ri0kvfoO6wdWYL1efkPoJERxj3EC96IXoWXD8AL6pDt4PFgCkb0J4KczmbDVUbF1/+NieOe9DV
	kYO63q/cobXm/4Xc4r79TswlPhp1aiD+Uf9Sr4XL1ULz4em0LvITHC5c1cvdRVxTxf6AwkNE6VhiL
	ZqZ4o6XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4il3-00000006LnV-2C2U;
	Tue, 15 Apr 2025 16:03:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iLm-00000006GoX-0yEs
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Apr 2025 15:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=SPu7srPL9By2zZEVIfL1Lj4E5YPu0Ndbglz1s4g9Cc4=; b=py8ubwGwvfYqMZ8bg8T/4t8wll
	kUBsInFlEnWJmA8yUU5d2m3zK0a7dEFX1qT7khpMtNxKo3Wv54LnVfi/svtMuYkxl7Wgu4L04jfM9
	lgVASLE3jKEdYm+/Z9QD/enjXEEI3NRmKQELP9ICW0v82kzChGA49wg7hPA30g5MImlYxUR9OymVW
	LW0/jSqzqHrbx7izewTu7j4UETiN0URvrjbZ33xax0GHzdDSYGdbMF4lYs6dcaJFrDO541XVqIlNh
	Ve1uNCMuMqjpkVDhlReLodrO74zeXwklUVzhkXCQ/idxMbJD7IrAd2i9K9qRsJe1LG/X3sJ19CMFM
	/RkN1MLg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4iLi-00000009ust-3MDP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:37:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4C964A3F6;
	Tue, 15 Apr 2025 15:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89651C4CEF5;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=BXUeJzaOPu6wdBqkrzRH/yMdh5em9BF7TrNPfXAEkdo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JzJSNSwW1P5Il90YgnnI/8kNQAi/MxhGxCnW4IJvmxBzldDz2BxVdp6eFk/VfZkoN
	 0VCZSNOPkpx9267K5Qm/v+ydkhNxlP02vtdxLC/T9tOMbqnbjF7O7LvZVoFM5kssWR
	 gSxDIEVZrhrQqBl0Fdo0nKvGFwIgFS4DkuhIEvPa2jpLoG6I/dIgYQjiK/8PWHEP0q
	 txdISMHQyZ2PK42lt3c3jKdAWRupthIZPbEvlZLQLqbXHL5TnunV6oBqhQO+Ro1pfR
	 7BskaEU0gQHEzcd+qjBJLZlC2/c9V4LdbH8lfVHfFfM5JcND2y9uRoOEl5wnNI8SJt
	 vjMEveyFIGojg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA63C369BA;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Tue, 15 Apr 2025 15:37:00 +0000
Subject: [PATCH v2 6/6] i2c: pasemi: Log bus reset causes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-pasemi-fixes-v2-6-c543bf53151a@svenpeter.dev>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=VA1WhVX4Izvudq5u7eRf2fGXelyMPNY/3NDm2fN5raU=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/Wq19l7xza3jP7jSI+u++w+7L/V2srnF6Fyb/Wj4xQ
 Wxp+pKOjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEtjEzMtx+KuJdcOrOkUlJ
 rxm8+9rvPi4Wl21gUd+fq73jnISu6A5GhlebAySynZqu/S4pmjq5XUPuoEygj/TT0tth2o+mXug
 S5AcA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_163723_336066_D7D9EEE6 
X-CRM114-Status: GOOD (  11.17  )
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
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 41db38d82fe62c73614b8fafe4cb73c7d1a24762..e5e8a748638f02e48d6ffa65e49aff5b12f70e06 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -22,6 +22,7 @@
 /* Register offsets */
 #define REG_MTXFIFO	0x00
 #define REG_MRXFIFO	0x04
+#define REG_XFSTA	0x0c
 #define REG_SMSTA	0x14
 #define REG_IMASK	0x18
 #define REG_CTL		0x1c
@@ -89,7 +90,7 @@ static void pasemi_reset(struct pasemi_smbus *smbus)
 
 static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 {
-	unsigned int status;
+	unsigned int status, xfstatus;
 	int ret;
 
 	/* First wait for the bus to go idle */
@@ -98,7 +99,9 @@ static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 				 USEC_PER_MSEC, USEC_PER_MSEC * TRANSFER_TIMEOUT_MS);
 
 	if (ret < 0) {
-		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);
+		xfstatus = reg_read(smbus, REG_XFSTA);
+		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x xfstatus 0x%08x)\n",
+			 status, xfstatus);
 		return -EIO;
 	}
 

-- 
2.34.1



