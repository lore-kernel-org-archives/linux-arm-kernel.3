Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC51EC110C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/vP8YKNHmToY90EFwEgolPhOI5A6ezPDbGTe+z7CI1w=; b=wz+HO4GWnLRXf7r0Dn5RXUTc92
	l3duH+4dtlYa+aiVThUBQoMqNG+OljcbaCEurKK4owNUp1TPURToODrWVspvaWSoxduoBScsNYzew
	VOM83eFRwdqRGNZ+4Z7QsTCVPcslvAX2w8+2qyx6HW2ZOOUTjFJFSlNxt3ARHWmxTBZNMxL1gWNAJ
	Ugq1Ay4E2UzAcI1B/apwpllF0TBV9TQbixtnr1rzQMX98Fd5PKekMCqscTc2/ZILKi4UB6muc2C1H
	FcsgEHEw8GFnBV6Q7f1nyQCJVxxv5dkzYkrHkGihuAHkidZXIOrVDdfgK+L+SyQvYxXZPRWLmSxF9
	elpmz//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZNV-00000000iuu-2djx;
	Mon, 23 Feb 2026 17:05:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZNU-00000000iul-1pwm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:05:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75D8260123;
	Mon, 23 Feb 2026 17:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4310BC116D0;
	Mon, 23 Feb 2026 17:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771866347;
	bh=LVFzllSloWoOaF21bDE/8kEXnUUxiA/Ig/7YIS6Bvlw=;
	h=From:To:Cc:Subject:Date:From;
	b=PesqEyqRg+siu8i4WJqokKfppcs3B6vrvvTYnp2IohSwb5sdovPCH5tghmE4SvGUR
	 0yXwKHyZ3/5ccqzQhm7AtE/H/SsbQv5Zf8IuFWdrM1PQQCkkHjPnkhGuUe3bIvz0Ob
	 WI3llk7u8WUoosEb311o5gtZle05+GJ6gZsHOJs8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	stable <stable@kernel.org>
Subject: [PATCH] i2c: s3c24xx: check the size of the SMBUS message before using it
Date: Mon, 23 Feb 2026 18:05:15 +0100
Message-ID: <2026022314-rely-scrubbed-4839@gregkh>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=LVFzllSloWoOaF21bDE/8kEXnUUxiA/Ig/7YIS6Bvlw=; b=owGbwMvMwCRo6H6F97bub03G02pJDJlzOk6pGV9pq+u8vc0l4qbNkTRxUUX/DD0HubIH0nda/ DJFlP90xLIwCDIxyIopsnzZxnN0f8UhRS9D29Mwc1iZQIYwcHEKwESeNzLMj56/N3D7vyPTy81u uTdOlpzus92/j2HBEjWTv3b6phLbplvPFD/Zv1BV4QYzAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
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

The first byte of an i2c SMBUS message is the size, and it should be
verified to ensure that it is in the range of 0..I2C_SMBUS_BLOCK_MAX
before processing it.

This is the same logic that was added in commit a6e04f05ce0b ("i2c:
tegra: check msg length in SMBUS block read") to the i2c tegra driver.

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: stable <stable@kernel.org>
Assisted-by: gkh_clanker_2000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/i2c/busses/i2c-s3c2410.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 8138f5ef40f0..15e14a6fe6dc 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -503,8 +503,13 @@ static void i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 		i2c->msg->buf[i2c->msg_ptr++] = byte;
 
 		/* Add actual length to read for smbus block read */
-		if (i2c->msg->flags & I2C_M_RECV_LEN && i2c->msg->len == 1)
+		if (i2c->msg->flags & I2C_M_RECV_LEN && i2c->msg->len == 1) {
+			if (byte == 0 || byte > I2C_SMBUS_BLOCK_MAX) {
+				s3c24xx_i2c_stop(i2c, -EPROTO);
+				break;
+			}
 			i2c->msg->len += byte;
+		}
  prepare_read:
 		if (is_msglast(i2c)) {
 			/* last byte of buffer */
-- 
2.53.0


