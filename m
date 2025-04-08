Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DF0C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 08:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDE/YZIPCEEz/h330X/plomZy4BudCgqspAc85dgVok=; b=WKcWKVACYHUvWoPHud9TXmQ4Eu
	b+cHftxQhOMTPy9DR9R0kHMDhtQ8zk6f8ZLvLVYi7pKffgTZPFxkQ1bStlQlsijg9yC2GOPcAFXsn
	tPNStYuvrZVlfRXFThx111aZmMj+LirTAJAYpDHlPfDYWYBbz622ZIt1hZc4Dl8uH5iV2aBf8iuK5
	/JDWhbMrZdmJeRmaP4R9zEq/AihiSb5B4jd9CnkWiz9pXRy9wZglsecHDVl6QTmyYjPRWusKMDwMv
	uq7mmxiVQIwJ4EUILsWlFVmWTYHOx3DVyCHs4hAewsVTPSx5C9gVeSLU3c8Osyea4ShYeE/+1F7rx
	ZGR4kKhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24UO-00000003HTV-3aoy;
	Tue, 08 Apr 2025 08:39:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24PC-00000003Gmd-2oV6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 08:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744101241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDE/YZIPCEEz/h330X/plomZy4BudCgqspAc85dgVok=;
	b=VxNjSs9YMoG7Nr7bqSJiGZBEDyIM5OAc64A724L3GY94uxOweTwLKf5Nsl80xL/ycG6IZz
	YULUywV93hxw2GuLruRFCUbkiVMZNYIglJT5EI0Za305AFfFTG8defM6k4+eMa5Bqs0Mzz
	3p5el/uLw2VEiqZ0rKyLgzyvBLbgHcU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-ihK-AgmON_ydGdHMEe5i1A-1; Tue, 08 Apr 2025 04:32:23 -0400
X-MC-Unique: ihK-AgmON_ydGdHMEe5i1A-1
X-Mimecast-MFC-AGG-ID: ihK-AgmON_ydGdHMEe5i1A_1744101142
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so29937325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 01:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101142; x=1744705942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDE/YZIPCEEz/h330X/plomZy4BudCgqspAc85dgVok=;
        b=f0NXNz2bK/xso/hWZuhrgCmIp20HDSC84t0PKdwNAHefaVfIJ3oaMOGAAlkNoaWomY
         os+VS/fMfajGxIc1aXVKn7HLnrRzmQCDep9goTWkZke8S4TGruds5cF3IjE/1+9QJ+la
         E0m4jQvU6A3banEM15eTsSOfE/kQpbEw7rm/B4uokglodyQWU1PbrqhxJQ8hV0L2j/yn
         qmEM/k9u9MQmaUq3VD5hXLZatEz0lLbb0ONifUK3U/xOOVfOQY7ua+xwzqGmvKn8ighJ
         5XqcMM/LiWPgLJDDbKTw0s8yh0QGoiRsMxMZbjaLwJqhyBybmK/Ccb229Xps54KgCZd5
         UAzg==
X-Forwarded-Encrypted: i=1; AJvYcCUbK9CzJMluaO4+SGVS2HY81KwUqK7LE61C3BkKKxxYnhxrp/HUC3nroQo6vxqVtZ0OfPS17kxG1Ju+jbx4jHfV@lists.infradead.org
X-Gm-Message-State: AOJu0YyCgTl6Iqp2/uUThlguqx1A1WryE4Cl4UR1YfQGiTha2LdPyWwj
	HZOeGUNDOpi/MXcMTW0zn/WRUR3cpADTF9uUom68Ig2mZoDN5H4XP9R7lDYjwerasMj9n/FlJSY
	nuZOWcd7wcw6XVHthhWk6385dq3yQGZ4OqRqfxJ4230hNLPjybVoVm5qAvex+yfqTFB5NzI9V
X-Gm-Gg: ASbGncs5ugoct0644v9L3pVrPJEpEw5rY5udI+LV/WTOFYT5IuJDKKUuaDctWhfIvqa
	bsNkzsZ/RdYM3HqhXPMHt4tcXY2HoXH1eKzH/qoe0vHYCsQso84cAfOE2zeSCbMVRCJ1YrEfe/1
	z4RMRU58HZ7x5+ybaL2NbwVoqhmbjsccqEZpHW2tFYBWnwknq/ndBNKDlHDYLAD7bpegjQZ2nxR
	HKl594r8MVxtIkh9kzFFFQgBLVJWByzdwVRvPoQEdd9CuQHDaT8ew6FA4sY7lnqDFJRDVqWmaop
	ZulWdfYJn+xep1/uLDTmOn7ApEStSBEJPHh498zGeVXxUPK78ohv36G+rOVXiU3iwA==
X-Received: by 2002:a05:600c:1e13:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-43ecf8d0b48mr141342875e9.19.1744101141993;
        Tue, 08 Apr 2025 01:32:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQhp1MgrEqOjc+4MW66KZXrp62NtlwXCuZ1w3QWz8IsRQIARyOk/4wlryzdly6gRSlx08ezQ==
X-Received: by 2002:a05:600c:1e13:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-43ecf8d0b48mr141342355e9.19.1744101141383;
        Tue, 08 Apr 2025 01:32:21 -0700 (PDT)
Received: from stex1.redhat.com (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3009680dsm14051923f8f.7.2025.04.08.01.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:32:20 -0700 (PDT)
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
Subject: [PATCH v2 2/4] tpm: support devices with synchronous send()
Date: Tue,  8 Apr 2025 10:32:06 +0200
Message-ID: <20250408083208.43512-3-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408083208.43512-1-sgarzare@redhat.com>
References: <20250408083208.43512-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JMNa-fj3pzTPsbsA0TMFmN6ic9MSUsC1cuiKyLpoNLI_1744101142
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_013402_780180_E0A129F6 
X-CRM114-Status: GOOD (  18.07  )
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
 include/linux/tpm.h              |  1 +
 drivers/char/tpm/tpm-interface.c | 18 +++++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

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
index 3b6ddcdb4051..9fbe84b5a131 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -114,8 +114,17 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 		return rc;
 	}
 
-	/* A sanity check. send() should just return zero on success e.g.
-	 * not the command length.
+	/* Synchronous devices return the response directly during the send()
+	 * call in the same buffer.
+	 */
+	if (chip->flags & TPM_CHIP_FLAG_SYNC) {
+		len = rc;
+		rc = 0;
+		goto out_send_sync;
+	}
+
+	/* A sanity check. send() of asynchronous devices should just return
+	 * zero on success e.g. not the command length.
 	 */
 	if (rc > 0) {
 		dev_warn(&chip->dev,
@@ -151,7 +160,10 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 	if (len < 0) {
 		rc = len;
 		dev_err(&chip->dev, "tpm_transmit: tpm_recv: error %d\n", rc);
-	} else if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
+		return rc;
+	}
+out_send_sync:
+	if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
 		rc = -EFAULT;
 
 	return rc ? rc : len;
-- 
2.49.0


