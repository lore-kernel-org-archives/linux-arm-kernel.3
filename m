Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7E0C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 15:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKFz6eLJyqKb87mD6Fpb+y2pLdxHOWnaVFUS6QOxr3U=; b=aMVmYo/UsE7V+5SGUJAtuGFsYt
	r2JPhpg5JopT9KjhLdW5uuB0SHzcP6oxxL1nPIYYkOREYYVetPtNy4zWuTDZ/kpmNroo88feeMIcN
	ngcqEjV8nW8X7/0ASujE6LDAvE4TamPvhgXl81hscfW8r7xZSUVGP0DfSfZAzlRETXZh8v1QsDB2D
	Ur7eXg0Ca8qbCxE9+UECLHFEjtnbTJWqI6NYFbita9J2/Ov9ChF+fITDH9f2bNVGWYiM2q7LoJOll
	Htn2nsl9Ulh6CdIs66DZnqnvClt3Muy9CIzcdB7w5OecfzDe9/gUe1uHyegJL/Y1gSavhcvAYjK3d
	DH5w1XnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twjs2-00000003XRJ-1M8v;
	Mon, 24 Mar 2025 15:37:46 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twjod-00000003X7Q-17Xd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 15:34:16 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso6744934a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742830453; x=1743435253; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKFz6eLJyqKb87mD6Fpb+y2pLdxHOWnaVFUS6QOxr3U=;
        b=jckv3dNqFIq3dQaWy11t93oPUO9nK1lLQuiuiVmnoNZ/V+csd/DPEfiBl4ArbVrWHw
         qitb7RTA54WRhk0SQOWpbn5Xn94tsD1j0auya7GaJNnrTF9tpCOyW0ZLy4OGp1i1yl/9
         n7ujLNVEdUyTNS/K2oVSDNO3S9HPpFqSshrYoJCcjDuLAWtcwg2VwnqukdFmmuMZ1Ahi
         nq20L0HExhSysvF4oU/l27y7b3uYX0qXk6VPBrCt/RS0YLioDxR05khf2UaLWfO9iKoe
         v6Ua93twTQLeWfs9W2zJVtABklxqnhr8kZmw+vnFEKSaPWrPgKdbiWf1nZDt0OeV5X6x
         Ii6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742830453; x=1743435253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKFz6eLJyqKb87mD6Fpb+y2pLdxHOWnaVFUS6QOxr3U=;
        b=RyStoDpS0ixfl50+hHAvHu547xqfUbSWytjaICqsr6J5+Bum4NrQ2m1gdnwnzrjHBc
         4rs9y9FuNWGWLFUf2GUBJxXyBvQHzZ7Br/rzBTMqUKymiP3aGr1ZCYIBdCowcdzs9X0m
         ttJauhAfD4dSreQ6jBBjewlzkYDQzqYZEBNvAnn9OiuDQHazcqD7jpUJr93YNQdHodFc
         zVVMetc7BFgH6WFqLCV0YWD/TSbgpHEMa+xsmu6VfYD+++52IvitVDKa6T6aNlnGNJhp
         lOA7531LpNBsOYHzKxuZNxG8QRvcmgdSzAmSyKnB1GeqXU3OmVbTFAT5Rev0wUniKtXb
         YSlA==
X-Forwarded-Encrypted: i=1; AJvYcCUEvFaMp2TDNALcJR+md92RDYWPnouppgIE6VvGXecYfZ2u5O0PK096fdgMfvzmYH6H2oI5VL6Mc3z20x2Mx6c5@lists.infradead.org
X-Gm-Message-State: AOJu0YzdEgDV3Qq7D6n5h22jGG3OoexRZipUtfUb1zckC9H8iwPRDsG7
	yFcyk0KV1oQC4+3jjFhmQBCAY1qrsn/GmZGkcGuQyWjjdlm5gHFh2a33b771f+IKbhcpbgY9oM2
	lf9Q=
