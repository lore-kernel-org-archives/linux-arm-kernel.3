Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32230CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 23:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xgh7Qwrou5qNvOkoF1+XnxYAOb54Zebpq26aOMB+2tM=; b=q8CGji+cqRiOOS9FM+eoicXTCO
	BDaGeyaUepTjWFJipgwP4n6No4VEetoyCzLwmYDl9Y9XsxdRu+ThyOJeg/+I+vXGmVwyX80F57e/a
	C+FDU5XIjILduw+3Uct88n/usTNNXaXX8xMo8mlSz2KFMBR7/7i0VZXy9g/Gqui8OEMqnMiqBg70e
	MP4FH95A7tH1g1Fyc8AONJEfIRp5qyc/codB/G/Mb79VkYsMdftFALAWxVlxb2bird+vQKwf/fUkd
	VCdCMAEndFhtkWG1jN1Rkw8nMcX12IEdHfMCqN0oBws0TNY7UIdVH44lSQbAOCK8epTm8FIB0QlXI
	6/csAa6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpt-00000000c3V-3ZGr;
	Tue, 12 May 2026 22:44:21 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpp-00000000byA-1IpK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 22:44:18 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43d7828221bso303409f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 15:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625855; x=1779230655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xgh7Qwrou5qNvOkoF1+XnxYAOb54Zebpq26aOMB+2tM=;
        b=LOxIry6qUsEh784IdeY/4LkZgdI+fBm5SN4XaM0HM3AUD4bmUioEKeA4j11l50taMT
         H72KVAUDxuA4e7C4/k5RBl7dAXp4t++ajcu7uhwZ0kQzWsqhO/VgDLzRoEQtPi6FCgBV
         5lsBdPt7FmEVp+y5NPI9N8xqpePmFI/aV34Q3o7oVXZRWFWuJd0EocsaMeUxoFdphJh5
         MJWSe/zl8FBCrTZLlw9Aez4pdRopp6hSUBRDUit1CC8N+h91gOTqpjBPYEB9FT5Yb9ps
         e7NRcmJMG3l8OsLeHPz2IdObKSByv3N9JP7D5ScCVzjRW5q2Ti5ch9gnFdzHLBDTLP4c
         meBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625855; x=1779230655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xgh7Qwrou5qNvOkoF1+XnxYAOb54Zebpq26aOMB+2tM=;
        b=iObxy66coC7stcdlvpMh98pp2++vQySCwZnKytAKCKl7Vpmh2UtiPrizDz6iRiTnTa
         2kNRE29SUfdPmpxvG/JpFG/r4AoijBa9qG90QFCTT18Lref03ZO5JIgs4iU26ffid8zs
         TXnK7DYdSmEopLkHUlBZAq6Ve9jq0A38p90Ly18nkeU+/LFTtiP7P2M2PjQTWiPluI0f
         eyADqPbbTGwXPEKe+9EkiS4cdEd4GDMoeimiiamrKdQXv2DgaElFo1DmOOHqQiWfzAm3
         PBO6oCk3CgHX3+yxzcXz1WCpohfMKnXRE0J26JN/EAkO3tZHpWCrtkkTqnj81qwHg20n
         Sn9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/bHG/5TamBK0MB20mLJxbKp573hK6TTFJ4863Kl5kjV3xxpjDbzZ/bYgs/BBAn4aOnsUC1LEyruh5hj2tEWylK@lists.infradead.org
X-Gm-Message-State: AOJu0YwsT24OGckXqSMMw44cmjTpXa+v+eiesVApYunIsayI6ir2yHWn
	YDc+JSRerekJjHi9zgFzSnwav9IO47Lk3cPzG1Yr/Uu/Jg6zXCLCKs59
