Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58CFC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 15:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8R/1ZeDKDjc3H414LGRfrF2tWtTtWCHG2fr+aJnFmy8=; b=Dug9amML2766duxcpx4llyg+e5
	eiTz1FfLAgT+GBRDPHeQNrQzmxSq5V4zeS+xofu+i1x4QeFlYbKFqpivmOuvce9tYB+hF0QIlDEVW
	gFMmcaIl+gFWn1ThOfwSWLN3thLiapcXQcT/dceaMwrAE3crl2GKO2SlC8bNiRZu8dS5uDDNq1DQg
	6xonUlpvMxCfZGtLEN0YzNopTUYd+m/Y4mxUTBxSfAS6G9bpnc1Z7qYj5ef/V2QNA3AYeQgnJU/lD
	x7hg+vqNdXYEzMLyFHBVVxMV3vEmpGMbDOWlr6yT3+HJKFGxWeE3yyAbYEkAOapbM6pkre9K1FqeY
	j1FVIBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LOn-00000002YFp-13Ke;
	Mon, 14 Apr 2025 15:07:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LFY-00000002Vmq-3vlV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744642648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8R/1ZeDKDjc3H414LGRfrF2tWtTtWCHG2fr+aJnFmy8=;
	b=U6G3pIrCyA1bItjCN4+aSfgmcfsactR/R0vXPRfI0UmybQ8yWntaftd/SdhTeLwaAnE264
	jG7b4C93FIZAd15DFHDprFNC+XIneSuiBlTUDrbAe4kXj/e+YO96oe+PU2tQuzk2Z0kOZE
	97fm714WTXrmu1ZHuoe/W+7KXMbu/i8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-azdxRD7sMAu-P8nBIVpH9g-1; Mon, 14 Apr 2025 10:57:20 -0400
X-MC-Unique: azdxRD7sMAu-P8nBIVpH9g-1
X-Mimecast-MFC-AGG-ID: azdxRD7sMAu-P8nBIVpH9g_1744642639
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39c2da64df9so2514321f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 07:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642639; x=1745247439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8R/1ZeDKDjc3H414LGRfrF2tWtTtWCHG2fr+aJnFmy8=;
        b=Ri4CR5kdjt9zKuuALXky89ownNepenOTvZKaHexLUJ7Wa2lEk0WzJD2mONp/moBksZ
         y9x0RP+LEDWTaS6oj+Q+C5XKZ70XUOhO9lzLuaMx2VkaVpiy2m+jkTCHxOuz/Nt+/h/I
         djdoRYdrRm/TFT3nXlQAn3hXhgiQEg1NOcVlV8G4Um12Is8mEgDOSAzTtBysgtbmGiat
         7WDdtREhdF7u/wxcbP+aNetnjyvUhwG73BpEK34hhb7iYBHDBJeYufunFhib39T6uReq
         7FRKQOOC7Ck2bCfmI4P1/htdD/mxnQRmsTUcipqdKSSFcyK8cYOuNOh9S647v8QKrhba
         O1XA==
X-Forwarded-Encrypted: i=1; AJvYcCVEpPFCSlJLnymfFercTD8KfaHY2z2h669VE3FF5bXC2OkALm4qX+sCwPgTIo8UHe0u8ha7V4PEcGyEobXAw3iz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz83Y52IIcPbE+o5REKgzTFwFuNShaNa6jmPCugTzixMIJLJI6p
	kA6XnZiBj8/odJ5Hd63/40gKx06V8TuczG28zQHL5yItRbaLG6E7uGy3grpFiyWmnuMtzSEuVtW
	8kp4pEMwFEfkRwLzg5Lq3P9467YJcC7Hv6XMgzOvWZWg3B4Op+KzBTo3HRqaujRY7gftgs6T7
