Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F32C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3VsEn91YkrzZR4A/Mgdq4+jTVTrvyIrxkItYrsxgKtg=; b=RXFfCrQB7bd+ja4ipd4Lpzyy2V
	tSAWYspDXvWFGu4Qk7ws7W45zvniDM/BHok6irCD94cMGJRd0Y05JlLfLmWincCcwp829efQJcwKA
	pGw/jQkblACjw/5hpztZ1Zc+AWZNYz7C2qAs5F7M6PLKlUhk9sFXe1abZOqXjNfIhFjmzYKzJ2YQJ
	TjbrxT2IPM5ZDcdxM8Au8uLpzWyPSANWC0fDiSVvoVu0sKMtzoheMMCRd9SBgSsWzJvPzahSAQZ+f
	6yBBKzC5VZblLOoevYBaJC4jzMmmSouc1gnLmDdr6xo0jMHmuOWvBNEKggrCXs5gU8vjR/kx28SOZ
	h0EFH5hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbyQ-0000000FkCH-1k6K;
	Fri, 20 Jun 2025 13:40:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbUD-0000000Ffqo-0kvc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 13:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VsEn91YkrzZR4A/Mgdq4+jTVTrvyIrxkItYrsxgKtg=;
	b=FvkW7g3jpwEeVONdYDNDiS7H/6UDOYy+7jGKCsyP/fnTvyoeDPEGsEpmlGwoF49v7KFZyi
	JiBtoLlyIov6618IPQpHLIhyMNJYRc1t9lDO8ZaY2gc9kTyfigS5mLlYquzTPjFTn2nOKQ
	2ExsbOEMFxU97pMpe2sEwufGM5APoD0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-6oo6ovyrNOyERA3NvNDkSg-1; Fri, 20 Jun 2025 09:08:51 -0400
X-MC-Unique: 6oo6ovyrNOyERA3NvNDkSg-1
X-Mimecast-MFC-AGG-ID: 6oo6ovyrNOyERA3NvNDkSg_1750424930
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a579058758so869395f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 06:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424930; x=1751029730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VsEn91YkrzZR4A/Mgdq4+jTVTrvyIrxkItYrsxgKtg=;
        b=lJXs4xQBw3x2BS5jNu9YZHWslqP5oL8/cLGmQcucXYLx8XNd0dTrW12kNViwFDCVBy
         XaXFE8eLP5J+xOxrSIL63jPs4FJ4Z0ncUBhnIvw0hF4HZL/Egov6Oj6BtYdQDc/hLB0R
         6ZU2D5t6sFLJSoaIOR7S5ATERSpMWaJpbEZ5jvVbR/eUDI6dD8IFuVYGuPgOyZ9FaMNc
         3S5DDVOjOgdmyIBuW2pu2mqQyK2/N7czWeoOD8bCKqvJj1xTMm7xlOLPADytndJB78AU
         ZNXKYHoys2oW3R4cXIMhESmZdU4QqCzjQ1BO4JC3gROK7/5fylt81iPlW6LUNiR3wh/q
         JK5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvXUKBsJm+/xn0ObgKjFE5TX0x3+8KeoTUtPvhK0VR+2fpEGcAug9SpDLJn2OEKkC6zpsRq6pgVV9AXZ/cVCeW@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo51b6+nEenU28gtg3WaCYr/gwNFMU+QrGK7RwUC61bCE1/jnF
	VkUf5a5QzaJ1L1n7oTJZ8L5RUn3bTrj16wTGFB5X8Nr9RVlhGDD8Hwtb1sH8Pn8BQ4YTBTKYwe+
	igXlGxYs0a80p280oQz9sPwt/Ye/UH8YpJAVLuBwHWjtEX6WJI8HgZ3GGvc6jhk1EHeN3UA0LAG
	Qi
