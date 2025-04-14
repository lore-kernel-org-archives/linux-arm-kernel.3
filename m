Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84ACC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEdsN0QQfHEZyuRksboskfejhwkQQL9RrSRK2ZgyfhY=; b=k4kwEMdXXcLn6jlD/O4CSA0v4P
	kfZ5wtKhml6B6jpPIdLCW/Nmyqeaw/dahB1IoYppjoyCP6WaTQ4h3s359bwIpENLjhc/EgXeXxiFQ
	/Chl1nfQn5nEjNYD10mGjrMDVMFkNJIyDr79OJ93SxCqHHV3oEa5omF6KlLQhG96dHza8acDtClq/
	PJ8gI08olHeBYlVycxfWyV2a7KDQRkiQUx5Xfh8VavG6Vb+H6G2M+6UefawSNvf1LYzJsUR2+q4mj
	j+FDMWcKjhbLqY2U7EhIG+b7kq2A6zhL5RycqV0g/JcLf0qNFpZBaSVycveeW9vzBb9aMOTHhzJWF
	EuMRo5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LWi-00000002a7r-2ndL;
	Mon, 14 Apr 2025 15:15:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LFc-00000002Vpg-3hjP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744642652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TEdsN0QQfHEZyuRksboskfejhwkQQL9RrSRK2ZgyfhY=;
	b=VNJPAZ0VtH8fouJtKaf9/MB8VgT7mOgiVXcbx2pXqaImnAxSE55xZaNrzvdcFRsgzr5cjE
	C2sthgIyvEd+e1B4wqO0Sb3/a1KEsghZCHK/G0qdzwXkJeDTA12YgfTuWrRYHlxYVTfppM
	KoK/ckQOd/YYlxnjldY7mlMqFQXHaho=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-WkbzLJGyM7qvu_GUYp44aA-1; Mon, 14 Apr 2025 10:57:28 -0400
X-MC-Unique: WkbzLJGyM7qvu_GUYp44aA-1
X-Mimecast-MFC-AGG-ID: WkbzLJGyM7qvu_GUYp44aA_1744642647
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso22396185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 07:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642647; x=1745247447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEdsN0QQfHEZyuRksboskfejhwkQQL9RrSRK2ZgyfhY=;
        b=St6mEifw6J3DztAg4EKx/4/cnhcfS6iQPpZMUwza6hokDb/tfQvYLHOUeM2Z5mRcru
         WTwD8opwXb27gBxjPXHx1smDpIR3ZjlxC0BDiURxt6qdAn7J/UJ/gwqI5OO7mCN8TiUR
         3prlt2L71y+rtjvTPLnM6JN6vjhgLqtTdkKbpU5gMoQFRfEUGMcHGolWtQinU48ZqV0u
         LXgqqYvhKSaYRTOp0h+L3RHXdrOSKCDdivfGhBFrGqwSW+pi1oVTODclecM4JzZh9HRJ
         hW5wz/iY3sTTshLTOS0UcB3wR4A52eSSvoE1WrQ32Slqm1D4jBJxiSl4/nh6WfLNGTbO
         4MpA==
X-Forwarded-Encrypted: i=1; AJvYcCVuAzsVLA1xgr7SW+NpaNp/gVqgFqb3ucmKgpaqwxyP4p3lojBMhsGZ3/Vgd/nR1t3YAkotgZKBLASKOrK3H7VC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs2oEvCtqwbqLlm8Odg39E9aIHSqsTffXL2pl6IErHkhVttx5c
	3f58YTUowFhTlC4QHZiCMvCK8W6/m6f+uB/+NMyigcLtAzKZuKCAIhsG5b2iBJgc2vjvkfYj9Vw
	YDSxAd3/c5eqj+6NW8yvUWRfJz6AqMjbiDL09uowTuoBIo01KP05G47spMu5+gR+RLpdrYFlC
X-Gm-Gg: ASbGncu7jA7bV+J22/uty6bqUEAXDC9Ka+vKNSEccbIfT9Nb+aEgsYqfJOMq7G39+9J
	zaEO0hh65ZgOuj6OleK7n+ms6//nNvNB+sPZD9mQ4ulPesFp8gwEogmrhWvx1/C+oHwN1F/r/t6
	MYCIjZcNAD/ZdB7wUsSjUPyb5Ba2UnNGYSfDHsokSousBuBNQePcmKKEFrvEypl9FE6F7zaSTqa
	G1FTkHY/aQ7u0OZHU92KZvDHi8ztruoCRmQwjXvJ1KMl9FavL4erUrOfka6QCk/faaUcoZF7zeF
	MuGg/po525LcP+rks6Sv/36X
X-Received: by 2002:a05:600c:3c84:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43f2ea651bcmr156784605e9.7.1744642647221;
        Mon, 14 Apr 2025 07:57:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEApvHF30zJot3Tdd63G9ANE7NhVcm3CdypTeNAQ4xjY84TRnswJTqy6gQmM2qCnJiia7ICYg==
X-Received: by 2002:a05:600c:3c84:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43f2ea651bcmr156784335e9.7.1744642646611;
        Mon, 14 Apr 2025 07:57:26 -0700 (PDT)
Received: from localhost.localdomain ([193.207.151.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9797aasm11333393f8f.56.2025.04.14.07.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:57:24 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Huewe <peterhuewe@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sumit Garg <sumit.garg@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
Date: Mon, 14 Apr 2025 16:56:52 +0200
Message-ID: <20250414145653.239081-4-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414145653.239081-1-sgarzare@redhat.com>
References: <20250414145653.239081-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cbk_iv9fspciZvbCrt97GJAKQKz0DJfNI86iDZtygoU_1744642647
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_075732_993696_73EF8D24 
X-CRM114-Status: GOOD (  21.94  )
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


