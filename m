Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CC5C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Mlcy7RuTjVsp9IPk7gmpzYSIxCmAnjblWVcEv6ccJY=; b=PoYKPDPIoHNVeR14ZqdyxGzEYH
	Xg5v2zNgqKLKEhkUx3mlS929qGBiEPVdjTuwCeGcZtchldmOQxCobAQVFFS8WVZL3ju2kIDLpDXA2
	G1278txU+9dqjHHOx2/irhts7vL+Tf8QoTIpNiMVlMUdGRa/JUZiEAewg5iEQD8z/gcoDH0IGJfTR
	0l6YnyIc59/a5PsPhFVxvi4gMcVRxIDiP2ASsSQmCAQcET+5l9KE75TjtfapAc8v88C4uUd89aOF7
	Ig5zU1CIiU/pWlKKgQb3JKsgfRsBhu2LAGC+aNyUpO8R/KI1fC834986vmnDvjP61I/rKy3O36fjN
	YfUG3amA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Sal-0000000DkxW-1YEf;
	Thu, 17 Apr 2025 16:59:59 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SUf-0000000Djfy-1Zu3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 16:53:42 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2c2504fa876so287208fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 09:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908821; x=1745513621; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Mlcy7RuTjVsp9IPk7gmpzYSIxCmAnjblWVcEv6ccJY=;
        b=T8kAWei0MUa7QXITjbU9lVQHnkEwRB0tPwWYyL8LwzZYbrSg6NgKIYWUt2oC+mxwNe
         w9zPOwZMWG2LzmdxNRSAeCZCMq9XrfY/1QFRcczjaBUjfLvGtdY8LEA6eZuQYGDnGO+i
         CH6SvDp3YFc2gWwVl8Otaj1crnnFEmed1hbaXN0VdtdQLF9+VBd0VZ6kQANdHetvgs/Y
         BodK4GkkAze534E+Bq6WQdQ3Jkx5azL23p1Ux494gnfQrAj95jr+09KM6g8oJrfcFAYP
         F/lnTW05lkbZ/1JW8YHKSxP/4t0L/6CrqQMTDWBQjqez8CQpugGTmnVl7Lo+FdBqOMv9
         OTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908821; x=1745513621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Mlcy7RuTjVsp9IPk7gmpzYSIxCmAnjblWVcEv6ccJY=;
        b=cWFI67FIWQ5ei7J9Lx6mE4qrNJQFdZ5vl1/gMMf7d+kUOD375SlY7JqqGN4KJWeEfj
         I83dDKxq3Du6Mh7YPO/XLPqin7xdUaHFJjmmgIcVkEKq/TQmVbYYYSA15QhzAhS6DFFF
         2PHintw+3jX/RZ1tXfc0vFPkXzrePY/SxcvT3e852Y7XgUGl2U24ZWhBpTEPvnirlf4t
         FWYTSwcPZloqxDBmhkRMBn6O+Clo42nafzL8cS+6+xSSMJE96DmvtNbu94vV8x9fV89E
         elUcXoEDIC6bfQ64tjo6ijj78/t5wQ98FYM0VQsfvjWfzfjq2oAN/rLyS7E1FO8QOir0
         ypAA==
X-Forwarded-Encrypted: i=1; AJvYcCUpFqI/uFY4P2XxgBVokqvwFpDM3uAFxBXx8VQQXn0bRu+gDNedzrtW8KGvf8s+BcRDbUKu2wpqFjIKiMDIK8mO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfs5kgT5qD8anXZvI5fZjzJHQ32eelqYKUmKT/mDX5a+JSsjsq
	pmWfgGoKPhY+BBvmp30NKG9/aZPTbg5gwxCbXQq34O6FQFoIiX+VllAaDEkXm58=