X-Gm-Gg: ASbGncsgui1O5YDjQEptWjdrzxhJZIhhWesTdTzmwLWrflNGTHjucsIiGOQDAAHvyiO
	kt0Vn8u8iFRuCtZpPuN+q2IvdGS684ETc2OUu0O2kv+Yi98uAY91z23oi/dpBDQf8WgbNX4zyYV
	ND3K9xIAfaxCUZp21KunYNY3W8GWHRyDvKmPYSIGpn0NFtpkl9n0j0YJmz3v9Uo5mbt6Cn6kFWi
	5m+trhu+qH02twPFvS64+A1V9HLTh5ypCp1ogCNllk6AN5PcIAmzfTQJn0UDJc0OegURix3zGX+
	2XvHSDNylXXc9rjrDFXBaZLuSOeVfNIaBBY=
X-Received: by 2002:a05:6000:2484:b0:3a4:ddde:13e4 with SMTP id ffacd0b85a97d-3a6d12eb394mr2179372f8f.58.1750424929583;
        Fri, 20 Jun 2025 06:08:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6J1XzXAkrwIk+wJqXhYpgZ7P5H+/wRdPeseCTHYPIt8eTkRipb+nkvNVEX6eFh42F8eJ+sA==
X-Received: by 2002:a05:6000:2484:b0:3a4:ddde:13e4 with SMTP id ffacd0b85a97d-3a6d12eb394mr2179299f8f.58.1750424928851;
        Fri, 20 Jun 2025 06:08:48 -0700 (PDT)
Received: from localhost.localdomain ([193.207.146.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d11909f4sm2017336f8f.88.2025.06.20.06.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:08:48 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Naveen N Rao <naveen@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v6 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
Date: Fri, 20 Jun 2025 15:08:09 +0200
Message-ID: <20250620130810.99069-4-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130810.99069-1-sgarzare@redhat.com>
References: <20250620130810.99069-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tylEIXAYRlP3ua9aeURl0f7YXZbsQ33vmT3uCPbeQMs_1750424930
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_060853_294555_FD8C5935 
X-CRM114-Status: GOOD (  20.35  )
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

From: Stefano Garzarella <sgarzare@redhat.com>

This driver does not support interrupts, and receiving the response is
synchronous with sending the command.

Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
->send() already fills the provided buffer with a response, and ->recv()
is not implemented.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v5:
- changed order and parameter names to match tpm_try_transmit() [Jarkko]
v4:
- added Sumit's R-b
- reworked commit description [Jarkko]
v2:
- set TPM_CHIP_FLAG_SYNC and support it in the new send()
- removed Jens' T-b
v1:
- added Jens' T-b
---
 drivers/char/tpm/tpm_ftpm_tee.h |  4 ---
 drivers/char/tpm/tpm_ftpm_tee.c | 64 ++++++++++-----------------------
 2 files changed, 19 insertions(+), 49 deletions(-)

diff --git a/drivers/char/tpm/tpm_ftpm_tee.h b/drivers/char/tpm/tpm_ftpm_tee.h
index e39903b7ea07..8d5c3f0d2879 100644
--- a/drivers/char/tpm/tpm_ftpm_tee.h
+++ b/drivers/char/tpm/tpm_ftpm_tee.h
@@ -22,16 +22,12 @@
  * struct ftpm_tee_private - fTPM's private data
  * @chip:     struct tpm_chip instance registered with tpm framework.
  * @session:  fTPM TA session identifier.
- * @resp_len: cached response buffer length.
- * @resp_buf: cached response buffer.
  * @ctx:      TEE context handler.
  * @shm:      Memory pool shared with fTPM TA in TEE.
  */
 struct ftpm_tee_private {
 	struct tpm_chip *chip;
 	u32 session;
-	size_t resp_len;
-	u8 resp_buf[MAX_RESPONSE_SIZE];
 	struct tee_context *ctx;
 	struct tee_shm *shm;
 };
diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
index dbad83bf798e..4e63c30aeaf1 100644
--- a/drivers/char/tpm/tpm_ftpm_tee.c
+++ b/drivers/char/tpm/tpm_ftpm_tee.c
@@ -31,47 +31,19 @@ static const uuid_t ftpm_ta_uuid =
 		  0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x96);
 
 /**
- * ftpm_tee_tpm_op_recv() - retrieve fTPM response.
- * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h.
- * @buf:	the buffer to store data.
- * @count:	the number of bytes to read.
- *
- * Return:
- *	In case of success the number of bytes received.
- *	On failure, -errno.
- */
-static int ftpm_tee_tpm_op_recv(struct tpm_chip *chip, u8 *buf, size_t count)
-{
-	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
-	size_t len;
-
-	len = pvt_data->resp_len;
-	if (count < len) {
-		dev_err(&chip->dev,
-			"%s: Invalid size in recv: count=%zd, resp_len=%zd\n",
-			__func__, count, len);
-		return -EIO;
-	}
-
-	memcpy(buf, pvt_data->resp_buf, len);
-	pvt_data->resp_len = 0;
-
-	return len;
-}
-
-/**
- * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory.
+ * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory
+ * and retrieve the response.
  * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h
- * @buf:	the buffer to send.
+ * @buf:	the buffer to send and to store the response.
  * @bufsiz:	the size of the buffer.
- * @len:	the number of bytes to send.
+ * @cmd_len:	the number of bytes to send.
  *
  * Return:
- *	In case of success, returns 0.
+ *	In case of success, returns the number of bytes received.
  *	On failure, -errno
  */
 static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
-				size_t len)
+				size_t cmd_len)
 {
 	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
 	size_t resp_len;
@@ -82,16 +54,15 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
 	struct tee_param command_params[4];
 	struct tee_shm *shm = pvt_data->shm;
 
-	if (len > MAX_COMMAND_SIZE) {
+	if (cmd_len > MAX_COMMAND_SIZE) {
 		dev_err(&chip->dev,
 			"%s: len=%zd exceeds MAX_COMMAND_SIZE supported by fTPM TA\n",
-			__func__, len);
+			__func__, cmd_len);
 		return -EIO;
 	}
 
 	memset(&transceive_args, 0, sizeof(transceive_args));
 	memset(command_params, 0, sizeof(command_params));
-	pvt_data->resp_len = 0;
 
 	/* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of fTPM TA */
 	transceive_args = (struct tee_ioctl_invoke_arg) {
@@ -105,7 +76,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
 		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
 		.u.memref = {
 			.shm = shm,
-			.size = len,
+			.size = cmd_len,
 			.shm_offs = 0,
 		},
 	};
@@ -117,7 +88,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
 		return PTR_ERR(temp_buf);
 	}
 	memset(temp_buf, 0, (MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE));
