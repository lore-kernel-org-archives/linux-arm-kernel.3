Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F53ACD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 22:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPGTYowpPc1Ox/XtvXiBTJJQvGISnFodKgzhMsesERc=; b=ti99keB7xuxBHx5Gajl9QEnQ2Q
	i3TPTUF7SxlrVTm0MjIOf82BPKSbMDl2tnBjajV6nI8DTTyo8tmt89FCaUsWxQtgjgWwUwXKIFGIO
	ZjnYjfndaz9tEv0sjFywjEskkTIMNvvOUdDM71UqaEcKHxQWbeB6SPMCa2nB+L2B7UTGbh9D3uiWf
	ZFUXCnURSSIkmYLLW1uZm53y3YPqfxD0/j9Cnn4pctRs391OHqRKTdVE9J7/APAGvgQL9p01JNIL+
	5w9K6g5Xi+/vmXkMLsZ2EOE1ycddZ71lj82mbzc7J9eqTCXYHcymz+JUwmtMawTEtWyepdmCo+IOs
	fhmCrypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvq7-00000000cIF-3zRQ;
	Tue, 12 May 2026 22:44:35 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpt-00000000c0x-0uTK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 22:44:22 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4493cf2f982so373946f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 15:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625859; x=1779230659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPGTYowpPc1Ox/XtvXiBTJJQvGISnFodKgzhMsesERc=;
        b=jEfds1t1XZLDWoMKYh2ernevi09Vwfjv4AuviSrqb9kWLjQuFLpNv/sRh3kckcK46x
         L6PP6/Wusl5vPdHNUFSSh0qB6l7W3GW1p6r0GuIV5bgje8g9OTbWlhqBgKFuwFt1S4G/
         9Lb89lOGnY0CZgkJimtqtlLJYueDHXUDHjVT1A+HZZpVzNx9q6kIlLjr/gOK8/d6JkTe
         NhfZaNAY8PFuc2qp37G9cjXrtoR5mNF1zpW5d9sVClAXpzO9dVLY7paGk2g1OqNo5oQU
         cA56wCNRgW9zfTCos9MlfRucC4EpXpEp3CRRoVI/B2FwGJ6c5qrboeKJOzoaYod9nVo8
         BjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625859; x=1779230659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UPGTYowpPc1Ox/XtvXiBTJJQvGISnFodKgzhMsesERc=;
        b=GkKkj9I54JU57VWKUE+J6ipR0kuJgdTiImCyuPXhjmQCXc7ZEyKgowyLAJO3Hj7LoM
         ia26VhTUZdIwIt9xE07OcQNHpfx8edBjbb7GBN1lRcH3Cz/WbuFTwucZ+Gu1g39zfX0m
         g8GiZVrs61LqtvYGvjhT39TdwjT0GWGIr6imi2u1+aQVie+JsPxp7fogZx+puxFSGmv0
         E+CqBMVuwQulsHSrcelT1/ToCnu9Odu3ega/jRVjmeWdoQhL7mGblsptBOugH0TYRDmF
         yUWANJRtOKApL7c9c7lMlpyge1M6PY7QONxEVx4nGNUxHQk/0LlQz9Yz6CbM1OrVw6W1
         K03w==
X-Forwarded-Encrypted: i=1; AFNElJ+pihZWBLCMMXRHTwKTsd60aOjB8IjGQVaBKR27rwYg3LfDfS5Jgr4Ftd8mE/qt14u1juwgRld5W4Q/sJfKP0z6@lists.infradead.org
X-Gm-Message-State: AOJu0YzoUmHw/yNLYxj82gQaGU0HEVysQLw/SlPW96mJ1WxdsTYt5lij
	8S9aNfJTPo8cybX0G3+/u9Pa3Zh3AR0+G/737PQtnxUTHcswlZ8GJOY3
