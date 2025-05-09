Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBC0C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gkeb/9Kdfy78P2DpuPGWOQmqeRSDCl/s8JKK0Bwndg=; b=DJEC++5QyNMnrvcA3EJdlRJm60
	LTZ9AcTfDQ+zP2eV9aSiqvkcmSui4oVyvtqE1hIY+7NdnVK/FxqKyhciDjrbnM3GqvHeYiu0azhW/
	6L0dWflkZk+isWr9jZbchgdTZC898dq3w6kJ8100qND0YRvJlPwqmg7hF1ywok7dDboluzN1vrLIC
	RrbEvif7X+zAomoGCTtKN3IXPFnZGiLO8WdrDKF3NIatqGjFRWHE94pddDLQ8FiTgRx5fQEMmyipW
	CPqu1gH3/dS1JRzeKbIZRWtwKwHk5ERpQw+AZ9SAUGFvlJCJd+0pBWN2tnijP1yh1kUDyI3TCu/9/
	yutu3I0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKHd-00000003999-1liz;
	Fri, 09 May 2025 09:44:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJYH-000000030e6-3MGz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 08:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gkeb/9Kdfy78P2DpuPGWOQmqeRSDCl/s8JKK0Bwndg=;
	b=BlxOQgP7BecC9Vo6jjtAcaUAdlG0aUR3MkjV6MrOTSrb3XLH2fsbu8SlPlZ67x73w2+7l9
	FHHD7oh+RNUwtuo1Wo7307Nz1xpuBjEshFcSTuLYgUTdQkOpL59K3U93+W648fgnv1v3X5
	FGJPMebTVg50TjMWqAJPEDDrVGy3gy0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-9WrDcfCnOwO5f89LhSYmKw-1; Fri, 09 May 2025 04:57:51 -0400
X-MC-Unique: 9WrDcfCnOwO5f89LhSYmKw-1
X-Mimecast-MFC-AGG-ID: 9WrDcfCnOwO5f89LhSYmKw_1746781070
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-acf00f500d2so148363666b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 01:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781070; x=1747385870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gkeb/9Kdfy78P2DpuPGWOQmqeRSDCl/s8JKK0Bwndg=;
        b=qm+4diUSrG4YMN6SYcODj+DoYU4TMmy+uQryHHevkUA8BkasFvb/w7q+QNhPhp+jpm
         1IqA9VzvAyBO1BKEWUcyhG/KzugyZx/mJDkLS/S8Hw6ufd1AtSSyd0aiYH7i+uNDhLLj
         5pBHhRU1+qZtdlLqHSeBQelroG0ajEN6JC65WKbFsmHMsHzFqtOCZMwVpoKFW1CSmUC8
         aCq64jPoFUGssOyxzRvmPKC1gaQl7d3POxL/rzlSDAjZyPSxlNvgFhTQySskH7/Z/Aqy
         dlzp0MAMVpcpoMhKN5PoZGFf8923SHHHXhQjV2v2J46LqCQYWm+e20iy6+7fEA1e8HXM
         Bohw==
X-Gm-Message-State: AOJu0YxaKZaGikkiCvw1eloZINKtmvo5FD7C2PtyhIndshGC3gLgyt6l
	2hVriVwU5OSz1i2J5uUld7BoIADwS8+SotxrHhA2eNwSJdF5Li1cUzrd5S68DNAwRGuXYRBP6Fb
	JL1LIrOsPkbzQTLXxWsAO9C8ZpiXlBoZolNPYeogjRmzxddjCYXPkGoc0fy38EqKqHm/D15pS
X-Gm-Gg: ASbGncudugYrwJFFQf90PsrB7yu13WthpjgXomjr1ecgXaZsVscdAyr3708s7tsT12P
	QY4uraVsuOSobIXAsOWkdndOm1Z1H+CsTLCVOEJPh5XMrahROjBYu4atHIRFHsLxvSlBXwzQ0l0
	cvU5ljIyVHIVRrO+rnLpaMvHpF39BuTgkZRRrLTM+N/YId6evfA0CZsP3m1DgGAMOcx++hbFQyX
	QhLY49z+5eLwbGrOdOtZTpgrte7Tz5TnxtYMhUM8MG/27TPrHYnyyJ2YtSyG8T6ZI6uANGSA6oo
	JWyiBuH2IJ1pxhrkSjNu+wqPcw==
X-Received: by 2002:a17:906:ba90:b0:aca:cda4:9aae with SMTP id a640c23a62f3a-ad21927d0d6mr208671666b.37.1746781070374;
        Fri, 09 May 2025 01:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm/6oRhoG7o/lfsJVdPERf6/D/JJirfP83vdMoj15DtJopabMpuCr2u+MViV0A2cvILTEMug==
X-Received: by 2002:a17:906:ba90:b0:aca:cda4:9aae with SMTP id a640c23a62f3a-ad21927d0d6mr208668366b.37.1746781069774;
        Fri, 09 May 2025 01:57:49 -0700 (PDT)
Received: from localhost.localdomain ([193.207.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219348781sm119504566b.61.2025.05.09.01.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:57:49 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-integrity@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v4 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Date: Fri,  9 May 2025 10:57:13 +0200
Message-ID: <20250509085713.76851-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509085713.76851-1-sgarzare@redhat.com>
References: <20250509085713.76851-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3YVkILrIZDJVnGI2-HPhal-Km1-qXsuOiHAM5Z6Jel8_1746781070
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_015753_912679_F4ED86C3 
X-CRM114-Status: GOOD (  20.97  )
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
v4:
- reworked commit description [Jarkko]
---
 drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
index d3ca5615b6f7..db1983072345 100644
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
 
@@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&chip->dev, priv);
 
+	chip->flags |= TPM_CHIP_FLAG_SYNC;
 	err = tpm2_probe(chip);
 	if (err)
 		return err;
-- 
2.49.0