-	memcpy(temp_buf, buf, len);
+	memcpy(temp_buf, buf, cmd_len);
 
 	command_params[1] = (struct tee_param) {
 		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
@@ -158,17 +129,20 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
 			__func__, resp_len);
 		return -EIO;
 	}
+	if (resp_len > bufsiz) {
+		dev_err(&chip->dev,
+			"%s: resp_len=%zd exceeds bufsiz=%zd\n",
+			__func__, resp_len, bufsiz);
+		return -EIO;
+	}
 
-	/* sanity checks look good, cache the response */
-	memcpy(pvt_data->resp_buf, temp_buf, resp_len);
-	pvt_data->resp_len = resp_len;
+	memcpy(buf, temp_buf, resp_len);
 
-	return 0;
+	return resp_len;
 }
 
 static const struct tpm_class_ops ftpm_tee_tpm_ops = {
 	.flags = TPM_OPS_AUTO_STARTUP,
-	.recv = ftpm_tee_tpm_op_recv,
 	.send = ftpm_tee_tpm_op_send,
 };
 
@@ -253,7 +227,7 @@ static int ftpm_tee_probe(struct device *dev)
 	}
 
 	pvt_data->chip = chip;
-	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2;
+	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_SYNC;
 
 	/* Create a character device for the fTPM */
 	rc = tpm_chip_register(pvt_data->chip);
-- 
2.49.0