X-Gm-Gg: ASbGncsqfndRxgQdNs/8jsC/IIUnRghHeRGvXVcv28WVKJdLTWnEB8CL+kxzlR8ugBw
	kBNA1LnSwK7G22RVlKPbmTEIFf/pkKF0TMP4LHjNu/GkdblAr7jOpc1Uc4EuZE10uaVMkTwlIYK
	yvdb08QdLQalTQD6V8SwSCQ7XlpNl+STJ82zEcD12QZ8l5SbBnF1xDT0W+tngr3KD2h4wt3a5wY
	euHA11FeFc5M3fxFcesL0F36VwwP2DCFKB796tKF3k+i7TTjXcKgqbzEX2OSmSkibm2VzU1tr1G
	SX6onkEa2UyxbuvmLm7KAanRzs2r+1h9BxjG6mwAT77fQ3pUwBe+BZqDG72fepZ23WSYVPN6iUb
	M9LHSB0lGY4CVNyyieRqNhMMLXkQV
X-Google-Smtp-Source: AGHT+IErQhBX/WXUMuS2xd0b7MNJeantSHZ2LsehWbVB+frQPoLUYxwOawSJkU4fE0OO3vdYCY7DoQ==
X-Received: by 2002:a17:907:3e03:b0:ab7:d87f:665b with SMTP id a640c23a62f3a-ac3f25593b7mr1313444066b.48.1742830453430;
        Mon, 24 Mar 2025 08:34:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm690219466b.31.2025.03.24.08.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 08:34:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 24 Mar 2025 15:34:09 +0000
Subject: [PATCH v2 1/2] firmware: exynos-acpm: use ktime APIs for timeout
 detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250324-acpm-atomic-v2-1-7d87746e1765@linaro.org>
References: <20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org>
In-Reply-To: <20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_083415_304568_BFCA322B 
X-CRM114-Status: GOOD (  13.60  )
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

acpm_dequeue_by_polling() uses a loop counter and assumes that each
iteration of the loop takes 20us. It may take longer, though, because
usleep_range() may sleep a different amount.

Switch to using ktime_get() / ktime_before() to detect the timeout
condition more reliably.

This change also makes the code easier to follow and it allows us to
adjust the sleep without having to adjust the loop counter exit
condition. This will come in useful in a follow-up patch that changes
the delays.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* add missing ktime.h
* ktime_before() instead of !ktime_after() (Tudor)
---
 drivers/firmware/samsung/exynos-acpm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..542eaff03f9e39422a8c5345ca75e05c1710a9ee 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -15,6 +15,7 @@
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/ktime.h>
 #include <linux/mailbox/exynos-message.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
@@ -32,8 +33,7 @@
 
 #define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)
 
-/* The unit of counter is 20 us. 5000 * 20 = 100 ms */
-#define ACPM_POLL_TIMEOUT		5000
+#define ACPM_POLL_TIMEOUT_US		(100 * USEC_PER_MSEC)
 #define ACPM_TX_TIMEOUT_US		500000
 
 #define ACPM_GS101_INITDATA_BASE	0xa000
@@ -284,12 +284,13 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 				   const struct acpm_xfer *xfer)
 {
 	struct device *dev = achan->acpm->dev;
-	unsigned int cnt_20us = 0;
+	ktime_t timeout;
 	u32 seqnum;
 	int ret;
 
 	seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
 
+	timeout = ktime_add_us(ktime_get(), ACPM_POLL_TIMEOUT_US);
 	do {
 		ret = acpm_get_rx(achan, xfer);
 		if (ret)
@@ -300,11 +301,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 
 		/* Determined experimentally. */
 		usleep_range(20, 30);
-		cnt_20us++;
-	} while (cnt_20us < ACPM_POLL_TIMEOUT);
+	} while (ktime_before(ktime_get(), timeout));
 
-	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx, cnt_20us = %d.\n",
-		achan->id, seqnum, achan->bitmap_seqnum[0], cnt_20us);
+	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",
+		achan->id, seqnum, achan->bitmap_seqnum[0]);
 
 	return -ETIME;
 }

-- 
2.49.0.395.g12beb8f557-goog