X-Gm-Gg: Acq92OEOGQBUkJRToMY2Wm5HQS3OQ8f3AZvB4R9D090O1dZGleOzmQyqJK5ikbbxoJM
	m9WIYTAemvSu16LoVLKbZUbq4weMdRc3lZOS0FzHN0U2L70jsN/M9OnVgt6ytaPqAzO5V+h/3jS
	8mBuRngnc3M2Ln0OZ/FkHxtHySnKzLUvxbrEQCnuuCXroNld+t1rs2hTPCAyTMskT4LT7vtddKt
	p2Iq99/jod6rxsEPjtUPrt7B5gHDdTvh99ayg3TS97zG4F/teBIjM3sJMQcqI55WmQlG/AeLea6
	gOIGbjSPZkMSBDdMrHwSMlwzoZN9gUipb4fHawNdH+3Z78pO2n1UdIypoRHc+2IO21n9GLOtCxS
	5zsdgifW6gidQk6YtbRzbCJ52aMsguEGKhFvQ0no3i22/Jr07gzgmEKTycmukwywpQFZR2GnuKT
	ObpNA5L3kLvgSwhjQobVzJt1zuo2+n0hWw63JKFyr+lt3SpITJE435VycZpuoVc18+ssXbIQOGJ
	g==
X-Received: by 2002:a05:600c:c4b7:b0:48f:c8dd:f91 with SMTP id 5b1f17b1804b1-48fc9a493a1mr3694165e9.6.1778625859137;
        Tue, 12 May 2026 15:44:19 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce385ea5sm3194025e9.14.2026.05.12.15.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:44:18 -0700 (PDT)
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
Subject: [PATCH 11/12] crypto: atmel - refactor and localize driver constants
Date: Tue, 12 May 2026 22:43:48 +0000
Message-Id: <20260512224349.64621-12-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512224349.64621-1-l.rubusch@gmail.com>
References: <20260512224349.64621-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_154421_407504_0238813C 
X-CRM114-Status: GOOD (  25.20  )
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

After refactoring the client drivers to use the shared atmel-i2c core,
many constants and definitions no longer need global visibility.

Move command definitions, timing constants, status codes and related
helpers from the public header into the local compile unit of the core
driver where possible.

As part of this cleanup, rename macros and constants to use consistent
ATMEL_I2C_* naming and align them with common kernel driver conventions.
Also replace remaining hardcoded values with named constants throughout
the driver.

