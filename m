Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C0BC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDWPbShizfOGB/EjWmdUWFa8dOmwyE7Lp4wOXMg3HCo=; b=WlxfKoN31X9Rzovu0XkFH5WLxB
	fRkJF5oskHLuav7GtSA9XNYWSp/LCo9tD4MaWAe+bt8r12clyzdecvvnF4uxgi+gOt8gWSWTFvlYV
	PCEVrVe5aorHnXNb/76WM1rMSbLvodARW8coloBt2xVelJ2PGc6gB9bKpyEp3obRalwjBmgA1tmIX
	n4wkZ6ZVdMkC+A4dqoW2oKdAn3cYdDV7UkwyLlS64mwyipMrnKPd+7HaGPtL7ZOUgdNS5D/0c59MM
	3NioQ0ZBuQbqk0ymJjJfTKKvmmrZWriRPEOqQx0f50lUB77b3cagYS3VvqASqDmL7ReCW9caNKKxb
	4SRhF0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDK7x-000000037fC-1uZC;
	Fri, 09 May 2025 09:34:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJY3-000000030Wn-3Rgx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 08:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDWPbShizfOGB/EjWmdUWFa8dOmwyE7Lp4wOXMg3HCo=;
	b=bChmwnYrbEK3fz5UXBRq7z0CEh80YmAoDNW0ULH0YOVUZe4SRA8/Fd7YWWI9ChqBsixEJ1
	B/yeouwPykUWZ12/wc/q3gWaypvzGvyNhyns++AWxo4SmsN8FpzJjW1Xg41L7u39KcgZsV
	fiaZKwqZ9vnJWu6eFLFWA28w/SOQRek=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-hSCne9stOM2oYR8iSF5anA-1; Fri, 09 May 2025 04:57:37 -0400
X-MC-Unique: hSCne9stOM2oYR8iSF5anA-1
X-Mimecast-MFC-AGG-ID: hSCne9stOM2oYR8iSF5anA_1746781057
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acf00f500d2so148341366b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 01:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781056; x=1747385856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDWPbShizfOGB/EjWmdUWFa8dOmwyE7Lp4wOXMg3HCo=;
        b=XgtPLp0DPdWCPHZs0cuLyCbk2tBSUJ/UUful0+mm7ARpdn7bmjLy1iFrb2inYLOZUx
         edk5xbfkq1L8VX7vcYpzgsmh7CLeLsZ3dH5cflfmMjESGNh8FBYwHpHz+rtFvcbUhsRF
         R//ImiGCsiTyH4iYa80rYzhajHyGNzCuMRXUTlXHx0qosfn0qSZzQFJLnEnIwZh2DV3I
         lkJxHtDHWr6ae+D6tSWhDxu212DadxfKXyRpg5n9nqiNkljiNAn0KBDnWu5bDQfy8n0P
         7H3ZVSbNYiLQgBOIYbu+bPykeEJyFxIVRI5UXRuxnu20q0YcgiBjzHA9KkoGmPWErnQL
         4g8g==
X-Gm-Message-State: AOJu0YzvjSmAporyM3ksBOe6z/TEhEDRha/nIoldOVZ2flGmUvp/glVd
	Z6z5dy99JbQoKB771s5W28Kqscjfp8ex1HfciEnLs6b/uHdh/wbWvVOuwoY2lr/3yzCim4xO78P
	1zXKzCUAqecMrZF74RxhQkvzH6JNgu4NYJ2rmDeNUv+2IYeTVoNEzxT2RIv9AxK4ESYusOWS0
X-Gm-Gg: ASbGncsOKY66n8+j5t2PuDelcVfbNm49kyjgexDXi2kDK5M6RVo8sVI22fGQzoPrCcv
	SVx3uJ5nlPmthOAkl+xBzv064iu0caIXQVVOFympqxNEkWlCXiY3ULol1gLUcevuelBa5Np1C5F
	WYwH4pNRlE/XmJWaIhMHPb+WmqRFjCgzSC0CyDPzBo5zBIW0+v3T+XKP+PnFMbSfR8HTnI0FJ80
	jYTnfG1PbniCY++AwJztd7AlwZfYIE4z8r4lwC4aytJhhwLrSaiJkizyB5Gz4hsOWAJGQPkpPXu
	uOwEC9cX1fN14PvXvTzTFtD1aw==
X-Received: by 2002:a17:907:6d17:b0:ace:d442:e3a0 with SMTP id a640c23a62f3a-ad2192800admr253472466b.39.1746781056554;
        Fri, 09 May 2025 01:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWC2UI3h5FxOwhQZy5rykHQm7izno8puX6wcw4GMYOzhRsRbgt+ZXqQ0AfZuUWsqn/llgi1A==
X-Received: by 2002:a17:907:6d17:b0:ace:d442:e3a0 with SMTP id a640c23a62f3a-ad2192800admr253468866b.39.1746781055796;
        Fri, 09 May 2025 01:57:35 -0700 (PDT)
Received: from localhost.localdomain ([193.207.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd37dsm117478266b.124.2025.05.09.01.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:57:35 -0700 (PDT)
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
Subject: [PATCH v4 2/4] tpm: support devices with synchronous send()
Date: Fri,  9 May 2025 10:57:11 +0200
Message-ID: <20250509085713.76851-3-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509085713.76851-1-sgarzare@redhat.com>
References: <20250509085713.76851-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Yt3EJGCW1g5nNnuL9h-48bIJpluTHTcNQuK7FAx_Icg_1746781057
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_015739_929500_79154B24 
X-CRM114-Status: GOOD (  18.74  )
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
temporarily store the response between .send() and .recv() calls.

Introduce a new flag (TPM_CHIP_FLAG_SYNC) to support synchronous send().
If that flag is set by the driver, tpm_try_transmit() will use the send()
callback to send the command and receive the response on the same buffer
synchronously. In that case send() return the number of bytes of the
response on success, or -errno on failure.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v4:
- added Jarkko's R-b
v3:
- fixed comment style [Jarkko]
- renamend `out_send_sync` label to `out_sync` [Jarkko]
---
 include/linux/tpm.h              |  1 +
 drivers/char/tpm/tpm-interface.c | 20 +++++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index 7ac390ec89ce..681661c93869 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -351,6 +351,7 @@ enum tpm_chip_flags {
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