X-Gm-Gg: ASbGncvOQAdTeWqwR0v5DlaptocWOUV2uk5+Ypj8Xwgc4h04Jv//6i59dQQ6e72zMIM
	cv2DUmZAvcWspx5FMNwmutCw5L6Am2kkPHny7sE0kfR6wi7WB9KG2vNFIX6dLgMaf2joGKFcNG9
	rNAvGEmVTeRjpNafV4hX0jTSNoLpNjhMuTtWwvwXJu1D/9CuJVQRu8C88n8jO1tY/sTbf32RtFn
	6zyrwRs14y89UXvhS7zfIqEzJhfSoUnYxVIGbMfVmyyHnE9DBQ7feRNuhwyiXPQjpEhemvDryS3
	JjMyaalZQ00jDnRrajDBVl6D
X-Received: by 2002:a05:6000:1787:b0:390:fc5a:91c8 with SMTP id ffacd0b85a97d-39eaaed2015mr9037547f8f.53.1744642639387;
        Mon, 14 Apr 2025 07:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHztG+erjxi0kPl4f2XqgvwdUxEBu7vsO7NjlFZ0D8kctkVzUnk4g2BZgxZgM+ahM52VN9G9g==
X-Received: by 2002:a05:6000:1787:b0:390:fc5a:91c8 with SMTP id ffacd0b85a97d-39eaaed2015mr9037507f8f.53.1744642638681;
        Mon, 14 Apr 2025 07:57:18 -0700 (PDT)
Received: from localhost.localdomain ([193.207.151.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cce3sm11395582f8f.74.2025.04.14.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:57:16 -0700 (PDT)
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
Subject: [PATCH v3 2/4] tpm: support devices with synchronous send()
Date: Mon, 14 Apr 2025 16:56:51 +0200
Message-ID: <20250414145653.239081-3-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414145653.239081-1-sgarzare@redhat.com>
References: <20250414145653.239081-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tqeFXxCVAGIcPA4ftGn4eFZ-yJDXzSsfJX6G6IMjJO0_1744642639
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_075729_050705_BF41B21F 
X-CRM114-Status: GOOD (  18.40  )
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

Some devices do not support interrupts and provide a single synchronous
operation to send the command and receive the response on the same buffer.

Currently, these types of drivers must use an internal buffer where they
temporarily store the response between .send() and recv() calls.

Introduce a new flag (TPM_CHIP_FLAG_SYNC) to support synchronous send().
If that flag is set by the driver, tpm_try_transmit() will use the send()
callback to send the command and receive the response on the same buffer
synchronously. In that case send() return the number of bytes of the
response on success, or -errno on failure.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v3:
- fixed comment style [Jarkko]
- renamend `out_send_sync` label to `out_sync` [Jarkko]
---
 include/linux/tpm.h              |  1 +
 drivers/char/tpm/tpm-interface.c | 20 +++++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index 2e38edd5838c..0e9746dc9d30 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -350,6 +350,7 @@ enum tpm_chip_flags {
 	TPM_CHIP_FLAG_SUSPENDED			= BIT(8),
 	TPM_CHIP_FLAG_HWRNG_DISABLED		= BIT(9),
 	TPM_CHIP_FLAG_DISABLE			= BIT(10),
+	TPM_CHIP_FLAG_SYNC			= BIT(11),
 };
 
 #define to_tpm_chip(d) container_of(d, struct tpm_chip, dev)
diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index 3b6ddcdb4051..3dc06836f932 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -114,8 +114,19 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 		return rc;
 	}
 
-	/* A sanity check. send() should just return zero on success e.g.
-	 * not the command length.
+	/*
+	 * Synchronous devices return the response directly during the send()
+	 * call in the same buffer.
+	 */
+	if (chip->flags & TPM_CHIP_FLAG_SYNC) {
+		len = rc;
+		rc = 0;
+		goto out_sync;
+	}
+
+	/*
+	 * A sanity check. send() of asynchronous devices should just return
+	 * zero on success e.g. not the command length.
 	 */
 	if (rc > 0) {
 		dev_warn(&chip->dev,
@@ -151,7 +162,10 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 	if (len < 0) {
 		rc = len;
 		dev_err(&chip->dev, "tpm_transmit: tpm_recv: error %d\n", rc);
-	} else if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
+		return rc;
+	}
+out_sync:
+	if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
 		rc = -EFAULT;
 
 	return rc ? rc : len;
-- 
2.49.0