This is a preparatory cleanup and does not change functionality.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c |   4 +-
 drivers/crypto/atmel-i2c.c | 115 +++++++++++++++++++++++++------------
 drivers/crypto/atmel-i2c.h |  76 +++++++++---------------
 3 files changed, 108 insertions(+), 87 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 9ad6d42b6eef..ed8c0ce5562b 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -137,7 +137,7 @@ static int atmel_ecdh_set_secret(struct crypto_kpp *tfm, const void *buf,
 
 	ctx->do_fallback = false;
 
-	atmel_i2c_init_genkey_cmd(cmd, DATA_SLOT_2, &data->timings);
+	atmel_i2c_init_genkey_cmd(cmd, ATMEL_I2C_ECDH_SLOT_DEFAULT, &data->timings);
 
 	ret = atmel_i2c_send_receive(ctx->client, cmd);
 	if (ret)
@@ -296,7 +296,7 @@ static struct kpp_alg atmel_ecdh_nist_p256 = {
 		.cra_flags = CRYPTO_ALG_NEED_FALLBACK,
 		.cra_name = "ecdh-nist-p256",
 		.cra_driver_name = "atmel-ecdh",
-		.cra_priority = ATMEL_ECC_PRIORITY,
+		.cra_priority = ATMEL_I2C_PRIORITY,
 		.cra_module = THIS_MODULE,
 		.cra_ctxsize = sizeof(struct atmel_ecdh_ctx),
 	},
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 0ec2d768a763..53aba2f4bedb 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -21,19 +21,62 @@
 #include <linux/workqueue.h>
 #include "atmel-i2c.h"
 
-#define ATMEL_I2C_COMMAND			0x03 /* packet function */
+#define ATMEL_I2C_COMMAND		0x03 /* packet function */
+#define ATMEL_I2C_SLEEP_TOKEN		0x01
 
 /* Definitions for the device lock state */
-#define ATMEL_I2C_DEVICE_LOCK_ADDR		0x15
-#define ATMEL_I2C_LOCK_VALUE_IDX		(ATMEL_I2C_RSP_DATA_IDX + 2)
-#define ATMEL_I2C_LOCK_CONFIG_IDX		(ATMEL_I2C_RSP_DATA_IDX + 3)
+#define ATMEL_I2C_DEVICE_LOCK_ADDR	0x15
+#define ATMEL_I2C_LOCK_VALUE_IDX	(ATMEL_I2C_RSP_DATA_IDX + 2)
+#define ATMEL_I2C_LOCK_CONFIG_IDX	(ATMEL_I2C_RSP_DATA_IDX + 3)
+
+/* Definitions for the READ Command */
+#define ATMEL_I2C_READ_COUNT		ATMEL_I2C_COUNT_OVERHEAD_SIZE
+#define ATMEL_I2C_READ_RSP_SIZE		(4 + ATMEL_I2C_RSP_OVERHEAD_SIZE)
+
+/* Definitions for the RANDOM Command */
+#define ATMEL_I2C_RANDOM_COUNT		ATMEL_I2C_COUNT_OVERHEAD_SIZE
+#define ATMEL_I2C_RNG_BLOCK_SIZE	32
+#define ATMEL_I2C_RANDOM_RSP_SIZE	(ATMEL_I2C_RNG_BLOCK_SIZE + \
+					ATMEL_I2C_RSP_OVERHEAD_SIZE)
+#define ATMEL_I2C_RANDOM_COUNT		ATMEL_I2C_COUNT_OVERHEAD_SIZE
+
+/* Definitions for the GenKey Command */
+#define ATMEL_I2C_GENKEY_COUNT		ATMEL_I2C_COUNT_OVERHEAD_SIZE
+#define ATMEL_I2C_GENKEY_MODE_PRIVATE	0x04
+
+/* Definitions for the ECDH Command */
+#define ATMEL_I2C_ECDH_COUNT		71
+#define ATMEL_I2C_ECDH_RSP_SIZE		(32 + ATMEL_I2C_RSP_OVERHEAD_SIZE)
+#define ATMEL_I2C_ECDH_PREFIX_MODE	0x00
 
 /* Command opcode */
