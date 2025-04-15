Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE31CC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKmkMPmEcJmaMes/os9PPE/5CFS9MZHaaET8Nf0gww0=; b=Ugkarzrm2VrdO/XsyKUNVZ5JYU
	z1x+Ia5LZ/ZI+usartSaAviZLsn8otyzOeUg3b0IBhkZKP4foEVLUIHdq8lJBuNfO8a8Xn56mtfFb
	R4aKfdrWZnwdt+k4Jru3MCBVzRyHELqzusRYVQJNNvK/sbnB4Su8s2kBj5WPktHdx6kWB+MoAAsE0
	p25X4TUnMkf8Ma6dGkqnaFIMoZZUvLL7m9Y5qlM49zL0zxXQibnYKvKbOzQhMBz1vXgusSknaA69M
	UYbBkC05+PYOi1zwLC0jJVrH3oP7qE2orp9hf4Tt6Mky5ve6oidklyem2CWDHD17+ih6b44AmyHi6
	R+KLLWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ihS-00000006L6O-46dw;
	Tue, 15 Apr 2025 15:59:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iLg-00000006Gll-3XGi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 81EAB4A2DD;
	Tue, 15 Apr 2025 15:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 541E0C4CEF1;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=F6ydi+3Kh9gLpG3MhIJVGmiYu4P4h2LRSPQzIzRGasg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nBdxMbZseuEol55Y1Ny/cpNeEYq7uiD50JIs/gwKO1Foa2wPiCEWrc90lL1haY55m
	 1U/Avo4ZIeTMGB3B0hc8RtHCP+fUz1bh2A2nXzqENOb+2WfvRXprDXBqeNLCoJuZLD
	 zEBzma6f58T7jbVHsEsmRO/7k15L34RmCdGfwwtOcxHX2/PGwMxk0Rl2AUyFdDAssB
	 m1CvNeYIsiA8Aek7Vq8uG2im5lz8Ku3au63TEM2C6vbDxZy5V1Zeq34gNfiIOXXi7b
	 +Ckbnl3Dd3I78yvbAcdPdFDJ24wap6NTAymjMZa8wXc2v/uNtLmmcjAZd5/3bavVVv
	 hOwn1ihr8SoqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457E4C369BA;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Tue, 15 Apr 2025 15:36:57 +0000
Subject: [PATCH v2 3/6] i2c: pasemi: Improve timeout handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-pasemi-fixes-v2-3-c543bf53151a@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=pieYM48LE5ENsb4OlGmWM38fJJzel5K/67CDk0KItDE=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/WvWKcJ/Ij8b3P05fYM58StKf7c2kj6UO6rKVr2u/R
 bN/jY3vKGVhEONgkBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAExk7yWG/w5Skwunb99z8fBu
 o7eC/youx5b+YzCc+W/XoprbuSEdnPcZGU4/lzac0t5wuYzjwwGL5tcNvtVFW7/VPLu1Y0rwgYr
 9DAwA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_083720_965462_2E1412BF 
X-CRM114-Status: GOOD (  12.99  )
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

From: Sven Peter <sven@svenpeter.dev>

Add proper timeout handling for the interrupt path.
Previously, this was only correctly done for the polling path.
Note that we drop reg_write(smbus, REG_SMSTA, status) here which
will be done anyway whenever the next transaction starts via
pasemi_smb_clear.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index df1b0087dcacb0a3b94196368137d5e20b0e6d7e..9b611dbdfef23e78a4ea75ac0311938d52b6ba96 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -91,32 +91,42 @@ static void pasemi_smb_clear(struct pasemi_smbus *smbus)
 static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 {
 	int timeout = 100;
+	int ret;
 	unsigned int status;
 
 	if (smbus->use_irq) {
 		reinit_completion(&smbus->irq_completion);
 		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
-		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
+		ret = wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
 		reg_write(smbus, REG_IMASK, 0);
 		status = reg_read(smbus, REG_SMSTA);
+
+		if (ret < 0) {
+			dev_err(smbus->dev,
+				"Completion wait failed with %d, status 0x%08x\n",
+				ret, status);
+			return ret;
+		} else if (ret == 0) {
+			dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
+			return -ETIME;
+		}
 	} else {
 		status = reg_read(smbus, REG_SMSTA);
 		while (!(status & SMSTA_XEN) && timeout--) {
 			msleep(1);
 			status = reg_read(smbus, REG_SMSTA);
 		}
+
+		if (timeout < 0) {
+			dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
+			return -ETIME;
+		}
 	}
 
 	/* Got NACK? */
 	if (status & SMSTA_MTN)
 		return -ENXIO;
 
-	if (timeout < 0) {
-		dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
-		reg_write(smbus, REG_SMSTA, status);
-		return -ETIME;
-	}
-
 	/* Clear XEN */
 	reg_write(smbus, REG_SMSTA, SMSTA_XEN);
 

-- 
2.34.1



