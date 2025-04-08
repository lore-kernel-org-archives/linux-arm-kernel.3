Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B019C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 08:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UWgpwscQp73PyDMRD5EZKbcQGdo2l2UKgmDSHNPifY=; b=IgjnKoV1kBqRdqPlB4FC0+nYe+
	XowXda5PzByMlPc2/yty8ivHcNWfptqqrw+B+/VvApKVj84FvIB2R7LGAiesV5u4sb4VjcxWZE7N+
	CDJLMwq392bmP1WNJffUv5NJDiSXXOLyN5NYs6ucIFnY2au7i0X6yjgMfYLp4ziuWjPY4YANgJgd4
	wmIdgjDvVBMVyxa2oJb5sL0Lpq2SujPDC7yEUsLv5kNfFKUFQVVG6aRWL/+K6kntKXNlm6PpZ17uK
	aYl4+pBuP2DfZhnlaVWWQRdlnRp5Aoh2uGrm7K/neJFIlOuBcjsEUTU12hnkdz4tZZJJYK/nwaZCS
	ovBxI4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24Xr-00000003I0Q-1Tua;
	Tue, 08 Apr 2025 08:42:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24PC-00000003Gmh-35iJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 08:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744101241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+UWgpwscQp73PyDMRD5EZKbcQGdo2l2UKgmDSHNPifY=;
	b=EdxWNWdr+AOmq8b27m/XhjKFIWG56DjPuFTvke8kIJhUEYoELm3jxfunAP2BQIXZ8REM+R
	MyWMfREUqa/7iDKWQ7gFpQdZpIrcJfBrATri4KyvYQq5dcc3b9CYi3ciKtWed2F2HUwN74
	QghO72VqP5CMBzmhUhMBgDf5OKuwn04=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-t4FCZdp_OZycC4qmVk0dOg-1; Tue, 08 Apr 2025 04:32:32 -0400
X-MC-Unique: t4FCZdp_OZycC4qmVk0dOg-1
X-Mimecast-MFC-AGG-ID: t4FCZdp_OZycC4qmVk0dOg_1744101151
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so16031815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 01:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101151; x=1744705951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UWgpwscQp73PyDMRD5EZKbcQGdo2l2UKgmDSHNPifY=;
        b=J9G2sRUvorURDfET5OPKFIsVpE4/HK+9F60HSoifUPdLmAYPbXIRWeL6J0B5RszKNs
         xPGN91R1eSg/a5DabLW7p8LzpCuXIIK7N9ZnUadbzJaY/VmLQ2qhUAVTcuDE9W67xCZz
         +/NgqUHc00KbxsDZVcrwkCIuhH6BN7f5SlGWmC0D6XIqK2FCQbv/LgfScW0V24jQvuYl
         U6UnJe2/b+Or72CMNzu3qpzYZ7NkSDqx4MQusmDrhvVrp/JwmTSv/DOjsjbwp3ZE0/R9
         TMyuaM0El2YnCsC3JXOqxbz9kKmOKfAzb3SlQUG/4Gug2wUgPIWh8nveOdKdkCdhYnpE
         eLfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPABjPAirZdnZjDYUREDtGzySnuZvbXsmB7dmAbXXb5mJESycKrC5QrBKC45+47yDaFRRhqCwyAlOyysUyFkMg@lists.infradead.org
X-Gm-Message-State: AOJu0YyEXcThVuhDTw8duulP1ABr0DkYDXr2LHt45xIv13TzMRlwTgdd
	tQfax85g0A/H9jm6RccCJggdJw2QTdVV0ZABApfb639E19Um0Gwt0+nZfQmMwOJuVraII9SKm+b
	1USBbf9c5aSVKk2ddd70BB0/JHigvF072S3M5msTpjUGlED1VY9Y7p9nwaODAJrKaqiIuhtuW
X-Gm-Gg: ASbGncunvkt/+puVJRaho/ey5q8WwEFk3vuOz4qo+GRqwKF/hMA3+FV3LkIy4Bj+R/u
	+pC43NoZWUsKaf9Xsg5VSGmrwWY1q5m00BPQg9D+L5CYb8K4Xripj8xJiC4pTbsVingGacDN2iz
	/t0qSB9sFij0TTIFyrQHo9gWOeW/EYbXJlatwcwpir1ZsQ4louw2TzDOmqQWDZR2sHJ8ZeI/VXV
	GM9WSq5vzA6Bgb09uXe/xdyOj7fHUuLTDJ4ae+gxjRskLiRHAm7dUH0E7uHSmL6mGfHAxzN8RQP
	MBlu3VR6bHEyQ62jfhbBs8E+UT2GaDLbOrhNMdzlGMdkK1RVTKn/bEJToKTcs2guVQ==
X-Received: by 2002:a05:600c:1384:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-43ecf85f216mr158235395e9.8.1744101151413;
        Tue, 08 Apr 2025 01:32:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz2ZKXaEi+HUCetPqQ0pAcpS8InkZmoD9d7JUgJGma+dknJFHnGD8z9oUR2s/51/65NGDLdw==
X-Received: by 2002:a05:600c:1384:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-43ecf85f216mr158235025e9.8.1744101150843;
        Tue, 08 Apr 2025 01:32:30 -0700 (PDT)
Received: from stex1.redhat.com (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b1352sm154886505e9.37.2025.04.08.01.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:32:30 -0700 (PDT)
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
Subject: [PATCH v2 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Date: Tue,  8 Apr 2025 10:32:08 +0200
Message-ID: <20250408083208.43512-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408083208.43512-1-sgarzare@redhat.com>
References: <20250408083208.43512-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vqOP0ArbGQ6HAwTQBqUiLzgaB5VOemwz7xQ82HUSJyE_1744101151
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_013402_846129_5795F131 
X-CRM114-Status: GOOD (  20.79  )
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
don't need to implement recv() op.

Keep using the same pre-allocated buffer to avoid having to allocate
it for each command. We need the buffer to have the header required by
the SVSM protocol and the command contiguous in memory.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
index b8aa7eb567de..547d4c4f7a53 100644
--- a/drivers/char/tpm/tpm_svsm.c
+++ b/drivers/char/tpm/tpm_svsm.c
@@ -25,38 +25,32 @@ struct tpm_svsm_priv {
 	void *buffer;
 };
 
-static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len,
+static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
 			 size_t buf_size)
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
+	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, buf_size);
 }
 
 static struct tpm_class_ops tpm_chip_ops = {
 	.flags = TPM_OPS_AUTO_STARTUP,
-	.recv = tpm_svsm_recv,
 	.send = tpm_svsm_send,
 };
 
@@ -88,6 +82,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&chip->dev, priv);
 
+	chip->flags |= TPM_CHIP_FLAG_SYNC;
 	err = tpm2_probe(chip);
 	if (err)
 		return err;
-- 
2.49.0