-#define ATMEL_I2C_OPCODE_ECDH			0x43
-#define ATMEL_I2C_OPCODE_GENKEY			0x40
-#define ATMEL_I2C_OPCODE_READ			0x02
-#define ATMEL_I2C_OPCODE_RANDOM			0x1b
-#define ATMEL_I2C_OPCODE_WRITE			0x12
+#define ATMEL_I2C_OPCODE_ECDH		0x43
+#define ATMEL_I2C_OPCODE_GENKEY		0x40
+#define ATMEL_I2C_OPCODE_READ		0x02
+#define ATMEL_I2C_OPCODE_RANDOM		0x1b
+#define ATMEL_I2C_OPCODE_WRITE		0x12
+
+/*
+ * Wake High delay to data communication (microseconds). SDA should be stable
+ * high for this entire duration.
+ */
+#define ATMEL_I2C_TWHI_MIN		1500
+#define ATMEL_I2C_TWHI_MAX		1550
+
+/* Wake Low duration */
+#define ATMEL_I2C_TWLO_USEC		60
+
+/* Status/Error codes */
+enum atmel_i2c_error_codes {
+	ATMEL_STATUS_OK_NOERR = 0x00,            /* success */
+	ATMEL_STATUS_CHECKMAC_OR_VERIFY_MISCOMPARE = 0x01,
+	ATMEL_STATUS_PARSE_ERROR = 0x03,
+	ATMEL_STATUS_ECC_FAULT = 0x05,
+	ATMEL_STATUS_EXECUTION_FAULT = 0x0F,
+	ATMEL_STATUS_OK_WAKE_SUCCESSFULL = 0x11, /* success */
+	ATMEL_STATUS_WATCHDOG_EXPIRE = 0xEE,
+	ATMEL_STATUS_CRC_ERROR = 0xFF,
+};
 
 struct atmel_i2c_client_mgmt atmel_i2c_mgmt = {
 	.i2c_list_lock = __SPIN_LOCK_UNLOCKED(atmel_i2c_mgmt.i2c_list_lock),
@@ -45,12 +88,12 @@ static const struct {
 	u8 value;
 	const char *error_text;
 } error_list[] = {
-	{ 0x01, "CheckMac or Verify miscompare" },
-	{ 0x03, "Parse Error" },
-	{ 0x05, "ECC Fault" },
-	{ 0x0F, "Execution Error" },
-	{ 0xEE, "Watchdog about to expire" },
-	{ 0xFF, "CRC or other communication error" },
+	{ ATMEL_STATUS_CHECKMAC_OR_VERIFY_MISCOMPARE, "CheckMac or Verify miscompare" },
+	{ ATMEL_STATUS_PARSE_ERROR, "Parse Error" },
+	{ ATMEL_STATUS_ECC_FAULT, "ECC Fault" },
+	{ ATMEL_STATUS_EXECUTION_FAULT, "Execution Error" },
+	{ ATMEL_STATUS_WATCHDOG_EXPIRE, "Watchdog about to expire" },
+	{ ATMEL_STATUS_CRC_ERROR, "CRC or other communication error" },
 };
 
 /**
@@ -65,7 +108,7 @@ static const struct {
 static void atmel_i2c_checksum(struct atmel_i2c_cmd *cmd)
 {
 	u8 *data = &cmd->count;
-	size_t len = cmd->count - CRC_SIZE;
+	size_t len = cmd->count - ATMEL_I2C_CRC_SIZE;
 	__le16 *__crc16 = (__le16 *)(data + len);
 
 	*__crc16 = cpu_to_le16(bitrev16(crc16(0, data, len)));
@@ -141,12 +184,12 @@ void atmel_i2c_init_random_cmd(struct atmel_i2c_cmd *cmd,
 	cmd->opcode = ATMEL_I2C_OPCODE_RANDOM;
 	cmd->param1 = 0;
 	cmd->param2 = 0;
-	cmd->count = RANDOM_COUNT;
+	cmd->count = ATMEL_I2C_RANDOM_COUNT;
 
 	atmel_i2c_checksum(cmd);
 
 	cmd->msecs = timings->max_exec_time_random;
-	cmd->rxsize = RANDOM_RSP_SIZE;
+	cmd->rxsize = ATMEL_I2C_RANDOM_RSP_SIZE;
 }
 EXPORT_SYMBOL(atmel_i2c_init_random_cmd);
 
@@ -154,16 +197,16 @@ void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid,
 			       const struct atmel_i2c_max_exec_timings *timings)
 {
 	cmd->word_addr = ATMEL_I2C_COMMAND;
-	cmd->count = GENKEY_COUNT;
+	cmd->count = ATMEL_I2C_GENKEY_COUNT;
 	cmd->opcode = ATMEL_I2C_OPCODE_GENKEY;
-	cmd->param1 = GENKEY_MODE_PRIVATE;
+	cmd->param1 = ATMEL_I2C_GENKEY_MODE_PRIVATE;
 	/* a random private key will be generated and stored in slot keyID */
 	cmd->param2 = cpu_to_le16(keyid);
 
 	atmel_i2c_checksum(cmd);
 
 	cmd->msecs = timings->max_exec_time_genkey;
-	cmd->rxsize = GENKEY_RSP_SIZE;
+	cmd->rxsize = ATMEL_I2C_GENKEY_RSP_SIZE;
 }
 EXPORT_SYMBOL(atmel_i2c_init_genkey_cmd);
 
