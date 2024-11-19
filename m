Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD37D6C29E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 21:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EjYh1cknlZ7PMy6sRG187xTDVC5FFJcX/Odw6mzP5bM=; b=BGLRKUUEjyxDpekQc675/nLRRB
	xuaHbv2pG2k2H1/Z8uWaCq4bmvv3PRR5ih723mZQH+sPP3pU00N3ah/kbJzapZvZi1sRZKQLOM662
	sSFlZv/5h03XjUyz5fjVNq5K5/62GTzQVa8shzFzL6/HAeZPqwdSFl4TEuxyI9hh+mt29pwXA8iU/
	E/oacZD3joJPFZRyyr5/QioPMzFqxyE+KrX0/e/kp2aT95CcwnS2WjESrNtxFwvZ+GwfrWkKEZEtl
	sV7RyxJ94vMnMyQa8N6/1P/14X/JPUmd9++MQe3CpeCI1IPDPXo6aDgzw/YRPfpZlTyMpRpPMCWEz
	RBSPyosw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDVp9-0000000DoiJ-1RA6;
	Tue, 19 Nov 2024 21:31:51 +0000
Received: from smtp-28.smtpout.orange.fr ([80.12.242.28] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDVoD-0000000DocD-0qSk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 21:30:54 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id DVo0tZBgMlMRCDVo0teyUl; Tue, 19 Nov 2024 22:30:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1732051849;
	bh=EjYh1cknlZ7PMy6sRG187xTDVC5FFJcX/Odw6mzP5bM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=fs6XKAXKEa7OiGdYVIxWxoX52NB9X9sFNwHavWtknoVS7Z1y0i9KjA7T5Hcz2N04G
	 oGU7ylyi7JaqkPL4uNOf8Qk/bK7w/mBi0klb3GdO73sCvx76Qx4AGs7GAZjXMWs0N3
	 uX/cFd2bZHVehren5fcaR5tkVEH+EmLU1QCfrLU9crfmdQO+ck55e3SvNxfM1ycuM3
	 0dZbgx1nxMHEae/5hr54Un7Ta4Y1f49V21pB9poCOHlOuJMQ2pHfL21MvriwpNQM+w
	 eWKSG3bJhYwZT1m1VrxKdg4OqVRgIQpGTtElsaT46/a3uXEqkcMPWrNN1N57pXeVyT
	 QqRSxYCfY4y1g==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 19 Nov 2024 22:30:49 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mark Brown <broonie@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] spi: aspeed: Fix an error handling path in aspeed_spi_[read|write]_user()
Date: Tue, 19 Nov 2024 22:30:29 +0100
Message-ID: <4052aa2f9a9ea342fa6af83fa991b55ce5d5819e.1732051814.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_133053_643971_7281416C 
X-CRM114-Status: GOOD (  13.41  )
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

A aspeed_spi_start_user() is not balanced by a corresponding
aspeed_spi_stop_user().
Add the missing call.

Fixes: e3228ed92893 ("spi: spi-mem: Convert Aspeed SMC driver to spi-mem")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.


This patch is completely speculative, review with care!

It is only based on naming where a _start() function if not followed by a
_stop() in some paths but is in other paths.
---
 drivers/spi/spi-aspeed-smc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 8eb843ddb25f..e9beae95dded 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -239,7 +239,7 @@ static ssize_t aspeed_spi_read_user(struct aspeed_spi_chip *chip,
 
 	ret = aspeed_spi_send_cmd_addr(chip, op->addr.nbytes, offset, op->cmd.opcode);
 	if (ret < 0)
-		return ret;
+		goto stop_user;
 
 	if (op->dummy.buswidth && op->dummy.nbytes) {
 		for (i = 0; i < op->dummy.nbytes / op->dummy.buswidth; i++)
@@ -249,8 +249,9 @@ static ssize_t aspeed_spi_read_user(struct aspeed_spi_chip *chip,
 	aspeed_spi_set_io_mode(chip, io_mode);
 
 	aspeed_spi_read_from_ahb(buf, chip->ahb_base, len);
+stop_user:
 	aspeed_spi_stop_user(chip);
-	return 0;
+	return ret;
 }
 
 static ssize_t aspeed_spi_write_user(struct aspeed_spi_chip *chip,
@@ -261,10 +262,11 @@ static ssize_t aspeed_spi_write_user(struct aspeed_spi_chip *chip,
 	aspeed_spi_start_user(chip);
 	ret = aspeed_spi_send_cmd_addr(chip, op->addr.nbytes, op->addr.val, op->cmd.opcode);
 	if (ret < 0)
-		return ret;
+		goto stop_user;
 	aspeed_spi_write_to_ahb(chip->ahb_base, op->data.buf.out, op->data.nbytes);
+stop_user:
 	aspeed_spi_stop_user(chip);
-	return 0;
+	return ret;
 }
 
 /* support for 1-1-1, 1-1-2 or 1-1-4 */
-- 
2.47.0


