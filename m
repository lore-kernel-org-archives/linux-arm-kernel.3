Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584FCC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 08:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jjogm03xe8uH9FEbFpCE/wwTjsk8lbbHkAYLp5l0W8=; b=vKmvSBZw5x9bckeKn+KZ6G6wa/
	LkHxBmRTmFP/11njUtGMh2ND8t2o70yJd0iF6nxj6nq9O+1wDtUd6zCo02xqk2tmsCVUCVF00sTtv
	LHue+pEd0DxOukKejz0v1KZ0y6PW5SMy8d54SQxYNeITZA+RaUVM3A4uVL072HOCiTdwVh+GFTf15
	+nNWIDAIgNQA7g6ImzrrIn9BnUIU0ZEdOemUK6FcJzrydqpZCKCFI9xE/7DkDK496NSZ9wbyUrvf3
	YdRXWpQjHc41xEw24ZRKXEFBbG5zKiZ4O+rqBkNatv5yKC1qvXrJY92UrLYAZtz10KXvgn+PUw5B/
	qUsTBXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24Qw-00000003H0G-2BeQ;
	Tue, 08 Apr 2025 08:35:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24PA-00000003Gly-2EfG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 08:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744101238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jjogm03xe8uH9FEbFpCE/wwTjsk8lbbHkAYLp5l0W8=;
	b=I3ZcBt8dVoDn5QySHfynajg0jYUAla8pUBaeeD//rgElR+cF7Aa6E93h9kt3i0VcNbaOzh
	f9JXb4C+L/fqM2k9dclUNe0yhBXYP7e/zGJZHg0uB+qc8xun7s5L7SgVVWxxvNgTarSy6N
	YTXF8CfGWZVwg62nfZJdpOSDMPL5IIo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-Srr8WeliOZGOgm9SQfgOqA-1; Tue, 08 Apr 2025 04:32:28 -0400
X-MC-Unique: Srr8WeliOZGOgm9SQfgOqA-1
X-Mimecast-MFC-AGG-ID: Srr8WeliOZGOgm9SQfgOqA_1744101147
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d01024089so46052145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 01:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101147; x=1744705947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jjogm03xe8uH9FEbFpCE/wwTjsk8lbbHkAYLp5l0W8=;
        b=g+Xdy7zHsqIn/9dZz9ASSYCASgY463/jMiUOhlWAzm1QVt8piHsb9/5Bq7ew7fVn1F
         +/jc9Rriq7V4xVT1PsoD0nvVLCFiNhlCPu1BDdSeHP1QVcNBkXsC/092s2oeNGZzTRqd
         cXdxe9G0u4N6TAiR3U4P4W8OcYGMpEjnbZ06ckunh2SbPLVuro9B04kEVAfqOIhbQ2mY
         LaDW7qOnQyeqU8fE0jkcs2frsUk2exT+Fq9+7uBh5HUv/nL1uZfbGpxUtYLM65eNtkf1
         VfeKeroEjm6zDzXzi22Rcsoha99afwW6LvlmxzjdKNKr3FB2+fQzRKV6v7tNj3TcQ7kk
         6xew==
X-Forwarded-Encrypted: i=1; AJvYcCXyHr7bGGJslb2KDKliGVhfId77RvhxJDnxV7oUUApVASQMUgei70wm9StK9z5Nd6IBMLamW20GFpphjEcVvIHf@lists.infradead.org
X-Gm-Message-State: AOJu0YzF1HfOAAdSnATlVKsMuXI2CZRebCw6UxMCgtrpzoPB/lqolXHF
	bftYLzCfgCdieVjBpJZIn2uskxGydeUaISpziIIZ2FnuoGCiS0B22jvjq9ZWiW46FfZGla2ygqs
	Tx8+qRhUn8FbEwuol7TTC9urr1Lp0TGPzx4WPqOe2H72BAYNoN9qpUPVrP8HkGxwOj3L3MBh7