@@ -174,11 +217,11 @@ int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 	size_t copied;
 
 	cmd->word_addr = ATMEL_I2C_COMMAND;
-	cmd->count = ECDH_COUNT;
+	cmd->count = ATMEL_I2C_ECDH_COUNT;
 	cmd->opcode = ATMEL_I2C_OPCODE_ECDH;
-	cmd->param1 = ECDH_PREFIX_MODE;
+	cmd->param1 = ATMEL_I2C_ECDH_PREFIX_MODE;
 	/* private key slot */
-	cmd->param2 = cpu_to_le16(DATA_SLOT_2);
+	cmd->param2 = cpu_to_le16(ATMEL_I2C_ECDH_SLOT_DEFAULT);
 
 	/*
 	 * The device only supports NIST P256 ECC keys. The public key size will
@@ -195,7 +238,7 @@ int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 	atmel_i2c_checksum(cmd);
 
 	cmd->msecs = timings->max_exec_time_ecdh;
-	cmd->rxsize = ECDH_RSP_SIZE;
+	cmd->rxsize = ATMEL_I2C_ECDH_RSP_SIZE;
 
 	return 0;
 }
@@ -231,7 +274,7 @@ static int atmel_i2c_rng_read_nonblocking(struct hwrng *rng, void *buf,
 
 	if (rng->priv) {
 		work_data = (struct atmel_i2c_work_data *)rng->priv;
-		max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
+		max = min(ATMEL_I2C_RANDOM_RSP_SIZE - ATMEL_I2C_RSP_OVERHEAD_SIZE, max);
 		memcpy(buf, &work_data->cmd.data[ATMEL_I2C_RSP_DATA_IDX], max);
 		rng->priv = 0;
 	} else {
@@ -271,7 +314,7 @@ static int atmel_i2c_rng_read(struct hwrng *rng, void *buf, size_t max,
 	if (ret)
 		return ret;
 
-	max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
+	max = min(ATMEL_I2C_RANDOM_RSP_SIZE - ATMEL_I2C_RSP_OVERHEAD_SIZE, max);
 	memcpy(buf, &cmd.data[ATMEL_I2C_RSP_DATA_IDX], max);
 
 	return max;
@@ -323,7 +366,7 @@ static int atmel_i2c_eeprom_read(struct i2c_client *client, u16 addr,
 		goto err;
 	}
 
-	memcpy(buf, cmd->data + ATMEL_I2C_RSP_DATA_IDX, 4);
+	memcpy(buf, cmd->data + ATMEL_I2C_RSP_DATA_IDX, ATMEL_I2C_STATUS_RSP_SIZE);
 
 err:
 	kfree(cmd);
@@ -381,10 +424,10 @@ static int atmel_i2c_status(struct device *dev, u8 *status)
 	int i;
 	u8 err_id = status[1];
 
-	if (*status != STATUS_SIZE)
+	if (*status != ATMEL_I2C_STATUS_RSP_SIZE)
 		return 0;
 
-	if (err_id == STATUS_WAKE_SUCCESSFUL || err_id == STATUS_NOERR)
+	if (err_id == ATMEL_STATUS_OK_WAKE_SUCCESSFULL || err_id == ATMEL_STATUS_OK_NOERR)
 		return 0;
 
 	for (i = 0; i < err_list_len; i++)
@@ -403,7 +446,7 @@ static int atmel_i2c_status(struct device *dev, u8 *status)
 static int atmel_i2c_wakeup(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
-	u8 status[STATUS_RSP_SIZE];
+	u8 status[ATMEL_I2C_STATUS_RSP_SIZE];
 	int ret;
 
 	/*
@@ -418,9 +461,9 @@ static int atmel_i2c_wakeup(struct i2c_client *client)
 	 * Wait to wake the device. Typical execution times for ecdh and genkey
 	 * are around tens of milliseconds. Delta is chosen to 50 microseconds.
 	 */
