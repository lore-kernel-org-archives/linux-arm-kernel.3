Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9282AC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=; b=jjovwlJ4tHrApuDNTlciJD4hwz
	FeacBIBQK9JOgwdy4FsNNhwCbY5tYfY20bULgyvSFqSjt3KffjLLlUQlCscNT3Zq5oYfMzd284F0a
	Ngr4MRseeaYKsdpuBU53eJ2iPdp2qQ2RWISS9//QmWIQnmH6qsufaQbrQsyJttV+VBxixXLZGHFyR
	hCyRN7czKeowlGiBpJPeQA8sfFCqs7Osk15li0e6Hj98tvaDzcujUJkD+5pisoiCXaek02vg7kPGI
	x4Xf+UzwELNPDq/CTX+uUCW3Dr/PJ0DObaVBhtWMNXEJnZITrnnxjPUsi7LECYHdbcx5WiwdB4BHA
	bg0AKwJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbyQ-0000000FkCY-3xqw;
	Fri, 20 Jun 2025 13:40:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbUK-0000000FftW-2voj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 13:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
	b=We1nMmtAXovCqg0KTQbUNRpXmiTEhDs4B+PjTjDpH5wjv5hu3CCp3sM6WWIs423C3/hQX3
	AkP1RFz7Y4cHMVX/oZu2EzPDLhBAQNNcspM7ffczvQXmY8aCW71XxMM/bToW8d76c1Xc4E
	ws64kV995vJOzvSj2PiyV+Sn7bSxy5I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-AKazDoTQM12bt6Xix9-KoA-1; Fri, 20 Jun 2025 09:08:58 -0400
X-MC-Unique: AKazDoTQM12bt6Xix9-KoA-1
X-Mimecast-MFC-AGG-ID: AKazDoTQM12bt6Xix9-KoA_1750424938
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so1125887f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 06:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424937; x=1751029737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
        b=dVGMqi/iawrXTQ4yaMstGU/Tc+w+l410AWcEkvNlRPKK/Uc0BdBfuFftKfbBheE+5i
         pN3qnqP/VJuJrexKGyxBOvKruVdW6TmwF+BfsINd+gIIOPrIFVKu6fUD/GzD5/0QOWhP
         nV/DqVKpOcoWIXuFFic3Qy4LEbTiQS94pm0inD8GoOkw68sdm43LUySDNUpNlrVd/O2y
         4XQOWBPFp6UYer2f5X3JPNbKq1pI5mUbFJJL77tOJv8ZmMcbt1xWow2BIOi0UbE5ALwb
         jIvLe/mCmH429cWrsr4jeooXERyM0zjpCPWkIpp1UrN0KZcMCE5hi2iByYUoK02fGg9w
         L+CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXggKzvc8LCeqQ651PpDE5HFBqQeo+nuOxjiJSfKOrmejh6URDdYd+o3qVTSyH95VzTELByy9piraK/JHRpm2RY@lists.infradead.org
X-Gm-Message-State: AOJu0YzN270VTpf/jRxOOt1swHSxueXJXm6tdhfhx7WxQdbf8zFpTI+W
	mqA5lce3h2wYe1A0PPAjRhnq8iTW8afOX4fR0GlVcHTBPE0dNlRQyuljY89hDTd6pxiMotyDL2n
	9Oy7UV9hahpxYgFy3QdQ5kdLW9LpOvdZ7FpuaxljHXkzGejQXie51JVTOVrbpKcDqkOvGX+PcXl
	e/
X-Gm-Gg: ASbGncvGc89nlpQbffkUZ5y8jQmOZ6uuoBEubH0Ilw6KdSGptqD2iXLAKhoHLtiKgBb
	BshWaxMTUH+dzEt8o5Tfgg57Pwy3Tp2BGpL/WzDbTBQMgiRiZBYW/vWR3sWqBXPwchLdsDdVAbK
	ozahVpCuNyOjZBGigx75NoJ+xvLhCWgQa1pd+VF//F1AXhKkraMuMq3Jihe33XDqPQPwXNgHtGY
	hgHRqXz5rsOC63jr6wNhnJxc7iI4yHuJEElfVPWwHGKEGBALGzGred9BCW+zz2e090uOFwGLOuO
	37CMvqwoueGKOl2R2iNNv/tdqvDpikgWAmE=
X-Received: by 2002:a05:6000:23c1:b0:3a4:fcc3:4a14 with SMTP id ffacd0b85a97d-3a6d13176fbmr1522861f8f.34.1750424937551;
        Fri, 20 Jun 2025 06:08:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErCfEU/IVq7uI6YOAV42Q6eu/6bPqI5NWLxqRlPFpxO3LmsQRBOu3Tts8nxYdGgHaYTR596A==
X-Received: by 2002:a05:6000:23c1:b0:3a4:fcc3:4a14 with SMTP id ffacd0b85a97d-3a6d13176fbmr1522807f8f.34.1750424936821;
        Fri, 20 Jun 2025 06:08:56 -0700 (PDT)
Received: from localhost.localdomain ([193.207.146.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18215sm2026391f8f.29.2025.06.20.06.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:08:55 -0700 (PDT)
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
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v6 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Date: Fri, 20 Jun 2025 15:08:10 +0200
Message-ID: <20250620130810.99069-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130810.99069-1-sgarzare@redhat.com>
References: <20250620130810.99069-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KccpLhcr-URd0WwN3ZuYA4TkbXDs0Njhwa-FCmKjjV4_1750424938
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_060900_809847_59A85932 
X-CRM114-Status: GOOD (  20.82  )
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


