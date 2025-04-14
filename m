Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA197C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 15:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sa1KMzPVUbpw2KNCiE/Fawx4j9zSiPJcyY6hcGjqFI=; b=wIwAzvP/J/uahaV4psESSCENf6
	LbKgkpr/2927ShZKO0xu2Q93G69IQr6aZ1X0irRt4mKDocbV4WSBOtPoE9n1+WLCeDvOu6EkkOWVB
	I7IrMGR9vbBl0JFel367SS3HZmO2Gsl2VtNzI11X8qlxCXcwVg2TH1B0H2frQjj/VWcF4sQSUzSZ9
	/BZnkUp011ewtM03XFDFooP5dCxwUoVnnlxMbzH8FnciVmuTgBWVNsFOM03qnQd+XOp9V9nNfDcwQ
	4zRuz+dIdI27SJhOjtYxnYvyE65csvHeMWEUYhw/tPC2ES0TZ+mJNjyNdyRInrqgLFmNpsQH3D1eY
	Mdisw26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LYY-00000002aX8-1e9h;
	Mon, 14 Apr 2025 15:17:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LFg-00000002Vsa-2wD6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744642655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5sa1KMzPVUbpw2KNCiE/Fawx4j9zSiPJcyY6hcGjqFI=;
	b=G18p53FmWq6K3GFevjVbsWSFImk8rnNKFOstC6jnhLYaAc1/QiduKKfh2HwPPT669gSZzY
	ljA+G64VIW/I8tWts8SM+Ypb58bwiNCe6pvdDCjA81/eS3T6AvZrnugcaX5JLIGjINh/Ul
	HkR1i7Rl7QLdzv7ZH9q3+MLoOqVCPe0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-H3WACiEHPL2_Gg2FJVa_4w-1; Mon, 14 Apr 2025 10:57:34 -0400
X-MC-Unique: H3WACiEHPL2_Gg2FJVa_4w-1
X-Mimecast-MFC-AGG-ID: H3WACiEHPL2_Gg2FJVa_4w_1744642654
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912539665cso2786401f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 07:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642653; x=1745247453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sa1KMzPVUbpw2KNCiE/Fawx4j9zSiPJcyY6hcGjqFI=;
        b=Z5NL4qypPoJUZiHWmGD5dFIRR6l5FFMzPXTqU7qMZcV9zcIvRJzjRggBgChoMTflxg
         Fp12DfzACbYe3cgFTlDmtSm7XVfEywSAk9smE40VVlhoOqurOOsL1LEkJnRxj/rhK2kq
         6XvP3VB22NARbowUBnSI01nvSnXGEAdx6tcH1beFyvOXJ21abLR5yBjgSmbU5kLnh/YW
         hrw8VlmrPaO2Ua47cowqSEycEuQOJ9CcJbVbzIxCx/PfYb3WmVGhbMYbzRSJCoq4n2sS
         z+PpvEwSeP4aGyMnU17iRawC1HU0dIorjI5E/W+B2ZIDhghBMaVkIAyC7jIYaHcdETJd
         NmCg==
X-Forwarded-Encrypted: i=1; AJvYcCUgYezFVC/x61O7Bko169NYOI8g0VUo9HrvOl8tOMnsYxBKOry1B4yg5ZeOPWJUUwiUCCd/gnu0wqukuc63aDu6@lists.infradead.org
X-Gm-Message-State: AOJu0YxqqAiMXtPGt5ChZJ3av+rPvIBeNHwWJjeCcMLRU0Jogt98Sy38
	mvVdoYoGvVGiTRxfIZm4xQ7p3KgFDtx9EJHQj0gIJAdN/YTT9s4lYZ91pE5dk0NfEVe/DYYwBUy
	4P6boiFrkFFYmD2w49qPE9R8xSCzc7C45TjLe2ubEdPFiWPcfsGrHYfOHNDSmL5gatsyzThlt
X-Gm-Gg: ASbGncvBFThQFUOZOAWIuIQfavh5q5RUuXnkJ2JQfWL8UqmM9k7Id7hQ2lEg1XfCvsD
	O6XP/MA4jFhrTyBlUmCj+wfEMs/rMoqnOf67okx6p2wc6dgRROSWqnVEfEwHnXdvI2qs2Kv4PSF
	gP/89MCZLSf05JLAdUlUCLpKYtTR42628CVSw5UylLMEy+mn60UOvhRRcQzH4eml8AGcEpb/o3o
	4ByCSF+GUpNr9jzqZ9+kaF0J8hSOtIY5aoM/4ebyanPLjtulz6wzwJV3yb7cYJGAeZ5k3XN3vq7
	wWTyewKEMqzai7wxpQ3PSVNy
X-Received: by 2002:a5d:5f56:0:b0:390:e535:8750 with SMTP id ffacd0b85a97d-39e6e48846dmr9576037f8f.9.1744642653499;
        Mon, 14 Apr 2025 07:57:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUePoA8CXCKRWtYvnKKIInk/j0CbqjuJ2mLiXYjmccJQ4ZcE+fLBnmyZcdyCqfwL3pNjKyHg==
X-Received: by 2002:a5d:5f56:0:b0:390:e535:8750 with SMTP id ffacd0b85a97d-39e6e48846dmr9576006f8f.9.1744642652841;
        Mon, 14 Apr 2025 07:57:32 -0700 (PDT)
Received: from localhost.localdomain ([193.207.151.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cdfdsm11483858f8f.61.2025.04.14.07.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:57:32 -0700 (PDT)
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
Subject: [PATCH v3 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Date: Mon, 14 Apr 2025 16:56:53 +0200
Message-ID: <20250414145653.239081-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414145653.239081-1-sgarzare@redhat.com>
References: <20250414145653.239081-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _da1udQNb0YRSv60BXexHDRXpry26DvhPVXojjuq4k0_1744642654
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_075736_809538_65EDB4CC 
X-CRM114-Status: GOOD (  21.10  )
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