-	usleep_range(TWHI_MIN, TWHI_MAX);
+	usleep_range(ATMEL_I2C_TWHI_MIN, ATMEL_I2C_TWHI_MAX);
 
-	ret = i2c_master_recv(client, status, STATUS_SIZE);
+	ret = i2c_master_recv(client, status, ATMEL_I2C_STATUS_RSP_SIZE);
 	if (ret < 0)
 		return ret;
 
@@ -429,7 +472,7 @@ static int atmel_i2c_wakeup(struct i2c_client *client)
 
 static int atmel_i2c_sleep(struct i2c_client *client)
 {
-	u8 sleep = SLEEP_TOKEN;
+	u8 sleep = ATMEL_I2C_SLEEP_TOKEN;
 
 	return i2c_master_send(client, &sleep, 1);
 }
@@ -461,7 +504,7 @@ int atmel_i2c_send_receive(struct i2c_client *client, struct atmel_i2c_cmd *cmd)
 		goto err;
 
 	/* send the command */
-	ret = i2c_master_send(client, (u8 *)cmd, cmd->count + WORD_ADDR_SIZE);
+	ret = i2c_master_send(client, (u8 *)cmd, cmd->count + ATMEL_I2C_ADDR_SIZE);
 	if (ret < 0)
 		goto err;
 
@@ -521,7 +564,7 @@ EXPORT_SYMBOL(atmel_i2c_flush_queue);
 
 static inline size_t atmel_i2c_wake_token_sz(u32 bus_clk_rate)
 {
-	u32 no_of_bits = DIV_ROUND_UP(TWLO_USEC * bus_clk_rate, USEC_PER_SEC);
+	u32 no_of_bits = DIV_ROUND_UP(ATMEL_I2C_TWLO_USEC * bus_clk_rate, USEC_PER_SEC);
 
 	/* return the size of the wake_token in bytes */
 	return DIV_ROUND_UP(no_of_bits, 8);
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index 2f76e107340e..20afe2da4f8d 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -10,28 +10,39 @@
 #include <linux/hw_random.h>
 #include <linux/types.h>
 
-#define ATMEL_ECC_PRIORITY		300
+#define ATMEL_I2C_PRIORITY		300
 
-#define SLEEP_TOKEN			0x01
-#define WAKE_TOKEN_MAX_SIZE		8
+#define ATMEL_I2C_WAKE_TOKEN_MAX_SIZE	8
 
 /* Definitions of Data and Command sizes */
-#define WORD_ADDR_SIZE			1
-#define COUNT_SIZE			1
-#define CRC_SIZE			2
-#define CMD_OVERHEAD_SIZE		(COUNT_SIZE + CRC_SIZE)
+#define ATMEL_I2C_ADDR_SIZE		1
+#define ATMEL_I2C_OPCODE_SIZE		1
+#define ATMEL_I2C_COUNT_SIZE		1
+#define ATMEL_I2C_PARAM1_SIZE		1
+#define ATMEL_I2C_PARAM2_SIZE		2
+#define ATMEL_I2C_CRC_SIZE		2
+
+#define ATMEL_I2C_RSP_OVERHEAD_SIZE	(ATMEL_I2C_COUNT_SIZE + \
+					ATMEL_I2C_CRC_SIZE)
+#define ATMEL_I2C_COUNT_OVERHEAD_SIZE	(ATMEL_I2C_OPCODE_SIZE + \
+					ATMEL_I2C_COUNT_SIZE + \
+					ATMEL_I2C_PARAM1_SIZE + \
+					ATMEL_I2C_PARAM2_SIZE + \
+					ATMEL_I2C_CRC_SIZE)
+
+/* Definitions for the status Command */
+#define ATMEL_I2C_STATUS_RSP_SIZE	4
 
 /* size in bytes of the n prime */
 #define ATMEL_ECC_NIST_P256_N_SIZE	32
 #define ATMEL_ECC_PUBKEY_SIZE		(2 * ATMEL_ECC_NIST_P256_N_SIZE)
