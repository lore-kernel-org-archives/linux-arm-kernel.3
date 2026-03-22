Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7D3FC72D4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 19:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=irObMARTu7OYKbVotrsF13+CshxCWsyGdlJ7aH8njPs=; b=1OipNnydmuDdKGN105pD4I9ZSt
	2xpHiPdYpAXObRnTlOg+kvfTMxDzC6KgxWf1a0ZgmlbxOSDbqm88HtpEuV4Ae5UheWZ8NYwCfLrVo
	CMOZ0tUIpJoTc0s4dTX1D+RiR7rO32yzTkI1g/ZyGBPKPVrxmcdV/WgGhGF/qdx6twr7XoQDrkNk5
	ap4iQ0pxJPAXBhTbHY6BJ6N1GRH4BcEqhwAkJmx7sDyDYiEHm9vBbM6FwEOhHnl53nGm1SibrR/kz
	cYriaGWgYu21fz331JDRBKNWZHeamHtYDCE+dzApymPPVbYaZXDCe4nWgD9AwOA4ws2lMZ7SyqzLq
	myp4/aqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4OWT-0000000FbUH-0yGu;
	Sun, 22 Mar 2026 19:31:41 +0000
Received: from sender4-pp-o94.zoho.com ([136.143.188.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4OWN-0000000FbTu-3fMu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 19:31:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774207890; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J3cDix5VB1py9kf2wIZuA7ibG4u1c/vG38kcOOlEseCN1Bm03Gt2KdkX9XfA4rMkpnhg7Ko+gIiduMXzJMaeCBdj1xpzmbSudz08qsE0UvyujkUjF7XNAlPP0pl1efDNrRVtWSH2pjQa7MB4I2/e/+3RCjlDdqT/C1mIFCqQyDo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774207890; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=irObMARTu7OYKbVotrsF13+CshxCWsyGdlJ7aH8njPs=; 
	b=NPrQ0JLb2tlmxuuaUJ/52d85+soHFXg4Uezmf7Heoj9rfqzvRVxDfO8JTwMCPgQ1tL3r94/6O6Fx+64aPrWOdFZxXX1CxqRItIxRqTDKvAlcFlDTHzbJvdEW9ocVhfDoQF4l5ZE303dAP64HEJGQwl5nuSraxrucbGuIwT20zSk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=trunixcodes@zohomail.com;
	dmarc=pass header.from=<trunixcodes@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774207890;
	s=zm2022; d=zohomail.com; i=trunixcodes@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=irObMARTu7OYKbVotrsF13+CshxCWsyGdlJ7aH8njPs=;
	b=bpvhWdoBoEs4ZJAF2cZGbYp9V4iX04t4gWQHfBULkUvZamwk5kM/Dgpq54C6Uc09
	QpBpuB/oBJ01hOU6LXAW8Xdw6kLqI332DGFrJB+AixFngbJEwMe733mMnuSlsOUc6i3
	X4YrD8rRHyFO9Y9iv93kGb37fK7CaaNCEh/n8VLo=
Received: by mx.zohomail.com with SMTPS id 1774207888060202.5064995328131;
	Sun, 22 Mar 2026 12:31:28 -0700 (PDT)
From: Ethan Luna <trunixcodes@zohomail.com>
To: peterhuewe@gmx.de,
	jarkko@kernel.org
Cc: jgg@ziepe.ca,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tpm: i2c: atmel: fix block comment formatting
Date: Sun, 22 Mar 2026 12:30:53 -0700
Message-ID: <20260322193112.27010-1-trunixcodes@zohomail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227ea8742baf121abc909a485a900003ec67e16a58d3c7f0ec29c376718cc3cd5cf2f6cf5bde7621d:zu08011227862303805a5ef1e3198b1aae0000d0675014352d9e765290464e412216665ef2944e3e8c4eb1a5:rf0801122cb2892a739f674a0a6256272f0000ccfed82642d4b85ccd12da2497b88c075a7e024eaf7995cdc3ecfefdacd4:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_123135_990032_46FBFB94 
X-CRM114-Status: GOOD (  17.23  )
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

Multiple block comments in tpm_i2c_atmel.c placed the closing '*/' on the
same line as the comment text. This violates the kernel's preferred
comment style, which requires the closing delimiter to appear on it's
line.

Fix the formatting to improve readability and resolve checkpatch
warnings.

Signed-off-by: Ethan Luna <trunixcodes@zohomail.com>
---
 drivers/char/tpm/tpm_i2c_atmel.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_atmel.c b/drivers/char/tpm/tpm_i2c_atmel.c
index 4f229656a8e2..702b3c9191dc 100644
--- a/drivers/char/tpm/tpm_i2c_atmel.c
+++ b/drivers/char/tpm/tpm_i2c_atmel.c
@@ -33,7 +33,8 @@ struct priv_data {
 	size_t len;
 	/* This is the amount we read on the first try. 25 was chosen to fit a
 	 * fair number of read responses in the buffer so a 2nd retry can be
-	 * avoided in small message cases. */
+	 * avoided in small message cases.
+	 */
 	u8 buffer[sizeof(struct tpm_header) + 25];
 };
 
@@ -58,7 +59,9 @@ static int i2c_atmel_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
 	if (status < 0)
 		return status;
 
-	/* The upper layer does not support incomplete sends. */
+	/*
+	 * The upper layer does not support incomplete sends.
+	 */
 	if (status != len)
 		return -E2BIG;
 
@@ -78,7 +81,8 @@ static int i2c_atmel_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 
 	/* Get the message size from the message header, if we didn't get the
 	 * whole message in read_status then we need to re-read the
-	 * message. */
+	 * message.
+	 */
 	expected_len = be32_to_cpu(hdr->length);
 	if (expected_len > count)
 		return -ENOMEM;
@@ -113,13 +117,15 @@ static u8 i2c_atmel_read_status(struct tpm_chip *chip)
 
 	/* The TPM fails the I2C read until it is ready, so we do the entire
 	 * transfer here and buffer it locally. This way the common code can
-	 * properly handle the timeouts. */
+	 * properly handle the timeouts.
+	 */
 	priv->len = 0;
 	memset(priv->buffer, 0, sizeof(priv->buffer));
 
 
 	/* Once the TPM has completed the command the command remains readable
-	 * until another command is issued. */
+	 * until another command is issued.
+	 */
 	rc = i2c_master_recv(client, priv->buffer, sizeof(priv->buffer));
 	dev_dbg(&chip->dev,
 		"%s: sts=%d", __func__, rc);
@@ -174,7 +180,8 @@ static int i2c_atmel_probe(struct i2c_client *client)
 
 	/* There is no known way to probe for this device, and all version
 	 * information seems to be read via TPM commands. Thus we rely on the
-	 * TPM startup process in the common code to detect the device. */
+	 * TPM startup process in the common code to detect the device.
+	 */
 
 	return tpm_chip_register(chip);
 }
-- 
2.53.0


