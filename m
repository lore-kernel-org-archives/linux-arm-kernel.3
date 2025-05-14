Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873A5C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=; b=Osqmpyp5RqZPh5vf+9lA+Fv2DI
	r7jM++8MaWKMl4Tcj4JJHF95mboMbdRef7ZpYI6EcbR+P7hQBur6O2nWaBtLL4OBgKWKUyXxgt0y2
	Pel5vU/myNaToHvV0u+qXJviCZjnb7OZDUaMCFaJz43wBjWatOfFvhy2YT4SQRYddEKKixheQb9rp
	g1XVMhDeqCga2ySTOqttKM/I0OobBDy68WtdTvmlJC2Njg3KvGL4PpFbNmb+HST8y/6Eh12QZWVki
	eWH7JPyINGIUZPgw9ynibBU9Y1VV2ZBGMIVDKSCsvznn5NWdPxsfabB/1kBxtogSXWrMS+8KzDgvY
	1kafk9kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFD5s-0000000FPmz-1Ry0;
	Wed, 14 May 2025 14:28:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCRz-0000000FFPH-0163
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 13:47:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747230430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
	b=IKx13H1sCVKeYa1w+Ufh0pma692i1314FYJdYPzrunVbCg3raECIqmf5w4PZuc73k1X2GZ
	RCWo7me3xnWAZrlz1c/HQLjT8CVPivwMXCNmg7EBb4TtZivFXkQwt3MtROv9pSfH1t6ecQ
	FtODlBhCgJ6V9kQrghBgJ/XgJkspinw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-lrfhKdz0O0-9BO3f7_uS5w-1; Wed, 14 May 2025 09:47:08 -0400
X-MC-Unique: lrfhKdz0O0-9BO3f7_uS5w-1
X-Mimecast-MFC-AGG-ID: lrfhKdz0O0-9BO3f7_uS5w_1747230428
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-441d438a9b7so3829635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 06:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230427; x=1747835227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
        b=vD+yrz5/YtJMFAQUcxEt3ETIcVdemfT+NgWwFPlaAvPLwEbvOxFq18t5v3KKxHQvHh
         Lrj/0XkM59QBZvEzC3vr1prZ2NYpyqxwVL4QPSe8IK9T3sfVyUEqrMB0bpHlQHUTbw05
         U4KPI2LjVja4LKqKEYYeWzqT8zK8Hx7h6h3sjQKjC1FVxIsEZEJcU7SLMN08GjUDLxDx
         ChXhsKw92DyoHMbxDAvNX2+gg+bw7CaPmceuTj06zmeGvZzRgHGqjPjmtum9wwuLVKgg
         MNnO97WZYStmmHmDL87bnbUrJPLe2skolZfM6oEAJ1r9hWjSmuS2wvysc7Gee8a8iEGa
         AXOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9C85o6MuBgCzQMEpK5Dg+U7lPTe/j+DEY/gotYDQfk8WGTOdE1/nxSxne8Mp4UjYdBKF4cntZZfGxBAY4CXrT@lists.infradead.org
X-Gm-Message-State: AOJu0YwtfsnXoYlEUu8OhE279E0rXCC0JVb4pcMWJXkiqKliwG677goV
	mhfmWCfyWClKPiZUj/5UPw/RwxwH6eLH/wwZQv6Ciy6FmJCOzo9aFqGTUT6jT/echK6bGobTDF5
	QQt00tivV3oOzUin/sYsE1zj9wRHbPodP9oDCWRFTz9ddQQyROJDWFZcOOnlZJUrP8LxgGjke
X-Gm-Gg: ASbGncsrRyHUB6522KcoM2/Bup3IORQI986OO9HAcZskyVRJd2tyjuNkbbo/idc4U08
	ZjSwAedYGIxzPpXHAPhztYTJqXofsxGzhMCI3YHltGKSRMeeLA6yxQnB9XoqKmAvDt/OfiWi9YV
	XibWaAlWp3nIme1HpLWyVv2sA5XO+qtwhMQ304GOqHuurrVpRaexKAc0LCCIRPJRoln6/RufVni
	a4pthEre4QhonF8GfFPO2uMzmgmnZacSTj62ySPNqpF08stguJ6BiUFAhKmTZMR2vfOMTvpdr77
	/JdivmjHSUkQQD/8bDY=
X-Received: by 2002:a05:600c:4f53:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-442f1a0d906mr28926375e9.2.1747230427581;
        Wed, 14 May 2025 06:47:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQcNilqw5pw/zInUa+0ub8X2j9IE5W786j2MgQiDjsofCPC9ebkToa0QhXEfe/ocJNSBGqaA==
X-Received: by 2002:a05:600c:4f53:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-442f1a0d906mr28926015e9.2.1747230426999;
        Wed, 14 May 2025 06:47:06 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.148.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380615sm30931135e9.16.2025.05.14.06.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:47:06 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-integrity@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v5 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Date: Wed, 14 May 2025 15:46:30 +0200
Message-ID: <20250514134630.137621-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514134630.137621-1-sgarzare@redhat.com>
References: <20250514134630.137621-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Fw73EoKaP2lWNUvSvdpdpoeiki8LL8-MLY5fRtHKoYI_1747230428
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_064711_127074_6E0BD4E7 
X-CRM114-Status: GOOD (  20.89  )
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

Keep using the same pre-allocated buffer to avoid having to allocate
it for each command. We need the buffer to have the header required by
the SVSM protocol and the command contiguous in memory.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v5:
- changed order and parameter names to match tpm_try_transmit() [Jarkko]
v4:
- reworked commit description [Jarkko]
---
 drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
index 0847cbf450b4..f5ba0f64850b 100644
--- a/drivers/char/tpm/tpm_svsm.c
+++ b/drivers/char/tpm/tpm_svsm.c
@@ -26,37 +26,31 @@ struct tpm_svsm_priv {
 };
 
 static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
-			 size_t len)
+			 size_t cmd_len)
 {
 	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
 	int ret;
 
-	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
+	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
 	if (ret)
 		return ret;
 
 	/*
 	 * The SVSM call uses the same buffer for the command and for the
-	 * response, so after this call, the buffer will contain the response
-	 * that can be used by .recv() op.
+	 * response, so after this call, the buffer will contain the response.
+	 *
+	 * Note: we have to use an internal buffer because the device in SVSM
+	 * expects the svsm_vtpm header + data to be physically contiguous.
 	 */
-	return snp_svsm_vtpm_send_command(priv->buffer);
-}
-
-static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
-{
-	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
+	ret = snp_svsm_vtpm_send_command(priv->buffer);
+	if (ret)
+		return ret;
 
-	/*
-	 * The internal buffer contains the response after we send the command
-	 * to SVSM.
-	 */
-	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
+	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, bufsiz);
 }
 
 static struct tpm_class_ops tpm_chip_ops = {
 	.flags = TPM_OPS_AUTO_STARTUP,
-	.recv = tpm_svsm_recv,
 	.send = tpm_svsm_send,
 };
 
@@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&chip->dev, priv);
 
+	chip->flags |= TPM_CHIP_FLAG_SYNC;
 	err = tpm2_probe(chip);
 	if (err)
 		return err;
-- 
2.49.0