X-Gm-Gg: Acq92OHj6S8HxQan8Qk09OV7OOrmi1B5usgYLKw8+fTWXo585oE3LxuiPSEpZlXzBD7
	7gXB/sXqoW9wCB3gFsMdjltueHUBpYJQLZDKlyr2caotSBgjX3XXmgcA6a787CVpxDocN5z1ZW1
	6D2BHeBPYcdR58inYpnOd37C8EVUkFuXagfhmg64Ln0Yx0+D/xsmd0E5Dm9MigWz5/q8Lu1wUvq
	qtJ5jGNnerRn/8eLCWWwPG9z82WSCA/ogHMiKe9e70iFyzbQavaCtjlf257Ao+HFVRvNSeZ+C4l
	FM0C7p/jN1denhQoiEiKLG6+z5lp5aL6c8efgsFXCpfSBqHioS8HQ0QuR6sVtoohLpj4ivbtYAM
	UpNnww5AEDV8eWe6XV6hZ+AOaPz2o16Awn9SFAKJy8hd9UVWKT6icQsfVHKp/W6xq0XtaR6kiQq
	k9KvZgU4Kf3s+qCpG/7pV5f3AaXa5mM8Xgkg/4JjsGRj31qG2OomikESfTp3j3p2c=
X-Received: by 2002:a05:600c:1910:b0:487:1fbb:5a28 with SMTP id 5b1f17b1804b1-48fc9a09523mr5008635e9.1.1778625855234;
        Tue, 12 May 2026 15:44:15 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce385ea5sm3194025e9.14.2026.05.12.15.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:44:14 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH 07/12] crypto: atmel - expose CONFIG zone through sysfs
Date: Tue, 12 May 2026 22:43:44 +0000
Message-Id: <20260512224349.64621-8-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512224349.64621-1-l.rubusch@gmail.com>
References: <20260512224349.64621-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_154417_364642_0D2BF5DA 
X-CRM114-Status: GOOD (  10.74  )
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

Expose the CONFIG EEPROM zone through a read-only sysfs attribute for
Atmel I2C crypto devices.

The CONFIG zone contains device configuration state, including slot
configuration and lock status, which is useful for debugging and
verifying provisioning state.

Reuse the generic EEPROM display helper provided by the Atmel I2C core
driver to expose the CONFIG zone for both SHA204A and ECC devices.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c     | 7 +++++++
 drivers/crypto/atmel-sha204a.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index b5f2d44ec74c..f08fdf284b60 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -23,6 +23,12 @@
 #include <crypto/kpp.h>
 #include "atmel-i2c.h"
 
+static ssize_t config_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return atmel_i2c_eeprom_display(dev, attr, buf, ATMEL_EEPROM_CONFIG_ZONE);
+}
+static DEVICE_ATTR_ADMIN_RO(config);
+
 static ssize_t otp_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	return atmel_i2c_eeprom_display(dev, attr, buf, ATMEL_EEPROM_OTP_ZONE);
@@ -30,6 +36,7 @@ static ssize_t otp_show(struct device *dev, struct device_attribute *attr, char
 static DEVICE_ATTR_RO(otp);
 
 static struct attribute *atmel_ecc508a_attrs[] = {
+	&dev_attr_config.attr,
 	&dev_attr_otp.attr,
 	NULL
 };
diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 4f10e826e675..341554b7b7a2 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -19,6 +19,12 @@
 #include <linux/workqueue.h>
 #include "atmel-i2c.h"
 
+static ssize_t config_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return atmel_i2c_eeprom_display(dev, attr, buf, ATMEL_EEPROM_CONFIG_ZONE);
+}
+static DEVICE_ATTR_ADMIN_RO(config);
+
 static ssize_t otp_show(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
@@ -27,6 +33,7 @@ static ssize_t otp_show(struct device *dev,
 static DEVICE_ATTR_RO(otp);
 
 static struct attribute *atmel_sha204a_attrs[] = {
+	&dev_attr_config.attr,
 	&dev_attr_otp.attr,
 	NULL
 };
-- 
2.53.0


