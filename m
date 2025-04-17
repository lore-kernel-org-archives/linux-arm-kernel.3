Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F08C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9S/SvzijUhAxaY2WkAr6cvZfGG4Ius95xkJsmSTFocc=; b=45aOHU+76xG+lWEwlNZZvTaD4c
	SpaL9arGNMAh270I58x19wKhs+C/zA+YDQqaNLbLMKTyW+ZYlg49ifH2j6C4T6mt10IjUNmZ0Qyqm
	obbkMGTlqMYdWaGRGd1JVJq3HYFciSafoyPucxJYxE9qa8lD8hIFh2XW+lcMxDfaLB6ECBsYalij3
	Fzm98vGX8nj53fPH3YsfJOA1E4gwOtY/fPLtyYstmCbazvGoaxFhxG0ptsIOnmAtbp1iJTRMZBHAr
	VoRd0DUa4hYZzOy3mGGPeJEM3sgAny9vXz0a9VGO/phBV3evHuUEb+Xe+b+EBYr3IrqXqHGkGuSn7
	aPcn7cfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Sjv-0000000Dmdz-3tZK;
	Thu, 17 Apr 2025 17:09:27 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SUn-0000000Djjb-21kB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 16:53:50 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-605fc797a2cso215030eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 09:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908828; x=1745513628; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9S/SvzijUhAxaY2WkAr6cvZfGG4Ius95xkJsmSTFocc=;
        b=YvZKLZtYd0wst++hqRpHc0oHfSQoxqbrPvKlrDlRitkaDo/mYk1kCEWJ6kmmfO6src
         kHHVnzk67YDCWtCkLC5Rnc1xY7X6dzjTQOCMT0aBOFv4Wcg8FCuVhd3QrdK+DiSnVvQ2
         2UXM72ViqrN99JmbSCQ63QVF1hwzgCjlJcq0hWrKvyUnNhjiH1siZOhnVbJjItHPWrao
         T/8uILvoj7U+sB2jTfOBIGCF5ZAZeV3Oodd85XA1x2DII5U14fLaOnxofu9c020dQBbg
         VzCc0l9vexl5dFBsYplgdWRihyzWFMCGk1S8Jz/lXI2eeqwZGapISxcMZ8VgphdFbyhx
         WRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908828; x=1745513628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9S/SvzijUhAxaY2WkAr6cvZfGG4Ius95xkJsmSTFocc=;
        b=qKcutJEzNTI5f7EwcMYpQxMZV6dyOVnBZOL1eSyffLH5wRvZtZ3r8ReIs2G+Z0cf83
         xPZbxlOHeCsGDX6Q5apjlso6cvSe8L9aR3GkYn7fhWWmDkXUM4HTz/+DKiDHImdDoX4t
         WELrmGAQOo29/qc5vcWrWhhY+lsHsril7qlAezdl19VElyjRb/tnmZv2cubwTcLJoNzE
         olNIQxMG7IDyfm2amE1y1PICFJ8VAfoEXDohpd6eLitLWX1JXlZAJ55Offpt0hAtPT28
         NRAhv1644/672XPFYaDK3MvGtVt6f7cRwdbu5JqgzOUdkc2uIPjxeVVqXfjgCvqjMKxg
         1WZA==
X-Forwarded-Encrypted: i=1; AJvYcCVFoSeF+P+s4Ch8TrPUEL7mn5+BfE0SgrWQk17mCN8pKwRFXU2qBAdc8KCOC22ZgCGkpALMGxQqU8fVkzuMKpZQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxSyESTs9APMCBa083wRs208J4WtqvWcfsmjO7PUfzi0ZeDTrp1
	9u4rMuss0V+VyDxRBSL2qZXZq350hnQAZXfXL0z4qKWy/zEU160nk7tm0xdmmJs=
X-Gm-Gg: ASbGnctJ1Vr1LpDnmfnOKLIzXxdZ2gZ+IU61KUCH6ZqbSyEYmwpoMkrDTiuKZ59YtJ6
	daulC4/sb1+RhjhuXDC8Dnlso5KpEzRrN+3yc+cSfSXAuHZ989xLSKJnEXPiFyIqiV6eWm3ig84
	m/C5WbL+iFuGDk8FPJeHvO9yPBc47HDOBNtutmL5OXAA9rMOFOq8bj7qgZq/59cMtVCy8LB69wO
	wQhtq845QTp7CH3dJjuzSFiSy3wlRgVqQfWPFDfoWi0KH+g8/5M1TzVLoUnxsQQlpr28SzoHmlB
	57LxdGbnqK9Qfu5jHFcPFAmUdFC3K6lg4aSX3MrMQgL4cS8=
X-Google-Smtp-Source: AGHT+IF2cc6nvhloIatR296bKaZ80w5oIIi+XgsIxUdwxJ2bRiFa0lwjx2pRXiLn6TVPGEuHIrcesg==
X-Received: by 2002:a05:6871:aa10:b0:29e:24c7:2861 with SMTP id 586e51a60fabf-2d4d2aa5915mr3876098fac.13.1744908828514;
        Thu, 17 Apr 2025 09:53:48 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:39 -0500
Subject: [PATCH 7/8] iio: imu: inv_mpu6050: align buffer for timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-7-eafac1e22318@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=r2Lf6V871r0X8NFwArauQL/aP2ip9vu9Z8iRNi1+BAo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATIA+teM+VsDaed33qq9DGEWH0kyRosXw6BwA
 FFyhafZOMSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEyAAAKCRDCzCAB/wGP
 wKsAB/49x03HWwW8kibDISBd6Ld/CibPThaqCLxFDvm4mQF6Lwdkjzvmy0QtIyU0hwRJG2fl+Lh
 4pIf4SyMG/WlJYZzS2R6JHm1Dm/WhAw2FYk/K4XAmzvakOcJDp7frIcgxKMgIiS03ab0WkHktkP
 e4iQNzBwOC88d06nrgETtFhtQoZ8nyU6wPWQuq8RMQ+J96hkRf3QYNT6XnuN6j2nFuDNHysfKDR
 RwSoR6I5TUGwsJiiMEIpykJQUvwfGiQpFkxOdvDy51nDD4Izr18DudobB0FWvxwiIC086FaF5OJ
 6kkLPmFBHSgFMmXXVmHKRUa1AJ8QDjp/Iw3muuNM7vA3a9Pr
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_095349_550045_75FE0408 
X-CRM114-Status: GOOD (  10.74  )
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

Align the buffer used with iio_push_to_buffers_with_timestamp() to
ensure the s64 timestamp is aligned to 8 bytes.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c
index 3d3b27f28c9d1c94aba93678261ce0d63099e1dc..273196e647a2b5a4860e18cfa34a088c773540e4 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c
@@ -50,7 +50,7 @@ irqreturn_t inv_mpu6050_read_fifo(int irq, void *p)
 	u16 fifo_count;
 	u32 fifo_period;
 	s64 timestamp;
-	u8 data[INV_MPU6050_OUTPUT_DATA_SIZE];
+	u8 data[INV_MPU6050_OUTPUT_DATA_SIZE] __aligned(8);
 	size_t i, nb;
 
 	mutex_lock(&st->lock);

-- 
2.43.0