X-Gm-Gg: ASbGncsnMvpMZIo1GWiq+fVrL7iVUWg7yR6FGx4/yPTHIQWssKBQcmQbCZTZf64xHTQ
	tkl+nn7DLWPrpOgZfNyX7J9UBiG5YMKI35PFhoJL1kAQ58cTkTbwW8OAYIyCie4RdjM07GVWp4+
	Zopo7RTPOFIzI2SXqHPcXaklO9XsocNlrowH9TaM13g9YJeSaNF9SjN45jFqB2jy3UK9eYZxc96
	tYgvM5pOph1j23RiXygNRg3g/DyIr+a/rMQV5ao41BPjXmHN4cSU4xkbzGy+dLm2OtOTHEhzpN9
	U+7oLfKEJ4RqFm0SlqV/1599fJqk9PV0z0dkR170qIvgUCLaA/Whp3jfDbaMTwNpbw==
X-Received: by 2002:a05:600c:3489:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-43ecf9c77ecmr122637395e9.21.1744101146617;
        Tue, 08 Apr 2025 01:32:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO0mHtfU6tjdIaTwIU3mFKYSEAXTq1PTv+mq26VUWkOFRfaSqPIV+zWD9QaZteOnlwamweeA==
X-Received: by 2002:a05:600c:3489:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-43ecf9c77ecmr122637075e9.21.1744101146092;
        Tue, 08 Apr 2025 01:32:26 -0700 (PDT)
Received: from stex1.redhat.com (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm14565216f8f.66.2025.04.08.01.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:32:25 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sumit Garg <sumit.garg@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-integrity@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v2 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
Date: Tue,  8 Apr 2025 10:32:07 +0200
Message-ID: <20250408083208.43512-4-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408083208.43512-1-sgarzare@redhat.com>
References: <20250408083208.43512-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qIQledpWQ1MfHrKaHJ5RtLV6bxGANuWFaVrMU2A67l4_1744101147
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_013400_632597_23D83C81 
X-CRM114-Status: GOOD (  22.39  )
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

So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and
return responses in the same buffer used for commands. This way we
don't need the 4KB internal buffer used to cache the response before
.send() and .recv(). Also we don't need to implement recv() op.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
@Jens @Sumit can you test/review this patch again since we changed the
core a bit adding TPM_CHIP_FLAG_SYNC instead of send_recv() op?

Thanks,
Stefano

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
index 637cc8b6599e..b9adc040ca6d 100644
--- a/drivers/char/tpm/tpm_ftpm_tee.c
+++ b/drivers/char/tpm/tpm_ftpm_tee.c
@@ -31,46 +31,18 @@ static const uuid_t ftpm_ta_uuid =
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
- * @len:	the number of bytes to send.
+ * @buf:	the buffer to send and to store the response.
+ * @cmd_len:	the number of bytes to send.
  * @buf_size:	the size of the buffer.
  *
  * Return:
- *	In case of success, returns 0.
+ *	In case of success, returns the number of bytes received.
  *	On failure, -errno
  */
-static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
+static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
 				size_t buf_size)
 {
 	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
@@ -82,16 +54,15 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
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
@@ -105,7 +76,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
 		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
 		.u.memref = {
 			.shm = shm,
-			.size = len,
+			.size = cmd_len,
 			.shm_offs = 0,
 		},
 	};
@@ -117,7 +88,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
 		return PTR_ERR(temp_buf);
 	}
 	memset(temp_buf, 0, (MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE));
-	memcpy(temp_buf, buf, len);
+	memcpy(temp_buf, buf, cmd_len);
 
 	command_params[1] = (struct tee_param) {
 		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
@@ -158,17 +129,20 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
 			__func__, resp_len);
 		return -EIO;
 	}
+	if (resp_len > buf_size) {
+		dev_err(&chip->dev,
+			"%s: resp_len=%zd exceeds buf_size=%zd\n",
+			__func__, resp_len, buf_size);
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


