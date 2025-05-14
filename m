Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289C6C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HM3A1DQYgNN+uT3lHR2nzVPEIJjvspM419SembxT0i4=; b=M3/6eqcjkNomNioOhui83UethU
	GqaSAdGV7sAXRn5/S7Sg46QUgkIPhotIjJZyZAQUNNMxL5IAL7c3DJj+ccQ/geAxpiBgpp4HAbnlE
	ZoYA4vr/XOk3hX8QCEGdT98i1YIfMB6RMpmjprd24u6K3uOS8xRgt27MQ58I4TiC2oTrjvOJwESoq
	F1FkqI1nIbFP/twG9SWYX1Hqrr7CJdH6wqoXck96a3wmPn0pwF821b559kzrvUH9tCdr3MpJi54kB
	qpw+FXZwjFW7/F/BPw8MlEu4NemWeA6X/YPSMJHEzlXv8HEW23kWZf9jkuDWCvxqEf9K5lxTdnTCc
	6r8PhjQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFD3s-0000000FPWU-2p05;
	Wed, 14 May 2025 14:26:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCRj-0000000FFLZ-2nX5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 13:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747230414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HM3A1DQYgNN+uT3lHR2nzVPEIJjvspM419SembxT0i4=;
	b=RtkAzRuT4fzeXkK3oyvkLnAw8+1uON5701sYYNh8wK2n7SKJzvXvvjlyHtkFlha7Qn0znK
	tOo3U5v+4JBpb1ovouTcyauN9pBzVEcmTqQDhv4oO6wp3xzjfaPwBnpooVtRcQOoSXvy0I
	67GvSfUxt6amsL/a4vnEB5Qh2mWdmco=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-z8w0VAdwMoaIf2deryq3Ng-1; Wed, 14 May 2025 09:46:53 -0400
X-MC-Unique: z8w0VAdwMoaIf2deryq3Ng-1
X-Mimecast-MFC-AGG-ID: z8w0VAdwMoaIf2deryq3Ng_1747230412
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a0bd786a53so2937861f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 06:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230412; x=1747835212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HM3A1DQYgNN+uT3lHR2nzVPEIJjvspM419SembxT0i4=;
        b=lwVsiDl/wCx0tof/StP1DhJSBFmxfnWkmQFuxzzsWNV1vSm2cYlGI1W+1E1bVR/e4q
         EXlosJyLlMKr9rar1IYbw9UEMBww12Zw9yq3XzUQhPJq/sdkmvfHKJYDyMC/gdWecrxf
         YBwtFaR8DniICmy5twFFLAv7xJv1ux75vLxlcpwhAINSpYMdEBFHCVENGRcHmlT+Yg49
         5rpx0VV24zDlA7u1xKAM/71HOtnvF7y2e7mqDO5rrC23I88Rw89YE6eWW36bHx7u/MDR
         GDac38L+YUUNT1ZiXSCIN5kGIn+/RXZHMtni1I8gOvHGV4pInYkLLQoqTzG/kVFtV8xt
         EH3A==
X-Forwarded-Encrypted: i=1; AJvYcCVAR6uTFQw8RRqTDwaymJIxFPne8YSwGX/4Vl2UPDRNsPxwk+J6gaeFRQaHe7F2z8vdoKpuwVXZKPQWUVhM6Xsj@lists.infradead.org
X-Gm-Message-State: AOJu0YyvDPkVt82+DZcxq0xHZGtbFDljWvP83fNey74oubzsOaKZ1vRc
	xnCmL5QMbT8zTzocwObsfMxZvPTqtzoQ5xTo7+fh7sxOAgpv+1ujrxqF5LscQb+g0dnzgE73GoO
	BFGoz3LQXLP5QxF+igQZ6pN2wv7uddZe/Fd52g+Y9TPI1b8SFyqeC5MV5my76k0mo8Ri//Q99Lu
	PJPWlK
X-Gm-Gg: ASbGncv5NEdEm/RvuU24Nj18NPOe6zbp5s5aGCJg6WkMzTjb1RJIiXoz7cmrr01fDSe
	bn6wHqGkAFrP/MV9+by8/vm6vDo9sKxSrvwsicSYXrm0m9I8KLwGRCe8wBpSVwuasWQoYBC8l2l
	Jju6/3pfMilw1WZ7b+GERmTPzxzV3D1hYx3Z05jUbbq9Vg4a+j7d1EyDySrbqVqJvyFBv90aKWS
	j9DAzHblDttm+2YXRdTdz0j0oxc1AzV8Lv0L2wm40L1OLi6ldw72aCEL55vU9g2MZg+9XANePP9
	9H3pFQvTuERe1eFocgc=
X-Received: by 2002:a05:6000:4285:b0:3a3:447c:c341 with SMTP id ffacd0b85a97d-3a3496c20bbmr3094558f8f.27.1747230412074;
        Wed, 14 May 2025 06:46:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH78JQgYCZi7PAI6RbgXsNStikuLBd+X8aPd5vCyBuwPC57MACif1PRt1AJ3M7lUf2aeHKigg==
X-Received: by 2002:a05:6000:4285:b0:3a3:447c:c341 with SMTP id ffacd0b85a97d-3a3496c20bbmr3094514f8f.27.1747230411506;
        Wed, 14 May 2025 06:46:51 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.148.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2a07sm20175282f8f.50.2025.05.14.06.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:46:50 -0700 (PDT)
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
Subject: [PATCH v5 2/4] tpm: support devices with synchronous send()
Date: Wed, 14 May 2025 15:46:28 +0200
Message-ID: <20250514134630.137621-3-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514134630.137621-1-sgarzare@redhat.com>
References: <20250514134630.137621-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qx54N4k3m239oa80MPP6wbqODKzzRtPBsgIgqDQb4ho_1747230412
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_064655_797748_DF8E9195 
X-CRM114-Status: GOOD (  18.24  )
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
index 10917087b70e..33f2aa1a75ea 100644
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
index 816b7c690bc9..512882ac0db1 100644
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