X-Gm-Gg: ASbGncuIguqdnb+2smmgIOZbL37PvKZOZ54KP38ElLQ3qOHBxKG5I0AWuuIaCm/n5oD
	I+PDNO8m4QM9scCOq/TWqFWU8CyPkPX4wC+3tLaRopm8PnnAP5wt0RtNrjo3U7SWE7ZNgL4Quj3
	g1mdvcDPYH9s+0Yndo0AIbyE1s3gylpQ5X1D3NE4OmOomtYY/RNy8tmEnrrG+GG8agBRd9h4RAx
	naeEqEGlFIrhiCHBThSE2c17Ix6vHIOD5mDbLgMES+k+FM5I6z17rfF19zSUWPmC2KhNJvKTqBD
	qz+zdwE4PK1TJ7QQpsonInsA3JjlmvqdT48S9iQlaX2JyBA=
X-Google-Smtp-Source: AGHT+IErXXlq9KuInn3X1DPupkiObTPpeE0ueF1La6/hhWfHWV2I+w4DlDOGXdfxGLmNEFpgSLM4Bw==
X-Received: by 2002:a05:6870:230e:b0:2bd:456c:92a with SMTP id 586e51a60fabf-2d4d2aa1540mr4331539fac.10.1744908820696;
        Thu, 17 Apr 2025 09:53:40 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:39 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:35 -0500
Subject: [PATCH 3/8] iio: addac: ad74413r: use aligned_s64 for timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-3-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomasz Duszynski <tduszyns@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=MCoZT25X+adzcafRFG4aXXsW2m7rdL+DKEbLmBiVtso=;
 b=kA0DAAoBwswgAf8Bj8AByyZiAGgBMeaiYXaZnaltaqKxrBfvibKRF2Q2tMZ2i51a85HCji5pc
 okBMwQAAQoAHRYhBOwY2Z5iDoPWnNhomMLMIAH/AY/ABQJoATHmAAoJEMLMIAH/AY/AAGEH/A7d
 yhRTzK61gaVftoV7cazJRl2ySH0qG6zH3EJWeARByL5cbptKOdlsuZo6d7dZBRrZJ4C8ev3rdUJ
 XhVeTDsfkPJ45+tsomWPkqCLOzQPKAU8JhuMXYWFGbviMcDJ+rrK2aPgMeKN8SxeHBRAa/pGmu7
 sqQ3y01Yn+QJpQLze9bqW7Kro6CN6cfC+WsHUhmd7Kwu2JsZ/4++9+AdY6zYE7SKwBPkHGrai98
 KgNtgetjJZDDS8Ly3nsQIbzVqGVSFp7+cKTzCAd8qq5qbgaI3qiltP4wNPKERvyQvIC1vXCB64X
 /fpWqHAAG+swe9n4QTO5IL33IsWflX2inevS41I=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_095341_423370_28A202A0 
X-CRM114-Status: GOOD (  12.59  )
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

Follow the pattern of other drivers and use aligned_s64 for the
timestamp. Technically there was no issue here since
AD74413R_FRAME_SIZE * AD74413R_CHANNEL_MAX == 16 and IIO_DMA_MINALIGN
is always a multiple of 8. But best to conform in case someone copies
this to new code and then tweaks something.

Also move the unaligned.h header while touching this since it was the
only one not in alphabetical order.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/addac/ad74413r.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/addac/ad74413r.c b/drivers/iio/addac/ad74413r.c
index f0929616ab899cb374f00869787321eed4ccde16..a0bb1dbcb7ad9d02337d0990e5a3f90be7eaa4ac 100644
--- a/drivers/iio/addac/ad74413r.c
+++ b/drivers/iio/addac/ad74413r.c
@@ -4,7 +4,6 @@
  * Author: Cosmin Tanislav <cosmin.tanislav@analog.com>
  */
 
-#include <linux/unaligned.h>
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/crc8.h>
@@ -24,6 +23,8 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
 
 #include <dt-bindings/iio/addac/adi,ad74413r.h>
 
@@ -84,7 +85,7 @@ struct ad74413r_state {
 	 */
 	struct {
 		u8 rx_buf[AD74413R_FRAME_SIZE * AD74413R_CHANNEL_MAX];
-		s64 timestamp;
+		aligned_s64 timestamp;
 	} adc_samples_buf __aligned(IIO_DMA_MINALIGN);
 
 	u8	adc_samples_tx_buf[AD74413R_FRAME_SIZE * AD74413R_CHANNEL_MAX];

-- 
2.43.0