+#define ATMEL_I2C_GENKEY_RSP_SIZE	(ATMEL_ECC_PUBKEY_SIZE + \
+					 ATMEL_I2C_RSP_OVERHEAD_SIZE)
+#define ATMEL_I2C_MAX_RSP_SIZE		ATMEL_I2C_GENKEY_RSP_SIZE
 
-#define STATUS_RSP_SIZE			4
-#define ECDH_RSP_SIZE			(32 + CMD_OVERHEAD_SIZE)
-#define GENKEY_RSP_SIZE			(ATMEL_ECC_PUBKEY_SIZE + \
-					 CMD_OVERHEAD_SIZE)
-#define ATMEL_I2C_READ_RSP_SIZE		(4 + CMD_OVERHEAD_SIZE)
-#define RANDOM_RSP_SIZE			(32 + CMD_OVERHEAD_SIZE)
-#define MAX_RSP_SIZE			GENKEY_RSP_SIZE
+/* Definitions for Indexes common to all commands */
+#define ATMEL_I2C_RSP_DATA_IDX		1 /* buffer index of data in response */
+#define ATMEL_I2C_ECDH_SLOT_DEFAULT	2
 
 /**
  * atmel_i2c_cmd - structure used for communicating with the device.
@@ -51,7 +62,7 @@ struct atmel_i2c_cmd {
 	u8 opcode;
 	u8 param1;
 	__le16 param2;
-	u8 data[MAX_RSP_SIZE];
+	u8 data[ATMEL_I2C_MAX_RSP_SIZE];
 	u8 msecs;
 	u16 rxsize;
 } __packed;
@@ -77,39 +88,6 @@ struct atmel_i2c_of_match_data {
 	size_t eeprom_zone_size[3]; /* all atmel devices have three zones */
 };
 
-/* Status/Error codes */
-#define STATUS_SIZE			0x04
-#define STATUS_NOERR			0x00
-#define STATUS_WAKE_SUCCESSFUL		0x11
-
-/* Definitions for Indexes common to all commands */
-#define ATMEL_I2C_RSP_DATA_IDX		1 /* buffer index of data in response */
-#define DATA_SLOT_2			2 /* used for ECDH private key */
-
-/*
- * Wake High delay to data communication (microseconds). SDA should be stable
- * high for this entire duration.
- */
-#define TWHI_MIN			1500
-#define TWHI_MAX			1550
-
-/* Wake Low duration */
-#define TWLO_USEC			60
-
-/* Definitions for the READ Command */
-#define ATMEL_I2C_READ_COUNT		7
-
-/* Definitions for the RANDOM Command */
-#define RANDOM_COUNT			7
-
-/* Definitions for the GenKey Command */
-#define GENKEY_COUNT			7
-#define GENKEY_MODE_PRIVATE		0x04
-
-/* Definitions for the ECDH Command */
-#define ECDH_COUNT			71
-#define ECDH_PREFIX_MODE		0x00
-
 /* Used for binding tfm objects to i2c clients. */
 enum atmel_i2c_capability {
 	ATMEL_CAP_ECDH = 0,
@@ -144,7 +122,7 @@ struct atmel_i2c_client_priv {
 	struct i2c_client *client;
 	struct list_head i2c_client_list_node;
 	struct mutex lock;
-	u8 wake_token[WAKE_TOKEN_MAX_SIZE];
+	u8 wake_token[ATMEL_I2C_WAKE_TOKEN_MAX_SIZE];
 	size_t wake_token_sz;
 	atomic_t tfm_count ____cacheline_aligned;
 	struct hwrng hwrng;
-- 
2.53.0


