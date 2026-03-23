Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5ACF46112
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B/YWoZ3/P7yhoach9i5x35UvO4eHF6OSW5RXxRtkbv8=; b=kAd1ZPpQUH/PAAnPyNqhUf7uPM
	lNTzSnis2CqPek/GemS7vcTAPGrkiNwB7Yy7uF5M+40KfzNs7YYOfOhxqANRiawtrZEiUe5Msc36q
	zhSdzgJWhzu4+OJ4Aal+mEE1KYu28fJMBrX2iqVi774EdQXehjQO8cbx4Hh4NDE/TtM3UaXZslV/l
	ZD8Vm9HORT7AGH3RGvrfs3syiHZgQEPMaVcbw8fjiqbnQPiQdV6hXo3WXuARcp6jlkkapmR4djEkD
	BrfE3XYsTsg3dodsQAlN6ivUG5aBsxyEimKCR7aMn5GJPjZgY9t3d7W9C8s3iP5hZcliejQocZU8r
	3qxMhNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fY9-0000000GrE8-3Cvf;
	Mon, 23 Mar 2026 13:42:33 +0000
Received: from sender4-pp-o94.zoho.com ([136.143.188.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fY6-0000000GrDK-2Zwe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:42:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774273332; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YWLMt1BESz0MDJjpIIoY7lbYGoBRIuj33ljFEmeSeZqYLKo3+hKwNjGByRc0GRpOi6C2DOzexIDl7KMjdOLpQagFz8cmWDk8Yp4TWCGCdOF8Z/X+J9sJKeZGvXIp74XfN3Dt+sil0cWQ1HMn35Xh3DC1p3KfKpOqyz4SYx+vhfA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774273332; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=B/YWoZ3/P7yhoach9i5x35UvO4eHF6OSW5RXxRtkbv8=; 
	b=c+/0LEkWxn8b+GazaZ0hzWuxWGBF3qSJ4foEfi07WkFvuBVYMXQhYQPBpouXxoMXr1R/usFVFG2fa/0urWGN5n1cPzU9TXZ0BLKLjrKybqevlUC4xDRHNDXCYOvkOVi4y9gQ0OLNrDw2FPLS8u55JoG55tUI4Zp9eYmMOu4WXLU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=trunixcodes@zohomail.com;
	dmarc=pass header.from=<trunixcodes@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774273332;
	s=zm2022; d=zohomail.com; i=trunixcodes@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=B/YWoZ3/P7yhoach9i5x35UvO4eHF6OSW5RXxRtkbv8=;
	b=PzeuQvOqP58m2fvoBqtKod2LL54xID/NdzECU7cl/IZ02DOlxfjbzdgcb9ZgGoV8
	n7D4L1P0ON713IQs3iCAKvcRJx82jzMbvr2wI5VFif5J2Fzq2aEYQmPFVthteyGAv/6
	+nHUEZMUBY2RIgxQxUJHGyYedmmGiMDcUnuOUVQQ=
Received: by mx.zohomail.com with SMTPS id 1774273331223815.8540051298768;
	Mon, 23 Mar 2026 06:42:11 -0700 (PDT)
From: Ethan Luna <trunixcodes@zohomail.com>
To: peterhuewe@gmx.de,
	jarkko@kernel.org
Cc: jgg@ziepe.ca,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] tpm: i2c: atmel: fix block comment formatting
Date: Mon, 23 Mar 2026 06:40:49 -0700
Message-ID: <20260323134200.7766-1-trunixcodes@zohomail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112276cb5c677688b0b5d5a8bdc4700000e571217a95e1510df44e1961518088c0ac02099ae0364b407:zu0801122744ffdf8d598da53cf7b50c340000fb9598dcb6b536ab228881c1662b59ba53ed999511fea69f49:rf0801122cf7ce3eb0d7f27411f9ae9099000095ac9992e66c5daedf75e7720fa1c9b1866df24cda0360e94f433d2aafd1:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_064230_692741_9F622D43 
X-CRM114-Status: GOOD (  18.63  )
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
comment style, which requires the closing delimiter to appear on its
line.

Fix the formatting to improve readability and resolve checkpatch
warnings.

Signed-off-by: Ethan Luna <trunixcodes@zohomail.com>
---

V1 -> V2: Fixed block comment formatting consistently across all multi-line comments

v1: https://lore.kernel.org/all/20260322193112.27010-1-trunixcodes@zohomail.com/

 drivers/char/tpm/tpm_i2c_atmel.c | 34 +++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_atmel.c b/drivers/char/tpm/tpm_i2c_atmel.c
index 4f229656a8e2..c3cdc0d6e61c 100644
--- a/drivers/char/tpm/tpm_i2c_atmel.c
+++ b/drivers/char/tpm/tpm_i2c_atmel.c
@@ -31,9 +31,11 @@
 
 struct priv_data {
 	size_t len;
-	/* This is the amount we read on the first try. 25 was chosen to fit a
+	/* 
+	 * This is the amount we read on the first try. 25 was chosen to fit a
 	 * fair number of read responses in the buffer so a 2nd retry can be
-	 * avoided in small message cases. */
+	 * avoided in small message cases.
+	 */
 	u8 buffer[sizeof(struct tpm_header) + 25];
 };
 
@@ -58,7 +60,9 @@ static int i2c_atmel_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
 	if (status < 0)
 		return status;
 
-	/* The upper layer does not support incomplete sends. */
+	/*
+	 * The upper layer does not support incomplete sends.
+	 */
 	if (status != len)
 		return -E2BIG;
 
@@ -76,9 +80,11 @@ static int i2c_atmel_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 	if (priv->len == 0)
 		return -EIO;
 
-	/* Get the message size from the message header, if we didn't get the
+	/* 
+	 * Get the message size from the message header, if we didn't get the
 	 * whole message in read_status then we need to re-read the
-	 * message. */
+	 * message.
+	 */
 	expected_len = be32_to_cpu(hdr->length);
 	if (expected_len > count)
 		return -ENOMEM;
@@ -111,15 +117,19 @@ static u8 i2c_atmel_read_status(struct tpm_chip *chip)
 	struct i2c_client *client = to_i2c_client(chip->dev.parent);
 	int rc;
 
-	/* The TPM fails the I2C read until it is ready, so we do the entire
+	/* 
+	 * The TPM fails the I2C read until it is ready, so we do the entire
 	 * transfer here and buffer it locally. This way the common code can
-	 * properly handle the timeouts. */
+	 * properly handle the timeouts.
+	 */
 	priv->len = 0;
 	memset(priv->buffer, 0, sizeof(priv->buffer));
 
 
-	/* Once the TPM has completed the command the command remains readable
-	 * until another command is issued. */
+	/* 
+	 * Once the TPM has completed the command the command remains readable
+	 * until another command is issued.
+	 */
 	rc = i2c_master_recv(client, priv->buffer, sizeof(priv->buffer));
 	dev_dbg(&chip->dev,
 		"%s: sts=%d", __func__, rc);
@@ -172,9 +182,11 @@ static int i2c_atmel_probe(struct i2c_client *client)
 
 	dev_set_drvdata(&chip->dev, priv);
 
-	/* There is no known way to probe for this device, and all version
+	/* 
+	 * There is no known way to probe for this device, and all version
 	 * information seems to be read via TPM commands. Thus we rely on the
-	 * TPM startup process in the common code to detect the device. */
+	 * TPM startup process in the common code to detect the device.
+	 */
 
 	return tpm_chip_register(chip);
 }
-- 
2.53.0


